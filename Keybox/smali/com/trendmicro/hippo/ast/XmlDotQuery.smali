.class public Lcom/trendmicro/hippo/ast/XmlDotQuery;
.super Lcom/trendmicro/hippo/ast/InfixExpression;
.source "XmlDotQuery.java"


# instance fields
.field private rp:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>()V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->rp:I

    .line 28
    const/16 v0, 0x93

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->type:I

    .line 32
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 35
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(I)V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->rp:I

    .line 28
    const/16 v0, 0x93

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->type:I

    .line 36
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(II)V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->rp:I

    .line 28
    const/16 v0, 0x93

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->type:I

    .line 40
    return-void
.end method


# virtual methods
.method public getRp()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->rp:I

    return v0
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 57
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlDotQuery;->rp:I

    .line 58
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    const-string v1, ".("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlDotQuery;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
