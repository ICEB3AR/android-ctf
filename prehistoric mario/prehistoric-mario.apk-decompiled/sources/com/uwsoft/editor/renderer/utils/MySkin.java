package com.uwsoft.editor.renderer.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.NinePatchDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.SpriteDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TiledDrawable;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.SerializationException;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.Method;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import java.util.ArrayList;
import java.util.Iterator;

public class MySkin extends Skin {
    TextureAtlas atlas;
    public ArrayList<String> fontFiles = new ArrayList<>();
    ObjectMap<Class, ObjectMap<String, Object>> resources = new ObjectMap<>();

    public static class TintedDrawable {
        public Color color;
        public String name;
    }

    public MySkin() {
    }

    public MySkin(FileHandle fileHandle) {
        FileHandle sibling = fileHandle.sibling(fileHandle.nameWithoutExtension() + ".atlas");
        if (sibling.exists()) {
            this.atlas = new TextureAtlas(sibling);
            addRegions(this.atlas);
        }
        load(fileHandle);
    }

    public MySkin(FileHandle fileHandle, TextureAtlas textureAtlas) {
        this.atlas = textureAtlas;
        addRegions(textureAtlas);
        load(fileHandle);
    }

    public MySkin(TextureAtlas textureAtlas) {
        this.atlas = textureAtlas;
        addRegions(textureAtlas);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void load(FileHandle fileHandle) {
        try {
            getJsonLoader(fileHandle).fromJson(Skin.class, fileHandle);
        } catch (SerializationException e) {
            throw new SerializationException("Error reading file: " + fileHandle, e);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void addRegions(TextureAtlas textureAtlas) {
        Array<TextureAtlas.AtlasRegion> regions = textureAtlas.getRegions();
        int i = regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            TextureAtlas.AtlasRegion atlasRegion = regions.get(i2);
            add(atlasRegion.name, atlasRegion, TextureRegion.class);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void add(String str, Object obj) {
        add(str, obj, obj.getClass());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void add(String str, Object obj, Class cls) {
        if (str == null) {
            throw new IllegalArgumentException("name cannot be null.");
        } else if (obj != null) {
            ObjectMap<String, Object> objectMap = this.resources.get(cls);
            if (objectMap == null) {
                objectMap = new ObjectMap<>();
                this.resources.put(cls, objectMap);
            }
            objectMap.put(str, obj);
        } else {
            throw new IllegalArgumentException("resource cannot be null.");
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void remove(String str, Class cls) {
        if (str != null) {
            this.resources.get(cls).remove(str);
            return;
        }
        throw new IllegalArgumentException("name cannot be null.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public <T> T get(Class<T> cls) {
        return (T) get("default", cls);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public <T> T get(String str, Class<T> cls) {
        if (str == null) {
            throw new IllegalArgumentException("name cannot be null.");
        } else if (cls == null) {
            throw new IllegalArgumentException("type cannot be null.");
        } else if (cls == Drawable.class) {
            return (T) getDrawable(str);
        } else {
            if (cls == TextureRegion.class) {
                return (T) getRegion(str);
            }
            if (cls == NinePatch.class) {
                return (T) getPatch(str);
            }
            if (cls == Sprite.class) {
                return (T) getSprite(str);
            }
            ObjectMap<String, Object> objectMap = this.resources.get(cls);
            if (objectMap != null) {
                T t = (T) objectMap.get(str);
                if (t != null) {
                    return t;
                }
                throw new GdxRuntimeException("No " + cls.getName() + " registered with name: " + str);
            }
            throw new GdxRuntimeException("No " + cls.getName() + " registered with name: " + str);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public <T> T optional(String str, Class<T> cls) {
        if (str == null) {
            throw new IllegalArgumentException("name cannot be null.");
        } else if (cls != null) {
            ObjectMap<String, Object> objectMap = this.resources.get(cls);
            if (objectMap == null) {
                return null;
            }
            return (T) objectMap.get(str);
        } else {
            throw new IllegalArgumentException("type cannot be null.");
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public boolean has(String str, Class cls) {
        ObjectMap<String, Object> objectMap = this.resources.get(cls);
        if (objectMap == null) {
            return false;
        }
        return objectMap.containsKey(str);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public <T> ObjectMap<String, T> getAll(Class<T> cls) {
        return (ObjectMap<String, T>) this.resources.get(cls);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Color getColor(String str) {
        return (Color) get(str, Color.class);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public BitmapFont getFont(String str) {
        return (BitmapFont) get(str, BitmapFont.class);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public TextureRegion getRegion(String str) {
        TextureRegion textureRegion = (TextureRegion) optional(str, TextureRegion.class);
        if (textureRegion != null) {
            return textureRegion;
        }
        Texture texture = (Texture) optional(str, Texture.class);
        if (texture != null) {
            TextureRegion textureRegion2 = new TextureRegion(texture);
            add(str, textureRegion2, TextureRegion.class);
            return textureRegion2;
        }
        throw new GdxRuntimeException("No TextureRegion or Texture registered with name: " + str);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public TiledDrawable getTiledDrawable(String str) {
        TiledDrawable tiledDrawable = (TiledDrawable) optional(str, TiledDrawable.class);
        if (tiledDrawable != null) {
            return tiledDrawable;
        }
        Drawable drawable = (Drawable) optional(str, Drawable.class);
        if (drawable == null) {
            TiledDrawable tiledDrawable2 = new TiledDrawable(getRegion(str));
            add(str, tiledDrawable2, TiledDrawable.class);
            return tiledDrawable2;
        } else if (drawable instanceof TiledDrawable) {
            return (TiledDrawable) drawable;
        } else {
            throw new GdxRuntimeException("Drawable found but is not a TiledDrawable: " + str + ", " + drawable.getClass().getName());
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public NinePatch getPatch(String str) {
        int[] iArr;
        NinePatch ninePatch = (NinePatch) optional(str, NinePatch.class);
        if (ninePatch != null) {
            return ninePatch;
        }
        try {
            TextureRegion region = getRegion(str);
            if ((region instanceof TextureAtlas.AtlasRegion) && (iArr = ((TextureAtlas.AtlasRegion) region).splits) != null) {
                ninePatch = new NinePatch(region, iArr[0], iArr[1], iArr[2], iArr[3]);
                int[] iArr2 = ((TextureAtlas.AtlasRegion) region).pads;
                if (iArr2 != null) {
                    ninePatch.setPadding(iArr2[0], iArr2[1], iArr2[2], iArr2[3]);
                }
            }
            if (ninePatch == null) {
                ninePatch = new NinePatch(region);
            }
            add(str, ninePatch, NinePatch.class);
            return ninePatch;
        } catch (GdxRuntimeException unused) {
            throw new GdxRuntimeException("No NinePatch, TextureRegion, or Texture registered with name: " + str);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Sprite getSprite(String str) {
        Sprite sprite = (Sprite) optional(str, Sprite.class);
        if (sprite != null) {
            return sprite;
        }
        try {
            TextureRegion region = getRegion(str);
            if (region instanceof TextureAtlas.AtlasRegion) {
                TextureAtlas.AtlasRegion atlasRegion = (TextureAtlas.AtlasRegion) region;
                if (!(!atlasRegion.rotate && atlasRegion.packedWidth == atlasRegion.originalWidth && atlasRegion.packedHeight == atlasRegion.originalHeight)) {
                    sprite = new TextureAtlas.AtlasSprite(atlasRegion);
                }
            }
            if (sprite == null) {
                sprite = new Sprite(region);
            }
            add(str, sprite, NinePatch.class);
            return sprite;
        } catch (GdxRuntimeException unused) {
            throw new GdxRuntimeException("No NinePatch, TextureRegion, or Texture registered with name: " + str);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable getDrawable(String str) {
        Drawable drawable;
        Drawable spriteDrawable;
        Drawable drawable2 = (Drawable) optional(str, Drawable.class);
        if (drawable2 != null) {
            return drawable2;
        }
        Drawable drawable3 = (Drawable) optional(str, TiledDrawable.class);
        if (drawable3 != null) {
            return drawable3;
        }
        try {
            TextureRegion region = getRegion(str);
            if (region instanceof TextureAtlas.AtlasRegion) {
                TextureAtlas.AtlasRegion atlasRegion = (TextureAtlas.AtlasRegion) region;
                if (atlasRegion.splits != null) {
                    spriteDrawable = new NinePatchDrawable(getPatch(str));
                } else if (!(!atlasRegion.rotate && atlasRegion.packedWidth == atlasRegion.originalWidth && atlasRegion.packedHeight == atlasRegion.originalHeight)) {
                    spriteDrawable = new SpriteDrawable(getSprite(str));
                }
                drawable3 = spriteDrawable;
            }
            if (drawable3 == null) {
                drawable3 = new TextureRegionDrawable(region);
            }
        } catch (GdxRuntimeException unused) {
        }
        if (drawable3 == null) {
            NinePatch ninePatch = (NinePatch) optional(str, NinePatch.class);
            if (ninePatch != null) {
                drawable = new NinePatchDrawable(ninePatch);
            } else {
                Sprite sprite = (Sprite) optional(str, Sprite.class);
                if (sprite != null) {
                    drawable = new SpriteDrawable(sprite);
                } else {
                    throw new GdxRuntimeException("No Drawable, NinePatch, TextureRegion, Texture, or Sprite registered with name: " + str);
                }
            }
        } else {
            drawable = drawable3;
        }
        add(str, drawable, Drawable.class);
        return drawable;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public String find(Object obj) {
        if (obj != null) {
            ObjectMap<String, Object> objectMap = this.resources.get(obj.getClass());
            if (objectMap == null) {
                return null;
            }
            return objectMap.findKey(obj, true);
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(String str) {
        return newDrawable(getDrawable(str));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(String str, float f, float f2, float f3, float f4) {
        return newDrawable(getDrawable(str), new Color(f, f2, f3, f4));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(String str, Color color) {
        return newDrawable(getDrawable(str), color);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(Drawable drawable) {
        if (drawable instanceof TextureRegionDrawable) {
            return new TextureRegionDrawable((TextureRegionDrawable) drawable);
        }
        if (drawable instanceof NinePatchDrawable) {
            return new NinePatchDrawable((NinePatchDrawable) drawable);
        }
        if (drawable instanceof SpriteDrawable) {
            return new SpriteDrawable((SpriteDrawable) drawable);
        }
        throw new GdxRuntimeException("Unable to copy, unknown drawable type: " + drawable.getClass());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(Drawable drawable, float f, float f2, float f3, float f4) {
        return newDrawable(drawable, new Color(f, f2, f3, f4));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Drawable newDrawable(Drawable drawable, Color color) {
        Sprite sprite;
        Sprite sprite2;
        if (drawable instanceof TextureRegionDrawable) {
            TextureRegion region = ((TextureRegionDrawable) drawable).getRegion();
            if (region instanceof TextureAtlas.AtlasRegion) {
                sprite2 = new TextureAtlas.AtlasSprite((TextureAtlas.AtlasRegion) region);
            } else {
                sprite2 = new Sprite(region);
            }
            sprite2.setColor(color);
            return new SpriteDrawable(sprite2);
        } else if (drawable instanceof NinePatchDrawable) {
            NinePatchDrawable ninePatchDrawable = new NinePatchDrawable((NinePatchDrawable) drawable);
            ninePatchDrawable.setPatch(new NinePatch(ninePatchDrawable.getPatch(), color));
            return ninePatchDrawable;
        } else if (drawable instanceof SpriteDrawable) {
            SpriteDrawable spriteDrawable = new SpriteDrawable((SpriteDrawable) drawable);
            Sprite sprite3 = spriteDrawable.getSprite();
            if (sprite3 instanceof TextureAtlas.AtlasSprite) {
                sprite = new TextureAtlas.AtlasSprite((TextureAtlas.AtlasSprite) sprite3);
            } else {
                sprite = new Sprite(sprite3);
            }
            sprite.setColor(color);
            spriteDrawable.setSprite(sprite);
            return spriteDrawable;
        } else {
            throw new GdxRuntimeException("Unable to copy, unknown drawable type: " + drawable.getClass());
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void setEnabled(Actor actor, boolean z) {
        Method findMethod = findMethod(actor.getClass(), "getStyle");
        if (findMethod != null) {
            try {
                Object invoke = findMethod.invoke(actor, new Object[0]);
                String find = find(invoke);
                if (find != null) {
                    StringBuilder sb = new StringBuilder();
                    String str = BuildConfig.FLAVOR;
                    sb.append(find.replace("-disabled", str));
                    if (!z) {
                        str = "-disabled";
                    }
                    sb.append(str);
                    Object obj = get(sb.toString(), invoke.getClass());
                    Method findMethod2 = findMethod(actor.getClass(), "setStyle");
                    if (findMethod2 != null) {
                        findMethod2.invoke(actor, obj);
                    }
                }
            } catch (Exception unused) {
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public TextureAtlas getAtlas() {
        return this.atlas;
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.scenes.scene2d.ui.Skin
    public void dispose() {
        TextureAtlas textureAtlas = this.atlas;
        if (textureAtlas != null) {
            textureAtlas.dispose();
        }
        Iterator it = this.resources.values().iterator();
        while (it.hasNext()) {
            Iterator it2 = ((ObjectMap) it.next()).values().iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (next instanceof Disposable) {
                    ((Disposable) next).dispose();
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.Skin
    public Json getJsonLoader(final FileHandle fileHandle) {
        AnonymousClass1 r0 = new Json() {
            /* class com.uwsoft.editor.renderer.utils.MySkin.AnonymousClass1 */

            @Override // com.badlogic.gdx.utils.Json
            public <T> T readValue(Class<T> cls, Class cls2, JsonValue jsonValue) {
                return (!jsonValue.isString() || ClassReflection.isAssignableFrom(CharSequence.class, cls)) ? (T) super.readValue(cls, cls2, jsonValue) : (T) MySkin.this.get(jsonValue.asString(), cls);
            }
        };
        r0.setTypeName(null);
        r0.setUsePrototypes(false);
        r0.setSerializer(Skin.class, new Json.ReadOnlySerializer<Skin>() {
            /* class com.uwsoft.editor.renderer.utils.MySkin.AnonymousClass2 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Skin read(Json json, JsonValue jsonValue, Class cls) {
                for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                    try {
                        readNamedObjects(json, ClassReflection.forName(jsonValue2.name()), jsonValue2);
                    } catch (ReflectionException e) {
                        throw new SerializationException(e);
                    }
                }
                return this;
            }

            private void readNamedObjects(Json json, Class cls, JsonValue jsonValue) {
                Class cls2 = cls == TintedDrawable.class ? Drawable.class : cls;
                for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                    Object readValue = json.readValue(cls, jsonValue2);
                    if (readValue != null) {
                        try {
                            MySkin.this.add(jsonValue2.name(), readValue, cls2);
                        } catch (Exception e) {
                            throw new SerializationException("Error reading " + ClassReflection.getSimpleName(cls) + ": " + jsonValue2.name(), e);
                        }
                    }
                }
            }
        });
        r0.setSerializer(BitmapFont.class, new Json.ReadOnlySerializer<BitmapFont>() {
            /* class com.uwsoft.editor.renderer.utils.MySkin.AnonymousClass3 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public BitmapFont read(Json json, JsonValue jsonValue, Class cls) {
                BitmapFont bitmapFont;
                String str = (String) json.readValue("file", String.class, jsonValue);
                int intValue = ((Integer) json.readValue("scaledSize", Integer.TYPE, (Object) -1, jsonValue)).intValue();
                Boolean bool = (Boolean) json.readValue("flip", Boolean.class, (Object) false, jsonValue);
                FileHandle child = fileHandle.parent().child(str);
                if (!child.exists()) {
                    child = Gdx.files.internal(str);
                }
                if (child.exists()) {
                    String nameWithoutExtension = child.nameWithoutExtension();
                    MySkin.this.fontFiles.add(nameWithoutExtension);
                    try {
                        TextureRegion textureRegion = (TextureRegion) this.optional(nameWithoutExtension, TextureRegion.class);
                        if (textureRegion != null) {
                            bitmapFont = new BitmapFont(child, textureRegion, bool.booleanValue());
                        } else {
                            FileHandle parent = child.parent();
                            FileHandle child2 = parent.child(nameWithoutExtension + ".png");
                            if (child2.exists()) {
                                Texture texture = new Texture(child2, true);
                                texture.setFilter(Texture.TextureFilter.MipMapLinearNearest, Texture.TextureFilter.Linear);
                                bitmapFont = new BitmapFont(child, new TextureRegion(texture), bool.booleanValue());
                            } else {
                                bitmapFont = new BitmapFont(child, bool.booleanValue());
                            }
                        }
                        if (intValue != -1) {
                            bitmapFont.getData().setScale(((float) intValue) / bitmapFont.getCapHeight());
                        }
                        return bitmapFont;
                    } catch (RuntimeException e) {
                        throw new SerializationException("Error loading bitmap font: " + child, e);
                    }
                } else {
                    throw new SerializationException("Font file not found: " + child);
                }
            }
        });
        r0.setSerializer(Color.class, new Json.ReadOnlySerializer<Color>() {
            /* class com.uwsoft.editor.renderer.utils.MySkin.AnonymousClass4 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Color read(Json json, JsonValue jsonValue, Class cls) {
                if (jsonValue.isString()) {
                    return (Color) MySkin.this.get(jsonValue.asString(), Color.class);
                }
                String str = (String) json.readValue("hex", String.class, (Object) null, jsonValue);
                if (str != null) {
                    return Color.valueOf(str);
                }
                return new Color(((Float) json.readValue("r", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("g", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("b", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("a", Float.TYPE, Float.valueOf(1.0f), jsonValue)).floatValue());
            }
        });
        r0.setSerializer(TintedDrawable.class, new Json.ReadOnlySerializer() {
            /* class com.uwsoft.editor.renderer.utils.MySkin.AnonymousClass5 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Object read(Json json, JsonValue jsonValue, Class cls) {
                return MySkin.this.newDrawable((String) json.readValue("name", String.class, jsonValue), (Color) json.readValue("color", Color.class, jsonValue));
            }
        });
        return r0;
    }

    private static Method findMethod(Class cls, String str) {
        Method[] methods = ClassReflection.getMethods(cls);
        for (Method method : methods) {
            if (method.getName().equals(str)) {
                return method;
            }
        }
        return null;
    }
}
