package com.badlogic.gdx.utils;

public class SortedIntList<E> implements Iterable<Node<E>> {
    Node<E> first;
    private SortedIntList<E>.Iterator iterator;
    private NodePool<E> nodePool = new NodePool<>();
    int size = 0;

    public static class Node<E> {
        public int index;
        protected Node<E> n;
        protected Node<E> p;
        public E value;
    }

    public E insert(int i, E e) {
        Node<E> node = this.first;
        if (node != null) {
            while (node.n != null && node.n.index <= i) {
                node = node.n;
            }
            if (i > node.index) {
                node.n = this.nodePool.obtain(node, node.n, e, i);
                if (node.n.n != null) {
                    node.n.n.p = node.n;
                }
                this.size++;
            } else if (i < node.index) {
                Node<E> obtain = this.nodePool.obtain(null, this.first, e, i);
                this.first.p = obtain;
                this.first = obtain;
                this.size++;
            } else {
                node.value = e;
            }
        } else {
            this.first = this.nodePool.obtain(null, null, e, i);
            this.size++;
        }
        return null;
    }

    public E get(int i) {
        Node<E> node = this.first;
        if (node != null) {
            while (node.n != null && node.index < i) {
                node = node.n;
            }
            if (node.index == i) {
                return node.value;
            }
        }
        return null;
    }

    public void clear() {
        while (true) {
            Node<E> node = this.first;
            if (node != null) {
                this.nodePool.free(node);
                this.first = this.first.n;
            } else {
                this.size = 0;
                return;
            }
        }
    }

    public int size() {
        return this.size;
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override // java.lang.Iterable
    public java.util.Iterator<Node<E>> iterator() {
        if (this.iterator == null) {
            this.iterator = new Iterator();
        }
        return this.iterator.reset();
    }

    class Iterator implements java.util.Iterator<Node<E>> {
        private Node<E> position;
        private Node<E> previousPosition;

        Iterator() {
        }

        public boolean hasNext() {
            return this.position != null;
        }

        @Override // java.util.Iterator
        public Node<E> next() {
            Node<E> node = this.position;
            this.previousPosition = node;
            this.position = node.n;
            return this.previousPosition;
        }

        public void remove() {
            Node<E> node = this.previousPosition;
            if (node != null) {
                if (node == SortedIntList.this.first) {
                    SortedIntList.this.first = this.position;
                } else {
                    Node<E> node2 = this.previousPosition.p;
                    Node<E> node3 = this.position;
                    node2.n = node3;
                    if (node3 != null) {
                        node3.p = this.previousPosition.p;
                    }
                }
                SortedIntList sortedIntList = SortedIntList.this;
                sortedIntList.size--;
            }
        }

        public SortedIntList<E>.Iterator reset() {
            this.position = SortedIntList.this.first;
            this.previousPosition = null;
            return this;
        }
    }

    static class NodePool<E> extends Pool<Node<E>> {
        NodePool() {
        }

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public Node<E> newObject() {
            return new Node<>();
        }

        public Node<E> obtain(Node<E> node, Node<E> node2, E e, int i) {
            Node<E> node3 = (Node) super.obtain();
            node3.p = node;
            node3.n = node2;
            node3.value = e;
            node3.index = i;
            return node3;
        }
    }
}
