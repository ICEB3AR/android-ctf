.class Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;
.super Ljava/lang/Object;
.source "XmlProcessor.java"

# interfaces
.implements Lorg/xml/sax/ErrorHandler;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HippoSAXErrorHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x600327d1fcbca797L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$1;

    .line 57
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;-><init>()V

    return-void
.end method

.method private throwError(Lorg/xml/sax/SAXParseException;)V
    .locals 3
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;

    .line 62
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 63
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 62
    const-string v2, "TypeError"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;

    .line 67
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;->throwError(Lorg/xml/sax/SAXParseException;)V

    .line 68
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;

    .line 71
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor$HippoSAXErrorHandler;->throwError(Lorg/xml/sax/SAXParseException;)V

    .line 72
    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 1
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;

    .line 75
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 76
    return-void
.end method
