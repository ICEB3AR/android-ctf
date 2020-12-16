package com.badlogic.gdx.graphics.g3d.shaders;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.IntIntMap;

public abstract class BaseShader implements Shader {
    private final IntIntMap attributes = new IntIntMap();
    public Camera camera;
    private Attributes combinedAttributes = new Attributes();
    public RenderContext context;
    private Mesh currentMesh;
    private final IntArray globalUniforms = new IntArray();
    private final IntArray localUniforms = new IntArray();
    private int[] locations;
    public ShaderProgram program;
    private final Array<Setter> setters = new Array<>();
    private final IntArray tempArray = new IntArray();
    private final Array<String> uniforms = new Array<>();
    private final Array<Validator> validators = new Array<>();

    public static abstract class GlobalSetter implements Setter {
        @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
        public boolean isGlobal(BaseShader baseShader, int i) {
            return true;
        }
    }

    public static abstract class LocalSetter implements Setter {
        @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
        public boolean isGlobal(BaseShader baseShader, int i) {
            return false;
        }
    }

    public interface Setter {
        boolean isGlobal(BaseShader baseShader, int i);

        void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes);
    }

    public interface Validator {
        boolean validate(BaseShader baseShader, int i, Renderable renderable);
    }

    public static class Uniform implements Validator {
        public final String alias;
        public final long environmentMask;
        public final long materialMask;
        public final long overallMask;

        public Uniform(String str, long j, long j2, long j3) {
            this.alias = str;
            this.materialMask = j;
            this.environmentMask = j2;
            this.overallMask = j3;
        }

        public Uniform(String str, long j, long j2) {
            this(str, j, j2, 0);
        }

        public Uniform(String str, long j) {
            this(str, 0, 0, j);
        }

        public Uniform(String str) {
            this(str, 0, 0);
        }

        @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Validator
        public boolean validate(BaseShader baseShader, int i, Renderable renderable) {
            long j = 0;
            long mask = (renderable == null || renderable.material == null) ? 0 : renderable.material.getMask();
            if (!(renderable == null || renderable.environment == null)) {
                j = renderable.environment.getMask();
            }
            long j2 = this.materialMask;
            if ((mask & j2) == j2) {
                long j3 = this.environmentMask;
                if ((j & j3) == j3) {
                    long j4 = j | mask;
                    long j5 = this.overallMask;
                    if ((j4 & j5) == j5) {
                        return true;
                    }
                }
            }
            return false;
        }
    }

    public int register(String str, Validator validator, Setter setter) {
        if (this.locations == null) {
            int uniformID = getUniformID(str);
            if (uniformID >= 0) {
                this.validators.set(uniformID, validator);
                this.setters.set(uniformID, setter);
                return uniformID;
            }
            this.uniforms.add(str);
            this.validators.add(validator);
            this.setters.add(setter);
            return this.uniforms.size - 1;
        }
        throw new GdxRuntimeException("Cannot register an uniform after initialization");
    }

    public int register(String str, Validator validator) {
        return register(str, validator, null);
    }

    public int register(String str, Setter setter) {
        return register(str, null, setter);
    }

    public int register(String str) {
        return register(str, null, null);
    }

    public int register(Uniform uniform, Setter setter) {
        return register(uniform.alias, uniform, setter);
    }

    public int register(Uniform uniform) {
        return register(uniform, (Setter) null);
    }

    public int getUniformID(String str) {
        int i = this.uniforms.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.uniforms.get(i2).equals(str)) {
                return i2;
            }
        }
        return -1;
    }

    public String getUniformAlias(int i) {
        return this.uniforms.get(i);
    }

    public void init(ShaderProgram shaderProgram, Renderable renderable) {
        if (this.locations != null) {
            throw new GdxRuntimeException("Already initialized");
        } else if (shaderProgram.isCompiled()) {
            this.program = shaderProgram;
            int i = this.uniforms.size;
            this.locations = new int[i];
            for (int i2 = 0; i2 < i; i2++) {
                String str = this.uniforms.get(i2);
                Validator validator = this.validators.get(i2);
                Setter setter = this.setters.get(i2);
                if (validator == null || validator.validate(this, i2, renderable)) {
                    this.locations[i2] = shaderProgram.fetchUniformLocation(str, false);
                    if (this.locations[i2] >= 0 && setter != null) {
                        if (setter.isGlobal(this, i2)) {
                            this.globalUniforms.add(i2);
                        } else {
                            this.localUniforms.add(i2);
                        }
                    }
                } else {
                    this.locations[i2] = -1;
                }
                if (this.locations[i2] < 0) {
                    this.validators.set(i2, null);
                    this.setters.set(i2, null);
                }
            }
            if (renderable != null) {
                VertexAttributes vertexAttributes = renderable.meshPart.mesh.getVertexAttributes();
                int size = vertexAttributes.size();
                for (int i3 = 0; i3 < size; i3++) {
                    VertexAttribute vertexAttribute = vertexAttributes.get(i3);
                    int attributeLocation = shaderProgram.getAttributeLocation(vertexAttribute.alias);
                    if (attributeLocation >= 0) {
                        this.attributes.put(vertexAttribute.getKey(), attributeLocation);
                    }
                }
            }
        } else {
            throw new GdxRuntimeException(shaderProgram.getLog());
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public void begin(Camera camera2, RenderContext renderContext) {
        this.camera = camera2;
        this.context = renderContext;
        this.program.begin();
        this.currentMesh = null;
        for (int i = 0; i < this.globalUniforms.size; i++) {
            Array<Setter> array = this.setters;
            int i2 = this.globalUniforms.get(i);
            if (array.get(i2) != null) {
                this.setters.get(i2).set(this, i2, null, null);
            }
        }
    }

    private final int[] getAttributeLocations(VertexAttributes vertexAttributes) {
        this.tempArray.clear();
        int size = vertexAttributes.size();
        for (int i = 0; i < size; i++) {
            this.tempArray.add(this.attributes.get(vertexAttributes.get(i).getKey(), -1));
        }
        this.tempArray.shrink();
        return this.tempArray.items;
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public void render(Renderable renderable) {
        if (renderable.worldTransform.det3x3() != 0.0f) {
            this.combinedAttributes.clear();
            if (renderable.environment != null) {
                this.combinedAttributes.set(renderable.environment);
            }
            if (renderable.material != null) {
                this.combinedAttributes.set(renderable.material);
            }
            render(renderable, this.combinedAttributes);
        }
    }

    public void render(Renderable renderable, Attributes attributes2) {
        for (int i = 0; i < this.localUniforms.size; i++) {
            Array<Setter> array = this.setters;
            int i2 = this.localUniforms.get(i);
            if (array.get(i2) != null) {
                this.setters.get(i2).set(this, i2, renderable, attributes2);
            }
        }
        if (this.currentMesh != renderable.meshPart.mesh) {
            Mesh mesh = this.currentMesh;
            if (mesh != null) {
                mesh.unbind(this.program, this.tempArray.items);
            }
            this.currentMesh = renderable.meshPart.mesh;
            this.currentMesh.bind(this.program, getAttributeLocations(renderable.meshPart.mesh.getVertexAttributes()));
        }
        renderable.meshPart.render(this.program, false);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public void end() {
        Mesh mesh = this.currentMesh;
        if (mesh != null) {
            mesh.unbind(this.program, this.tempArray.items);
            this.currentMesh = null;
        }
        this.program.end();
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.program = null;
        this.uniforms.clear();
        this.validators.clear();
        this.setters.clear();
        this.localUniforms.clear();
        this.globalUniforms.clear();
        this.locations = null;
    }

    public final boolean has(int i) {
        if (i >= 0) {
            int[] iArr = this.locations;
            return i < iArr.length && iArr[i] >= 0;
        }
    }

    public final int loc(int i) {
        if (i >= 0) {
            int[] iArr = this.locations;
            if (i < iArr.length) {
                return iArr[i];
            }
        }
        return -1;
    }

    public final boolean set(int i, Matrix4 matrix4) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformMatrix(iArr[i], matrix4);
        return true;
    }

    public final boolean set(int i, Matrix3 matrix3) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformMatrix(iArr[i], matrix3);
        return true;
    }

    public final boolean set(int i, Vector3 vector3) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], vector3);
        return true;
    }

    public final boolean set(int i, Vector2 vector2) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], vector2);
        return true;
    }

    public final boolean set(int i, Color color) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], color);
        return true;
    }

    public final boolean set(int i, float f) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], f);
        return true;
    }

    public final boolean set(int i, float f, float f2) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], f, f2);
        return true;
    }

    public final boolean set(int i, float f, float f2, float f3) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], f, f2, f3);
        return true;
    }

    public final boolean set(int i, float f, float f2, float f3, float f4) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformf(iArr[i], f, f2, f3, f4);
        return true;
    }

    public final boolean set(int i, int i2) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], i2);
        return true;
    }

    public final boolean set(int i, int i2, int i3) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], i2, i3);
        return true;
    }

    public final boolean set(int i, int i2, int i3, int i4) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], i2, i3, i4);
        return true;
    }

    public final boolean set(int i, int i2, int i3, int i4, int i5) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], i2, i3, i4, i5);
        return true;
    }

    public final boolean set(int i, TextureDescriptor textureDescriptor) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], this.context.textureBinder.bind(textureDescriptor));
        return true;
    }

    public final boolean set(int i, GLTexture gLTexture) {
        int[] iArr = this.locations;
        if (iArr[i] < 0) {
            return false;
        }
        this.program.setUniformi(iArr[i], this.context.textureBinder.bind(gLTexture));
        return true;
    }
}
