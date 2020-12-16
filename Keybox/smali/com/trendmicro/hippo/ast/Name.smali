.class public Lcom/trendmicro/hippo/ast/Name;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "Name.java"


# instance fields
.field private identifier:Ljava/lang/String;

.field private scope:Lcom/trendmicro/hippo/ast/Scope;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lcom/trendmicro/hippo/ast/Name;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 33
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lcom/trendmicro/hippo/ast/Name;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lcom/trendmicro/hippo/ast/Name;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "name"    # Ljava/lang/String;

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lcom/trendmicro/hippo/ast/Name;->type:I

    .line 48
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "name"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 26
    const/16 v0, 0x27

    iput v0, p0, Lcom/trendmicro/hippo/ast/Name;->type:I

    .line 53
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/Name;->setIdentifier(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/Name;->setLength(I)V

    .line 55
    return-void
.end method


# virtual methods
.method public getDefiningScope()Lcom/trendmicro/hippo/ast/Scope;
    .locals 3

    .line 107
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Name;->getEnclosingScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 108
    .local v0, "enclosing":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "name":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Name;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()Lcom/trendmicro/hippo/ast/Scope;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Name;->scope:Lcom/trendmicro/hippo/ast/Scope;

    return-object v0
.end method

.method public isLocalName()Z
    .locals 2

    .line 126
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Name;->getDefiningScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 127
    .local v0, "scope":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public length()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Name;->identifier:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    return v0
.end method

.method public setIdentifier(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .line 69
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Name;->assertNotNull(Ljava/lang/Object;)V

    .line 70
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Name;->identifier:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/Name;->setLength(I)V

    .line 72
    return-void
.end method

.method public setScope(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 0
    .param p1, "s"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 86
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Name;->scope:Lcom/trendmicro/hippo/ast/Scope;

    .line 87
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Name;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Name;->identifier:Ljava/lang/String;

    if-nez v1, :cond_0

    const-string v1, "<null>"

    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 150
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 151
    return-void
.end method
