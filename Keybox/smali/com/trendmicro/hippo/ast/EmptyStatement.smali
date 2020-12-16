.class public Lcom/trendmicro/hippo/ast/EmptyStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "EmptyStatement.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 18
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyStatement;->type:I

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 25
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 18
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyStatement;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 18
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyStatement;->type:I

    .line 30
    return-void
.end method


# virtual methods
.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/EmptyStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 44
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 45
    return-void
.end method
