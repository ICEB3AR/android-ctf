.class abstract Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
.super Lcom/trendmicro/hippo/xml/XMLObject;
.source "XMLObjectImpl.java"


# static fields
.field private static final Id_addNamespace:I = 0x2

.field private static final Id_appendChild:I = 0x3

.field private static final Id_attribute:I = 0x4

.field private static final Id_attributes:I = 0x5

.field private static final Id_child:I = 0x6

.field private static final Id_childIndex:I = 0x7

.field private static final Id_children:I = 0x8

.field private static final Id_comments:I = 0x9

.field private static final Id_constructor:I = 0x1

.field private static final Id_contains:I = 0xa

.field private static final Id_copy:I = 0xb

.field private static final Id_descendants:I = 0xc

.field private static final Id_elements:I = 0xd

.field private static final Id_hasComplexContent:I = 0x12

.field private static final Id_hasOwnProperty:I = 0x11

.field private static final Id_hasSimpleContent:I = 0x13

.field private static final Id_inScopeNamespaces:I = 0xe

.field private static final Id_insertChildAfter:I = 0xf

.field private static final Id_insertChildBefore:I = 0x10

.field private static final Id_length:I = 0x14

.field private static final Id_localName:I = 0x15

.field private static final Id_name:I = 0x16

.field private static final Id_namespace:I = 0x17

.field private static final Id_namespaceDeclarations:I = 0x18

.field private static final Id_nodeKind:I = 0x19

.field private static final Id_normalize:I = 0x1a

.field private static final Id_parent:I = 0x1b

.field private static final Id_prependChild:I = 0x1c

.field private static final Id_processingInstructions:I = 0x1d

.field private static final Id_propertyIsEnumerable:I = 0x1e

.field private static final Id_removeNamespace:I = 0x1f

.field private static final Id_replace:I = 0x20

.field private static final Id_setChildren:I = 0x21

.field private static final Id_setLocalName:I = 0x22

.field private static final Id_setName:I = 0x23

.field private static final Id_setNamespace:I = 0x24

.field private static final Id_text:I = 0x25

.field private static final Id_toSource:I = 0x27

.field private static final Id_toString:I = 0x26

.field private static final Id_toXMLString:I = 0x28

.field private static final Id_valueOf:I = 0x29

.field private static final MAX_PROTOTYPE_ID:I = 0x29

.field private static final XMLOBJECT_TAG:Ljava/lang/Object;


# instance fields
.field private lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

.field private prototypeFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "XMLObject"

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V
    .locals 0
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "prototype"    # Lcom/trendmicro/hippo/xml/XMLObject;

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/xml/XMLObject;-><init>()V

    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->initialize(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    .line 35
    return-void
.end method

.method private static arg([Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .line 817
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_0
    return-object v0
.end method

.method private getMatches(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 157
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 158
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 159
    return-object v0
.end method

.method private toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .param p1, "typed"    # [Ljava/lang/Object;

    .line 598
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/Object;

    .line 599
    .local v0, "rv":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 600
    aget-object v2, p1, v1

    aput-object v2, v0, v1

    .line 599
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 602
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .line 606
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method abstract addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
.end method

.method public final addValues(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "thisIsLeft"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .line 374
    instance-of v0, p3, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_1

    .line 376
    if-eqz p2, :cond_0

    .line 377
    move-object v0, p0

    .line 378
    .local v0, "v1":Lcom/trendmicro/hippo/xml/XMLObject;
    move-object v1, p3

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLObject;

    .local v1, "v2":Lcom/trendmicro/hippo/xml/XMLObject;
    goto :goto_0

    .line 380
    .end local v0    # "v1":Lcom/trendmicro/hippo/xml/XMLObject;
    .end local v1    # "v2":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_0
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 381
    .restart local v0    # "v1":Lcom/trendmicro/hippo/xml/XMLObject;
    move-object v1, p0

    .line 383
    .restart local v1    # "v2":Lcom/trendmicro/hippo/xml/XMLObject;
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p1, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->addXMLObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/xml/XMLObject;Lcom/trendmicro/hippo/xml/XMLObject;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 385
    .end local v0    # "v1":Lcom/trendmicro/hippo/xml/XMLObject;
    .end local v1    # "v2":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p3, v0, :cond_2

    .line 387
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 390
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xml/XMLObject;->addValues(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method abstract child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract child(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract children()Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract comments()Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract contains(Ljava/lang/Object;)Z
.end method

.method abstract copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
.end method

.method final createEmptyXML()Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1

    .line 840
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createEmpty(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final createNamespace(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 3
    .param p1, "declaration"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 86
    if-nez p1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    aget-object v0, v0, v2

    return-object v0
.end method

.method final createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "declarations"    # [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 91
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 297
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 298
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 299
    return-void
.end method

.method public final delete(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 282
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object p1

    .line 283
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 284
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 285
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v2

    .line 287
    .local v2, "index":J
    long-to-int v4, v2

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->delete(I)V

    .line 288
    return v1

    .line 290
    .end local v2    # "index":J
    :cond_1
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 291
    return v1
.end method

.method abstract deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
.end method

.method final ecmaEscapeAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .line 835
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 836
    .local v0, "quoted":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method final ecmaToXml(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .line 830
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->ecmaToXml(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method abstract elements(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method public enterDotQuery(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 366
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    .line 367
    .local v0, "xws":Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->initAsDotQuery()V

    .line 368
    return-object v0
.end method

.method public enterWith(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 361
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    return-object v0
.end method

.method protected final equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .line 202
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    .line 203
    .local v0, "result":Z
    if-eqz v0, :cond_0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v1
.end method

.method abstract equivalentXml(Ljava/lang/Object;)Z
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 613
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 614
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/xml/XMLObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 616
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 617
    .local v0, "id":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 618
    if-nez p4, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    invoke-virtual {p0, p2, v1, p5}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 622
    :cond_2
    instance-of v3, p4, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v3, :cond_22

    .line 624
    move-object v3, p4

    check-cast v3, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 626
    .local v3, "realThis":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    .line 627
    .local v4, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_0

    .line 813
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 811
    :pswitch_0
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->valueOf()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 808
    :pswitch_1
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 805
    :pswitch_2
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v1

    .line 806
    .local v1, "indent":I
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toSource(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 803
    .end local v1    # "indent":I
    :pswitch_3
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 801
    :pswitch_4
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->text()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1

    .line 733
    :pswitch_5
    if-nez v4, :cond_3

    const-string v1, "setNamespace"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 734
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->castToNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    .line 735
    .local v1, "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->setNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)V

    .line 736
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v2

    .line 726
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :pswitch_6
    if-nez v4, :cond_4

    const-string v1, "setName"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 727
    :cond_4
    array-length v1, p5

    if-eqz v1, :cond_5

    aget-object v1, p5, v2

    goto :goto_1

    :cond_5
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 728
    .local v1, "arg":Ljava/lang/Object;
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->constructQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v2

    .line 729
    .local v2, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->setName(Lcom/trendmicro/hippo/xmlimpl/QName;)V

    .line 730
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v5

    .line 714
    .end local v1    # "arg":Ljava/lang/Object;
    .end local v2    # "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    :pswitch_7
    if-nez v4, :cond_6

    const-string v1, "setLocalName"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 716
    :cond_6
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 717
    .restart local v1    # "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v2, :cond_7

    .line 718
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v2

    .local v2, "localName":Ljava/lang/String;
    goto :goto_2

    .line 720
    .end local v2    # "localName":Ljava/lang/String;
    :cond_7
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 722
    .restart local v2    # "localName":Ljava/lang/String;
    :goto_2
    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->setLocalName(Ljava/lang/String;)V

    .line 723
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v5

    .line 710
    .end local v1    # "arg":Ljava/lang/Object;
    .end local v2    # "localName":Ljava/lang/String;
    :pswitch_8
    if-nez v4, :cond_8

    const-string v1, "setChildren"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 711
    :cond_8
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 698
    :pswitch_9
    if-nez v4, :cond_9

    const-string v5, "replace"

    invoke-direct {p0, v3, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 699
    :cond_9
    iget-object v5, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v2

    .line 700
    .local v2, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-static {p5, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 701
    .local v1, "arg1":Ljava/lang/Object;
    if-nez v2, :cond_a

    .line 703
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v5

    long-to-int v5, v5

    .line 704
    .local v5, "index":I
    invoke-virtual {v4, v5, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->replace(ILjava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v6

    return-object v6

    .line 706
    .end local v5    # "index":I
    :cond_a
    invoke-virtual {v4, v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->replace(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v5

    return-object v5

    .line 693
    .end local v1    # "arg1":Ljava/lang/Object;
    .end local v2    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_a
    if-nez v4, :cond_b

    const-string v1, "removeNamespace"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 694
    :cond_b
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->castToNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    .line 695
    .local v1, "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->removeNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    return-object v2

    .line 797
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :pswitch_b
    nop

    .line 798
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->propertyIsEnumerable(Ljava/lang/Object;)Z

    move-result v1

    .line 797
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 791
    :pswitch_c
    array-length v1, p5

    if-lez v1, :cond_c

    .line 792
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v2, p5, v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    goto :goto_3

    .line 793
    :cond_c
    invoke-static {}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formStar()Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    :goto_3
    nop

    .line 794
    .local v1, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->processingInstructions(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    return-object v2

    .line 689
    .end local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_d
    if-nez v4, :cond_d

    const-string v1, "prependChild"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 690
    :cond_d
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->prependChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 789
    :pswitch_e
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->parent()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 786
    :pswitch_f
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->normalize()V

    .line 787
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 685
    :pswitch_10
    if-nez v4, :cond_e

    const-string v1, "nodeKind"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 686
    :cond_e
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->nodeKind()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 680
    :pswitch_11
    if-nez v4, :cond_f

    const-string v1, "namespaceDeclarations"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 681
    :cond_f
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->namespaceDeclarations()[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    .line 682
    .local v1, "array":[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, p3, v2}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2

    .line 670
    .end local v1    # "array":[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :pswitch_12
    if-nez v4, :cond_10

    const-string v1, "namespace"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 671
    :cond_10
    array-length v1, p5

    if-lez v1, :cond_11

    aget-object v1, p5, v2

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    :cond_11
    move-object v1, v5

    .line 672
    .local v1, "prefix":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->namespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v2

    .line 673
    .local v2, "rv":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    if-nez v2, :cond_12

    .line 674
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v5

    .line 676
    :cond_12
    return-object v2

    .line 666
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v2    # "rv":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    :pswitch_13
    if-nez v4, :cond_13

    const-string v1, "name"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 667
    :cond_13
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->name()Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v1

    return-object v1

    .line 662
    :pswitch_14
    if-nez v4, :cond_14

    const-string v1, "localName"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 663
    :cond_14
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->localName()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 784
    :pswitch_15
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->length()I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 782
    :pswitch_16
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasSimpleContent()Z

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 780
    :pswitch_17
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasComplexContent()Z

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 775
    :pswitch_18
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    .line 776
    .local v1, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    nop

    .line 777
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasOwnProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v2

    .line 776
    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 654
    .end local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_19
    if-nez v4, :cond_15

    const-string v5, "insertChildBefore"

    invoke-direct {p0, v3, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 655
    :cond_15
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 656
    .local v2, "arg0":Ljava/lang/Object;
    if-eqz v2, :cond_17

    instance-of v5, v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v5, :cond_16

    goto :goto_4

    .line 659
    :cond_16
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 657
    :cond_17
    :goto_4
    move-object v5, v2

    check-cast v5, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-static {p5, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v5, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->insertChildBefore(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 646
    .end local v2    # "arg0":Ljava/lang/Object;
    :pswitch_1a
    if-nez v4, :cond_18

    const-string v5, "insertChildAfter"

    invoke-direct {p0, v3, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 647
    :cond_18
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 648
    .restart local v2    # "arg0":Ljava/lang/Object;
    if-eqz v2, :cond_1a

    instance-of v5, v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v5, :cond_19

    goto :goto_5

    .line 651
    :cond_19
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 649
    :cond_1a
    :goto_5
    move-object v5, v2

    check-cast v5, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-static {p5, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v5, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->insertChildAfter(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 642
    .end local v2    # "arg0":Ljava/lang/Object;
    :pswitch_1b
    if-nez v4, :cond_1b

    const-string v1, "inScopeNamespaces"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 643
    :cond_1b
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->inScopeNamespaces()[Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, p3, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 769
    :pswitch_1c
    array-length v1, p5

    if-nez v1, :cond_1c

    .line 770
    invoke-static {}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formStar()Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    goto :goto_6

    .line 771
    :cond_1c
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v2, p5, v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    :goto_6
    nop

    .line 772
    .restart local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->elements(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    return-object v2

    .line 765
    .end local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_1d
    array-length v6, p5

    if-nez v6, :cond_1d

    invoke-static {v5, v5}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v5

    goto :goto_7

    :cond_1d
    iget-object v5, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    aget-object v6, p5, v2

    invoke-virtual {v5, p2, v6, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v5

    .line 766
    .local v5, "qname":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    :goto_7
    invoke-static {v5, v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-direct {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getMatches(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1

    .line 763
    .end local v5    # "qname":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    :pswitch_1e
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    move-result-object v1

    return-object v1

    .line 760
    :pswitch_1f
    nop

    .line 761
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 760
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 758
    :pswitch_20
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->comments()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1

    .line 756
    :pswitch_21
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->children()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1

    .line 638
    :pswitch_22
    if-nez v4, :cond_1e

    const-string v1, "childIndex"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 639
    :cond_1e
    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->childIndex()I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 746
    :pswitch_23
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    .line 747
    .restart local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    if-nez v1, :cond_1f

    .line 749
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v5

    long-to-int v2, v5

    .line 750
    .local v2, "index":I
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->child(I)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v5

    return-object v5

    .line 752
    .end local v2    # "index":I
    :cond_1f
    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->child(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    return-object v2

    .line 744
    .end local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_24
    invoke-static {v5, v5}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v5

    invoke-static {v5, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-direct {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getMatches(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    return-object v1

    .line 740
    :pswitch_25
    iget-object v5, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, p2, v6, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v5

    invoke-static {v5, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    .line 741
    .restart local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-direct {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getMatches(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    return-object v2

    .line 629
    .end local v1    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :pswitch_26
    if-nez v4, :cond_20

    const-string v1, "appendChild"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 630
    :cond_20
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 633
    :pswitch_27
    if-nez v4, :cond_21

    const-string v1, "addNamespace"

    invoke-direct {p0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 634
    :cond_21
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-static {p5, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->castToNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    .line 635
    .local v1, "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->addNamespace(Lcom/trendmicro/hippo/xmlimpl/Namespace;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    return-object v2

    .line 623
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .end local v3    # "realThis":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    .end local v4    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_22
    invoke-static {p1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final exportAsJSClass(Z)V
    .locals 2
    .param p1, "sealed"    # Z

    .line 400
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 401
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {p0, v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 402
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 16
    .param p1, "s"    # Ljava/lang/String;

    .line 455
    move-object/from16 v0, p1

    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v2, 0x0

    .line 456
    .local v2, "X":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x70

    const/4 v5, 0x3

    const/16 v7, 0x6d

    const/16 v8, 0x64

    const/16 v9, 0x69

    const/4 v10, 0x2

    const/16 v12, 0x73

    const/16 v13, 0x61

    const/16 v14, 0x74

    const/16 v15, 0x65

    const/16 v6, 0x63

    const/4 v11, 0x0

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 522
    :pswitch_1
    const-string v2, "processingInstructions"

    const/16 v1, 0x1d

    goto/16 :goto_0

    .line 521
    :pswitch_2
    const-string v2, "namespaceDeclarations"

    const/16 v1, 0x18

    goto/16 :goto_0

    .line 520
    :pswitch_3
    const-string v2, "propertyIsEnumerable"

    const/16 v1, 0x1e

    goto/16 :goto_0

    .line 515
    :pswitch_4
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 516
    .local v3, "c":I
    const/16 v4, 0x43

    if-ne v3, v4, :cond_0

    const-string v2, "hasComplexContent"

    const/16 v1, 0x12

    goto/16 :goto_0

    .line 517
    :cond_0
    if-ne v3, v6, :cond_1

    const-string v2, "inScopeNamespaces"

    const/16 v1, 0xe

    goto/16 :goto_0

    .line 518
    :cond_1
    if-ne v3, v15, :cond_1c

    const-string v2, "insertChildBefore"

    const/16 v1, 0x10

    goto/16 :goto_0

    .line 511
    .end local v3    # "c":I
    :pswitch_5
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 512
    .restart local v3    # "c":I
    const/16 v4, 0x68

    if-ne v3, v4, :cond_2

    const-string v2, "hasSimpleContent"

    const/16 v1, 0x13

    goto/16 :goto_0

    .line 513
    :cond_2
    if-ne v3, v9, :cond_1c

    const-string v2, "insertChildAfter"

    const/16 v1, 0xf

    goto/16 :goto_0

    .line 510
    .end local v3    # "c":I
    :pswitch_6
    const-string v2, "removeNamespace"

    const/16 v1, 0x1f

    goto/16 :goto_0

    .line 509
    :pswitch_7
    const-string v2, "hasOwnProperty"

    const/16 v1, 0x11

    goto/16 :goto_0

    .line 500
    :pswitch_8
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 501
    .restart local v3    # "c":I
    if-ne v3, v13, :cond_3

    const-string v2, "addNamespace"

    const/4 v1, 0x2

    goto/16 :goto_0

    .line 502
    :cond_3
    if-ne v3, v4, :cond_4

    const-string v2, "prependChild"

    const/16 v1, 0x1c

    goto/16 :goto_0

    .line 503
    :cond_4
    if-ne v3, v12, :cond_1c

    .line 504
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 505
    const/16 v4, 0x4c

    if-ne v3, v4, :cond_5

    const-string v2, "setLocalName"

    const/16 v1, 0x22

    goto/16 :goto_0

    .line 506
    :cond_5
    const/16 v4, 0x4e

    if-ne v3, v4, :cond_1c

    const-string v2, "setNamespace"

    const/16 v1, 0x24

    goto/16 :goto_0

    .line 493
    .end local v3    # "c":I
    :pswitch_9
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v13, :cond_a

    if-eq v3, v6, :cond_9

    if-eq v3, v8, :cond_8

    if-eq v3, v12, :cond_7

    if-eq v3, v14, :cond_6

    .line 499
    goto/16 :goto_0

    .line 498
    :cond_6
    const-string v2, "toXMLString"

    const/16 v1, 0x28

    goto/16 :goto_0

    .line 497
    :cond_7
    const-string v2, "setChildren"

    const/16 v1, 0x21

    goto/16 :goto_0

    .line 496
    :cond_8
    const-string v2, "descendants"

    const/16 v1, 0xc

    goto/16 :goto_0

    .line 495
    :cond_9
    const-string v2, "constructor"

    const/4 v1, 0x1

    goto/16 :goto_0

    .line 494
    :cond_a
    const-string v2, "appendChild"

    const/4 v1, 0x3

    goto/16 :goto_0

    .line 489
    :pswitch_a
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 490
    .restart local v3    # "c":I
    if-ne v3, v13, :cond_b

    const-string v2, "attributes"

    const/4 v1, 0x5

    goto/16 :goto_0

    .line 491
    :cond_b
    if-ne v3, v6, :cond_1c

    const-string v2, "childIndex"

    const/4 v1, 0x7

    goto/16 :goto_0

    .line 483
    .end local v3    # "c":I
    :pswitch_b
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v6, :cond_f

    if-eq v3, v7, :cond_e

    const/16 v4, 0x72

    if-eq v3, v4, :cond_d

    if-eq v3, v14, :cond_c

    .line 488
    goto/16 :goto_0

    .line 487
    :cond_c
    const-string v2, "attribute"

    const/4 v1, 0x4

    goto/16 :goto_0

    .line 486
    :cond_d
    const-string v2, "normalize"

    const/16 v1, 0x1a

    goto/16 :goto_0

    .line 485
    :cond_e
    const-string v2, "namespace"

    const/16 v1, 0x17

    goto/16 :goto_0

    .line 484
    :cond_f
    const-string v2, "localName"

    const/16 v1, 0x15

    goto/16 :goto_0

    .line 472
    :pswitch_c
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x53

    if-eq v3, v4, :cond_15

    if-eq v3, v9, :cond_14

    if-eq v3, v8, :cond_13

    if-eq v3, v15, :cond_12

    if-eq v3, v7, :cond_11

    const/16 v4, 0x6e

    if-eq v3, v4, :cond_10

    .line 482
    goto/16 :goto_0

    .line 481
    :cond_10
    const-string v2, "contains"

    const/16 v1, 0xa

    goto/16 :goto_0

    .line 480
    :cond_11
    const-string v2, "comments"

    const/16 v1, 0x9

    goto/16 :goto_0

    .line 478
    :cond_12
    const-string v2, "elements"

    const/16 v1, 0xd

    goto/16 :goto_0

    .line 477
    :cond_13
    const-string v2, "nodeKind"

    const/16 v1, 0x19

    goto/16 :goto_0

    .line 479
    :cond_14
    const-string v2, "children"

    const/16 v1, 0x8

    goto/16 :goto_0

    .line 473
    :cond_15
    const/4 v3, 0x7

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 474
    .restart local v3    # "c":I
    if-ne v3, v15, :cond_16

    const-string v2, "toSource"

    const/16 v1, 0x27

    goto :goto_0

    .line 475
    :cond_16
    const/16 v4, 0x67

    if-ne v3, v4, :cond_1c

    const-string v2, "toString"

    const/16 v1, 0x26

    goto :goto_0

    .line 467
    .end local v3    # "c":I
    :pswitch_d
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 468
    .restart local v3    # "c":I
    const/16 v4, 0x72

    if-ne v3, v4, :cond_17

    const-string v2, "replace"

    const/16 v1, 0x20

    goto :goto_0

    .line 469
    :cond_17
    if-ne v3, v12, :cond_18

    const-string v2, "setName"

    const/16 v1, 0x23

    goto :goto_0

    .line 470
    :cond_18
    const/16 v4, 0x76

    if-ne v3, v4, :cond_1c

    const-string v2, "valueOf"

    const/16 v1, 0x29

    goto :goto_0

    .line 463
    .end local v3    # "c":I
    :pswitch_e
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 464
    .restart local v3    # "c":I
    const/16 v5, 0x6c

    if-ne v3, v5, :cond_19

    const-string v2, "length"

    const/16 v1, 0x14

    goto :goto_0

    .line 465
    :cond_19
    if-ne v3, v4, :cond_1c

    const-string v2, "parent"

    const/16 v1, 0x1b

    goto :goto_0

    .line 462
    .end local v3    # "c":I
    :pswitch_f
    const-string v2, "child"

    const/4 v1, 0x6

    goto :goto_0

    .line 457
    :pswitch_10
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 458
    .restart local v3    # "c":I
    if-ne v3, v6, :cond_1a

    const-string v2, "copy"

    const/16 v1, 0xb

    goto :goto_0

    .line 459
    :cond_1a
    const/16 v4, 0x6e

    if-ne v3, v4, :cond_1b

    const-string v2, "name"

    const/16 v1, 0x16

    goto :goto_0

    .line 460
    :cond_1b
    if-ne v3, v14, :cond_1c

    const-string v2, "text"

    const/16 v1, 0x25

    .line 524
    .end local v3    # "c":I
    :cond_1c
    :goto_0
    if-eqz v2, :cond_1d

    if-eq v2, v0, :cond_1d

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d

    const/4 v1, 0x0

    .line 528
    .end local v2    # "X":Ljava/lang/String;
    :cond_1d
    return v1

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final get(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 237
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object p1

    .line 238
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 239
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    if-nez v0, :cond_2

    .line 240
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v1

    .line 242
    .local v1, "index":J
    long-to-int v3, v1

    invoke-virtual {p0, v3, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    .line 243
    .local v3, "result":Ljava/lang/Object;
    sget-object v4, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v4, :cond_1

    .line 244
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 246
    :cond_1
    return-object v3

    .line 248
    .end local v1    # "index":J
    .end local v3    # "result":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 253
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 254
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 117
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionProperty(Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # I

    .line 303
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 304
    invoke-super {p0, p2, p0}, Lcom/trendmicro/hippo/xml/XMLObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 306
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 307
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v1, :cond_1

    .line 308
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLObject;

    invoke-virtual {v1, p1, p2}, Lcom/trendmicro/hippo/xml/XMLObject;->getFunctionProperty(Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 311
    .end local v0    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public getFunctionProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "name"    # Ljava/lang/String;

    .line 316
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 317
    invoke-super {p0, p2, p0}, Lcom/trendmicro/hippo/xml/XMLObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 319
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 320
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v1, :cond_1

    .line 321
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLObject;

    invoke-virtual {v1, p1, p2}, Lcom/trendmicro/hippo/xml/XMLObject;->getFunctionProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 324
    .end local v0    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method getLib()Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    return-object v0
.end method

.method public final getParentScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 107
    invoke-super {p0}, Lcom/trendmicro/hippo/xml/XMLObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method final getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v0

    return-object v0
.end method

.method public final getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 97
    invoke-super {p0}, Lcom/trendmicro/hippo/xml/XMLObject;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method abstract getXML()Lcom/trendmicro/hippo/xmlimpl/XML;
.end method

.method abstract getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;
.end method

.method public final has(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 217
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object p1

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 219
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    if-nez v0, :cond_1

    .line 220
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v1

    .line 222
    .local v1, "index":J
    long-to-int v3, v1

    invoke-virtual {p0, v3, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v3

    return v3

    .line 224
    .end local v1    # "index":J
    :cond_1
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v1

    return v1
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 229
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 230
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v1

    return v1
.end method

.method abstract hasComplexContent()Z
.end method

.method public final hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "scriptable"    # Lcom/trendmicro/hippo/Scriptable;

    .line 122
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method abstract hasOwnProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
.end method

.method abstract hasSimpleContent()Z
.end method

.method abstract hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z
.end method

.method protected initPrototypeId(I)V
    .locals 4
    .param p1, "id"    # I

    .line 536
    packed-switch p1, :pswitch_data_0

    .line 592
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 590
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "valueOf"

    .local v1, "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 589
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toXMLString"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 588
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 587
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 586
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "text"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 585
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setNamespace"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 584
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setName"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 583
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setLocalName"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 582
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setChildren"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 581
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "replace"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 580
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "removeNamespace"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 579
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "propertyIsEnumerable"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 577
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "processingInstructions"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 575
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "prependChild"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 574
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "parent"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 573
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "normalize"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 572
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "nodeKind"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 571
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "namespaceDeclarations"

    .restart local v1    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 569
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "namespace"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 568
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "name"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 567
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "localName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 566
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "length"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 562
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "hasSimpleContent"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 560
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "hasComplexContent"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 561
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "hasOwnProperty"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 565
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "insertChildBefore"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 564
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "insertChildAfter"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 563
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "inScopeNamespaces"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 559
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "elements"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 558
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "descendants"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 557
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "copy"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 556
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "contains"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 555
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_20
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "comments"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 554
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_21
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "children"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 553
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "childIndex"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 552
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_23
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "child"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 551
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_24
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "attributes"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 550
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_25
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "attribute"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 549
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "appendChild"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 548
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_27
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "addNamespace"

    .line 594
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 595
    return-void

    .line 539
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_28
    instance-of v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 540
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;

    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    sget-object v3, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v0, v2, v3, p1, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;-><init>(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;II)V

    .local v0, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    goto :goto_1

    .line 542
    .end local v0    # "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v0, p0, v2, p1, v1}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;II)V

    .line 544
    .restart local v0    # "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    :goto_1
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->initPrototypeConstructor(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 545
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method final initialize(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V
    .locals 1
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "prototype"    # Lcom/trendmicro/hippo/xml/XMLObject;

    .line 40
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 41
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 42
    if-nez p3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 43
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    .line 44
    return-void
.end method

.method final isPrototype()Z
    .locals 1

    .line 47
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    return v0
.end method

.method protected abstract jsConstructor(Lcom/trendmicro/hippo/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract length()I
.end method

.method public memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "elem"    # Ljava/lang/Object;
    .param p3, "memberTypeFlags"    # I

    .line 330
    and-int/lit8 v0, p3, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 331
    .local v0, "attribute":Z
    :goto_0
    and-int/lit8 v3, p3, 0x4

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    .line 332
    .local v1, "descendants":Z
    :goto_1
    if-nez v0, :cond_3

    if-eqz v1, :cond_2

    goto :goto_2

    .line 336
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 338
    :cond_3
    :goto_2
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p1, p2, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    .line 339
    .local v2, "qname":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v3

    .line 340
    .local v3, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v3, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->initXMLObject(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;)V

    .line 341
    return-object v3
.end method

.method public memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "elem"    # Ljava/lang/Object;
    .param p4, "memberTypeFlags"    # I

    .line 351
    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 352
    .local v0, "attribute":Z
    :goto_0
    and-int/lit8 v3, p4, 0x4

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    .line 353
    .local v1, "descendants":Z
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v2

    .line 355
    .local v2, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v2, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->initXMLObject(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;)V

    .line 356
    return-object v2
.end method

.method final newQName(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newQName(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "reference"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .param p2, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .line 821
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLFromJs(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "inputObject"    # Ljava/lang/Object;

    .line 826
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLFromJs(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method final newXMLListFrom(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 70
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLListFrom(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method abstract normalize()V
.end method

.method abstract parent()Ljava/lang/Object;
.end method

.method abstract processingInstructions(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract propertyIsEnumerable(Ljava/lang/Object;)Z
.end method

.method public final put(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;

    .line 261
    if-nez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object p1

    .line 262
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 263
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    if-nez v0, :cond_1

    .line 264
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastUint32Result(Lcom/trendmicro/hippo/Context;)J

    move-result-wide v1

    .line 266
    .local v1, "index":J
    long-to-int v3, v1

    invoke-virtual {p0, v3, p0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 267
    return-void

    .line 269
    .end local v1    # "index":J
    :cond_1
    invoke-virtual {p0, v0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 270
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 274
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 275
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 276
    return-void
.end method

.method abstract putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V
.end method

.method public final setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "parent"    # Lcom/trendmicro/hippo/Scriptable;

    .line 112
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 113
    return-void
.end method

.method public final setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 102
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 103
    return-void
.end method

.method abstract text()Lcom/trendmicro/hippo/xmlimpl/XMLList;
.end method

.method abstract toSource(I)Ljava/lang/String;
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method abstract toXMLString()Ljava/lang/String;
.end method

.method abstract valueOf()Ljava/lang/Object;
.end method

.method xmlFromNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 59
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    if-nez v0, :cond_0

    .line 60
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setXml(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 62
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getXml()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method
