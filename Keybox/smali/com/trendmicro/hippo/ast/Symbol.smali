.class public Lcom/trendmicro/hippo/ast/Symbol;
.super Ljava/lang/Object;
.source "Symbol.java"


# instance fields
.field private containingTable:Lcom/trendmicro/hippo/ast/Scope;

.field private declType:I

.field private index:I

.field private name:Ljava/lang/String;

.field private node:Lcom/trendmicro/hippo/Node;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->index:I

    .line 26
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "declType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->index:I

    .line 34
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/Symbol;->setName(Ljava/lang/String;)V

    .line 35
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Symbol;->setDeclType(I)V

    .line 36
    return-void
.end method


# virtual methods
.method public getContainingTable()Lcom/trendmicro/hippo/ast/Scope;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->containingTable:Lcom/trendmicro/hippo/ast/Scope;

    return-object v0
.end method

.method public getDeclType()I
    .locals 1

    .line 42
    iget v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->declType:I

    return v0
.end method

.method public getDeclTypeName()Ljava/lang/String;
    .locals 1

    .line 115
    iget v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->declType:I

    invoke-static {v0}, Lcom/trendmicro/hippo/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .line 83
    iget v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->index:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNode()Lcom/trendmicro/hippo/Node;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Symbol;->node:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public setContainingTable(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 0
    .param p1, "containingTable"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 111
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Symbol;->containingTable:Lcom/trendmicro/hippo/ast/Scope;

    .line 112
    return-void
.end method

.method public setDeclType(I)V
    .locals 3
    .param p1, "declType"    # I

    .line 49
    const/16 v0, 0x6e

    if-eq p1, v0, :cond_1

    const/16 v0, 0x58

    if-eq p1, v0, :cond_1

    const/16 v0, 0x7b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9a

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9b

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid declType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    :goto_0
    iput p1, p0, Lcom/trendmicro/hippo/ast/Symbol;->declType:I

    .line 56
    return-void
.end method

.method public setIndex(I)V
    .locals 0
    .param p1, "index"    # I

    .line 90
    iput p1, p0, Lcom/trendmicro/hippo/ast/Symbol;->index:I

    .line 91
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 69
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Symbol;->name:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setNode(Lcom/trendmicro/hippo/Node;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 97
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Symbol;->node:Lcom/trendmicro/hippo/Node;

    .line 98
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v0, "result":Ljava/lang/StringBuilder;
    const-string v1, "Symbol ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Symbol;->getDeclTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    const-string v1, ") name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Symbol;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Symbol;->node:Lcom/trendmicro/hippo/Node;

    if-eqz v1, :cond_0

    .line 126
    const-string v1, " line="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Symbol;->node:Lcom/trendmicro/hippo/Node;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
