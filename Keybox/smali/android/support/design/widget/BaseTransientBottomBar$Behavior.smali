.class public Landroid/support/design/widget/BaseTransientBottomBar$Behavior;
.super Landroid/support/design/widget/SwipeDismissBehavior;
.source "BaseTransientBottomBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/BaseTransientBottomBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Behavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/design/widget/SwipeDismissBehavior<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private final delegate:Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 792
    invoke-direct {p0}, Landroid/support/design/widget/SwipeDismissBehavior;-><init>()V

    .line 793
    new-instance v0, Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;

    invoke-direct {v0, p0}, Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;-><init>(Landroid/support/design/widget/SwipeDismissBehavior;)V

    iput-object v0, p0, Landroid/support/design/widget/BaseTransientBottomBar$Behavior;->delegate:Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;

    .line 794
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/BaseTransientBottomBar$Behavior;Landroid/support/design/widget/BaseTransientBottomBar;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/BaseTransientBottomBar$Behavior;
    .param p1, "x1"    # Landroid/support/design/widget/BaseTransientBottomBar;

    .line 789
    invoke-direct {p0, p1}, Landroid/support/design/widget/BaseTransientBottomBar$Behavior;->setBaseTransientBottomBar(Landroid/support/design/widget/BaseTransientBottomBar;)V

    return-void
.end method

.method private setBaseTransientBottomBar(Landroid/support/design/widget/BaseTransientBottomBar;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/design/widget/BaseTransientBottomBar<",
            "*>;)V"
        }
    .end annotation

    .line 797
    .local p1, "baseTransientBottomBar":Landroid/support/design/widget/BaseTransientBottomBar;, "Landroid/support/design/widget/BaseTransientBottomBar<*>;"
    iget-object v0, p0, Landroid/support/design/widget/BaseTransientBottomBar$Behavior;->delegate:Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;->setBaseTransientBottomBar(Landroid/support/design/widget/BaseTransientBottomBar;)V

    .line 798
    return-void
.end method


# virtual methods
.method public canSwipeDismissView(Landroid/view/View;)Z
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 802
    iget-object v0, p0, Landroid/support/design/widget/BaseTransientBottomBar$Behavior;->delegate:Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;->canSwipeDismissView(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "event"    # Landroid/view/MotionEvent;

    .line 807
    iget-object v0, p0, Landroid/support/design/widget/BaseTransientBottomBar$Behavior;->delegate:Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/design/widget/BaseTransientBottomBar$BehaviorDelegate;->onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 808
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/SwipeDismissBehavior;->onInterceptTouchEvent(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
