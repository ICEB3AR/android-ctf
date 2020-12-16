.class final Lcom/trendmicro/classfile/ClassFileMethod;
.super Ljava/lang/Object;
.source "ClassFileMethod.java"


# instance fields
.field private itsCodeAttribute:[B

.field private itsFlags:S

.field private itsName:Ljava/lang/String;

.field private itsNameIndex:S

.field private itsType:Ljava/lang/String;

.field private itsTypeIndex:S


# direct methods
.method constructor <init>(Ljava/lang/String;SLjava/lang/String;SS)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nameIndex"    # S
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "typeIndex"    # S
    .param p5, "flags"    # S

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsName:Ljava/lang/String;

    .line 15
    iput-short p2, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsNameIndex:S

    .line 16
    iput-object p3, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsType:Ljava/lang/String;

    .line 17
    iput-short p4, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsTypeIndex:S

    .line 18
    iput-short p5, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsFlags:S

    .line 19
    return-void
.end method


# virtual methods
.method getFlags()S
    .locals 1

    .line 56
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsFlags:S

    return v0
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsName:Ljava/lang/String;

    return-object v0
.end method

.method getType()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsType:Ljava/lang/String;

    return-object v0
.end method

.method getWriteSize()I
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsCodeAttribute:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x8

    return v0
.end method

.method setCodeAttribute([B)V
    .locals 0
    .param p1, "codeAttribute"    # [B

    .line 23
    iput-object p1, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsCodeAttribute:[B

    .line 24
    return-void
.end method

.method write([BI)I
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .line 28
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsFlags:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 29
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsNameIndex:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 30
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsTypeIndex:S

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 32
    const/4 v0, 0x1

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 33
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsCodeAttribute:[B

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileMethod;->itsCodeAttribute:[B

    array-length v0, v0

    add-int/2addr p2, v0

    .line 36
    return p2
.end method
