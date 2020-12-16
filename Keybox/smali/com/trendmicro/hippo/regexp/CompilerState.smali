.class Lcom/trendmicro/hippo/regexp/CompilerState;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field backReferenceLimit:I

.field classCount:I

.field cp:I

.field cpbegin:[C

.field cpend:I

.field cx:Lcom/trendmicro/hippo/Context;

.field flags:I

.field maxBackReference:I

.field parenCount:I

.field parenNesting:I

.field progLength:I

.field result:Lcom/trendmicro/hippo/regexp/RENode;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Context;[CII)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "source"    # [C
    .param p3, "length"    # I
    .param p4, "flags"    # I

    .line 2833
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2834
    iput-object p1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cx:Lcom/trendmicro/hippo/Context;

    .line 2835
    iput-object p2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    .line 2836
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 2837
    iput p3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    .line 2838
    iput p4, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    .line 2839
    const v1, 0x7fffffff

    iput v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->backReferenceLimit:I

    .line 2840
    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->maxBackReference:I

    .line 2841
    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    .line 2842
    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    .line 2843
    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 2844
    return-void
.end method
