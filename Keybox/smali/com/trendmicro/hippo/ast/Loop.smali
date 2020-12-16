.class public abstract Lcom/trendmicro/hippo/ast/Loop;
.super Lcom/trendmicro/hippo/ast/Scope;
.source "Loop.java"


# instance fields
.field protected body:Lcom/trendmicro/hippo/ast/AstNode;

.field protected lp:I

.field protected rp:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    .line 16
    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 22
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    .line 16
    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    .line 23
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Scope;-><init>(II)V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    .line 16
    iput v0, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    .line 27
    return-void
.end method


# virtual methods
.method public getBody()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Loop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 52
    iget v0, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 66
    iget v0, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    return v0
.end method

.method public setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "body"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 42
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Loop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    .line 43
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    .line 44
    .local v0, "end":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Loop;->getPosition()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/Loop;->setLength(I)V

    .line 45
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 46
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 59
    iput p1, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    .line 60
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 80
    iput p1, p0, Lcom/trendmicro/hippo/ast/Loop;->lp:I

    .line 81
    iput p2, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    .line 82
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 73
    iput p1, p0, Lcom/trendmicro/hippo/ast/Loop;->rp:I

    .line 74
    return-void
.end method
