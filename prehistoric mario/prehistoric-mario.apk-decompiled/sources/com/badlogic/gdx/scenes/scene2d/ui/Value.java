package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public abstract class Value {
    public static Value maxHeight = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass6 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getMaxHeight();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getHeight();
        }
    };
    public static Value maxWidth = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass5 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getMaxWidth();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getWidth();
        }
    };
    public static Value minHeight = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass2 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getMinHeight();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getHeight();
        }
    };
    public static Value minWidth = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass1 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getMinWidth();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getWidth();
        }
    };
    public static Value prefHeight = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass4 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getPrefHeight();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getHeight();
        }
    };
    public static Value prefWidth = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass3 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            if (actor instanceof Layout) {
                return ((Layout) actor).getPrefWidth();
            }
            if (actor == null) {
                return 0.0f;
            }
            return actor.getWidth();
        }
    };
    public static final Fixed zero = new Fixed(0.0f);

    public abstract float get(Actor actor);

    public float get() {
        return get(null);
    }

    public static class Fixed extends Value {
        static final Fixed[] cache = new Fixed[111];
        private final float value;

        public Fixed(float f) {
            this.value = f;
        }

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            return this.value;
        }

        public String toString() {
            return Float.toString(this.value);
        }

        public static Fixed valueOf(float f) {
            if (f == 0.0f) {
                return zero;
            }
            if (f >= -10.0f && f <= 100.0f) {
                int i = (int) f;
                if (f == ((float) i)) {
                    Fixed[] fixedArr = cache;
                    int i2 = i + 10;
                    Fixed fixed = fixedArr[i2];
                    if (fixed != null) {
                        return fixed;
                    }
                    Fixed fixed2 = new Fixed(f);
                    fixedArr[i2] = fixed2;
                    return fixed2;
                }
            }
            return new Fixed(f);
        }
    }

    public static Value percentWidth(final float f) {
        return new Value() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass7 */

            @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
            public float get(Actor actor) {
                return actor.getWidth() * f;
            }
        };
    }

    public static Value percentHeight(final float f) {
        return new Value() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass8 */

            @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
            public float get(Actor actor) {
                return actor.getHeight() * f;
            }
        };
    }

    public static Value percentWidth(final float f, final Actor actor) {
        if (actor != null) {
            return new Value() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass9 */

                @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
                public float get(Actor actor) {
                    return actor.getWidth() * f;
                }
            };
        }
        throw new IllegalArgumentException("actor cannot be null.");
    }

    public static Value percentHeight(final float f, final Actor actor) {
        if (actor != null) {
            return new Value() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.Value.AnonymousClass10 */

                @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
                public float get(Actor actor) {
                    return actor.getHeight() * f;
                }
            };
        }
        throw new IllegalArgumentException("actor cannot be null.");
    }
}
