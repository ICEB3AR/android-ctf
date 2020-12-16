package com.badlogic.gdx.assets.loaders.resolvers;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;

public class ResolutionFileResolver implements FileHandleResolver {
    protected final FileHandleResolver baseResolver;
    protected final Resolution[] descriptors;

    public static class Resolution {
        public final String folder;
        public final int portraitHeight;
        public final int portraitWidth;

        public Resolution(int i, int i2, String str) {
            this.portraitWidth = i;
            this.portraitHeight = i2;
            this.folder = str;
        }
    }

    public ResolutionFileResolver(FileHandleResolver fileHandleResolver, Resolution... resolutionArr) {
        if (resolutionArr.length != 0) {
            this.baseResolver = fileHandleResolver;
            this.descriptors = resolutionArr;
            return;
        }
        throw new IllegalArgumentException("At least one Resolution needs to be supplied.");
    }

    @Override // com.badlogic.gdx.assets.loaders.FileHandleResolver
    public FileHandle resolve(String str) {
        FileHandle resolve = this.baseResolver.resolve(resolve(new FileHandle(str), choose(this.descriptors).folder));
        return !resolve.exists() ? this.baseResolver.resolve(str) : resolve;
    }

    /* access modifiers changed from: protected */
    public String resolve(FileHandle fileHandle, String str) {
        FileHandle parent = fileHandle.parent();
        String str2 = BuildConfig.FLAVOR;
        if (parent != null && !parent.name().equals(str2)) {
            str2 = parent + "/";
        }
        return str2 + str + "/" + fileHandle.name();
    }

    public static Resolution choose(Resolution... resolutionArr) {
        int width = Gdx.graphics.getWidth();
        int height = Gdx.graphics.getHeight();
        int i = 0;
        Resolution resolution = resolutionArr[0];
        if (width < height) {
            int length = resolutionArr.length;
            while (i < length) {
                Resolution resolution2 = resolutionArr[i];
                if (width >= resolution2.portraitWidth && resolution2.portraitWidth >= resolution.portraitWidth && height >= resolution2.portraitHeight && resolution2.portraitHeight >= resolution.portraitHeight) {
                    resolution = resolutionArr[i];
                }
                i++;
            }
        } else {
            int length2 = resolutionArr.length;
            while (i < length2) {
                Resolution resolution3 = resolutionArr[i];
                if (width >= resolution3.portraitHeight && resolution3.portraitHeight >= resolution.portraitHeight && height >= resolution3.portraitWidth && resolution3.portraitWidth >= resolution.portraitWidth) {
                    resolution = resolutionArr[i];
                }
                i++;
            }
        }
        return resolution;
    }
}
