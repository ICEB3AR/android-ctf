.class Landroid/support/design/widget/BaseTransientBottomBar$9;
.super Ljava/lang/Object;
.source "BaseTransientBottomBar.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/BaseTransientBottomBar;->animateViewIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private previousAnimatedIntValue:I

.field final synthetic this$0:Landroid/support/design/widget/BaseTransientBottomBar;

.field final synthetic val$translationYBottom:I


# direct methods
.method constructor <init>(Landroid/support/design/widget/BaseTransientBottomBar;I)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/design/widget/BaseTransientBottomBar;

    .line 591
    .local p0, "this":Landroid/support/design/widget/BaseTransientBottomBar$9;, "Landroid/support/design/widget/BaseTransientBottomBar$9;"
    iput-object p1, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->this$0:Landroid/support/design/widget/BaseTransientBottomBar;

    iput p2, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->val$translationYBottom:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    iget p2, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->val$translationYBottom:I

    iput p2, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->previousAnimatedIntValue:I

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .param p1, "animator"    # Landroid/animation/ValueAnimator;

    .line 596
    .local p0, "this":Landroid/support/design/widget/BaseTransientBottomBar$9;, "Landroid/support/design/widget/BaseTransientBottomBar$9;"
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 597
    .local v0, "currentAnimatedIntValue":I
    invoke-static {}, Landroid/support/design/widget/BaseTransientBottomBar;->access$200()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 600
    iget-object v1, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->this$0:Landroid/support/design/widget/BaseTransientBottomBar;

    iget-object v1, v1, Landroid/support/design/widget/BaseTransientBottomBar;->view:Landroid/support/design/widget/BaseTransientBottomBar$SnackbarBaseLayout;

    iget v2, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->previousAnimatedIntValue:I

    sub-int v2, v0, v2

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->offsetTopAndBottom(Landroid/view/View;I)V

    goto :goto_0

    .line 603
    :cond_0
    iget-object v1, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->this$0:Landroid/support/design/widget/BaseTransientBottomBar;

    iget-object v1, v1, Landroid/support/design/widget/BaseTransientBottomBar;->view:Landroid/support/design/widget/BaseTransientBottomBar$SnackbarBaseLayout;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/support/design/widget/BaseTransientBottomBar$SnackbarBaseLayout;->setTranslationY(F)V

    .line 605
    :goto_0
    iput v0, p0, Landroid/support/design/widget/BaseTransientBottomBar$9;->previousAnimatedIntValue:I

    .line 606
    return-void
.end method
