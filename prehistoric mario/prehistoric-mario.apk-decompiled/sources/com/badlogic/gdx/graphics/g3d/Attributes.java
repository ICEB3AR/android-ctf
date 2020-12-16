package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.utils.Array;
import java.util.Comparator;
import java.util.Iterator;

public class Attributes implements Iterable<Attribute>, Comparator<Attribute>, Comparable<Attributes> {
    protected final Array<Attribute> attributes = new Array<>();
    protected long mask;
    protected boolean sorted = true;

    public final void sort() {
        if (!this.sorted) {
            this.attributes.sort(this);
            this.sorted = true;
        }
    }

    public final long getMask() {
        return this.mask;
    }

    public final Attribute get(long j) {
        if (!has(j)) {
            return null;
        }
        for (int i = 0; i < this.attributes.size; i++) {
            if (this.attributes.get(i).type == j) {
                return this.attributes.get(i);
            }
        }
        return null;
    }

    public final <T extends Attribute> T get(Class<T> cls, long j) {
        return (T) get(j);
    }

    public final Array<Attribute> get(Array<Attribute> array, long j) {
        for (int i = 0; i < this.attributes.size; i++) {
            if ((this.attributes.get(i).type & j) != 0) {
                array.add(this.attributes.get(i));
            }
        }
        return array;
    }

    public void clear() {
        this.mask = 0;
        this.attributes.clear();
    }

    public int size() {
        return this.attributes.size;
    }

    private final void enable(long j) {
        this.mask = j | this.mask;
    }

    private final void disable(long j) {
        this.mask = (j ^ -1) & this.mask;
    }

    public final void set(Attribute attribute) {
        int indexOf = indexOf(attribute.type);
        if (indexOf < 0) {
            enable(attribute.type);
            this.attributes.add(attribute);
            this.sorted = false;
        } else {
            this.attributes.set(indexOf, attribute);
        }
        sort();
    }

    public final void set(Attribute attribute, Attribute attribute2) {
        set(attribute);
        set(attribute2);
    }

    public final void set(Attribute attribute, Attribute attribute2, Attribute attribute3) {
        set(attribute);
        set(attribute2);
        set(attribute3);
    }

    public final void set(Attribute attribute, Attribute attribute2, Attribute attribute3, Attribute attribute4) {
        set(attribute);
        set(attribute2);
        set(attribute3);
        set(attribute4);
    }

    public final void set(Attribute... attributeArr) {
        for (Attribute attribute : attributeArr) {
            set(attribute);
        }
    }

    public final void set(Iterable<Attribute> iterable) {
        for (Attribute attribute : iterable) {
            set(attribute);
        }
    }

    public final void remove(long j) {
        for (int i = this.attributes.size - 1; i >= 0; i--) {
            long j2 = this.attributes.get(i).type;
            if ((j & j2) == j2) {
                this.attributes.removeIndex(i);
                disable(j2);
                this.sorted = false;
            }
        }
        sort();
    }

    public final boolean has(long j) {
        return j != 0 && (this.mask & j) == j;
    }

    /* access modifiers changed from: protected */
    public int indexOf(long j) {
        if (!has(j)) {
            return -1;
        }
        for (int i = 0; i < this.attributes.size; i++) {
            if (this.attributes.get(i).type == j) {
                return i;
            }
        }
        return -1;
    }

    public final boolean same(Attributes attributes2, boolean z) {
        if (attributes2 == this) {
            return true;
        }
        if (attributes2 == null || this.mask != attributes2.mask) {
            return false;
        }
        if (!z) {
            return true;
        }
        sort();
        attributes2.sort();
        for (int i = 0; i < this.attributes.size; i++) {
            if (!this.attributes.get(i).equals(attributes2.attributes.get(i))) {
                return false;
            }
        }
        return true;
    }

    public final boolean same(Attributes attributes2) {
        return same(attributes2, false);
    }

    public final int compare(Attribute attribute, Attribute attribute2) {
        return (int) (attribute.type - attribute2.type);
    }

    @Override // java.lang.Iterable
    public final Iterator<Attribute> iterator() {
        return this.attributes.iterator();
    }

    public int attributesHash() {
        sort();
        int i = this.attributes.size;
        long j = this.mask + 71;
        int i2 = 1;
        for (int i3 = 0; i3 < i; i3++) {
            i2 = (i2 * 7) & 65535;
            j += this.mask * ((long) this.attributes.get(i3).hashCode()) * ((long) i2);
        }
        return (int) (j ^ (j >> 32));
    }

    public int hashCode() {
        return attributesHash();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Attributes)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        return same((Attributes) obj, true);
    }

    public int compareTo(Attributes attributes2) {
        if (attributes2 == this) {
            return 0;
        }
        long j = this.mask;
        long j2 = attributes2.mask;
        if (j != j2) {
            return j < j2 ? -1 : 1;
        }
        sort();
        attributes2.sort();
        for (int i = 0; i < this.attributes.size; i++) {
            int compareTo = this.attributes.get(i).compareTo(attributes2.attributes.get(i));
            if (compareTo != 0) {
                if (compareTo < 0) {
                    return -1;
                } else {
                    if (compareTo > 0) {
                        return 1;
                    }
                    return 0;
                }
            }
        }
        return 0;
    }
}
