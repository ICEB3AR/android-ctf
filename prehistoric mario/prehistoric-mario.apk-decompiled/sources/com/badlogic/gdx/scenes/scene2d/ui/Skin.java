package com.badlogic.gdx.scenes.scene2d.ui;

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
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.CheckBox;
import com.badlogic.gdx.scenes.scene2d.ui.ImageButton;
import com.badlogic.gdx.scenes.scene2d.ui.ImageTextButton;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.List;
import com.badlogic.gdx.scenes.scene2d.ui.ProgressBar;
import com.badlogic.gdx.scenes.scene2d.ui.ScrollPane;
import com.badlogic.gdx.scenes.scene2d.ui.SelectBox;
import com.badlogic.gdx.scenes.scene2d.ui.Slider;
import com.badlogic.gdx.scenes.scene2d.ui.SplitPane;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.badlogic.gdx.scenes.scene2d.ui.TextField;
import com.badlogic.gdx.scenes.scene2d.ui.TextTooltip;
import com.badlogic.gdx.scenes.scene2d.ui.Touchpad;
import com.badlogic.gdx.scenes.scene2d.ui.Tree;
import com.badlogic.gdx.scenes.scene2d.ui.Window;
import com.badlogic.gdx.scenes.scene2d.utils.BaseDrawable;
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

public class Skin implements Disposable {
    private static final Class[] defaultTagClasses = {BitmapFont.class, Color.class, TintedDrawable.class, NinePatchDrawable.class, SpriteDrawable.class, TextureRegionDrawable.class, TiledDrawable.class, Button.ButtonStyle.class, CheckBox.CheckBoxStyle.class, ImageButton.ImageButtonStyle.class, ImageTextButton.ImageTextButtonStyle.class, Label.LabelStyle.class, List.ListStyle.class, ProgressBar.ProgressBarStyle.class, ScrollPane.ScrollPaneStyle.class, SelectBox.SelectBoxStyle.class, Slider.SliderStyle.class, SplitPane.SplitPaneStyle.class, TextButton.TextButtonStyle.class, TextField.TextFieldStyle.class, TextTooltip.TextTooltipStyle.class, Touchpad.TouchpadStyle.class, Tree.TreeStyle.class, Window.WindowStyle.class};
    TextureAtlas atlas;
    private final ObjectMap<String, Class> jsonClassTags = new ObjectMap<>(defaultTagClasses.length);
    ObjectMap<Class, ObjectMap<String, Object>> resources = new ObjectMap<>();

    public static class TintedDrawable {
        public Color color;
        public String name;
    }

    public Skin() {
        Class[] clsArr = defaultTagClasses;
        for (Class cls : clsArr) {
            this.jsonClassTags.put(cls.getSimpleName(), cls);
        }
    }

    public Skin(FileHandle fileHandle) {
        Class[] clsArr = defaultTagClasses;
        for (Class cls : clsArr) {
            this.jsonClassTags.put(cls.getSimpleName(), cls);
        }
        FileHandle sibling = fileHandle.sibling(fileHandle.nameWithoutExtension() + ".atlas");
        if (sibling.exists()) {
            this.atlas = new TextureAtlas(sibling);
            addRegions(this.atlas);
        }
        load(fileHandle);
    }

    public Skin(FileHandle fileHandle, TextureAtlas textureAtlas) {
        Class[] clsArr = defaultTagClasses;
        for (Class cls : clsArr) {
            this.jsonClassTags.put(cls.getSimpleName(), cls);
        }
        this.atlas = textureAtlas;
        addRegions(textureAtlas);
        load(fileHandle);
    }

    public Skin(TextureAtlas textureAtlas) {
        Class[] clsArr = defaultTagClasses;
        for (Class cls : clsArr) {
            this.jsonClassTags.put(cls.getSimpleName(), cls);
        }
        this.atlas = textureAtlas;
        addRegions(textureAtlas);
    }

    public void load(FileHandle fileHandle) {
        try {
            getJsonLoader(fileHandle).fromJson(Skin.class, fileHandle);
        } catch (SerializationException e) {
            throw new SerializationException("Error reading file: " + fileHandle, e);
        }
    }

    public void addRegions(TextureAtlas textureAtlas) {
        Array<TextureAtlas.AtlasRegion> regions = textureAtlas.getRegions();
        int i = regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            TextureAtlas.AtlasRegion atlasRegion = regions.get(i2);
            String str = atlasRegion.name;
            if (atlasRegion.index != -1) {
                str = str + "_" + atlasRegion.index;
            }
            add(str, atlasRegion, TextureRegion.class);
        }
    }

    public void add(String str, Object obj) {
        add(str, obj, obj.getClass());
    }

    public void add(String str, Object obj, Class cls) {
        if (str == null) {
            throw new IllegalArgumentException("name cannot be null.");
        } else if (obj != null) {
            ObjectMap<String, Object> objectMap = this.resources.get(cls);
            if (objectMap == null) {
                objectMap = new ObjectMap<>((cls == TextureRegion.class || cls == Drawable.class || cls == Sprite.class) ? 256 : 64);
                this.resources.put(cls, objectMap);
            }
            objectMap.put(str, obj);
        } else {
            throw new IllegalArgumentException("resource cannot be null.");
        }
    }

    public void remove(String str, Class cls) {
        if (str != null) {
            this.resources.get(cls).remove(str);
            return;
        }
        throw new IllegalArgumentException("name cannot be null.");
    }

    public <T> T get(Class<T> cls) {
        return (T) get("default", cls);
    }

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

    public boolean has(String str, Class cls) {
        ObjectMap<String, Object> objectMap = this.resources.get(cls);
        if (objectMap == null) {
            return false;
        }
        return objectMap.containsKey(str);
    }

    public <T> ObjectMap<String, T> getAll(Class<T> cls) {
        return (ObjectMap<String, T>) this.resources.get(cls);
    }

    public Color getColor(String str) {
        return (Color) get(str, Color.class);
    }

    public BitmapFont getFont(String str) {
        return (BitmapFont) get(str, BitmapFont.class);
    }

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

    public Array<TextureRegion> getRegions(String str) {
        TextureRegion textureRegion = (TextureRegion) optional(str + "_" + 0, TextureRegion.class);
        if (textureRegion == null) {
            return null;
        }
        Array<TextureRegion> array = new Array<>();
        int i = 1;
        while (textureRegion != null) {
            array.add(textureRegion);
            textureRegion = (TextureRegion) optional(str + "_" + i, TextureRegion.class);
            i++;
        }
        return array;
    }

    public TiledDrawable getTiledDrawable(String str) {
        TiledDrawable tiledDrawable = (TiledDrawable) optional(str, TiledDrawable.class);
        if (tiledDrawable != null) {
            return tiledDrawable;
        }
        TiledDrawable tiledDrawable2 = new TiledDrawable(getRegion(str));
        tiledDrawable2.setName(str);
        add(str, tiledDrawable2, TiledDrawable.class);
        return tiledDrawable2;
    }

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
                    ninePatch.setPadding((float) iArr2[0], (float) iArr2[1], (float) iArr2[2], (float) iArr2[3]);
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
            add(str, sprite, Sprite.class);
            return sprite;
        } catch (GdxRuntimeException unused) {
            throw new GdxRuntimeException("No NinePatch, TextureRegion, or Texture registered with name: " + str);
        }
    }

    public Drawable getDrawable(String str) {
        Drawable drawable;
        Drawable spriteDrawable;
        Drawable drawable2 = (Drawable) optional(str, Drawable.class);
        if (drawable2 != null) {
            return drawable2;
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
                drawable2 = spriteDrawable;
            }
            if (drawable2 == null) {
                drawable2 = new TextureRegionDrawable(region);
            }
        } catch (GdxRuntimeException unused) {
        }
        if (drawable2 == null) {
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
            drawable = drawable2;
        }
        if (drawable instanceof BaseDrawable) {
            ((BaseDrawable) drawable).setName(str);
        }
        add(str, drawable, Drawable.class);
        return drawable;
    }

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

    public Drawable newDrawable(String str) {
        return newDrawable(getDrawable(str));
    }

    public Drawable newDrawable(String str, float f, float f2, float f3, float f4) {
        return newDrawable(getDrawable(str), new Color(f, f2, f3, f4));
    }

    public Drawable newDrawable(String str, Color color) {
        return newDrawable(getDrawable(str), color);
    }

    public Drawable newDrawable(Drawable drawable) {
        if (drawable instanceof TiledDrawable) {
            return new TiledDrawable((TiledDrawable) drawable);
        }
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

    public Drawable newDrawable(Drawable drawable, float f, float f2, float f3, float f4) {
        return newDrawable(drawable, new Color(f, f2, f3, f4));
    }

    public Drawable newDrawable(Drawable drawable, Color color) {
        Drawable drawable2;
        if (drawable instanceof TextureRegionDrawable) {
            drawable2 = ((TextureRegionDrawable) drawable).tint(color);
        } else if (drawable instanceof NinePatchDrawable) {
            drawable2 = ((NinePatchDrawable) drawable).tint(color);
        } else if (drawable instanceof SpriteDrawable) {
            drawable2 = ((SpriteDrawable) drawable).tint(color);
        } else {
            throw new GdxRuntimeException("Unable to copy, unknown drawable type: " + drawable.getClass());
        }
        if (drawable2 instanceof BaseDrawable) {
            BaseDrawable baseDrawable = (BaseDrawable) drawable2;
            if (drawable instanceof BaseDrawable) {
                baseDrawable.setName(((BaseDrawable) drawable).getName() + " (" + color + ")");
            } else {
                baseDrawable.setName(" (" + color + ")");
            }
        }
        return drawable2;
    }

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

    public TextureAtlas getAtlas() {
        return this.atlas;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        TextureAtlas textureAtlas = this.atlas;
        if (textureAtlas != null) {
            textureAtlas.dispose();
        }
        ObjectMap.Values<ObjectMap<String, Object>> it = this.resources.values().iterator();
        while (it.hasNext()) {
            ObjectMap.Values it2 = ((ObjectMap) it.next()).values().iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (next instanceof Disposable) {
                    ((Disposable) next).dispose();
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public Json getJsonLoader(final FileHandle fileHandle) {
        AnonymousClass1 r0 = new Json() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Skin.AnonymousClass1 */
            private static final String parentFieldName = "parent";

            @Override // com.badlogic.gdx.utils.Json
            public <T> T readValue(Class<T> cls, Class cls2, JsonValue jsonValue) {
                return (jsonValue == null || !jsonValue.isString() || ClassReflection.isAssignableFrom(CharSequence.class, cls)) ? (T) super.readValue(cls, cls2, jsonValue) : (T) Skin.this.get(jsonValue.asString(), cls);
            }

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Json
            public boolean ignoreUnknownField(Class cls, String str) {
                return str.equals(parentFieldName);
            }

            @Override // com.badlogic.gdx.utils.Json
            public void readFields(Object obj, JsonValue jsonValue) {
                if (jsonValue.has(parentFieldName)) {
                    String str = (String) readValue(parentFieldName, String.class, jsonValue);
                    Class<?> cls = obj.getClass();
                    do {
                        try {
                            copyFields(Skin.this.get(str, cls), obj);
                        } catch (GdxRuntimeException unused) {
                            cls = cls.getSuperclass();
                            if (cls == Object.class) {
                                SerializationException serializationException = new SerializationException("Unable to find parent resource with name: " + str);
                                serializationException.addTrace(jsonValue.child.trace());
                                throw serializationException;
                            }
                        }
                    } while (cls == Object.class);
                    SerializationException serializationException2 = new SerializationException("Unable to find parent resource with name: " + str);
                    serializationException2.addTrace(jsonValue.child.trace());
                    throw serializationException2;
                }
                super.readFields(obj, jsonValue);
            }
        };
        r0.setTypeName(null);
        r0.setUsePrototypes(false);
        r0.setSerializer(Skin.class, new Json.ReadOnlySerializer<Skin>() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Skin.AnonymousClass2 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Skin read(Json json, JsonValue jsonValue, Class cls) {
                for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                    try {
                        Class cls2 = json.getClass(jsonValue2.name());
                        if (cls2 == null) {
                            cls2 = ClassReflection.forName(jsonValue2.name());
                        }
                        readNamedObjects(json, cls2, jsonValue2);
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
                            Skin.this.add(jsonValue2.name, readValue, cls2);
                            if (cls2 != Drawable.class && ClassReflection.isAssignableFrom(Drawable.class, cls2)) {
                                Skin.this.add(jsonValue2.name, readValue, Drawable.class);
                            }
                        } catch (Exception e) {
                            throw new SerializationException("Error reading " + ClassReflection.getSimpleName(cls) + ": " + jsonValue2.name, e);
                        }
                    }
                }
            }
        });
        r0.setSerializer(BitmapFont.class, new Json.ReadOnlySerializer<BitmapFont>() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Skin.AnonymousClass3 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public BitmapFont read(Json json, JsonValue jsonValue, Class cls) {
                BitmapFont bitmapFont;
                String str = (String) json.readValue("file", String.class, jsonValue);
                int intValue = ((Integer) json.readValue("scaledSize", Integer.TYPE, (Object) -1, jsonValue)).intValue();
                Boolean bool = (Boolean) json.readValue("flip", Boolean.class, (Object) false, jsonValue);
                Boolean bool2 = (Boolean) json.readValue("markupEnabled", Boolean.class, (Object) false, jsonValue);
                FileHandle child = fileHandle.parent().child(str);
                if (!child.exists()) {
                    child = Gdx.files.internal(str);
                }
                if (child.exists()) {
                    String nameWithoutExtension = child.nameWithoutExtension();
                    try {
                        Array<TextureRegion> regions = this.getRegions(nameWithoutExtension);
                        if (regions != null) {
                            bitmapFont = new BitmapFont(new BitmapFont.BitmapFontData(child, bool.booleanValue()), regions, true);
                        } else {
                            TextureRegion textureRegion = (TextureRegion) this.optional(nameWithoutExtension, TextureRegion.class);
                            if (textureRegion != null) {
                                bitmapFont = new BitmapFont(child, textureRegion, bool.booleanValue());
                            } else {
                                FileHandle parent = child.parent();
                                FileHandle child2 = parent.child(nameWithoutExtension + ".png");
                                if (child2.exists()) {
                                    bitmapFont = new BitmapFont(child, child2, bool.booleanValue());
                                } else {
                                    bitmapFont = new BitmapFont(child, bool.booleanValue());
                                }
                            }
                        }
                        bitmapFont.getData().markupEnabled = bool2.booleanValue();
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
            /* class com.badlogic.gdx.scenes.scene2d.ui.Skin.AnonymousClass4 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Color read(Json json, JsonValue jsonValue, Class cls) {
                if (jsonValue.isString()) {
                    return (Color) Skin.this.get(jsonValue.asString(), Color.class);
                }
                String str = (String) json.readValue("hex", String.class, (Object) null, jsonValue);
                if (str != null) {
                    return Color.valueOf(str);
                }
                return new Color(((Float) json.readValue("r", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("g", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("b", Float.TYPE, Float.valueOf(0.0f), jsonValue)).floatValue(), ((Float) json.readValue("a", Float.TYPE, Float.valueOf(1.0f), jsonValue)).floatValue());
            }
        });
        r0.setSerializer(TintedDrawable.class, new Json.ReadOnlySerializer() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Skin.AnonymousClass5 */

            @Override // com.badlogic.gdx.utils.Json.ReadOnlySerializer, com.badlogic.gdx.utils.Json.Serializer
            public Object read(Json json, JsonValue jsonValue, Class cls) {
                String str = (String) json.readValue("name", String.class, jsonValue);
                Color color = (Color) json.readValue("color", Color.class, jsonValue);
                if (color != null) {
                    Drawable newDrawable = Skin.this.newDrawable(str, color);
                    if (newDrawable instanceof BaseDrawable) {
                        ((BaseDrawable) newDrawable).setName(jsonValue.name + " (" + str + ", " + color + ")");
                    }
                    return newDrawable;
                }
                throw new SerializationException("TintedDrawable missing color: " + jsonValue);
            }
        });
        ObjectMap.Entries<String, Class> it = this.jsonClassTags.iterator();
        while (it.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
            r0.addClassTag(entry.key, entry.value);
        }
        return r0;
    }

    public ObjectMap<String, Class> getJsonClassTags() {
        return this.jsonClassTags;
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
