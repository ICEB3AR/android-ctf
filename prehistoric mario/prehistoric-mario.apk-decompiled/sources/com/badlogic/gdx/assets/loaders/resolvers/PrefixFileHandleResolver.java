package com.badlogic.gdx.assets.loaders.resolvers;

import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class PrefixFileHandleResolver implements FileHandleResolver {
    private FileHandleResolver baseResolver;
    private String prefix;

    public PrefixFileHandleResolver(FileHandleResolver fileHandleResolver, String str) {
        this.baseResolver = fileHandleResolver;
        this.prefix = str;
    }

    public void setBaseResolver(FileHandleResolver fileHandleResolver) {
        this.baseResolver = fileHandleResolver;
    }

    public FileHandleResolver getBaseResolver() {
        return this.baseResolver;
    }

    public void setPrefix(String str) {
        this.prefix = str;
    }

    public String getPrefix() {
        return this.prefix;
    }

    @Override // com.badlogic.gdx.assets.loaders.FileHandleResolver
    public FileHandle resolve(String str) {
        FileHandleResolver fileHandleResolver = this.baseResolver;
        return fileHandleResolver.resolve(this.prefix + str);
    }
}
