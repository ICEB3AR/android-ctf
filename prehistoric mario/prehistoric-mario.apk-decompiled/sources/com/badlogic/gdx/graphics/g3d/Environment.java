package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.g3d.attributes.DirectionalLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.PointLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.SpotLightsAttribute;
import com.badlogic.gdx.graphics.g3d.environment.BaseLight;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.graphics.g3d.environment.ShadowMap;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class Environment extends Attributes {
    public ShadowMap shadowMap;

    public Environment add(BaseLight... baseLightArr) {
        for (BaseLight baseLight : baseLightArr) {
            add(baseLight);
        }
        return this;
    }

    public Environment add(Array<BaseLight> array) {
        Iterator<BaseLight> it = array.iterator();
        while (it.hasNext()) {
            add(it.next());
        }
        return this;
    }

    public Environment add(BaseLight baseLight) {
        if (baseLight instanceof DirectionalLight) {
            add((DirectionalLight) baseLight);
        } else if (baseLight instanceof PointLight) {
            add((PointLight) baseLight);
        } else if (baseLight instanceof SpotLight) {
            add((SpotLight) baseLight);
        } else {
            throw new GdxRuntimeException("Unknown light type");
        }
        return this;
    }

    public Environment add(DirectionalLight directionalLight) {
        DirectionalLightsAttribute directionalLightsAttribute = (DirectionalLightsAttribute) get(DirectionalLightsAttribute.Type);
        if (directionalLightsAttribute == null) {
            directionalLightsAttribute = new DirectionalLightsAttribute();
            set(directionalLightsAttribute);
        }
        directionalLightsAttribute.lights.add(directionalLight);
        return this;
    }

    public Environment add(PointLight pointLight) {
        PointLightsAttribute pointLightsAttribute = (PointLightsAttribute) get(PointLightsAttribute.Type);
        if (pointLightsAttribute == null) {
            pointLightsAttribute = new PointLightsAttribute();
            set(pointLightsAttribute);
        }
        pointLightsAttribute.lights.add(pointLight);
        return this;
    }

    public Environment add(SpotLight spotLight) {
        SpotLightsAttribute spotLightsAttribute = (SpotLightsAttribute) get(SpotLightsAttribute.Type);
        if (spotLightsAttribute == null) {
            spotLightsAttribute = new SpotLightsAttribute();
            set(spotLightsAttribute);
        }
        spotLightsAttribute.lights.add(spotLight);
        return this;
    }

    public Environment remove(BaseLight... baseLightArr) {
        for (BaseLight baseLight : baseLightArr) {
            remove(baseLight);
        }
        return this;
    }

    public Environment remove(Array<BaseLight> array) {
        Iterator<BaseLight> it = array.iterator();
        while (it.hasNext()) {
            remove(it.next());
        }
        return this;
    }

    public Environment remove(BaseLight baseLight) {
        if (baseLight instanceof DirectionalLight) {
            remove((DirectionalLight) baseLight);
        } else if (baseLight instanceof PointLight) {
            remove((PointLight) baseLight);
        } else if (baseLight instanceof SpotLight) {
            remove((SpotLight) baseLight);
        } else {
            throw new GdxRuntimeException("Unknown light type");
        }
        return this;
    }

    public Environment remove(DirectionalLight directionalLight) {
        if (has(DirectionalLightsAttribute.Type)) {
            DirectionalLightsAttribute directionalLightsAttribute = (DirectionalLightsAttribute) get(DirectionalLightsAttribute.Type);
            directionalLightsAttribute.lights.removeValue(directionalLight, false);
            if (directionalLightsAttribute.lights.size == 0) {
                remove(DirectionalLightsAttribute.Type);
            }
        }
        return this;
    }

    public Environment remove(PointLight pointLight) {
        if (has(PointLightsAttribute.Type)) {
            PointLightsAttribute pointLightsAttribute = (PointLightsAttribute) get(PointLightsAttribute.Type);
            pointLightsAttribute.lights.removeValue(pointLight, false);
            if (pointLightsAttribute.lights.size == 0) {
                remove(PointLightsAttribute.Type);
            }
        }
        return this;
    }

    public Environment remove(SpotLight spotLight) {
        if (has(SpotLightsAttribute.Type)) {
            SpotLightsAttribute spotLightsAttribute = (SpotLightsAttribute) get(SpotLightsAttribute.Type);
            spotLightsAttribute.lights.removeValue(spotLight, false);
            if (spotLightsAttribute.lights.size == 0) {
                remove(SpotLightsAttribute.Type);
            }
        }
        return this;
    }
}
