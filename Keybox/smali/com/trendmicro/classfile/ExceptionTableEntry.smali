.class final Lcom/trendmicro/classfile/ExceptionTableEntry;
.super Ljava/lang/Object;
.source "ExceptionTableEntry.java"


# instance fields
.field itsCatchType:S

.field itsEndLabel:I

.field itsHandlerLabel:I

.field itsStartLabel:I


# direct methods
.method constructor <init>(IIIS)V
    .locals 0
    .param p1, "startLabel"    # I
    .param p2, "endLabel"    # I
    .param p3, "handlerLabel"    # I
    .param p4, "catchType"    # S

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    .line 15
    iput p2, p0, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsEndLabel:I

    .line 16
    iput p3, p0, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    .line 17
    iput-short p4, p0, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsCatchType:S

    .line 18
    return-void
.end method
