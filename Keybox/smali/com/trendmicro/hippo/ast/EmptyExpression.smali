.class public Lcom/trendmicro/hippo/ast/EmptyExpression;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "EmptyExpression.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 19
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyExpression;->type:I

    .line 23
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 26
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 19
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyExpression;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 19
    const/16 v0, 0x81

    iput v0, p0, Lcom/trendmicro/hippo/ast/EmptyExpression;->type:I

    .line 31
    return-void
.end method


# virtual methods
.method public toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "depth"    # I

    .line 35
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/EmptyExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 43
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 44
    return-void
.end method
