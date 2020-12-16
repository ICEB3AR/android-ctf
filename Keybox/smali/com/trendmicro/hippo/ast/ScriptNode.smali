.class public Lcom/trendmicro/hippo/ast/ScriptNode;
.super Lcom/trendmicro/hippo/ast/Scope;
.source "ScriptNode.java"


# instance fields
.field private EMPTY_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/FunctionNode;",
            ">;"
        }
    .end annotation
.end field

.field private compilerData:Ljava/lang/Object;

.field private encodedSource:Ljava/lang/String;

.field private encodedSourceEnd:I

.field private encodedSourceStart:I

.field private endLineno:I

.field private functions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/FunctionNode;",
            ">;"
        }
    .end annotation
.end field

.field private inStrictMode:Z

.field private isConsts:[Z

.field private paramCount:I

.field private regexps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/RegExpLiteral;",
            ">;"
        }
    .end annotation
.end field

.field private sourceName:Ljava/lang/String;

.field private symbols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;"
        }
    .end annotation
.end field

.field private tempNumber:I

.field private variableNames:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 47
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceStart:I

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceEnd:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->endLineno:I

    .line 30
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->EMPTY_LIST:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->paramCount:I

    .line 38
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->tempNumber:I

    .line 43
    iput-object p0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 44
    const/16 v0, 0x89

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->type:I

    .line 48
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "pos"    # I

    .line 51
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceStart:I

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceEnd:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->endLineno:I

    .line 30
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->EMPTY_LIST:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->paramCount:I

    .line 38
    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->tempNumber:I

    .line 43
    iput-object p0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->top:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 44
    const/16 v0, 0x89

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->type:I

    .line 52
    return-void
.end method


# virtual methods
.method public addFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)I
    .locals 1
    .param p1, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 180
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    if-nez v0, :cond_1

    .line 182
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public addRegExp(Lcom/trendmicro/hippo/ast/RegExpLiteral;)V
    .locals 2
    .param p1, "re"    # Lcom/trendmicro/hippo/ast/RegExpLiteral;

    .line 203
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 204
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    if-nez v0, :cond_1

    .line 205
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    .line 206
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    const/4 v0, 0x4

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->putIntProp(II)V

    .line 208
    return-void
.end method

.method addSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V
    .locals 2
    .param p1, "symbol"    # Lcom/trendmicro/hippo/ast/Symbol;

    .line 244
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 245
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Symbol;->getDeclType()I

    move-result v0

    const/16 v1, 0x58

    if-ne v0, v1, :cond_1

    .line 246
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->paramCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->paramCount:I

    .line 248
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    return-void
.end method

.method public flattenSymbolTable(Z)V
    .locals 5
    .param p1, "flattenAllTables"    # Z

    .line 268
    if-nez p1, :cond_2

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 270
    .local v0, "newSymbols":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/Symbol;>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbolTable:Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 274
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 275
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/Symbol;

    .line 276
    .local v2, "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Symbol;->getContainingTable()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v3

    if-ne v3, p0, :cond_0

    .line 277
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    .end local v2    # "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 281
    .end local v1    # "i":I
    :cond_1
    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    .line 283
    .end local v0    # "newSymbols":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/Symbol;>;"
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    .line 284
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->isConsts:[Z

    .line 285
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 286
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Symbol;

    .line 287
    .local v1, "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Symbol;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 288
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->isConsts:[Z

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Symbol;->getDeclType()I

    move-result v3

    const/16 v4, 0x9b

    if-ne v3, v4, :cond_3

    const/4 v3, 0x1

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    :goto_2
    aput-boolean v3, v2, v0

    .line 289
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/Symbol;->setIndex(I)V

    .line 285
    .end local v1    # "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 291
    .end local v0    # "i":I
    :cond_4
    return-void
.end method

.method public getBaseLineno()I
    .locals 1

    .line 139
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->lineno:I

    return v0
.end method

.method public getCompilerData()Ljava/lang/Object;
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->compilerData:Ljava/lang/Object;

    return-object v0
.end method

.method public getEncodedSource()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSource:Ljava/lang/String;

    return-object v0
.end method

.method public getEncodedSourceEnd()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceEnd:I

    return v0
.end method

.method public getEncodedSourceStart()I
    .locals 1

    .line 75
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceStart:I

    return v0
.end method

.method public getEndLineno()I
    .locals 1

    .line 153
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->endLineno:I

    return v0
.end method

.method public getFunctionCount()I
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;
    .locals 1
    .param p1, "i"    # I

    .line 167
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    return-object v0
.end method

.method public getFunctions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/FunctionNode;",
            ">;"
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->functions:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->EMPTY_LIST:Ljava/util/List;

    :cond_0
    return-object v0
.end method

.method public getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I
    .locals 3
    .param p1, "nameNode"    # Lcom/trendmicro/hippo/Node;

    .line 211
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 212
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 213
    .local v0, "node":Lcom/trendmicro/hippo/ast/Scope;
    if-nez v0, :cond_1

    .line 214
    const/4 v1, 0x0

    goto :goto_0

    .line 215
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->getSymbol(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Symbol;

    move-result-object v1

    :goto_0
    nop

    .line 216
    .local v1, "symbol":Lcom/trendmicro/hippo/ast/Symbol;
    if-nez v1, :cond_2

    const/4 v2, -0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Symbol;->getIndex()I

    move-result v2

    :goto_1
    return v2
.end method

.method public getNextTempName()Ljava/lang/String;
    .locals 3

    .line 306
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->tempNumber:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->tempNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParamAndVarConst()[Z
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->isConsts:[Z

    return-object v0
.end method

.method public getParamAndVarCount()I
    .locals 1

    .line 229
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getParamAndVarNames()[Ljava/lang/String;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 235
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    return-object v0
.end method

.method public getParamCount()I
    .locals 1

    .line 225
    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->paramCount:I

    return v0
.end method

.method public getParamOrVarName(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 220
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->variableNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getRegexpCount()I
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getRegexpFlags(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 196
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/RegExpLiteral;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->getFlags()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRegexpString(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 192
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->regexps:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/RegExpLiteral;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->sourceName:Ljava/lang/String;

    return-object v0
.end method

.method public getSymbols()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;"
        }
    .end annotation

    .line 252
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    return-object v0
.end method

.method public isInStrictMode()Z
    .locals 1

    .line 314
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->inStrictMode:Z

    return v0
.end method

.method public setBaseLineno(I)V
    .locals 1
    .param p1, "lineno"    # I

    .line 148
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->lineno:I

    if-ltz v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 149
    :cond_1
    iput p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->lineno:I

    .line 150
    return-void
.end method

.method public setCompilerData(Ljava/lang/Object;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/Object;

    .line 298
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->assertNotNull(Ljava/lang/Object;)V

    .line 300
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->compilerData:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 302
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->compilerData:Ljava/lang/Object;

    .line 303
    return-void

    .line 301
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public setEncodedSource(Ljava/lang/String;)V
    .locals 0
    .param p1, "encodedSource"    # Ljava/lang/String;

    .line 116
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSource:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setEncodedSourceBounds(II)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 107
    iput p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceStart:I

    .line 108
    iput p2, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceEnd:I

    .line 109
    return-void
.end method

.method public setEncodedSourceEnd(I)V
    .locals 0
    .param p1, "end"    # I

    .line 99
    iput p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceEnd:I

    .line 100
    return-void
.end method

.method public setEncodedSourceStart(I)V
    .locals 0
    .param p1, "start"    # I

    .line 83
    iput p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->encodedSourceStart:I

    .line 84
    return-void
.end method

.method public setEndLineno(I)V
    .locals 1
    .param p1, "lineno"    # I

    .line 158
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->endLineno:I

    if-ltz v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ast/ScriptNode;->codeBug()Ljava/lang/RuntimeException;

    .line 159
    :cond_1
    iput p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->endLineno:I

    .line 160
    return-void
.end method

.method public setInStrictMode(Z)V
    .locals 0
    .param p1, "inStrictMode"    # Z

    .line 310
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->inStrictMode:Z

    .line 311
    return-void
.end method

.method public setSourceName(Ljava/lang/String;)V
    .locals 0
    .param p1, "sourceName"    # Ljava/lang/String;

    .line 67
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->sourceName:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setSymbols(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Symbol;",
            ">;)V"
        }
    .end annotation

    .line 256
    .local p1, "symbols":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/Symbol;>;"
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ScriptNode;->symbols:Ljava/util/List;

    .line 257
    return-void
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 319
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Node;

    .line 321
    .local v1, "kid":Lcom/trendmicro/hippo/Node;
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 322
    .end local v1    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 324
    :cond_0
    return-void
.end method
