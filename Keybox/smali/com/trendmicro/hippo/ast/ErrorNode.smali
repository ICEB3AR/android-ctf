.class public Lcom/trendmicro/hippo/ast/ErrorNode;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ErrorNode.java"


# instance fields
.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ErrorNode;->type:I

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 27
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ErrorNode;->type:I

    .line 28
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ErrorNode;->type:I

    .line 32
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ErrorNode;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ErrorNode;->message:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "depth"    # I

    .line 50
    const-string v0, ""

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 59
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 60
    return-void
.end method
