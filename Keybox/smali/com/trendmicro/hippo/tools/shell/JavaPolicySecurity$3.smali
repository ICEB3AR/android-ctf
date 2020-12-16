.class Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;
.super Ljava/lang/Object;
.source "JavaPolicySecurity.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

.field final synthetic val$args:[Ljava/lang/Object;

.field final synthetic val$callable:Lcom/trendmicro/hippo/Callable;

.field final synthetic val$cx:Lcom/trendmicro/hippo/Context;

.field final synthetic val$scope:Lcom/trendmicro/hippo/Scriptable;

.field final synthetic val$thisObj:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 229
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->this$0:Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$callable:Lcom/trendmicro/hippo/Callable;

    iput-object p3, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$cx:Lcom/trendmicro/hippo/Context;

    iput-object p4, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    iput-object p5, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$thisObj:Lcom/trendmicro/hippo/Scriptable;

    iput-object p6, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$args:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 5

    .line 231
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$callable:Lcom/trendmicro/hippo/Callable;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$cx:Lcom/trendmicro/hippo/Context;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$thisObj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;->val$args:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
