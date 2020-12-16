.class final Lcom/trendmicro/classfile/ConstantPool;
.super Ljava/lang/Object;
.source "ConstantPool.java"


# static fields
.field static final CONSTANT_Class:B = 0x7t

.field static final CONSTANT_Double:B = 0x6t

.field static final CONSTANT_Fieldref:B = 0x9t

.field static final CONSTANT_Float:B = 0x4t

.field static final CONSTANT_Integer:B = 0x3t

.field static final CONSTANT_InterfaceMethodref:B = 0xbt

.field static final CONSTANT_InvokeDynamic:B = 0x12t

.field static final CONSTANT_Long:B = 0x5t

.field static final CONSTANT_MethodHandle:B = 0xft

.field static final CONSTANT_MethodType:B = 0x10t

.field static final CONSTANT_Methodref:B = 0xat

.field static final CONSTANT_NameAndType:B = 0xct

.field static final CONSTANT_String:B = 0x8t

.field static final CONSTANT_Utf8:B = 0x1t

.field private static final ConstantPoolSize:I = 0x100

.field private static final MAX_UTF_ENCODING_SIZE:I = 0xffff


# instance fields
.field private cfw:Lcom/trendmicro/classfile/ClassFileWriter;

.field private itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

.field private itsConstantData:Lcom/trendmicro/hippo/UintMap;

.field private itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

.field private itsFieldRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

.field private itsMethodRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

.field private itsPool:[B

.field private itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

.field private itsStringConstHash:Lcom/trendmicro/hippo/UintMap;

.field private itsTop:I

.field private itsTopIndex:I

.field private itsUtf8Hash:Lcom/trendmicro/hippo/ObjToIntMap;


# direct methods
.method constructor <init>(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 1
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 406
    new-instance v0, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsStringConstHash:Lcom/trendmicro/hippo/UintMap;

    .line 407
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsUtf8Hash:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 408
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsFieldRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 409
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsMethodRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 410
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 411
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 415
    new-instance v0, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantData:Lcom/trendmicro/hippo/UintMap;

    .line 416
    new-instance v0, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    .line 16
    iput-object p1, p0, Lcom/trendmicro/classfile/ConstantPool;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 17
    const/4 v0, 0x1

    iput v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    .line 18
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 20
    return-void
.end method

.method private addNameAndType(Ljava/lang/String;Ljava/lang/String;)S
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .line 231
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 232
    .local v0, "nameIndex":S
    invoke-virtual {p0, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 233
    .local v1, "typeIndex":S
    const/4 v2, 0x5

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 234
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/16 v5, 0xc

    aput-byte v5, v2, v3

    .line 235
    invoke-static {v0, v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 236
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    invoke-static {v1, v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 237
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v2, v3, v5}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 238
    iget v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v2, v2

    return v2
.end method

.method private ensure(I)V
    .locals 5
    .param p1, "howMuch"    # I

    .line 391
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int v1, v0, p1

    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    array-length v3, v2

    if-le v1, v3, :cond_1

    .line 392
    array-length v1, v2

    mul-int/lit8 v1, v1, 0x2

    .line 393
    .local v1, "newCapacity":I
    add-int v2, v0, p1

    if-le v2, v1, :cond_0

    .line 394
    add-int v1, v0, p1

    .line 396
    :cond_0
    new-array v0, v1, [B

    .line 397
    .local v0, "tmp":[B
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v4, 0x0

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 398
    iput-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    .line 400
    .end local v0    # "tmp":[B
    .end local v1    # "newCapacity":I
    :cond_1
    return-void
.end method


# virtual methods
.method addClass(Ljava/lang/String;)S
    .locals 7
    .param p1, "className"    # Ljava/lang/String;

    .line 243
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 244
    .local v0, "theIndex":I
    const/4 v2, 0x7

    if-ne v0, v1, :cond_1

    .line 245
    move-object v3, p1

    .line 246
    .local v3, "slashed":Ljava/lang/String;
    const/16 v4, 0x2e

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-lez v4, :cond_0

    .line 247
    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getSlashedForm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 248
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, v3, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 249
    if-eq v0, v1, :cond_0

    .line 250
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 253
    :cond_0
    if-ne v0, v1, :cond_1

    .line 254
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 255
    .local v1, "utf8Index":I
    const/4 v4, 0x3

    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 256
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    aput-byte v2, v4, v5

    .line 257
    invoke-static {v1, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 258
    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v0, v4

    .line 259
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, v3, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 260
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 261
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsClassHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 265
    .end local v1    # "utf8Index":I
    .end local v3    # "slashed":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 266
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 267
    int-to-short v1, v0

    return v1
.end method

.method addConstant(D)I
    .locals 5
    .param p1, "k"    # D

    .line 84
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 85
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v2, 0x6

    aput-byte v2, v0, v1

    .line 86
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 87
    .local v0, "bits":J
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt64(J[BI)I

    move-result v3

    iput v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 88
    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    .line 89
    .local v3, "index":I
    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v4, v4, 0x2

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    .line 90
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v4, v3, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 91
    return v3
.end method

.method addConstant(F)I
    .locals 4
    .param p1, "k"    # F

    .line 74
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 75
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v2, 0x4

    aput-byte v2, v0, v1

    .line 76
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 77
    .local v0, "bits":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    invoke-static {v0, v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 78
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v1, v3, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 79
    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    return v1
.end method

.method addConstant(I)I
    .locals 4
    .param p1, "k"    # I

    .line 54
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 55
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v3, 0x3

    aput-byte v3, v0, v1

    .line 56
    invoke-static {p1, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 57
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v0, v1, v3}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 58
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v0, v0

    return v0
.end method

.method addConstant(J)I
    .locals 4
    .param p1, "k"    # J

    .line 63
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 64
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v3, 0x5

    aput-byte v3, v0, v1

    .line 65
    invoke-static {p1, p2, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt64(J[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 66
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    .line 67
    .local v0, "index":I
    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    .line 68
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v1, v0, v3}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 69
    return v0
.end method

.method addConstant(Ljava/lang/Object;)I
    .locals 3
    .param p1, "value"    # Ljava/lang/Object;

    .line 110
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_8

    instance-of v0, p1, Ljava/lang/Byte;

    if-nez v0, :cond_8

    instance-of v0, p1, Ljava/lang/Short;

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 113
    :cond_0
    instance-of v0, p1, Ljava/lang/Character;

    if-eqz v0, :cond_1

    .line 114
    move-object v0, p1

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(I)I

    move-result v0

    return v0

    .line 115
    :cond_1
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 116
    move-object v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(I)I

    move-result v0

    return v0

    .line 117
    :cond_2
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_3

    .line 118
    move-object v0, p1

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(F)I

    move-result v0

    return v0

    .line 119
    :cond_3
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_4

    .line 120
    move-object v0, p1

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(J)I

    move-result v0

    return v0

    .line 121
    :cond_4
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_5

    .line 122
    move-object v0, p1

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(D)I

    move-result v0

    return v0

    .line 123
    :cond_5
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 124
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 127
    :cond_6
    instance-of v0, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;

    if-eqz v0, :cond_7

    .line 128
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addMethodHandle(Lcom/trendmicro/classfile/ClassFileWriter$MHandle;)S

    move-result v0

    return v0

    .line 130
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "value "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_8
    :goto_0
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(I)I

    move-result v0

    return v0
.end method

.method addConstant(Ljava/lang/String;)I
    .locals 6
    .param p1, "k"    # Ljava/lang/String;

    .line 96
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    .line 97
    .local v0, "utf8Index":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsStringConstHash:Lcom/trendmicro/hippo/UintMap;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v1

    .line 98
    .local v1, "theIndex":I
    const/16 v3, 0x8

    if-ne v1, v2, :cond_0

    .line 99
    iget v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v4, v2, 0x1

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v1, v2

    .line 100
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 101
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    aput-byte v3, v2, v4

    .line 102
    invoke-static {v0, v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 103
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsStringConstHash:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v0, v1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 105
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v1, v3}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 106
    return v1
.end method

.method addFieldRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 8
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "fieldType"    # Ljava/lang/String;

    .line 272
    new-instance v0, Lcom/trendmicro/classfile/FieldOrMethodRef;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .local v0, "ref":Lcom/trendmicro/classfile/FieldOrMethodRef;
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsFieldRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v1

    .line 276
    .local v1, "theIndex":I
    const/16 v3, 0x9

    if-ne v1, v2, :cond_0

    .line 277
    invoke-direct {p0, p2, p3}, Lcom/trendmicro/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v2

    .line 278
    .local v2, "ntIndex":S
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v4

    .line 279
    .local v4, "classIndex":S
    const/4 v5, 0x5

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 280
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    aput-byte v3, v5, v6

    .line 281
    invoke-static {v4, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v5

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 282
    iget-object v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    invoke-static {v2, v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v5

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 283
    iget v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v1, v5

    .line 284
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsFieldRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v5, v0, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 286
    .end local v2    # "ntIndex":S
    .end local v4    # "classIndex":S
    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 287
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v1, v3}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 288
    int-to-short v2, v1

    return v2
.end method

.method addInterfaceMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 6
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodType"    # Ljava/lang/String;

    .line 316
    invoke-direct {p0, p2, p3}, Lcom/trendmicro/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    .line 317
    .local v0, "ntIndex":S
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v1

    .line 318
    .local v1, "classIndex":S
    const/4 v2, 0x5

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 319
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/16 v5, 0xb

    aput-byte v5, v2, v3

    .line 320
    invoke-static {v1, v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 321
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    invoke-static {v0, v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 322
    new-instance v2, Lcom/trendmicro/classfile/FieldOrMethodRef;

    invoke-direct {v2, p1, p2, p3}, Lcom/trendmicro/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .local v2, "r":Lcom/trendmicro/classfile/FieldOrMethodRef;
    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 325
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    invoke-virtual {v3, v4, v5}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 326
    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v3, v3

    return v3
.end method

.method addInvokeDynamic(Ljava/lang/String;Ljava/lang/String;I)S
    .locals 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodType"    # Ljava/lang/String;
    .param p3, "bootstrapIndex"    # I

    .line 331
    new-instance v0, Lcom/trendmicro/classfile/ConstantEntry;

    const/16 v1, 0x12

    invoke-direct {v0, v1, p3, p1, p2}, Lcom/trendmicro/classfile/ConstantEntry;-><init>(IILjava/lang/String;Ljava/lang/String;)V

    .line 333
    .local v0, "entry":Lcom/trendmicro/classfile/ConstantEntry;
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v3, -0x1

    invoke-virtual {v2, v0, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v2

    .line 335
    .local v2, "theIndex":I
    if-ne v2, v3, :cond_0

    .line 336
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v3

    .line 337
    .local v3, "nameTypeIndex":S
    const/4 v4, 0x5

    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 338
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    aput-byte v1, v4, v5

    .line 339
    invoke-static {p3, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 340
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    invoke-static {v3, v5, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v4

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 341
    iget v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v2, v4

    .line 342
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, v0, v2}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 343
    invoke-virtual {p0, v2, p2}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 344
    iget-object v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v4, v2, v1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 346
    .end local v3    # "nameTypeIndex":S
    :cond_0
    int-to-short v1, v2

    return v1
.end method

.method addMethodHandle(Lcom/trendmicro/classfile/ClassFileWriter$MHandle;)S
    .locals 6
    .param p1, "mh"    # Lcom/trendmicro/classfile/ClassFileWriter$MHandle;

    .line 351
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 353
    .local v0, "theIndex":I
    if-ne v0, v1, :cond_2

    .line 355
    iget-byte v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    const/4 v2, 0x4

    if-gt v1, v2, :cond_0

    .line 356
    iget-object v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    iget-object v3, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    iget-object v4, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {p0, v1, v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addFieldRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .local v1, "ref":S
    goto :goto_0

    .line 357
    .end local v1    # "ref":S
    :cond_0
    iget-byte v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    const/16 v3, 0x9

    if-ne v1, v3, :cond_1

    .line 358
    iget-object v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    iget-object v3, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    iget-object v4, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {p0, v1, v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addInterfaceMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .restart local v1    # "ref":S
    goto :goto_0

    .line 360
    .end local v1    # "ref":S
    :cond_1
    iget-object v1, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->owner:Ljava/lang/String;

    iget-object v3, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->name:Ljava/lang/String;

    iget-object v4, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->desc:Ljava/lang/String;

    invoke-virtual {p0, v1, v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v1

    .line 363
    .restart local v1    # "ref":S
    :goto_0
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 364
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/16 v5, 0xf

    aput-byte v5, v2, v3

    .line 365
    add-int/lit8 v3, v4, 0x1

    iput v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    iget-byte v3, p1, Lcom/trendmicro/classfile/ClassFileWriter$MHandle;->tag:B

    aput-byte v3, v2, v4

    .line 366
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    invoke-static {v1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v2

    iput v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 367
    iget v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v0, v2

    .line 368
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v2, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 369
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v0, v5}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 371
    .end local v1    # "ref":S
    :cond_2
    int-to-short v1, v0

    return v1
.end method

.method addMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 8
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodType"    # Ljava/lang/String;

    .line 294
    new-instance v0, Lcom/trendmicro/classfile/FieldOrMethodRef;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/classfile/FieldOrMethodRef;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .local v0, "ref":Lcom/trendmicro/classfile/FieldOrMethodRef;
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsMethodRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v1

    .line 298
    .local v1, "theIndex":I
    const/16 v3, 0xa

    if-ne v1, v2, :cond_0

    .line 299
    invoke-direct {p0, p2, p3}, Lcom/trendmicro/classfile/ConstantPool;->addNameAndType(Ljava/lang/String;Ljava/lang/String;)S

    move-result v2

    .line 300
    .local v2, "ntIndex":S
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v4

    .line 301
    .local v4, "classIndex":S
    const/4 v5, 0x5

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 302
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    aput-byte v3, v5, v6

    .line 303
    invoke-static {v4, v5, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v5

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 304
    iget-object v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    invoke-static {v2, v6, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v5

    iput v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 305
    iget v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v1, v5

    .line 306
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsMethodRefHash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v5, v0, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 308
    .end local v2    # "ntIndex":S
    .end local v4    # "classIndex":S
    :cond_0
    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 309
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v1, v3}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 310
    int-to-short v2, v1

    return v2
.end method

.method addUtf8(Ljava/lang/String;)S
    .locals 12
    .param p1, "k"    # Ljava/lang/String;

    .line 174
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsUtf8Hash:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 175
    .local v0, "theIndex":I
    const/4 v2, 0x1

    if-ne v0, v1, :cond_6

    .line 176
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 178
    .local v1, "strLen":I
    const v3, 0xffff

    if-le v1, v3, :cond_0

    .line 179
    const/4 v3, 0x1

    .local v3, "tooBigString":Z
    goto/16 :goto_2

    .line 181
    .end local v3    # "tooBigString":Z
    :cond_0
    const/4 v4, 0x0

    .line 184
    .local v4, "tooBigString":Z
    mul-int/lit8 v5, v1, 0x3

    add-int/lit8 v5, v5, 0x3

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ConstantPool;->ensure(I)V

    .line 185
    iget v5, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 187
    .local v5, "top":I
    iget-object v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v7, v5, 0x1

    .end local v5    # "top":I
    .local v7, "top":I
    aput-byte v2, v6, v5

    .line 188
    add-int/lit8 v7, v7, 0x2

    .line 190
    iget-object v5, p0, Lcom/trendmicro/classfile/ConstantPool;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-virtual {v5, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->getCharBuffer(I)[C

    move-result-object v5

    .line 191
    .local v5, "chars":[C
    const/4 v6, 0x0

    invoke-virtual {p1, v6, v1, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 193
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-eq v6, v1, :cond_3

    .line 194
    aget-char v8, v5, v6

    .line 195
    .local v8, "c":I
    if-eqz v8, :cond_1

    const/16 v9, 0x7f

    if-gt v8, v9, :cond_1

    .line 196
    iget-object v9, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v10, v7, 0x1

    .end local v7    # "top":I
    .local v10, "top":I
    int-to-byte v11, v8

    aput-byte v11, v9, v7

    move v7, v10

    goto :goto_1

    .line 197
    .end local v10    # "top":I
    .restart local v7    # "top":I
    :cond_1
    const/16 v9, 0x7ff

    if-le v8, v9, :cond_2

    .line 198
    iget-object v9, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v10, v7, 0x1

    .end local v7    # "top":I
    .restart local v10    # "top":I
    shr-int/lit8 v11, v8, 0xc

    or-int/lit16 v11, v11, 0xe0

    int-to-byte v11, v11

    aput-byte v11, v9, v7

    .line 199
    add-int/lit8 v7, v10, 0x1

    .end local v10    # "top":I
    .restart local v7    # "top":I
    shr-int/lit8 v11, v8, 0x6

    and-int/lit8 v11, v11, 0x3f

    or-int/lit16 v11, v11, 0x80

    int-to-byte v11, v11

    aput-byte v11, v9, v10

    .line 200
    add-int/lit8 v10, v7, 0x1

    .end local v7    # "top":I
    .restart local v10    # "top":I
    and-int/lit8 v11, v8, 0x3f

    or-int/lit16 v11, v11, 0x80

    int-to-byte v11, v11

    aput-byte v11, v9, v7

    move v7, v10

    goto :goto_1

    .line 202
    .end local v10    # "top":I
    .restart local v7    # "top":I
    :cond_2
    iget-object v9, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v10, v7, 0x1

    .end local v7    # "top":I
    .restart local v10    # "top":I
    shr-int/lit8 v11, v8, 0x6

    or-int/lit16 v11, v11, 0xc0

    int-to-byte v11, v11

    aput-byte v11, v9, v7

    .line 203
    add-int/lit8 v7, v10, 0x1

    .end local v10    # "top":I
    .restart local v7    # "top":I
    and-int/lit8 v11, v8, 0x3f

    or-int/lit16 v11, v11, 0x80

    int-to-byte v11, v11

    aput-byte v11, v9, v10

    .line 193
    .end local v8    # "c":I
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 207
    .end local v6    # "i":I
    :cond_3
    iget v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v8, v6, 0x1

    add-int/lit8 v8, v8, 0x2

    sub-int v8, v7, v8

    .line 208
    .local v8, "utfLen":I
    if-le v8, v3, :cond_4

    .line 209
    const/4 v3, 0x1

    .end local v4    # "tooBigString":Z
    .restart local v3    # "tooBigString":Z
    goto :goto_2

    .line 212
    .end local v3    # "tooBigString":Z
    .restart local v4    # "tooBigString":Z
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    add-int/lit8 v9, v6, 0x1

    ushr-int/lit8 v10, v8, 0x8

    int-to-byte v10, v10

    aput-byte v10, v3, v9

    .line 213
    add-int/lit8 v6, v6, 0x2

    int-to-byte v9, v8

    aput-byte v9, v3, v6

    .line 215
    iput v7, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    .line 216
    iget v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    add-int/lit8 v6, v3, 0x1

    iput v6, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    move v0, v3

    .line 217
    iget-object v3, p0, Lcom/trendmicro/classfile/ConstantPool;->itsUtf8Hash:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v3, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    move v3, v4

    .line 220
    .end local v4    # "tooBigString":Z
    .end local v5    # "chars":[C
    .end local v7    # "top":I
    .end local v8    # "utfLen":I
    .restart local v3    # "tooBigString":Z
    :goto_2
    if-nez v3, :cond_5

    goto :goto_3

    .line 221
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Too big string"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 224
    .end local v1    # "strLen":I
    .end local v3    # "tooBigString":Z
    :cond_6
    :goto_3
    invoke-virtual {p0, v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->setConstantData(ILjava/lang/Object;)V

    .line 225
    iget-object v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 226
    int-to-short v1, v0

    return v1
.end method

.method getConstantData(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 376
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantData:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/UintMap;->getObject(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getConstantType(I)B
    .locals 2
    .param p1, "index"    # I

    .line 386
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPoolTypes:Lcom/trendmicro/hippo/UintMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method getUtfEncodingLimit(Ljava/lang/String;II)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 152
    sub-int v0, p3, p2

    mul-int/lit8 v0, v0, 0x3

    const v1, 0xffff

    if-gt v0, v1, :cond_0

    .line 153
    return p3

    .line 155
    :cond_0
    const v0, 0xffff

    .line 156
    .local v0, "limit":I
    move v1, p2

    .local v1, "i":I
    :goto_0
    if-eq v1, p3, :cond_4

    .line 157
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 158
    .local v2, "c":I
    if-eqz v2, :cond_1

    const/16 v3, 0x7f

    if-gt v2, v3, :cond_1

    .line 159
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 160
    :cond_1
    const/16 v3, 0x7ff

    if-ge v2, v3, :cond_2

    .line 161
    add-int/lit8 v0, v0, -0x2

    goto :goto_1

    .line 163
    :cond_2
    add-int/lit8 v0, v0, -0x3

    .line 165
    :goto_1
    if-gez v0, :cond_3

    .line 166
    return v1

    .line 156
    .end local v2    # "c":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    .end local v1    # "i":I
    :cond_4
    return p3
.end method

.method getWriteSize()I
    .locals 1

    .line 49
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method isUnderUtfEncodingLimit(Ljava/lang/String;)Z
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 137
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 138
    .local v0, "strLen":I
    mul-int/lit8 v1, v0, 0x3

    const/4 v2, 0x1

    const v3, 0xffff

    if-gt v1, v3, :cond_0

    .line 139
    return v2

    .line 140
    :cond_0
    const/4 v1, 0x0

    if-le v0, v3, :cond_1

    .line 141
    return v1

    .line 143
    :cond_1
    invoke-virtual {p0, p1, v1, v0}, Lcom/trendmicro/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v3

    if-ne v0, v3, :cond_2

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    return v2
.end method

.method setConstantData(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .line 381
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsConstantData:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/UintMap;->put(ILjava/lang/Object;)V

    .line 382
    return-void
.end method

.method write([BI)I
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .line 41
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTopIndex:I

    int-to-short v0, v0

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 42
    iget-object v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsPool:[B

    iget v1, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    iget v0, p0, Lcom/trendmicro/classfile/ConstantPool;->itsTop:I

    add-int/2addr p2, v0

    .line 44
    return p2
.end method
