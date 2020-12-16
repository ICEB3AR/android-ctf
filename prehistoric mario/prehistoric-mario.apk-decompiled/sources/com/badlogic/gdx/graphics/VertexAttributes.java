package com.badlogic.gdx.graphics;

import com.badlogic.gdx.utils.Collections;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class VertexAttributes implements Iterable<VertexAttribute>, Comparable<VertexAttributes> {
    private final VertexAttribute[] attributes;
    private ReadonlyIterable<VertexAttribute> iterable;
    private long mask = -1;
    public final int vertexSize;

    public static final class Usage {
        public static final int BiNormal = 256;
        public static final int BoneWeight = 64;
        public static final int ColorPacked = 4;
        public static final int ColorUnpacked = 2;
        public static final int Generic = 32;
        public static final int Normal = 8;
        public static final int Position = 1;
        public static final int Tangent = 128;
        public static final int TextureCoordinates = 16;
    }

    public VertexAttributes(VertexAttribute... vertexAttributeArr) {
        if (vertexAttributeArr.length != 0) {
            VertexAttribute[] vertexAttributeArr2 = new VertexAttribute[vertexAttributeArr.length];
            for (int i = 0; i < vertexAttributeArr.length; i++) {
                vertexAttributeArr2[i] = vertexAttributeArr[i];
            }
            this.attributes = vertexAttributeArr2;
            this.vertexSize = calculateOffsets();
            return;
        }
        throw new IllegalArgumentException("attributes must be >= 1");
    }

    public int getOffset(int i, int i2) {
        VertexAttribute findByUsage = findByUsage(i);
        if (findByUsage == null) {
            return i2;
        }
        return findByUsage.offset / 4;
    }

    public int getOffset(int i) {
        return getOffset(i, 0);
    }

    public VertexAttribute findByUsage(int i) {
        int size = size();
        for (int i2 = 0; i2 < size; i2++) {
            if (get(i2).usage == i) {
                return get(i2);
            }
        }
        return null;
    }

    private int calculateOffsets() {
        int i = 0;
        int i2 = 0;
        while (true) {
            VertexAttribute[] vertexAttributeArr = this.attributes;
            if (i >= vertexAttributeArr.length) {
                return i2;
            }
            VertexAttribute vertexAttribute = vertexAttributeArr[i];
            vertexAttribute.offset = i2;
            i2 += vertexAttribute.getSizeInBytes();
            i++;
        }
    }

    public int size() {
        return this.attributes.length;
    }

    public VertexAttribute get(int i) {
        return this.attributes[i];
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < this.attributes.length; i++) {
            sb.append("(");
            sb.append(this.attributes[i].alias);
            sb.append(", ");
            sb.append(this.attributes[i].usage);
            sb.append(", ");
            sb.append(this.attributes[i].numComponents);
            sb.append(", ");
            sb.append(this.attributes[i].offset);
            sb.append(")");
            sb.append("\n");
        }
        sb.append("]");
        return sb.toString();
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof VertexAttributes)) {
            return false;
        }
        VertexAttributes vertexAttributes = (VertexAttributes) obj;
        if (this.attributes.length != vertexAttributes.attributes.length) {
            return false;
        }
        int i = 0;
        while (true) {
            VertexAttribute[] vertexAttributeArr = this.attributes;
            if (i >= vertexAttributeArr.length) {
                return true;
            }
            if (!vertexAttributeArr[i].equals(vertexAttributes.attributes[i])) {
                return false;
            }
            i++;
        }
    }

    public int hashCode() {
        long length = (long) (this.attributes.length * 61);
        int i = 0;
        while (true) {
            VertexAttribute[] vertexAttributeArr = this.attributes;
            if (i >= vertexAttributeArr.length) {
                return (int) (length ^ (length >> 32));
            }
            length = (length * 61) + ((long) vertexAttributeArr[i].hashCode());
            i++;
        }
    }

    public long getMask() {
        if (this.mask == -1) {
            long j = 0;
            int i = 0;
            while (true) {
                VertexAttribute[] vertexAttributeArr = this.attributes;
                if (i >= vertexAttributeArr.length) {
                    break;
                }
                j |= (long) vertexAttributeArr[i].usage;
                i++;
            }
            this.mask = j;
        }
        return this.mask;
    }

    public long getMaskWithSizePacked() {
        return getMask() | (((long) this.attributes.length) << 32);
    }

    public int compareTo(VertexAttributes vertexAttributes) {
        int i;
        int i2;
        VertexAttribute[] vertexAttributeArr = this.attributes;
        int length = vertexAttributeArr.length;
        VertexAttribute[] vertexAttributeArr2 = vertexAttributes.attributes;
        if (length != vertexAttributeArr2.length) {
            i = vertexAttributeArr.length;
            i2 = vertexAttributeArr2.length;
        } else {
            long mask2 = getMask();
            long mask3 = vertexAttributes.getMask();
            if (mask2 != mask3) {
                return mask2 < mask3 ? -1 : 1;
            }
            for (int length2 = this.attributes.length - 1; length2 >= 0; length2--) {
                VertexAttribute vertexAttribute = this.attributes[length2];
                VertexAttribute vertexAttribute2 = vertexAttributes.attributes[length2];
                if (vertexAttribute.usage != vertexAttribute2.usage) {
                    i = vertexAttribute.usage;
                    i2 = vertexAttribute2.usage;
                } else if (vertexAttribute.unit != vertexAttribute2.unit) {
                    i = vertexAttribute.unit;
                    i2 = vertexAttribute2.unit;
                } else if (vertexAttribute.numComponents != vertexAttribute2.numComponents) {
                    i = vertexAttribute.numComponents;
                    i2 = vertexAttribute2.numComponents;
                } else if (vertexAttribute.normalized != vertexAttribute2.normalized) {
                    if (vertexAttribute.normalized) {
                        return 1;
                    }
                    return -1;
                } else if (vertexAttribute.type != vertexAttribute2.type) {
                    i = vertexAttribute.type;
                    i2 = vertexAttribute2.type;
                }
            }
            return 0;
        }
        return i - i2;
    }

    @Override // java.lang.Iterable
    public Iterator<VertexAttribute> iterator() {
        if (this.iterable == null) {
            this.iterable = new ReadonlyIterable<>(this.attributes);
        }
        return this.iterable.iterator();
    }

    /* access modifiers changed from: private */
    public static class ReadonlyIterator<T> implements Iterator<T>, Iterable<T> {
        private final T[] array;
        int index;
        boolean valid = true;

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            return this;
        }

        public ReadonlyIterator(T[] tArr) {
            this.array = tArr;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.array.length;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public T next() {
            int i = this.index;
            T[] tArr = this.array;
            if (i >= tArr.length) {
                throw new NoSuchElementException(String.valueOf(i));
            } else if (this.valid) {
                this.index = i + 1;
                return tArr[i];
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            throw new GdxRuntimeException("Remove not allowed.");
        }

        public void reset() {
            this.index = 0;
        }
    }

    private static class ReadonlyIterable<T> implements Iterable<T> {
        private final T[] array;
        private ReadonlyIterator iterator1;
        private ReadonlyIterator iterator2;

        public ReadonlyIterable(T[] tArr) {
            this.array = tArr;
        }

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            if (Collections.allocateIterators) {
                return new ReadonlyIterator(this.array);
            }
            if (this.iterator1 == null) {
                this.iterator1 = new ReadonlyIterator(this.array);
                this.iterator2 = new ReadonlyIterator(this.array);
            }
            if (!this.iterator1.valid) {
                ReadonlyIterator readonlyIterator = this.iterator1;
                readonlyIterator.index = 0;
                readonlyIterator.valid = true;
                this.iterator2.valid = false;
                return readonlyIterator;
            }
            ReadonlyIterator readonlyIterator2 = this.iterator2;
            readonlyIterator2.index = 0;
            readonlyIterator2.valid = true;
            this.iterator1.valid = false;
            return readonlyIterator2;
        }
    }
}
