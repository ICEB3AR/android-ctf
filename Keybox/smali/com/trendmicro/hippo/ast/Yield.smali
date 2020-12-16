.class public Lcom/trendmicro/hippo/ast/Yield;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "Yield.java"


# instance fields
.field private value:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 23
    const/16 v0, 0x49

    iput v0, p0, Lcom/trendmicro/hippo/ast/Yield;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 30
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 23
    const/16 v0, 0x49

    iput v0, p0, Lcom/trendmicro/hippo/ast/Yield;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    const/16 v0, 0x49

    iput v0, p0, Lcom/trendmicro/hippo/ast/Yield;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "value"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    const/16 v0, 0x49

    iput v0, p0, Lcom/trendmicro/hippo/ast/Yield;->type:I

    .line 39
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/Yield;->setValue(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getValue()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Yield;->value:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setValue(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 54
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Yield;->value:Lcom/trendmicro/hippo/ast/AstNode;

    .line 55
    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 57
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Yield;->value:Lcom/trendmicro/hippo/ast/AstNode;

    if-nez v0, :cond_0

    .line 62
    const-string v0, "yield"

    goto :goto_0

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "yield "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Yield;->value:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    :goto_0
    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 71
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Yield;->value:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 74
    :cond_0
    return-void
.end method
