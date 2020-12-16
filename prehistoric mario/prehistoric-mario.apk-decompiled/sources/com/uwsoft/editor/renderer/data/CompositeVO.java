package com.uwsoft.editor.renderer.data;

import com.uwsoft.editor.renderer.resources.FontSizePair;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

public class CompositeVO {
    public ArrayList<LayerItemVO> layers = new ArrayList<>();
    public ArrayList<ButtonVO> sButtons = new ArrayList<>(1);
    public ArrayList<CheckBoxVO> sCheckBoxes = new ArrayList<>(1);
    public ArrayList<CompositeItemVO> sComposites = new ArrayList<>(1);
    public ArrayList<Image9patchVO> sImage9patchs = new ArrayList<>(1);
    public ArrayList<SimpleImageVO> sImages = new ArrayList<>(1);
    public ArrayList<LabelVO> sLabels = new ArrayList<>(1);
    public ArrayList<LightVO> sLights = new ArrayList<>(1);
    public ArrayList<ParticleEffectVO> sParticleEffects = new ArrayList<>(1);
    public ArrayList<SelectBoxVO> sSelectBoxes = new ArrayList<>(1);
    public ArrayList<SpineVO> sSpineAnimations = new ArrayList<>(1);
    public ArrayList<SpriteAnimationVO> sSpriteAnimations = new ArrayList<>(1);
    public ArrayList<SpriterVO> sSpriterAnimations = new ArrayList<>(1);
    public ArrayList<TextBoxVO> sTextBox = new ArrayList<>(1);

    public CompositeVO() {
    }

    public CompositeVO(CompositeVO compositeVO) {
        if (compositeVO != null) {
            update(compositeVO);
        }
    }

    public void update(CompositeVO compositeVO) {
        clear();
        for (int i = 0; i < compositeVO.sImages.size(); i++) {
            this.sImages.add(new SimpleImageVO(compositeVO.sImages.get(i)));
        }
        for (int i2 = 0; i2 < compositeVO.sImage9patchs.size(); i2++) {
            this.sImage9patchs.add(new Image9patchVO(compositeVO.sImage9patchs.get(i2)));
        }
        for (int i3 = 0; i3 < compositeVO.sTextBox.size(); i3++) {
            this.sTextBox.add(new TextBoxVO(compositeVO.sTextBox.get(i3)));
        }
        for (int i4 = 0; i4 < compositeVO.sButtons.size(); i4++) {
            this.sButtons.add(new ButtonVO(compositeVO.sButtons.get(i4)));
        }
        for (int i5 = 0; i5 < compositeVO.sLabels.size(); i5++) {
            this.sLabels.add(new LabelVO(compositeVO.sLabels.get(i5)));
        }
        for (int i6 = 0; i6 < compositeVO.sComposites.size(); i6++) {
            this.sComposites.add(new CompositeItemVO(compositeVO.sComposites.get(i6)));
        }
        for (int i7 = 0; i7 < compositeVO.sCheckBoxes.size(); i7++) {
            this.sCheckBoxes.add(new CheckBoxVO(compositeVO.sCheckBoxes.get(i7)));
        }
        for (int i8 = 0; i8 < compositeVO.sSelectBoxes.size(); i8++) {
            this.sSelectBoxes.add(new SelectBoxVO(compositeVO.sSelectBoxes.get(i8)));
        }
        for (int i9 = 0; i9 < compositeVO.sParticleEffects.size(); i9++) {
            this.sParticleEffects.add(new ParticleEffectVO(compositeVO.sParticleEffects.get(i9)));
        }
        for (int i10 = 0; i10 < compositeVO.sLights.size(); i10++) {
            this.sLights.add(new LightVO(compositeVO.sLights.get(i10)));
        }
        for (int i11 = 0; i11 < compositeVO.sSpineAnimations.size(); i11++) {
            this.sSpineAnimations.add(new SpineVO(compositeVO.sSpineAnimations.get(i11)));
        }
        for (int i12 = 0; i12 < compositeVO.sSpriteAnimations.size(); i12++) {
            this.sSpriteAnimations.add(new SpriteAnimationVO(compositeVO.sSpriteAnimations.get(i12)));
        }
        for (int i13 = 0; i13 < compositeVO.sSpriterAnimations.size(); i13++) {
            this.sSpriterAnimations.add(new SpriterVO(compositeVO.sSpriterAnimations.get(i13)));
        }
        this.layers.clear();
        for (int i14 = 0; i14 < compositeVO.layers.size(); i14++) {
            this.layers.add(new LayerItemVO(compositeVO.layers.get(i14)));
        }
    }

    public void addItem(MainItemVO mainItemVO) {
        String simpleName = mainItemVO.getClass().getSimpleName();
        if (simpleName.equals("SimpleImageVO")) {
            this.sImages.add((SimpleImageVO) mainItemVO);
        }
        if (simpleName.equals("Image9patchVO")) {
            this.sImage9patchs.add((Image9patchVO) mainItemVO);
        }
        if (simpleName.equals("TextBoxVO")) {
            this.sTextBox.add((TextBoxVO) mainItemVO);
        }
        if (simpleName.equals("ButtonVO")) {
            this.sButtons.add((ButtonVO) mainItemVO);
        }
        if (simpleName.equals("LabelVO")) {
            this.sLabels.add((LabelVO) mainItemVO);
        }
        if (simpleName.equals("CompositeItemVO")) {
            this.sComposites.add((CompositeItemVO) mainItemVO);
        }
        if (simpleName.equals("CheckBoxVO")) {
            this.sCheckBoxes.add((CheckBoxVO) mainItemVO);
        }
        if (simpleName.equals("SelectBoxVO")) {
            this.sSelectBoxes.add((SelectBoxVO) mainItemVO);
        }
        if (simpleName.equals("ParticleEffectVO")) {
            this.sParticleEffects.add((ParticleEffectVO) mainItemVO);
        }
        if (simpleName.equals("LightVO")) {
            this.sLights.add((LightVO) mainItemVO);
        }
        if (simpleName.equals("SpineVO")) {
            this.sSpineAnimations.add((SpineVO) mainItemVO);
        }
        if (simpleName.equals("SpriterVO")) {
            this.sSpriterAnimations.add((SpriterVO) mainItemVO);
        }
        if (simpleName.equals("SpriteAnimationVO")) {
            this.sSpriteAnimations.add((SpriteAnimationVO) mainItemVO);
        }
    }

    public void removeItem(MainItemVO mainItemVO) {
        String simpleName = mainItemVO.getClass().getSimpleName();
        if (simpleName.equals("SimpleImageVO")) {
            this.sImages.remove((SimpleImageVO) mainItemVO);
        }
        if (simpleName.equals("Image9patchVO")) {
            this.sImage9patchs.remove((Image9patchVO) mainItemVO);
        }
        if (simpleName.equals("TextBoxVO")) {
            this.sTextBox.remove((TextBoxVO) mainItemVO);
        }
        if (simpleName.equals("ButtonVO")) {
            this.sButtons.remove((ButtonVO) mainItemVO);
        }
        if (simpleName.equals("LabelVO")) {
            this.sLabels.remove((LabelVO) mainItemVO);
        }
        if (simpleName.equals("CompositeItemVO")) {
            this.sComposites.remove((CompositeItemVO) mainItemVO);
        }
        if (simpleName.equals("CheckBoxVO")) {
            this.sCheckBoxes.remove((CheckBoxVO) mainItemVO);
        }
        if (simpleName.equals("SelectBoxVO")) {
            this.sSelectBoxes.remove((SelectBoxVO) mainItemVO);
        }
        if (simpleName.equals("ParticleEffectVO")) {
            this.sParticleEffects.remove((ParticleEffectVO) mainItemVO);
        }
        if (simpleName.equals("LightVO")) {
            this.sLights.remove((LightVO) mainItemVO);
        }
        if (simpleName.equals("SpineVO")) {
            this.sSpineAnimations.remove((SpineVO) mainItemVO);
        }
        if (simpleName.equals("SpriteAnimationVO")) {
            this.sSpriteAnimations.remove((SpriteAnimationVO) mainItemVO);
        }
        if (simpleName.equals("SpriterVO")) {
            this.sSpriterAnimations.remove((SpriterVO) mainItemVO);
        }
    }

    public void clear() {
        this.sImages.clear();
        this.sTextBox.clear();
        this.sButtons.clear();
        this.sLabels.clear();
        this.sComposites.clear();
        this.sCheckBoxes.clear();
        this.sSelectBoxes.clear();
        this.sParticleEffects.clear();
        this.sLights.clear();
        this.sSpineAnimations.clear();
        this.sSpriteAnimations.clear();
        this.sSpriterAnimations.clear();
    }

    public boolean isEmpty() {
        return this.sComposites.size() == 0 && this.sImage9patchs.size() == 0 && this.sImages.size() == 0 && this.sSpriteAnimations.size() == 0 && this.sButtons.size() == 0 && this.sCheckBoxes.size() == 0 && this.sLabels.size() == 0 && this.sLights.size() == 0 && this.sParticleEffects.size() == 0 && this.sCheckBoxes.size() == 0 && this.sSpriteAnimations.size() == 0 && this.sSpriterAnimations.size() == 0 && this.sSpineAnimations.size() == 0 && this.sSelectBoxes.size() == 0 && this.sTextBox.size() == 0;
    }

    public String[] getRecursiveParticleEffectsList() {
        HashSet hashSet = new HashSet();
        Iterator<ParticleEffectVO> it = this.sParticleEffects.iterator();
        while (it.hasNext()) {
            hashSet.add(it.next().particleName);
        }
        Iterator<CompositeItemVO> it2 = this.sComposites.iterator();
        while (it2.hasNext()) {
            Collections.addAll(hashSet, it2.next().composite.getRecursiveParticleEffectsList());
        }
        String[] strArr = new String[hashSet.size()];
        hashSet.toArray(strArr);
        return strArr;
    }

    public String[] getRecursiveSpineAnimationList() {
        HashSet hashSet = new HashSet();
        Iterator<SpineVO> it = this.sSpineAnimations.iterator();
        while (it.hasNext()) {
            hashSet.add(it.next().animationName);
        }
        Iterator<CompositeItemVO> it2 = this.sComposites.iterator();
        while (it2.hasNext()) {
            Collections.addAll(hashSet, it2.next().composite.getRecursiveSpineAnimationList());
        }
        String[] strArr = new String[hashSet.size()];
        hashSet.toArray(strArr);
        return strArr;
    }

    public String[] getRecursiveSpriteAnimationList() {
        HashSet hashSet = new HashSet();
        Iterator<SpriteAnimationVO> it = this.sSpriteAnimations.iterator();
        while (it.hasNext()) {
            hashSet.add(it.next().animationName);
        }
        Iterator<CompositeItemVO> it2 = this.sComposites.iterator();
        while (it2.hasNext()) {
            Collections.addAll(hashSet, it2.next().composite.getRecursiveSpriteAnimationList());
        }
        String[] strArr = new String[hashSet.size()];
        hashSet.toArray(strArr);
        return strArr;
    }

    public String[] getRecursiveSpriterAnimationList() {
        HashSet hashSet = new HashSet();
        Iterator<SpriterVO> it = this.sSpriterAnimations.iterator();
        while (it.hasNext()) {
            hashSet.add(it.next().animationName);
        }
        Iterator<CompositeItemVO> it2 = this.sComposites.iterator();
        while (it2.hasNext()) {
            Collections.addAll(hashSet, it2.next().composite.getRecursiveSpriterAnimationList());
        }
        String[] strArr = new String[hashSet.size()];
        hashSet.toArray(strArr);
        return strArr;
    }

    public FontSizePair[] getRecursiveFontList() {
        HashSet hashSet = new HashSet();
        Iterator<LabelVO> it = this.sLabels.iterator();
        while (it.hasNext()) {
            LabelVO next = it.next();
            hashSet.add(new FontSizePair(next.style.isEmpty() ? "arial" : next.style, next.size == 0 ? 12 : next.size));
        }
        Iterator<CompositeItemVO> it2 = this.sComposites.iterator();
        while (it2.hasNext()) {
            Collections.addAll(hashSet, it2.next().composite.getRecursiveFontList());
        }
        FontSizePair[] fontSizePairArr = new FontSizePair[hashSet.size()];
        hashSet.toArray(fontSizePairArr);
        return fontSizePairArr;
    }

    public ArrayList<MainItemVO> getAllItems() {
        return getAllItemsRecursive(new ArrayList<>(), this);
    }

    private ArrayList<MainItemVO> getAllItemsRecursive(ArrayList<MainItemVO> arrayList, CompositeVO compositeVO) {
        Iterator<ButtonVO> it = compositeVO.sButtons.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        Iterator<CheckBoxVO> it2 = compositeVO.sCheckBoxes.iterator();
        while (it2.hasNext()) {
            arrayList.add(it2.next());
        }
        Iterator<Image9patchVO> it3 = compositeVO.sImage9patchs.iterator();
        while (it3.hasNext()) {
            arrayList.add(it3.next());
        }
        Iterator<SimpleImageVO> it4 = compositeVO.sImages.iterator();
        while (it4.hasNext()) {
            arrayList.add(it4.next());
        }
        Iterator<LabelVO> it5 = compositeVO.sLabels.iterator();
        while (it5.hasNext()) {
            arrayList.add(it5.next());
        }
        Iterator<LightVO> it6 = compositeVO.sLights.iterator();
        while (it6.hasNext()) {
            arrayList.add(it6.next());
        }
        Iterator<ParticleEffectVO> it7 = compositeVO.sParticleEffects.iterator();
        while (it7.hasNext()) {
            arrayList.add(it7.next());
        }
        Iterator<SelectBoxVO> it8 = compositeVO.sSelectBoxes.iterator();
        while (it8.hasNext()) {
            arrayList.add(it8.next());
        }
        Iterator<SpineVO> it9 = compositeVO.sSpineAnimations.iterator();
        while (it9.hasNext()) {
            arrayList.add(it9.next());
        }
        Iterator<SpriteAnimationVO> it10 = compositeVO.sSpriteAnimations.iterator();
        while (it10.hasNext()) {
            arrayList.add(it10.next());
        }
        Iterator<SpriterVO> it11 = compositeVO.sSpriterAnimations.iterator();
        while (it11.hasNext()) {
            arrayList.add(it11.next());
        }
        Iterator<TextBoxVO> it12 = compositeVO.sTextBox.iterator();
        while (it12.hasNext()) {
            arrayList.add(it12.next());
        }
        Iterator<CompositeItemVO> it13 = compositeVO.sComposites.iterator();
        while (it13.hasNext()) {
            CompositeItemVO next = it13.next();
            arrayList = getAllItemsRecursive(arrayList, next.composite);
            arrayList.add(next);
        }
        return arrayList;
    }
}
