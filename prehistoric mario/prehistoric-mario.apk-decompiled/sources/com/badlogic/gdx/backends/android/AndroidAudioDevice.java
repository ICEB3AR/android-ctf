package com.badlogic.gdx.backends.android;

import android.media.AudioTrack;
import com.badlogic.gdx.audio.AudioDevice;
import com.badlogic.gdx.graphics.GL20;

class AndroidAudioDevice implements AudioDevice {
    private short[] buffer = new short[GL20.GL_STENCIL_BUFFER_BIT];
    private final boolean isMono;
    private final int latency;
    private final AudioTrack track;

    AndroidAudioDevice(int i, boolean z) {
        this.isMono = z;
        int i2 = 2;
        int minBufferSize = AudioTrack.getMinBufferSize(i, z ? 4 : 12, 2);
        this.track = new AudioTrack(3, i, z ? 4 : 12, 2, minBufferSize, 1);
        this.track.play();
        this.latency = minBufferSize / (z ? 1 : i2);
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.audio.AudioDevice
    public void dispose() {
        this.track.stop();
        this.track.release();
    }

    @Override // com.badlogic.gdx.audio.AudioDevice
    public boolean isMono() {
        return this.isMono;
    }

    @Override // com.badlogic.gdx.audio.AudioDevice
    public void writeSamples(short[] sArr, int i, int i2) {
        int write = this.track.write(sArr, i, i2);
        while (write != i2) {
            write += this.track.write(sArr, i + write, i2 - write);
        }
    }

    @Override // com.badlogic.gdx.audio.AudioDevice
    public void writeSamples(float[] fArr, int i, int i2) {
        if (this.buffer.length < fArr.length) {
            this.buffer = new short[fArr.length];
        }
        int i3 = i + i2;
        int i4 = 0;
        while (i < i3) {
            float f = fArr[i];
            if (f > 1.0f) {
                f = 1.0f;
            }
            if (f < -1.0f) {
                f = -1.0f;
            }
            this.buffer[i4] = (short) ((int) (f * 32767.0f));
            i++;
            i4++;
        }
        int write = this.track.write(this.buffer, 0, i2);
        while (write != i2) {
            write += this.track.write(this.buffer, write, i2 - write);
        }
    }

    @Override // com.badlogic.gdx.audio.AudioDevice
    public int getLatency() {
        return this.latency;
    }

    @Override // com.badlogic.gdx.audio.AudioDevice
    public void setVolume(float f) {
        this.track.setStereoVolume(f, f);
    }
}
