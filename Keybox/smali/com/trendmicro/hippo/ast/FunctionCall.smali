.class public Lcom/trendmicro/hippo/ast/FunctionCall;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "FunctionCall.java"


# static fields
.field protected static final NO_ARGS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected arguments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field

.field protected lp:I

.field protected rp:I

.field protected target:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/FunctionCall;->NO_ARGS:Ljava/util/List;

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    .line 29
    const/16 v0, 0x26

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 36
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    .line 29
    const/16 v0, 0x26

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    .line 29
    const/16 v0, 0x26

    iput v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->type:I

    .line 41
    return-void
.end method


# virtual methods
.method public addArgument(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "arg"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 94
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->assertNotNull(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 100
    return-void
.end method

.method public getArguments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/FunctionCall;->NO_ARGS:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 121
    iget v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    return v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->target:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setArguments(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .line 77
    .local p1, "arguments":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    if-nez p1, :cond_0

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    goto :goto_1

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 81
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 82
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

    .line 83
    .local v1, "arg":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/FunctionCall;->addArgument(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 84
    .end local v1    # "arg":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 86
    :cond_2
    :goto_1
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 114
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    .line 115
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 135
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->lp:I

    .line 136
    iput p2, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    .line 137
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 128
    iput p1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->rp:I

    .line 129
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 57
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->assertNotNull(Ljava/lang/Object;)V

    .line 58
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->target:Lcom/trendmicro/hippo/ast/AstNode;

    .line 59
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 60
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->target:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->arguments:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 146
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/FunctionCall;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 148
    :cond_0
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionCall;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 150
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionCall;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 160
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/FunctionCall;->target:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 162
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/FunctionCall;->getArguments()Ljava/util/List;

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

    .line 163
    .local v1, "arg":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 164
    .end local v1    # "arg":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 166
    :cond_0
    return-void
.end method
