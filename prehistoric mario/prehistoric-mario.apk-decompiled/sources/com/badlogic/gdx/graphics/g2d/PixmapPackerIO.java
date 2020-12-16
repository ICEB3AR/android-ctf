package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import java.io.IOException;

public class PixmapPackerIO {

    public static class SaveParameters {
        public ImageFormat format = ImageFormat.PNG;
        public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
        public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
        public boolean useIndexes;
    }

    public enum ImageFormat {
        CIM(".cim"),
        PNG(".png");
        
        private final String extension;

        public String getExtension() {
            return this.extension;
        }

        private ImageFormat(String str) {
            this.extension = str;
        }
    }

    public void save(FileHandle fileHandle, PixmapPacker pixmapPacker) throws IOException {
        save(fileHandle, pixmapPacker, new SaveParameters());
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0199  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void save(com.badlogic.gdx.files.FileHandle r20, com.badlogic.gdx.graphics.g2d.PixmapPacker r21, com.badlogic.gdx.graphics.g2d.PixmapPackerIO.SaveParameters r22) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 648
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.PixmapPackerIO.save(com.badlogic.gdx.files.FileHandle, com.badlogic.gdx.graphics.g2d.PixmapPacker, com.badlogic.gdx.graphics.g2d.PixmapPackerIO$SaveParameters):void");
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.badlogic.gdx.graphics.g2d.PixmapPackerIO$1  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$graphics$g2d$PixmapPackerIO$ImageFormat = new int[ImageFormat.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(6:0|1|2|3|4|6) */
        /* JADX WARNING: Code restructure failed: missing block: B:7:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        static {
            /*
                com.badlogic.gdx.graphics.g2d.PixmapPackerIO$ImageFormat[] r0 = com.badlogic.gdx.graphics.g2d.PixmapPackerIO.ImageFormat.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.graphics.g2d.PixmapPackerIO.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$g2d$PixmapPackerIO$ImageFormat = r0
                int[] r0 = com.badlogic.gdx.graphics.g2d.PixmapPackerIO.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$g2d$PixmapPackerIO$ImageFormat     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.graphics.g2d.PixmapPackerIO$ImageFormat r1 = com.badlogic.gdx.graphics.g2d.PixmapPackerIO.ImageFormat.CIM     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.graphics.g2d.PixmapPackerIO.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$g2d$PixmapPackerIO$ImageFormat     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.graphics.g2d.PixmapPackerIO$ImageFormat r1 = com.badlogic.gdx.graphics.g2d.PixmapPackerIO.ImageFormat.PNG     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.PixmapPackerIO.AnonymousClass1.<clinit>():void");
        }
    }
}
