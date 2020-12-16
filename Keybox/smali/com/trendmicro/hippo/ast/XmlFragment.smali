.class public abstract Lcom/trendmicro/hippo/ast/XmlFragment;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "XmlFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 18
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlFragment;->type:I

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 25
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 18
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlFragment;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 18
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlFragment;->type:I

    .line 30
    return-void
.end method
