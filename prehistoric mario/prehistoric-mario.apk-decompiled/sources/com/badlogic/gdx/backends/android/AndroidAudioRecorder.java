package com.badlogic.gdx.backends.android;

import android.media.AudioRecord;
import com.badlogic.gdx.audio.AudioRecorder;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class AndroidAudioRecorder implements AudioRecorder {
    private AudioRecord recorder;

    public AndroidAudioRecorder(int i, boolean z) {
        int i2 = z ? 16 : 12;
        this.recorder = new AudioRecord(1, i, i2, 2, AudioRecord.getMinBufferSize(i, i2, 2));
        if (this.recorder.getState() == 1) {
            this.recorder.startRecording();
            return;
        }
        throw new GdxRuntimeException("Unable to initialize AudioRecorder.\nDo you have the RECORD_AUDIO permission?");
    }

    @Override // com.badlogic.gdx.audio.AudioRecorder, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.recorder.stop();
        this.recorder.release();
    }

    @Override // com.badlogic.gdx.audio.AudioRecorder
    public void read(short[] sArr, int i, int i2) {
        int i3 = 0;
        while (i3 != i2) {
            i3 += this.recorder.read(sArr, i + i3, i2 - i3);
        }
    }
}
