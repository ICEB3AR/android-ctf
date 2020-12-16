.class public Lcom/trendmicro/hippo/ast/SwitchStatement;
.super Lcom/trendmicro/hippo/ast/Jump;
.source "SwitchStatement.java"


# static fields
.field private static final NO_CASES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/SwitchCase;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private cases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/SwitchCase;",
            ">;"
        }
    .end annotation
.end field

.field private expression:Lcom/trendmicro/hippo/ast/AstNode;

.field private lp:I

.field private rp:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/SwitchStatement;->NO_CASES:Ljava/util/List;

    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    .line 40
    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    .line 43
    const/16 v0, 0x73

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->type:I

    .line 47
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 49
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    .line 40
    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    .line 43
    const/16 v0, 0x73

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->type:I

    .line 51
    iput p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->position:I

    .line 52
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 54
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    .line 40
    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    .line 43
    const/16 v0, 0x73

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->type:I

    .line 55
    iput p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->position:I

    .line 56
    iput p2, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->length:I

    .line 57
    return-void
.end method


# virtual methods
.method public addCase(Lcom/trendmicro/hippo/ast/SwitchCase;)V
    .locals 1
    .param p1, "switchCase"    # Lcom/trendmicro/hippo/ast/SwitchCase;

    .line 106
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 107
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    if-nez v0, :cond_0

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/SwitchCase;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 112
    return-void
.end method

.method public getCases()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/SwitchCase;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/SwitchStatement;->NO_CASES:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 118
    iget v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 132
    iget v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    return v0
.end method

.method public setCases(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/SwitchCase;",
            ">;)V"
        }
    .end annotation

    .line 91
    .local p1, "cases":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/SwitchCase;>;"
    if-nez p1, :cond_0

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    goto :goto_1

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 95
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 96
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/SwitchCase;

    .line 97
    .local v1, "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->addCase(Lcom/trendmicro/hippo/ast/SwitchCase;)V

    .end local v1    # "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    goto :goto_0

    .line 99
    :cond_2
    :goto_1
    return-void
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 72
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 73
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 74
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 75
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 125
    iput p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    .line 126
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 146
    iput p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->lp:I

    .line 147
    iput p2, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    .line 148
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 139
    iput p1, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->rp:I

    .line 140
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .line 152
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "pad":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    const-string v2, "switch ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    const-string v2, ") {\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->cases:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 159
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/SwitchCase;

    .line 160
    .local v3, "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/SwitchCase;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .end local v3    # "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    goto :goto_0

    .line 163
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    const-string v2, "}\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 174
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 176
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/SwitchStatement;->getCases()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/SwitchCase;

    .line 177
    .local v1, "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/SwitchCase;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 178
    .end local v1    # "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    goto :goto_0

    .line 180
    :cond_0
    return-void
.end method
