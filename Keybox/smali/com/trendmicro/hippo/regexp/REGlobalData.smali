.class Lcom/trendmicro/hippo/regexp/REGlobalData;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

.field cp:I

.field multiline:Z

.field parens:[J

.field regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

.field skipped:I

.field stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2911
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method parensIndex(I)I
    .locals 3
    .param p1, "i"    # I

    .line 2929
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    aget-wide v1, v0, p1

    long-to-int v0, v1

    return v0
.end method

.method parensLength(I)I
    .locals 3
    .param p1, "i"    # I

    .line 2937
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    aget-wide v1, v0, p1

    const/16 v0, 0x20

    ushr-long v0, v1, v0

    long-to-int v0, v0

    return v0
.end method

.method setParens(III)V
    .locals 6
    .param p1, "i"    # I
    .param p2, "index"    # I
    .param p3, "length"    # I

    .line 2943
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->parens:[J

    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    if-ne v0, v1, :cond_0

    .line 2944
    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    .line 2946
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    int-to-long v1, p2

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    int-to-long v3, p3

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    aput-wide v1, v0, p1

    .line 2947
    return-void
.end method
