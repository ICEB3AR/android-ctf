package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public abstract class ParticleSorter {
    static final Vector3 TMP_V1 = new Vector3();
    protected Camera camera;

    public void ensureCapacity(int i) {
    }

    public abstract <T extends ParticleControllerRenderData> int[] sort(Array<T> array);

    public static class None extends ParticleSorter {
        int currentCapacity = 0;
        int[] indices;

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleSorter
        public void ensureCapacity(int i) {
            if (this.currentCapacity < i) {
                this.indices = new int[i];
                for (int i2 = 0; i2 < i; i2++) {
                    this.indices[i2] = i2;
                }
                this.currentCapacity = i;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleSorter
        public <T extends ParticleControllerRenderData> int[] sort(Array<T> array) {
            return this.indices;
        }
    }

    public static class Distance extends ParticleSorter {
        private int currentSize = 0;
        private float[] distances;
        private int[] particleIndices;
        private int[] particleOffsets;

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleSorter
        public void ensureCapacity(int i) {
            if (this.currentSize < i) {
                this.distances = new float[i];
                this.particleIndices = new int[i];
                this.particleOffsets = new int[i];
                this.currentSize = i;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleSorter
        public <T extends ParticleControllerRenderData> int[] sort(Array<T> array) {
            float[] fArr = this.camera.view.val;
            float f = fArr[2];
            float f2 = fArr[6];
            float f3 = fArr[10];
            Iterator<T> it = array.iterator();
            int i = 0;
            int i2 = 0;
            while (it.hasNext()) {
                T next = it.next();
                int i3 = next.controller.particles.size + i2;
                int i4 = 0;
                while (i2 < i3) {
                    this.distances[i2] = (next.positionChannel.data[i4 + 0] * f) + (next.positionChannel.data[i4 + 1] * f2) + (next.positionChannel.data[i4 + 2] * f3);
                    this.particleIndices[i2] = i2;
                    i2++;
                    i4 += next.positionChannel.strideSize;
                }
                i += next.controller.particles.size;
            }
            qsort(0, i - 1);
            for (int i5 = 0; i5 < i; i5++) {
                this.particleOffsets[this.particleIndices[i5]] = i5;
            }
            return this.particleOffsets;
        }

        public void qsort(int i, int i2) {
            if (i >= i2) {
                return;
            }
            if (i2 - i <= 8) {
                for (int i3 = i; i3 <= i2; i3++) {
                    for (int i4 = i3; i4 > i; i4--) {
                        float[] fArr = this.distances;
                        int i5 = i4 - 1;
                        if (fArr[i5] <= fArr[i4]) {
                            break;
                        }
                        float f = fArr[i4];
                        fArr[i4] = fArr[i5];
                        fArr[i5] = f;
                        int[] iArr = this.particleIndices;
                        int i6 = iArr[i4];
                        iArr[i4] = iArr[i5];
                        iArr[i5] = i6;
                    }
                }
                return;
            }
            float f2 = this.distances[i];
            int i7 = i + 1;
            int i8 = this.particleIndices[i];
            int i9 = i7;
            while (i7 <= i2) {
                float[] fArr2 = this.distances;
                if (f2 > fArr2[i7]) {
                    if (i7 > i9) {
                        float f3 = fArr2[i7];
                        fArr2[i7] = fArr2[i9];
                        fArr2[i9] = f3;
                        int[] iArr2 = this.particleIndices;
                        int i10 = iArr2[i7];
                        iArr2[i7] = iArr2[i9];
                        iArr2[i9] = i10;
                    }
                    i9++;
                }
                i7++;
            }
            float[] fArr3 = this.distances;
            int i11 = i9 - 1;
            fArr3[i] = fArr3[i11];
            fArr3[i11] = f2;
            int[] iArr3 = this.particleIndices;
            iArr3[i] = iArr3[i11];
            iArr3[i11] = i8;
            qsort(i, i9 - 2);
            qsort(i9, i2);
        }
    }

    public void setCamera(Camera camera2) {
        this.camera = camera2;
    }
}
