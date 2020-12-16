.class Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "HideBottomViewOnScrollBehavior.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;->animateChildTo(Landroid/view/View;IJLandroid/animation/TimeInterpolator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;


# direct methods
.method constructor <init>(Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;

    .line 120
    .local p0, "this":Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;, "Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;"
    iput-object p1, p0, Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;->this$0:Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .line 123
    .local p0, "this":Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;, "Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;"
    iget-object v0, p0, Landroid/support/design/behavior/HideBottomViewOnScrollBehavior$1;->this$0:Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;->access$002(Landroid/support/design/behavior/HideBottomViewOnScrollBehavior;Landroid/view/ViewPropertyAnimator;)Landroid/view/ViewPropertyAnimator;

    .line 124
    return-void
.end method
