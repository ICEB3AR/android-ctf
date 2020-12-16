package com.brashmonkey.spriter;

public class IKObject extends Point {
    int chainLength;
    int iterations;

    public IKObject(float f, float f2, int i, int i2) {
        super(f, f2);
        setLength(i);
        setIterations(i2);
    }

    public IKObject setLength(int i) {
        if (i >= 0) {
            this.chainLength = i;
            return this;
        }
        throw new SpriterException("The chain has to be at least 0!");
    }

    public IKObject setIterations(int i) {
        if (i >= 0) {
            this.iterations = i;
            return this;
        }
        throw new SpriterException("The number of iterations has to be at least 1!");
    }

    public int getChainLength() {
        return this.chainLength;
    }

    public int getIterations() {
        return this.iterations;
    }
}
