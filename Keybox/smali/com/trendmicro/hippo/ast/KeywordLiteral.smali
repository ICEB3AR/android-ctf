.class public Lcom/trendmicro/hippo/ast/KeywordLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "KeywordLiteral.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 27
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 28
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 32
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "nodeType"    # I

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 40
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/KeywordLiteral;->setType(I)Lcom/trendmicro/hippo/ast/KeywordLiteral;

    .line 41
    return-void
.end method


# virtual methods
.method public isBooleanLiteral()Z
    .locals 2

    .line 65
    iget v0, p0, Lcom/trendmicro/hippo/ast/KeywordLiteral;->type:I

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/trendmicro/hippo/ast/KeywordLiteral;->type:I

    const/16 v1, 0x2c

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public bridge synthetic setType(I)Lcom/trendmicro/hippo/Node;
    .locals 0

    .line 21
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/KeywordLiteral;->setType(I)Lcom/trendmicro/hippo/ast/KeywordLiteral;

    move-result-object p1

    return-object p1
.end method

.method public setType(I)Lcom/trendmicro/hippo/ast/KeywordLiteral;
    .locals 3
    .param p1, "nodeType"    # I

    .line 49
    const/16 v0, 0x2b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2a

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_1

    const/16 v0, 0x2c

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa1

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid node type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_1
    :goto_0
    iput p1, p0, Lcom/trendmicro/hippo/ast/KeywordLiteral;->type:I

    .line 57
    return-object p0
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/KeywordLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/KeywordLiteral;->getType()I

    move-result v1

    const/16 v2, 0xa1

    if-eq v1, v2, :cond_0

    packed-switch v1, :pswitch_data_0

    .line 89
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid keyword literal type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/KeywordLiteral;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :pswitch_0
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    goto :goto_0

    .line 83
    :pswitch_1
    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    goto :goto_0

    .line 74
    :pswitch_2
    const-string v1, "this"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    goto :goto_0

    .line 77
    :pswitch_3
    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    goto :goto_0

    .line 86
    :cond_0
    const-string v1, "debugger;\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    nop

    .line 92
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x2a
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 100
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 101
    return-void
.end method
