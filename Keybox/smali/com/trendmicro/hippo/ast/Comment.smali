.class public Lcom/trendmicro/hippo/ast/Comment;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "Comment.java"


# instance fields
.field private commentType:Lcom/trendmicro/hippo/Token$CommentType;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILcom/trendmicro/hippo/Token$CommentType;Ljava/lang/String;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "type"    # Lcom/trendmicro/hippo/Token$CommentType;
    .param p4, "value"    # Ljava/lang/String;

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 47
    const/16 v0, 0xa2

    iput v0, p0, Lcom/trendmicro/hippo/ast/Comment;->type:I

    .line 59
    iput-object p3, p0, Lcom/trendmicro/hippo/ast/Comment;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 60
    iput-object p4, p0, Lcom/trendmicro/hippo/ast/Comment;->value:Ljava/lang/String;

    .line 61
    return-void
.end method


# virtual methods
.method public getCommentType()Lcom/trendmicro/hippo/Token$CommentType;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Comment;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Comment;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setCommentType(Lcom/trendmicro/hippo/Token$CommentType;)V
    .locals 0
    .param p1, "type"    # Lcom/trendmicro/hippo/Token$CommentType;

    .line 76
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Comment;->commentType:Lcom/trendmicro/hippo/Token$CommentType;

    .line 77
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "commentString"    # Ljava/lang/String;

    .line 91
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Comment;->value:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/Comment;->setLength(I)V

    .line 93
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Comment;->getLength()I

    move-result v1

    add-int/lit8 v1, v1, 0xa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 98
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Comment;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/Comment;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    sget-object v1, Lcom/trendmicro/hippo/Token$CommentType;->BLOCK_COMMENT:Lcom/trendmicro/hippo/Token$CommentType;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Comment;->getCommentType()Lcom/trendmicro/hippo/Token$CommentType;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 101
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 112
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 113
    return-void
.end method
