.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$3;
.super Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
.source "XmlNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->PROCESSING_INSTRUCTION(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$name:Lcom/trendmicro/hippo/xmlimpl/XMLName;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V
    .locals 0

    .line 854
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$3;->val$name:Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-direct {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;-><init>()V

    return-void
.end method


# virtual methods
.method accept(Lorg/w3c/dom/Node;)Z
    .locals 3
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 857
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 858
    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    .line 859
    .local v0, "pi":Lorg/w3c/dom/ProcessingInstruction;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$3;->val$name:Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matchesLocalName(Ljava/lang/String;)Z

    move-result v1

    return v1

    .line 861
    .end local v0    # "pi":Lorg/w3c/dom/ProcessingInstruction;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
