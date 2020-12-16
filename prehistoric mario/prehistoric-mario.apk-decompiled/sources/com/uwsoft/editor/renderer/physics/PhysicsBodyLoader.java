package com.uwsoft.editor.renderer.physics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.FixtureDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.data.MeshVO;
import com.uwsoft.editor.renderer.data.PhysicsBodyDataVO;

public class PhysicsBodyLoader {
    public static float SCALE = (10.0f / ((float) Gdx.graphics.getWidth()));
    private final World world;

    public PhysicsBodyLoader(World world2) {
        this.world = world2;
    }

    public Body createBody(PhysicsBodyDataVO physicsBodyDataVO, MeshVO meshVO, Vector2 vector2) {
        return createBody(this.world, physicsBodyDataVO, meshVO, vector2);
    }

    public static Body createBody(World world2, PhysicsBodyDataVO physicsBodyDataVO, MeshVO meshVO, Vector2 vector2) {
        FixtureDef fixtureDef = new FixtureDef();
        if (physicsBodyDataVO != null) {
            fixtureDef.density = physicsBodyDataVO.density;
            fixtureDef.friction = physicsBodyDataVO.friction;
            fixtureDef.restitution = physicsBodyDataVO.restitution;
        }
        BodyDef bodyDef = new BodyDef();
        bodyDef.position.set(0.0f, 0.0f);
        if (physicsBodyDataVO.bodyType == 0) {
            bodyDef.type = BodyDef.BodyType.StaticBody;
        } else if (physicsBodyDataVO.bodyType == 1) {
            bodyDef.type = BodyDef.BodyType.KinematicBody;
        } else {
            bodyDef.type = BodyDef.BodyType.DynamicBody;
        }
        Body createBody = world2.createBody(bodyDef);
        PolygonShape polygonShape = new PolygonShape();
        for (int i = 0; i < meshVO.minPolygonData.length; i++) {
            float[] fArr = new float[(meshVO.minPolygonData[i].length * 2)];
            for (int i2 = 0; i2 < fArr.length; i2 += 2) {
                int i3 = i2 / 2;
                fArr[i2] = meshVO.minPolygonData[i][i3].x * vector2.x * SCALE;
                fArr[i2 + 1] = meshVO.minPolygonData[i][i3].y * vector2.y * SCALE;
            }
            polygonShape.set(fArr);
            fixtureDef.shape = polygonShape;
            createBody.createFixture(fixtureDef);
        }
        return createBody;
    }
}
