package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.math.EarClippingTriangulator;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedReader;
import java.io.IOException;

public class PolygonRegionLoader extends SynchronousAssetLoader<PolygonRegion, PolygonRegionParameters> {
    private PolygonRegionParameters defaultParameters;
    private EarClippingTriangulator triangulator;

    public static class PolygonRegionParameters extends AssetLoaderParameters<PolygonRegion> {
        public int readerBuffer = GL20.GL_STENCIL_BUFFER_BIT;
        public String[] textureExtensions = {"png", "PNG", "jpeg", "JPEG", "jpg", "JPG", "cim", "CIM", "etc1", "ETC1", "ktx", "KTX", "zktx", "ZKTX"};
        public String texturePrefix = "i ";
    }

    public PolygonRegionLoader() {
        this(new InternalFileHandleResolver());
    }

    public PolygonRegionLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
        this.defaultParameters = new PolygonRegionParameters();
        this.triangulator = new EarClippingTriangulator();
    }

    public PolygonRegion load(AssetManager assetManager, String str, FileHandle fileHandle, PolygonRegionParameters polygonRegionParameters) {
        return load(new TextureRegion((Texture) assetManager.get(assetManager.getDependencies(str).first())), fileHandle);
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, PolygonRegionParameters polygonRegionParameters) {
        String str2;
        if (polygonRegionParameters == null) {
            polygonRegionParameters = this.defaultParameters;
        }
        try {
            BufferedReader reader = fileHandle.reader(polygonRegionParameters.readerBuffer);
            while (true) {
                String readLine = reader.readLine();
                if (readLine != null) {
                    if (readLine.startsWith(polygonRegionParameters.texturePrefix)) {
                        str2 = readLine.substring(polygonRegionParameters.texturePrefix.length());
                        break;
                    }
                } else {
                    str2 = null;
                    break;
                }
            }
            reader.close();
            if (str2 == null && polygonRegionParameters.textureExtensions != null) {
                String[] strArr = polygonRegionParameters.textureExtensions;
                for (String str3 : strArr) {
                    FileHandle sibling = fileHandle.sibling(fileHandle.nameWithoutExtension().concat("." + str3));
                    if (sibling.exists()) {
                        str2 = sibling.name();
                    }
                }
            }
            if (str2 == null) {
                return null;
            }
            Array<AssetDescriptor> array = new Array<>(1);
            array.add(new AssetDescriptor(fileHandle.sibling(str2), Texture.class));
            return array;
        } catch (IOException e) {
            throw new GdxRuntimeException("Error reading " + str, e);
        }
    }

    public PolygonRegion load(TextureRegion textureRegion, FileHandle fileHandle) {
        String readLine;
        BufferedReader reader = fileHandle.reader(256);
        do {
            try {
                readLine = reader.readLine();
                if (readLine == null) {
                    StreamUtils.closeQuietly(reader);
                    throw new GdxRuntimeException("Polygon shape not found: " + fileHandle);
                }
            } catch (IOException e) {
                throw new GdxRuntimeException("Error reading polygon shape file: " + fileHandle, e);
            } catch (Throwable th) {
                StreamUtils.closeQuietly(reader);
                throw th;
            }
        } while (!readLine.startsWith("s"));
        String[] split = readLine.substring(1).trim().split(",");
        float[] fArr = new float[split.length];
        int length = fArr.length;
        for (int i = 0; i < length; i++) {
            fArr[i] = Float.parseFloat(split[i]);
        }
        PolygonRegion polygonRegion = new PolygonRegion(textureRegion, fArr, this.triangulator.computeTriangles(fArr).toArray());
        StreamUtils.closeQuietly(reader);
        return polygonRegion;
    }
}
