.class public interface abstract Lcom/trendmicro/hippo/debug/DebuggableScript;
.super Ljava/lang/Object;
.source "DebuggableScript.java"


# virtual methods
.method public abstract getFunction(I)Lcom/trendmicro/hippo/debug/DebuggableScript;
.end method

.method public abstract getFunctionCount()I
.end method

.method public abstract getFunctionName()Ljava/lang/String;
.end method

.method public abstract getLineNumbers()[I
.end method

.method public abstract getParamAndVarCount()I
.end method

.method public abstract getParamCount()I
.end method

.method public abstract getParamOrVarName(I)Ljava/lang/String;
.end method

.method public abstract getParent()Lcom/trendmicro/hippo/debug/DebuggableScript;
.end method

.method public abstract getSourceName()Ljava/lang/String;
.end method

.method public abstract isFunction()Z
.end method

.method public abstract isGeneratedScript()Z
.end method

.method public abstract isTopLevel()Z
.end method
