package com.uwsoft.editor.renderer.utils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.PixmapPacker;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.brashmonkey.spriter.Data;
import com.brashmonkey.spriter.FileReference;
import com.brashmonkey.spriter.Loader;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class LibGdxLoader extends Loader<Sprite> implements Disposable {
    public static int standardAtlasHeight = 2048;
    public static int standardAtlasWidth = 2048;
    private int atlasHeight;
    private int atlasWidth;
    private boolean pack;
    private PixmapPacker packer;
    private HashMap<FileReference, Pixmap> pixmaps;
    private HashMap<Pixmap, Boolean> pixmapsToDispose;

    public LibGdxLoader(Data data) {
        this(data, true);
    }

    public LibGdxLoader(Data data, boolean z) {
        this(data, standardAtlasWidth, standardAtlasHeight);
        this.pack = z;
    }

    public LibGdxLoader(Data data, int i, int i2) {
        super(data);
        this.pack = true;
        this.atlasWidth = i;
        this.atlasHeight = i2;
        this.pixmaps = new HashMap<>();
        this.pixmapsToDispose = new HashMap<>();
    }

    /* access modifiers changed from: protected */
    @Override // com.brashmonkey.spriter.Loader
    public Sprite loadResource(FileReference fileReference) {
        FileHandle fileHandle;
        String str = this.root + "/" + new File(this.data.getFile(fileReference).name).getName();
        if (AnonymousClass1.$SwitchMap$com$badlogic$gdx$Application$ApplicationType[Gdx.app.getType().ordinal()] != 1) {
            fileHandle = Gdx.files.internal(str);
        } else {
            fileHandle = Gdx.files.absolute(str);
        }
        if (fileHandle.exists()) {
            if (this.packer == null && this.pack) {
                this.packer = new PixmapPacker(this.atlasWidth, this.atlasHeight, Pixmap.Format.RGBA8888, 2, true);
            }
            this.pixmaps.put(fileReference, new Pixmap(fileHandle));
            return null;
        }
        throw new GdxRuntimeException("Could not find file handle " + str + "! Please check your paths.");
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.uwsoft.editor.renderer.utils.LibGdxLoader$1  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$Application$ApplicationType = new int[Application.ApplicationType.values().length];

        static {
            try {
                $SwitchMap$com$badlogic$gdx$Application$ApplicationType[Application.ApplicationType.iOS.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
        }
    }

    /* access modifiers changed from: protected */
    public void generatePackedSprites() {
        PixmapPacker pixmapPacker = this.packer;
        if (pixmapPacker != null) {
            TextureAtlas generateTextureAtlas = pixmapPacker.generateTextureAtlas(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear, false);
            Set<FileReference> keySet = this.resources.keySet();
            disposeNonPackedTextures();
            for (FileReference fileReference : keySet) {
                TextureAtlas.AtlasRegion findRegion = generateTextureAtlas.findRegion(this.data.getFile(fileReference).name);
                findRegion.setRegionWidth((int) this.data.getFile(fileReference).size.width);
                findRegion.setRegionHeight((int) this.data.getFile(fileReference).size.height);
                this.resources.put(fileReference, (R) new Sprite(findRegion));
            }
        }
    }

    private void disposeNonPackedTextures() {
        for (Map.Entry<FileReference, R> entry : this.resources.entrySet()) {
            entry.getValue().getTexture().dispose();
        }
    }

    @Override // com.brashmonkey.spriter.Loader, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        PixmapPacker pixmapPacker;
        if (!this.pack || (pixmapPacker = this.packer) == null) {
            disposeNonPackedTextures();
        } else {
            pixmapPacker.dispose();
        }
        super.dispose();
    }

    /* access modifiers changed from: protected */
    @Override // com.brashmonkey.spriter.Loader
    public void finishLoading() {
        for (FileReference fileReference : this.resources.keySet()) {
            Pixmap pixmap = this.pixmaps.get(fileReference);
            this.pixmapsToDispose.put(pixmap, false);
            createSprite(fileReference, pixmap);
            PixmapPacker pixmapPacker = this.packer;
            if (pixmapPacker != null) {
                pixmapPacker.pack(this.data.getFile(fileReference).name, pixmap);
            }
        }
        if (this.pack) {
            generatePackedSprites();
        }
        disposePixmaps();
    }

    /* access modifiers changed from: protected */
    public void createSprite(FileReference fileReference, Pixmap pixmap) {
        Texture texture = new Texture(pixmap);
        texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
        this.resources.put(fileReference, (R) new Sprite(new TextureRegion(texture, (int) this.data.getFile(fileReference.folder, fileReference.file).size.width, (int) this.data.getFile(fileReference.folder, fileReference.file).size.height)));
        this.pixmapsToDispose.put(pixmap, true);
    }

    /* access modifiers changed from: protected */
    public void disposePixmaps() {
        Pixmap[] pixmapArr = new Pixmap[this.pixmapsToDispose.size()];
        this.pixmapsToDispose.keySet().toArray(pixmapArr);
        for (Pixmap pixmap : pixmapArr) {
            while (this.pixmapsToDispose.get(pixmap).booleanValue()) {
                try {
                    pixmap.dispose();
                    this.pixmapsToDispose.put(pixmap, false);
                } catch (GdxRuntimeException unused) {
                    System.err.println("Pixmap was already disposed!");
                }
            }
        }
        this.pixmapsToDispose.clear();
    }
}
