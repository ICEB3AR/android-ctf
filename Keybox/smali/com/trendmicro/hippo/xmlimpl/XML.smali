.class Lcom/trendmicro/hippo/xmlimpl/XML;
.super Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
.source "XML.java"


# static fields
.field static final serialVersionUID:J = -0x8c1a7cc631ad1c4L


# instance fields
.field private node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 0
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "prototype"    # Lcom/trendmicro/hippo/xml/XMLObject;
    .param p4, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    .line 22
    invoke-virtual {p0, p4}, Lcom/trendmicro/hippo/xmlimpl/XML;->initialize(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 23
    return-void
.end method

.method private adapt(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2
    .param p1, "ns"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 579
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 580
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0

    .line 582
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method private addInScopeNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)V
    .locals 3
    .param p1, "ns"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 555
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    .line 556
    return-void

    .line 560
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 561
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 562
    return-void

    .line 564
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 565
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->invalidateNamespacePrefix()V

    .line 567
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    return-void

    .line 569
    :cond_3
    return-void
.end method

.method private ecmaToString()Ljava/lang/String;
    .locals 7

    .line 679
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isAttribute()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 682
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasSimpleContent()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 683
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 684
    .local v0, "rv":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 685
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChild(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v2

    .line 686
    .local v2, "child":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v3

    if-nez v3, :cond_1

    .line 687
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isCommentType()Z

    move-result v3

    if-nez v3, :cond_1

    .line 691
    new-instance v3, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getLib()Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    move-result-object v4

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 692
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/xml/XMLObject;

    invoke-direct {v3, v4, v5, v6, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 693
    .local v3, "x":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    .end local v2    # "child":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .end local v3    # "x":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 696
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 698
    .end local v0    # "rv":Ljava/lang/StringBuilder;
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 680
    :cond_4
    :goto_1
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->ecmaValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private ecmaValue()Ljava/lang/String;
    .locals 1

    .line 674
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->ecmaValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getChildIndexOf(Lcom/trendmicro/hippo/xmlimpl/XML;)I
    .locals 3
    .param p1, "child"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 498
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 499
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChild(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    iget-object v2, p1, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isSameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    return v0

    .line 498
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 503
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;

    .line 455
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 456
    new-array v0, v2, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    iget-object v2, v2, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    aput-object v2, v0, v1

    return-object v0

    .line 457
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v0, :cond_2

    .line 458
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 459
    .local v0, "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 460
    .local v1, "rv":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 461
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    iget-object v3, v3, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    aput-object v3, v1, v2

    .line 460
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 463
    .end local v2    # "i":I
    :cond_1
    return-object v1

    .line 465
    .end local v0    # "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v1    # "rv":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_2
    new-array v0, v2, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 466
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v2

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v2

    aput-object v2, v0, v1

    .line 465
    return-object v0
.end method

.method private toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 221
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    if-nez v0, :cond_0

    .line 222
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setXml(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 224
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
    .locals 0
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 242
    invoke-virtual {p2, p1, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 243
    return-void
.end method

.method addNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 0
    .param p1, "ns"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 593
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->addInScopeNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)V

    .line 594
    return-object p0
.end method

.method appendChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .line 490
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isParentType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 492
    .local v0, "nodes":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 494
    .end local v0    # "nodes":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_0
    return-object p0
.end method

.method child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 2
    .param p1, "index"    # I

    .line 298
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 299
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 300
    if-ltz p1, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 301
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getXmlChild(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 303
    :cond_0
    return-object v0
.end method

.method child(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 263
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 268
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->ELEMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    .line 269
    .local v1, "elements":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 270
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matchesElement(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 271
    aget-object v3, v1, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 269
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 274
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 275
    return-object v0
.end method

.method childIndex()I
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildIndex()I

    move-result v0

    return v0
.end method

.method children()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 5

    .line 285
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 286
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-static {}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formStar()Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    .line 287
    .local v1, "all":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 288
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v3, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->TRUE:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v2

    .line 289
    .local v2, "children":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 290
    aget-object v4, v2, v3

    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 289
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 292
    .end local v3    # "i":I
    :cond_0
    return-object v0
.end method

.method comments()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3

    .line 425
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 426
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->COMMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->addMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)V

    .line 427
    return-object v0
.end method

.method contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "xml"    # Ljava/lang/Object;

    .line 327
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v0, :cond_0

    .line 328
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 330
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->copy()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method public delete(I)V
    .locals 0
    .param p1, "index"    # I

    .line 99
    if-nez p1, :cond_0

    .line 100
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->remove()V

    .line 102
    :cond_0
    return-void
.end method

.method deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
    .locals 3
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 154
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 155
    .local v0, "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 156
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    iget-object v2, v2, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->deleteMe()V

    .line 155
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 158
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method final ecmaClass()Ljava/lang/String;
    .locals 3

    .line 650
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 651
    const-string v0, "text"

    return-object v0

    .line 652
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 653
    const-string v0, "attribute"

    return-object v0

    .line 654
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 655
    const-string v0, "comment"

    return-object v0

    .line 656
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 657
    const-string v0, "processing-instruction"

    return-object v0

    .line 658
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 659
    const-string v0, "element"

    return-object v0

    .line 661
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method elements(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 247
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 248
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 250
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->ELEMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    .line 251
    .local v1, "elements":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 252
    aget-object v3, v1, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matches(Lcom/trendmicro/hippo/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 253
    aget-object v3, v1, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 251
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 256
    .end local v2    # "i":I
    :cond_1
    return-object v0
.end method

.method equivalentXml(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "target"    # Ljava/lang/Object;

    .line 337
    const/4 v0, 0x0

    .line 339
    .local v0, "result":Z
    instance-of v1, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v1, :cond_0

    .line 341
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->toXmlString(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    iget-object v2, v2, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->toXmlString(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 342
    :cond_0
    instance-of v1, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_1

    .line 344
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 346
    .local v1, "otherList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 347
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 349
    .end local v1    # "otherList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasSimpleContent()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 350
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 352
    .local v1, "otherStr":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_1

    .line 349
    .end local v1    # "otherStr":Ljava/lang/String;
    :cond_2
    :goto_0
    nop

    .line 355
    :goto_1
    return v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 68
    if-nez p1, :cond_0

    .line 69
    return-object p0

    .line 71
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method getAnnotation()Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    return-object v0
.end method

.method getAttributes()[Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 4

    .line 139
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getAttributes()[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 140
    .local v0, "attributes":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    array-length v1, v0

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 141
    .local v1, "rv":[Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 142
    aget-object v3, v0, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    aput-object v3, v1, v2

    .line 141
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 144
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method

.method getChildren()[Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 4

    .line 129
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->TRUE:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 131
    .local v0, "children":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    array-length v1, v0

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 132
    .local v1, "rv":[Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 133
    aget-object v3, v0, v2

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    aput-object v3, v1, v2

    .line 132
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 135
    .end local v2    # "i":I
    :cond_1
    return-object v1
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 670
    const-string v0, "XML"

    return-object v0
.end method

.method public getExtraMethodSource(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 200
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasSimpleContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "src":Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 204
    .end local v0    # "src":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .line 89
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isPrototype()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 90
    new-array v0, v1, [Ljava/lang/Object;

    return-object v0

    .line 92
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method getLastXmlChild()Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2

    .line 316
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 317
    .local v0, "pos":I
    if-gez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 318
    :cond_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getXmlChild(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1
.end method

.method getNodeQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    return-object v0
.end method

.method getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 149
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->getMyValueOn(Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method final getXML()Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 0

    .line 32
    return-object p0
.end method

.method getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;
    .locals 1
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 115
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method getXmlChild(I)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2
    .param p1, "index"    # I

    .line 307
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChild(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 308
    .local v0, "child":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    if-nez v1, :cond_0

    .line 309
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setXml(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 311
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 77
    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method hasComplexContent()Z
    .locals 1

    .line 372
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasSimpleContent()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method hasOwnProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
    .locals 5
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 171
    const/4 v0, 0x0

    .line 173
    .local v0, "hasProperty":Z
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isPrototype()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 174
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "property":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->findPrototypeId(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    move v0, v2

    .line 176
    .end local v1    # "property":Ljava/lang/String;
    goto :goto_2

    .line 177
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-lez v1, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    move v0, v2

    .line 180
    :goto_2
    return v0
.end method

.method hasSimpleContent()Z
    .locals 2

    .line 365
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 366
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 367
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->hasChildElement()Z

    move-result v0

    xor-int/2addr v0, v1

    return v0

    .line 366
    :cond_2
    :goto_0
    return v1

    .line 365
    :cond_3
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
    .locals 1
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 110
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method inScopeNamespaces()[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 2

    .line 574
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getInScopeNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 575
    .local v0, "inScope":[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method initialize(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 26
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 27
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setXml(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 28
    return-void
.end method

.method insertChildAfter(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 4
    .param p1, "child"    # Lcom/trendmicro/hippo/xmlimpl/XML;
    .param p2, "xml"    # Ljava/lang/Object;

    .line 522
    if-nez p1, :cond_0

    .line 524
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->prependChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    goto :goto_0

    .line 526
    :cond_0
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 527
    .local v0, "toInsert":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getChildIndexOf(Lcom/trendmicro/hippo/xmlimpl/XML;)I

    move-result v1

    .line 528
    .local v1, "index":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 529
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v2, v3, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 533
    .end local v0    # "toInsert":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .end local v1    # "index":I
    :cond_1
    :goto_0
    return-object p0
.end method

.method insertChildBefore(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "child"    # Lcom/trendmicro/hippo/xmlimpl/XML;
    .param p2, "xml"    # Ljava/lang/Object;

    .line 507
    if-nez p1, :cond_0

    .line 509
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    goto :goto_0

    .line 511
    :cond_0
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 512
    .local v0, "toInsert":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getChildIndexOf(Lcom/trendmicro/hippo/xmlimpl/XML;)I

    move-result v1

    .line 513
    .local v1, "index":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 514
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v2, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 518
    .end local v0    # "toInsert":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .end local v1    # "index":I
    :cond_1
    :goto_0
    return-object p0
.end method

.method is(Lcom/trendmicro/hippo/xmlimpl/XML;)Z
    .locals 2
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 384
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isSameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Z

    move-result v0

    return v0
.end method

.method final isAttribute()Z
    .locals 1

    .line 717
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    return v0
.end method

.method final isComment()Z
    .locals 1

    .line 721
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    return v0
.end method

.method final isElement()Z
    .locals 1

    .line 729
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    return v0
.end method

.method final isProcessingInstruction()Z
    .locals 1

    .line 733
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    return v0
.end method

.method final isText()Z
    .locals 1

    .line 725
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    return v0
.end method

.method protected jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 185
    array-length v0, p3

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    aget-object v0, p3, v1

    if-eqz v0, :cond_0

    aget-object v0, p3, v1

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_1

    .line 186
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, ""

    aput-object v2, v0, v1

    move-object p3, v0

    .line 189
    :cond_1
    aget-object v0, p3, v1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->ecmaToXml(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 190
    .local v0, "toXml":Lcom/trendmicro/hippo/xmlimpl/XML;
    if-eqz p2, :cond_2

    .line 191
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    move-result-object v1

    return-object v1

    .line 193
    :cond_2
    return-object v0
.end method

.method length()I
    .locals 1

    .line 379
    const/4 v0, 0x1

    return v0
.end method

.method localName()Ljava/lang/String;
    .locals 1

    .line 617
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->name()Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 618
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->name()Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method makeXmlFromString(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/String;

    .line 49
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method name()Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 3

    .line 598
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 599
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {p0, v2, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0

    .line 600
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newQName(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0

    .line 598
    :cond_2
    :goto_0
    return-object v1
.end method

.method namespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .line 609
    if-nez p1, :cond_0

    .line 610
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNamespaceDeclaration()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->createNamespace(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0

    .line 612
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->createNamespace(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method namespaceDeclarations()[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 2

    .line 604
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNamespaceDeclarations()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 605
    .local v0, "declarations":[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    return-object v1
.end method

.method nodeKind()Ljava/lang/Object;
    .locals 1

    .line 388
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->ecmaClass()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method normalize()V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->normalize()V

    .line 218
    return-void
.end method

.method parent()Ljava/lang/Object;
    .locals 2

    .line 393
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->parent()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 394
    .local v0, "parent":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 395
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->parent()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1
.end method

.method prependChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .line 483
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isParentType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 486
    :cond_0
    return-object p0
.end method

.method processingInstructions(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 439
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 440
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->PROCESSING_INSTRUCTION(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->addMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)V

    .line 441
    return-object v0
.end method

.method propertyIsEnumerable(Ljava/lang/Object;)Z
    .locals 9
    .param p1, "name"    # Ljava/lang/Object;

    .line 402
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 403
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    move v0, v1

    .local v0, "result":Z
    goto :goto_2

    .line 404
    .end local v0    # "result":Z
    :cond_1
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 405
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 407
    .local v3, "x":D
    const-wide/16 v5, 0x0

    cmpl-double v0, v3, v5

    if-nez v0, :cond_2

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    div-double/2addr v7, v3

    cmpl-double v0, v7, v5

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    move v0, v1

    .line 408
    .end local v3    # "x":D
    .restart local v0    # "result":Z
    goto :goto_2

    .line 409
    .end local v0    # "result":Z
    :cond_3
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 411
    .restart local v0    # "result":Z
    :goto_2
    return v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 84
    const-string v0, "Assignment to indexed XML is not allowed"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 1
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .line 162
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 165
    :cond_0
    invoke-virtual {p1, p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->setMyValueOn(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)V

    .line 167
    :goto_0
    return-void
.end method

.method remove()V
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->deleteMe()V

    .line 238
    return-void
.end method

.method removeChild(I)V
    .locals 1
    .param p1, "index"    # I

    .line 212
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->removeChild(I)V

    .line 213
    return-void
.end method

.method removeNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2
    .param p1, "ns"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 587
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 588
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->adapt(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->removeNamespace(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V

    .line 589
    return-object p0
.end method

.method replace(ILjava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2
    .param p1, "index"    # I
    .param p2, "xml"    # Ljava/lang/Object;

    .line 472
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 473
    .local v0, "xlChildToReplace":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 475
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 476
    .local v1, "childToReplace":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {p0, v1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->insertChildAfter(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 477
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->removeChild(I)V

    .line 479
    .end local v1    # "childToReplace":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_0
    return-object p0
.end method

.method replace(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 0
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "xml"    # Ljava/lang/Object;

    .line 279
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 280
    return-object p0
.end method

.method replaceWith(Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 2
    .param p1, "value"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->parent()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->replaceWith(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->initialize(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 44
    :goto_0
    return-void
.end method

.method setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 3
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .line 228
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 230
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 231
    :cond_0
    const-string v0, "@* assignment not supported."

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 233
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setAttribute(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)V

    .line 234
    return-void

    .line 228
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only set attributes on elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setChildren(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "xml"    # Ljava/lang/Object;

    .line 538
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 540
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 541
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->removeChild(I)V

    goto :goto_0

    .line 543
    :cond_1
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodesForInsert(Ljava/lang/Object;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 545
    .local v0, "toInsert":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v2, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 547
    return-object p0
.end method

.method setLocalName(Ljava/lang/String;)V
    .locals 1
    .param p1, "localName"    # Ljava/lang/String;

    .line 623
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 624
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setLocalName(Ljava/lang/String;)V

    .line 625
    return-void

    .line 623
    :cond_1
    :goto_0
    return-void
.end method

.method setName(Lcom/trendmicro/hippo/xmlimpl/QName;)V
    .locals 2
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 629
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 630
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 633
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setLocalName(Ljava/lang/String;)V

    .line 634
    return-void

    .line 636
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->renameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 637
    return-void

    .line 629
    :cond_2
    :goto_0
    return-void
.end method

.method setNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)V
    .locals 3
    .param p1, "ns"    # Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 641
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isText()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 642
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->prefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->setName(Lcom/trendmicro/hippo/xmlimpl/QName;)V

    .line 643
    return-void

    .line 641
    :cond_1
    :goto_0
    return-void
.end method

.method text()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3

    .line 432
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 433
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->TEXT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->addMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)V

    .line 434
    return-object v0
.end method

.method toDomNode()Lorg/w3c/dom/Node;
    .locals 1

    .line 738
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->toDomNode()Lorg/w3c/dom/Node;

    move-result-object v0

    return-object v0
.end method

.method toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "indent"    # I

    .line 708
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 703
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->ecmaToString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXMLString()Ljava/lang/String;
    .locals 2

    .line 713
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;->node:Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->ecmaToXMLString(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method valueOf()Ljava/lang/Object;
    .locals 0

    .line 416
    return-object p0
.end method
