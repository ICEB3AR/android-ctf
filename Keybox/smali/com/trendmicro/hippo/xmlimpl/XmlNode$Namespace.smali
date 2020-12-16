.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
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
    name = "Namespace"
.end annotation


# static fields
.field static final GLOBAL:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

.field private static final serialVersionUID:J = 0x38896a74952aade2L


# instance fields
.field private prefix:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 598
    const-string v0, ""

    invoke-static {v0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->GLOBAL:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 603
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 604
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 564
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 564
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .param p1, "x1"    # Ljava/lang/String;

    .line 564
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->setPrefix(Ljava/lang/String;)V

    return-void
.end method

.method static create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2
    .param p0, "uri"    # Ljava/lang/String;

    .line 587
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;-><init>()V

    .line 588
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    .line 591
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 592
    :cond_0
    const-string v1, ""

    iput-object v1, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 595
    :cond_1
    return-object v0
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .locals 2
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "uri"    # Ljava/lang/String;

    .line 572
    if-eqz p0, :cond_1

    .line 576
    if-eqz p1, :cond_0

    .line 580
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;-><init>()V

    .line 581
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 582
    iput-object p1, v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    .line 583
    return-object v0

    .line 577
    .end local v0    # "rv":Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Namespace may not lack a URI"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Empty string represents default namespace prefix"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setPrefix(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .line 635
    if-eqz p1, :cond_0

    .line 636
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    .line 637
    return-void

    .line 635
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method getPrefix()Ljava/lang/String;
    .locals 1

    .line 640
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method getUri()Ljava/lang/String;
    .locals 1

    .line 644
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    return-object v0
.end method

.method is(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;)Z
    .locals 2
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    .line 617
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    iget-object v1, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isDefault()Z
    .locals 2

    .line 625
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isEmpty()Z
    .locals 2

    .line 621
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isGlobal()Z
    .locals 2

    .line 629
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isUnspecifiedPrefix()Z
    .locals 1

    .line 613
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 608
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    const-string v1, "XmlNode.Namespace ["

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 609
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
