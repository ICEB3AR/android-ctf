package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.Gdx2DPixmap;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.IOException;
import java.nio.ByteBuffer;

public class Pixmap implements Disposable {
    private Blending blending = Blending.SourceOver;
    int color = 0;
    private boolean disposed;
    private Filter filter = Filter.BiLinear;
    final Gdx2DPixmap pixmap;

    public enum Blending {
        None,
        SourceOver
    }

    public enum Filter {
        NearestNeighbour,
        BiLinear
    }

    public enum Format {
        Alpha,
        Intensity,
        LuminanceAlpha,
        RGB565,
        RGBA4444,
        RGB888,
        RGBA8888;

        public static int toGdx2DPixmapFormat(Format format) {
            if (format == Alpha || format == Intensity) {
                return 1;
            }
            if (format == LuminanceAlpha) {
                return 2;
            }
            if (format == RGB565) {
                return 5;
            }
            if (format == RGBA4444) {
                return 6;
            }
            if (format == RGB888) {
                return 3;
            }
            if (format == RGBA8888) {
                return 4;
            }
            throw new GdxRuntimeException("Unknown Format: " + format);
        }

        public static Format fromGdx2DPixmapFormat(int i) {
            if (i == 1) {
                return Alpha;
            }
            if (i == 2) {
                return LuminanceAlpha;
            }
            if (i == 5) {
                return RGB565;
            }
            if (i == 6) {
                return RGBA4444;
            }
            if (i == 3) {
                return RGB888;
            }
            if (i == 4) {
                return RGBA8888;
            }
            throw new GdxRuntimeException("Unknown Gdx2DPixmap Format: " + i);
        }

        public static int toGlFormat(Format format) {
            return Gdx2DPixmap.toGlFormat(toGdx2DPixmapFormat(format));
        }

        public static int toGlType(Format format) {
            return Gdx2DPixmap.toGlType(toGdx2DPixmapFormat(format));
        }
    }

    public void setBlending(Blending blending2) {
        this.blending = blending2;
        this.pixmap.setBlend(blending2 == Blending.None ? 0 : 1);
    }

    public void setFilter(Filter filter2) {
        this.filter = filter2;
        this.pixmap.setScale(filter2 == Filter.NearestNeighbour ? 0 : 1);
    }

    public Pixmap(int i, int i2, Format format) {
        this.pixmap = new Gdx2DPixmap(i, i2, Format.toGdx2DPixmapFormat(format));
        setColor(0.0f, 0.0f, 0.0f, 0.0f);
        fill();
    }

    public Pixmap(byte[] bArr, int i, int i2) {
        try {
            this.pixmap = new Gdx2DPixmap(bArr, i, i2, 0);
        } catch (IOException e) {
            throw new GdxRuntimeException("Couldn't load pixmap from image data", e);
        }
    }

    public Pixmap(FileHandle fileHandle) {
        try {
            byte[] readBytes = fileHandle.readBytes();
            this.pixmap = new Gdx2DPixmap(readBytes, 0, readBytes.length, 0);
        } catch (Exception e) {
            throw new GdxRuntimeException("Couldn't load file: " + fileHandle, e);
        }
    }

    public Pixmap(Gdx2DPixmap gdx2DPixmap) {
        this.pixmap = gdx2DPixmap;
    }

    public void setColor(int i) {
        this.color = i;
    }

    public void setColor(float f, float f2, float f3, float f4) {
        this.color = Color.rgba8888(f, f2, f3, f4);
    }

    public void setColor(Color color2) {
        this.color = Color.rgba8888(color2.r, color2.g, color2.b, color2.a);
    }

    public void fill() {
        this.pixmap.clear(this.color);
    }

    public void drawLine(int i, int i2, int i3, int i4) {
        this.pixmap.drawLine(i, i2, i3, i4, this.color);
    }

    public void drawRectangle(int i, int i2, int i3, int i4) {
        this.pixmap.drawRect(i, i2, i3, i4, this.color);
    }

    public void drawPixmap(Pixmap pixmap2, int i, int i2) {
        drawPixmap(pixmap2, i, i2, 0, 0, pixmap2.getWidth(), pixmap2.getHeight());
    }

    public void drawPixmap(Pixmap pixmap2, int i, int i2, int i3, int i4, int i5, int i6) {
        this.pixmap.drawPixmap(pixmap2.pixmap, i3, i4, i, i2, i5, i6);
    }

    public void drawPixmap(Pixmap pixmap2, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        this.pixmap.drawPixmap(pixmap2.pixmap, i, i2, i3, i4, i5, i6, i7, i8);
    }

    public void fillRectangle(int i, int i2, int i3, int i4) {
        this.pixmap.fillRect(i, i2, i3, i4, this.color);
    }

    public void drawCircle(int i, int i2, int i3) {
        this.pixmap.drawCircle(i, i2, i3, this.color);
    }

    public void fillCircle(int i, int i2, int i3) {
        this.pixmap.fillCircle(i, i2, i3, this.color);
    }

    public void fillTriangle(int i, int i2, int i3, int i4, int i5, int i6) {
        this.pixmap.fillTriangle(i, i2, i3, i4, i5, i6, this.color);
    }

    public int getPixel(int i, int i2) {
        return this.pixmap.getPixel(i, i2);
    }

    public int getWidth() {
        return this.pixmap.getWidth();
    }

    public int getHeight() {
        return this.pixmap.getHeight();
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (!this.disposed) {
            this.pixmap.dispose();
            this.disposed = true;
            return;
        }
        throw new GdxRuntimeException("Pixmap already disposed!");
    }

    public boolean isDisposed() {
        return this.disposed;
    }

    public void drawPixel(int i, int i2) {
        this.pixmap.setPixel(i, i2, this.color);
    }

    public void drawPixel(int i, int i2, int i3) {
        this.pixmap.setPixel(i, i2, i3);
    }

    public int getGLFormat() {
        return this.pixmap.getGLFormat();
    }

    public int getGLInternalFormat() {
        return this.pixmap.getGLInternalFormat();
    }

    public int getGLType() {
        return this.pixmap.getGLType();
    }

    public ByteBuffer getPixels() {
        if (!this.disposed) {
            return this.pixmap.getPixels();
        }
        throw new GdxRuntimeException("Pixmap already disposed");
    }

    public Format getFormat() {
        return Format.fromGdx2DPixmapFormat(this.pixmap.getFormat());
    }

    public Blending getBlending() {
        return this.blending;
    }

    public Filter getFilter() {
        return this.filter;
    }
}
