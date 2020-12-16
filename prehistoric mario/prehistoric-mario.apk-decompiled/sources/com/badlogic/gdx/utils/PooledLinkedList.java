package com.badlogic.gdx.utils;

public class PooledLinkedList<T> {
    private Item<T> curr;
    private Item<T> head;
    private Item<T> iter;
    private final Pool<Item<T>> pool;
    private int size = 0;
    private Item<T> tail;

    /* access modifiers changed from: package-private */
    public static final class Item<T> {
        public Item<T> next;
        public T payload;
        public Item<T> prev;

        Item() {
        }
    }

    public PooledLinkedList(int i) {
        this.pool = new Pool<Item<T>>(16, i) {
            /* class com.badlogic.gdx.utils.PooledLinkedList.AnonymousClass1 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Pool
            public Item<T> newObject() {
                return new Item<>();
            }
        };
    }

    public void add(T t) {
        Item<T> obtain = this.pool.obtain();
        obtain.payload = t;
        obtain.next = null;
        obtain.prev = null;
        if (this.head == null) {
            this.head = obtain;
            this.tail = obtain;
            this.size++;
            return;
        }
        Item<T> item = this.tail;
        obtain.prev = item;
        item.next = obtain;
        this.tail = obtain;
        this.size++;
    }

    public void addFirst(T t) {
        Item<T> obtain = this.pool.obtain();
        obtain.payload = t;
        Item<T> item = this.head;
        obtain.next = item;
        obtain.prev = null;
        if (item != null) {
            item.prev = obtain;
        } else {
            this.tail = obtain;
        }
        this.head = obtain;
        this.size++;
    }

    public int size() {
        return this.size;
    }

    public void iter() {
        this.iter = this.head;
    }

    public void iterReverse() {
        this.iter = this.tail;
    }

    public T next() {
        Item<T> item = this.iter;
        if (item == null) {
            return null;
        }
        T t = item.payload;
        Item<T> item2 = this.iter;
        this.curr = item2;
        this.iter = item2.next;
        return t;
    }

    public T previous() {
        Item<T> item = this.iter;
        if (item == null) {
            return null;
        }
        T t = item.payload;
        Item<T> item2 = this.iter;
        this.curr = item2;
        this.iter = item2.prev;
        return t;
    }

    public void remove() {
        Item<T> item = this.curr;
        if (item != null) {
            this.size--;
            Item<T> item2 = item.next;
            Item<T> item3 = this.curr.prev;
            this.pool.free(this.curr);
            this.curr = null;
            if (this.size == 0) {
                this.head = null;
                this.tail = null;
            } else if (item == this.head) {
                item2.prev = null;
                this.head = item2;
            } else if (item == this.tail) {
                item3.next = null;
                this.tail = item3;
            } else {
                item3.next = item2;
                item2.prev = item3;
            }
        }
    }

    public T removeLast() {
        Item<T> item = this.tail;
        if (item == null) {
            return null;
        }
        T t = item.payload;
        this.size--;
        Item<T> item2 = this.tail.prev;
        this.pool.free(this.tail);
        if (this.size == 0) {
            this.head = null;
            this.tail = null;
        } else {
            this.tail = item2;
            this.tail.next = null;
        }
        return t;
    }

    public void clear() {
        iter();
        while (next() != null) {
            remove();
        }
    }
}
