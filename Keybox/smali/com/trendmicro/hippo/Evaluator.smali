.class public interface abstract Lcom/trendmicro/hippo/Evaluator;
.super Ljava/lang/Object;
.source "Evaluator.java"


# virtual methods
.method public abstract captureStackInfo(Lcom/trendmicro/hippo/HippoException;)V
.end method

.method public abstract compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
.end method

.method public abstract createFunctionObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Function;
.end method

.method public abstract createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Script;
.end method

.method public abstract getPatchedStack(Lcom/trendmicro/hippo/HippoException;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getScriptStack(Lcom/trendmicro/hippo/HippoException;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/HippoException;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSourcePositionFromStack(Lcom/trendmicro/hippo/Context;[I)Ljava/lang/String;
.end method

.method public abstract setEvalScriptFlag(Lcom/trendmicro/hippo/Script;)V
.end method
