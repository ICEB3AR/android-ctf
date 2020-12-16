.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$1;
.super Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
.source "XmlNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 841
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;-><init>()V

    return-void
.end method


# virtual methods
.method accept(Lorg/w3c/dom/Node;)Z
    .locals 2
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 844
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

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
