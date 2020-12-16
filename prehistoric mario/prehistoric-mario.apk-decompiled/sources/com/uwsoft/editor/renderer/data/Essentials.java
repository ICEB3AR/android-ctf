package com.uwsoft.editor.renderer.data;

import box2dLight.RayHandler;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;

public class Essentials {
    public boolean physicsStopped = false;
    public RayHandler rayHandler;
    public IResourceRetriever rm;
    public SpineReflectionHelper spineReflectionHelper;
    public World world;
}
