.class Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;
.super Ljava/lang/Object;
.source "AppBarLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/AppBarLayout$BaseBehavior;->animateOffsetWithDuration(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/AppBarLayout$BaseBehavior;

.field final synthetic val$child:Landroid/support/design/widget/AppBarLayout;

.field final synthetic val$coordinatorLayout:Landroid/support/design/widget/CoordinatorLayout;


# direct methods
.method constructor <init>(Landroid/support/design/widget/AppBarLayout$BaseBehavior;Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/design/widget/AppBarLayout$BaseBehavior;

    .line 1060
    .local p0, "this":Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;, "Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;"
    iput-object p1, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->this$0:Landroid/support/design/widget/AppBarLayout$BaseBehavior;

    iput-object p2, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->val$coordinatorLayout:Landroid/support/design/widget/CoordinatorLayout;

    iput-object p3, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->val$child:Landroid/support/design/widget/AppBarLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1, "animator"    # Landroid/animation/ValueAnimator;

    .line 1063
    .local p0, "this":Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;, "Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;"
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->this$0:Landroid/support/design/widget/AppBarLayout$BaseBehavior;

    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->val$coordinatorLayout:Landroid/support/design/widget/CoordinatorLayout;

    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$BaseBehavior$1;->val$child:Landroid/support/design/widget/AppBarLayout;

    .line 1064
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1063
    invoke-virtual {v0, v1, v2, v3}, Landroid/support/design/widget/AppBarLayout$BaseBehavior;->setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)I

    .line 1065
    return-void
.end method
