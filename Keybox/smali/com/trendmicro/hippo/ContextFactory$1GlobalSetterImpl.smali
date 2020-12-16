.class Lcom/trendmicro/hippo/ContextFactory$1GlobalSetterImpl;
.super Ljava/lang/Object;
.source "ContextFactory.java"

# interfaces
.implements Lcom/trendmicro/hippo/ContextFactory$GlobalSetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/ContextFactory;->getGlobalSetter()Lcom/trendmicro/hippo/ContextFactory$GlobalSetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GlobalSetterImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContextFactoryGlobal()Lcom/trendmicro/hippo/ContextFactory;
    .locals 1

    .line 199
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->access$000()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    return-object v0
.end method

.method public setContextFactoryGlobal(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 195
    if-nez p1, :cond_0

    new-instance v0, Lcom/trendmicro/hippo/ContextFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ContextFactory;-><init>()V

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ContextFactory;->access$002(Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/ContextFactory;

    .line 196
    return-void
.end method
