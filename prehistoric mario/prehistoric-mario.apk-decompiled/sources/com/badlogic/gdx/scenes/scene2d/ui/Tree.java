package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.ui.Tree.Node;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.scenes.scene2d.utils.Selection;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Array;

public class Tree<N extends Node, V> extends WidgetGroup {
    private static final Vector2 tmp = new Vector2();
    private ClickListener clickListener;
    private N foundNode;
    float iconSpacingLeft;
    float iconSpacingRight;
    float indentSpacing;
    private N overNode;
    float paddingLeft;
    float paddingRight;
    private float prefHeight;
    private float prefWidth;
    N rangeStart;
    final Array<N> rootNodes;
    final Selection<N> selection;
    private boolean sizeInvalid;
    TreeStyle style;
    float ySpacing;

    public Tree(Skin skin) {
        this((TreeStyle) skin.get(TreeStyle.class));
    }

    public Tree(Skin skin, String str) {
        this((TreeStyle) skin.get(str, TreeStyle.class));
    }

    public Tree(TreeStyle treeStyle) {
        this.rootNodes = new Array<>();
        this.ySpacing = 4.0f;
        this.iconSpacingLeft = 2.0f;
        this.iconSpacingRight = 2.0f;
        this.sizeInvalid = true;
        this.selection = new Selection<N>() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Tree.AnonymousClass1 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.scenes.scene2d.utils.Selection
            public void changed() {
                int size = size();
                if (size == 0) {
                    Tree.this.rangeStart = null;
                } else if (size == 1) {
                    Tree.this.rangeStart = (N) ((Node) first());
                }
            }
        };
        this.selection.setActor(this);
        this.selection.setMultiple(true);
        setStyle(treeStyle);
        initialize();
    }

    private void initialize() {
        AnonymousClass2 r0 = new ClickListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Tree.AnonymousClass2 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public void clicked(InputEvent inputEvent, float f, float f2) {
                N n = (N) Tree.this.getNodeAt(f2);
                if (n == null || n != Tree.this.getNodeAt(getTouchDownY())) {
                    return;
                }
                if (!Tree.this.selection.getMultiple() || !Tree.this.selection.notEmpty() || !UIUtils.shift()) {
                    if (n.children.size > 0 && (!Tree.this.selection.getMultiple() || !UIUtils.ctrl())) {
                        float x = n.actor.getX();
                        if (n.icon != null) {
                            x -= Tree.this.iconSpacingRight + n.icon.getMinWidth();
                        }
                        if (f < x) {
                            n.setExpanded(!n.expanded);
                            return;
                        }
                    }
                    if (n.isSelectable()) {
                        Tree.this.selection.choose(n);
                        if (!Tree.this.selection.isEmpty()) {
                            Tree.this.rangeStart = n;
                            return;
                        }
                        return;
                    }
                    return;
                }
                if (Tree.this.rangeStart == null) {
                    Tree.this.rangeStart = n;
                }
                N n2 = Tree.this.rangeStart;
                if (!UIUtils.ctrl()) {
                    Tree.this.selection.clear();
                }
                float y = n2.actor.getY();
                float y2 = n.actor.getY();
                if (y > y2) {
                    Tree tree = Tree.this;
                    tree.selectNodes(tree.rootNodes, y2, y);
                } else {
                    Tree tree2 = Tree.this;
                    tree2.selectNodes(tree2.rootNodes, y, y2);
                    Tree.this.selection.items().orderedItems().reverse();
                }
                Tree.this.selection.fireChangeEvent();
                Tree.this.rangeStart = n2;
            }

            /* JADX DEBUG: Multi-variable search result rejected for r1v1, resolved type: com.badlogic.gdx.scenes.scene2d.ui.Tree */
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
                Tree tree = Tree.this;
                tree.setOverNode(tree.getNodeAt(f2));
                return false;
            }

            /* JADX DEBUG: Multi-variable search result rejected for r1v1, resolved type: com.badlogic.gdx.scenes.scene2d.ui.Tree */
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public void enter(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                super.enter(inputEvent, f, f2, i, actor);
                Tree tree = Tree.this;
                tree.setOverNode(tree.getNodeAt(f2));
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                super.exit(inputEvent, f, f2, i, actor);
                if (actor == null || !actor.isDescendantOf(Tree.this)) {
                    Tree.this.setOverNode(null);
                }
            }
        };
        this.clickListener = r0;
        addListener(r0);
    }

    public void setStyle(TreeStyle treeStyle) {
        this.style = treeStyle;
        if (this.indentSpacing == 0.0f) {
            this.indentSpacing = plusMinusWidth();
        }
    }

    public void add(N n) {
        insert(this.rootNodes.size, n);
    }

    public void insert(int i, N n) {
        int indexOf = this.rootNodes.indexOf(n, true);
        if (indexOf != -1 && indexOf < i) {
            i--;
        }
        remove(n);
        n.parent = null;
        this.rootNodes.insert(i, n);
        n.addToTree(this);
        invalidateHierarchy();
    }

    public void remove(N n) {
        if (n.parent != null) {
            n.parent.remove(n);
            return;
        }
        this.rootNodes.removeValue(n, true);
        n.removeFromTree(this);
        invalidateHierarchy();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void clearChildren() {
        super.clearChildren();
        setOverNode(null);
        this.rootNodes.clear();
        this.selection.clear();
    }

    public Array<N> getNodes() {
        return this.rootNodes;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void invalidate() {
        super.invalidate();
        this.sizeInvalid = true;
    }

    private float plusMinusWidth() {
        float max = Math.max(this.style.plus.getMinWidth(), this.style.minus.getMinWidth());
        if (this.style.plusOver != null) {
            max = Math.max(max, this.style.plusOver.getMinWidth());
        }
        return this.style.minusOver != null ? Math.max(max, this.style.minusOver.getMinWidth()) : max;
    }

    private void computeSize() {
        this.sizeInvalid = false;
        this.prefWidth = plusMinusWidth();
        this.prefHeight = 0.0f;
        computeSize(this.rootNodes, 0.0f, this.prefWidth);
        this.prefWidth += this.paddingLeft + this.paddingRight;
    }

    private void computeSize(Array<N> array, float f, float f2) {
        float f3;
        float f4 = this.ySpacing;
        float f5 = this.iconSpacingLeft + this.iconSpacingRight;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            N n = array.get(i2);
            float f6 = f + f2;
            A a = n.actor;
            if (a instanceof Layout) {
                Layout layout = (Layout) a;
                f3 = f6 + layout.getPrefWidth();
                n.height = layout.getPrefHeight();
            } else {
                f3 = f6 + a.getWidth();
                n.height = a.getHeight();
            }
            if (n.icon != null) {
                f3 += n.icon.getMinWidth() + f5;
                n.height = Math.max(n.height, n.icon.getMinHeight());
            }
            this.prefWidth = Math.max(this.prefWidth, f3);
            this.prefHeight += n.height + f4;
            if (n.expanded) {
                computeSize(n.children, this.indentSpacing + f, f2);
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void layout() {
        if (this.sizeInvalid) {
            computeSize();
        }
        layout(this.rootNodes, this.paddingLeft, getHeight() - (this.ySpacing / 2.0f), plusMinusWidth());
    }

    private float layout(Array<N> array, float f, float f2, float f3) {
        float f4 = this.ySpacing;
        float f5 = this.iconSpacingLeft + this.iconSpacingRight;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            N n = array.get(i2);
            float f6 = f + f3;
            if (n.icon != null) {
                f6 += n.icon.getMinWidth() + f5;
            }
            if (n.actor instanceof Layout) {
                ((Layout) n.actor).pack();
            }
            float height = f2 - n.getHeight();
            n.actor.setPosition(f6, height);
            f2 = height - f4;
            if (n.expanded) {
                f2 = layout(n.children, this.indentSpacing + f, f2, f3);
            }
        }
        return f2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        drawBackground(batch, f);
        Color color = getColor();
        batch.setColor(color.r, color.g, color.b, color.a * f);
        draw(batch, this.rootNodes, this.paddingLeft, plusMinusWidth());
        super.draw(batch, f);
    }

    /* access modifiers changed from: protected */
    public void drawBackground(Batch batch, float f) {
        if (this.style.background != null) {
            Color color = getColor();
            batch.setColor(color.r, color.g, color.b, color.a * f);
            this.style.background.draw(batch, getX(), getY(), getWidth(), getHeight());
        }
    }

    private void draw(Batch batch, Array<N> array, float f, float f2) {
        float f3;
        float f4;
        int i;
        int i2;
        N n;
        float f5;
        float f6;
        float f7;
        A a;
        Array<N> array2 = array;
        Rectangle cullingArea = getCullingArea();
        if (cullingArea != null) {
            float f8 = cullingArea.y;
            f4 = f8;
            f3 = cullingArea.height + f8;
        } else {
            f4 = 0.0f;
            f3 = 0.0f;
        }
        TreeStyle treeStyle = this.style;
        float x = getX();
        float y = getY();
        float f9 = x + f;
        float f10 = f9 + f2 + this.iconSpacingLeft;
        int i3 = 0;
        for (int i4 = array2.size; i3 < i4; i4 = i2) {
            N n2 = array2.get(i3);
            A a2 = n2.actor;
            float y2 = a2.getY();
            float f11 = n2.height;
            if (cullingArea == null || (y2 + f11 >= f4 && y2 <= f3)) {
                if (!this.selection.contains(n2) || treeStyle.selection == null) {
                    f6 = f11;
                    a = a2;
                    n = n2;
                    i = i3;
                    i2 = i4;
                    f7 = f10;
                    if (n == this.overNode && treeStyle.over != null) {
                        drawOver(n, treeStyle.over, batch, x, (y + y2) - (this.ySpacing / 2.0f), getWidth(), f6 + this.ySpacing);
                    }
                } else {
                    f6 = f11;
                    a = a2;
                    n = n2;
                    i = i3;
                    i2 = i4;
                    f7 = f10;
                    drawSelection(n2, treeStyle.selection, batch, x, (y + y2) - (this.ySpacing / 2.0f), getWidth(), f11 + this.ySpacing);
                }
                if (n.icon != null) {
                    float round = y + y2 + ((float) Math.round((f6 - n.icon.getMinHeight()) / 2.0f));
                    batch.setColor(a.getColor());
                    drawIcon(n, n.icon, batch, f7, round);
                    batch.setColor(1.0f, 1.0f, 1.0f, 1.0f);
                }
                if (n.children.size > 0) {
                    f5 = f7;
                    Drawable expandIcon = getExpandIcon(n, f5);
                    drawExpandIcon(n, expandIcon, batch, f9, y + y2 + ((float) Math.round((f6 - expandIcon.getMinHeight()) / 2.0f)));
                } else {
                    f5 = f7;
                }
            } else if (y2 >= f4) {
                n = n2;
                i = i3;
                i2 = i4;
                f5 = f10;
            } else {
                return;
            }
            if (n.expanded && n.children.size > 0) {
                draw(batch, n.children, f + this.indentSpacing, f2);
            }
            i3 = i + 1;
            array2 = array;
            f10 = f5;
        }
    }

    /* access modifiers changed from: protected */
    public void drawSelection(N n, Drawable drawable, Batch batch, float f, float f2, float f3, float f4) {
        drawable.draw(batch, f, f2, f3, f4);
    }

    /* access modifiers changed from: protected */
    public void drawOver(N n, Drawable drawable, Batch batch, float f, float f2, float f3, float f4) {
        drawable.draw(batch, f, f2, f3, f4);
    }

    /* access modifiers changed from: protected */
    public void drawExpandIcon(N n, Drawable drawable, Batch batch, float f, float f2) {
        drawable.draw(batch, f, f2, drawable.getMinWidth(), drawable.getMinHeight());
    }

    /* access modifiers changed from: protected */
    public void drawIcon(N n, Drawable drawable, Batch batch, float f, float f2) {
        drawable.draw(batch, f, f2, drawable.getMinWidth(), drawable.getMinHeight());
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0057  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x005c  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.badlogic.gdx.scenes.scene2d.utils.Drawable getExpandIcon(N r4, float r5) {
        /*
            r3 = this;
            N extends com.badlogic.gdx.scenes.scene2d.ui.Tree$Node r0 = r3.overNode
            if (r4 != r0) goto L_0x0040
            com.badlogic.gdx.Application r0 = com.badlogic.gdx.Gdx.app
            com.badlogic.gdx.Application$ApplicationType r0 = r0.getType()
            com.badlogic.gdx.Application$ApplicationType r1 = com.badlogic.gdx.Application.ApplicationType.Desktop
            if (r0 != r1) goto L_0x0040
            com.badlogic.gdx.scenes.scene2d.utils.Selection<N extends com.badlogic.gdx.scenes.scene2d.ui.Tree$Node> r0 = r3.selection
            boolean r0 = r0.getMultiple()
            if (r0 == 0) goto L_0x0022
            boolean r0 = com.badlogic.gdx.scenes.scene2d.utils.UIUtils.ctrl()
            if (r0 != 0) goto L_0x0040
            boolean r0 = com.badlogic.gdx.scenes.scene2d.utils.UIUtils.shift()
            if (r0 != 0) goto L_0x0040
        L_0x0022:
            com.badlogic.gdx.math.Vector2 r0 = com.badlogic.gdx.scenes.scene2d.ui.Tree.tmp
            com.badlogic.gdx.Input r1 = com.badlogic.gdx.Gdx.input
            int r1 = r1.getX()
            float r1 = (float) r1
            r2 = 0
            com.badlogic.gdx.math.Vector2 r0 = r0.set(r1, r2)
            com.badlogic.gdx.math.Vector2 r0 = r3.screenToLocalCoordinates(r0)
            float r0 = r0.x
            int r1 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r1 < 0) goto L_0x0040
            int r5 = (r0 > r5 ? 1 : (r0 == r5 ? 0 : -1))
            if (r5 >= 0) goto L_0x0040
            r5 = 1
            goto L_0x0041
        L_0x0040:
            r5 = 0
        L_0x0041:
            if (r5 == 0) goto L_0x0053
            boolean r5 = r4.expanded
            if (r5 == 0) goto L_0x004c
            com.badlogic.gdx.scenes.scene2d.ui.Tree$TreeStyle r5 = r3.style
            com.badlogic.gdx.scenes.scene2d.utils.Drawable r5 = r5.minusOver
            goto L_0x0050
        L_0x004c:
            com.badlogic.gdx.scenes.scene2d.ui.Tree$TreeStyle r5 = r3.style
            com.badlogic.gdx.scenes.scene2d.utils.Drawable r5 = r5.plusOver
        L_0x0050:
            if (r5 == 0) goto L_0x0053
            return r5
        L_0x0053:
            boolean r4 = r4.expanded
            if (r4 == 0) goto L_0x005c
            com.badlogic.gdx.scenes.scene2d.ui.Tree$TreeStyle r4 = r3.style
            com.badlogic.gdx.scenes.scene2d.utils.Drawable r4 = r4.minus
            goto L_0x0060
        L_0x005c:
            com.badlogic.gdx.scenes.scene2d.ui.Tree$TreeStyle r4 = r3.style
            com.badlogic.gdx.scenes.scene2d.utils.Drawable r4 = r4.plus
        L_0x0060:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.Tree.getExpandIcon(com.badlogic.gdx.scenes.scene2d.ui.Tree$Node, float):com.badlogic.gdx.scenes.scene2d.utils.Drawable");
    }

    public N getNodeAt(float f) {
        this.foundNode = null;
        getNodeAt(this.rootNodes, f, getHeight());
        return this.foundNode;
    }

    private float getNodeAt(Array<N> array, float f, float f2) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            N n = array.get(i2);
            float f3 = n.height;
            float height = f2 - (n.getHeight() - f3);
            if (f < (height - f3) - this.ySpacing || f >= height) {
                f2 = height - (f3 + this.ySpacing);
                if (n.expanded) {
                    f2 = getNodeAt(n.children, f, f2);
                    if (f2 == -1.0f) {
                        return -1.0f;
                    }
                }
            } else {
                this.foundNode = n;
                return -1.0f;
            }
        }
        return f2;
    }

    /* access modifiers changed from: package-private */
    public void selectNodes(Array<N> array, float f, float f2) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            N n = array.get(i2);
            if (n.actor.getY() >= f) {
                if (n.isSelectable()) {
                    if (n.actor.getY() <= f2) {
                        this.selection.add(n);
                    }
                    if (n.expanded) {
                        selectNodes(n.children, f, f2);
                    }
                }
            } else {
                return;
            }
        }
    }

    public Selection<N> getSelection() {
        return this.selection;
    }

    public N getSelectedNode() {
        return this.selection.first();
    }

    public V getSelectedValue() {
        N first = this.selection.first();
        if (first == null) {
            return null;
        }
        return (V) first.getValue();
    }

    public TreeStyle getStyle() {
        return this.style;
    }

    public Array<N> getRootNodes() {
        return this.rootNodes;
    }

    public void updateRootNodes() {
        for (int i = this.rootNodes.size - 1; i >= 0; i--) {
            this.rootNodes.get(i).removeFromTree(this);
        }
        int i2 = this.rootNodes.size;
        for (int i3 = 0; i3 < i2; i3++) {
            this.rootNodes.get(i3).addToTree(this);
        }
    }

    public N getOverNode() {
        return this.overNode;
    }

    public V getOverValue() {
        N n = this.overNode;
        if (n == null) {
            return null;
        }
        return (V) n.getValue();
    }

    public void setOverNode(N n) {
        this.overNode = n;
    }

    public void setPadding(float f) {
        this.paddingLeft = f;
        this.paddingRight = f;
    }

    public void setPadding(float f, float f2) {
        this.paddingLeft = f;
        this.paddingRight = f2;
    }

    public void setIndentSpacing(float f) {
        this.indentSpacing = f;
    }

    public float getIndentSpacing() {
        return this.indentSpacing;
    }

    public void setYSpacing(float f) {
        this.ySpacing = f;
    }

    public float getYSpacing() {
        return this.ySpacing;
    }

    public void setIconSpacing(float f, float f2) {
        this.iconSpacingLeft = f;
        this.iconSpacingRight = f2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.prefWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.prefHeight;
    }

    public void findExpandedValues(Array<V> array) {
        findExpandedValues(this.rootNodes, array);
    }

    public void restoreExpandedValues(Array<V> array) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            N findNode = findNode(array.get(i2));
            if (findNode != null) {
                findNode.setExpanded(true);
                findNode.expandTo();
            }
        }
    }

    static boolean findExpandedValues(Array<? extends Node> array, Array array2) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            Node node = (Node) array.get(i2);
            if (node.expanded && !findExpandedValues(node.children, array2)) {
                array2.add(node.value);
            }
        }
        return false;
    }

    public N findNode(V v) {
        if (v != null) {
            return (N) findNode(this.rootNodes, v);
        }
        throw new IllegalArgumentException("value cannot be null.");
    }

    static Node findNode(Array<? extends Node> array, Object obj) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            Node node = (Node) array.get(i2);
            if (obj.equals(node.value)) {
                return node;
            }
        }
        int i3 = array.size;
        for (int i4 = 0; i4 < i3; i4++) {
            Node findNode = findNode(((Node) array.get(i4)).children, obj);
            if (findNode != null) {
                return findNode;
            }
        }
        return null;
    }

    public void collapseAll() {
        collapseAll(this.rootNodes);
    }

    static void collapseAll(Array<? extends Node> array) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            Node node = (Node) array.get(i2);
            node.setExpanded(false);
            collapseAll(node.children);
        }
    }

    public void expandAll() {
        expandAll(this.rootNodes);
    }

    static void expandAll(Array<? extends Node> array) {
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            ((Node) array.get(i2)).expandAll();
        }
    }

    public ClickListener getClickListener() {
        return this.clickListener;
    }

    public static abstract class Node<N extends Node, V, A extends Actor> {
        A actor;
        final Array<N> children = new Array<>(0);
        boolean expanded;
        float height;
        Drawable icon;
        N parent;
        boolean selectable = true;
        V value;

        public Node(A a) {
            if (a != null) {
                this.actor = a;
                return;
            }
            throw new IllegalArgumentException("actor cannot be null.");
        }

        public Node() {
        }

        public void setExpanded(boolean z) {
            Tree<N, V> tree;
            if (z != this.expanded) {
                this.expanded = z;
                if (!(this.children.size == 0 || (tree = getTree()) == null)) {
                    if (z) {
                        int i = this.children.size;
                        for (int i2 = 0; i2 < i; i2++) {
                            this.children.get(i2).addToTree(tree);
                        }
                    } else {
                        for (int i3 = this.children.size - 1; i3 >= 0; i3--) {
                            this.children.get(i3).removeFromTree(tree);
                        }
                    }
                    tree.invalidateHierarchy();
                }
            }
        }

        /* access modifiers changed from: protected */
        public void addToTree(Tree<N, V> tree) {
            tree.addActor(this.actor);
            if (this.expanded) {
                T[] tArr = this.children.items;
                for (int i = this.children.size - 1; i >= 0; i--) {
                    tArr[i].addToTree(tree);
                }
            }
        }

        /* access modifiers changed from: protected */
        public void removeFromTree(Tree<N, V> tree) {
            tree.removeActor(this.actor);
            if (this.expanded) {
                T[] tArr = this.children.items;
                for (int i = this.children.size - 1; i >= 0; i--) {
                    tArr[i].removeFromTree(tree);
                }
            }
        }

        public void add(N n) {
            insert(this.children.size, n);
        }

        public void addAll(Array<N> array) {
            int i = array.size;
            for (int i2 = 0; i2 < i; i2++) {
                insert(this.children.size, array.get(i2));
            }
        }

        public void insert(int i, N n) {
            n.parent = this;
            this.children.insert(i, n);
            updateChildren();
        }

        public void remove() {
            Tree<N, V> tree = getTree();
            if (tree != null) {
                tree.remove(this);
                return;
            }
            N n = this.parent;
            if (n != null) {
                n.remove(this);
            }
        }

        public void remove(N n) {
            Tree<N, V> tree;
            this.children.removeValue(n, true);
            if (this.expanded && (tree = getTree()) != null) {
                n.removeFromTree(tree);
            }
        }

        public void removeAll() {
            Tree<N, V> tree = getTree();
            if (tree != null) {
                T[] tArr = this.children.items;
                for (int i = this.children.size - 1; i >= 0; i--) {
                    tArr[i].removeFromTree(tree);
                }
            }
            this.children.clear();
        }

        public Tree<N, V> getTree() {
            Group parent2 = this.actor.getParent();
            if (parent2 instanceof Tree) {
                return (Tree) parent2;
            }
            return null;
        }

        public void setActor(A a) {
            Tree<N, V> tree;
            if (!(this.actor == null || (tree = getTree()) == null)) {
                this.actor.remove();
                tree.addActor(a);
            }
            this.actor = a;
        }

        public A getActor() {
            return this.actor;
        }

        public boolean isExpanded() {
            return this.expanded;
        }

        public Array<N> getChildren() {
            return this.children;
        }

        public boolean hasChildren() {
            return this.children.size > 0;
        }

        public void updateChildren() {
            Tree<N, V> tree;
            if (this.expanded && (tree = getTree()) != null) {
                for (int i = this.children.size - 1; i >= 0; i--) {
                    this.children.get(i).removeFromTree(tree);
                }
                int i2 = this.children.size;
                for (int i3 = 0; i3 < i2; i3++) {
                    this.children.get(i3).addToTree(tree);
                }
            }
        }

        public N getParent() {
            return this.parent;
        }

        public void setIcon(Drawable drawable) {
            this.icon = drawable;
        }

        public V getValue() {
            return this.value;
        }

        public void setValue(V v) {
            this.value = v;
        }

        public Drawable getIcon() {
            return this.icon;
        }

        public int getLevel() {
            int i = 0;
            Node<N, V, A> node = this;
            do {
                i++;
                node = node.getParent();
            } while (node != null);
            return i;
        }

        public N findNode(V v) {
            if (v != null) {
                return v.equals(this.value) ? this : (N) Tree.findNode(this.children, v);
            }
            throw new IllegalArgumentException("value cannot be null.");
        }

        public void collapseAll() {
            setExpanded(false);
            Tree.collapseAll(this.children);
        }

        public void expandAll() {
            setExpanded(true);
            if (this.children.size > 0) {
                Tree.expandAll(this.children);
            }
        }

        public void expandTo() {
            for (N n = this.parent; n != null; n = n.parent) {
                n.setExpanded(true);
            }
        }

        public boolean isSelectable() {
            return this.selectable;
        }

        public void setSelectable(boolean z) {
            this.selectable = z;
        }

        public void findExpandedValues(Array<V> array) {
            if (this.expanded && !Tree.findExpandedValues(this.children, array)) {
                array.add(this.value);
            }
        }

        public void restoreExpandedValues(Array<V> array) {
            int i = array.size;
            for (int i2 = 0; i2 < i; i2++) {
                N findNode = findNode(array.get(i2));
                if (findNode != null) {
                    findNode.setExpanded(true);
                    findNode.expandTo();
                }
            }
        }

        public float getHeight() {
            return this.height;
        }

        public boolean isAscendantOf(N n) {
            if (n != null) {
                while (n != this) {
                    n = n.parent;
                    if (n == null) {
                        return false;
                    }
                }
                return true;
            }
            throw new IllegalArgumentException("node cannot be null.");
        }

        public boolean isDescendantOf(N n) {
            if (n != null) {
                N n2 = this;
                while (n2 != n) {
                    n2 = n2.parent;
                    if (n2 == null) {
                        return false;
                    }
                }
                return true;
            }
            throw new IllegalArgumentException("node cannot be null.");
        }
    }

    public static class TreeStyle {
        public Drawable background;
        public Drawable minus;
        public Drawable minusOver;
        public Drawable over;
        public Drawable plus;
        public Drawable plusOver;
        public Drawable selection;

        public TreeStyle() {
        }

        public TreeStyle(Drawable drawable, Drawable drawable2, Drawable drawable3) {
            this.plus = drawable;
            this.minus = drawable2;
            this.selection = drawable3;
        }

        public TreeStyle(TreeStyle treeStyle) {
            this.plus = treeStyle.plus;
            this.minus = treeStyle.minus;
            this.plusOver = treeStyle.plusOver;
            this.minusOver = treeStyle.minusOver;
            this.over = treeStyle.over;
            this.selection = treeStyle.selection;
            this.background = treeStyle.background;
        }
    }
}
