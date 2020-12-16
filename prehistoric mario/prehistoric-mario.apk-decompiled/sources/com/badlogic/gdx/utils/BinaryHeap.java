package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.BinaryHeap.Node;

public class BinaryHeap<T extends Node> {
    private final boolean isMaxHeap;
    private Node[] nodes;
    public int size;

    public BinaryHeap() {
        this(16, false);
    }

    public BinaryHeap(int i, boolean z) {
        this.isMaxHeap = z;
        this.nodes = new Node[i];
    }

    public T add(T t) {
        int i = this.size;
        Node[] nodeArr = this.nodes;
        if (i == nodeArr.length) {
            Node[] nodeArr2 = new Node[(i << 1)];
            System.arraycopy(nodeArr, 0, nodeArr2, 0, i);
            this.nodes = nodeArr2;
        }
        int i2 = this.size;
        t.index = i2;
        this.nodes[i2] = t;
        this.size = i2 + 1;
        up(i2);
        return t;
    }

    public T add(T t, float f) {
        t.value = f;
        return add(t);
    }

    public boolean contains(T t, boolean z) {
        if (t != null) {
            if (z) {
                for (Node node : this.nodes) {
                    if (node == t) {
                        return true;
                    }
                }
            } else {
                for (Node node2 : this.nodes) {
                    if (node2.equals(t)) {
                        return true;
                    }
                }
            }
            return false;
        }
        throw new IllegalArgumentException("node cannot be null.");
    }

    public T peek() {
        if (this.size != 0) {
            return (T) this.nodes[0];
        }
        throw new IllegalStateException("The heap is empty.");
    }

    public T pop() {
        return remove(0);
    }

    public T remove(T t) {
        return remove(t.index);
    }

    private T remove(int i) {
        Node[] nodeArr = this.nodes;
        T t = (T) nodeArr[i];
        int i2 = this.size - 1;
        this.size = i2;
        nodeArr[i] = nodeArr[i2];
        int i3 = this.size;
        nodeArr[i3] = null;
        if (i3 > 0 && i < i3) {
            down(i);
        }
        return t;
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public void clear() {
        Node[] nodeArr = this.nodes;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            nodeArr[i2] = null;
        }
        this.size = 0;
    }

    public void setValue(T t, float f) {
        float f2 = t.value;
        t.value = f;
        if ((f < f2) ^ this.isMaxHeap) {
            up(t.index);
        } else {
            down(t.index);
        }
    }

    private void up(int i) {
        Node[] nodeArr = this.nodes;
        Node node = nodeArr[i];
        float f = node.value;
        while (i > 0) {
            boolean z = true;
            int i2 = (i - 1) >> 1;
            Node node2 = nodeArr[i2];
            if (f >= node2.value) {
                z = false;
            }
            if (!(z ^ this.isMaxHeap)) {
                break;
            }
            nodeArr[i] = node2;
            node2.index = i;
            i = i2;
        }
        nodeArr[i] = node;
        node.index = i;
    }

    private void down(int i) {
        float f;
        Node node;
        Node[] nodeArr = this.nodes;
        int i2 = this.size;
        Node node2 = nodeArr[i];
        float f2 = node2.value;
        while (true) {
            boolean z = true;
            int i3 = (i << 1) + 1;
            if (i3 >= i2) {
                break;
            }
            int i4 = i3 + 1;
            Node node3 = nodeArr[i3];
            float f3 = node3.value;
            if (i4 >= i2) {
                node = null;
                f = this.isMaxHeap ? -3.4028235E38f : Float.MAX_VALUE;
            } else {
                node = nodeArr[i4];
                f = node.value;
            }
            if ((f3 < f) ^ this.isMaxHeap) {
                if (f3 == f2) {
                    break;
                }
                if (f3 <= f2) {
                    z = false;
                }
                if (z ^ this.isMaxHeap) {
                    break;
                }
                nodeArr[i] = node3;
                node3.index = i;
                i = i3;
            } else if (f == f2) {
                break;
            } else {
                if (f <= f2) {
                    z = false;
                }
                if (this.isMaxHeap ^ z) {
                    break;
                }
                nodeArr[i] = node;
                node.index = i;
                i = i4;
            }
        }
        nodeArr[i] = node2;
        node2.index = i;
    }

    public boolean equals(Object obj) {
        BinaryHeap binaryHeap;
        int i;
        if (!((obj instanceof BinaryHeap) && (binaryHeap = (BinaryHeap) obj).size == (i = this.size))) {
            return false;
        }
        Node[] nodeArr = this.nodes;
        Node[] nodeArr2 = binaryHeap.nodes;
        for (int i2 = 0; i2 < i; i2++) {
            if (nodeArr[i2].value != nodeArr2[i2].value) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int i = this.size;
        int i2 = 1;
        for (int i3 = 0; i3 < i; i3++) {
            i2 = (i2 * 31) + Float.floatToIntBits(this.nodes[i3].value);
        }
        return i2;
    }

    public String toString() {
        if (this.size == 0) {
            return "[]";
        }
        Node[] nodeArr = this.nodes;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('[');
        stringBuilder.append(nodeArr[0].value);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append(nodeArr[i].value);
        }
        stringBuilder.append(']');
        return stringBuilder.toString();
    }

    public static class Node {
        int index;
        float value;

        public Node(float f) {
            this.value = f;
        }

        public float getValue() {
            return this.value;
        }

        public String toString() {
            return Float.toString(this.value);
        }
    }
}
