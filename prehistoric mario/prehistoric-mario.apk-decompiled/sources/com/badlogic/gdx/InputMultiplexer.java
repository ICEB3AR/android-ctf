package com.badlogic.gdx;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.SnapshotArray;

public class InputMultiplexer implements InputProcessor {
    private SnapshotArray<InputProcessor> processors = new SnapshotArray<>(4);

    public InputMultiplexer() {
    }

    public InputMultiplexer(InputProcessor... inputProcessorArr) {
        this.processors.addAll(inputProcessorArr);
    }

    public void addProcessor(int i, InputProcessor inputProcessor) {
        if (inputProcessor != null) {
            this.processors.insert(i, inputProcessor);
            return;
        }
        throw new NullPointerException("processor cannot be null");
    }

    public void removeProcessor(int i) {
        this.processors.removeIndex(i);
    }

    public void addProcessor(InputProcessor inputProcessor) {
        if (inputProcessor != null) {
            this.processors.add(inputProcessor);
            return;
        }
        throw new NullPointerException("processor cannot be null");
    }

    public void removeProcessor(InputProcessor inputProcessor) {
        this.processors.removeValue(inputProcessor, true);
    }

    public int size() {
        return this.processors.size;
    }

    public void clear() {
        this.processors.clear();
    }

    public void setProcessors(InputProcessor... inputProcessorArr) {
        this.processors.clear();
        this.processors.addAll(inputProcessorArr);
    }

    public void setProcessors(Array<InputProcessor> array) {
        this.processors.clear();
        this.processors.addAll(array);
    }

    public SnapshotArray<InputProcessor> getProcessors() {
        return this.processors;
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean keyDown(int i) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i2 = this.processors.size;
            for (int i3 = 0; i3 < i2; i3++) {
                if (begin[i3].keyDown(i)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean keyUp(int i) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i2 = this.processors.size;
            for (int i3 = 0; i3 < i2; i3++) {
                if (begin[i3].keyUp(i)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean keyTyped(char c) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i = this.processors.size;
            for (int i2 = 0; i2 < i; i2++) {
                if (begin[i2].keyTyped(c)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean touchDown(int i, int i2, int i3, int i4) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i5 = this.processors.size;
            for (int i6 = 0; i6 < i5; i6++) {
                if (begin[i6].touchDown(i, i2, i3, i4)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean touchUp(int i, int i2, int i3, int i4) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i5 = this.processors.size;
            for (int i6 = 0; i6 < i5; i6++) {
                if (begin[i6].touchUp(i, i2, i3, i4)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean touchDragged(int i, int i2, int i3) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i4 = this.processors.size;
            for (int i5 = 0; i5 < i4; i5++) {
                if (begin[i5].touchDragged(i, i2, i3)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean mouseMoved(int i, int i2) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i3 = this.processors.size;
            for (int i4 = 0; i4 < i3; i4++) {
                if (begin[i4].mouseMoved(i, i2)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    @Override // com.badlogic.gdx.InputProcessor
    public boolean scrolled(int i) {
        InputProcessor[] begin = this.processors.begin();
        try {
            int i2 = this.processors.size;
            for (int i3 = 0; i3 < i2; i3++) {
                if (begin[i3].scrolled(i)) {
                    this.processors.end();
                    return true;
                }
            }
            this.processors.end();
            return false;
        } catch (Throwable th) {
            this.processors.end();
            throw th;
        }
    }
}
