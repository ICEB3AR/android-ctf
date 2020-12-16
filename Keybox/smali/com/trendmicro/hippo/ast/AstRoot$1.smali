.class Lcom/trendmicro/hippo/ast/AstRoot$1;
.super Ljava/lang/Object;
.source "AstRoot.java"

# interfaces
.implements Lcom/trendmicro/hippo/ast/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/ast/AstRoot;->checkParentLinks()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/ast/AstRoot;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/ast/AstRoot;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/ast/AstRoot;

    .line 133
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/AstRoot$1;->this$0:Lcom/trendmicro/hippo/ast/AstRoot;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/trendmicro/hippo/ast/AstNode;)Z
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 136
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    .line 137
    .local v0, "type":I
    const/4 v1, 0x1

    const/16 v2, 0x89

    if-ne v0, v2, :cond_0

    .line 138
    return v1

    .line 139
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 143
    return v1

    .line 140
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No parent for node: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    .line 142
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
