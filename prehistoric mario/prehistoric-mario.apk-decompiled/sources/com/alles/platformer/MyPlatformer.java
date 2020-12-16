package com.alles.platformer;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.maps.tiled.BaseTmxMapLoader;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.OrthogonalTiledMapRenderer;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Base64Coder;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.viewport.ScreenViewport;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class MyPlatformer extends ApplicationAdapter {
    private static final float GRAVITY = -1.5f;
    public static Batch absoluteBatch;
    private OrthographicCamera camera;
    Controller controller;
    private Animation<TextureRegion> croutch;
    private Animation<TextureRegion> croutchStand;
    private boolean debug = false;
    private Label debugLabel;
    private ShapeRenderer debugRenderer;
    private Stage debugStage;
    BitmapFont font;
    private Animation<TextureRegion> jump;
    private Koala koala;
    private Texture koalaTexture;
    private TiledMap map;
    private HashMap<Integer, Integer> questionMarkTileMapping;
    private Pool<Rectangle> rectPool = new Pool<Rectangle>() {
        /* class com.alles.platformer.MyPlatformer.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public Rectangle newObject() {
            return new Rectangle();
        }
    };
    private OrthogonalTiledMapRenderer renderer;
    private Animation<TextureRegion> stand;
    private Array<Rectangle> tiles = new Array<>();
    private Animation<TextureRegion> walk;

    @Override // com.badlogic.gdx.ApplicationListener, com.badlogic.gdx.ApplicationAdapter
    public void dispose() {
    }

    /* access modifiers changed from: package-private */
    public static class Koala {
        static float DAMPING = 0.87f;
        static float HEIGHT = 0.0f;
        static float JUMP_VELOCITY = 40.0f;
        static float MAX_VELOCITY = 5.0f;
        static float MAX_Y_VELOCITY = 40.0f;
        static float WIDTH;
        boolean facesRight = true;
        boolean grounded = false;
        final Vector2 position = new Vector2();
        State state = State.Walking;
        float stateTime = 0.0f;
        final Vector2 velocity = new Vector2();

        /* access modifiers changed from: package-private */
        public enum State {
            Standing,
            Walking,
            Jumping,
            Crouching,
            CrouchingStanding
        }

        Koala() {
        }
    }

    @Override // com.badlogic.gdx.ApplicationListener, com.badlogic.gdx.ApplicationAdapter
    public void create() {
        this.koalaTexture = new Texture("mort.png");
        TextureRegion[] textureRegionArr = TextureRegion.split(this.koalaTexture, 24, 21)[0];
        this.stand = new Animation<>(0.15f, (TextureRegion[]) new Object[]{textureRegionArr[0], textureRegionArr[1], textureRegionArr[2], textureRegionArr[3]});
        this.jump = new Animation<>(0.0f, (TextureRegion[]) new Object[]{textureRegionArr[14]});
        this.walk = new Animation<>(0.08f, (TextureRegion[]) new Object[]{textureRegionArr[4], textureRegionArr[5], textureRegionArr[6], textureRegionArr[7], textureRegionArr[8], textureRegionArr[9]});
        this.croutch = new Animation<>(0.08f, (TextureRegion[]) new Object[]{textureRegionArr[17], textureRegionArr[18], textureRegionArr[19], textureRegionArr[20], textureRegionArr[21], textureRegionArr[22], textureRegionArr[23]});
        this.croutchStand = new Animation<>(0.0f, textureRegionArr[17]);
        this.walk.setPlayMode(Animation.PlayMode.LOOP_PINGPONG);
        this.croutch.setPlayMode(Animation.PlayMode.LOOP_PINGPONG);
        Koala.WIDTH = ((float) textureRegionArr[0].getRegionWidth()) * 0.0625f;
        Koala.HEIGHT = ((float) textureRegionArr[0].getRegionHeight()) * 0.0625f;
        this.map = new TmxMapLoader().load("map.tmx");
        this.renderer = new OrthogonalTiledMapRenderer(this.map, 0.0625f);
        this.camera = new OrthographicCamera();
        this.camera.setToOrtho(false, 30.0f, 20.0f);
        this.camera.update();
        this.koala = new Koala();
        this.koala.position.set(3.0f, 100.0f);
        this.debugRenderer = new ShapeRenderer();
        this.font = new BitmapFont();
        this.font.getData().setScale(2.0f);
        absoluteBatch = new SpriteBatch();
        this.debugStage = new Stage(new ScreenViewport());
        Label.LabelStyle labelStyle = new Label.LabelStyle();
        labelStyle.font = this.font;
        labelStyle.fontColor = Color.RED;
        int width = Gdx.graphics.getWidth() / 12;
        this.debugLabel = new Label("Jabba Dabba Duuu", labelStyle);
        this.debugLabel.setSize((float) Gdx.graphics.getWidth(), (float) (Gdx.graphics.getWidth() / 12));
        this.debugLabel.setPosition(500.0f, 0.0f);
        this.debugLabel.setAlignment(8);
        this.debugStage.addActor(this.debugLabel);
        this.questionMarkTileMapping = new HashMap<>();
        this.questionMarkTileMapping.put(0, 128);
        this.questionMarkTileMapping.put(21, 160);
        this.questionMarkTileMapping.put(37, 176);
        this.questionMarkTileMapping.put(97, 192);
        this.controller = new Controller();
    }

    @Override // com.badlogic.gdx.ApplicationListener, com.badlogic.gdx.ApplicationAdapter
    public void render() {
        Gdx.gl.glClearColor(0.7f, 0.7f, 1.0f, 1.0f);
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
        float deltaTime = Gdx.graphics.getDeltaTime();
        updateKoala(deltaTime);
        this.camera.position.x = this.koala.position.x;
        this.camera.position.y = this.koala.position.y;
        this.camera.update();
        this.renderer.setView(this.camera);
        this.renderer.render();
        renderKoala(deltaTime);
        if (this.debug) {
            renderDebug();
        }
        this.debugStage.act();
        this.debugStage.draw();
        if (Gdx.app.getType() == Application.ApplicationType.Android) {
            this.controller.draw();
        }
    }

    public static String toHex(byte[] bArr) {
        BigInteger bigInteger = new BigInteger(1, bArr);
        return String.format("%0" + (bArr.length << 1) + "x", bigInteger);
    }

    private void checkFlag() {
        MessageDigest messageDigest;
        int intValue;
        byte[] bArr = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer) this.map.getLayers().get("questionmarks");
        int i = 0;
        int i2 = 0;
        while (i < 100) {
            int i3 = i2;
            for (int i4 = 0; i4 < 100; i4++) {
                TiledMapTileLayer.Cell cell = tiledMapTileLayer.getCell(i, i4);
                if (!(cell == null || !cell.getTile().getProperties().containsKey("questionmarkType") || (intValue = ((Integer) cell.getTile().getProperties().get("questionmarkType")).intValue()) == 1337)) {
                    bArr[i3] = (byte) intValue;
                    i3++;
                }
            }
            i++;
            i2 = i3;
        }
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            messageDigest = null;
        }
        messageDigest.update(bArr);
        messageDigest.update("P4ssw0rdS4lt".getBytes());
        if (toHex(messageDigest.digest()).equals("024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420")) {
            try {
                messageDigest.update(bArr);
                messageDigest.update("P4ssw0rdS4lt".getBytes());
                messageDigest.update(bArr);
                byte[] digest = messageDigest.digest();
                byte[] decode = Base64Coder.decode(Gdx.files.internal("flag_enc").readString());
                SecretKeySpec secretKeySpec = new SecretKeySpec(digest, 0, digest.length, "RC4");
                Cipher instance = Cipher.getInstance("RC4");
                instance.init(2, secretKeySpec, instance.getParameters());
                String str = new String(instance.doFinal(decode));
                FileHandle local = Gdx.files.local("map_flag.tmx");
                local.writeString(str, false);
                Gdx.files.local("tileSet.png").writeBytes(Base64Coder.decode("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T5/+BQOY8/xvJtwPAAADAFBMVEUAAAAZGRkXPDQoJygnOzw6OjoNUisGWzUaSDcVWjUDbjgpSD0qUj44RD4kZzwOcUUZf2QsTEAsVkA0S0M1WEc+WlAtZ0EvcUI5Yks+YVAweEMyfFpBOz5SHmlVIm1oN3VIR0dIWElBW1NWWEtYV1lcWmFDZktHaFhSYE9ZZVROb2BSbGJZd2lmV01qXFVxXFdiXWBsYlloc119Y0t1ZFh6eVRqaWlqdWdlfXR8bGF0aXF6cmd6eXk5NokFV70MZb4pU50rW6EpY543dKQHUsERaMQlb8tHSY9JeqwSjDIjkjwmoz4BkkUTgmEFpEsnjEEmlEAyh0Q0mEYggWYnqEUns0o2p0c5t0o9slE7xUs91E1KlFdJsFB9ik5phHd8hG1win5itV5otWRLwlBiyl1owWF5yGx4xnJ712p94Ws9gKZNg69ujYB1jIJ8k4hpk7xxmsGKNBqmLBi9OyOVTR6cVCGxVRirVii1fxi2cjaIakyCaFuFdV+UbUWXcEaXd1iAbmGHdWiIfHWRfW6VfHOkdkSifHnCPiPDWSDLbzmOfICKniqOri25ihS4tROnuzqFl1SKgm2NgnmMl26Xg2yXhXWUmGSWl3aNsU2Oo3GHsW2NuXKSo2eQrHOesn2pgVi7hUq1iVimh2eii3ulkn20jGG4mHepq3ukvGWtvXC0vHuVyjK5zhSoyTiSxEiKyHGD126H2XGU13eF5XGa5Hq3zUKvxG+i8H7HmRvViTLapCT9lRHskSfspy7IjEjDjVLMkk/Xk0XYnVnRnXHap2vgnVDtolHgpmHF0xrc0STY5CLi7CbF3EfP40yFhISGk4qInJOWiYObkomXl5eMoZeTp52mjYaoj5WploOmm5OzjYixnIe1mJmllaKvo4qqopq2o4y7qJK7uYWnpqa0q6Wyq7G7squ2tra3wben74GT//+t///CrJXEvY7HspnUoYXVsojQs5zMq6XJrbDOvKbGvbLRvaXEvcTSwarayLHhx6vszbHMyszO///8/f0AAADTgYy9AAABAHRSTlP///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AU/cHJQAAAAlwSFlzAAALEwAACxMBAJqcGAAAIjhJREFUeF7tfQ10G9d55cah1wwHscoJC8nYTWrXUriuSdBIp7RhoXtsq9latuIYOAoQqqzqxD2p1zq0o1qJSivrYEg6qRTXzmo5Frdpmkqg+7O05KS2kzBglKRNUydrQ6IgZcFFfAQsKDNdY7FhQkNQlhb3fu89ADPgAATIgS0KvBLxBvMD8bvvvu/nzcPoXy00ONYIEG3DYo0A0TYs1ggQbcNijQDRNizWCBBtw+JyIWB6alps1YjLgoCzqrJPUYLqlHhfCy4DAjRFUdyqqqIJamJf9bCMgJMd7e0dp8WbtxCaW1G0eCKdTsQ1cKCeFfurhUUEdMg2SZJlm22n2PEW4WwQ5qez2WwmM4uXWFAJTopDVcIaAmyyJEmgQLLJ14hdbwkmVcUdz85m8shmMB5qGwaWEADT13t9Pp8XPMgbFnbeckYcqDPUoKKmc8J4jmzMXRsDVhDQLsn+HTt6gIBPZgNBfktGQhD2o9ONyCWDSi3RwAoCJJvf7/DBfKLALtkI4lA9YWo/NJBWFXFGNbCAgA7J4ZWaJK93vcMPBmxNcAX1d4avkf3pxfaDAWhAnFQFVkzAznZonkyGCwQLgR6/12uT5DZxuF6Yhv3BUvvneJNNu1Vx2tJYIQEdNpnGvI1+AEkKBAI9O3zwheKEesHE/rlcNjvHOMgmlFPivCWxMgI2cLsLkOwYA6AAjkCcUScEkfMkjfaT9XN4oe1crOpBsCICTouOL0Cy+wLEgKPOBLyG/CdmjH9zOdhPFOSIgmyoWgZWREC7sFsHREREA3trfQlA0qsW0x8G6n8OJoLZakOB1QTADYABu9QuTqkP3O5FAigSwBjIZtTqHOGKCOiDuSzo6SE5evy2VnFGnaDCAwrLBYTtHIyBhFJVVbAiAm5ulb1eh83IgCT3OJqkuuYB00FFM44AvQCA7FwaSXFVGeFKCJCbbIh5O/LJ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"), false);
                TmxMapLoader tmxMapLoader = new TmxMapLoader(new LocalFileResolver());
                tmxMapLoader.getDependencies(BuildConfig.FLAVOR, local, (BaseTmxMapLoader.Parameters) null);
                AssetManager assetManager = new AssetManager(new LocalFileResolver());
                assetManager.load("tileSet.png", Texture.class);
                assetManager.finishLoading();
                tmxMapLoader.loadAsync(assetManager, "map_flag.tmx", local, (TmxMapLoader.Parameters) null);
                this.map.dispose();
                this.map = tmxMapLoader.loadSync((AssetManager) null, (String) null, (FileHandle) null, (TmxMapLoader.Parameters) null);
                this.renderer = new OrthogonalTiledMapRenderer(this.map, 0.0625f);
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public static String bytesToHex(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (byte b : bArr) {
            stringBuffer.append(Integer.toString((b & 255) + 256, 16).substring(1));
        }
        return stringBuffer.toString();
    }

    private void updateKoala(float f) {
        float f2;
        float f3;
        float f4;
        float f5;
        if (f != 0.0f) {
            float f6 = f > 0.1f ? 0.1f : f;
            this.koala.stateTime += f6;
            if (this.koala.position.y < -100.0f) {
                this.koala.position.set(3.0f, 100.0f);
            }
            boolean z = false;
            if (this.controller.isUpPressed() && this.koala.grounded) {
                this.koala.velocity.y += Koala.JUMP_VELOCITY;
                this.koala.state = Koala.State.Jumping;
                this.koala.grounded = false;
            }
            if (this.controller.isLeftPressed()) {
                this.koala.velocity.x = -Koala.MAX_VELOCITY;
                if (this.koala.grounded) {
                    this.koala.state = Koala.State.Walking;
                }
                this.koala.facesRight = false;
            }
            if (this.controller.isLeftPressed() && this.controller.isDownPressed()) {
                this.koala.velocity.x = -Koala.MAX_VELOCITY;
                if (this.koala.grounded) {
                    this.koala.state = Koala.State.Crouching;
                }
                this.koala.facesRight = false;
            }
            if (this.controller.isRightPressed()) {
                this.koala.velocity.x = Koala.MAX_VELOCITY;
                if (this.koala.grounded) {
                    this.koala.state = Koala.State.Walking;
                }
                this.koala.facesRight = true;
            }
            if ((this.controller.isRightPressed() && this.controller.isDownPressed()) || Gdx.input.isKeyPressed(32)) {
                this.koala.velocity.x = Koala.MAX_VELOCITY;
                if (this.koala.grounded) {
                    this.koala.state = Koala.State.Crouching;
                }
                this.koala.facesRight = true;
            }
            this.debug = false;
            this.koala.velocity.add(0.0f, GRAVITY);
            this.koala.velocity.x = MathUtils.clamp(this.koala.velocity.x, -Koala.MAX_VELOCITY, Koala.MAX_VELOCITY);
            this.koala.velocity.y = MathUtils.clamp(this.koala.velocity.y, -Koala.MAX_Y_VELOCITY, Koala.MAX_Y_VELOCITY);
            if (Math.abs(this.koala.velocity.x) < 1.0f) {
                this.koala.velocity.x = 0.0f;
                if (this.koala.grounded) {
                    if (this.controller.isDownPressed()) {
                        this.koala.state = Koala.State.CrouchingStanding;
                    } else {
                        this.koala.state = Koala.State.Standing;
                    }
                }
            }
            this.koala.velocity.scl(f6);
            Rectangle obtain = this.rectPool.obtain();
            float f7 = Koala.HEIGHT;
            if (this.koala.state == Koala.State.Crouching) {
                f7 -= 0.5f;
            }
            obtain.set(this.koala.position.x + 0.4375f, this.koala.position.y, Koala.WIDTH - 0.6875f, f7);
            if (this.koala.velocity.x > 0.0f) {
                f3 = obtain.x + obtain.width;
                f2 = this.koala.velocity.x;
            } else {
                f3 = obtain.x;
                f2 = this.koala.velocity.x;
            }
            int i = (int) (f3 + f2);
            getTiles(i, (int) this.koala.position.y, i, (int) (this.koala.position.y + f7), this.tiles);
            obtain.x += this.koala.velocity.x;
            Iterator<Rectangle> it = this.tiles.iterator();
            while (true) {
                if (it.hasNext()) {
                    if (obtain.overlaps(it.next())) {
                        this.koala.velocity.x = 0.0f;
                        break;
                    }
                } else {
                    break;
                }
            }
            obtain.x = this.koala.position.x + 0.4375f;
            if (this.koala.velocity.y > 0.0f) {
                f5 = this.koala.position.y + f7;
                f4 = this.koala.velocity.y;
            } else {
                f5 = this.koala.position.y;
                f4 = this.koala.velocity.y;
            }
            int i2 = (int) (f5 + f4);
            int i3 = (int) (this.koala.position.x + 0.4375f);
            int i4 = (int) (((this.koala.position.x + 0.4375f) + Koala.WIDTH) - 0.6875f);
            TiledMapTileLayer.Cell cell = ((TiledMapTileLayer) this.map.getLayers().get("walls")).getCell(i3, i2);
            if (cell == null || cell.getTile().getId() != 144) {
                getQuestionmarkTiles(i3, i2, i4, i2, this.tiles);
                obtain.y += this.koala.velocity.y;
                Iterator<Rectangle> it2 = this.tiles.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Rectangle next = it2.next();
                    if (obtain.overlaps(next)) {
                        if (this.koala.velocity.y <= 0.0f) {
                            this.koala.position.y = next.y + next.height;
                            this.koala.grounded = true;
                            break;
                        }
                        this.koala.position.y = next.y - f7;
                        TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer) this.map.getLayers().get("questionmarks");
                        TiledMapTileLayer.Cell cell2 = tiledMapTileLayer.getCell((int) next.x, (int) next.y);
                        if (cell2.getTile().getProperties().containsKey("questionmarkType")) {
                            int intValue = ((Integer) cell2.getTile().getProperties().get("questionmarkType")).intValue();
                            if (intValue == 1337) {
                                new Array();
                                checkFlag();
                            } else {
                                if (intValue == 0) {
                                    intValue = 21;
                                } else if (intValue == 21) {
                                    intValue = 97;
                                } else if (intValue == 97) {
                                    intValue = 37;
                                } else if (intValue == 37) {
                                    intValue = 0;
                                }
                                try {
                                    new TiledMapTileLayer.Cell();
                                    cell2.setTile(this.map.getTileSets().getTile(this.questionMarkTileMapping.get(Integer.valueOf(intValue)).intValue()));
                                    tiledMapTileLayer.setCell((int) next.x, (int) next.y, cell2);
                                } catch (Exception unused) {
                                }
                            }
                            z = true;
                        }
                    }
                }
                this.koala.velocity.y = 0.0f;
                if (!z) {
                    getTiles(i3, i2, i4, i2, this.tiles);
                    Iterator<Rectangle> it3 = this.tiles.iterator();
                    while (true) {
                        if (!it3.hasNext()) {
                            break;
                        }
                        Rectangle next2 = it3.next();
                        if (obtain.overlaps(next2)) {
                            if (this.koala.velocity.y > 0.0f) {
                                this.koala.position.y = next2.y - Koala.HEIGHT;
                            } else {
                                this.koala.position.y = next2.y + next2.height;
                                this.koala.grounded = true;
                            }
                            this.koala.velocity.y = 0.0f;
                        }
                    }
                }
                this.rectPool.free(obtain);
                this.koala.position.add(this.koala.velocity);
                this.koala.velocity.scl(1.0f / f6);
                this.koala.velocity.x *= Koala.DAMPING;
                return;
            }
            this.koala.position.set(3.0f, 100.0f);
        }
    }

    private boolean isTouched(float f, float f2) {
        for (int i = 0; i < 2; i++) {
            float x = ((float) Gdx.input.getX(i)) / ((float) Gdx.graphics.getWidth());
            if (Gdx.input.isTouched(i) && x >= f && x <= f2) {
                return true;
            }
        }
        return false;
    }

    private void getTiles(int i, int i2, int i3, int i4, Array<Rectangle> array) {
        TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer) this.map.getLayers().get("walls");
        TiledMapTileLayer tiledMapTileLayer2 = (TiledMapTileLayer) this.map.getLayers().get("questionmarks");
        this.rectPool.freeAll(array);
        array.clear();
        while (i2 <= i4) {
            for (int i5 = i; i5 <= i3; i5++) {
                if (tiledMapTileLayer.getCell(i5, i2) != null) {
                    Rectangle obtain = this.rectPool.obtain();
                    obtain.set((float) i5, (float) i2, 1.0f, 1.0f);
                    array.add(obtain);
                }
                if (tiledMapTileLayer2.getCell(i5, i2) != null) {
                    Rectangle obtain2 = this.rectPool.obtain();
                    obtain2.set((float) i5, (float) i2, 1.0f, 1.0f);
                    array.add(obtain2);
                }
            }
            i2++;
        }
    }

    private void getQuestionmarkTiles(int i, int i2, int i3, int i4, Array<Rectangle> array) {
        TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer) this.map.getLayers().get("questionmarks");
        this.rectPool.freeAll(array);
        array.clear();
        while (i2 <= i4) {
            for (int i5 = i; i5 <= i3; i5++) {
                if (tiledMapTileLayer.getCell(i5, i2) != null) {
                    Rectangle obtain = this.rectPool.obtain();
                    obtain.set((float) i5, (float) i2, 1.0f, 1.0f);
                    array.add(obtain);
                }
            }
            i2++;
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.alles.platformer.MyPlatformer$2  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$alles$platformer$MyPlatformer$Koala$State = new int[Koala.State.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(12:0|1|2|3|4|5|6|7|8|9|10|12) */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0035 */
        static {
            /*
                com.alles.platformer.MyPlatformer$Koala$State[] r0 = com.alles.platformer.MyPlatformer.Koala.State.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State = r0
                int[] r0 = com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.alles.platformer.MyPlatformer$Koala$State r1 = com.alles.platformer.MyPlatformer.Koala.State.Standing     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State     // Catch:{ NoSuchFieldError -> 0x001f }
                com.alles.platformer.MyPlatformer$Koala$State r1 = com.alles.platformer.MyPlatformer.Koala.State.Walking     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                int[] r0 = com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State     // Catch:{ NoSuchFieldError -> 0x002a }
                com.alles.platformer.MyPlatformer$Koala$State r1 = com.alles.platformer.MyPlatformer.Koala.State.Jumping     // Catch:{ NoSuchFieldError -> 0x002a }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x002a }
                r2 = 3
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x002a }
            L_0x002a:
                int[] r0 = com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State     // Catch:{ NoSuchFieldError -> 0x0035 }
                com.alles.platformer.MyPlatformer$Koala$State r1 = com.alles.platformer.MyPlatformer.Koala.State.Crouching     // Catch:{ NoSuchFieldError -> 0x0035 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0035 }
                r2 = 4
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0035 }
            L_0x0035:
                int[] r0 = com.alles.platformer.MyPlatformer.AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State     // Catch:{ NoSuchFieldError -> 0x0040 }
                com.alles.platformer.MyPlatformer$Koala$State r1 = com.alles.platformer.MyPlatformer.Koala.State.CrouchingStanding     // Catch:{ NoSuchFieldError -> 0x0040 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0040 }
                r2 = 5
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0040 }
            L_0x0040:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.alles.platformer.MyPlatformer.AnonymousClass2.<clinit>():void");
        }
    }

    private void renderKoala(float f) {
        TextureRegion keyFrame;
        int i = AnonymousClass2.$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State[this.koala.state.ordinal()];
        if (i == 1) {
            keyFrame = this.stand.getKeyFrame(this.koala.stateTime);
        } else if (i == 2) {
            keyFrame = this.walk.getKeyFrame(this.koala.stateTime);
        } else if (i == 3) {
            keyFrame = this.jump.getKeyFrame(this.koala.stateTime);
        } else if (i != 4) {
            keyFrame = i != 5 ? null : this.croutchStand.getKeyFrame(this.koala.stateTime);
        } else {
            keyFrame = this.croutch.getKeyFrame(this.koala.stateTime);
        }
        Batch batch = this.renderer.getBatch();
        batch.begin();
        if (this.koala.facesRight) {
            batch.draw(keyFrame, this.koala.position.x, this.koala.position.y, Koala.WIDTH, Koala.HEIGHT);
        } else {
            batch.draw(keyFrame, Koala.WIDTH + this.koala.position.x, this.koala.position.y, -Koala.WIDTH, Koala.HEIGHT);
        }
        batch.end();
    }

    private void renderDebug() {
        this.debugRenderer.setProjectionMatrix(this.camera.combined);
        this.debugRenderer.begin(ShapeRenderer.ShapeType.Line);
        this.debugRenderer.setColor(Color.RED);
        this.debugRenderer.rect(this.koala.position.x + 0.4375f, this.koala.position.y, Koala.WIDTH - 0.6875f, Koala.HEIGHT);
        this.debugRenderer.setColor(Color.YELLOW);
        TiledMapTileLayer tiledMapTileLayer = (TiledMapTileLayer) this.map.getLayers().get("walls");
        for (int i = 0; i <= tiledMapTileLayer.getHeight(); i++) {
            for (int i2 = 0; i2 <= tiledMapTileLayer.getWidth(); i2++) {
                if (tiledMapTileLayer.getCell(i2, i) != null) {
                    float f = (float) i2;
                    float f2 = (float) i;
                    if (this.camera.frustum.boundsInFrustum(f + 0.5f, f2 + 0.5f, 0.0f, 1.0f, 1.0f, 0.0f)) {
                        this.debugRenderer.rect(f, f2, 1.0f, 1.0f);
                    }
                }
            }
        }
        this.debugRenderer.end();
        this.debugLabel.setText(String.format("Pos: %f : %f", Float.valueOf(this.koala.position.x), Float.valueOf(this.koala.position.y)));
    }
}
