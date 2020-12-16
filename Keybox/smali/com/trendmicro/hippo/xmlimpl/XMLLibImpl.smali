.class public final Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
.super Lcom/trendmicro/hippo/xml/XMLLib;
.source "XMLLibImpl.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private globalScope:Lcom/trendmicro/hippo/Scriptable;

.field private namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

.field private options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

.field private qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

.field private xmlListPrototype:Lcom/trendmicro/hippo/xmlimpl/XMLList;

.field private xmlPrototype:Lcom/trendmicro/hippo/xmlimpl/XML;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "globalScope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 113
    invoke-direct {p0}, Lcom/trendmicro/hippo/xml/XMLLib;-><init>()V

    .line 111
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 114
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    .line 115
    return-void
.end method

.method private static badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .line 177
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 178
    const-string v0, "Can not construct XML name from number: "

    .local v0, "msg":Ljava/lang/String;
    goto :goto_1

    .line 179
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 180
    const-string v0, "Can not construct XML name from boolean: "

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_1

    .line 181
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v0, :cond_3

    if-nez p0, :cond_2

    goto :goto_0

    .line 184
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_3
    :goto_0
    const-string v0, "Can not construct XML name from "

    .line 186
    .restart local v0    # "msg":Ljava/lang/String;
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method private exportToScope(Z)V
    .locals 4
    .param p1, "sealed"    # Z

    .line 134
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlPrototype:Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 135
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlListPrototype:Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 136
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->GLOBAL:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->create(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/Namespace;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 138
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    .line 139
    invoke-static {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    .line 138
    invoke-static {p0, v0, v3, v1}, Lcom/trendmicro/hippo/xmlimpl/QName;->create(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/QName;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 141
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlPrototype:Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->exportAsJSClass(Z)V

    .line 142
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlListPrototype:Lcom/trendmicro/hippo/xmlimpl/XMLList;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->exportAsJSClass(Z)V

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->exportAsJSClass(Z)V

    .line 144
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->exportAsJSClass(Z)V

    .line 145
    return-void
.end method

.method private getDefaultNamespaceURI(Lcom/trendmicro/hippo/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 346
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 46
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;-><init>(Lcom/trendmicro/hippo/Scriptable;)V

    .line 47
    .local v0, "lib":Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->bindToScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v1

    .line 48
    .local v1, "bound":Lcom/trendmicro/hippo/xml/XMLLib;
    if-ne v1, v0, :cond_0

    .line 49
    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->exportToScope(Z)V

    .line 51
    :cond_0
    return-void
.end method

.method private parse(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "frag"    # Ljava/lang/String;

    .line 438
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 439
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespaceURI(Lcom/trendmicro/hippo/Context;)Ljava/lang/String;

    move-result-object v1

    .line 438
    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createElement(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 440
    :catch_0
    move-exception v0

    .line 441
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot parse XML: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static toDomNode(Ljava/lang/Object;)Lorg/w3c/dom/Node;
    .locals 2
    .param p0, "xmlObject"    # Ljava/lang/Object;

    .line 37
    instance-of v0, p0, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v0, :cond_0

    .line 38
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->toDomNode()Lorg/w3c/dom/Node;

    move-result-object v0

    return-object v0

    .line 40
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "xmlObject is not an XML object in JavaScript."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private xmlPrimaryReference(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/xmlimpl/XMLName;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "xmlName"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 313
    const/4 v0, 0x0

    .line 317
    .local v0, "firstXml":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    :goto_0
    instance-of v1, p3, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;

    if-eqz v1, :cond_1

    .line 318
    invoke-interface {p3}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 319
    .local v1, "xmlObj":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 320
    goto :goto_1

    .line 322
    :cond_0
    if-nez v0, :cond_1

    .line 323
    move-object v0, v1

    .line 326
    .end local v1    # "xmlObj":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    :cond_1
    invoke-interface {p3}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p3

    .line 327
    if-nez p3, :cond_3

    .line 328
    move-object v1, v0

    .line 329
    .restart local v1    # "xmlObj":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    nop

    .line 335
    :goto_1
    if-eqz v1, :cond_2

    .line 336
    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->initXMLObject(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;)V

    .line 338
    :cond_2
    return-object p2

    .line 327
    .end local v1    # "xmlObj":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    :cond_3
    goto :goto_0
.end method


# virtual methods
.method addXMLObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/xml/XMLObject;Lcom/trendmicro/hippo/xml/XMLObject;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "obj1"    # Lcom/trendmicro/hippo/xml/XMLObject;
    .param p3, "obj2"    # Lcom/trendmicro/hippo/xml/XMLObject;

    .line 283
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 285
    .local v0, "listToAdd":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    instance-of v1, p2, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_1

    .line 286
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 287
    .local v1, "list1":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 288
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto :goto_0

    .line 293
    :cond_0
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLListFrom(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 295
    .end local v1    # "list1":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :goto_0
    goto :goto_1

    .line 296
    :cond_1
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 299
    :goto_1
    instance-of v1, p3, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_3

    .line 300
    move-object v1, p3

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 301
    .local v1, "list2":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 302
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 301
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v1    # "list2":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v2    # "i":I
    :cond_2
    goto :goto_3

    .line 304
    :cond_3
    instance-of v1, p3, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v1, :cond_4

    .line 305
    invoke-virtual {v0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto :goto_4

    .line 304
    :cond_4
    :goto_3
    nop

    .line 308
    :goto_4
    return-object v0
.end method

.method castToNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "namespaceObj"    # Ljava/lang/Object;

    .line 342
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->castToNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method castToQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "qnameValue"    # Ljava/lang/Object;

    .line 400
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/QName;->castToQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;

    .line 396
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/Object;

    .line 387
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/QName;->constructQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method createNamespaces([Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 5
    .param p1, "declarations"    # [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 377
    array-length v0, p1

    new-array v0, v0, [Lcom/trendmicro/hippo/xmlimpl/Namespace;

    .line 378
    .local v0, "rv":[Lcom/trendmicro/hippo/xmlimpl/Namespace;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 379
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    aget-object v3, p1, v1

    .line 380
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v3

    aget-object v4, p1, v1

    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    .line 379
    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v2

    aput-object v2, v0, v1

    .line 378
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 382
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method final ecmaToXml(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "object"    # Ljava/lang/Object;

    .line 447
    if-eqz p1, :cond_6

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p1, v0, :cond_6

    .line 450
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XML;

    return-object v0

    .line 451
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v0, :cond_2

    .line 452
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 453
    .local v0, "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 454
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getXML()Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 456
    :cond_1
    const-string v1, "Cannot convert list of >1 element to XML"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 463
    .end local v0    # "list":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_2
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_3

    .line 464
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 466
    :cond_3
    instance-of v0, p1, Lorg/w3c/dom/Node;

    if-eqz v0, :cond_4

    .line 467
    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/Node;

    .line 468
    .local v0, "node":Lorg/w3c/dom/Node;
    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createElementFromNode(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 471
    .end local v0    # "node":Lorg/w3c/dom/Node;
    :cond_4
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 473
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x3c

    if-ne v1, v2, :cond_5

    .line 474
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->parse(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 476
    :cond_5
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 448
    .end local v0    # "s":Ljava/lang/String;
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cannot convert "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " to XML"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 622
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 617
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getDefaultNamespace(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 354
    if-nez p1, :cond_0

    .line 355
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object p1

    .line 356
    if-nez p1, :cond_0

    .line 357
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v0

    .line 361
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->searchDefaultNamespace(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 362
    .local v0, "ns":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 363
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v1

    .line 365
    :cond_1
    instance-of v1, v0, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v1, :cond_2

    .line 366
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v1

    .line 371
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    return-object v1
.end method

.method public getPrettyIndent()I
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->getPrettyIndent()I

    move-result v0

    return v0
.end method

.method getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    return-object v0
.end method

.method globalScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 126
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public isIgnoreComments()Z
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreComments()Z

    move-result v0

    return v0
.end method

.method public isIgnoreProcessingInstructions()Z
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreProcessingInstructions()Z

    move-result v0

    return v0
.end method

.method public isIgnoreWhitespace()Z
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreWhitespace()Z

    move-result v0

    return v0
.end method

.method public isPrettyPrinting()Z
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v0

    return v0
.end method

.method public isXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "_cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nameObj"    # Ljava/lang/Object;

    .line 607
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->accept(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "name"    # Ljava/lang/Object;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "memberTypeFlags"    # I

    .line 627
    and-int/lit8 v0, p4, 0x2

    if-eqz v0, :cond_0

    .line 631
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toAttributeName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 632
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-direct {p0, p1, v0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlPrimaryReference(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/xmlimpl/XMLName;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    return-object v1

    .line 629
    .end local v0    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/Object;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "memberTypeFlags"    # I

    .line 637
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 640
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_0

    .line 641
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v1

    if-nez v1, :cond_0

    .line 642
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->setAttributeName()V

    .line 646
    :cond_0
    invoke-direct {p0, p1, v0, p4}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlPrimaryReference(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/xmlimpl/XMLName;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    return-object v1
.end method

.method newNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .line 350
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method newQName(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 2
    .param p1, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 404
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-static {p0, v0, v1, p1}, Lcom/trendmicro/hippo/xmlimpl/QName;->create(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xmlimpl/QName;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;

    .line 391
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/QName;->newQName(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newTextElementXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1
    .param p1, "reference"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .param p2, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .line 481
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->newElementWithText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 408
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XML;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlPrototype:Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/trendmicro/hippo/xmlimpl/XML;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    return-object v0
.end method

.method final newXMLFromJs(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 3
    .param p1, "inputObject"    # Ljava/lang/Object;

    .line 416
    if-eqz p1, :cond_2

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 418
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_1

    .line 420
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v0

    .local v0, "frag":Ljava/lang/String;
    goto :goto_1

    .line 422
    .end local v0    # "frag":Ljava/lang/String;
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "frag":Ljava/lang/String;
    goto :goto_1

    .line 417
    .end local v0    # "frag":Ljava/lang/String;
    :cond_2
    :goto_0
    const-string v0, ""

    .line 425
    .restart local v0    # "frag":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "<>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 429
    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_3

    .line 431
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXML(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 433
    :cond_3
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->parse(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    return-object v1

    .line 426
    :cond_4
    const-string v1, "Invalid use of XML object anonymous tags <></>."

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 3

    .line 485
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->globalScope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->xmlListPrototype:Lcom/trendmicro/hippo/xmlimpl/XMLList;

    invoke-direct {v0, p0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V

    return-object v0
.end method

.method final newXMLListFrom(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 7
    .param p1, "inputObject"    # Ljava/lang/Object;

    .line 489
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 491
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    if-eqz p1, :cond_6

    instance-of v1, p1, Lcom/trendmicro/hippo/Undefined;

    if-eqz v1, :cond_0

    goto/16 :goto_1

    .line 493
    :cond_0
    instance-of v1, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v1, :cond_1

    .line 494
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 495
    .local v1, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 496
    return-object v0

    .line 497
    .end local v1    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_1
    instance-of v1, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v1, :cond_2

    .line 498
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 499
    .local v1, "xmll":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    move-result-object v2

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;)V

    .line 500
    return-object v0

    .line 502
    .end local v1    # "xmll":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_2
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 504
    .local v1, "frag":Ljava/lang/String;
    const-string v2, "<>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "</>"

    if-nez v3, :cond_3

    .line 505
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 508
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<fragment>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 509
    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 513
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x3

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</fragment>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 515
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLFromJs(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    .line 518
    .local v2, "orgXML":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->children()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v3

    .line 520
    .local v3, "children":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    move-result-object v5

    invoke-virtual {v5}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->length()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 522
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->getNodeList()Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    move-result-object v5

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v6

    invoke-virtual {v6}, Lcom/trendmicro/hippo/xmlimpl/XML;->copy()Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->add(Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 520
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 524
    .end local v4    # "i":I
    :cond_4
    return-object v0

    .line 510
    .end local v2    # "orgXML":Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v3    # "children":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_5
    const-string v2, "XML with anonymous tag missing end anonymous tag"

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 492
    .end local v1    # "frag":Ljava/lang/String;
    :cond_6
    :goto_1
    return-object v0
.end method

.method qnamePrototype()Lcom/trendmicro/hippo/xmlimpl/QName;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->qnamePrototype:Lcom/trendmicro/hippo/xmlimpl/QName;

    return-object v0
.end method

.method public setIgnoreComments(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 56
    return-void
.end method

.method public setIgnoreProcessingInstructions(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 66
    return-void
.end method

.method public setIgnoreWhitespace(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 61
    return-void
.end method

.method public setPrettyIndent(I)V
    .locals 1
    .param p1, "i"    # I

    .line 75
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyIndent(I)V

    .line 76
    return-void
.end method

.method public setPrettyPrinting(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 70
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 71
    return-void
.end method

.method toAttributeName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 150
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    if-eqz v0, :cond_0

    .line 152
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    return-object v0

    .line 153
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/QName;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 154
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    invoke-static {v0, v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    return-object v0

    .line 155
    :cond_1
    instance-of v0, p2, Ljava/lang/Boolean;

    if-nez v0, :cond_4

    instance-of v0, p2, Ljava/lang/Number;

    if-nez v0, :cond_4

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v0, :cond_4

    if-eqz p2, :cond_4

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "localName":Ljava/lang/String;
    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 164
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 166
    :cond_2
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 168
    :goto_0
    if-eqz v0, :cond_3

    const-string v3, "*"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v0, 0x0

    .line 169
    :cond_3
    nop

    .line 170
    const-string v3, ""

    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v3

    .line 169
    invoke-static {v3, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-static {v3, v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    return-object v1

    .line 159
    .end local v0    # "localName":Ljava/lang/String;
    :cond_4
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public toDefaultXmlNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "uriValue"    # Ljava/lang/Object;

    .line 612
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "namespaceValue"    # Ljava/lang/Object;
    .param p3, "nameValue"    # Ljava/lang/Object;

    .line 534
    instance-of v0, p3, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_0

    .line 535
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 536
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    .line 537
    .local v0, "localName":Ljava/lang/String;
    goto :goto_0

    .line 538
    .end local v0    # "localName":Ljava/lang/String;
    :cond_0
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 542
    .restart local v0    # "localName":Ljava/lang/String;
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const-string v2, "*"

    if-ne p2, v1, :cond_2

    .line 543
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 544
    const/4 v1, 0x0

    .local v1, "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    goto :goto_1

    .line 546
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .restart local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    goto :goto_1

    .line 548
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_2
    if-nez p2, :cond_3

    .line 549
    const/4 v1, 0x0

    .restart local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    goto :goto_1

    .line 550
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_3
    instance-of v1, p2, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    if-eqz v1, :cond_4

    .line 551
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .restart local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    goto :goto_1

    .line 553
    .end local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_4
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->namespacePrototype:Lcom/trendmicro/hippo/xmlimpl/Namespace;

    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .line 556
    .restart local v1    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :goto_1
    if-eqz v0, :cond_5

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v0, 0x0

    .line 557
    :cond_5
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    return-object v2
.end method

.method toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;
    .param p3, "attribute"    # Z

    .line 578
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    if-eqz v0, :cond_0

    .line 579
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    return-object v0

    .line 580
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_1

    .line 581
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 582
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    return-object v1

    .line 583
    .end local v0    # "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    :cond_1
    instance-of v0, p2, Ljava/lang/Boolean;

    if-nez v0, :cond_3

    instance-of v0, p2, Ljava/lang/Number;

    if-nez v0, :cond_3

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v0, :cond_3

    if-eqz p2, :cond_3

    .line 591
    const/4 v0, 0x0

    .line 592
    .local v0, "local":Ljava/lang/String;
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 593
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 595
    :cond_2
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 597
    :goto_0
    invoke-virtual {p0, p1, v0, p3}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    return-object v1

    .line 589
    .end local v0    # "local":Ljava/lang/String;
    :cond_3
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method toNodeQName(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Z)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attribute"    # Z

    .line 561
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xmlimpl/Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/Namespace;->getDelegate()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 562
    .local v0, "defaultNamespace":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    if-eqz p2, :cond_0

    const-string v1, "*"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 563
    const/4 v1, 0x0

    invoke-static {v1, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    return-object v1

    .line 565
    :cond_0
    if-eqz p3, :cond_1

    .line 566
    sget-object v1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->GLOBAL:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    return-object v1

    .line 568
    :cond_1
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    return-object v1
.end method

.method toXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;

    .line 197
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    if-eqz v0, :cond_0

    .line 198
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_0

    .line 199
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_1

    .line 200
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 201
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .line 202
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_0

    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_1
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 203
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    .restart local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_0

    .line 204
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_2
    instance-of v0, p2, Ljava/lang/Boolean;

    if-nez v0, :cond_3

    instance-of v0, p2, Ljava/lang/Number;

    if-nez v0, :cond_3

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v0, :cond_3

    if-eqz p2, :cond_3

    .line 210
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    move-object v0, v1

    .line 214
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :goto_0
    return-object v0

    .line 208
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_3
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "name"    # Ljava/lang/String;

    .line 190
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->getDefaultNamespaceURI(Lcom/trendmicro/hippo/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method toXMLNameOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 9
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "value"    # Ljava/lang/Object;

    .line 226
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    if-eqz v0, :cond_0

    .line 227
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto/16 :goto_2

    .line 228
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_0
    instance-of v0, p2, Ljava/lang/String;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_2

    .line 229
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    .line 230
    .local v0, "str":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v3

    .line 231
    .local v3, "test":J
    cmp-long v1, v3, v1

    if-ltz v1, :cond_1

    .line 232
    invoke-static {p1, v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->storeUint32Result(Lcom/trendmicro/hippo/Context;J)V

    .line 233
    const/4 v1, 0x0

    move-object v0, v1

    .local v1, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_0

    .line 235
    .end local v1    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    move-object v0, v1

    .line 237
    .end local v3    # "test":J
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :goto_0
    goto/16 :goto_2

    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_2
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_4

    .line 238
    move-object v0, p2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 239
    .local v3, "d":D
    double-to-long v5, v3

    .line 240
    .local v5, "l":J
    long-to-double v7, v5

    cmpl-double v0, v7, v3

    if-nez v0, :cond_3

    cmp-long v0, v1, v5

    if-gtz v0, :cond_3

    const-wide v0, 0xffffffffL

    cmp-long v0, v5, v0

    if-gtz v0, :cond_3

    .line 241
    invoke-static {p1, v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->storeUint32Result(Lcom/trendmicro/hippo/Context;J)V

    .line 242
    const/4 v0, 0x0

    .line 246
    .end local v3    # "d":D
    .end local v5    # "l":J
    .restart local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_2

    .line 244
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .restart local v3    # "d":D
    .restart local v5    # "l":J
    :cond_3
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 246
    .end local v3    # "d":D
    .end local v5    # "l":J
    :cond_4
    instance-of v0, p2, Lcom/trendmicro/hippo/xmlimpl/QName;

    if-eqz v0, :cond_7

    .line 247
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/QName;

    .line 248
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/QName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v3

    .line 249
    .local v3, "uri":Ljava/lang/String;
    const/4 v4, 0x0

    .line 250
    .local v4, "number":Z
    const/4 v5, 0x0

    .line 251
    .local v5, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_5

    .line 253
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v6

    .line 254
    .local v6, "test":J
    cmp-long v1, v6, v1

    if-ltz v1, :cond_5

    .line 255
    invoke-static {p1, v6, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->storeUint32Result(Lcom/trendmicro/hippo/Context;J)V

    .line 256
    const/4 v4, 0x1

    .line 259
    .end local v6    # "test":J
    :cond_5
    if-nez v4, :cond_6

    .line 260
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    move-object v0, v1

    .end local v5    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .restart local v1    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_1

    .line 259
    .end local v1    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .restart local v5    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_6
    move-object v0, v5

    .line 262
    .end local v3    # "uri":Ljava/lang/String;
    .end local v4    # "number":Z
    .end local v5    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :goto_1
    goto :goto_2

    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_7
    instance-of v0, p2, Ljava/lang/Boolean;

    if-nez v0, :cond_9

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v0, :cond_9

    if-eqz p2, :cond_9

    .line 268
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 269
    .local v0, "str":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v3

    .line 270
    .local v3, "test":J
    cmp-long v1, v3, v1

    if-ltz v1, :cond_8

    .line 271
    invoke-static {p1, v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->storeUint32Result(Lcom/trendmicro/hippo/Context;J)V

    .line 272
    const/4 v1, 0x0

    move-object v0, v1

    .restart local v1    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    goto :goto_2

    .line 274
    .end local v1    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_8
    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    move-object v0, v1

    .line 278
    .end local v3    # "test":J
    .local v0, "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :goto_2
    return-object v0

    .line 266
    .end local v0    # "result":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_9
    invoke-static {p2}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
