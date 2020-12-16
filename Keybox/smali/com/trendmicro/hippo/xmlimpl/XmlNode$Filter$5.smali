.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$5;
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

    .line 871
    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;-><init>()V

    return-void
.end method


# virtual methods
.method accept(Lorg/w3c/dom/Node;)Z
    .locals 1
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 874
    const/4 v0, 0x1

    return v0
.end method
