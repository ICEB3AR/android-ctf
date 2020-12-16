package com.alles.platformer;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class LocalFileResolver implements FileHandleResolver {
    @Override // com.badlogic.gdx.assets.loaders.FileHandleResolver
    public FileHandle resolve(String str) {
        if (str.contains("map_flag.tmx")) {
            return Gdx.files.local("map_flag.tmx");
        }
        if (str.contains("tileSet")) {
            return Gdx.files.internal("tileSet.png");
        }
        return null;
    }
}
