package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.JointDef;
import com.badlogic.gdx.physics.box2d.Shape;
import com.badlogic.gdx.physics.box2d.joints.PulleyJoint;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class Box2DDebugRenderer implements Disposable {
    private static Vector2 axis = new Vector2();
    private static final Array<Body> bodies = new Array<>();
    private static final Array<Joint> joints = new Array<>();
    private static final Vector2 lower = new Vector2();
    private static Vector2 t = new Vector2();
    private static final Vector2 upper = new Vector2();
    private static final Vector2[] vertices = new Vector2[1000];
    public final Color AABB_COLOR;
    public final Color JOINT_COLOR;
    public final Color SHAPE_AWAKE;
    public final Color SHAPE_KINEMATIC;
    public final Color SHAPE_NOT_ACTIVE;
    public final Color SHAPE_NOT_AWAKE;
    public final Color SHAPE_STATIC;
    public final Color VELOCITY_COLOR;
    private boolean drawAABBs;
    private boolean drawBodies;
    private boolean drawContacts;
    private boolean drawInactiveBodies;
    private boolean drawJoints;
    private boolean drawVelocities;
    private final Vector2 f;
    private final Vector2 lv;
    protected ShapeRenderer renderer;
    private final Vector2 v;

    public Box2DDebugRenderer() {
        this(true, true, false, true, false, true);
    }

    public Box2DDebugRenderer(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6) {
        this.SHAPE_NOT_ACTIVE = new Color(0.5f, 0.5f, 0.3f, 1.0f);
        this.SHAPE_STATIC = new Color(0.5f, 0.9f, 0.5f, 1.0f);
        this.SHAPE_KINEMATIC = new Color(0.5f, 0.5f, 0.9f, 1.0f);
        this.SHAPE_NOT_AWAKE = new Color(0.6f, 0.6f, 0.6f, 1.0f);
        this.SHAPE_AWAKE = new Color(0.9f, 0.7f, 0.7f, 1.0f);
        this.JOINT_COLOR = new Color(0.5f, 0.8f, 0.8f, 1.0f);
        this.AABB_COLOR = new Color(1.0f, 0.0f, 1.0f, 1.0f);
        this.VELOCITY_COLOR = new Color(1.0f, 0.0f, 0.0f, 1.0f);
        this.f = new Vector2();
        this.v = new Vector2();
        this.lv = new Vector2();
        this.renderer = new ShapeRenderer();
        int i = 0;
        while (true) {
            Vector2[] vector2Arr = vertices;
            if (i < vector2Arr.length) {
                vector2Arr[i] = new Vector2();
                i++;
            } else {
                this.drawBodies = z;
                this.drawJoints = z2;
                this.drawAABBs = z3;
                this.drawInactiveBodies = z4;
                this.drawVelocities = z5;
                this.drawContacts = z6;
                return;
            }
        }
    }

    public void render(World world, Matrix4 matrix4) {
        this.renderer.setProjectionMatrix(matrix4);
        renderBodies(world);
    }

    private void renderBodies(World world) {
        this.renderer.begin(ShapeRenderer.ShapeType.Line);
        if (this.drawBodies || this.drawAABBs) {
            world.getBodies(bodies);
            Iterator<Body> it = bodies.iterator();
            while (it.hasNext()) {
                Body next = it.next();
                if (next.isActive() || this.drawInactiveBodies) {
                    renderBody(next);
                }
            }
        }
        if (this.drawJoints) {
            world.getJoints(joints);
            Iterator<Joint> it2 = joints.iterator();
            while (it2.hasNext()) {
                drawJoint(it2.next());
            }
        }
        this.renderer.end();
        if (this.drawContacts) {
            this.renderer.begin(ShapeRenderer.ShapeType.Point);
            Iterator<Contact> it3 = world.getContactList().iterator();
            while (it3.hasNext()) {
                drawContact(it3.next());
            }
            this.renderer.end();
        }
    }

    /* access modifiers changed from: protected */
    public void renderBody(Body body) {
        Transform transform = body.getTransform();
        Iterator<Fixture> it = body.getFixtureList().iterator();
        while (it.hasNext()) {
            Fixture next = it.next();
            if (this.drawBodies) {
                drawShape(next, transform, getColorByBody(body));
                if (this.drawVelocities) {
                    Vector2 position = body.getPosition();
                    drawSegment(position, body.getLinearVelocity().add(position), this.VELOCITY_COLOR);
                }
            }
            if (this.drawAABBs) {
                drawAABB(next, transform);
            }
        }
    }

    private Color getColorByBody(Body body) {
        if (!body.isActive()) {
            return this.SHAPE_NOT_ACTIVE;
        }
        if (body.getType() == BodyDef.BodyType.StaticBody) {
            return this.SHAPE_STATIC;
        }
        if (body.getType() == BodyDef.BodyType.KinematicBody) {
            return this.SHAPE_KINEMATIC;
        }
        if (!body.isAwake()) {
            return this.SHAPE_NOT_AWAKE;
        }
        return this.SHAPE_AWAKE;
    }

    private void drawAABB(Fixture fixture, Transform transform) {
        if (fixture.getType() == Shape.Type.Circle) {
            CircleShape circleShape = (CircleShape) fixture.getShape();
            float radius = circleShape.getRadius();
            vertices[0].set(circleShape.getPosition());
            transform.mul(vertices[0]);
            lower.set(vertices[0].x - radius, vertices[0].y - radius);
            upper.set(vertices[0].x + radius, vertices[0].y + radius);
            vertices[0].set(lower.x, lower.y);
            vertices[1].set(upper.x, lower.y);
            vertices[2].set(upper.x, upper.y);
            vertices[3].set(lower.x, upper.y);
            drawSolidPolygon(vertices, 4, this.AABB_COLOR, true);
        } else if (fixture.getType() == Shape.Type.Polygon) {
            PolygonShape polygonShape = (PolygonShape) fixture.getShape();
            int vertexCount = polygonShape.getVertexCount();
            polygonShape.getVertex(0, vertices[0]);
            lower.set(transform.mul(vertices[0]));
            upper.set(lower);
            for (int i = 1; i < vertexCount; i++) {
                polygonShape.getVertex(i, vertices[i]);
                transform.mul(vertices[i]);
                Vector2 vector2 = lower;
                vector2.x = Math.min(vector2.x, vertices[i].x);
                Vector2 vector22 = lower;
                vector22.y = Math.min(vector22.y, vertices[i].y);
                Vector2 vector23 = upper;
                vector23.x = Math.max(vector23.x, vertices[i].x);
                Vector2 vector24 = upper;
                vector24.y = Math.max(vector24.y, vertices[i].y);
            }
            vertices[0].set(lower.x, lower.y);
            vertices[1].set(upper.x, lower.y);
            vertices[2].set(upper.x, upper.y);
            vertices[3].set(lower.x, upper.y);
            drawSolidPolygon(vertices, 4, this.AABB_COLOR, true);
        }
    }

    private void drawShape(Fixture fixture, Transform transform, Color color) {
        if (fixture.getType() == Shape.Type.Circle) {
            CircleShape circleShape = (CircleShape) fixture.getShape();
            t.set(circleShape.getPosition());
            transform.mul(t);
            drawSolidCircle(t, circleShape.getRadius(), axis.set(transform.vals[2], transform.vals[3]), color);
            return;
        }
        if (fixture.getType() == Shape.Type.Edge) {
            EdgeShape edgeShape = (EdgeShape) fixture.getShape();
            edgeShape.getVertex1(vertices[0]);
            edgeShape.getVertex2(vertices[1]);
            transform.mul(vertices[0]);
            transform.mul(vertices[1]);
            drawSolidPolygon(vertices, 2, color, true);
        } else if (fixture.getType() == Shape.Type.Polygon) {
            PolygonShape polygonShape = (PolygonShape) fixture.getShape();
            int vertexCount = polygonShape.getVertexCount();
            for (int i = 0; i < vertexCount; i++) {
                polygonShape.getVertex(i, vertices[i]);
                transform.mul(vertices[i]);
            }
            drawSolidPolygon(vertices, vertexCount, color, true);
        } else if (fixture.getType() == Shape.Type.Chain) {
            ChainShape chainShape = (ChainShape) fixture.getShape();
            int vertexCount2 = chainShape.getVertexCount();
            for (int i2 = 0; i2 < vertexCount2; i2++) {
                chainShape.getVertex(i2, vertices[i2]);
                transform.mul(vertices[i2]);
            }
            drawSolidPolygon(vertices, vertexCount2, color, false);
        }
    }

    private void drawSolidCircle(Vector2 vector2, float f2, Vector2 vector22, Color color) {
        this.renderer.setColor(color.r, color.g, color.b, color.a);
        float f3 = 0.0f;
        int i = 0;
        while (i < 20) {
            double d = (double) f3;
            this.v.set((((float) Math.cos(d)) * f2) + vector2.x, (((float) Math.sin(d)) * f2) + vector2.y);
            if (i == 0) {
                this.lv.set(this.v);
                this.f.set(this.v);
            } else {
                this.renderer.line(this.lv.x, this.lv.y, this.v.x, this.v.y);
                this.lv.set(this.v);
            }
            i++;
            f3 += 0.31415927f;
        }
        this.renderer.line(this.f.x, this.f.y, this.lv.x, this.lv.y);
        this.renderer.line(vector2.x, vector2.y, 0.0f, vector2.x + (vector22.x * f2), vector2.y + (vector22.y * f2), 0.0f);
    }

    private void drawSolidPolygon(Vector2[] vector2Arr, int i, Color color, boolean z) {
        this.renderer.setColor(color.r, color.g, color.b, color.a);
        this.lv.set(vector2Arr[0]);
        this.f.set(vector2Arr[0]);
        for (int i2 = 1; i2 < i; i2++) {
            Vector2 vector2 = vector2Arr[i2];
            this.renderer.line(this.lv.x, this.lv.y, vector2.x, vector2.y);
            this.lv.set(vector2);
        }
        if (z) {
            this.renderer.line(this.f.x, this.f.y, this.lv.x, this.lv.y);
        }
    }

    private void drawJoint(Joint joint) {
        Body bodyA = joint.getBodyA();
        Body bodyB = joint.getBodyB();
        Transform transform = bodyA.getTransform();
        Transform transform2 = bodyB.getTransform();
        Vector2 position = transform.getPosition();
        Vector2 position2 = transform2.getPosition();
        Vector2 anchorA = joint.getAnchorA();
        Vector2 anchorB = joint.getAnchorB();
        if (joint.getType() == JointDef.JointType.DistanceJoint) {
            drawSegment(anchorA, anchorB, this.JOINT_COLOR);
        } else if (joint.getType() == JointDef.JointType.PulleyJoint) {
            PulleyJoint pulleyJoint = (PulleyJoint) joint;
            Vector2 groundAnchorA = pulleyJoint.getGroundAnchorA();
            Vector2 groundAnchorB = pulleyJoint.getGroundAnchorB();
            drawSegment(groundAnchorA, anchorA, this.JOINT_COLOR);
            drawSegment(groundAnchorB, anchorB, this.JOINT_COLOR);
            drawSegment(groundAnchorA, groundAnchorB, this.JOINT_COLOR);
        } else if (joint.getType() == JointDef.JointType.MouseJoint) {
            drawSegment(joint.getAnchorA(), joint.getAnchorB(), this.JOINT_COLOR);
        } else {
            drawSegment(position, anchorA, this.JOINT_COLOR);
            drawSegment(anchorA, anchorB, this.JOINT_COLOR);
            drawSegment(position2, anchorB, this.JOINT_COLOR);
        }
    }

    private void drawSegment(Vector2 vector2, Vector2 vector22, Color color) {
        this.renderer.setColor(color);
        this.renderer.line(vector2.x, vector2.y, vector22.x, vector22.y);
    }

    private void drawContact(Contact contact) {
        WorldManifold worldManifold = contact.getWorldManifold();
        if (worldManifold.getNumberOfContactPoints() != 0) {
            Vector2 vector2 = worldManifold.getPoints()[0];
            this.renderer.setColor(getColorByBody(contact.getFixtureA().getBody()));
            this.renderer.point(vector2.x, vector2.y, 0.0f);
        }
    }

    public boolean isDrawBodies() {
        return this.drawBodies;
    }

    public void setDrawBodies(boolean z) {
        this.drawBodies = z;
    }

    public boolean isDrawJoints() {
        return this.drawJoints;
    }

    public void setDrawJoints(boolean z) {
        this.drawJoints = z;
    }

    public boolean isDrawAABBs() {
        return this.drawAABBs;
    }

    public void setDrawAABBs(boolean z) {
        this.drawAABBs = z;
    }

    public boolean isDrawInactiveBodies() {
        return this.drawInactiveBodies;
    }

    public void setDrawInactiveBodies(boolean z) {
        this.drawInactiveBodies = z;
    }

    public boolean isDrawVelocities() {
        return this.drawVelocities;
    }

    public void setDrawVelocities(boolean z) {
        this.drawVelocities = z;
    }

    public boolean isDrawContacts() {
        return this.drawContacts;
    }

    public void setDrawContacts(boolean z) {
        this.drawContacts = z;
    }

    public static Vector2 getAxis() {
        return axis;
    }

    public static void setAxis(Vector2 vector2) {
        axis = vector2;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.renderer.dispose();
    }
}
