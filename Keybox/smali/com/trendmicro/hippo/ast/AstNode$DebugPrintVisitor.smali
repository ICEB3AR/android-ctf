.class public Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;
.super Ljava/lang/Object;
.source "AstNode.java"

# interfaces
.implements Lcom/trendmicro/hippo/ast/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ast/AstNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "DebugPrintVisitor"
.end annotation


# static fields
.field private static final DEBUG_INDENT:I = 0x2


# instance fields
.field private buffer:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Ljava/lang/StringBuilder;)V
    .locals 0
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .line 565
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 566
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    .line 567
    return-void
.end method

.method private makeIndent(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 573
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v1, p1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 574
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    mul-int/lit8 v2, p1, 0x2

    if-ge v1, v2, :cond_0

    .line 575
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 577
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 570
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/AstNode;)Z
    .locals 5
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 582
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    .line 583
    .local v0, "tt":I
    invoke-static {v0}, Lcom/trendmicro/hippo/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v1

    .line 584
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getAbsolutePosition()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->depth()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->makeIndent(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 586
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 589
    const/4 v2, 0x1

    const/16 v4, 0x27

    if-ne v0, v4, :cond_0

    .line 590
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 591
    :cond_0
    const/16 v4, 0x29

    if-ne v0, v4, :cond_1

    .line 592
    iget-object v4, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->buffer:Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    return v2
.end method
