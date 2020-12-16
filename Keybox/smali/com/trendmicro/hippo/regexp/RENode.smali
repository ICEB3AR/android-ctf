.class Lcom/trendmicro/hippo/regexp/RENode;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field bmsize:I

.field chr:C

.field flatIndex:I

.field greedy:Z

.field index:I

.field kid:Lcom/trendmicro/hippo/regexp/RENode;

.field kid2:Lcom/trendmicro/hippo/regexp/RENode;

.field kidlen:I

.field length:I

.field max:I

.field min:I

.field next:Lcom/trendmicro/hippo/regexp/RENode;

.field op:B

.field parenCount:I

.field parenIndex:I

.field sense:Z

.field startIndex:I


# direct methods
.method constructor <init>(B)V
    .locals 0
    .param p1, "op"    # B

    .line 2799
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2800
    iput-byte p1, p0, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    .line 2801
    return-void
.end method
