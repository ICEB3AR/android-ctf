package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class Bresenham2 {
    private final Array<GridPoint2> points = new Array<>();
    private final Pool<GridPoint2> pool = new Pool<GridPoint2>() {
        /* class com.badlogic.gdx.math.Bresenham2.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public GridPoint2 newObject() {
            return new GridPoint2();
        }
    };

    public Array<GridPoint2> line(GridPoint2 gridPoint2, GridPoint2 gridPoint22) {
        return line(gridPoint2.x, gridPoint2.y, gridPoint22.x, gridPoint22.y);
    }

    public Array<GridPoint2> line(int i, int i2, int i3, int i4) {
        this.pool.freeAll(this.points);
        this.points.clear();
        return line(i, i2, i3, i4, this.pool, this.points);
    }

    public Array<GridPoint2> line(int i, int i2, int i3, int i4, Pool<GridPoint2> pool2, Array<GridPoint2> array) {
        int i5;
        int i6;
        int i7 = i3 - i;
        int i8 = i4 - i2;
        int i9 = -1;
        if (i7 < 0) {
            i6 = -1;
            i5 = -1;
        } else if (i7 > 0) {
            i6 = 1;
            i5 = 1;
        } else {
            i6 = 0;
            i5 = 0;
        }
        int i10 = i8 < 0 ? -1 : i8 > 0 ? 1 : 0;
        int abs = Math.abs(i7);
        int abs2 = Math.abs(i8);
        if (abs <= abs2) {
            abs = Math.abs(i8);
            abs2 = Math.abs(i7);
            if (i8 >= 0) {
                i9 = i8 > 0 ? 1 : 0;
            }
            i5 = 0;
        } else {
            i9 = 0;
        }
        int i11 = abs >> 1;
        for (int i12 = 0; i12 <= abs; i12++) {
            GridPoint2 obtain = pool2.obtain();
            obtain.set(i, i2);
            array.add(obtain);
            i11 += abs2;
            if (i11 > abs) {
                i11 -= abs;
                i += i6;
                i2 += i10;
            } else {
                i += i5;
                i2 += i9;
            }
        }
        return array;
    }
}
