package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;

public abstract class FocusListener implements EventListener {
    public void keyboardFocusChanged(FocusEvent focusEvent, Actor actor, boolean z) {
    }

    public void scrollFocusChanged(FocusEvent focusEvent, Actor actor, boolean z) {
    }

    @Override // com.badlogic.gdx.scenes.scene2d.EventListener
    public boolean handle(Event event) {
        if (!(event instanceof FocusEvent)) {
            return false;
        }
        FocusEvent focusEvent = (FocusEvent) event;
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type[focusEvent.getType().ordinal()];
        if (i == 1) {
            keyboardFocusChanged(focusEvent, event.getTarget(), focusEvent.isFocused());
        } else if (i == 2) {
            scrollFocusChanged(focusEvent, event.getTarget(), focusEvent.isFocused());
        }
        return false;
    }

    /* renamed from: com.badlogic.gdx.scenes.scene2d.utils.FocusListener$1  reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type = new int[FocusEvent.Type.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(6:0|1|2|3|4|6) */
        /* JADX WARNING: Code restructure failed: missing block: B:7:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        static {
            /*
                com.badlogic.gdx.scenes.scene2d.utils.FocusListener$FocusEvent$Type[] r0 = com.badlogic.gdx.scenes.scene2d.utils.FocusListener.FocusEvent.Type.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.scenes.scene2d.utils.FocusListener.AnonymousClass1.$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type = r0
                int[] r0 = com.badlogic.gdx.scenes.scene2d.utils.FocusListener.AnonymousClass1.$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.scenes.scene2d.utils.FocusListener$FocusEvent$Type r1 = com.badlogic.gdx.scenes.scene2d.utils.FocusListener.FocusEvent.Type.keyboard     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.scenes.scene2d.utils.FocusListener.AnonymousClass1.$SwitchMap$com$badlogic$gdx$scenes$scene2d$utils$FocusListener$FocusEvent$Type     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.scenes.scene2d.utils.FocusListener$FocusEvent$Type r1 = com.badlogic.gdx.scenes.scene2d.utils.FocusListener.FocusEvent.Type.scroll     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.utils.FocusListener.AnonymousClass1.<clinit>():void");
        }
    }

    public static class FocusEvent extends Event {
        private boolean focused;
        private Actor relatedActor;
        private Type type;

        public enum Type {
            keyboard,
            scroll
        }

        @Override // com.badlogic.gdx.utils.Pool.Poolable, com.badlogic.gdx.scenes.scene2d.Event
        public void reset() {
            super.reset();
            this.relatedActor = null;
        }

        public boolean isFocused() {
            return this.focused;
        }

        public void setFocused(boolean z) {
            this.focused = z;
        }

        public Type getType() {
            return this.type;
        }

        public void setType(Type type2) {
            this.type = type2;
        }

        public Actor getRelatedActor() {
            return this.relatedActor;
        }

        public void setRelatedActor(Actor actor) {
            this.relatedActor = actor;
        }
    }
}
