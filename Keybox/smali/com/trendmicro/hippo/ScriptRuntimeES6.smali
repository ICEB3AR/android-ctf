.class public Lcom/trendmicro/hippo/ScriptRuntimeES6;
.super Ljava/lang/Object;
.source "ScriptRuntimeES6.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "val"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "idFuncObj"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 12
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 15
    return-object p1

    .line 13
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/IdFunctionObject;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.called.null.or.undefined"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method
