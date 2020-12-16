.class Lcom/trendmicro/hippo/SecurityController$1;
.super Ljava/lang/Object;
.source "SecurityController.java"

# interfaces
.implements Lcom/trendmicro/hippo/Script;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/SecurityController;->callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/SecurityController;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$callable:Lcom/trendmicro/hippo/Callable;

.field final synthetic val$thisObj:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/SecurityController;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/SecurityController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 157
    iput-object p1, p0, Lcom/trendmicro/hippo/SecurityController$1;->this$0:Lcom/trendmicro/hippo/SecurityController;

    iput-object p2, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$callable:Lcom/trendmicro/hippo/Callable;

    iput-object p3, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$thisObj:Lcom/trendmicro/hippo/Scriptable;

    iput-object p4, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 161
    iget-object v0, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$callable:Lcom/trendmicro/hippo/Callable;

    iget-object v1, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$thisObj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/SecurityController$1;->val$args:[Ljava/lang/Object;

    invoke-interface {v0, p1, p2, v1, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
