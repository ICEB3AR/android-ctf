.class public abstract Lcom/trendmicro/hippo/xml/XMLLib$Factory;
.super Ljava/lang/Object;
.source "XMLLib.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/xml/XMLLib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lcom/trendmicro/hippo/xml/XMLLib$Factory;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;

    .line 31
    new-instance v0, Lcom/trendmicro/hippo/xml/XMLLib$Factory$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/xml/XMLLib$Factory$1;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public abstract getImplementationClassName()Ljava/lang/String;
.end method
