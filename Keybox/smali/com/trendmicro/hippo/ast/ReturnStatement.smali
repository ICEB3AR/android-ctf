.class public Lcom/trendmicro/hippo/ast/ReturnStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ReturnStatement.java"


# instance fields
.field private returnValue:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 22
    const/4 v0, 0x4

    iput v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 22
    const/4 v0, 0x4

    iput v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/4 v0, 0x4

    iput v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "returnValue"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/4 v0, 0x4

    iput v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->type:I

    .line 38
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ReturnStatement;->setReturnValue(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 39
    return-void
.end method


# virtual methods
.method public getReturnValue()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->returnValue:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setReturnValue(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "returnValue"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 53
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->returnValue:Lcom/trendmicro/hippo/ast/AstNode;

    .line 54
    if-eqz p1, :cond_0

    .line 55
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 56
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ReturnStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v1, "return"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->returnValue:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v1, :cond_0

    .line 64
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->returnValue:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    :cond_0
    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 76
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ReturnStatement;->returnValue:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 79
    :cond_0
    return-void
.end method
