package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.utils.Array;

public abstract class Attribute implements Comparable<Attribute> {
    private static final Array<String> types = new Array<>();
    public final long type;
    private final int typeBit;

    public abstract Attribute copy();

    public static final long getAttributeType(String str) {
        for (int i = 0; i < types.size; i++) {
            if (types.get(i).compareTo(str) == 0) {
                return 1 << i;
            }
        }
        return 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:3:0x0007  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static final java.lang.String getAttributeAlias(long r7) {
        /*
            r0 = -1
        L_0x0001:
            r1 = 0
            int r3 = (r7 > r1 ? 1 : (r7 == r1 ? 0 : -1))
            if (r3 == 0) goto L_0x0017
            int r0 = r0 + 1
            r3 = 63
            if (r0 >= r3) goto L_0x0017
            long r3 = r7 >> r0
            r5 = 1
            long r3 = r3 & r5
            int r5 = (r3 > r1 ? 1 : (r3 == r1 ? 0 : -1))
            if (r5 != 0) goto L_0x0017
            goto L_0x0001
        L_0x0017:
            if (r0 < 0) goto L_0x0028
            com.badlogic.gdx.utils.Array<java.lang.String> r7 = com.badlogic.gdx.graphics.g3d.Attribute.types
            int r7 = r7.size
            if (r0 >= r7) goto L_0x0028
            com.badlogic.gdx.utils.Array<java.lang.String> r7 = com.badlogic.gdx.graphics.g3d.Attribute.types
            java.lang.Object r7 = r7.get(r0)
            java.lang.String r7 = (java.lang.String) r7
            goto L_0x0029
        L_0x0028:
            r7 = 0
        L_0x0029:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g3d.Attribute.getAttributeAlias(long):java.lang.String");
    }

    protected static final long register(String str) {
        long attributeType = getAttributeType(str);
        if (attributeType > 0) {
            return attributeType;
        }
        types.add(str);
        return 1 << (types.size - 1);
    }

    protected Attribute(long j) {
        this.type = j;
        this.typeBit = Long.numberOfTrailingZeros(j);
    }

    /* access modifiers changed from: protected */
    public boolean equals(Attribute attribute) {
        return attribute.hashCode() == hashCode();
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Attribute)) {
            return false;
        }
        Attribute attribute = (Attribute) obj;
        if (this.type != attribute.type) {
            return false;
        }
        return equals(attribute);
    }

    public String toString() {
        return getAttributeAlias(this.type);
    }

    public int hashCode() {
        return this.typeBit * 7489;
    }
}
