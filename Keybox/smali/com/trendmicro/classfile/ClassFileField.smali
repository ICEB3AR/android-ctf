.class final Lcom/trendmicro/classfile/ClassFileField;
.super Ljava/lang/Object;
.source "ClassFileField.java"


# instance fields
.field private itsAttr1:S

.field private itsAttr2:S

.field private itsAttr3:S

.field private itsFlags:S

.field private itsHasAttributes:Z

.field private itsIndex:I

.field private itsNameIndex:S

.field private itsTypeIndex:S


# direct methods
.method constructor <init>(SSS)V
    .locals 1
    .param p1, "nameIndex"    # S
    .param p2, "typeIndex"    # S
    .param p3, "flags"    # S

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-short p1, p0, Lcom/trendmicro/classfile/ClassFileField;->itsNameIndex:S

    .line 14
    iput-short p2, p0, Lcom/trendmicro/classfile/ClassFileField;->itsTypeIndex:S

    .line 15
    iput-short p3, p0, Lcom/trendmicro/classfile/ClassFileField;->itsFlags:S

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsHasAttributes:Z

    .line 17
    return-void
.end method


# virtual methods
.method getWriteSize()I
    .locals 2

    .line 48
    const/4 v0, 0x6

    .line 49
    .local v0, "size":I
    iget-boolean v1, p0, Lcom/trendmicro/classfile/ClassFileField;->itsHasAttributes:Z

    if-nez v1, :cond_0

    .line 50
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 52
    :cond_0
    add-int/lit8 v0, v0, 0xa

    .line 54
    :goto_0
    return v0
.end method

.method setAttributes(SSSI)V
    .locals 1
    .param p1, "attr1"    # S
    .param p2, "attr2"    # S
    .param p3, "attr3"    # S
    .param p4, "index"    # I

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsHasAttributes:Z

    .line 22
    iput-short p1, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr1:S

    .line 23
    iput-short p2, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr2:S

    .line 24
    iput-short p3, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr3:S

    .line 25
    iput p4, p0, Lcom/trendmicro/classfile/ClassFileField;->itsIndex:I

    .line 26
    return-void
.end method

.method write([BI)I
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .line 30
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsFlags:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 31
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsNameIndex:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 32
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsTypeIndex:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 33
    iget-boolean v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsHasAttributes:Z

    if-nez v0, :cond_0

    .line 35
    const/4 v0, 0x0

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    goto :goto_0

    .line 37
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 38
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr1:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 39
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr2:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 40
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsAttr3:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 41
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileField;->itsIndex:I

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 43
    :goto_0
    return p2
.end method
