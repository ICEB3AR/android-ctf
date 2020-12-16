.class Lcom/trendmicro/hippo/xmlimpl/XmlNode;
.super Ljava/lang/Object;
.source "XmlNode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;,
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;,
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$XmlNodeUserDataHandler;,
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;,
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;,
        Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    }
.end annotation


# static fields
.field private static final DOM_LEVEL_3:Z = true

.field private static final USER_DATA_XMLNODE_KEY:Ljava/lang/String;

.field private static final XML_NAMESPACES_NAMESPACE_URI:Ljava/lang/String; = "http://www.w3.org/2000/xmlns/"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private dom:Lorg/w3c/dom/Node;

.field private events:Lorg/w3c/dom/UserDataHandler;

.field private xml:Lcom/trendmicro/hippo/xmlimpl/XML;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-class v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$XmlNodeUserDataHandler;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$XmlNodeUserDataHandler;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->events:Lorg/w3c/dom/UserDataHandler;

    .line 108
    return-void
.end method

.method private addNamespaces(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V
    .locals 7
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    .param p2, "element"    # Lorg/w3c/dom/Element;

    .line 243
    if-eqz p2, :cond_5

    .line 244
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lorg/w3c/dom/Element;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->toUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 245
    .local v1, "myDefaultNamespace":Ljava/lang/String;
    const-string v2, ""

    .line 246
    .local v2, "parentDefaultNamespace":Ljava/lang/String;
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 247
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->toUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 249
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-nez v0, :cond_2

    .line 250
    :cond_1
    const-string v0, ""

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->declare(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V

    .line 252
    :cond_2
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 253
    .local v0, "attributes":Lorg/w3c/dom/NamedNodeMap;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 254
    invoke-interface {v0, v3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Attr;

    .line 255
    .local v4, "attr":Lorg/w3c/dom/Attr;
    invoke-interface {v4}, Lorg/w3c/dom/Attr;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Lorg/w3c/dom/Attr;->getPrefix()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xmlns"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 256
    invoke-interface {v4}, Lorg/w3c/dom/Attr;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->declare(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V

    .line 253
    .end local v4    # "attr":Lorg/w3c/dom/Attr;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 259
    .end local v3    # "i":I
    :cond_4
    return-void

    .line 243
    .end local v0    # "attributes":Lorg/w3c/dom/NamedNodeMap;
    .end local v1    # "myDefaultNamespace":Ljava/lang/String;
    .end local v2    # "parentDefaultNamespace":Ljava/lang/String;
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "element must not be null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static copy(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 2
    .param p0, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 96
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createElement(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p0, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->toXml(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createElementFromNode(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .line 82
    instance-of v0, p0, Lorg/w3c/dom/Document;

    if-eqz v0, :cond_0

    .line 83
    move-object v0, p0

    check-cast v0, Lorg/w3c/dom/Document;

    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p0

    .line 84
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createEmpty(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p0, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 92
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method private static createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 2
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .line 45
    instance-of v0, p0, Lorg/w3c/dom/Document;

    if-nez v0, :cond_1

    .line 46
    const/4 v0, 0x0

    .line 47
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getUserData(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    if-nez v1, :cond_0

    .line 48
    new-instance v1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-direct {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;-><init>()V

    move-object v0, v1

    .line 49
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 50
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setUserData(Lorg/w3c/dom/Node;Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    goto :goto_0

    .line 52
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getUserData(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    .line 45
    .end local v0    # "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static createText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p0, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    .param p1, "value"    # Ljava/lang/String;

    .line 78
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method private declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "e"    # Lorg/w3c/dom/Element;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/lang/String;

    .line 404
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 405
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "xmlns:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http://www.w3.org/2000/xmlns/"

    invoke-interface {p1, v1, v0, p3}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 407
    :cond_0
    const-string v0, "xmlns"

    invoke-interface {p1, v0, p3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    :goto_0
    return-void
.end method

.method private getAllNamespaces()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    .locals 3

    .line 262
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;-><init>()V

    .line 264
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 265
    .local v1, "target":Lorg/w3c/dom/Node;
    instance-of v2, v1, Lorg/w3c/dom/Attr;

    if-eqz v2, :cond_0

    .line 266
    move-object v2, v1

    check-cast v2, Lorg/w3c/dom/Attr;

    invoke-interface {v2}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v1

    .line 268
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    .line 269
    instance-of v2, v1, Lorg/w3c/dom/Element;

    if-eqz v2, :cond_1

    .line 270
    move-object v2, v1

    check-cast v2, Lorg/w3c/dom/Element;

    invoke-direct {p0, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->addNamespaces(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V

    .line 272
    :cond_1
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_0

    .line 275
    :cond_2
    const-string v2, ""

    invoke-static {v2, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->declare(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V

    .line 276
    return-object v0
.end method

.method private getDefaultNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 3

    .line 422
    const-string v0, ""

    .line 423
    .local v0, "prefix":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, v2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 424
    .local v1, "uri":Ljava/lang/String;
    :goto_0
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    return-object v2
.end method

.method private getExistingPrefixFor(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .locals 2
    .param p1, "namespace"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 428
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getDefaultNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 429
    const-string v0, ""

    return-object v0

    .line 431
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->lookupPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNodeNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 3

    .line 435
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "uri":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v1

    .line 437
    .local v1, "prefix":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string v0, ""

    .line 438
    :cond_0
    if-nez v1, :cond_1

    const-string v1, ""

    .line 439
    :cond_1
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    return-object v2
.end method

.method private static getUserData(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .line 33
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->getUserData(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    return-object v0
.end method

.method static newElementWithText(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;Lcom/trendmicro/hippo/xmlimpl/XmlNode;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 5
    .param p0, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    .param p1, "reference"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .param p2, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .line 58
    instance-of v0, p1, Lorg/w3c/dom/Document;

    if-nez v0, :cond_5

    .line 59
    const/4 v0, 0x0

    .line 60
    .local v0, "document":Lorg/w3c/dom/Document;
    if-eqz p1, :cond_0

    .line 61
    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    goto :goto_0

    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 65
    :goto_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    iget-object v2, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    goto :goto_1

    :cond_1
    move-object v2, v1

    .line 66
    .local v2, "referenceDom":Lorg/w3c/dom/Node;
    :goto_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v3

    .line 67
    .local v3, "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_2

    .line 69
    :cond_2
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->qualify(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    .line 69
    invoke-interface {v0, v1, v4}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    goto :goto_3

    .line 68
    :cond_3
    :goto_2
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v1, v4}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 69
    :goto_3
    nop

    .line 71
    .local v1, "e":Lorg/w3c/dom/Element;
    if-eqz p3, :cond_4

    .line 72
    invoke-interface {v0, p3}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 74
    :cond_4
    invoke-static {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v4

    return-object v4

    .line 58
    .end local v0    # "document":Lorg/w3c/dom/Document;
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "referenceDom":Lorg/w3c/dom/Node;
    .end local v3    # "ns":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot use Document node as reference"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setProcessingInstructionName(Ljava/lang/String;)V
    .locals 4
    .param p1, "localName"    # Ljava/lang/String;

    .line 475
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    .line 477
    .local v0, "pi":Lorg/w3c/dom/ProcessingInstruction;
    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    .line 479
    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Lorg/w3c/dom/Document;->createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/ProcessingInstruction;

    move-result-object v2

    .line 477
    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Node;->replaceChild(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 481
    return-void
.end method

.method private static setUserData(Lorg/w3c/dom/Node;Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 2
    .param p0, "node"    # Lorg/w3c/dom/Node;
    .param p1, "wrap"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 40
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->events:Lorg/w3c/dom/UserDataHandler;

    invoke-interface {p0, v0, p1, v1}, Lorg/w3c/dom/Node;->setUserData(Ljava/lang/String;Ljava/lang/Object;Lorg/w3c/dom/UserDataHandler;)Ljava/lang/Object;

    .line 42
    return-void
.end method

.method private toUri(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "ns"    # Ljava/lang/String;

    .line 239
    if-nez p1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    return-object v0
.end method


# virtual methods
.method addMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)V
    .locals 6
    .param p1, "result"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "filter"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    .line 500
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 501
    .local v0, "node":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 502
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 503
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 504
    .local v3, "childnode":Lorg/w3c/dom/Node;
    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v4

    .line 505
    .local v4, "child":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-virtual {p2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->accept(Lorg/w3c/dom/Node;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 506
    invoke-virtual {p1, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 502
    .end local v3    # "childnode":Lorg/w3c/dom/Node;
    .end local v4    # "child":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 509
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method final copy()Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1

    .line 358
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->copy(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method debug()Ljava/lang/String;
    .locals 2

    .line 111
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;-><init>()V

    .line 112
    .local v0, "raw":Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 113
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 114
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 115
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 116
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method declareNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .line 412
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    .line 413
    invoke-interface {v0, p2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0, p2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Element;

    .line 417
    .local v0, "e":Lorg/w3c/dom/Element;
    invoke-direct {p0, v0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    .end local v0    # "e":Lorg/w3c/dom/Element;
    :goto_0
    return-void

    .line 412
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method deleteMe()V
    .locals 4

    .line 182
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v0, Lorg/w3c/dom/Attr;

    if-eqz v1, :cond_0

    .line 183
    check-cast v0, Lorg/w3c/dom/Attr;

    .line 184
    .local v0, "attr":Lorg/w3c/dom/Attr;
    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/NamedNodeMap;->removeNamedItemNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    .line 185
    .end local v0    # "attr":Lorg/w3c/dom/Attr;
    goto :goto_0

    .line 186
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 187
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 193
    :cond_1
    :goto_0
    return-void
.end method

.method ecmaToXMLString(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Ljava/lang/String;
    .locals 5
    .param p1, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 552
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 553
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 554
    .local v0, "copy":Lorg/w3c/dom/Element;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getInScopeNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .line 555
    .local v1, "inScope":[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 556
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v1, v2

    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v3, v4}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 558
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 560
    .end local v0    # "copy":Lorg/w3c/dom/Element;
    .end local v1    # "inScope":[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method ecmaValue()Ljava/lang/String;
    .locals 3

    .line 166
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Text;

    invoke-interface {v0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 168
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 170
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 172
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 173
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Comment;

    invoke-interface {v0}, Lorg/w3c/dom/Comment;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 174
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 175
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unimplemented ecmaValue() for elements."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unimplemented for node "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getAttributeValue()Ljava/lang/String;
    .locals 1

    .line 535
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getAttributes()[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 4

    .line 524
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 526
    .local v0, "attrs":Lorg/w3c/dom/NamedNodeMap;
    if-eqz v0, :cond_1

    .line 527
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 528
    .local v1, "rv":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 529
    invoke-interface {v0, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v3

    aput-object v3, v1, v2

    .line 528
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 531
    .end local v2    # "i":I
    :cond_0
    return-object v1

    .line 526
    .end local v1    # "rv":[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Must be element."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getChild(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 2
    .param p1, "index"    # I

    .line 220
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 221
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    return-object v1
.end method

.method getChildCount()I
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    return v0
.end method

.method getChildIndex()I
    .locals 4

    .line 144
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    return v1

    .line 145
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->parent()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 147
    .local v0, "siblings":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 148
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    if-ne v2, v3, :cond_2

    .line 149
    return v1

    .line 147
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    .end local v1    # "i":I
    :cond_3
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unreachable."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getInScopeNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2

    .line 280
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getAllNamespaces()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;

    move-result-object v0

    .line 281
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->getNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    return-object v1
.end method

.method getMatchingChildren(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;)[Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 5
    .param p1, "filter"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    .line 512
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 513
    .local v0, "rv":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/trendmicro/hippo/xmlimpl/XmlNode;>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 514
    .local v1, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 515
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 516
    .local v3, "node":Lorg/w3c/dom/Node;
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->accept(Lorg/w3c/dom/Node;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 517
    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 514
    .end local v3    # "node":Lorg/w3c/dom/Node;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 520
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    return-object v2
.end method

.method getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1

    .line 443
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNodeNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method getNamespaceDeclaration()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 1

    .line 305
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method getNamespaceDeclaration(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .line 296
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Attr;

    if-eqz v1, :cond_0

    .line 298
    invoke-static {v0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0

    .line 300
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getAllNamespaces()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;

    move-result-object v0

    .line 301
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->getNamespace(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    return-object v1
.end method

.method getNamespaceDeclarations()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_0

    .line 287
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;-><init>()V

    .line 288
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->addNamespaces(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V

    .line 289
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;->getNamespaces()[Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    return-object v1

    .line 291
    .end local v0    # "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespaces;
    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    return-object v0
.end method

.method final getQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 3

    .line 494
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 495
    .local v0, "uri":Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v1

    .line 496
    .local v1, "prefix":Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v2

    return-object v2
.end method

.method getXml()Lcom/trendmicro/hippo/xmlimpl/XML;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->xml:Lcom/trendmicro/hippo/xmlimpl/XML;

    return-object v0
.end method

.method hasChildElement()Z
    .locals 4

    .line 226
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 227
    .local v0, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 228
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    return v3

    .line 227
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 230
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method insertChildAt(ILcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 5
    .param p1, "index"    # I
    .param p2, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 200
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 201
    .local v0, "parent":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    iget-object v2, p2, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 202
    .local v1, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-lt v2, p1, :cond_1

    .line 206
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 207
    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_0

    .line 209
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/w3c/dom/Node;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 211
    :goto_0
    return-void

    .line 204
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "index="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " length="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method insertChildrenAt(I[Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "nodes"    # [Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 214
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 215
    add-int v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->insertChildAt(ILcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 214
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 217
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method invalidateNamespacePrefix()V
    .locals 8

    .line 391
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_2

    .line 392
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    .line 393
    .local v0, "prefix":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    .line 394
    .local v1, "after":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->renameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 395
    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    .line 396
    .local v2, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 397
    invoke-interface {v2, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 398
    invoke-interface {v2, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-static {v5}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v5

    invoke-interface {v2, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->renameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 396
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 401
    .end local v4    # "i":I
    :cond_1
    return-void

    .line 391
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v1    # "after":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .end local v2    # "attrs":Lorg/w3c/dom/NamedNodeMap;
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method final isAttributeType()Z
    .locals 2

    .line 371
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method final isCommentType()Z
    .locals 2

    .line 379
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method final isElementType()Z
    .locals 2

    .line 383
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method final isParentType()Z
    .locals 1

    .line 363
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    return v0
.end method

.method final isProcessingInstructionType()Z
    .locals 2

    .line 375
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isSameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)Z
    .locals 2
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 235
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method final isTextType()Z
    .locals 2

    .line 367
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method normalize()V
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->normalize()V

    .line 197
    return-void
.end method

.method parent()Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 3

    .line 137
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 138
    .local v0, "domParent":Lorg/w3c/dom/Node;
    instance-of v1, v0, Lorg/w3c/dom/Document;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return-object v2

    .line 139
    :cond_0
    if-nez v0, :cond_1

    return-object v2

    .line 140
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    return-object v1
.end method

.method removeChild(I)V
    .locals 2
    .param p1, "index"    # I

    .line 157
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 158
    return-void
.end method

.method removeNamespace(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)V
    .locals 5
    .param p1, "namespace"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 447
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNodeNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 450
    .local v0, "current":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->is(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 451
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 452
    .local v1, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 453
    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v3

    .line 454
    .local v3, "attr":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    invoke-direct {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getNodeNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->is(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-void

    .line 452
    .end local v3    # "attr":Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 458
    .end local v2    # "i":I
    :cond_2
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getExistingPrefixFor(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v2

    .line 459
    .local v2, "existingPrefix":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 460
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->isUnspecifiedPrefix()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 463
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getDefaultNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 465
    :cond_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 466
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->getDefaultNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    :cond_4
    :goto_1
    return-void
.end method

.method final renameNode(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V
    .locals 4
    .param p1, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 387
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->qualify(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lorg/w3c/dom/Document;->renameNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 388
    return-void
.end method

.method replaceWith(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 3
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 544
    iget-object v0, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 545
    .local v0, "replacement":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    if-eq v1, v2, :cond_0

    .line 546
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 548
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Node;->replaceChild(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 549
    return-void
.end method

.method setAttribute(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .param p2, "value"    # Ljava/lang/String;

    .line 539
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_0

    .line 540
    check-cast v0, Lorg/w3c/dom/Element;

    invoke-virtual {p1, v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->setAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 541
    return-void

    .line 539
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only set attribute on elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final setLocalName(Ljava/lang/String;)V
    .locals 5
    .param p1, "localName"    # Ljava/lang/String;

    .line 484
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v0, Lorg/w3c/dom/ProcessingInstruction;

    if-eqz v1, :cond_0

    .line 485
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->setProcessingInstructionName(Ljava/lang/String;)V

    goto :goto_0

    .line 487
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_1

    const-string v0, ""

    .line 489
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->qualify(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2, v3, v4}, Lorg/w3c/dom/Document;->renameNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 491
    .end local v0    # "prefix":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method setXml(Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 0
    .param p1, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 129
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->xml:Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 130
    return-void
.end method

.method toDomNode()Lorg/w3c/dom/Node;
    .locals 1

    .line 882
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XmlNode: type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " dom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXmlString(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;)Ljava/lang/String;
    .locals 1
    .param p1, "processor"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 161
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
