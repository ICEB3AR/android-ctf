.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
.super Ljava/lang/Object;
.source "XmlNode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "QName"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5b69f9180c9172c5L


# instance fields
.field private localName:Ljava/lang/String;

.field private namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 677
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 678
    return-void
.end method

.method static create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 2
    .param p0, "namespace"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .param p1, "localName"    # Ljava/lang/String;

    .line 655
    if-eqz p1, :cond_1

    const-string v0, "*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "* is not valid localName"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 656
    :cond_1
    :goto_0
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;-><init>()V

    .line 657
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 658
    iput-object p1, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    .line 659
    return-object v0
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 665
    invoke-static {p2, p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    return-object v0
.end method

.method private equals(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "one"    # Ljava/lang/String;
    .param p2, "two"    # Ljava/lang/String;

    .line 686
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    const/4 v0, 0x1

    return v0

    .line 687
    :cond_0
    if-eqz p1, :cond_2

    if-nez p2, :cond_1

    goto :goto_0

    .line 688
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 687
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private namespacesEqual(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Z
    .locals 2
    .param p1, "one"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .param p2, "two"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 692
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    const/4 v0, 0x1

    return v0

    .line 693
    :cond_0
    if-eqz p1, :cond_2

    if-nez p2, :cond_1

    goto :goto_0

    .line 694
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 693
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method static qualify(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "localName"    # Ljava/lang/String;

    .line 669
    if-eqz p0, :cond_1

    .line 670
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 671
    :cond_0
    return-object p1

    .line 669
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "prefix must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method final equals(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Z
    .locals 3
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 698
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespacesEqual(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 699
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    iget-object v2, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 700
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .line 705
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    if-nez v0, :cond_0

    .line 706
    const/4 v0, 0x0

    return v0

    .line 708
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->equals(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Z

    move-result v0

    return v0
.end method

.method getLocalName()Ljava/lang/String;
    .locals 1

    .line 771
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    return-object v0
.end method

.method getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1

    .line 767
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 713
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method

.method lookupPrefix(Lorg/w3c/dom/Node;)V
    .locals 9
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 717
    if-eqz p1, :cond_5

    .line 718
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/w3c/dom/Node;->lookupPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 719
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 721
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 722
    .local v1, "defaultNamespace":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string v1, ""

    .line 723
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    .line 724
    .local v2, "nodeNamespace":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 725
    const-string v0, ""

    .line 728
    .end local v1    # "defaultNamespace":Ljava/lang/String;
    .end local v2    # "nodeNamespace":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 729
    .local v1, "i":I
    :goto_0
    if-nez v0, :cond_4

    .line 730
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "e4x_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v1, 0x1

    .end local v1    # "i":I
    .local v3, "i":I
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 731
    .local v1, "generatedPrefix":Ljava/lang/String;
    invoke-interface {p1, v1}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 732
    .local v2, "generatedUri":Ljava/lang/String;
    if-nez v2, :cond_3

    .line 733
    move-object v0, v1

    .line 734
    move-object v4, p1

    .line 735
    .local v4, "top":Lorg/w3c/dom/Node;
    :goto_1
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    instance-of v5, v5, Lorg/w3c/dom/Element;

    if-eqz v5, :cond_2

    .line 736
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v4

    goto :goto_1

    .line 738
    :cond_2
    move-object v5, v4

    check-cast v5, Lorg/w3c/dom/Element;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "xmlns:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v7

    const-string v8, "http://www.w3.org/2000/xmlns/"

    invoke-interface {v5, v8, v6, v7}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 740
    .end local v1    # "generatedPrefix":Ljava/lang/String;
    .end local v2    # "generatedUri":Ljava/lang/String;
    .end local v4    # "top":Lorg/w3c/dom/Node;
    :cond_3
    move v1, v3

    goto :goto_0

    .line 741
    .end local v3    # "i":I
    .local v1, "i":I
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-static {v2, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$200(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)V

    .line 742
    return-void

    .line 717
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v1    # "i":I
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "node must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method qualify(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 2
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 745
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 746
    if-eqz p1, :cond_0

    .line 747
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->lookupPrefix(Lorg/w3c/dom/Node;)V

    goto :goto_0

    .line 749
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 750
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$200(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)V

    goto :goto_0

    .line 754
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->access$200(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)V

    .line 758
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->qualify(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method setAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 3
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "value"    # Ljava/lang/String;

    .line 762
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->lookupPrefix(Lorg/w3c/dom/Node;)V

    .line 763
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->qualify(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1, p2}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 682
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XmlNode.QName ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->localName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->namespace:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
