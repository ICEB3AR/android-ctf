.class Lcom/trendmicro/hippo/NativeArray$1;
.super Ljava/lang/Object;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/NativeArray;->js_sort(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$cmpBuf:[Ljava/lang/Object;

.field final synthetic val$cx:Lcom/trendmicro/hippo/Context;

.field final synthetic val$funThis:Lcom/trendmicro/hippo/Scriptable;

.field final synthetic val$jsCompareFunction:Lcom/trendmicro/hippo/Callable;

.field final synthetic val$scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>([Ljava/lang/Object;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1144
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    iput-object p2, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$jsCompareFunction:Lcom/trendmicro/hippo/Callable;

    iput-object p3, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$cx:Lcom/trendmicro/hippo/Context;

    iput-object p4, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    iput-object p5, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$funThis:Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 8
    .param p1, "x"    # Ljava/lang/Object;
    .param p2, "y"    # Ljava/lang/Object;

    .line 1148
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 1149
    const/4 v2, 0x1

    aput-object p2, v0, v2

    .line 1150
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$jsCompareFunction:Lcom/trendmicro/hippo/Callable;

    iget-object v4, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$cx:Lcom/trendmicro/hippo/Context;

    iget-object v5, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v6, p0, Lcom/trendmicro/hippo/NativeArray$1;->val$funThis:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, v4, v5, v6, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1152
    .local v0, "ret":Ljava/lang/Object;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    .line 1153
    .local v3, "d":D
    const-wide/16 v5, 0x0

    cmpg-double v7, v3, v5

    if-gez v7, :cond_0

    .line 1154
    const/4 v1, -0x1

    return v1

    .line 1155
    :cond_0
    cmpl-double v5, v3, v5

    if-lez v5, :cond_1

    .line 1156
    return v2

    .line 1158
    :cond_1
    return v1
.end method
