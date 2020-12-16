.class public Lcom/trendmicro/hippo/ast/StringLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "StringLiteral.java"


# instance fields
.field private quoteChar:C

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/16 v0, 0x29

    iput v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public getQuoteCharacter()C
    .locals 1

    .line 72
    iget-char v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getValue(Z)Ljava/lang/String;
    .locals 2
    .param p1, "includeQuotes"    # Z

    .line 53
    if-nez p1, :cond_0

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->value:Ljava/lang/String;

    return-object v0

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setQuoteCharacter(C)V
    .locals 0
    .param p1, "c"    # C

    .line 76
    iput-char p1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    .line 77
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 64
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/StringLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 65
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->value:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/StringLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-char v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->value:Ljava/lang/String;

    iget-char v2, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    .line 83
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char v1, p0, Lcom/trendmicro/hippo/ast/StringLiteral;->quoteChar:C

    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 81
    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 93
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 94
    return-void
.end method
