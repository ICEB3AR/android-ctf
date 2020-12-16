package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Queue<T> implements Iterable<T> {
    protected int head;
    private QueueIterable iterable;
    public int size;
    protected int tail;
    protected T[] values;

    public Queue() {
        this(16);
    }

    public Queue(int i) {
        this.head = 0;
        this.tail = 0;
        this.size = 0;
        this.values = (T[]) new Object[i];
    }

    public Queue(int i, Class<T> cls) {
        this.head = 0;
        this.tail = 0;
        this.size = 0;
        this.values = (T[]) ((Object[]) ArrayReflection.newInstance(cls, i));
    }

    public void addLast(T t) {
        T[] tArr = this.values;
        if (this.size == tArr.length) {
            resize(tArr.length << 1);
            tArr = this.values;
        }
        int i = this.tail;
        this.tail = i + 1;
        tArr[i] = t;
        if (this.tail == tArr.length) {
            this.tail = 0;
        }
        this.size++;
    }

    public void addFirst(T t) {
        T[] tArr = this.values;
        if (this.size == tArr.length) {
            resize(tArr.length << 1);
            tArr = this.values;
        }
        int i = this.head - 1;
        if (i == -1) {
            i = tArr.length - 1;
        }
        tArr[i] = t;
        this.head = i;
        this.size++;
    }

    public void ensureCapacity(int i) {
        int i2 = this.size + i;
        if (this.values.length < i2) {
            resize(i2);
        }
    }

    /* access modifiers changed from: protected */
    public void resize(int i) {
        T[] tArr = this.values;
        int i2 = this.head;
        int i3 = this.tail;
        T[] tArr2 = (T[]) ((Object[]) ArrayReflection.newInstance(tArr.getClass().getComponentType(), i));
        if (i2 < i3) {
            System.arraycopy(tArr, i2, tArr2, 0, i3 - i2);
        } else if (this.size > 0) {
            int length = tArr.length - i2;
            System.arraycopy(tArr, i2, tArr2, 0, length);
            System.arraycopy(tArr, 0, tArr2, length, i3);
        }
        this.values = tArr2;
        this.head = 0;
        this.tail = this.size;
    }

    public T removeFirst() {
        if (this.size != 0) {
            T[] tArr = this.values;
            int i = this.head;
            T t = tArr[i];
            tArr[i] = null;
            this.head = i + 1;
            if (this.head == tArr.length) {
                this.head = 0;
            }
            this.size--;
            return t;
        }
        throw new NoSuchElementException("Queue is empty.");
    }

    public T removeLast() {
        if (this.size != 0) {
            T[] tArr = this.values;
            int i = this.tail - 1;
            if (i == -1) {
                i = tArr.length - 1;
            }
            T t = tArr[i];
            tArr[i] = null;
            this.tail = i;
            this.size--;
            return t;
        }
        throw new NoSuchElementException("Queue is empty.");
    }

    public int indexOf(T t, boolean z) {
        int length;
        if (this.size == 0) {
            return -1;
        }
        T[] tArr = this.values;
        int i = this.head;
        int i2 = this.tail;
        int i3 = 0;
        if (z || t == null) {
            if (i < i2) {
                for (int i4 = i; i4 < i2; i4++) {
                    if (tArr[i4] == t) {
                        return i4 - i;
                    }
                }
            } else {
                int length2 = tArr.length;
                for (int i5 = i; i5 < length2; i5++) {
                    if (tArr[i5] == t) {
                        return i5 - i;
                    }
                }
                while (i3 < i2) {
                    if (tArr[i3] == t) {
                        length = tArr.length;
                    } else {
                        i3++;
                    }
                }
            }
            return -1;
        }
        if (i < i2) {
            for (int i6 = i; i6 < i2; i6++) {
                if (t.equals(tArr[i6])) {
                    return i6 - i;
                }
            }
        } else {
            int length3 = tArr.length;
            for (int i7 = i; i7 < length3; i7++) {
                if (t.equals(tArr[i7])) {
                    return i7 - i;
                }
            }
            while (i3 < i2) {
                if (t.equals(tArr[i3])) {
                    length = tArr.length;
                } else {
                    i3++;
                }
            }
        }
        return -1;
        return (i3 + length) - i;
    }

    public boolean removeValue(T t, boolean z) {
        int indexOf = indexOf(t, z);
        if (indexOf == -1) {
            return false;
        }
        removeIndex(indexOf);
        return true;
    }

    public T removeIndex(int i) {
        T t;
        if (i < 0) {
            throw new IndexOutOfBoundsException("index can't be < 0: " + i);
        } else if (i < this.size) {
            T[] tArr = this.values;
            int i2 = this.head;
            int i3 = this.tail;
            int i4 = i + i2;
            if (i2 < i3) {
                t = tArr[i4];
                System.arraycopy(tArr, i4 + 1, tArr, i4, i3 - i4);
                tArr[i3] = null;
                this.tail--;
            } else if (i4 >= tArr.length) {
                int length = i4 - tArr.length;
                t = tArr[length];
                System.arraycopy(tArr, length + 1, tArr, length, i3 - length);
                this.tail--;
            } else {
                T t2 = tArr[i4];
                System.arraycopy(tArr, i2, tArr, i2 + 1, i4 - i2);
                tArr[i2] = null;
                this.head++;
                if (this.head == tArr.length) {
                    this.head = 0;
                }
                t = t2;
            }
            this.size--;
            return t;
        } else {
            throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
        }
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public T first() {
        if (this.size != 0) {
            return this.values[this.head];
        }
        throw new NoSuchElementException("Queue is empty.");
    }

    public T last() {
        if (this.size != 0) {
            T[] tArr = this.values;
            int i = this.tail - 1;
            if (i == -1) {
                i = tArr.length - 1;
            }
            return tArr[i];
        }
        throw new NoSuchElementException("Queue is empty.");
    }

    public T get(int i) {
        if (i < 0) {
            throw new IndexOutOfBoundsException("index can't be < 0: " + i);
        } else if (i < this.size) {
            T[] tArr = this.values;
            int i2 = this.head + i;
            if (i2 >= tArr.length) {
                i2 -= tArr.length;
            }
            return tArr[i2];
        } else {
            throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
        }
    }

    public void clear() {
        if (this.size != 0) {
            T[] tArr = this.values;
            int i = this.head;
            int i2 = this.tail;
            if (i < i2) {
                while (i < i2) {
                    tArr[i] = null;
                    i++;
                }
            } else {
                while (i < tArr.length) {
                    tArr[i] = null;
                    i++;
                }
                for (int i3 = 0; i3 < i2; i3++) {
                    tArr[i3] = null;
                }
            }
            this.head = 0;
            this.tail = 0;
            this.size = 0;
        }
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        if (Collections.allocateIterators) {
            return new QueueIterator(this, true);
        }
        if (this.iterable == null) {
            this.iterable = new QueueIterable(this);
        }
        return this.iterable.iterator();
    }

    public String toString() {
        if (this.size == 0) {
            return "[]";
        }
        T[] tArr = this.values;
        int i = this.head;
        int i2 = this.tail;
        StringBuilder stringBuilder = new StringBuilder(64);
        stringBuilder.append('[');
        stringBuilder.append((Object) tArr[i]);
        while (true) {
            i = (i + 1) % tArr.length;
            if (i != i2) {
                stringBuilder.append(", ").append((Object) tArr[i]);
            } else {
                stringBuilder.append(']');
                return stringBuilder.toString();
            }
        }
    }

    public int hashCode() {
        int i = this.size;
        T[] tArr = this.values;
        int length = tArr.length;
        int i2 = i + 1;
        int i3 = this.head;
        for (int i4 = 0; i4 < i; i4++) {
            T t = tArr[i3];
            i2 *= 31;
            if (t != null) {
                i2 += t.hashCode();
            }
            i3++;
            if (i3 == length) {
                i3 = 0;
            }
        }
        return i2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0039  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x003c  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x003d A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean equals(java.lang.Object r12) {
        /*
            r11 = this;
            r0 = 1
            if (r11 != r12) goto L_0x0004
            return r0
        L_0x0004:
            r1 = 0
            if (r12 == 0) goto L_0x0041
            boolean r2 = r12 instanceof com.badlogic.gdx.utils.Queue
            if (r2 != 0) goto L_0x000c
            goto L_0x0041
        L_0x000c:
            com.badlogic.gdx.utils.Queue r12 = (com.badlogic.gdx.utils.Queue) r12
            int r2 = r11.size
            int r3 = r12.size
            if (r3 == r2) goto L_0x0015
            return r1
        L_0x0015:
            T[] r3 = r11.values
            int r4 = r3.length
            T[] r5 = r12.values
            int r6 = r5.length
            int r7 = r11.head
            int r12 = r12.head
            r8 = r12
            r12 = 0
        L_0x0021:
            if (r12 >= r2) goto L_0x0040
            r9 = r3[r7]
            r10 = r5[r8]
            if (r9 != 0) goto L_0x002c
            if (r10 != 0) goto L_0x0032
            goto L_0x0033
        L_0x002c:
            boolean r9 = r9.equals(r10)
            if (r9 != 0) goto L_0x0033
        L_0x0032:
            return r1
        L_0x0033:
            int r7 = r7 + 1
            int r8 = r8 + 1
            if (r7 != r4) goto L_0x003a
            r7 = 0
        L_0x003a:
            if (r8 != r6) goto L_0x003d
            r8 = 0
        L_0x003d:
            int r12 = r12 + 1
            goto L_0x0021
        L_0x0040:
            return r0
        L_0x0041:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.Queue.equals(java.lang.Object):boolean");
    }

    public boolean equalsIdentity(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof Queue)) {
            return false;
        }
        Queue queue = (Queue) obj;
        int i = this.size;
        if (queue.size != i) {
            return false;
        }
        T[] tArr = this.values;
        int length = tArr.length;
        T[] tArr2 = queue.values;
        int length2 = tArr2.length;
        int i2 = this.head;
        int i3 = queue.head;
        for (int i4 = 0; i4 < i; i4++) {
            if (tArr[i2] != tArr2[i3]) {
                return false;
            }
            i2++;
            i3++;
            if (i2 == length) {
                i2 = 0;
            }
            if (i3 == length2) {
                i3 = 0;
            }
        }
        return true;
    }

    public static class QueueIterator<T> implements Iterator<T>, Iterable<T> {
        private final boolean allowRemove;
        int index;
        private final Queue<T> queue;
        boolean valid;

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            return this;
        }

        public QueueIterator(Queue<T> queue2) {
            this(queue2, true);
        }

        public QueueIterator(Queue<T> queue2, boolean z) {
            this.valid = true;
            this.queue = queue2;
            this.allowRemove = z;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.queue.size;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public T next() {
            if (this.index >= this.queue.size) {
                throw new NoSuchElementException(String.valueOf(this.index));
            } else if (this.valid) {
                Queue<T> queue2 = this.queue;
                int i = this.index;
                this.index = i + 1;
                return queue2.get(i);
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            if (this.allowRemove) {
                this.index--;
                this.queue.removeIndex(this.index);
                return;
            }
            throw new GdxRuntimeException("Remove not allowed.");
        }

        public void reset() {
            this.index = 0;
        }
    }

    public static class QueueIterable<T> implements Iterable<T> {
        private final boolean allowRemove;
        private QueueIterator iterator1;
        private QueueIterator iterator2;
        private final Queue<T> queue;

        public QueueIterable(Queue<T> queue2) {
            this(queue2, true);
        }

        public QueueIterable(Queue<T> queue2, boolean z) {
            this.queue = queue2;
            this.allowRemove = z;
        }

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            if (Collections.allocateIterators) {
                return new QueueIterator(this.queue, this.allowRemove);
            }
            if (this.iterator1 == null) {
                this.iterator1 = new QueueIterator(this.queue, this.allowRemove);
                this.iterator2 = new QueueIterator(this.queue, this.allowRemove);
            }
            if (!this.iterator1.valid) {
                QueueIterator queueIterator = this.iterator1;
                queueIterator.index = 0;
                queueIterator.valid = true;
                this.iterator2.valid = false;
                return queueIterator;
            }
            QueueIterator queueIterator2 = this.iterator2;
            queueIterator2.index = 0;
            queueIterator2.valid = true;
            this.iterator1.valid = false;
            return queueIterator2;
        }
    }
}
