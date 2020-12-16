package com.brashmonkey.spriter;

public class PlayerTweener extends Player {
    private TweenedAnimation anim;
    public String baseBoneName;
    private Player player1;
    private Player player2;
    public boolean updatePlayers;

    @Override // com.brashmonkey.spriter.Player
    public void setAnimation(Animation animation) {
    }

    @Override // com.brashmonkey.spriter.Player
    public void setEntity(Entity entity) {
    }

    public PlayerTweener(Player player, Player player3) {
        super(player.getEntity());
        this.updatePlayers = true;
        this.baseBoneName = null;
        setPlayers(player, player3);
    }

    public PlayerTweener(Entity entity) {
        this(new Player(entity), new Player(entity));
    }

    @Override // com.brashmonkey.spriter.Player
    public void update() {
        if (this.updatePlayers) {
            this.player1.update();
            this.player2.update();
        }
        this.anim.setAnimations(this.player1.animation, this.player2.animation);
        super.update();
        if (this.baseBoneName != null) {
            int boneIndex = (this.anim.onFirstMainLine() ? this.player1 : this.player2).getBoneIndex(this.baseBoneName);
            if (boneIndex != -1) {
                TweenedAnimation tweenedAnimation = this.anim;
                tweenedAnimation.base = tweenedAnimation.getCurrentKey().getBoneRef(boneIndex);
                super.update();
                return;
            }
            throw new SpriterException("A bone with name \"" + this.baseBoneName + "\" does no exist!");
        }
    }

    public void setPlayers(Player player, Player player3) {
        if (player.entity == player3.entity) {
            this.player1 = player;
            this.player2 = player3;
            if (player.entity != this.entity) {
                this.anim = new TweenedAnimation(player.getEntity());
                this.anim.setAnimations(player.animation, player3.animation);
                super.setEntity(player.getEntity());
                super.setAnimation(this.anim);
                return;
            }
            return;
        }
        throw new SpriterException("player1 and player2 have to hold the same entity!");
    }

    public Player getFirstPlayer() {
        return this.player1;
    }

    public Player getSecondPlayer() {
        return this.player2;
    }

    public void setWeight(float f) {
        this.anim.weight = f;
    }

    public float getWeight() {
        return this.anim.weight;
    }

    public void setBaseAnimation(Animation animation) {
        this.anim.baseAnimation = animation;
    }

    public void setBaseAnimation(int i) {
        setBaseAnimation(this.entity.getAnimation(i));
    }

    public void setBaseAnimation(String str) {
        setBaseAnimation(this.entity.getAnimation(str));
    }

    public Animation getBaseAnimation() {
        return this.anim.baseAnimation;
    }
}
