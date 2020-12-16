.class public abstract Lcom/trendmicro/hippo/NativeFunction;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "NativeFunction.java"


# static fields
.field private static final serialVersionUID:J = 0x78edfb41ce2c09d1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    return-void
.end method


# virtual methods
.method final decompile(II)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 34
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getEncodedSource()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "encodedSource":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 36
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 38
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/UintMap;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/UintMap;-><init>(I)V

    .line 39
    .local v1, "properties":Lcom/trendmicro/hippo/UintMap;
    invoke-virtual {v1, v2, p1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 40
    invoke-static {v0, p2, v1}, Lcom/trendmicro/hippo/Decompiler;->decompile(Ljava/lang/String;ILcom/trendmicro/hippo/UintMap;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getArity()I
    .locals 1

    .line 61
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getParamCount()I

    move-result v0

    return v0
.end method

.method public getDebuggableView()Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 1

    .line 85
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEncodedSource()Ljava/lang/String;
    .locals 1

    .line 80
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract getLanguageVersion()I
.end method

.method public getLength()I
    .locals 4

    .line 46
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getParamCount()I

    move-result v0

    .line 47
    .local v0, "paramCount":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-eq v1, v2, :cond_0

    .line 48
    return v0

    .line 50
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 51
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->findFunctionActivation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/NativeCall;

    move-result-object v2

    .line 52
    .local v2, "activation":Lcom/trendmicro/hippo/NativeCall;
    if-nez v2, :cond_1

    .line 53
    return v0

    .line 55
    :cond_1
    iget-object v3, v2, Lcom/trendmicro/hippo/NativeCall;->originalArgs:[Ljava/lang/Object;

    array-length v3, v3

    return v3
.end method

.method protected abstract getParamAndVarCount()I
.end method

.method protected abstract getParamCount()I
.end method

.method protected getParamOrVarConst(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 135
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract getParamOrVarName(I)Ljava/lang/String;
.end method

.method public final initScriptFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 23
    invoke-static {p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 24
    return-void
.end method

.method public jsGet_name()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public resumeGenerator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "operation"    # I
    .param p4, "state"    # Ljava/lang/Object;
    .param p5, "value"    # Ljava/lang/Object;

    .line 100
    new-instance v0, Lcom/trendmicro/hippo/EvaluatorException;

    const-string v1, "resumeGenerator() not implemented"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
