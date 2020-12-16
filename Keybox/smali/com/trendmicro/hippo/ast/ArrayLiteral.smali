.class public Lcom/trendmicro/hippo/ast/ArrayLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ArrayLiteral.java"

# interfaces
.implements Lcom/trendmicro/hippo/ast/DestructuringForm;


# static fields
.field private static final NO_ELEMS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private destructuringLength:I

.field private elements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field

.field private isDestructuring:Z

.field private skipCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->NO_ELEMS:Ljava/util/List;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 44
    const/16 v0, 0x42

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->type:I

    .line 48
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 51
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 44
    const/16 v0, 0x42

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->type:I

    .line 52
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 44
    const/16 v0, 0x42

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->type:I

    .line 56
    return-void
.end method


# virtual methods
.method public addElement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "element"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 90
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 95
    return-void
.end method

.method public getDestructuringLength()I
    .locals 1

    .line 121
    iget v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->destructuringLength:I

    return v0
.end method

.method public getElement(I)Lcom/trendmicro/hippo/ast/AstNode;
    .locals 2
    .param p1, "index"    # I

    .line 112
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 114
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "no elements"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getElements()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->NO_ELEMS:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getSize()I
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getSkipCount()I
    .locals 1

    .line 140
    iget v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->skipCount:I

    return v0
.end method

.method public isDestructuring()Z
    .locals 1

    .line 168
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->isDestructuring:Z

    return v0
.end method

.method public setDestructuringLength(I)V
    .locals 0
    .param p1, "destructuringLength"    # I

    .line 132
    iput p1, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->destructuringLength:I

    .line 133
    return-void
.end method

.method public setElements(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .line 73
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    if-nez p1, :cond_0

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    goto :goto_1

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 77
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 78
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 79
    .local v1, "e":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->addElement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .end local v1    # "e":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 81
    :cond_2
    :goto_1
    return-void
.end method

.method public setIsDestructuring(Z)V
    .locals 0
    .param p1, "destructuring"    # Z

    .line 158
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->isDestructuring:Z

    .line 159
    return-void
.end method

.method public setSkipCount(I)V
    .locals 0
    .param p1, "count"    # I

    .line 148
    iput p1, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->skipCount:I

    .line 149
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayLiteral;->elements:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 179
    :cond_0
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 190
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 192
    .local v1, "e":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 193
    .end local v1    # "e":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 195
    :cond_0
    return-void
.end method
