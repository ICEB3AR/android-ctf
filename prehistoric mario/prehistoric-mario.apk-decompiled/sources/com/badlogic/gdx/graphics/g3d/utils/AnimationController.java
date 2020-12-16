package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Pool;

public class AnimationController extends BaseAnimationController {
    public boolean allowSameAnimation;
    protected final Pool<AnimationDesc> animationPool = new Pool<AnimationDesc>() {
        /* class com.badlogic.gdx.graphics.g3d.utils.AnimationController.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public AnimationDesc newObject() {
            return new AnimationDesc();
        }
    };
    public AnimationDesc current;
    public boolean inAction;
    private boolean justChangedAnimation = false;
    public boolean paused;
    public AnimationDesc previous;
    public AnimationDesc queued;
    public float queuedTransitionTime;
    public float transitionCurrentTime;
    public float transitionTargetTime;

    public interface AnimationListener {
        void onEnd(AnimationDesc animationDesc);

        void onLoop(AnimationDesc animationDesc);
    }

    public static class AnimationDesc {
        public Animation animation;
        public float duration;
        public AnimationListener listener;
        public int loopCount;
        public float offset;
        public float speed;
        public float time;

        protected AnimationDesc() {
        }

        /* access modifiers changed from: protected */
        public float update(float f) {
            int i;
            AnimationListener animationListener;
            if (this.loopCount == 0 || this.animation == null) {
                return f;
            }
            float f2 = this.speed * f;
            float f3 = 0.0f;
            if (!MathUtils.isZero(this.duration)) {
                this.time += f2;
                i = (int) Math.abs(this.time / this.duration);
                if (this.time < 0.0f) {
                    i++;
                    while (true) {
                        float f4 = this.time;
                        if (f4 >= 0.0f) {
                            break;
                        }
                        this.time = f4 + this.duration;
                    }
                }
                this.time = Math.abs(this.time % this.duration);
            } else {
                i = 1;
            }
            for (int i2 = 0; i2 < i; i2++) {
                int i3 = this.loopCount;
                if (i3 > 0) {
                    this.loopCount = i3 - 1;
                }
                if (!(this.loopCount == 0 || (animationListener = this.listener) == null)) {
                    animationListener.onLoop(this);
                }
                if (this.loopCount == 0) {
                    float f5 = this.duration;
                    float f6 = (((float) ((i - 1) - i2)) * f5) + (f2 < 0.0f ? f5 - this.time : this.time);
                    if (f2 >= 0.0f) {
                        f3 = this.duration;
                    }
                    this.time = f3;
                    AnimationListener animationListener2 = this.listener;
                    if (animationListener2 != null) {
                        animationListener2.onEnd(this);
                    }
                    return f6;
                }
            }
            return 0.0f;
        }
    }

    public AnimationController(ModelInstance modelInstance) {
        super(modelInstance);
    }

    private AnimationDesc obtain(Animation animation, float f, float f2, int i, float f3, AnimationListener animationListener) {
        if (animation == null) {
            return null;
        }
        AnimationDesc obtain = this.animationPool.obtain();
        obtain.animation = animation;
        obtain.listener = animationListener;
        obtain.loopCount = i;
        obtain.speed = f3;
        obtain.offset = f;
        float f4 = 0.0f;
        if (f2 < 0.0f) {
            f2 = animation.duration - f;
        }
        obtain.duration = f2;
        if (f3 < 0.0f) {
            f4 = obtain.duration;
        }
        obtain.time = f4;
        return obtain;
    }

    private AnimationDesc obtain(String str, float f, float f2, int i, float f3, AnimationListener animationListener) {
        if (str == null) {
            return null;
        }
        Animation animation = this.target.getAnimation(str);
        if (animation != null) {
            return obtain(animation, f, f2, i, f3, animationListener);
        }
        throw new GdxRuntimeException("Unknown animation: " + str);
    }

    private AnimationDesc obtain(AnimationDesc animationDesc) {
        return obtain(animationDesc.animation, animationDesc.offset, animationDesc.duration, animationDesc.loopCount, animationDesc.speed, animationDesc.listener);
    }

    public void update(float f) {
        AnimationDesc animationDesc;
        if (!this.paused) {
            AnimationDesc animationDesc2 = this.previous;
            if (animationDesc2 != null) {
                float f2 = this.transitionCurrentTime + f;
                this.transitionCurrentTime = f2;
                if (f2 >= this.transitionTargetTime) {
                    removeAnimation(animationDesc2.animation);
                    this.justChangedAnimation = true;
                    this.animationPool.free(this.previous);
                    this.previous = null;
                }
            }
            if (this.justChangedAnimation) {
                this.target.calculateTransforms();
                this.justChangedAnimation = false;
            }
            AnimationDesc animationDesc3 = this.current;
            if (animationDesc3 != null && animationDesc3.loopCount != 0 && this.current.animation != null) {
                float update = this.current.update(f);
                if (update == 0.0f || (animationDesc = this.queued) == null) {
                    AnimationDesc animationDesc4 = this.previous;
                    if (animationDesc4 != null) {
                        applyAnimations(animationDesc4.animation, this.previous.offset + this.previous.time, this.current.animation, this.current.offset + this.current.time, this.transitionCurrentTime / this.transitionTargetTime);
                    } else {
                        applyAnimation(this.current.animation, this.current.offset + this.current.time);
                    }
                } else {
                    this.inAction = false;
                    animate(animationDesc, this.queuedTransitionTime);
                    this.queued = null;
                    update(update);
                }
            }
        }
    }

    public AnimationDesc setAnimation(String str) {
        return setAnimation(str, 1, 1.0f, null);
    }

    public AnimationDesc setAnimation(String str, int i) {
        return setAnimation(str, i, 1.0f, null);
    }

    public AnimationDesc setAnimation(String str, AnimationListener animationListener) {
        return setAnimation(str, 1, 1.0f, animationListener);
    }

    public AnimationDesc setAnimation(String str, int i, AnimationListener animationListener) {
        return setAnimation(str, i, 1.0f, animationListener);
    }

    public AnimationDesc setAnimation(String str, int i, float f, AnimationListener animationListener) {
        return setAnimation(str, 0.0f, -1.0f, i, f, animationListener);
    }

    public AnimationDesc setAnimation(String str, float f, float f2, int i, float f3, AnimationListener animationListener) {
        return setAnimation(obtain(str, f, f2, i, f3, animationListener));
    }

    /* access modifiers changed from: protected */
    public AnimationDesc setAnimation(Animation animation, float f, float f2, int i, float f3, AnimationListener animationListener) {
        return setAnimation(obtain(animation, f, f2, i, f3, animationListener));
    }

    /* access modifiers changed from: protected */
    public AnimationDesc setAnimation(AnimationDesc animationDesc) {
        AnimationDesc animationDesc2 = this.current;
        if (animationDesc2 == null) {
            this.current = animationDesc;
        } else {
            if (this.allowSameAnimation || animationDesc == null || animationDesc2.animation != animationDesc.animation) {
                removeAnimation(this.current.animation);
            } else {
                animationDesc.time = this.current.time;
            }
            this.animationPool.free(this.current);
            this.current = animationDesc;
        }
        this.justChangedAnimation = true;
        return animationDesc;
    }

    public AnimationDesc animate(String str, float f) {
        return animate(str, 1, 1.0f, null, f);
    }

    public AnimationDesc animate(String str, AnimationListener animationListener, float f) {
        return animate(str, 1, 1.0f, animationListener, f);
    }

    public AnimationDesc animate(String str, int i, AnimationListener animationListener, float f) {
        return animate(str, i, 1.0f, animationListener, f);
    }

    public AnimationDesc animate(String str, int i, float f, AnimationListener animationListener, float f2) {
        return animate(str, 0.0f, -1.0f, i, f, animationListener, f2);
    }

    public AnimationDesc animate(String str, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return animate(obtain(str, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc animate(Animation animation, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return animate(obtain(animation, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc animate(AnimationDesc animationDesc, float f) {
        AnimationDesc animationDesc2 = this.current;
        if (animationDesc2 == null) {
            this.current = animationDesc;
        } else if (this.inAction) {
            queue(animationDesc, f);
        } else if (this.allowSameAnimation || animationDesc == null || animationDesc2.animation != animationDesc.animation) {
            AnimationDesc animationDesc3 = this.previous;
            if (animationDesc3 != null) {
                removeAnimation(animationDesc3.animation);
                this.animationPool.free(this.previous);
            }
            this.previous = this.current;
            this.current = animationDesc;
            this.transitionCurrentTime = 0.0f;
            this.transitionTargetTime = f;
        } else {
            animationDesc.time = this.current.time;
            this.animationPool.free(this.current);
            this.current = animationDesc;
        }
        return animationDesc;
    }

    public AnimationDesc queue(String str, int i, float f, AnimationListener animationListener, float f2) {
        return queue(str, 0.0f, -1.0f, i, f, animationListener, f2);
    }

    public AnimationDesc queue(String str, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return queue(obtain(str, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc queue(Animation animation, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return queue(obtain(animation, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc queue(AnimationDesc animationDesc, float f) {
        AnimationDesc animationDesc2 = this.current;
        if (animationDesc2 == null || animationDesc2.loopCount == 0) {
            animate(animationDesc, f);
        } else {
            AnimationDesc animationDesc3 = this.queued;
            if (animationDesc3 != null) {
                this.animationPool.free(animationDesc3);
            }
            this.queued = animationDesc;
            this.queuedTransitionTime = f;
            if (this.current.loopCount < 0) {
                this.current.loopCount = 1;
            }
        }
        return animationDesc;
    }

    public AnimationDesc action(String str, int i, float f, AnimationListener animationListener, float f2) {
        return action(str, 0.0f, -1.0f, i, f, animationListener, f2);
    }

    public AnimationDesc action(String str, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return action(obtain(str, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc action(Animation animation, float f, float f2, int i, float f3, AnimationListener animationListener, float f4) {
        return action(obtain(animation, f, f2, i, f3, animationListener), f4);
    }

    /* access modifiers changed from: protected */
    public AnimationDesc action(AnimationDesc animationDesc, float f) {
        if (animationDesc.loopCount >= 0) {
            AnimationDesc animationDesc2 = this.current;
            if (animationDesc2 == null || animationDesc2.loopCount == 0) {
                animate(animationDesc, f);
            } else {
                AnimationDesc obtain = this.inAction ? null : obtain(this.current);
                this.inAction = false;
                animate(animationDesc, f);
                this.inAction = true;
                if (obtain != null) {
                    queue(obtain, f);
                }
            }
            return animationDesc;
        }
        throw new GdxRuntimeException("An action cannot be continuous");
    }
}
