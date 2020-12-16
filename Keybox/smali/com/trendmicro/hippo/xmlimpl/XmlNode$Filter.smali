.class abstract Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
.super Ljava/lang/Object;
.source "XmlNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xmlimpl/XmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Filter"
.end annotation


# static fields
.field static final COMMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

.field static ELEMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

.field static final TEXT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

.field static TRUE:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 841
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$1;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$1;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->COMMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    .line 847
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$2;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$2;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->TEXT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    .line 865
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$4;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$4;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->ELEMENT:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    .line 871
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$5;

    invoke-direct {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$5;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;->TRUE:Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 840
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static PROCESSING_INSTRUCTION(Lcom/trendmicro/hippo/xmlimpl/XMLName;)Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter;
    .locals 1
    .param p0, "name"    # Lcom/trendmicro/hippo/xmlimpl/XMLName;

    .line 854
    new-instance v0, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$3;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/xmlimpl/XmlNode$Filter$3;-><init>(Lcom/trendmicro/hippo/xmlimpl/XMLName;)V

    return-object v0
.end method


# virtual methods
.method abstract accept(Lorg/w3c/dom/Node;)Z
.end method
