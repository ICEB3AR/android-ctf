package com.badlogic.gdx.backends.android;

import android.media.MediaPlayer;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.audio.Music;
import java.io.IOException;

public class AndroidMusic implements Music, MediaPlayer.OnCompletionListener {
    private final AndroidAudio audio;
    private boolean isPrepared = true;
    protected Music.OnCompletionListener onCompletionListener;
    private MediaPlayer player;
    private float volume = 1.0f;
    protected boolean wasPlaying = false;

    AndroidMusic(AndroidAudio androidAudio, MediaPlayer mediaPlayer) {
        this.audio = androidAudio;
        this.player = mediaPlayer;
        this.onCompletionListener = null;
        this.player.setOnCompletionListener(this);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x001e, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:?, code lost:
        com.badlogic.gdx.Gdx.app.log("AndroidMusic", "error while disposing AndroidMusic instance, non-fatal");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0029, code lost:
        r4.player = null;
        r4.onCompletionListener = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0031, code lost:
        monitor-enter(r4.audio.musics);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:?, code lost:
        r4.audio.musics.remove(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x003e, code lost:
        r4.player = null;
        r4.onCompletionListener = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0046, code lost:
        monitor-enter(r4.audio.musics);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
        r4.audio.musics.remove(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x004f, code lost:
        throw r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:?, code lost:
        return;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:16:0x0020 */
    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.audio.Music
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void dispose() {
        /*
            r4 = this;
            android.media.MediaPlayer r0 = r4.player
            if (r0 != 0) goto L_0x0005
            return
        L_0x0005:
            r1 = 0
            r0.release()     // Catch:{ Throwable -> 0x0020 }
            r4.player = r1
            r4.onCompletionListener = r1
            com.badlogic.gdx.backends.android.AndroidAudio r0 = r4.audio
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r0 = r0.musics
            monitor-enter(r0)
            com.badlogic.gdx.backends.android.AndroidAudio r1 = r4.audio     // Catch:{ all -> 0x001b }
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r1 = r1.musics     // Catch:{ all -> 0x001b }
            r1.remove(r4)     // Catch:{ all -> 0x001b }
            monitor-exit(r0)     // Catch:{ all -> 0x001b }
            goto L_0x003a
        L_0x001b:
            r1 = move-exception
            monitor-exit(r0)     // Catch:{ all -> 0x001b }
            throw r1
        L_0x001e:
            r0 = move-exception
            goto L_0x003e
        L_0x0020:
            com.badlogic.gdx.Application r0 = com.badlogic.gdx.Gdx.app     // Catch:{ all -> 0x001e }
            java.lang.String r2 = "AndroidMusic"
            java.lang.String r3 = "error while disposing AndroidMusic instance, non-fatal"
            r0.log(r2, r3)     // Catch:{ all -> 0x001e }
            r4.player = r1
            r4.onCompletionListener = r1
            com.badlogic.gdx.backends.android.AndroidAudio r0 = r4.audio
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r0 = r0.musics
            monitor-enter(r0)
            com.badlogic.gdx.backends.android.AndroidAudio r1 = r4.audio     // Catch:{ all -> 0x003b }
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r1 = r1.musics     // Catch:{ all -> 0x003b }
            r1.remove(r4)     // Catch:{ all -> 0x003b }
            monitor-exit(r0)     // Catch:{ all -> 0x003b }
        L_0x003a:
            return
        L_0x003b:
            r1 = move-exception
            monitor-exit(r0)     // Catch:{ all -> 0x003b }
            throw r1
        L_0x003e:
            r4.player = r1
            r4.onCompletionListener = r1
            com.badlogic.gdx.backends.android.AndroidAudio r1 = r4.audio
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r1 = r1.musics
            monitor-enter(r1)
            com.badlogic.gdx.backends.android.AndroidAudio r2 = r4.audio     // Catch:{ all -> 0x0050 }
            java.util.List<com.badlogic.gdx.backends.android.AndroidMusic> r2 = r2.musics     // Catch:{ all -> 0x0050 }
            r2.remove(r4)     // Catch:{ all -> 0x0050 }
            monitor-exit(r1)     // Catch:{ all -> 0x0050 }
            throw r0
        L_0x0050:
            r0 = move-exception
            monitor-exit(r1)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.backends.android.AndroidMusic.dispose():void");
    }

    @Override // com.badlogic.gdx.audio.Music
    public boolean isLooping() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer == null) {
            return false;
        }
        try {
            return mediaPlayer.isLooping();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public boolean isPlaying() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer == null) {
            return false;
        }
        try {
            return mediaPlayer.isPlaying();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void pause() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            try {
                if (mediaPlayer.isPlaying()) {
                    this.player.pause();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.wasPlaying = false;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void play() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            try {
                if (!mediaPlayer.isPlaying()) {
                    try {
                        if (!this.isPrepared) {
                            this.player.prepare();
                            this.isPrepared = true;
                        }
                        this.player.start();
                    } catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void setLooping(boolean z) {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            mediaPlayer.setLooping(z);
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void setVolume(float f) {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            mediaPlayer.setVolume(f, f);
            this.volume = f;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public float getVolume() {
        return this.volume;
    }

    @Override // com.badlogic.gdx.audio.Music
    public void setPan(float f, float f2) {
        float f3;
        float f4;
        if (this.player != null) {
            if (f < 0.0f) {
                f4 = f2 * (1.0f - Math.abs(f));
                f3 = f2;
            } else if (f > 0.0f) {
                f3 = f2 * (1.0f - Math.abs(f));
                f4 = f2;
            } else {
                f3 = f2;
                f4 = f3;
            }
            this.player.setVolume(f3, f4);
            this.volume = f2;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void stop() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            if (this.isPrepared) {
                mediaPlayer.seekTo(0);
            }
            this.player.stop();
            this.isPrepared = false;
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public void setPosition(float f) {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer != null) {
            try {
                if (!this.isPrepared) {
                    mediaPlayer.prepare();
                    this.isPrepared = true;
                }
                this.player.seekTo((int) (f * 1000.0f));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    @Override // com.badlogic.gdx.audio.Music
    public float getPosition() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer == null) {
            return 0.0f;
        }
        return ((float) mediaPlayer.getCurrentPosition()) / 1000.0f;
    }

    public float getDuration() {
        MediaPlayer mediaPlayer = this.player;
        if (mediaPlayer == null) {
            return 0.0f;
        }
        return ((float) mediaPlayer.getDuration()) / 1000.0f;
    }

    @Override // com.badlogic.gdx.audio.Music
    public void setOnCompletionListener(Music.OnCompletionListener onCompletionListener2) {
        this.onCompletionListener = onCompletionListener2;
    }

    public void onCompletion(MediaPlayer mediaPlayer) {
        if (this.onCompletionListener != null) {
            Gdx.app.postRunnable(new Runnable() {
                /* class com.badlogic.gdx.backends.android.AndroidMusic.AnonymousClass1 */

                public void run() {
                    AndroidMusic.this.onCompletionListener.onCompletion(AndroidMusic.this);
                }
            });
        }
    }
}
