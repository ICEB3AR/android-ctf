.class final Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;
.super Lcom/trendmicro/hippo/NativeWith;
.source "XMLWithScope.java"


# static fields
.field private static final serialVersionUID:J = -0x9aa36be02768547L


# instance fields
.field private _currIndex:I

.field private _dqPrototype:Lcom/trendmicro/hippo/xml/XMLObject;

.field private _xmlList:Lcom/trendmicro/hippo/xmlimpl/XMLList;

.field private lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/xml/XMLObject;)V
    .locals 0
    .param p1, "lib"    # Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;
    .param p2, "parent"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "prototype"    # Lcom/trendmicro/hippo/xml/XMLObject;

    .line 24
    invoke-direct {p0, p2, p3}, Lcom/trendmicro/hippo/NativeWith;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 25
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    .line 26
    return-void
.end method


# virtual methods
.method initAsDotQuery()V
    .locals 4

    .line 30
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 38
    .local v0, "prototype":Lcom/trendmicro/hippo/xml/XMLObject;
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_currIndex:I

    .line 39
    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_dqPrototype:Lcom/trendmicro/hippo/xml/XMLObject;

    .line 40
    instance-of v2, v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v2, :cond_0

    .line 41
    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 42
    .local v2, "xl":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 43
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 48
    .end local v2    # "xl":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->lib:Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLLibImpl;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_xmlList:Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 49
    return-void
.end method

.method protected updateDotQuery(Z)Ljava/lang/Object;
    .locals 6
    .param p1, "value"    # Z

    .line 56
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_dqPrototype:Lcom/trendmicro/hippo/xml/XMLObject;

    .line 57
    .local v0, "seed":Lcom/trendmicro/hippo/xml/XMLObject;
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_xmlList:Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 59
    .local v1, "xmlL":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    instance-of v2, v0, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v2, :cond_2

    .line 63
    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 65
    .local v2, "orgXmlL":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    iget v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_currIndex:I

    .line 67
    .local v3, "idx":I
    const/4 v4, 0x0

    if-eqz p1, :cond_0

    .line 68
    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 72
    :cond_0
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 76
    iput v3, p0, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->_currIndex:I

    .line 77
    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLWithScope;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 80
    return-object v4

    .line 82
    .end local v2    # "orgXmlL":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v3    # "idx":I
    :cond_1
    goto :goto_0

    .line 85
    :cond_2
    if-eqz p1, :cond_3

    .line 86
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 90
    :cond_3
    :goto_0
    return-object v1
.end method
