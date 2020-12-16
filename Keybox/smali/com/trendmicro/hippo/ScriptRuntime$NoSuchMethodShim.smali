.class Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"

# interfaces
.implements Lcom/trendmicro/hippo/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NoSuchMethodShim"
.end annotation


# instance fields
.field methodName:Ljava/lang/String;

.field noSuchMethodMethod:Lcom/trendmicro/hippo/Callable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Callable;Ljava/lang/String;)V
    .locals 0
    .param p1, "noSuchMethodMethod"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "methodName"    # Ljava/lang/String;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->noSuchMethodMethod:Lcom/trendmicro/hippo/Callable;

    .line 79
    iput-object p2, p0, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->methodName:Ljava/lang/String;

    .line 80
    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 96
    .local v0, "nestedArgs":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->methodName:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 97
    const/4 v1, 0x0

    invoke-static {p4, v1, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->newArrayLiteral([Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 98
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;->noSuchMethodMethod:Lcom/trendmicro/hippo/Callable;

    invoke-interface {v1, p1, p2, p3, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
