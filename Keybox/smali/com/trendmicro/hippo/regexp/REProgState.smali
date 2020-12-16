.class Lcom/trendmicro/hippo/regexp/REProgState;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field final backTrack:Lcom/trendmicro/hippo/regexp/REBackTrackData;

.field final continuationOp:I

.field final continuationPc:I

.field final index:I

.field final max:I

.field final min:I

.field final previous:Lcom/trendmicro/hippo/regexp/REProgState;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/regexp/REProgState;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V
    .locals 0
    .param p1, "previous"    # Lcom/trendmicro/hippo/regexp/REProgState;
    .param p2, "min"    # I
    .param p3, "max"    # I
    .param p4, "index"    # I
    .param p5, "backTrack"    # Lcom/trendmicro/hippo/regexp/REBackTrackData;
    .param p6, "continuationOp"    # I
    .param p7, "continuationPc"    # I

    .line 2865
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2866
    iput-object p1, p0, Lcom/trendmicro/hippo/regexp/REProgState;->previous:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2867
    iput p2, p0, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    .line 2868
    iput p3, p0, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    .line 2869
    iput p4, p0, Lcom/trendmicro/hippo/regexp/REProgState;->index:I

    .line 2870
    iput p6, p0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2871
    iput p7, p0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2872
    iput-object p5, p0, Lcom/trendmicro/hippo/regexp/REProgState;->backTrack:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2873
    return-void
.end method
