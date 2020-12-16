.class final Lcom/trendmicro/hippo/regexp/GlobData;
.super Ljava/lang/Object;
.source "RegExpImpl.java"


# instance fields
.field arrayobj:Lcom/trendmicro/hippo/Scriptable;

.field charBuf:Ljava/lang/StringBuilder;

.field dollar:I

.field global:Z

.field lambda:Lcom/trendmicro/hippo/Function;

.field leftIndex:I

.field mode:I

.field repstr:Ljava/lang/String;

.field str:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 751
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 765
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->dollar:I

    return-void
.end method
