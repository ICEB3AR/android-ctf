.class Landroid/support/design/widget/ViewOffsetBehavior;
.super Landroid/support/design/widget/CoordinatorLayout$Behavior;
.source "ViewOffsetBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroid/support/design/widget/CoordinatorLayout$Behavior<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private tempLeftRightOffset:I

.field private tempTopBottomOffset:I

.field private viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout$Behavior;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempTopBottomOffset:I

    .line 30
    iput v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempLeftRightOffset:I

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 35
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/CoordinatorLayout$Behavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempTopBottomOffset:I

    .line 30
    iput v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempLeftRightOffset:I

    .line 36
    return-void
.end method


# virtual methods
.method public getLeftAndRightOffset()I
    .locals 1

    .line 88
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->getLeftAndRightOffset()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTopAndBottomOffset()I
    .locals 1

    .line 84
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->getTopAndBottomOffset()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected layoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)V
    .locals 0
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p3, "layoutDirection"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;I)V"
        }
    .end annotation

    .line 62
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    .local p2, "child":Landroid/view/View;, "TV;"
    invoke-virtual {p1, p2, p3}, Landroid/support/design/widget/CoordinatorLayout;->onLayoutChild(Landroid/view/View;I)V

    .line 63
    return-void
.end method

.method public onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 3
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p3, "layoutDirection"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/CoordinatorLayout;",
            "TV;I)Z"
        }
    .end annotation

    .line 41
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    .local p2, "child":Landroid/view/View;, "TV;"
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/ViewOffsetBehavior;->layoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)V

    .line 43
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Landroid/support/design/widget/ViewOffsetHelper;

    invoke-direct {v0, p2}, Landroid/support/design/widget/ViewOffsetHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    .line 46
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->onViewLayout()V

    .line 48
    iget v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempTopBottomOffset:I

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 49
    iget-object v2, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v2, v0}, Landroid/support/design/widget/ViewOffsetHelper;->setTopAndBottomOffset(I)Z

    .line 50
    iput v1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempTopBottomOffset:I

    .line 52
    :cond_1
    iget v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempLeftRightOffset:I

    if-eqz v0, :cond_2

    .line 53
    iget-object v2, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    invoke-virtual {v2, v0}, Landroid/support/design/widget/ViewOffsetHelper;->setLeftAndRightOffset(I)Z

    .line 54
    iput v1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempLeftRightOffset:I

    .line 57
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public setLeftAndRightOffset(I)Z
    .locals 1
    .param p1, "offset"    # I

    .line 75
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {v0, p1}, Landroid/support/design/widget/ViewOffsetHelper;->setLeftAndRightOffset(I)Z

    move-result v0

    return v0

    .line 78
    :cond_0
    iput p1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempLeftRightOffset:I

    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public setTopAndBottomOffset(I)Z
    .locals 1
    .param p1, "offset"    # I

    .line 66
    .local p0, "this":Landroid/support/design/widget/ViewOffsetBehavior;, "Landroid/support/design/widget/ViewOffsetBehavior<TV;>;"
    iget-object v0, p0, Landroid/support/design/widget/ViewOffsetBehavior;->viewOffsetHelper:Landroid/support/design/widget/ViewOffsetHelper;

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0, p1}, Landroid/support/design/widget/ViewOffsetHelper;->setTopAndBottomOffset(I)Z

    move-result v0

    return v0

    .line 69
    :cond_0
    iput p1, p0, Landroid/support/design/widget/ViewOffsetBehavior;->tempTopBottomOffset:I

    .line 71
    const/4 v0, 0x0

    return v0
.end method
