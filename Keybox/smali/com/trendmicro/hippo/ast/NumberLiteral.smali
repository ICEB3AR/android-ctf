.class public Lcom/trendmicro/hippo/ast/NumberLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "NumberLiteral.java"


# instance fields
.field private number:D

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 20
    const/16 v0, 0x28

    iput v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->type:I

    .line 24
    return-void
.end method

.method public constructor <init>(D)V
    .locals 1
    .param p1, "number"    # D

    .line 51
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 20
    const/16 v0, 0x28

    iput v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->type:I

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setDouble(D)V

    .line 53
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setValue(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 27
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 20
    const/16 v0, 0x28

    iput v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->type:I

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
    const/16 v0, 0x28

    iput v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->type:I

    .line 32
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "value"    # Ljava/lang/String;

    .line 38
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 20
    const/16 v0, 0x28

    iput v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->type:I

    .line 39
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setValue(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setLength(I)V

    .line 41
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;D)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "number"    # D

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/NumberLiteral;-><init>(ILjava/lang/String;)V

    .line 48
    invoke-virtual {p0, p3, p4}, Lcom/trendmicro/hippo/ast/NumberLiteral;->setDouble(D)V

    .line 49
    return-void
.end method


# virtual methods
.method public getNumber()D
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->number:D

    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setNumber(D)V
    .locals 0
    .param p1, "value"    # D

    .line 83
    iput-wide p1, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->number:D

    .line 84
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 68
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/NumberLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 69
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->value:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/NumberLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NumberLiteral;->value:Ljava/lang/String;

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

    .line 96
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 97
    return-void
.end method
