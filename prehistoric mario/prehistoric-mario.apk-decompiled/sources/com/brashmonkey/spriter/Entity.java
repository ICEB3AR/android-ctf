package com.brashmonkey.spriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Entity {
    private int animationPointer = 0;
    private final Animation[] animations;
    private int charMapPointer = 0;
    private final CharacterMap[] characterMaps;
    public final int id;
    public final String name;
    private final HashMap<String, Animation> namedAnimations;
    private int objInfoPointer = 0;
    private final ObjectInfo[] objectInfos;

    Entity(int i, String str, int i2, int i3, int i4) {
        this.id = i;
        this.name = str;
        this.animations = new Animation[i2];
        this.characterMaps = new CharacterMap[i3];
        this.objectInfos = new ObjectInfo[i4];
        this.namedAnimations = new HashMap<>();
    }

    /* access modifiers changed from: package-private */
    public void addAnimation(Animation animation) {
        Animation[] animationArr = this.animations;
        int i = this.animationPointer;
        this.animationPointer = i + 1;
        animationArr[i] = animation;
        this.namedAnimations.put(animation.name, animation);
    }

    public Animation getAnimation(int i) {
        return this.animations[i];
    }

    public Animation getAnimation(String str) {
        return this.namedAnimations.get(str);
    }

    public int animations() {
        return this.animations.length;
    }

    public boolean containsAnimation(Animation animation) {
        for (Animation animation2 : this.animations) {
            if (animation2 == animation) {
                return true;
            }
        }
        return false;
    }

    public Animation getAnimationWithMostTimelines() {
        Animation animation = getAnimation(0);
        Animation[] animationArr = this.animations;
        for (Animation animation2 : animationArr) {
            if (animation.timelines() < animation2.timelines()) {
                animation = animation2;
            }
        }
        return animation;
    }

    public CharacterMap getCharacterMap(String str) {
        CharacterMap[] characterMapArr = this.characterMaps;
        for (CharacterMap characterMap : characterMapArr) {
            if (characterMap.name.equals(str)) {
                return characterMap;
            }
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public void addCharacterMap(CharacterMap characterMap) {
        CharacterMap[] characterMapArr = this.characterMaps;
        int i = this.charMapPointer;
        this.charMapPointer = i + 1;
        characterMapArr[i] = characterMap;
    }

    /* access modifiers changed from: package-private */
    public void addInfo(ObjectInfo objectInfo) {
        ObjectInfo[] objectInfoArr = this.objectInfos;
        int i = this.objInfoPointer;
        this.objInfoPointer = i + 1;
        objectInfoArr[i] = objectInfo;
    }

    public ObjectInfo getInfo(int i) {
        return this.objectInfos[i];
    }

    public ObjectInfo getInfo(String str) {
        ObjectInfo[] objectInfoArr = this.objectInfos;
        for (ObjectInfo objectInfo : objectInfoArr) {
            if (objectInfo.name.equals(str)) {
                return objectInfo;
            }
        }
        return null;
    }

    public ObjectInfo getInfo(String str, ObjectType objectType) {
        ObjectInfo info = getInfo(str);
        if (info == null || info.type != objectType) {
            return null;
        }
        return info;
    }

    public enum ObjectType {
        Sprite,
        Bone,
        Box,
        Point,
        Skin;

        public static ObjectType getObjectInfoFor(String str) {
            if (str.equals("bone")) {
                return Bone;
            }
            if (str.equals("skin")) {
                return Skin;
            }
            if (str.equals("box")) {
                return Box;
            }
            if (str.equals("point")) {
                return Point;
            }
            return Sprite;
        }
    }

    public static class ObjectInfo {
        public final List<FileReference> frames;
        public final String name;
        public final Dimension size;
        public final ObjectType type;

        ObjectInfo(String str, ObjectType objectType, Dimension dimension, List<FileReference> list) {
            this.type = objectType;
            this.frames = list;
            this.name = str;
            this.size = dimension;
        }

        ObjectInfo(String str, ObjectType objectType, Dimension dimension) {
            this(str, objectType, dimension, new ArrayList());
        }

        ObjectInfo(String str, ObjectType objectType, List<FileReference> list) {
            this(str, objectType, new Dimension(0.0f, 0.0f), list);
        }

        public String toString() {
            return this.name + ": " + this.type + ", size: " + this.size + "|frames:\n" + this.frames;
        }
    }

    public static class CharacterMap extends HashMap<FileReference, FileReference> {
        private static final long serialVersionUID = 6062776450159802283L;
        public final int id;
        public final String name;

        public CharacterMap(int i, String str) {
            this.id = i;
            this.name = str;
        }

        public FileReference get(FileReference fileReference) {
            if (!super.containsKey(fileReference)) {
                return fileReference;
            }
            return (FileReference) super.get((Object) fileReference);
        }
    }

    public String toString() {
        String str = (getClass().getSimpleName() + "|[id: " + this.id + ", name: " + this.name + "]") + "Object infos:\n";
        for (ObjectInfo objectInfo : this.objectInfos) {
            str = str + "\n" + objectInfo;
        }
        String str2 = str + "Character maps:\n";
        for (CharacterMap characterMap : this.characterMaps) {
            str2 = str2 + "\n" + characterMap;
        }
        String str3 = str2 + "Animations:\n";
        for (Animation animation : this.animations) {
            str3 = str3 + "\n" + animation;
        }
        return str3 + "]";
    }
}
