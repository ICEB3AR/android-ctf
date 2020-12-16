.class public Lcom/trendmicro/hippo/ast/Assignment;
.super Lcom/trendmicro/hippo/ast/InfixExpression;
.source "Assignment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 19
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(I)V

    .line 20
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(II)V

    .line 24
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 28
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V
    .locals 0
    .param p1, "operator"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p3, "right"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "operatorPos"    # I

    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 32
    return-void
.end method
