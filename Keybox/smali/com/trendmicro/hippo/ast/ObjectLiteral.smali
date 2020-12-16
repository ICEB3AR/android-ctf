.class public Lcom/trendmicro/hippo/ast/ObjectLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ObjectLiteral.java"

# interfaces
.implements Lcom/trendmicro/hippo/ast/DestructuringForm;


# static fields
.field private static final NO_ELEMS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ObjectProperty;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private elements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ObjectProperty;",
            ">;"
        }
    .end annotation
.end field

.field isDestructuring:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->NO_ELEMS:Ljava/util/List;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 42
    const/16 v0, 0x43

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->type:I

    .line 46
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 49
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 42
    const/16 v0, 0x43

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->type:I

    .line 50
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 42
    const/16 v0, 0x43

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->type:I

    .line 54
    return-void
.end method


# virtual methods
.method public addElement(Lcom/trendmicro/hippo/ast/ObjectProperty;)V
    .locals 1
    .param p1, "element"    # Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 86
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 87
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 92
    return-void
.end method

.method public getElements()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ObjectProperty;",
            ">;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->NO_ELEMS:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public isDestructuring()Z
    .locals 1

    .line 111
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->isDestructuring:Z

    return v0
.end method

.method public setElements(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ObjectProperty;",
            ">;)V"
        }
    .end annotation

    .line 70
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ObjectProperty;>;"
    if-nez p1, :cond_0

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    goto :goto_1

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 74
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 75
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 76
    .local v1, "o":Lcom/trendmicro/hippo/ast/ObjectProperty;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->addElement(Lcom/trendmicro/hippo/ast/ObjectProperty;)V

    .end local v1    # "o":Lcom/trendmicro/hippo/ast/ObjectProperty;
    goto :goto_0

    .line 78
    :cond_2
    :goto_1
    return-void
.end method

.method public setIsDestructuring(Z)V
    .locals 0
    .param p1, "destructuring"    # Z

    .line 101
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->isDestructuring:Z

    .line 102
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ObjectLiteral;->elements:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 120
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 122
    :cond_0
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 132
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 134
    .local v1, "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/ObjectProperty;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 135
    .end local v1    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    goto :goto_0

    .line 137
    :cond_0
    return-void
.end method
