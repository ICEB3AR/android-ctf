.class Lcom/trendmicro/hippo/regexp/REBackTrackData;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field final continuationOp:I

.field final continuationPc:I

.field final cp:I

.field final op:I

.field final parens:[J

.field final pc:I

.field final previous:Lcom/trendmicro/hippo/regexp/REBackTrackData;

.field final stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/regexp/REGlobalData;IIIII)V
    .locals 1
    .param p1, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p2, "op"    # I
    .param p3, "pc"    # I
    .param p4, "cp"    # I
    .param p5, "continuationOp"    # I
    .param p6, "continuationPc"    # I

    .line 2889
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2890
    iget-object v0, p1, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->previous:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2891
    iput p2, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->op:I

    .line 2892
    iput p3, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->pc:I

    .line 2893
    iput p4, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->cp:I

    .line 2894
    iput p5, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->continuationOp:I

    .line 2895
    iput p6, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->continuationPc:I

    .line 2896
    iget-object v0, p1, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->parens:[J

    .line 2897
    iget-object v0, p1, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2898
    return-void
.end method
