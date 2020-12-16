.class Lcom/trendmicro/hippo/xml/XMLLib$Factory$1;
.super Lcom/trendmicro/hippo/xml/XMLLib$Factory;
.source "XMLLib.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/xml/XMLLib$Factory;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xml/XMLLib$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$className:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/trendmicro/hippo/xml/XMLLib$Factory$1;->val$className:Ljava/lang/String;

    invoke-direct {p0}, Lcom/trendmicro/hippo/xml/XMLLib$Factory;-><init>()V

    return-void
.end method


# virtual methods
.method public getImplementationClassName()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/trendmicro/hippo/xml/XMLLib$Factory$1;->val$className:Ljava/lang/String;

    return-object v0
.end method
