.class public abstract Lcom/trendmicro/hippo/ast/XmlRef;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "XmlRef.java"


# instance fields
.field protected atPos:I

.field protected colonPos:I

.field protected namespace:Lcom/trendmicro/hippo/ast/Name;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->colonPos:I

    .line 40
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 43
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->colonPos:I

    .line 44
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->colonPos:I

    .line 48
    return-void
.end method


# virtual methods
.method public getAtPos()I
    .locals 1

    .line 79
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    return v0
.end method

.method public getColonPos()I
    .locals 1

    .line 94
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->colonPos:I

    return v0
.end method

.method public getNamespace()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public isAttributeAccess()Z
    .locals 1

    .line 71
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setAtPos(I)V
    .locals 0
    .param p1, "atPos"    # I

    .line 86
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlRef;->atPos:I

    .line 87
    return-void
.end method

.method public setColonPos(I)V
    .locals 0
    .param p1, "colonPos"    # I

    .line 101
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlRef;->colonPos:I

    .line 102
    return-void
.end method

.method public setNamespace(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "namespace"    # Lcom/trendmicro/hippo/ast/Name;

    .line 62
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/XmlRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    .line 63
    if-eqz p1, :cond_0

    .line 64
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Name;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 65
    :cond_0
    return-void
.end method
