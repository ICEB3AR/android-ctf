.class public Lcom/trendmicro/hippo/ast/XmlMemberGet;
.super Lcom/trendmicro/hippo/ast/InfixExpression;
.source "XmlMemberGet.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>()V

    .line 22
    const/16 v0, 0x90

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(I)V

    .line 22
    const/16 v0, 0x90

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(II)V

    .line 22
    const/16 v0, 0x90

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/XmlRef;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "ref"    # Lcom/trendmicro/hippo/ast/XmlRef;

    .line 37
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 22
    const/16 v0, 0x90

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/XmlRef;)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "ref"    # Lcom/trendmicro/hippo/ast/XmlRef;

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 22
    const/16 v0, 0x90

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/XmlRef;I)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "ref"    # Lcom/trendmicro/hippo/ast/XmlRef;
    .param p3, "opPos"    # I

    .line 49
    const/16 v0, 0x90

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    .line 22
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlMemberGet;->type:I

    .line 50
    return-void
.end method

.method private dotsToString()Ljava/lang/String;
    .locals 3

    .line 101
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getType()I

    move-result v0

    const/16 v1, 0x6d

    if-eq v0, v1, :cond_1

    const/16 v1, 0x90

    if-ne v0, v1, :cond_0

    .line 105
    const-string v0, ".."

    return-object v0

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid type of XmlMemberGet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_1
    const-string v0, "."

    return-object v0
.end method


# virtual methods
.method public getMemberRef()Lcom/trendmicro/hippo/ast/XmlRef;
    .locals 1

    .line 73
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/XmlRef;

    return-object v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 57
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method public setProperty(Lcom/trendmicro/hippo/ast/XmlRef;)V
    .locals 0
    .param p1, "ref"    # Lcom/trendmicro/hippo/ast/XmlRef;

    .line 82
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 83
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 65
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->dotsToString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
