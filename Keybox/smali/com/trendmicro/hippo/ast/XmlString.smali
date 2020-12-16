.class public Lcom/trendmicro/hippo/ast/XmlString;
.super Lcom/trendmicro/hippo/ast/XmlFragment;
.source "XmlString.java"


# instance fields
.field private xml:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>()V

    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 22
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>(I)V

    .line 23
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "s"    # Ljava/lang/String;

    .line 26
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>(I)V

    .line 27
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/XmlString;->setXml(Ljava/lang/String;)V

    .line 28
    return-void
.end method


# virtual methods
.method public getXml()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlString;->xml:Ljava/lang/String;

    return-object v0
.end method

.method public setXml(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 37
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlString;->assertNotNull(Ljava/lang/Object;)V

    .line 38
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/XmlString;->xml:Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/XmlString;->setLength(I)V

    .line 40
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlString;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlString;->xml:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 60
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 61
    return-void
.end method
