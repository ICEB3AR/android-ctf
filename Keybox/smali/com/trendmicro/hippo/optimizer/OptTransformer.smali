.class Lcom/trendmicro/hippo/optimizer/OptTransformer;
.super Lcom/trendmicro/hippo/NodeTransformer;
.source "OptTransformer.java"


# instance fields
.field private directCallTargets:Lcom/trendmicro/hippo/ObjArray;

.field private possibleDirectCalls:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/optimizer/OptFunctionNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;Lcom/trendmicro/hippo/ObjArray;)V
    .locals 0
    .param p2, "directCallTargets"    # Lcom/trendmicro/hippo/ObjArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/optimizer/OptFunctionNode;",
            ">;",
            "Lcom/trendmicro/hippo/ObjArray;",
            ")V"
        }
    .end annotation

    .line 27
    .local p1, "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;>;"
    invoke-direct {p0}, Lcom/trendmicro/hippo/NodeTransformer;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    .line 29
    iput-object p2, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->directCallTargets:Lcom/trendmicro/hippo/ObjArray;

    .line 30
    return-void
.end method

.method private detectDirectCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 46
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v0

    const/16 v1, 0x6e

    if-ne v0, v1, :cond_5

    .line 47
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 50
    .local v0, "left":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x0

    .line 51
    .local v1, "argCount":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 52
    .local v2, "arg":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v2, :cond_0

    .line 53
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    :cond_0
    if-nez v1, :cond_1

    .line 58
    invoke-static {p2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v3

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->itsContainsCalls0:Z

    .line 73
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    if-eqz v3, :cond_5

    .line 74
    const/4 v3, 0x0

    .line 75
    .local v3, "targetName":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const/16 v5, 0x27

    if-ne v4, v5, :cond_2

    .line 76
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 77
    :cond_2
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const/16 v5, 0x21

    if-ne v4, v5, :cond_3

    .line 78
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const/16 v5, 0x22

    if-eq v4, v5, :cond_4

    .line 82
    :goto_1
    if-eqz v3, :cond_5

    .line 84
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->possibleDirectCalls:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 85
    .local v4, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    if-eqz v4, :cond_5

    iget-object v5, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 86
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v5

    if-ne v1, v5, :cond_5

    iget-object v5, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 87
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v5

    if-nez v5, :cond_5

    .line 92
    const/16 v5, 0x20

    if-gt v1, v5, :cond_5

    .line 93
    const/16 v5, 0x9

    invoke-virtual {p1, v5, v4}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 94
    invoke-virtual {v4}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v5

    if-nez v5, :cond_5

    .line 95
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->directCallTargets:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v5

    .line 96
    .local v5, "index":I
    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/OptTransformer;->directCallTargets:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 97
    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->setDirectTargetIndex(I)V

    goto :goto_2

    .line 80
    .end local v4    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v5    # "index":I
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 104
    .end local v0    # "left":Lcom/trendmicro/hippo/Node;
    .end local v1    # "argCount":I
    .end local v2    # "arg":Lcom/trendmicro/hippo/Node;
    .end local v3    # "targetName":Ljava/lang/String;
    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method protected visitCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/OptTransformer;->detectDirectCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 41
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/NodeTransformer;->visitCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 42
    return-void
.end method

.method protected visitNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/OptTransformer;->detectDirectCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 35
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/NodeTransformer;->visitNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 36
    return-void
.end method
