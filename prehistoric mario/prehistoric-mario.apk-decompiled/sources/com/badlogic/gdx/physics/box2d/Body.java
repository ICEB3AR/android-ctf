package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.utils.Array;

public class Body {
    protected long addr;
    private Array<Fixture> fixtures = new Array<>(2);
    protected Array<JointEdge> joints = new Array<>(2);
    public final Vector2 linVelLoc = new Vector2();
    public final Vector2 linVelWorld = new Vector2();
    private final Vector2 linearVelocity = new Vector2();
    private final Vector2 localCenter = new Vector2();
    private final Vector2 localPoint = new Vector2();
    public final Vector2 localPoint2 = new Vector2();
    public final Vector2 localVector = new Vector2();
    private final MassData massData = new MassData();
    private final Vector2 position = new Vector2();
    private final float[] tmp = new float[4];
    private final Transform transform = new Transform();
    private Object userData;
    private final World world;
    private final Vector2 worldCenter = new Vector2();
    private final Vector2 worldVector = new Vector2();

    private native void jniApplyAngularImpulse(long j, float f, boolean z);

    private native void jniApplyForce(long j, float f, float f2, float f3, float f4, boolean z);

    private native void jniApplyForceToCenter(long j, float f, float f2, boolean z);

    private native void jniApplyLinearImpulse(long j, float f, float f2, float f3, float f4, boolean z);

    private native void jniApplyTorque(long j, float f, boolean z);

    private native long jniCreateFixture(long j, long j2, float f);

    private native long jniCreateFixture(long j, long j2, float f, float f2, float f3, boolean z, short s, short s2, short s3);

    private native float jniGetAngle(long j);

    private native float jniGetAngularDamping(long j);

    private native float jniGetAngularVelocity(long j);

    private native float jniGetGravityScale(long j);

    private native float jniGetInertia(long j);

    private native float jniGetLinearDamping(long j);

    private native void jniGetLinearVelocity(long j, float[] fArr);

    private native void jniGetLinearVelocityFromLocalPoint(long j, float f, float f2, float[] fArr);

    private native void jniGetLinearVelocityFromWorldPoint(long j, float f, float f2, float[] fArr);

    private native void jniGetLocalCenter(long j, float[] fArr);

    private native void jniGetLocalPoint(long j, float f, float f2, float[] fArr);

    private native void jniGetLocalVector(long j, float f, float f2, float[] fArr);

    private native float jniGetMass(long j);

    private native void jniGetMassData(long j, float[] fArr);

    private native void jniGetPosition(long j, float[] fArr);

    private native void jniGetTransform(long j, float[] fArr);

    private native int jniGetType(long j);

    private native void jniGetWorldCenter(long j, float[] fArr);

    private native void jniGetWorldPoint(long j, float f, float f2, float[] fArr);

    private native void jniGetWorldVector(long j, float f, float f2, float[] fArr);

    private native boolean jniIsActive(long j);

    private native boolean jniIsAwake(long j);

    private native boolean jniIsBullet(long j);

    private native boolean jniIsFixedRotation(long j);

    private native boolean jniIsSleepingAllowed(long j);

    private native void jniResetMassData(long j);

    private native void jniSetActive(long j, boolean z);

    private native void jniSetAngularDamping(long j, float f);

    private native void jniSetAngularVelocity(long j, float f);

    private native void jniSetAwake(long j, boolean z);

    private native void jniSetBullet(long j, boolean z);

    private native void jniSetFixedRotation(long j, boolean z);

    private native void jniSetGravityScale(long j, float f);

    private native void jniSetLinearDamping(long j, float f);

    private native void jniSetLinearVelocity(long j, float f, float f2);

    private native void jniSetMassData(long j, float f, float f2, float f3, float f4);

    private native void jniSetSleepingAllowed(long j, boolean z);

    private native void jniSetTransform(long j, float f, float f2, float f3);

    private native void jniSetType(long j, int i);

    protected Body(World world2, long j) {
        this.world = world2;
        this.addr = j;
    }

    /* access modifiers changed from: protected */
    public void reset(long j) {
        this.addr = j;
        this.userData = null;
        for (int i = 0; i < this.fixtures.size; i++) {
            this.world.freeFixtures.free(this.fixtures.get(i));
        }
        this.fixtures.clear();
        this.joints.clear();
    }

    public Fixture createFixture(FixtureDef fixtureDef) {
        long jniCreateFixture = jniCreateFixture(this.addr, fixtureDef.shape.addr, fixtureDef.friction, fixtureDef.restitution, fixtureDef.density, fixtureDef.isSensor, fixtureDef.filter.categoryBits, fixtureDef.filter.maskBits, fixtureDef.filter.groupIndex);
        Fixture obtain = this.world.freeFixtures.obtain();
        obtain.reset(this, jniCreateFixture);
        this.world.fixtures.put(obtain.addr, obtain);
        this.fixtures.add(obtain);
        return obtain;
    }

    public Fixture createFixture(Shape shape, float f) {
        long jniCreateFixture = jniCreateFixture(this.addr, shape.addr, f);
        Fixture obtain = this.world.freeFixtures.obtain();
        obtain.reset(this, jniCreateFixture);
        this.world.fixtures.put(obtain.addr, obtain);
        this.fixtures.add(obtain);
        return obtain;
    }

    public void destroyFixture(Fixture fixture) {
        this.world.destroyFixture(this, fixture);
        fixture.setUserData(null);
        this.world.fixtures.remove(fixture.addr);
        this.fixtures.removeValue(fixture, true);
        this.world.freeFixtures.free(fixture);
    }

    public void setTransform(Vector2 vector2, float f) {
        jniSetTransform(this.addr, vector2.x, vector2.y, f);
    }

    public void setTransform(float f, float f2, float f3) {
        jniSetTransform(this.addr, f, f2, f3);
    }

    public Transform getTransform() {
        jniGetTransform(this.addr, this.transform.vals);
        return this.transform;
    }

    public Vector2 getPosition() {
        jniGetPosition(this.addr, this.tmp);
        Vector2 vector2 = this.position;
        float[] fArr = this.tmp;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
        return vector2;
    }

    public float getAngle() {
        return jniGetAngle(this.addr);
    }

    public Vector2 getWorldCenter() {
        jniGetWorldCenter(this.addr, this.tmp);
        Vector2 vector2 = this.worldCenter;
        float[] fArr = this.tmp;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
        return vector2;
    }

    public Vector2 getLocalCenter() {
        jniGetLocalCenter(this.addr, this.tmp);
        Vector2 vector2 = this.localCenter;
        float[] fArr = this.tmp;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
        return vector2;
    }

    public void setLinearVelocity(Vector2 vector2) {
        jniSetLinearVelocity(this.addr, vector2.x, vector2.y);
    }

    public void setLinearVelocity(float f, float f2) {
        jniSetLinearVelocity(this.addr, f, f2);
    }

    public Vector2 getLinearVelocity() {
        jniGetLinearVelocity(this.addr, this.tmp);
        Vector2 vector2 = this.linearVelocity;
        float[] fArr = this.tmp;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
        return vector2;
    }

    public void setAngularVelocity(float f) {
        jniSetAngularVelocity(this.addr, f);
    }

    public float getAngularVelocity() {
        return jniGetAngularVelocity(this.addr);
    }

    public void applyForce(Vector2 vector2, Vector2 vector22, boolean z) {
        jniApplyForce(this.addr, vector2.x, vector2.y, vector22.x, vector22.y, z);
    }

    public void applyForce(float f, float f2, float f3, float f4, boolean z) {
        jniApplyForce(this.addr, f, f2, f3, f4, z);
    }

    public void applyForceToCenter(Vector2 vector2, boolean z) {
        jniApplyForceToCenter(this.addr, vector2.x, vector2.y, z);
    }

    public void applyForceToCenter(float f, float f2, boolean z) {
        jniApplyForceToCenter(this.addr, f, f2, z);
    }

    public void applyTorque(float f, boolean z) {
        jniApplyTorque(this.addr, f, z);
    }

    public void applyLinearImpulse(Vector2 vector2, Vector2 vector22, boolean z) {
        jniApplyLinearImpulse(this.addr, vector2.x, vector2.y, vector22.x, vector22.y, z);
    }

    public void applyLinearImpulse(float f, float f2, float f3, float f4, boolean z) {
        jniApplyLinearImpulse(this.addr, f, f2, f3, f4, z);
    }

    public void applyAngularImpulse(float f, boolean z) {
        jniApplyAngularImpulse(this.addr, f, z);
    }

    public float getMass() {
        return jniGetMass(this.addr);
    }

    public float getInertia() {
        return jniGetInertia(this.addr);
    }

    public MassData getMassData() {
        jniGetMassData(this.addr, this.tmp);
        MassData massData2 = this.massData;
        massData2.mass = this.tmp[0];
        massData2.center.x = this.tmp[1];
        Vector2 vector2 = this.massData.center;
        float[] fArr = this.tmp;
        vector2.y = fArr[2];
        MassData massData3 = this.massData;
        massData3.I = fArr[3];
        return massData3;
    }

    public void setMassData(MassData massData2) {
        jniSetMassData(this.addr, massData2.mass, massData2.center.x, massData2.center.y, massData2.I);
    }

    public void resetMassData() {
        jniResetMassData(this.addr);
    }

    public Vector2 getWorldPoint(Vector2 vector2) {
        jniGetWorldPoint(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.localPoint;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public Vector2 getWorldVector(Vector2 vector2) {
        jniGetWorldVector(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.worldVector;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public Vector2 getLocalPoint(Vector2 vector2) {
        jniGetLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.localPoint2;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public Vector2 getLocalVector(Vector2 vector2) {
        jniGetLocalVector(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.localVector;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public Vector2 getLinearVelocityFromWorldPoint(Vector2 vector2) {
        jniGetLinearVelocityFromWorldPoint(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.linVelWorld;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public Vector2 getLinearVelocityFromLocalPoint(Vector2 vector2) {
        jniGetLinearVelocityFromLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        Vector2 vector22 = this.linVelLoc;
        float[] fArr = this.tmp;
        vector22.x = fArr[0];
        vector22.y = fArr[1];
        return vector22;
    }

    public float getLinearDamping() {
        return jniGetLinearDamping(this.addr);
    }

    public void setLinearDamping(float f) {
        jniSetLinearDamping(this.addr, f);
    }

    public float getAngularDamping() {
        return jniGetAngularDamping(this.addr);
    }

    public void setAngularDamping(float f) {
        jniSetAngularDamping(this.addr, f);
    }

    public void setType(BodyDef.BodyType bodyType) {
        jniSetType(this.addr, bodyType.getValue());
    }

    public BodyDef.BodyType getType() {
        int jniGetType = jniGetType(this.addr);
        if (jniGetType == 0) {
            return BodyDef.BodyType.StaticBody;
        }
        if (jniGetType == 1) {
            return BodyDef.BodyType.KinematicBody;
        }
        if (jniGetType == 2) {
            return BodyDef.BodyType.DynamicBody;
        }
        return BodyDef.BodyType.StaticBody;
    }

    public void setBullet(boolean z) {
        jniSetBullet(this.addr, z);
    }

    public boolean isBullet() {
        return jniIsBullet(this.addr);
    }

    public void setSleepingAllowed(boolean z) {
        jniSetSleepingAllowed(this.addr, z);
    }

    public boolean isSleepingAllowed() {
        return jniIsSleepingAllowed(this.addr);
    }

    public void setAwake(boolean z) {
        jniSetAwake(this.addr, z);
    }

    public boolean isAwake() {
        return jniIsAwake(this.addr);
    }

    public void setActive(boolean z) {
        if (z) {
            jniSetActive(this.addr, z);
        } else {
            this.world.deactivateBody(this);
        }
    }

    public boolean isActive() {
        return jniIsActive(this.addr);
    }

    public void setFixedRotation(boolean z) {
        jniSetFixedRotation(this.addr, z);
    }

    public boolean isFixedRotation() {
        return jniIsFixedRotation(this.addr);
    }

    public Array<Fixture> getFixtureList() {
        return this.fixtures;
    }

    public Array<JointEdge> getJointList() {
        return this.joints;
    }

    public float getGravityScale() {
        return jniGetGravityScale(this.addr);
    }

    public void setGravityScale(float f) {
        jniSetGravityScale(this.addr, f);
    }

    public World getWorld() {
        return this.world;
    }

    public Object getUserData() {
        return this.userData;
    }

    public void setUserData(Object obj) {
        this.userData = obj;
    }
}
