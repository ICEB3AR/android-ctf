.class public final Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
.super Ljava/lang/Object;
.source "OptFunctionNode.java"


# instance fields
.field private directTargetIndex:I

.field public final fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

.field itsContainsCalls0:Z

.field itsContainsCalls1:Z

.field private itsParameterNumberContext:Z

.field private numberVarFlags:[Z


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/ast/FunctionNode;)V
    .locals 1
    .param p1, "fnode"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->directTargetIndex:I

    .line 18
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 19
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setCompilerData(Ljava/lang/Object;)V

    .line 20
    return-void
.end method

.method public static get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .locals 1
    .param p0, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 30
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getCompilerData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    return-object v0
.end method

.method public static get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .locals 2
    .param p0, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p1, "i"    # I

    .line 24
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v0

    .line 25
    .local v0, "fnode":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getCompilerData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    return-object v1
.end method


# virtual methods
.method public getDirectTargetIndex()I
    .locals 1

    .line 40
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->directTargetIndex:I

    return v0
.end method

.method public getParameterNumberContext()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->itsParameterNumberContext:Z

    return v0
.end method

.method public getVarCount()I
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarCount()I

    move-result v0

    return v0
.end method

.method public getVarIndex(Lcom/trendmicro/hippo/Node;)I
    .locals 5
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;

    .line 94
    const/4 v0, 0x7

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v2

    .line 95
    .local v2, "index":I
    if-ne v2, v1, :cond_4

    .line 97
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 98
    .local v1, "type":I
    const/16 v3, 0x37

    if-ne v1, v3, :cond_0

    .line 99
    move-object v3, p1

    .local v3, "node":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 100
    .end local v3    # "node":Lcom/trendmicro/hippo/Node;
    :cond_0
    const/16 v3, 0x38

    if-eq v1, v3, :cond_2

    const/16 v3, 0x9d

    if-ne v1, v3, :cond_1

    goto :goto_0

    .line 104
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 102
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 106
    .restart local v3    # "node":Lcom/trendmicro/hippo/Node;
    :goto_1
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 107
    if-ltz v2, :cond_3

    .line 108
    invoke-virtual {p1, v0, v2}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_2

    .line 107
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 110
    .end local v1    # "type":I
    .end local v3    # "node":Lcom/trendmicro/hippo/Node;
    :cond_4
    :goto_2
    return v2
.end method

.method public isNumberVar(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .line 73
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v0

    sub-int/2addr p1, v0

    .line 74
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->numberVarFlags:[Z

    if-eqz v0, :cond_0

    .line 75
    aget-boolean v0, v0, p1

    return v0

    .line 77
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isParameter(I)Z
    .locals 1
    .param p1, "varIndex"    # I

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTargetOfDirectCall()Z
    .locals 1

    .line 35
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->directTargetIndex:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setDirectTargetIndex(I)V
    .locals 1
    .param p1, "directTargetIndex"    # I

    .line 46
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->directTargetIndex:I

    if-ltz v0, :cond_1

    .line 47
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 48
    :cond_1
    iput p1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->directTargetIndex:I

    .line 49
    return-void
.end method

.method setIsNumberVar(I)V
    .locals 2
    .param p1, "varIndex"    # I

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v0

    sub-int/2addr p1, v0

    .line 84
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->numberVarFlags:[Z

    if-nez v0, :cond_1

    .line 86
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarCount()I

    move-result v0

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v1

    sub-int/2addr v0, v1

    .line 87
    .local v0, "size":I
    new-array v1, v0, [Z

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->numberVarFlags:[Z

    .line 89
    .end local v0    # "size":I
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->numberVarFlags:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 90
    return-void
.end method

.method setParameterNumberContext(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 53
    iput-boolean p1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->itsParameterNumberContext:Z

    .line 54
    return-void
.end method
