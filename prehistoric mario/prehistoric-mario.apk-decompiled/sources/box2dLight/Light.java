package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.RayCastCallback;
import com.badlogic.gdx.utils.Disposable;

public abstract class Light implements Disposable {
    static final Color DefaultColor = new Color(0.75f, 0.75f, 0.5f, 0.75f);
    static final int MIN_RAYS = 3;
    private static Filter globalFilterA = null;
    static final float zeroColorBits = Color.toFloatBits(0.0f, 0.0f, 0.0f, 0.0f);
    protected boolean active = true;
    protected final Color color = new Color();
    protected float colorF;
    protected boolean culled = false;
    protected float direction;
    protected boolean dirty = true;
    protected float distance;
    protected float[] f;
    private Filter filterA = null;
    protected boolean ignoreBody = false;
    protected Mesh lightMesh;
    protected int m_index = 0;
    protected float[] mx;
    protected float[] my;
    final RayCastCallback ray = new RayCastCallback() {
        /* class box2dLight.Light.AnonymousClass1 */

        @Override // com.badlogic.gdx.physics.box2d.RayCastCallback
        public final float reportRayFixture(Fixture fixture, Vector2 vector2, Vector2 vector22, float f) {
            if (Light.globalFilterA != null && !Light.this.globalContactFilter(fixture)) {
                return -1.0f;
            }
            if (Light.this.filterA != null && !Light.this.contactFilter(fixture)) {
                return -1.0f;
            }
            if (Light.this.ignoreBody && fixture.getBody() == Light.this.getBody()) {
                return -1.0f;
            }
            Light.this.mx[Light.this.m_index] = vector2.x;
            Light.this.my[Light.this.m_index] = vector2.y;
            Light.this.f[Light.this.m_index] = f;
            return f;
        }
    };
    protected RayHandler rayHandler;
    protected int rayNum;
    protected float[] segments;
    protected boolean soft = true;
    protected float softShadowLength = 2.5f;
    protected Mesh softShadowMesh;
    protected boolean staticLight = false;
    protected final Vector2 tmpPosition = new Vector2();
    protected int vertexNum;
    protected boolean xray = false;

    public abstract void attachToBody(Body body);

    public boolean contains(float f2, float f3) {
        return false;
    }

    public abstract Body getBody();

    public abstract float getX();

    public abstract float getY();

    /* access modifiers changed from: package-private */
    public abstract void render();

    public abstract void setDirection(float f2);

    public abstract void setDistance(float f2);

    public abstract void setPosition(float f2, float f3);

    public abstract void setPosition(Vector2 vector2);

    /* access modifiers changed from: package-private */
    public abstract void update();

    public Light(RayHandler rayHandler2, int i, Color color2, float f2, float f3) {
        rayHandler2.lightList.add(this);
        this.rayHandler = rayHandler2;
        setRayNum(i);
        setColor(color2);
        setDistance(f2);
        setDirection(f3);
    }

    public Vector2 getPosition() {
        return this.tmpPosition;
    }

    public void setColor(Color color2) {
        if (color2 != null) {
            this.color.set(color2);
        } else {
            this.color.set(DefaultColor);
        }
        this.colorF = this.color.toFloatBits();
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    public void setColor(float f2, float f3, float f4, float f5) {
        this.color.set(f2, f3, f4, f5);
        this.colorF = this.color.toFloatBits();
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    public void add(RayHandler rayHandler2) {
        this.rayHandler = rayHandler2;
        if (this.active) {
            rayHandler2.lightList.add(this);
        } else {
            rayHandler2.disabledLights.add(this);
        }
    }

    public void remove() {
        remove(true);
    }

    public void remove(boolean z) {
        if (this.active) {
            this.rayHandler.lightList.removeValue(this, false);
        } else {
            this.rayHandler.disabledLights.removeValue(this, false);
        }
        this.rayHandler = null;
        if (z) {
            dispose();
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.lightMesh.dispose();
        this.softShadowMesh.dispose();
    }

    public boolean isActive() {
        return this.active;
    }

    public void setActive(boolean z) {
        if (z != this.active) {
            this.active = z;
            RayHandler rayHandler2 = this.rayHandler;
            if (rayHandler2 != null) {
                if (z) {
                    rayHandler2.lightList.add(this);
                    this.rayHandler.disabledLights.removeValue(this, true);
                    return;
                }
                rayHandler2.disabledLights.add(this);
                this.rayHandler.lightList.removeValue(this, true);
            }
        }
    }

    public boolean isXray() {
        return this.xray;
    }

    public void setXray(boolean z) {
        this.xray = z;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    public boolean isStaticLight() {
        return this.staticLight;
    }

    public void setStaticLight(boolean z) {
        this.staticLight = z;
        if (z) {
            this.dirty = true;
        }
    }

    public boolean isSoft() {
        return this.soft;
    }

    public void setSoft(boolean z) {
        this.soft = z;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    public float getSoftShadowLength() {
        return this.softShadowLength;
    }

    public void setSoftnessLength(float f2) {
        this.softShadowLength = f2;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    public Color getColor() {
        return this.color;
    }

    public float getDistance() {
        return this.distance / RayHandler.gammaCorrectionParameter;
    }

    public void setIgnoreAttachedBody(boolean z) {
        this.ignoreBody = z;
    }

    public boolean getIgnoreAttachedBody() {
        return this.ignoreBody;
    }

    /* access modifiers changed from: package-private */
    public void setRayNum(int i) {
        if (i < 3) {
            i = 3;
        }
        this.rayNum = i;
        this.vertexNum = i + 1;
        int i2 = this.vertexNum;
        this.segments = new float[(i2 * 8)];
        this.mx = new float[i2];
        this.my = new float[i2];
        this.f = new float[i2];
    }

    public int getRayNum() {
        return this.rayNum;
    }

    /* access modifiers changed from: package-private */
    public boolean contactFilter(Fixture fixture) {
        Filter filterData = fixture.getFilterData();
        if (this.filterA.groupIndex == 0 || this.filterA.groupIndex != filterData.groupIndex) {
            if ((this.filterA.maskBits & filterData.categoryBits) != 0) {
                if ((filterData.maskBits & this.filterA.categoryBits) != 0) {
                    return true;
                }
            }
            return false;
        } else if (this.filterA.groupIndex > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void setContactFilter(Filter filter) {
        this.filterA = filter;
    }

    public void setContactFilter(short s, short s2, short s3) {
        this.filterA = new Filter();
        Filter filter = this.filterA;
        filter.categoryBits = s;
        filter.groupIndex = s2;
        filter.maskBits = s3;
    }

    /* access modifiers changed from: package-private */
    public boolean globalContactFilter(Fixture fixture) {
        Filter filterData = fixture.getFilterData();
        if (globalFilterA.groupIndex == 0 || globalFilterA.groupIndex != filterData.groupIndex) {
            if ((globalFilterA.maskBits & filterData.categoryBits) != 0) {
                if ((filterData.maskBits & globalFilterA.categoryBits) != 0) {
                    return true;
                }
            }
            return false;
        } else if (globalFilterA.groupIndex > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static void setGlobalContactFilter(Filter filter) {
        globalFilterA = filter;
    }

    public static void setGlobalContactFilter(short s, short s2, short s3) {
        globalFilterA = new Filter();
        Filter filter = globalFilterA;
        filter.categoryBits = s;
        filter.groupIndex = s2;
        filter.maskBits = s3;
    }
}
