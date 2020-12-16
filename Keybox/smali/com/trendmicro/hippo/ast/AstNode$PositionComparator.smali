.class public Lcom/trendmicro/hippo/ast/AstNode$PositionComparator;
.super Ljava/lang/Object;
.source "AstNode.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ast/AstNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PositionComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/trendmicro/hippo/ast/AstNode;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)I
    .locals 2
    .param p1, "n1"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "n2"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 146
    iget v0, p1, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    iget v1, p2, Lcom/trendmicro/hippo/ast/AstNode;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 136
    check-cast p1, Lcom/trendmicro/hippo/ast/AstNode;

    check-cast p2, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode$PositionComparator;->compare(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)I

    move-result p1

    return p1
.end method
