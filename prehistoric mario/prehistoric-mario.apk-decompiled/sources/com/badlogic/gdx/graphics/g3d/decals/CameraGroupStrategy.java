package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.Pool;
import java.util.Comparator;

public class CameraGroupStrategy implements GroupStrategy, Disposable {
    private static final int GROUP_BLEND = 1;
    private static final int GROUP_OPAQUE = 0;
    Pool<Array<Decal>> arrayPool;
    Camera camera;
    private final Comparator<Decal> cameraSorter;
    ObjectMap<DecalMaterial, Array<Decal>> materialGroups;
    ShaderProgram shader;
    Array<Array<Decal>> usedArrays;

    public CameraGroupStrategy(final Camera camera2) {
        this(camera2, new Comparator<Decal>() {
            /* class com.badlogic.gdx.graphics.g3d.decals.CameraGroupStrategy.AnonymousClass2 */

            public int compare(Decal decal, Decal decal2) {
                return (int) Math.signum(Camera.this.position.dst(decal2.position) - Camera.this.position.dst(decal.position));
            }
        });
    }

    public CameraGroupStrategy(Camera camera2, Comparator<Decal> comparator) {
        this.arrayPool = new Pool<Array<Decal>>(16) {
            /* class com.badlogic.gdx.graphics.g3d.decals.CameraGroupStrategy.AnonymousClass1 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Pool
            public Array<Decal> newObject() {
                return new Array<>();
            }
        };
        this.usedArrays = new Array<>();
        this.materialGroups = new ObjectMap<>();
        this.camera = camera2;
        this.cameraSorter = comparator;
        createDefaultShader();
    }

    public void setCamera(Camera camera2) {
        this.camera = camera2;
    }

    public Camera getCamera() {
        return this.camera;
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public int decideGroup(Decal decal) {
        return !decal.getMaterial().isOpaque();
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void beforeGroup(int i, Array<Decal> array) {
        if (i == 1) {
            Gdx.gl.glEnable(GL20.GL_BLEND);
            array.sort(this.cameraSorter);
            return;
        }
        int i2 = array.size;
        for (int i3 = 0; i3 < i2; i3++) {
            Decal decal = array.get(i3);
            Array<Decal> array2 = this.materialGroups.get(decal.material);
            if (array2 == null) {
                array2 = this.arrayPool.obtain();
                array2.clear();
                this.usedArrays.add(array2);
                this.materialGroups.put(decal.material, array2);
            }
            array2.add(decal);
        }
        array.clear();
        ObjectMap.Values<Array<Decal>> it = this.materialGroups.values().iterator();
        while (it.hasNext()) {
            array.addAll((Array) it.next());
        }
        this.materialGroups.clear();
        this.arrayPool.freeAll(this.usedArrays);
        this.usedArrays.clear();
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void afterGroup(int i) {
        if (i == 1) {
            Gdx.gl.glDisable(GL20.GL_BLEND);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void beforeGroups() {
        Gdx.gl.glEnable(GL20.GL_DEPTH_TEST);
        this.shader.begin();
        this.shader.setUniformMatrix("u_projectionViewMatrix", this.camera.combined);
        this.shader.setUniformi("u_texture", 0);
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void afterGroups() {
        this.shader.end();
        Gdx.gl.glDisable(GL20.GL_DEPTH_TEST);
    }

    private void createDefaultShader() {
        this.shader = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projectionViewMatrix;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projectionViewMatrix * a_position;\n}\n", "#ifdef GL_ES\nprecision mediump float;\n#endif\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}");
        if (!this.shader.isCompiled()) {
            throw new IllegalArgumentException("couldn't compile shader: " + this.shader.getLog());
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public ShaderProgram getGroupShader(int i) {
        return this.shader;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        ShaderProgram shaderProgram = this.shader;
        if (shaderProgram != null) {
            shaderProgram.dispose();
        }
    }
}
