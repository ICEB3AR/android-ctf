package com.badlogic.gdx.backends.android;

import android.media.AudioManager;
import android.media.SoundPool;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.utils.IntArray;

final class AndroidSound implements Sound {
    final AudioManager manager;
    final int soundId;
    final SoundPool soundPool;
    final IntArray streamIds = new IntArray(8);

    AndroidSound(SoundPool soundPool2, AudioManager audioManager, int i) {
        this.soundPool = soundPool2;
        this.manager = audioManager;
        this.soundId = i;
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.audio.Sound
    public void dispose() {
        this.soundPool.unload(this.soundId);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long play() {
        return play(1.0f);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long play(float f) {
        if (this.streamIds.size == 8) {
            this.streamIds.pop();
        }
        int play = this.soundPool.play(this.soundId, f, f, 1, 0, 1.0f);
        if (play == 0) {
            return -1;
        }
        this.streamIds.insert(0, play);
        return (long) play;
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void stop() {
        int i = this.streamIds.size;
        for (int i2 = 0; i2 < i; i2++) {
            this.soundPool.stop(this.streamIds.get(i2));
        }
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void stop(long j) {
        this.soundPool.stop((int) j);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void pause() {
        this.soundPool.autoPause();
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void pause(long j) {
        this.soundPool.pause((int) j);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void resume() {
        this.soundPool.autoResume();
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void resume(long j) {
        this.soundPool.resume((int) j);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void setPitch(long j, float f) {
        this.soundPool.setRate((int) j, f);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void setVolume(long j, float f) {
        this.soundPool.setVolume((int) j, f, f);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long loop() {
        return loop(1.0f);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long loop(float f) {
        if (this.streamIds.size == 8) {
            this.streamIds.pop();
        }
        int play = this.soundPool.play(this.soundId, f, f, 1, -1, 1.0f);
        if (play == 0) {
            return -1;
        }
        this.streamIds.insert(0, play);
        return (long) play;
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void setLooping(long j, boolean z) {
        this.soundPool.setLoop((int) j, z ? -1 : 0);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public void setPan(long j, float f, float f2) {
        float f3;
        if (f < 0.0f) {
            f3 = f2 * (1.0f - Math.abs(f));
        } else if (f > 0.0f) {
            f2 *= 1.0f - Math.abs(f);
            f3 = f2;
        } else {
            f3 = f2;
        }
        this.soundPool.setVolume((int) j, f2, f3);
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long play(float f, float f2, float f3) {
        float f4;
        float f5;
        if (this.streamIds.size == 8) {
            this.streamIds.pop();
        }
        if (f3 < 0.0f) {
            f5 = f;
            f4 = f * (1.0f - Math.abs(f3));
        } else if (f3 > 0.0f) {
            f4 = f;
            f5 = f * (1.0f - Math.abs(f3));
        } else {
            f5 = f;
            f4 = f5;
        }
        int play = this.soundPool.play(this.soundId, f5, f4, 1, 0, f2);
        if (play == 0) {
            return -1;
        }
        this.streamIds.insert(0, play);
        return (long) play;
    }

    @Override // com.badlogic.gdx.audio.Sound
    public long loop(float f, float f2, float f3) {
        float f4;
        float f5;
        if (this.streamIds.size == 8) {
            this.streamIds.pop();
        }
        if (f3 < 0.0f) {
            f5 = f;
            f4 = f * (1.0f - Math.abs(f3));
        } else if (f3 > 0.0f) {
            f4 = f;
            f5 = f * (1.0f - Math.abs(f3));
        } else {
            f5 = f;
            f4 = f5;
        }
        int play = this.soundPool.play(this.soundId, f5, f4, 1, -1, f2);
        if (play == 0) {
            return -1;
        }
        this.streamIds.insert(0, play);
        return (long) play;
    }
}
