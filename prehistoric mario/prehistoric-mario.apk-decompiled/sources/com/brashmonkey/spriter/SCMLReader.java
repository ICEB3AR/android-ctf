package com.brashmonkey.spriter;

import com.alles.platformer.BuildConfig;
import com.brashmonkey.spriter.Entity;
import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;
import com.brashmonkey.spriter.XmlReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

public class SCMLReader {
    protected Data data;

    public SCMLReader(InputStream inputStream) {
        this.data = load(inputStream);
    }

    public SCMLReader(String str) {
        this.data = load(str);
    }

    /* access modifiers changed from: protected */
    public Data load(String str) {
        XmlReader.Element parse = new XmlReader().parse(str);
        ArrayList<XmlReader.Element> childrenByName = parse.getChildrenByName("folder");
        ArrayList<XmlReader.Element> childrenByName2 = parse.getChildrenByName("entity");
        this.data = new Data(parse.get("scml_version"), parse.get("generator"), parse.get("generator_version"), childrenByName.size(), childrenByName2.size());
        loadFolders(childrenByName);
        loadEntities(childrenByName2);
        return this.data;
    }

    /* access modifiers changed from: protected */
    public Data load(InputStream inputStream) {
        try {
            XmlReader.Element parse = new XmlReader().parse(inputStream);
            ArrayList<XmlReader.Element> childrenByName = parse.getChildrenByName("folder");
            ArrayList<XmlReader.Element> childrenByName2 = parse.getChildrenByName("entity");
            this.data = new Data(parse.get("scml_version"), parse.get("generator"), parse.get("generator_version"), childrenByName.size(), childrenByName2.size());
            loadFolders(childrenByName);
            loadEntities(childrenByName2);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return this.data;
    }

    /* access modifiers changed from: protected */
    public void loadFolders(ArrayList<XmlReader.Element> arrayList) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            ArrayList<XmlReader.Element> childrenByName = element.getChildrenByName("file");
            int i2 = element.getInt("id");
            Folder folder = new Folder(i2, element.get("name", "no_name_" + i), childrenByName.size());
            loadFiles(childrenByName, folder);
            this.data.addFolder(folder);
        }
    }

    /* access modifiers changed from: protected */
    public void loadFiles(ArrayList<XmlReader.Element> arrayList, Folder folder) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            folder.addFile(new File(element.getInt("id"), element.get("name"), new Dimension((float) element.getInt("width", 0), (float) element.getInt("height", 0)), new Point(element.getFloat("pivot_x", 0.0f), element.getFloat("pivot_y", 1.0f))));
        }
    }

    /* access modifiers changed from: protected */
    public void loadEntities(ArrayList<XmlReader.Element> arrayList) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            ArrayList<XmlReader.Element> childrenByName = element.getChildrenByName("obj_info");
            ArrayList<XmlReader.Element> childrenByName2 = element.getChildrenByName("character_map");
            ArrayList<XmlReader.Element> childrenByName3 = element.getChildrenByName("animation");
            Entity entity = new Entity(element.getInt("id"), element.get("name"), childrenByName3.size(), childrenByName2.size(), childrenByName.size());
            this.data.addEntity(entity);
            loadObjectInfos(childrenByName, entity);
            loadCharacterMaps(childrenByName2, entity);
            loadAnimations(childrenByName3, entity);
        }
    }

    /* access modifiers changed from: protected */
    public void loadObjectInfos(ArrayList<XmlReader.Element> arrayList, Entity entity) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            Entity.ObjectInfo objectInfo = new Entity.ObjectInfo(element.get("name", "info" + i), Entity.ObjectType.getObjectInfoFor(element.get("type", BuildConfig.FLAVOR)), new Dimension(element.getFloat("w", 0.0f), element.getFloat("h", 0.0f)));
            entity.addInfo(objectInfo);
            XmlReader.Element childByName = element.getChildByName("frames");
            if (childByName != null) {
                Iterator<XmlReader.Element> it = childByName.getChildrenByName("i").iterator();
                while (it.hasNext()) {
                    XmlReader.Element next = it.next();
                    objectInfo.frames.add(new FileReference(next.getInt("folder", 0), next.getInt("file", 0)));
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void loadCharacterMaps(ArrayList<XmlReader.Element> arrayList, Entity entity) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            int i2 = element.getInt("id");
            Entity.CharacterMap characterMap = new Entity.CharacterMap(i2, element.getAttribute("name", "charMap" + i));
            entity.addCharacterMap(characterMap);
            Iterator<XmlReader.Element> it = element.getChildrenByName("map").iterator();
            while (it.hasNext()) {
                XmlReader.Element next = it.next();
                int i3 = next.getInt("folder");
                int i4 = next.getInt("file");
                characterMap.put(new FileReference(i3, i4), new FileReference(next.getInt("target_folder", i3), next.getInt("target_file", i4)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void loadAnimations(ArrayList<XmlReader.Element> arrayList, Entity entity) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            ArrayList<XmlReader.Element> childrenByName = element.getChildrenByName("timeline");
            ArrayList<XmlReader.Element> childrenByName2 = element.getChildByName("mainline").getChildrenByName("key");
            Animation animation = new Animation(new Mainline(childrenByName2.size()), element.getInt("id"), element.get("name"), element.getInt("length"), element.getBoolean("looping", true), childrenByName.size());
            entity.addAnimation(animation);
            loadMainlineKeys(childrenByName2, animation.mainline);
            loadTimelines(childrenByName, animation, entity);
            animation.prepare();
        }
    }

    /* access modifiers changed from: protected */
    public void loadMainlineKeys(ArrayList<XmlReader.Element> arrayList, Mainline mainline) {
        for (int i = 0; i < mainline.keys.length; i++) {
            XmlReader.Element element = arrayList.get(i);
            ArrayList<XmlReader.Element> childrenByName = element.getChildrenByName("object_ref");
            ArrayList<XmlReader.Element> childrenByName2 = element.getChildrenByName("bone_ref");
            Curve curve = new Curve();
            curve.setType(Curve.getType(element.get("curve_type", "linear")));
            curve.constraints.set(element.getFloat("c1", 0.0f), element.getFloat("c2", 0.0f), element.getFloat("c3", 0.0f), element.getFloat("c4", 0.0f));
            Mainline.Key key = new Mainline.Key(element.getInt("id"), element.getInt("time", 0), curve, childrenByName2.size(), childrenByName.size());
            mainline.addKey(key);
            loadRefs(childrenByName, childrenByName2, key);
        }
    }

    /* access modifiers changed from: protected */
    public void loadRefs(ArrayList<XmlReader.Element> arrayList, ArrayList<XmlReader.Element> arrayList2, Mainline.Key key) {
        Iterator<XmlReader.Element> it = arrayList2.iterator();
        while (it.hasNext()) {
            XmlReader.Element next = it.next();
            key.addBoneRef(new Mainline.Key.BoneRef(next.getInt("id"), next.getInt("timeline"), next.getInt("key"), key.getBoneRef(next.getInt("parent", -1))));
        }
        Iterator<XmlReader.Element> it2 = arrayList.iterator();
        while (it2.hasNext()) {
            XmlReader.Element next2 = it2.next();
            key.addObjectRef(new Mainline.Key.ObjectRef(next2.getInt("id"), next2.getInt("timeline"), next2.getInt("key"), key.getBoneRef(next2.getInt("parent", -1)), next2.getInt("z_index", 0)));
        }
        Arrays.sort(key.objectRefs);
    }

    /* access modifiers changed from: protected */
    public void loadTimelines(ArrayList<XmlReader.Element> arrayList, Animation animation, Entity entity) {
        for (int i = 0; i < arrayList.size(); i++) {
            XmlReader.Element element = arrayList.get(i);
            ArrayList<XmlReader.Element> childrenByName = arrayList.get(i).getChildrenByName("key");
            String str = element.get("name");
            Entity.ObjectType objectInfoFor = Entity.ObjectType.getObjectInfoFor(element.get("object_type", "sprite"));
            Entity.ObjectInfo info = entity.getInfo(str);
            if (info == null) {
                info = new Entity.ObjectInfo(str, objectInfoFor, new Dimension(0.0f, 0.0f));
            }
            Timeline timeline = new Timeline(element.getInt("id"), str, info, childrenByName.size());
            animation.addTimeline(timeline);
            loadTimelineKeys(childrenByName, timeline);
        }
    }

    /* access modifiers changed from: protected */
    public void loadTimelineKeys(ArrayList<XmlReader.Element> arrayList, Timeline timeline) {
        float f;
        Point point;
        int i;
        Timeline.Key.Object object;
        int i2 = 0;
        int i3 = 0;
        while (i3 < arrayList.size()) {
            XmlReader.Element element = arrayList.get(i3);
            Curve curve = new Curve();
            curve.setType(Curve.getType(element.get("curve_type", "linear")));
            curve.constraints.set(element.getFloat("c1", 0.0f), element.getFloat("c2", 0.0f), element.getFloat("c3", 0.0f), element.getFloat("c4", 0.0f));
            Timeline.Key key = new Timeline.Key(element.getInt("id"), element.getInt("time", i2), element.getInt("spin", 1), curve);
            XmlReader.Element childByName = element.getChildByName("bone");
            if (childByName == null) {
                childByName = element.getChildByName("object");
            }
            Point point2 = new Point(childByName.getFloat("x", 0.0f), childByName.getFloat("y", 0.0f));
            Point point3 = new Point(childByName.getFloat("scale_x", 1.0f), childByName.getFloat("scale_y", 1.0f));
            Point point4 = new Point(childByName.getFloat("pivot_x", 0.0f), childByName.getFloat("pivot_y", timeline.objectInfo.type == Entity.ObjectType.Bone ? 0.5f : 1.0f));
            float f2 = childByName.getFloat("angle", 0.0f);
            int i4 = -1;
            if (!childByName.getName().equals("object") || timeline.objectInfo.type != Entity.ObjectType.Sprite) {
                point = point4;
                i = -1;
                f = 1.0f;
            } else {
                float f3 = childByName.getFloat("a", 1.0f);
                i = childByName.getInt("folder", -1);
                i4 = childByName.getInt("file", -1);
                File file = this.data.getFolder(i).getFile(i4);
                Point point5 = new Point(childByName.getFloat("pivot_x", file.pivot.x), childByName.getFloat("pivot_y", file.pivot.y));
                timeline.objectInfo.size.set(file.size);
                point = point5;
                f = f3;
            }
            if (childByName.getName().equals("bone")) {
                object = new Timeline.Key.Object(point2, point3, point, f2, f, new FileReference(i, i4));
            } else {
                object = new Timeline.Key.Object(point2, point3, point, f2, f, new FileReference(i, i4));
            }
            key.setObject(object);
            timeline.addKey(key);
            i3++;
            i2 = 0;
        }
    }

    public Data getData() {
        return this.data;
    }
}
