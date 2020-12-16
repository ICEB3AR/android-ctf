package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.os.Build;
import com.badlogic.gdx.Audio;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.audio.AudioDevice;
import com.badlogic.gdx.audio.AudioRecorder;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.FileDescriptor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class AndroidAudio implements Audio {
    private final AudioManager manager;
    protected final List<AndroidMusic> musics = new ArrayList();
    private final SoundPool soundPool;

    public AndroidAudio(Context context, AndroidApplicationConfiguration androidApplicationConfiguration) {
        if (!androidApplicationConfiguration.disableAudio) {
            if (Build.VERSION.SDK_INT >= 21) {
                this.soundPool = new SoundPool.Builder().setAudioAttributes(new AudioAttributes.Builder().setUsage(14).setContentType(4).build()).setMaxStreams(androidApplicationConfiguration.maxSimultaneousSounds).build();
            } else {
                this.soundPool = new SoundPool(androidApplicationConfiguration.maxSimultaneousSounds, 3, 0);
            }
            this.manager = (AudioManager) context.getSystemService("audio");
            if (context instanceof Activity) {
                ((Activity) context).setVolumeControlStream(3);
                return;
            }
            return;
        }
        this.soundPool = null;
        this.manager = null;
    }

    /* access modifiers changed from: protected */
    public void pause() {
        if (this.soundPool != null) {
            synchronized (this.musics) {
                for (AndroidMusic androidMusic : this.musics) {
                    if (androidMusic.isPlaying()) {
                        androidMusic.pause();
                        androidMusic.wasPlaying = true;
                    } else {
                        androidMusic.wasPlaying = false;
                    }
                }
            }
            this.soundPool.autoPause();
        }
    }

    /* access modifiers changed from: protected */
    public void resume() {
        if (this.soundPool != null) {
            synchronized (this.musics) {
                for (int i = 0; i < this.musics.size(); i++) {
                    if (this.musics.get(i).wasPlaying) {
                        this.musics.get(i).play();
                    }
                }
            }
            this.soundPool.autoResume();
        }
    }

    @Override // com.badlogic.gdx.Audio
    public AudioDevice newAudioDevice(int i, boolean z) {
        if (this.soundPool != null) {
            return new AndroidAudioDevice(i, z);
        }
        throw new GdxRuntimeException("Android audio is not enabled by the application config.");
    }

    @Override // com.badlogic.gdx.Audio
    public Music newMusic(FileHandle fileHandle) {
        if (this.soundPool != null) {
            AndroidFileHandle androidFileHandle = (AndroidFileHandle) fileHandle;
            MediaPlayer mediaPlayer = new MediaPlayer();
            if (androidFileHandle.type() == Files.FileType.Internal) {
                try {
                    AssetFileDescriptor assetFileDescriptor = androidFileHandle.getAssetFileDescriptor();
                    mediaPlayer.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
                    assetFileDescriptor.close();
                    mediaPlayer.prepare();
                    AndroidMusic androidMusic = new AndroidMusic(this, mediaPlayer);
                    synchronized (this.musics) {
                        this.musics.add(androidMusic);
                    }
                    return androidMusic;
                } catch (Exception e) {
                    throw new GdxRuntimeException("Error loading audio file: " + fileHandle + "\nNote: Internal audio files must be placed in the assets directory.", e);
                }
            } else {
                try {
                    mediaPlayer.setDataSource(androidFileHandle.file().getPath());
                    mediaPlayer.prepare();
                    AndroidMusic androidMusic2 = new AndroidMusic(this, mediaPlayer);
                    synchronized (this.musics) {
                        this.musics.add(androidMusic2);
                    }
                    return androidMusic2;
                } catch (Exception e2) {
                    throw new GdxRuntimeException("Error loading audio file: " + fileHandle, e2);
                }
            }
        } else {
            throw new GdxRuntimeException("Android audio is not enabled by the application config.");
        }
    }

    public Music newMusic(FileDescriptor fileDescriptor) {
        if (this.soundPool != null) {
            MediaPlayer mediaPlayer = new MediaPlayer();
            try {
                mediaPlayer.setDataSource(fileDescriptor);
                mediaPlayer.prepare();
                AndroidMusic androidMusic = new AndroidMusic(this, mediaPlayer);
                synchronized (this.musics) {
                    this.musics.add(androidMusic);
                }
                return androidMusic;
            } catch (Exception e) {
                throw new GdxRuntimeException("Error loading audio from FileDescriptor", e);
            }
        } else {
            throw new GdxRuntimeException("Android audio is not enabled by the application config.");
        }
    }

    @Override // com.badlogic.gdx.Audio
    public Sound newSound(FileHandle fileHandle) {
        if (this.soundPool != null) {
            AndroidFileHandle androidFileHandle = (AndroidFileHandle) fileHandle;
            if (androidFileHandle.type() == Files.FileType.Internal) {
                try {
                    AssetFileDescriptor assetFileDescriptor = androidFileHandle.getAssetFileDescriptor();
                    AndroidSound androidSound = new AndroidSound(this.soundPool, this.manager, this.soundPool.load(assetFileDescriptor, 1));
                    assetFileDescriptor.close();
                    return androidSound;
                } catch (IOException e) {
                    throw new GdxRuntimeException("Error loading audio file: " + fileHandle + "\nNote: Internal audio files must be placed in the assets directory.", e);
                }
            } else {
                try {
                    return new AndroidSound(this.soundPool, this.manager, this.soundPool.load(androidFileHandle.file().getPath(), 1));
                } catch (Exception e2) {
                    throw new GdxRuntimeException("Error loading audio file: " + fileHandle, e2);
                }
            }
        } else {
            throw new GdxRuntimeException("Android audio is not enabled by the application config.");
        }
    }

    @Override // com.badlogic.gdx.Audio
    public AudioRecorder newAudioRecorder(int i, boolean z) {
        if (this.soundPool != null) {
            return new AndroidAudioRecorder(i, z);
        }
        throw new GdxRuntimeException("Android audio is not enabled by the application config.");
    }

    public void dispose() {
        if (this.soundPool != null) {
            synchronized (this.musics) {
                Iterator it = new ArrayList(this.musics).iterator();
                while (it.hasNext()) {
                    ((AndroidMusic) it.next()).dispose();
                }
            }
            this.soundPool.release();
        }
    }
}
