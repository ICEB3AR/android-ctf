.class Lcom/trendmicro/hippo/xmlimpl/XMLList;
.super Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
.source "XMLList.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;


# static fields
.field static final serialVersionUID:J = -0x3f0e2d2e782404cfL


# instance fields
.field private _annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

.field private targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

.field private targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V
    .locals 1
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "prototype"    # Lcom/trendmicro/hippo/xml/XMLObject;

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 25
    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 29
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    .line 30
    return-void
.end method

.method private applyOrCall(ZLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "isApply"    # Z
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 720
    if-eqz p1, :cond_0

    const-string v0, "apply"

    goto :goto_0

    :cond_0
    const-string v0, "call"

    .line 721
    .local v0, "methodName":Ljava/lang/String;
    :goto_0
    instance-of v1, p4, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_1

    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    iget-object v1, v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    if-eqz v1, :cond_1

    .line 726
    invoke-static {p1, p2, p3, p4, p5}, Lcom/trendmicro/hippo/ScriptRuntime;->applyOrCall(ZLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 723
    :cond_1
    const-string v1, "msg.isnt.function"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 698
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 699
    .local v0, "propertyList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .line 701
    .local v1, "qname":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v2

    if-nez v2, :cond_0

    .line 704
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    .line 707
    :cond_0
    invoke-virtual {v0, p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 709
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 710
    nop

    .line 711
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    .line 710
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 709
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 714
    .end local v2    # "i":I
    :cond_1
    return-object v0
.end method

.method private getXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;I)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "_annos"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    .param p2, "index"    # I

    .line 287
    if-ltz p2, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 288
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->xmlFromNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0

    .line 290
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "index"    # I

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method private insert(ILcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 69
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 70
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;-><init>()V

    .line 71
    .local v0, "newAnnoList":Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;II)V

    .line 72
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 73
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    invoke-virtual {v0, v1, p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;II)V

    .line 74
    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    .line 76
    .end local v0    # "newAnnoList":Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    :cond_0
    return-void
.end method

.method private internalRemoveFromList(I)V
    .locals 1
    .param p1, "index"    # I

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->remove(I)V

    .line 56
    return-void
.end method

.method private replaceNode(Lcom/trendmicro/hippo/xmlimpl/XML;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 0
    .param p1, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;
    .param p2, "with"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 180
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->replaceWith(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 181
    return-void
.end method

.method private setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 2
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .line 356
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 357
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 358
    .local v1, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v1, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 356
    .end local v1    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 360
    .end local v0    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
    .locals 2
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 396
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 397
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 396
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 399
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method addToList(Ljava/lang/Object;)V
    .locals 1
    .param p1, "toAdd"    # Ljava/lang/Object;

    .line 363
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->addToList(Ljava/lang/Object;)V

    .line 364
    return-void
.end method

.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 760
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    if-eqz v0, :cond_7

    .line 763
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    .line 765
    .local v0, "methodName":Ljava/lang/String;
    const-string v1, "apply"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 766
    .local v1, "isApply":Z
    if-nez v1, :cond_6

    const-string v2, "call"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_2

    .line 769
    :cond_0
    instance-of v2, p3, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v2, :cond_5

    .line 772
    const/4 v2, 0x0

    .line 773
    .local v2, "func":Ljava/lang/Object;
    move-object v3, p3

    .line 775
    .local v3, "sobj":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    instance-of v4, v3, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v4, :cond_3

    .line 776
    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 777
    .local v4, "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v4, p1, v0}, Lcom/trendmicro/hippo/xml/XMLObject;->getFunctionProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 778
    sget-object v5, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v5, :cond_1

    .line 779
    goto :goto_1

    .line 781
    :cond_1
    invoke-virtual {v4, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->getExtraMethodSource(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 782
    if-eqz v3, :cond_2

    .line 783
    move-object p3, v3

    .line 784
    instance-of v5, v3, Lcom/trendmicro/hippo/xml/XMLObject;

    if-nez v5, :cond_2

    .line 785
    invoke-static {v3, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 788
    .end local v4    # "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_2
    goto :goto_0

    .line 790
    :cond_3
    :goto_1
    instance-of v4, v2, Lcom/trendmicro/hippo/Callable;

    if-eqz v4, :cond_4

    .line 793
    move-object v4, v2

    check-cast v4, Lcom/trendmicro/hippo/Callable;

    invoke-interface {v4, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 791
    :cond_4
    invoke-static {p3, v2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 770
    .end local v2    # "func":Ljava/lang/Object;
    .end local v3    # "sobj":Lcom/trendmicro/hippo/Scriptable;
    :cond_5
    const-string v2, "msg.incompat.call"

    invoke-static {v2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 767
    :cond_6
    :goto_2
    move-object v2, p0

    move v3, v1

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->applyOrCall(ZLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 761
    .end local v0    # "methodName":Ljava/lang/String;
    .end local v1    # "isApply":Z
    :cond_7
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3
    .param p1, "index"    # I

    .line 374
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 376
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 377
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 376
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 380
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method child(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 385
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 387
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 388
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->child(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 387
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 391
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method children()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 7

    .line 403
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 405
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/trendmicro/hippo/xmlimpl/XML;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 406
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 408
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    if-eqz v2, :cond_0

    .line 409
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->children()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    .line 411
    .local v3, "childList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v4

    .line 412
    .local v4, "cChildren":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    if-ge v5, v4, :cond_0

    .line 413
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 405
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v3    # "childList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v4    # "cChildren":I
    .end local v5    # "j":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 418
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    .line 419
    .local v1, "allChildren":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 421
    .local v2, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-ge v3, v2, :cond_2

    .line 422
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 421
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 425
    .end local v3    # "i":I
    :cond_2
    return-object v1
.end method

.method comments()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4

    .line 430
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 432
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 433
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 434
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->comments()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 432
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 437
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 797
    const-string v0, "msg.not.ctor"

    const-string v1, "XMLList"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method contains(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "xml"    # Ljava/lang/Object;

    .line 452
    const/4 v0, 0x0

    .line 454
    .local v0, "result":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 455
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 457
    .local v2, "member":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 458
    const/4 v0, 0x1

    .line 459
    goto :goto_1

    .line 454
    .end local v2    # "member":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 463
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return v0
.end method

.method copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    .locals 4

    .line 468
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 470
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 471
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 472
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 470
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 475
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public delete(I)V
    .locals 1
    .param p1, "index"    # I

    .line 307
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 308
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 310
    .local v0, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->remove()V

    .line 312
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->internalRemoveFromList(I)V

    .line 314
    .end local v0    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_0
    return-void
.end method

.method deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
    .locals 3
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 296
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 297
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 299
    .local v1, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 300
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 296
    .end local v1    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 303
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method elements(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 442
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 443
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 444
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 445
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->elements(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 443
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 447
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method equivalentXml(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "target"    # Ljava/lang/Object;

    .line 672
    const/4 v0, 0x0

    .line 675
    .local v0, "result":Z
    instance-of v1, p1, Lcom/trendmicro/hippo/Undefined;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 676
    const/4 v0, 0x1

    goto :goto_1

    .line 677
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 678
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_1

    .line 679
    :cond_1
    instance-of v1, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_3

    .line 680
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 682
    .local v1, "otherList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 683
    const/4 v0, 0x1

    .line 685
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 686
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 687
    const/4 v0, 0x0

    .line 688
    goto :goto_1

    .line 685
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 694
    .end local v1    # "otherList":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v2    # "i":I
    :cond_3
    :goto_1
    return v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 99
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 100
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0

    .line 102
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 86
    const-string v0, "XMLList"

    return-object v0
.end method

.method public getExtraMethodSource(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 750
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 751
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0

    .line 753
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .line 320
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 321
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    .local v0, "enumObjs":[Ljava/lang/Object;
    goto :goto_1

    .line 323
    .end local v0    # "enumObjs":[Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    .line 325
    .restart local v0    # "enumObjs":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 326
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 325
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 330
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-object v0
.end method

.method public getIdsForDebug()[Ljava/lang/Object;
    .locals 1

    .line 334
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    return-object v0
.end method

.method getXML()Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 2

    .line 50
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0

    .line 51
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 176
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 114
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method hasComplexContent()Z
    .locals 5

    .line 491
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    .line 493
    .local v0, "length":I
    if-nez v0, :cond_0

    .line 494
    const/4 v1, 0x0

    .local v1, "complexContent":Z
    goto :goto_1

    .line 495
    .end local v1    # "complexContent":Z
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 496
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasComplexContent()Z

    move-result v1

    .restart local v1    # "complexContent":Z
    goto :goto_1

    .line 498
    .end local v1    # "complexContent":Z
    :cond_1
    const/4 v1, 0x0

    .line 500
    .restart local v1    # "complexContent":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_3

    .line 501
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 502
    .local v3, "nextElement":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 503
    const/4 v1, 0x1

    .line 504
    goto :goto_1

    .line 500
    .end local v3    # "nextElement":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 509
    .end local v2    # "i":I
    :cond_3
    :goto_1
    return v1
.end method

.method hasOwnProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
    .locals 4
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 480
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->isPrototype()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 481
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    .line 482
    .local v0, "property":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->findPrototypeId(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 484
    .end local v0    # "property":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1
.end method

.method hasSimpleContent()Z
    .locals 5

    .line 514
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 515
    return v1

    .line 516
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 517
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->hasSimpleContent()Z

    move-result v0

    return v0

    .line 519
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 520
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 521
    .local v3, "nextElement":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 522
    return v2

    .line 519
    .end local v3    # "nextElement":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 525
    .end local v0    # "i":I
    :cond_3
    return v1
.end method

.method hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
    .locals 1
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 109
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

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

.method item(I)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "index"    # I

    .line 351
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    if-eqz v0, :cond_0

    .line 352
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->createEmptyXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 351
    :goto_0
    return-object v0
.end method

.method protected jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 733
    array-length v0, p3

    if-nez v0, :cond_0

    .line 734
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0

    .line 736
    :cond_0
    const/4 v0, 0x0

    aget-object v0, p3, v0

    .line 737
    .local v0, "arg0":Ljava/lang/Object;
    if-nez p2, :cond_1

    instance-of v1, v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_1

    .line 739
    return-object v0

    .line 741
    :cond_1
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLListFrom(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1
.end method

.method length()I
    .locals 2

    .line 531
    const/4 v0, 0x0

    .line 533
    .local v0, "result":I
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    if-eqz v1, :cond_0

    .line 534
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->length()I

    move-result v0

    .line 537
    :cond_0
    return v0
.end method

.method normalize()V
    .locals 2

    .line 542
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 543
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->normalize()V

    .line 542
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 545
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method parent()Ljava/lang/Object;
    .locals 5

    .line 553
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 555
    :cond_0
    const/4 v0, 0x0

    .line 557
    .local v0, "candidateParent":Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 558
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->parent()Ljava/lang/Object;

    move-result-object v2

    .line 559
    .local v2, "currParent":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-nez v3, :cond_1

    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v3

    .line 560
    :cond_1
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 561
    .local v3, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    if-nez v1, :cond_2

    .line 563
    move-object v0, v3

    goto :goto_1

    .line 565
    :cond_2
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->is(Lcom/trendmicro/hippo/xmlimpl/XML;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 557
    .end local v2    # "currParent":Ljava/lang/Object;
    .end local v3    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 568
    .restart local v2    # "currParent":Ljava/lang/Object;
    .restart local v3    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_3
    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v4

    .line 572
    .end local v1    # "i":I
    .end local v2    # "currParent":Ljava/lang/Object;
    .end local v3    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_4
    return-object v0
.end method

.method processingInstructions(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 4
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 577
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 579
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 580
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 582
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->processingInstructions(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 579
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 585
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method propertyIsEnumerable(Ljava/lang/Object;)Z
    .locals 12
    .param p1, "name"    # Ljava/lang/Object;

    .line 591
    instance-of v0, p1, Ljava/lang/Integer;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 592
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v4, v0

    .local v4, "index":J
    goto :goto_0

    .line 593
    .end local v4    # "index":J
    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 594
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 595
    .local v4, "x":D
    double-to-long v6, v4

    .line 596
    .local v6, "index":J
    long-to-double v8, v6

    cmpl-double v0, v8, v4

    if-eqz v0, :cond_1

    .line 597
    return v3

    .line 599
    :cond_1
    cmp-long v0, v6, v1

    if-nez v0, :cond_2

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    div-double/2addr v8, v4

    const-wide/16 v10, 0x0

    cmpg-double v0, v8, v10

    if-gez v0, :cond_2

    .line 601
    return v3

    .line 603
    .end local v4    # "x":D
    :cond_2
    move-wide v4, v6

    goto :goto_0

    .line 604
    .end local v6    # "index":J
    :cond_3
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 605
    .local v0, "s":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v4

    .line 607
    .end local v0    # "s":Ljava/lang/String;
    .local v4, "index":J
    :goto_0
    cmp-long v0, v1, v4

    if-gtz v0, :cond_4

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, v4, v0

    if-gez v0, :cond_4

    const/4 v3, 0x1

    :cond_4
    return v3
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 9
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 190
    .local v0, "parent":Ljava/lang/Object;
    if-nez p3, :cond_0

    .line 191
    const-string p3, "null"

    goto :goto_0

    .line 192
    :cond_0
    instance-of v1, p3, Lcom/trendmicro/hippo/Undefined;

    if-eqz v1, :cond_1

    .line 193
    const-string p3, "undefined"

    .line 196
    :cond_1
    :goto_0
    instance-of v1, p3, Lcom/trendmicro/hippo/xml/XMLObject;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 197
    move-object v1, p3

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLObject;

    .local v1, "xmlValue":Lcom/trendmicro/hippo/xml/XMLObject;
    goto :goto_2

    .line 199
    .end local v1    # "xmlValue":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    if-nez v1, :cond_3

    .line 200
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLFromJs(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .restart local v1    # "xmlValue":Lcom/trendmicro/hippo/xml/XMLObject;
    goto :goto_2

    .line 206
    .end local v1    # "xmlValue":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_3
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 207
    .restart local v1    # "xmlValue":Lcom/trendmicro/hippo/xml/XMLObject;
    if-nez v1, :cond_5

    .line 208
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 209
    .local v3, "x":Lcom/trendmicro/hippo/xmlimpl/XML;
    if-nez v3, :cond_4

    .line 210
    iget-object v4, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v4, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    goto :goto_1

    .line 211
    :cond_4
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    move-result-object v4

    :goto_1
    move-object v1, v4

    .line 213
    .end local v3    # "x":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_5
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v3, p3}, Lcom/trendmicro/hippo/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 218
    :goto_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge p1, v3, :cond_6

    .line 219
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->parent()Ljava/lang/Object;

    move-result-object v0

    goto :goto_4

    .line 220
    :cond_6
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-nez v3, :cond_8

    .line 221
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    goto :goto_3

    :cond_7
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->parent()Ljava/lang/Object;

    move-result-object v3

    :goto_3
    move-object v0, v3

    goto :goto_4

    .line 224
    :cond_8
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->parent()Ljava/lang/Object;

    move-result-object v0

    .line 227
    :goto_4
    instance-of v3, v0, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v3, :cond_c

    .line 229
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 231
    .local v3, "xmlParent":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge p1, v4, :cond_b

    .line 233
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    .line 235
    .local v4, "xmlNode":Lcom/trendmicro/hippo/xmlimpl/XML;
    instance-of v5, v1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v5, :cond_9

    .line 236
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-direct {p0, v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replaceNode(Lcom/trendmicro/hippo/xmlimpl/XML;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 237
    invoke-virtual {p0, p1, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    goto :goto_6

    .line 238
    :cond_9
    instance-of v5, v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v5, :cond_a

    .line 240
    move-object v5, v1

    check-cast v5, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 242
    .local v5, "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v6

    if-lez v6, :cond_a

    .line 243
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->childIndex()I

    move-result v6

    .line 244
    .local v6, "lastIndexAdded":I
    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v7

    invoke-direct {p0, v4, v7}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replaceNode(Lcom/trendmicro/hippo/xmlimpl/XML;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 245
    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 247
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_5
    invoke-virtual {v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v7

    if-ge v2, v7, :cond_a

    .line 248
    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/xmlimpl/XML;->getXmlChild(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v7

    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lcom/trendmicro/hippo/xmlimpl/XML;->insertChildAfter(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 249
    add-int/lit8 v6, v6, 0x1

    .line 250
    add-int v7, p1, v2

    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->insert(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 247
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 254
    .end local v2    # "i":I
    .end local v4    # "xmlNode":Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v5    # "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v6    # "lastIndexAdded":I
    :cond_a
    :goto_6
    goto :goto_7

    .line 256
    :cond_b
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 257
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->getLastXmlChild()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 259
    .end local v3    # "xmlParent":Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_7
    goto :goto_a

    .line 261
    :cond_c
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge p1, v3, :cond_f

    .line 262
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-direct {p0, v3, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 264
    .local v3, "xmlNode":Lcom/trendmicro/hippo/xmlimpl/XML;
    instance-of v4, v1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v4, :cond_d

    .line 265
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replaceNode(Lcom/trendmicro/hippo/xmlimpl/XML;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 266
    invoke-virtual {p0, p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    goto :goto_9

    .line 267
    :cond_d
    instance-of v4, v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v4, :cond_e

    .line 269
    move-object v4, v1

    check-cast v4, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 271
    .local v4, "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v5

    if-lez v5, :cond_e

    .line 272
    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v5

    invoke-direct {p0, v3, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replaceNode(Lcom/trendmicro/hippo/xmlimpl/XML;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 273
    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 275
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_8
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v5

    if-ge v2, v5, :cond_e

    .line 276
    add-int v5, p1, v2

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->insert(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 275
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 280
    .end local v2    # "i":I
    .end local v3    # "xmlNode":Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v4    # "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_e
    :goto_9
    goto :goto_a

    .line 281
    :cond_f
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 284
    :goto_a
    return-void
.end method

.method putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V
    .locals 4
    .param p1, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .line 122
    if-nez p2, :cond_0

    .line 123
    const-string p2, "null"

    goto :goto_0

    .line 124
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/Undefined;

    if-eqz v0, :cond_1

    .line 125
    const-string p2, "undefined"

    .line 128
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_6

    .line 131
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    .line 134
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    if-eqz v0, :cond_3

    .line 135
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 136
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3

    .line 140
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 141
    .local v0, "xmlValue":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 143
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 144
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto :goto_1

    .line 146
    :cond_2
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 147
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 150
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 154
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 155
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 156
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v3

    .line 154
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v2

    .line 157
    .local v2, "name2":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    invoke-virtual {v3, v2, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 158
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->getLastXmlChild()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 159
    .end local v0    # "xmlValue":Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v2    # "name2":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_2

    .line 160
    :cond_3
    const-string v0, "Assignment to empty XMLList without targets not supported"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 163
    :cond_4
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 164
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto :goto_2

    .line 166
    :cond_5
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 167
    .local v0, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 170
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 172
    .end local v0    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_2
    return-void

    .line 129
    :cond_6
    const-string v0, "Assignment to lists with more than one item is not supported"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method remove()V
    .locals 3

    .line 340
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    .line 341
    .local v0, "nLen":I
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 342
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 343
    .local v2, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    if-eqz v2, :cond_0

    .line 344
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->remove()V

    .line 345
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->internalRemoveFromList(I)V

    .line 341
    .end local v2    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 348
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 59
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 60
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;-><init>()V

    .line 61
    .local v0, "newAnnoList":Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;II)V

    .line 62
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 63
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;II)V

    .line 64
    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->_annos:Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    .line 66
    .end local v0    # "newAnnoList":Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    :cond_0
    return-void
.end method

.method setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V
    .locals 0
    .param p1, "object"    # Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    .param p2, "property"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 39
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 40
    iput-object p2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLList;->targetProperty:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 41
    return-void
.end method

.method text()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3

    .line 612
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 614
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 615
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->text()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 614
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 618
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method toSource(I)Ljava/lang/String;
    .locals 1
    .param p1, "indent"    # I

    .line 644
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 624
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->hasSimpleContent()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 625
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 627
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 628
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 629
    .local v2, "next":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isComment()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 632
    :cond_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    .end local v2    # "next":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 636
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 638
    .end local v0    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXMLString()Ljava/lang/String;
    .locals 3

    .line 650
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 652
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 653
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 654
    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 656
    :cond_0
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 658
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method valueOf()Ljava/lang/Object;
    .locals 0

    .line 663
    return-object p0
.end method
