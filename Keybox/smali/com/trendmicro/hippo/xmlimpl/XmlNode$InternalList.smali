.class Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
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
    name = "InternalList"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x326b8bba71b12252L


# instance fields
.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/xmlimpl/XmlNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 779
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 780
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->list:Ljava/util/List;

    .line 781
    return-void
.end method

.method private _add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 1
    .param p1, "n"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 784
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 785
    return-void
.end method


# virtual methods
.method add(Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 1
    .param p1, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 813
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getAnnotation()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 814
    return-void
.end method

.method add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;)V
    .locals 2
    .param p1, "other"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;

    .line 796
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 797
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 796
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 799
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method add(Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;II)V
    .locals 2
    .param p1, "from"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;
    .param p2, "startInclusive"    # I
    .param p3, "endExclusive"    # I

    .line 802
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 803
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 802
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 805
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    .line 808
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 809
    return-void
.end method

.method addToList(Ljava/lang/Object;)V
    .locals 3
    .param p1, "toAdd"    # Ljava/lang/Object;

    .line 818
    instance-of v0, p1, Lcom/trendmicro/hippo/Undefined;

    if-eqz v0, :cond_0

    .line 820
    return-void

    .line 823
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v0, :cond_2

    .line 824
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 825
    .local v0, "xmlSrc":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 826
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getAnnotation()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 825
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 828
    .end local v0    # "xmlSrc":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v1    # "i":I
    :cond_1
    goto :goto_1

    :cond_2
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v0, :cond_3

    .line 829
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getAnnotation()Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    goto :goto_1

    .line 830
    :cond_3
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    if-eqz v0, :cond_4

    .line 831
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->_add(Lcom/trendmicro/hippo/xmlimpl/XmlNode;)V

    .line 833
    :cond_4
    :goto_1
    return-void
.end method

.method item(I)Lcom/trendmicro/hippo/xmlimpl/XmlNode;
    .locals 1
    .param p1, "index"    # I

    .line 788
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode;

    return-object v0
.end method

.method length()I
    .locals 1

    .line 836
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method remove(I)V
    .locals 1
    .param p1, "index"    # I

    .line 792
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$InternalList;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 793
    return-void
.end method
