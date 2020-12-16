.class Lcom/trendmicro/hippo/xmlimpl/XMLName;
.super Lcom/trendmicro/hippo/Ref;
.source "XMLName.java"


# static fields
.field static final serialVersionUID:J = 0x352ea00d07427a41L


# instance fields
.field private isAttributeName:Z

.field private isDescendants:Z

.field private qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

.field private xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 102
    invoke-direct {p0}, Lcom/trendmicro/hippo/Ref;-><init>()V

    .line 103
    return-void
.end method

.method static accept(Ljava/lang/Object;)Z
    .locals 5
    .param p0, "nameObj"    # Ljava/lang/Object;

    .line 73
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Lcom/trendmicro/hippo/EcmaError; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .local v1, "name":Ljava/lang/String;
    nop

    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 83
    .local v2, "length":I
    if-eqz v2, :cond_2

    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 85
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    if-eq v3, v2, :cond_1

    .line 86
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isNCNameChar(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 87
    return v0

    .line 85
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 90
    .end local v3    # "i":I
    :cond_1
    const/4 v0, 0x1

    return v0

    .line 94
    :cond_2
    return v0

    .line 74
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "length":I
    :catch_0
    move-exception v1

    .line 75
    .local v1, "ee":Lcom/trendmicro/hippo/EcmaError;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/EcmaError;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TypeError"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 76
    return v0

    .line 78
    :cond_3
    throw v1
.end method

.method private addAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 0
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 234
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addMatchingAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 235
    return-void
.end method

.method private addDescendantAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 3
    .param p1, "list"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 203
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addMatchingAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 205
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getChildren()[Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 206
    .local v0, "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 207
    aget-object v2, v0, v1

    invoke-direct {p0, p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addDescendantAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 206
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 210
    .end local v0    # "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private addDescendantChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 4
    .param p1, "list"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 178
    move-object v0, p0

    .line 179
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getChildren()[Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 181
    .local v1, "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 182
    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matches(Lcom/trendmicro/hippo/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 183
    aget-object v3, v1, v2

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 185
    :cond_0
    aget-object v3, v1, v2

    invoke-direct {p0, p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addDescendantChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 181
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 188
    .end local v1    # "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method static create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 1
    .param p0, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 158
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method static create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;ZZ)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 1
    .param p0, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .param p1, "attribute"    # Z
    .param p2, "descendants"    # Z

    .line 148
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;-><init>()V

    .line 149
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    iput-object p0, v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 150
    iput-boolean p1, v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName:Z

    .line 151
    iput-boolean p2, v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants:Z

    .line 152
    return-object v0
.end method

.method static create(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 4
    .param p0, "defaultNamespaceUri"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .line 127
    if-eqz p1, :cond_2

    .line 130
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 131
    .local v0, "l":I
    if-eqz v0, :cond_1

    .line 132
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 133
    .local v1, "firstChar":C
    const/16 v2, 0x2a

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    .line 134
    if-ne v0, v3, :cond_1

    .line 135
    invoke-static {}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formStar()Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v2

    return-object v2

    .line 137
    :cond_0
    const/16 v2, 0x40

    if-ne v1, v2, :cond_1

    .line 138
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v2

    .line 139
    .local v2, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->setAttributeName()V

    .line 140
    return-object v2

    .line 144
    .end local v1    # "firstChar":C
    .end local v2    # "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    :cond_1
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v1

    return-object v1

    .line 128
    .end local v0    # "l":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static formProperty(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 2
    .param p0, "namespace"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;
    .param p1, "localName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 114
    if-eqz p1, :cond_0

    const-string v0, "*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 115
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;-><init>()V

    .line 116
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 117
    return-object v0
.end method

.method static formProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "localName"    # Ljava/lang/String;

    .line 122
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->formProperty(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method static formStar()Lcom/trendmicro/hippo/xmlimpl/XMLName;
    .locals 2

    .line 106
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;-><init>()V

    .line 107
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    const/4 v1, 0x0

    invoke-static {v1, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->create(Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 108
    return-object v0
.end method

.method private static isNCNameChar(I)Z
    .locals 3
    .param p0, "c"    # I

    .line 47
    and-int/lit8 v0, p0, -0x80

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_9

    .line 49
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    .line 50
    const/16 v0, 0x7a

    if-gt p0, v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 51
    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_4

    .line 52
    const/16 v0, 0x5a

    if-gt p0, v0, :cond_2

    .line 53
    return v2

    .line 55
    :cond_2
    const/16 v0, 0x5f

    if-ne p0, v0, :cond_3

    move v1, v2

    :cond_3
    return v1

    .line 56
    :cond_4
    const/16 v0, 0x30

    if-lt p0, v0, :cond_6

    .line 57
    const/16 v0, 0x39

    if-gt p0, v0, :cond_5

    move v1, v2

    :cond_5
    return v1

    .line 59
    :cond_6
    const/16 v0, 0x2d

    if-eq p0, v0, :cond_7

    const/16 v0, 0x2e

    if-ne p0, v0, :cond_8

    :cond_7
    move v1, v2

    :cond_8
    return v1

    .line 61
    :cond_9
    and-int/lit16 v0, p0, -0x2000

    if-nez v0, :cond_c

    .line 62
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v0

    if-nez v0, :cond_a

    const/16 v0, 0xb7

    if-eq p0, v0, :cond_a

    const/16 v0, 0x300

    if-gt v0, p0, :cond_b

    const/16 v0, 0x36f

    if-gt p0, v0, :cond_b

    :cond_a
    move v1, v2

    :cond_b
    return v1

    .line 65
    :cond_c
    invoke-static {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isNCNameStartChar(I)Z

    move-result v0

    if-nez v0, :cond_d

    const/16 v0, 0x203f

    if-gt v0, p0, :cond_e

    const/16 v0, 0x2040

    if-gt p0, v0, :cond_e

    :cond_d
    move v1, v2

    :cond_e
    return v1
.end method

.method private static isNCNameStartChar(I)Z
    .locals 3
    .param p0, "c"    # I

    .line 20
    and-int/lit8 v0, p0, -0x80

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_4

    .line 22
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    .line 23
    const/16 v0, 0x7a

    if-gt p0, v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 24
    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_b

    .line 25
    const/16 v0, 0x5a

    if-gt p0, v0, :cond_2

    .line 26
    return v2

    .line 28
    :cond_2
    const/16 v0, 0x5f

    if-ne p0, v0, :cond_3

    move v1, v2

    :cond_3
    return v1

    .line 30
    :cond_4
    and-int/lit16 v0, p0, -0x2000

    if-nez v0, :cond_b

    .line 31
    const/16 v0, 0xc0

    if-gt v0, p0, :cond_5

    const/16 v0, 0xd6

    if-le p0, v0, :cond_9

    :cond_5
    const/16 v0, 0xd8

    if-gt v0, p0, :cond_6

    const/16 v0, 0xf6

    if-le p0, v0, :cond_9

    :cond_6
    const/16 v0, 0xf8

    if-gt v0, p0, :cond_7

    const/16 v0, 0x2ff

    if-le p0, v0, :cond_9

    :cond_7
    const/16 v0, 0x370

    if-gt v0, p0, :cond_8

    const/16 v0, 0x37d

    if-le p0, v0, :cond_9

    :cond_8
    const/16 v0, 0x37f

    if-gt v0, p0, :cond_a

    :cond_9
    move v1, v2

    :cond_a
    return v1

    .line 37
    :cond_b
    const/16 v0, 0x200c

    if-gt v0, p0, :cond_c

    const/16 v0, 0x200d

    if-le p0, v0, :cond_12

    :cond_c
    const/16 v0, 0x2070

    if-gt v0, p0, :cond_d

    const/16 v0, 0x218f

    if-le p0, v0, :cond_12

    :cond_d
    const/16 v0, 0x2c00

    if-gt v0, p0, :cond_e

    const/16 v0, 0x2fef

    if-le p0, v0, :cond_12

    :cond_e
    const/16 v0, 0x3001

    if-gt v0, p0, :cond_f

    const v0, 0xd7ff

    if-le p0, v0, :cond_12

    :cond_f
    const v0, 0xf900

    if-gt v0, p0, :cond_10

    const v0, 0xfdcf

    if-le p0, v0, :cond_12

    :cond_10
    const v0, 0xfdf0

    if-gt v0, p0, :cond_11

    const v0, 0xfffd

    if-le p0, v0, :cond_12

    :cond_11
    const/high16 v0, 0x10000

    if-gt v0, p0, :cond_13

    const v0, 0xeffff

    if-gt p0, v0, :cond_13

    :cond_12
    move v1, v2

    :cond_13
    return v1
.end method


# virtual methods
.method addDescendants(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 2
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 225
    move-object v0, p0

    .line 226
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 227
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matchDescendantAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    goto :goto_0

    .line 229
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matchDescendantChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    .line 231
    :goto_0
    return-void
.end method

.method addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 3
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 238
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addDescendants(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    goto :goto_1

    .line 240
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 241
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    goto :goto_1

    .line 243
    :cond_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getChildren()[Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v0

    .line 244
    .local v0, "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    if-eqz v0, :cond_3

    .line 245
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 246
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matches(Lcom/trendmicro/hippo/xmlimpl/XML;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 247
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 245
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 251
    .end local v1    # "i":I
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 253
    .end local v0    # "children":[Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_1
    return-void
.end method

.method addMatchingAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V
    .locals 4
    .param p1, "list"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 191
    move-object v0, p0

    .line 192
    .local v0, "name":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 193
    invoke-virtual {p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->getAttributes()[Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 194
    .local v1, "attributes":[Lcom/trendmicro/hippo/xmlimpl/XML;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 195
    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->matches(Lcom/trendmicro/hippo/xmlimpl/XML;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 196
    aget-object v3, v1, v2

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 194
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 200
    .end local v1    # "attributes":[Lcom/trendmicro/hippo/xmlimpl/XML;
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Context;)Z
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 353
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 354
    return v1

    .line 356
    :cond_0
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    .line 357
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v0

    xor-int/2addr v0, v1

    return v0
.end method

.method public get(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 330
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_0

    .line 334
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->getXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 331
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 332
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toString()Ljava/lang/String;

    move-result-object v1

    .line 331
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method getMyValueOn(Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 256
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->newXMLList()Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v0

    .line 257
    .local v0, "rv":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addMatches(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 258
    return-object v0
.end method

.method public has(Lcom/trendmicro/hippo/Context;)Z
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 322
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-nez v0, :cond_0

    .line 323
    const/4 v0, 0x0

    return v0

    .line 325
    :cond_0
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Z

    move-result v0

    return v0
.end method

.method initXMLObject(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;)V
    .locals 1
    .param p1, "xmlObject"    # Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 162
    if-eqz p1, :cond_1

    .line 163
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-nez v0, :cond_0

    .line 164
    iput-object p1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 165
    return-void

    .line 163
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 162
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method isAttributeName()Z
    .locals 1

    .line 427
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName:Z

    return v0
.end method

.method isDescendants()Z
    .locals 1

    .line 439
    iget-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants:Z

    return v0
.end method

.method localName()Ljava/lang/String;
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "*"

    return-object v0

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method matchDescendantAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 213
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 214
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addDescendantAttributes(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 215
    return-object p1
.end method

.method matchDescendantChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .locals 1
    .param p1, "rv"    # Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .param p2, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 219
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->setTargets(Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)V

    .line 220
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->addDescendantChildren(Lcom/trendmicro/hippo/xmlimpl/XMLList;Lcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 221
    return-object p1
.end method

.method final matches(Lcom/trendmicro/hippo/xmlimpl/XML;)Z
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 396
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getNodeQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    move-result-object v0

    .line 397
    .local v0, "qname":Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    const/4 v1, 0x0

    .line 398
    .local v1, "nodeUri":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 399
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    .line 401
    :cond_0
    iget-boolean v2, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName:Z

    const-string v3, "*"

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_5

    .line 402
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->isAttribute()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 403
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 404
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 408
    :cond_2
    return v5

    .line 405
    :cond_3
    :goto_0
    return v4

    .line 412
    :cond_4
    return v5

    .line 415
    :cond_5
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 416
    :cond_6
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    return v4

    .line 417
    :cond_7
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->isElement()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 418
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    return v4

    .line 421
    :cond_8
    return v5
.end method

.method final matchesElement(Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;)Z
    .locals 2
    .param p1, "qname"    # Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    .line 387
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 388
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 392
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 389
    :cond_2
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method final matchesLocalName(Ljava/lang/String;)Z
    .locals 2
    .param p1, "localName"    # Ljava/lang/String;

    .line 383
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method public set(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "value"    # Ljava/lang/Object;

    .line 339
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->xmlObject:Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v0, :cond_1

    .line 346
    iget-boolean v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants:Z

    if-nez v1, :cond_0

    .line 347
    invoke-virtual {v0, p0, p2}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->putXMLProperty(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 348
    return-object p2

    .line 346
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 340
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 341
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->toString()Ljava/lang/String;

    move-result-object v1

    .line 340
    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method setAttributeName()V
    .locals 1

    .line 434
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName:Z

    .line 435
    return-void
.end method

.method setIsDescendants()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 447
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants:Z

    .line 448
    return-void
.end method

.method setMyValueOn(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;)V
    .locals 6
    .param p1, "target"    # Lcom/trendmicro/hippo/xmlimpl/XML;
    .param p2, "value"    # Ljava/lang/Object;

    .line 263
    if-nez p2, :cond_0

    .line 264
    const-string p2, "null"

    goto :goto_0

    .line 265
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/Undefined;

    if-eqz v0, :cond_1

    .line 266
    const-string p2, "undefined"

    .line 269
    :cond_1
    :goto_0
    move-object v0, p0

    .line 271
    .local v0, "xmlName":Lcom/trendmicro/hippo/xmlimpl/XMLName;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 272
    invoke-virtual {p1, v0, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->setAttribute(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 273
    :cond_2
    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 274
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    goto/16 :goto_4

    .line 277
    :cond_3
    const/4 v1, 0x0

    .line 279
    .local v1, "xmlValue":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    instance-of v2, p2, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    if-eqz v2, :cond_7

    .line 280
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;

    .line 283
    instance-of v2, v1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-eqz v2, :cond_4

    .line 284
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/xmlimpl/XML;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->isAttribute()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 285
    nop

    .line 286
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v2

    .line 285
    invoke-virtual {p1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->makeXmlFromString(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 290
    :cond_4
    instance-of v2, v1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v2, :cond_8

    .line 291
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;->length()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 292
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 294
    .local v3, "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->isAttribute()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 295
    move-object v4, v1

    check-cast v4, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v0, v5}, Lcom/trendmicro/hippo/xmlimpl/XML;->makeXmlFromString(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->replace(ILcom/trendmicro/hippo/xmlimpl/XML;)V

    .line 291
    .end local v3    # "xml":Lcom/trendmicro/hippo/xmlimpl/XML;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v2    # "i":I
    :cond_6
    goto :goto_2

    .line 300
    :cond_7
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lcom/trendmicro/hippo/xmlimpl/XML;->makeXmlFromString(Lcom/trendmicro/hippo/xmlimpl/XMLName;Ljava/lang/String;)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v1

    .line 303
    :cond_8
    :goto_2
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/xmlimpl/XML;->getPropertyList(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XMLList;

    move-result-object v2

    .line 305
    .local v2, "matches":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v3

    if-nez v3, :cond_9

    .line 306
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    goto :goto_4

    .line 309
    :cond_9
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_3
    invoke-virtual {v2}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge v3, v4, :cond_a

    .line 310
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->childIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Lcom/trendmicro/hippo/xmlimpl/XML;->removeChild(I)V

    .line 309
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 314
    .end local v3    # "i":I
    :cond_a
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/xmlimpl/XMLList;->item(I)Lcom/trendmicro/hippo/xmlimpl/XML;

    move-result-object v3

    .line 315
    .local v3, "firstMatch":Lcom/trendmicro/hippo/xmlimpl/XML;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/xmlimpl/XML;->childIndex()I

    move-result v4

    invoke-virtual {p1, v4, v1}, Lcom/trendmicro/hippo/xmlimpl/XML;->replace(ILjava/lang/Object;)Lcom/trendmicro/hippo/xmlimpl/XML;

    .line 318
    .end local v1    # "xmlValue":Lcom/trendmicro/hippo/xmlimpl/XMLObjectImpl;
    .end local v2    # "matches":Lcom/trendmicro/hippo/xmlimpl/XMLList;
    .end local v3    # "firstMatch":Lcom/trendmicro/hippo/xmlimpl/XML;
    :goto_4
    return-void
.end method

.method final toQname()Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;
    .locals 1

    .line 379
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 363
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 364
    .local v0, "buff":Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isDescendants:Z

    if-eqz v1, :cond_0

    const-string v1, ".."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    :cond_0
    iget-boolean v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->isAttributeName:Z

    if-eqz v1, :cond_1

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 366
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 367
    const/16 v1, 0x2a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 369
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 372
    :cond_2
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->uri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 374
    :cond_3
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method uri()Ljava/lang/String;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLName;->qname:Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$QName;->getNamespace()Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
