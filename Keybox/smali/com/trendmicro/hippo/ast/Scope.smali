.class public Lcom/trendmicro/hippo/ast/Scope;
.super Lcom/trendmicro/hippo/ast/Jump;
.source "Scope.java"


# instance fields
.field private childScopes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Scope;",
            ">;"
        }
    .end annotation
.end field

.field protected parentScope:Lcom/trendmicro/hippo/ast/Scope;

.field protected symbolTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;"
        }
    .end annotation
.end field

.field protected top:Lcom/trendmicro/hippo/ast/ScriptNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 32
    const/16 v0, 0x82

    iput v0, p0, Lcom/trendmicro/hippo/ast/Scope;->type:I

    .line 36
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 38
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 32
    const/16 v0, 0x82

    iput v0, p0, Lcom/trendmicro/hippo/ast/Scope;->type:I

    .line 39
    iput p1, p0, Lcom/trendmicro/hippo/ast/Scope;->position:I

    .line 40
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 43
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 44
    iput p2, p0, Lcom/trendmicro/hippo/ast/Scope;->length:I

    .line 45
    return-void
.end method

.method private ensureSymbolTable()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 212
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    return-object v0
.end method

.method public static joinScopes(Lcom/trendmicro/hippo/ast/Scope;Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 6
    .param p0, "source"    # Lcom/trendmicro/hippo/ast/Scope;
    .param p1, "dest"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 146
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;->ensureSymbolTable()Ljava/util/Map;

    move-result-object v0

    .line 147
    .local v0, "src":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    invoke-direct {p1}, Lcom/trendmicro/hippo/ast/Scope;->ensureSymbolTable()Ljava/util/Map;

    move-result-object v1

    .line 148
    .local v1, "dst":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Collections;->disjoint(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 149
    invoke-static {}, Lcom/trendmicro/hippo/ast/Scope;->codeBug()Ljava/lang/RuntimeException;

    .line 151
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 152
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/Symbol;

    .line 153
    .local v4, "sym":Lcom/trendmicro/hippo/ast/Symbol;
    invoke-virtual {v4, p1}, Lcom/trendmicro/hippo/ast/Symbol;->setContainingTable(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 154
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    .end local v4    # "sym":Lcom/trendmicro/hippo/ast/Symbol;
    goto :goto_0

    .line 156
    :cond_1
    return-void
.end method

.method public static splitScope(Lcom/trendmicro/hippo/ast/Scope;)Lcom/trendmicro/hippo/ast/Scope;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 131
    new-instance v0, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Scope;->getType()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 132
    .local v0, "result":Lcom/trendmicro/hippo/ast/Scope;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    iput-object v1, v0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    .line 133
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    .line 134
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Scope;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    iput-object v1, v0, Lcom/trendmicro/hippo/ast/Scope;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    .line 135
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 136
    invoke-virtual {v0, v0}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 137
    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->parent:Lcom/trendmicro/hippo/ast/AstNode;

    .line 138
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    iput-object v1, v0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 139
    return-object v0
.end method


# virtual methods
.method public addChildScope(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 1
    .param p1, "child"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 86
    return-void
.end method

.method public clearParentScope()V
    .locals 1

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->parentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 64
    return-void
.end method

.method public getChildScopes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Scope;",
            ">;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    return-object v0
.end method

.method public getDefiningScope(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Scope;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 165
    move-object v0, p0

    .local v0, "s":Lcom/trendmicro/hippo/ast/Scope;
    :goto_0
    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v1

    .line 167
    .local v1, "symbolTable":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 168
    return-object v0

    .line 165
    .end local v1    # "symbolTable":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    :cond_0
    iget-object v0, v0, Lcom/trendmicro/hippo/ast/Scope;->parentScope:Lcom/trendmicro/hippo/ast/Scope;

    goto :goto_0

    .line 171
    .end local v0    # "s":Lcom/trendmicro/hippo/ast/Scope;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParentScope()Lcom/trendmicro/hippo/ast/Scope;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->parentScope:Lcom/trendmicro/hippo/ast/Scope;

    return-object v0
.end method

.method public getStatements()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .line 225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .local v0, "stmts":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Scope;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 227
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v1, :cond_0

    .line 228
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_0

    .line 231
    :cond_0
    return-object v0
.end method

.method public getSymbol(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Symbol;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 180
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Symbol;

    :goto_0
    return-object v0
.end method

.method public getSymbolTable()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;"
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    return-object v0
.end method

.method public getTop()Lcom/trendmicro/hippo/ast/ScriptNode;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    return-object v0
.end method

.method public putSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V
    .locals 2
    .param p1, "symbol"    # Lcom/trendmicro/hippo/ast/Symbol;

    .line 187
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Symbol;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 189
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;->ensureSymbolTable()Ljava/util/Map;

    .line 190
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Symbol;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Symbol;->setContainingTable(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 192
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->addSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V

    .line 193
    return-void

    .line 188
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null symbol name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public replaceWith(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 2
    .param p1, "newScope"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 98
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 99
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Scope;

    .line 100
    .local v1, "kid":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/Scope;->addChildScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 101
    .end local v1    # "kid":Lcom/trendmicro/hippo/ast/Scope;
    goto :goto_0

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->childScopes:Ljava/util/List;

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 106
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;->joinScopes(Lcom/trendmicro/hippo/ast/Scope;Lcom/trendmicro/hippo/ast/Scope;)V

    .line 108
    :cond_2
    return-void
.end method

.method public setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V
    .locals 1
    .param p1, "parentScope"    # Lcom/trendmicro/hippo/ast/Scope;

    .line 55
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Scope;->parentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 56
    if-nez p1, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/ScriptNode;

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 57
    return-void
.end method

.method public setSymbolTable(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;)V"
        }
    .end annotation

    .line 207
    .local p1, "table":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/ast/Symbol;>;"
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Scope;->symbolTable:Ljava/util/Map;

    .line 208
    return-void
.end method

.method public setTop(Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 0
    .param p1, "top"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 121
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Scope;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 122
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 6
    .param p1, "depth"    # I

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    const-string v1, "{\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Scope;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 240
    .local v2, "kid":Lcom/trendmicro/hippo/Node;
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 241
    .local v3, "astNodeKid":Lcom/trendmicro/hippo/ast/AstNode;
    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v4

    const/16 v5, 0xa2

    if-ne v4, v5, :cond_0

    .line 243
    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .end local v2    # "kid":Lcom/trendmicro/hippo/Node;
    .end local v3    # "astNodeKid":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    goto :goto_0

    .line 246
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 253
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Scope;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Node;

    .line 255
    .local v1, "kid":Lcom/trendmicro/hippo/Node;
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 256
    .end local v1    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 258
    :cond_0
    return-void
.end method
