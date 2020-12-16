.class Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
.super Ljava/lang/Object;
.source "XmlProcessor.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5fce35ccf4f46c09L


# instance fields
.field private transient documentBuilderPool:Ljava/util/concurrent/LinkedBlockingDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingDeque<",
            "Ljavax/xml/parsers/DocumentBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private transient dom:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private errorHandler:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;

.field private ignoreComments:Z

.field private ignoreProcessingInstructions:Z

.field private ignoreWhitespace:Z

.field private prettyIndent:I

.field private prettyPrint:Z

.field private transient xform:Ljavax/xml/transform/TransformerFactory;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;-><init>(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$1;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->errorHandler:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;

    .line 80
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setDefault()V

    .line 81
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->dom:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 82
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->dom:Ljavax/xml/parsers/DocumentBuilderFactory;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 84
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->xform:Ljavax/xml/transform/TransformerFactory;

    .line 85
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    .line 86
    .local v0, "poolSize":I
    new-instance v1, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v1, v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->documentBuilderPool:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 87
    return-void
.end method

.method private addCommentsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V
    .locals 2
    .param p2, "node"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Lorg/w3c/dom/Node;",
            ")V"
        }
    .end annotation

    .line 192
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    instance-of v0, p2, Lorg/w3c/dom/Comment;

    if-eqz v0, :cond_0

    .line 193
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 196
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 197
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addProcessingInstructionsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 196
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 200
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private addProcessingInstructionsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V
    .locals 2
    .param p2, "node"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Lorg/w3c/dom/Node;",
            ")V"
        }
    .end annotation

    .line 181
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    instance-of v0, p2, Lorg/w3c/dom/ProcessingInstruction;

    if-eqz v0, :cond_0

    .line 182
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    :cond_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 185
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 186
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addProcessingInstructionsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private addTextNodesToRemoveAndTrim(Ljava/util/List;Lorg/w3c/dom/Node;)V
    .locals 3
    .param p2, "node"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Node;",
            ">;",
            "Lorg/w3c/dom/Node;",
            ")V"
        }
    .end annotation

    .line 203
    .local p1, "toRemove":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    instance-of v0, p2, Lorg/w3c/dom/Text;

    if-eqz v0, :cond_2

    .line 204
    move-object v0, p2

    check-cast v0, Lorg/w3c/dom/Text;

    .line 205
    .local v0, "text":Lorg/w3c/dom/Text;
    const/4 v1, 0x0

    .line 206
    .local v1, "BUG_369394_IS_VALID":Z
    if-nez v1, :cond_0

    .line 207
    invoke-interface {v0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/w3c/dom/Text;->setData(Ljava/lang/String;)V

    goto :goto_0

    .line 209
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 210
    const-string v2, ""

    invoke-interface {v0, v2}, Lorg/w3c/dom/Text;->setData(Ljava/lang/String;)V

    .line 213
    :cond_1
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 214
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .end local v0    # "text":Lorg/w3c/dom/Text;
    .end local v1    # "BUG_369394_IS_VALID":Z
    :cond_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 218
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 219
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addTextNodesToRemoveAndTrim(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 222
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private beautifyElement(Lorg/w3c/dom/Element;I)V
    .locals 10
    .param p1, "e"    # Lorg/w3c/dom/Element;
    .param p2, "indent"    # I

    .line 397
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    .local v0, "s":Ljava/lang/StringBuilder;
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 399
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x20

    if-ge v1, p2, :cond_0

    .line 400
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 399
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, "afterContent":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget v4, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyIndent:I

    if-ge v3, v4, :cond_1

    .line 404
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 403
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 406
    .end local v3    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 410
    .local v2, "beforeContent":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 411
    .local v3, "toIndent":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/w3c/dom/Node;>;"
    const/4 v4, 0x0

    .line 412
    .local v4, "indentChildren":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 413
    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    const/4 v4, 0x1

    .line 414
    :cond_2
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    instance-of v6, v6, Lorg/w3c/dom/Text;

    if-eqz v6, :cond_3

    .line 415
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 417
    :cond_3
    const/4 v4, 0x1

    .line 418
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 421
    .end local v5    # "i":I
    :cond_4
    if-eqz v4, :cond_5

    .line 422
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_5

    .line 423
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v6

    invoke-interface {v6, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v6

    .line 424
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Node;

    .line 423
    invoke-interface {p1, v6, v7}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 422
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 427
    .end local v5    # "i":I
    :cond_5
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 428
    .local v5, "nodes":Lorg/w3c/dom/NodeList;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 429
    .local v6, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/w3c/dom/Element;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_5
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v7, v8, :cond_7

    .line 430
    invoke-interface {v5, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    instance-of v8, v8, Lorg/w3c/dom/Element;

    if-eqz v8, :cond_6

    .line 431
    invoke-interface {v5, v7}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Element;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 429
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 434
    .end local v7    # "i":I
    :cond_7
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/Element;

    .line 435
    .local v8, "elem":Lorg/w3c/dom/Element;
    iget v9, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyIndent:I

    add-int/2addr v9, p2

    invoke-direct {p0, v8, v9}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->beautifyElement(Lorg/w3c/dom/Element;I)V

    .line 436
    .end local v8    # "elem":Lorg/w3c/dom/Element;
    goto :goto_6

    .line 437
    :cond_8
    if-eqz v4, :cond_9

    .line 438
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v7

    invoke-interface {v7, v1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v7

    invoke-interface {p1, v7}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 440
    :cond_9
    return-void
.end method

.method private elementToXmlString(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 2
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .line 355
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 356
    .local v0, "copy":Lorg/w3c/dom/Element;
    iget-boolean v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyPrint:Z

    if-eqz v1, :cond_0

    .line 357
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->beautifyElement(Lorg/w3c/dom/Element;I)V

    .line 359
    :cond_0
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private escapeElementValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 350
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDocumentBuilderFromPool()Ljavax/xml/parsers/DocumentBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->documentBuilderPool:Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/parsers/DocumentBuilder;

    .line 162
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    if-nez v0, :cond_0

    .line 163
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->getDomFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 165
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->errorHandler:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 166
    return-object v0
.end method

.method private getDomFactory()Ljavax/xml/parsers/DocumentBuilderFactory;
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->dom:Ljavax/xml/parsers/DocumentBuilderFactory;

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 48
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 49
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->dom:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 50
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->dom:Ljavax/xml/parsers/DocumentBuilderFactory;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 52
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->xform:Ljavax/xml/transform/TransformerFactory;

    .line 53
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    .line 54
    .local v0, "poolSize":I
    new-instance v1, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v1, v0}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->documentBuilderPool:Ljava/util/concurrent/LinkedBlockingDeque;

    .line 55
    return-void
.end method

.method private returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V
    .locals 1
    .param p1, "db"    # Ljavax/xml/parsers/DocumentBuilder;

    .line 173
    :try_start_0
    invoke-virtual {p1}, Ljavax/xml/parsers/DocumentBuilder;->reset()V

    .line 174
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->documentBuilderPool:Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingDeque;->offerFirst(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    goto :goto_0

    .line 175
    :catch_0
    move-exception v0

    .line 178
    :goto_0
    return-void
.end method

.method private toString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 6
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 296
    new-instance v0, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 297
    .local v0, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 298
    .local v1, "writer":Ljava/io/StringWriter;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, v1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 300
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    :try_start_0
    iget-object v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->xform:Ljavax/xml/transform/TransformerFactory;

    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v3

    .line 301
    .local v3, "transformer":Ljavax/xml/transform/Transformer;
    const-string v4, "omit-xml-declaration"

    const-string v5, "yes"

    invoke-virtual {v3, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    const-string v4, "indent"

    const-string v5, "no"

    invoke-virtual {v3, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    const-string v4, "method"

    const-string v5, "xml"

    invoke-virtual {v3, v4, v5}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    invoke-virtual {v3, v0, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_0
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    .end local v3    # "transformer":Ljavax/xml/transform/Transformer;
    nop

    .line 312
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->toXmlNewlines(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 308
    :catch_0
    move-exception v3

    .line 310
    .local v3, "ex":Ljavax/xml/transform/TransformerException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 305
    .end local v3    # "ex":Ljavax/xml/transform/TransformerException;
    :catch_1
    move-exception v3

    .line 307
    .local v3, "ex":Ljavax/xml/transform/TransformerConfigurationException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private toXmlNewlines(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "rv"    # Ljava/lang/String;

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .local v0, "nl":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 140
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1

    .line 141
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    goto :goto_1

    .line 145
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 148
    :cond_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 151
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method final ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 365
    .local v0, "s":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 366
    .local v1, "indentLevel":I
    iget-boolean v2, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyPrint:Z

    if-eqz v2, :cond_0

    .line 367
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 368
    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 367
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 371
    .end local v2    # "i":I
    :cond_0
    instance-of v2, p1, Lorg/w3c/dom/Text;

    if-eqz v2, :cond_2

    .line 372
    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/Text;

    invoke-interface {v2}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v2

    .line 374
    .local v2, "data":Ljava/lang/String;
    iget-boolean v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyPrint:Z

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    move-object v3, v2

    .line 375
    .local v3, "v":Ljava/lang/String;
    :goto_1
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->escapeElementValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 378
    .end local v2    # "data":Ljava/lang/String;
    .end local v3    # "v":Ljava/lang/String;
    :cond_2
    instance-of v2, p1, Lorg/w3c/dom/Attr;

    if-eqz v2, :cond_3

    .line 379
    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/Attr;

    invoke-interface {v2}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 380
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 383
    .end local v2    # "value":Ljava/lang/String;
    :cond_3
    instance-of v2, p1, Lorg/w3c/dom/Comment;

    if-eqz v2, :cond_4

    .line 384
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<!--"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, p1

    check-cast v3, Lorg/w3c/dom/Comment;

    invoke-interface {v3}, Lorg/w3c/dom/Comment;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "-->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 387
    :cond_4
    instance-of v2, p1, Lorg/w3c/dom/ProcessingInstruction;

    if-eqz v2, :cond_5

    .line 388
    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/ProcessingInstruction;

    .line 389
    .local v2, "pi":Lorg/w3c/dom/ProcessingInstruction;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "<?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "?>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 392
    .end local v2    # "pi":Lorg/w3c/dom/ProcessingInstruction;
    :cond_5
    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/Element;

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->elementToXmlString(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p1, "value"    # Ljava/lang/Object;

    .line 316
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ""

    return-object v1

    .line 320
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 321
    .local v1, "dom":Lorg/w3c/dom/Document;
    const-string v2, "a"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 322
    .local v2, "e":Lorg/w3c/dom/Element;
    const-string v3, "b"

    invoke-interface {v2, v3, v0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 324
    .local v3, "elementText":Ljava/lang/String;
    const/16 v4, 0x22

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 325
    .local v5, "begin":I
    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 326
    .local v4, "end":I
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {v3, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p1, "value"    # Ljava/lang/Object;

    .line 330
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_0

    .line 331
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 334
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    .line 338
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 339
    .local v1, "dom":Lorg/w3c/dom/Document;
    const-string v2, "a"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 340
    .local v2, "e":Lorg/w3c/dom/Element;
    invoke-interface {v2, v0}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 341
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 343
    .local v3, "elementText":Ljava/lang/String;
    const/16 v4, 0x3e

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    .line 344
    .local v4, "begin":I
    const/16 v5, 0x3c

    invoke-virtual {v3, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 345
    .local v5, "end":I
    if-ge v4, v5, :cond_2

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    :cond_2
    const-string v6, ""

    :goto_0
    return-object v6
.end method

.method final getPrettyIndent()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyIndent:I

    return v0
.end method

.method final isIgnoreComments()Z
    .locals 1

    .line 118
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreComments:Z

    return v0
.end method

.method final isIgnoreProcessingInstructions()Z
    .locals 1

    .line 122
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreProcessingInstructions:Z

    return v0
.end method

.method final isIgnoreWhitespace()Z
    .locals 1

    .line 126
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreWhitespace:Z

    return v0
.end method

.method final isPrettyPrinting()Z
    .locals 1

    .line 130
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyPrint:Z

    return v0
.end method

.method newDocument()Lorg/w3c/dom/Document;
    .locals 3

    .line 280
    const/4 v0, 0x0

    .line 283
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    :try_start_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->getDocumentBuilderFromPool()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    move-object v0, v1

    .line 284
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    if-eqz v0, :cond_0

    .line 290
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V

    .line 284
    :cond_0
    return-object v1

    .line 289
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 285
    :catch_0
    move-exception v1

    .line 287
    .local v1, "ex":Ljavax/xml/parsers/ParserConfigurationException;
    :try_start_1
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    .end local v1    # "ex":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    :goto_0
    if-eqz v0, :cond_1

    .line 290
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V

    .line 291
    :cond_1
    throw v1
.end method

.method final setDefault()V
    .locals 1

    .line 90
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 91
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 92
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 93
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 94
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyIndent(I)V

    .line 95
    return-void
.end method

.method final setIgnoreComments(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 98
    iput-boolean p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreComments:Z

    .line 99
    return-void
.end method

.method final setIgnoreProcessingInstructions(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 106
    iput-boolean p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreProcessingInstructions:Z

    .line 107
    return-void
.end method

.method final setIgnoreWhitespace(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 102
    iput-boolean p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreWhitespace:Z

    .line 103
    return-void
.end method

.method final setPrettyIndent(I)V
    .locals 0
    .param p1, "i"    # I

    .line 114
    iput p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyIndent:I

    .line 115
    return-void
.end method

.method final setPrettyPrinting(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 110
    iput-boolean p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->prettyPrint:Z

    .line 111
    return-void
.end method

.method final toXml(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;
    .locals 7
    .param p1, "defaultNamespaceUri"    # Ljava/lang/String;
    .param p2, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 226
    const/4 v0, 0x0

    .line 228
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<parent xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</parent>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 230
    .local v1, "syntheticXml":Ljava/lang/String;
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->getDocumentBuilderFromPool()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2

    move-object v0, v2

    .line 231
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 232
    .local v2, "document":Lorg/w3c/dom/Document;
    iget-boolean v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreProcessingInstructions:Z

    if-eqz v3, :cond_0

    .line 233
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addProcessingInstructionsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 235
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 236
    .local v5, "node":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 237
    nop

    .end local v5    # "node":Lorg/w3c/dom/Node;
    goto :goto_0

    .line 239
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_0
    iget-boolean v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreComments:Z

    if-eqz v3, :cond_1

    .line 240
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 241
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addCommentsTo(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 242
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 243
    .restart local v5    # "node":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 244
    nop

    .end local v5    # "node":Lorg/w3c/dom/Node;
    goto :goto_1

    .line 246
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_1
    iget-boolean v3, p0, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->ignoreWhitespace:Z

    if-eqz v3, :cond_2

    .line 252
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->addTextNodesToRemoveAndTrim(Ljava/util/List;Lorg/w3c/dom/Node;)V

    .line 254
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Node;

    .line 255
    .restart local v5    # "node":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 256
    nop

    .end local v5    # "node":Lorg/w3c/dom/Node;
    goto :goto_2

    .line 258
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    :cond_2
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 259
    .local v3, "rv":Lorg/w3c/dom/NodeList;
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    const/4 v5, 0x1

    if-gt v4, v5, :cond_6

    .line 261
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-nez v4, :cond_4

    .line 262
    const-string v4, ""

    invoke-interface {v2, v4}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .local v4, "node":Lorg/w3c/dom/Node;
    nop

    .line 274
    if-eqz v0, :cond_3

    .line 275
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V

    .line 263
    :cond_3
    return-object v4

    .line 265
    .end local v4    # "node":Lorg/w3c/dom/Node;
    :cond_4
    const/4 v4, 0x0

    :try_start_1
    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 266
    .restart local v4    # "node":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-interface {v5, v4}, Lorg/w3c/dom/Element;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 267
    nop

    .line 274
    if-eqz v0, :cond_5

    .line 275
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V

    .line 267
    :cond_5
    return-object v4

    .line 260
    .end local v4    # "node":Lorg/w3c/dom/Node;
    :cond_6
    :try_start_2
    const-string v4, "SyntaxError"

    const-string v5, "XML objects may contain at most one node."

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .end local p2    # "xml":Ljava/lang/String;
    throw v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 274
    .end local v1    # "syntheticXml":Ljava/lang/String;
    .end local v2    # "document":Lorg/w3c/dom/Document;
    .end local v3    # "rv":Lorg/w3c/dom/NodeList;
    .restart local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .restart local p2    # "xml":Ljava/lang/String;
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 271
    :catch_0
    move-exception v1

    .line 272
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    :try_start_3
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .end local p2    # "xml":Ljava/lang/String;
    throw v2

    .line 269
    .end local v1    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .restart local p2    # "xml":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 270
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unreachable."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .end local p2    # "xml":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 274
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local p1    # "defaultNamespaceUri":Ljava/lang/String;
    .restart local p2    # "xml":Ljava/lang/String;
    :goto_3
    if-eqz v0, :cond_7

    .line 275
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->returnDocumentBuilderToPool(Ljavax/xml/parsers/DocumentBuilder;)V

    .line 276
    :cond_7
    throw v1
.end method
