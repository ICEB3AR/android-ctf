package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Sort;

public class SimpleOrthoGroupStrategy implements GroupStrategy {
    private static final int GROUP_BLEND = 1;
    private static final int GROUP_OPAQUE = 0;
    private Comparator comparator = new Comparator();

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public ShaderProgram getGroupShader(int i) {
        return null;
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public int decideGroup(Decal decal) {
        return !decal.getMaterial().isOpaque();
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void beforeGroup(int i, Array<Decal> array) {
        if (i == 1) {
            Sort.instance().sort(array, this.comparator);
            Gdx.gl.glEnable(GL20.GL_BLEND);
            Gdx.gl.glDepthMask(false);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void afterGroup(int i) {
        if (i == 1) {
            Gdx.gl.glDepthMask(true);
            Gdx.gl.glDisable(GL20.GL_BLEND);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void beforeGroups() {
        Gdx.gl.glEnable(GL20.GL_TEXTURE_2D);
    }

    @Override // com.badlogic.gdx.graphics.g3d.decals.GroupStrategy
    public void afterGroups() {
        Gdx.gl.glDisable(GL20.GL_TEXTURE_2D);
    }

    class Comparator implements java.util.Comparator<Decal> {
        Comparator() {
        }

        public int compare(Decal decal, Decal decal2) {
            if (decal.getZ() == decal2.getZ()) {
                return 0;
            }
            return decal.getZ() - decal2.getZ() < 0.0f ? -1 : 1;
        }
    }
}
