.class Lcom/trendmicro/hippo/ScriptRuntime$1;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "ScriptRuntime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/ScriptRuntime;->typeErrorThrower(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/BaseFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x51c3ab3075dc730eL


# direct methods
.method constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 58
    const-string v0, "msg.op.not.allowed"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public getLength()I
    .locals 1

    .line 62
    const/4 v0, 0x0

    return v0
.end method
