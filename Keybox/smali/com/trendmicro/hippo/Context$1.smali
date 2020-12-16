.class Lcom/trendmicro/hippo/Context$1;
.super Ljava/lang/Object;
.source "Context.java"

# interfaces
.implements Lcom/trendmicro/hippo/Context$ClassShutterSetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/Context;->getClassShutterSetter()Lcom/trendmicro/hippo/Context$ClassShutterSetter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/Context;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/Context;

    .line 2146
    iput-object p1, p0, Lcom/trendmicro/hippo/Context$1;->this$0:Lcom/trendmicro/hippo/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getClassShutter()Lcom/trendmicro/hippo/ClassShutter;
    .locals 1

    .line 2155
    iget-object v0, p0, Lcom/trendmicro/hippo/Context$1;->this$0:Lcom/trendmicro/hippo/Context;

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->access$000(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ClassShutter;

    move-result-object v0

    return-object v0
.end method

.method public setClassShutter(Lcom/trendmicro/hippo/ClassShutter;)V
    .locals 1
    .param p1, "shutter"    # Lcom/trendmicro/hippo/ClassShutter;

    .line 2150
    iget-object v0, p0, Lcom/trendmicro/hippo/Context$1;->this$0:Lcom/trendmicro/hippo/Context;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/Context;->access$002(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ClassShutter;)Lcom/trendmicro/hippo/ClassShutter;

    .line 2151
    return-void
.end method
