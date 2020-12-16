.class public Lcom/trendmicro/hippo/ast/Label;
.super Lcom/trendmicro/hippo/ast/Jump;
.source "Label.java"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 21
    const/16 v0, 0x83

    iput v0, p0, Lcom/trendmicro/hippo/ast/Label;->type:I

    .line 25
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 28
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ast/Label;-><init>(II)V

    .line 29
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 31
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 21
    const/16 v0, 0x83

    iput v0, p0, Lcom/trendmicro/hippo/ast/Label;->type:I

    .line 33
    iput p1, p0, Lcom/trendmicro/hippo/ast/Label;->position:I

    .line 34
    iput p2, p0, Lcom/trendmicro/hippo/ast/Label;->length:I

    .line 35
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "name"    # Ljava/lang/String;

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Label;-><init>(II)V

    .line 39
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/Label;->setName(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Label;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 55
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object p1, v0

    .line 56
    if-eqz p1, :cond_1

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 58
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Label;->name:Ljava/lang/String;

    .line 59
    return-void

    .line 57
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid label name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Label;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Label;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    const-string v1, ":\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 75
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 76
    return-void
.end method
