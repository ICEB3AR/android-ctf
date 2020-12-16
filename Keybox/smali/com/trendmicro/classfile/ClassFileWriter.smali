.class public Lcom/trendmicro/classfile/ClassFileWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;,
        Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;,
        Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;,
        Lcom/trendmicro/classfile/ClassFileWriter$MHandle;
    }
.end annotation


# static fields
.field public static final ACC_ABSTRACT:S = 0x400s

.field public static final ACC_FINAL:S = 0x10s

.field public static final ACC_NATIVE:S = 0x100s

.field public static final ACC_PRIVATE:S = 0x2s

.field public static final ACC_PROTECTED:S = 0x4s

.field public static final ACC_PUBLIC:S = 0x1s

.field public static final ACC_STATIC:S = 0x8s

.field public static final ACC_SUPER:S = 0x20s

.field public static final ACC_SYNCHRONIZED:S = 0x20s

.field public static final ACC_TRANSIENT:S = 0x80s

.field public static final ACC_VOLATILE:S = 0x40s

.field private static final DEBUGCODE:Z = false

.field private static final DEBUGLABELS:Z = false

.field private static final DEBUGSTACK:Z = false

.field private static final ExceptionTableSize:I = 0x4

.field private static final FileHeaderConstant:I = -0x35014542

.field private static final GenerateStackMap:Z

.field private static final LineNumberTableSize:I = 0x10

.field private static final MIN_FIXUP_TABLE_SIZE:I = 0x28

.field private static final MIN_LABEL_TABLE_SIZE:I = 0x20

.field private static final MajorVersion:I

.field private static final MinorVersion:I

.field private static final SuperBlockStartsSize:I = 0x4


# instance fields
.field private generatedClassName:Ljava/lang/String;

.field private itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

.field private itsBootstrapMethodsLength:I

.field private itsCodeBuffer:[B

.field private itsCodeBufferTop:I

.field private itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

.field private itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

.field private itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

.field private itsExceptionTableTop:I

.field private itsFields:Lcom/trendmicro/hippo/ObjArray;

.field private itsFixupTable:[J

.field private itsFixupTableTop:I

.field private itsFlags:S

.field private itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

.field private itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

.field private itsLabelTable:[I

.field private itsLabelTableTop:I

.field private itsLineNumberTable:[I

.field private itsLineNumberTableTop:I

.field private itsMaxLocals:S

.field private itsMaxStack:S

.field private itsMethods:Lcom/trendmicro/hippo/ObjArray;

.field private itsSourceFileNameIndex:S

.field private itsStackTop:S

.field private itsSuperBlockStarts:[I

.field private itsSuperBlockStartsTop:I

.field private itsSuperClassIndex:S

.field private itsThisClassIndex:S

.field private itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

.field private tmpCharBuffer:[C


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4419
    const/4 v0, 0x0

    .line 4420
    .local v0, "is":Ljava/io/InputStream;
    const/16 v1, 0x30

    .local v1, "major":I
    const/4 v2, 0x0

    .line 4422
    .local v2, "minor":I
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v5, 0x32

    :try_start_0
    const-class v6, Lcom/trendmicro/classfile/ClassFileWriter;

    const-string v7, "ClassFileWriter.class"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    move-object v0, v6

    .line 4423
    if-nez v0, :cond_0

    .line 4424
    const-string v6, "com/trendmicro/classfile/ClassFileWriter.class"

    invoke-static {v6}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    move-object v0, v6

    .line 4427
    :cond_0
    const/16 v6, 0x8

    new-array v7, v6, [B

    .line 4430
    .local v7, "header":[B
    const/4 v8, 0x0

    .line 4431
    .local v8, "read":I
    :goto_0
    if-ge v8, v6, :cond_2

    .line 4432
    rsub-int/lit8 v9, v8, 0x8

    invoke-virtual {v0, v7, v8, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    .line 4433
    .local v9, "c":I
    if-ltz v9, :cond_1

    .line 4435
    add-int/2addr v8, v9

    .line 4436
    .end local v9    # "c":I
    goto :goto_0

    .line 4434
    .restart local v9    # "c":I
    :cond_1
    new-instance v6, Ljava/io/IOException;

    invoke-direct {v6}, Ljava/io/IOException;-><init>()V

    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "major":I
    .end local v2    # "minor":I
    throw v6

    .line 4437
    .end local v9    # "c":I
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v1    # "major":I
    .restart local v2    # "minor":I
    :cond_2
    const/4 v9, 0x4

    aget-byte v9, v7, v9

    shl-int/2addr v9, v6

    const/4 v10, 0x5

    aget-byte v10, v7, v10

    and-int/lit16 v10, v10, 0xff

    or-int v2, v9, v10

    .line 4438
    const/4 v9, 0x6

    aget-byte v9, v7, v9

    shl-int/lit8 v6, v9, 0x8

    const/4 v9, 0x7

    aget-byte v9, v7, v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit16 v9, v9, 0xff

    or-int v1, v6, v9

    .line 4442
    .end local v7    # "header":[B
    .end local v8    # "read":I
    sput v2, Lcom/trendmicro/classfile/ClassFileWriter;->MinorVersion:I

    .line 4443
    sput v1, Lcom/trendmicro/classfile/ClassFileWriter;->MajorVersion:I

    .line 4444
    if-lt v1, v5, :cond_3

    goto :goto_1

    :cond_3
    move v3, v4

    :goto_1
    sput-boolean v3, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4445
    if-eqz v0, :cond_7

    .line 4447
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_5

    .line 4442
    :catchall_0
    move-exception v6

    sput v2, Lcom/trendmicro/classfile/ClassFileWriter;->MinorVersion:I

    .line 4443
    sput v1, Lcom/trendmicro/classfile/ClassFileWriter;->MajorVersion:I

    .line 4444
    if-lt v1, v5, :cond_4

    goto :goto_2

    :cond_4
    move v3, v4

    :goto_2
    sput-boolean v3, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4445
    if-eqz v0, :cond_5

    .line 4447
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 4449
    goto :goto_3

    .line 4448
    :catch_0
    move-exception v3

    .line 4451
    :cond_5
    :goto_3
    throw v6

    .line 4439
    :catch_1
    move-exception v6

    .line 4442
    sput v2, Lcom/trendmicro/classfile/ClassFileWriter;->MinorVersion:I

    .line 4443
    sput v1, Lcom/trendmicro/classfile/ClassFileWriter;->MajorVersion:I

    .line 4444
    if-lt v1, v5, :cond_6

    goto :goto_4

    :cond_6
    move v3, v4

    :goto_4
    sput-boolean v3, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    .line 4445
    if-eqz v0, :cond_7

    .line 4447
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 4449
    :goto_5
    goto :goto_6

    .line 4448
    :catch_2
    move-exception v3

    goto :goto_5

    .line 4452
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "major":I
    .end local v2    # "minor":I
    :cond_7
    :goto_6
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "superClassName"    # Ljava/lang/String;
    .param p3, "sourceFileName"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4391
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 4392
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4399
    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    .line 4532
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 4543
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    .line 4544
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    .line 4545
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    .line 4562
    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethodsLength:I

    .line 4564
    const/16 v0, 0x40

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->tmpCharBuffer:[C

    .line 51
    iput-object p1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->generatedClassName:Ljava/lang/String;

    .line 52
    new-instance v0, Lcom/trendmicro/classfile/ConstantPool;

    invoke-direct {v0, p0}, Lcom/trendmicro/classfile/ConstantPool;-><init>(Lcom/trendmicro/classfile/ClassFileWriter;)V

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 53
    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsThisClassIndex:S

    .line 54
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p2}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperClassIndex:S

    .line 55
    if-eqz p3, :cond_0

    .line 56
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p3}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    .line 60
    :cond_0
    const/16 v0, 0x21

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFlags:S

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    return v0
.end method

.method static synthetic access$100(Lcom/trendmicro/classfile/ClassFileWriter;)[I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->createInitialLocals()[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 26
    invoke-static {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->sizeOfParameters(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/trendmicro/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsThisClassIndex:S

    return v0
.end method

.method static synthetic access$1200(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .line 26
    invoke-static {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(IZ)I
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # Z

    .line 26
    invoke-static {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->opcodeLength(IZ)I

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/trendmicro/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxLocals:S

    return v0
.end method

.method static synthetic access$1500(Lcom/trendmicro/classfile/ClassFileWriter;)S
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    return v0
.end method

.method static synthetic access$200(Lcom/trendmicro/classfile/ClassFileWriter;)[I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    return-object v0
.end method

.method static synthetic access$300(Lcom/trendmicro/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    return v0
.end method

.method static synthetic access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    return v0
.end method

.method static synthetic access$410(Lcom/trendmicro/classfile/ClassFileWriter;)I
    .locals 2
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    return v0
.end method

.method static synthetic access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    return-object v0
.end method

.method static synthetic access$600(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/hippo/UintMap;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    return-object v0
.end method

.method static synthetic access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    return-object v0
.end method

.method static synthetic access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 26
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    return-object v0
.end method

.method static synthetic access$900(I)C
    .locals 1
    .param p0, "x0"    # I

    .line 26
    invoke-static {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->arrayTypeToName(I)C

    move-result v0

    return v0
.end method

.method private addLabelFixup(II)V
    .locals 6
    .param p1, "label"    # I
    .param p2, "fixupSite"    # I

    .line 1276
    if-gez p1, :cond_4

    .line 1278
    const v0, 0x7fffffff

    and-int/2addr p1, v0

    .line 1279
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-ge p1, v0, :cond_3

    .line 1281
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1282
    .local v0, "top":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    if-eqz v1, :cond_0

    array-length v1, v1

    if-ne v0, v1, :cond_2

    .line 1283
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    if-nez v1, :cond_1

    .line 1284
    const/16 v1, 0x28

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    goto :goto_0

    .line 1286
    :cond_1
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [J

    .line 1287
    .local v2, "tmp":[J
    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1288
    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    .line 1291
    .end local v2    # "tmp":[J
    :cond_2
    :goto_0
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1292
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    int-to-long v2, p1

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    int-to-long v4, p2

    or-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 1293
    return-void

    .line 1280
    .end local v0    # "top":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1277
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label, no biscuit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private addReservedCodeSpace(I)I
    .locals 6
    .param p1, "size"    # I

    .line 1360
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    if-eqz v0, :cond_2

    .line 1362
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 1363
    .local v0, "oldTop":I
    add-int v1, v0, p1

    .line 1364
    .local v1, "newTop":I
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    array-length v3, v2

    if-le v1, v3, :cond_1

    .line 1365
    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    .line 1366
    .local v2, "newSize":I
    if-le v1, v2, :cond_0

    .line 1367
    move v2, v1

    .line 1369
    :cond_0
    new-array v3, v2, [B

    .line 1370
    .local v3, "tmp":[B
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    const/4 v5, 0x0

    invoke-static {v4, v5, v3, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1371
    iput-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 1373
    .end local v2    # "newSize":I
    .end local v3    # "tmp":[B
    :cond_1
    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 1374
    return v0

    .line 1361
    .end local v0    # "oldTop":I
    .end local v1    # "newTop":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No method to add to"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private addSuperBlockStart(I)V
    .locals 4
    .param p1, "pc"    # I

    .line 4345
    sget-boolean v0, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v0, :cond_2

    .line 4346
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    if-nez v0, :cond_0

    .line 4347
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    goto :goto_0

    .line 4348
    :cond_0
    array-length v1, v0

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    if-ne v1, v2, :cond_1

    .line 4349
    mul-int/lit8 v1, v2, 0x2

    new-array v1, v1, [I

    .line 4350
    .local v1, "tmp":[I
    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4352
    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 4354
    .end local v1    # "tmp":[I
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    aput p1, v0, v1

    .line 4356
    :cond_2
    return-void
.end method

.method private addToCodeBuffer(I)V
    .locals 3
    .param p1, "b"    # I

    .line 1350
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v0

    .line 1351
    .local v0, "N":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    int-to-byte v2, p1

    aput-byte v2, v1, v0

    .line 1352
    return-void
.end method

.method private addToCodeInt16(I)V
    .locals 2
    .param p1, "value"    # I

    .line 1355
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v0

    .line 1356
    .local v0, "N":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p1, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    .line 1357
    return-void
.end method

.method private static arrayTypeToName(I)C
    .locals 2
    .param p0, "type"    # I

    .line 2612
    packed-switch p0, :pswitch_data_0

    .line 2630
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad operand"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2628
    :pswitch_0
    const/16 v0, 0x4a

    return v0

    .line 2626
    :pswitch_1
    const/16 v0, 0x49

    return v0

    .line 2624
    :pswitch_2
    const/16 v0, 0x53

    return v0

    .line 2622
    :pswitch_3
    const/16 v0, 0x42

    return v0

    .line 2620
    :pswitch_4
    const/16 v0, 0x44

    return v0

    .line 2618
    :pswitch_5
    const/16 v0, 0x46

    return v0

    .line 2616
    :pswitch_6
    const/16 v0, 0x43

    return v0

    .line 2614
    :pswitch_7
    const/16 v0, 0x5a

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static badStack(I)V
    .locals 2
    .param p0, "value"    # I

    .line 2867
    if-gez p0, :cond_0

    .line 2868
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Stack underflow: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "s":Ljava/lang/String;
    goto :goto_0

    .line 2870
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Too big stack: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2872
    .restart local v0    # "s":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static bytecodeStr(I)Ljava/lang/String;
    .locals 1
    .param p0, "code"    # I

    .line 4324
    const-string v0, ""

    return-object v0
.end method

.method private static classDescriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "descriptor"    # Ljava/lang/String;

    .line 2640
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static classNameToSignature(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "name"    # Ljava/lang/String;

    .line 114
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 115
    .local v0, "nameLength":I
    add-int/lit8 v1, v0, 0x1

    .line 116
    .local v1, "colonPos":I
    add-int/lit8 v2, v1, 0x1

    new-array v2, v2, [C

    .line 117
    .local v2, "buf":[C
    const/16 v3, 0x4c

    const/4 v4, 0x0

    aput-char v3, v2, v4

    .line 118
    const/16 v3, 0x3b

    aput-char v3, v2, v1

    .line 119
    const/4 v3, 0x1

    invoke-virtual {p0, v4, v0, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 120
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    if-eq v3, v1, :cond_1

    .line 121
    aget-char v5, v2, v3

    const/16 v6, 0x2e

    if-ne v5, v6, :cond_0

    .line 122
    const/16 v5, 0x2f

    aput-char v5, v2, v3

    .line 120
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 125
    .end local v3    # "i":I
    :cond_1
    new-instance v3, Ljava/lang/String;

    add-int/lit8 v5, v1, 0x1

    invoke-direct {v3, v2, v4, v5}, Ljava/lang/String;-><init>([CII)V

    return-object v3
.end method

.method private createInitialLocals()[I
    .locals 10

    .line 2676
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxLocals:S

    new-array v0, v0, [I

    .line 2677
    .local v0, "initialLocals":[I
    const/4 v1, 0x0

    .line 2682
    .local v1, "localsTop":I
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileMethod;->getFlags()S

    move-result v2

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_1

    .line 2683
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileMethod;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "<init>"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2684
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "localsTop":I
    .local v2, "localsTop":I
    const/4 v3, 0x6

    aput v3, v0, v1

    move v1, v2

    goto :goto_0

    .line 2686
    .end local v2    # "localsTop":I
    .restart local v1    # "localsTop":I
    :cond_0
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "localsTop":I
    .restart local v2    # "localsTop":I
    iget-short v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsThisClassIndex:S

    invoke-static {v3}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v3

    aput v3, v0, v1

    move v1, v2

    .line 2691
    .end local v2    # "localsTop":I
    .restart local v1    # "localsTop":I
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileMethod;->getType()Ljava/lang/String;

    move-result-object v2

    .line 2692
    .local v2, "type":Ljava/lang/String;
    const/16 v3, 0x28

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 2693
    .local v3, "lParenIndex":I
    const/16 v4, 0x29

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 2694
    .local v4, "rParenIndex":I
    if-nez v3, :cond_7

    if-ltz v4, :cond_7

    .line 2697
    add-int/lit8 v5, v3, 0x1

    .line 2698
    .local v5, "start":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 2699
    .local v6, "paramType":Ljava/lang/StringBuilder;
    :goto_1
    if-ge v5, v4, :cond_6

    .line 2700
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x46

    if-eq v7, v8, :cond_4

    const/16 v8, 0x4c

    if-eq v7, v8, :cond_3

    const/16 v8, 0x53

    if-eq v7, v8, :cond_4

    const/16 v8, 0x49

    if-eq v7, v8, :cond_4

    const/16 v8, 0x4a

    if-eq v7, v8, :cond_4

    const/16 v8, 0x5a

    if-eq v7, v8, :cond_4

    const/16 v8, 0x5b

    if-eq v7, v8, :cond_2

    packed-switch v7, :pswitch_data_0

    goto :goto_2

    .line 2719
    :cond_2
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2720
    add-int/lit8 v5, v5, 0x1

    .line 2721
    goto :goto_1

    .line 2713
    :cond_3
    const/16 v7, 0x3b

    invoke-virtual {v2, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    .line 2714
    .local v7, "end":I
    invoke-virtual {v2, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 2715
    .local v8, "name":Ljava/lang/String;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2716
    move v5, v7

    .line 2717
    goto :goto_2

    .line 2709
    .end local v7    # "end":I
    .end local v8    # "name":Ljava/lang/String;
    :cond_4
    :pswitch_0
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2710
    add-int/lit8 v5, v5, 0x1

    .line 2711
    nop

    .line 2723
    :goto_2
    nop

    .line 2724
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2725
    .local v7, "internalType":Ljava/lang/String;
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-static {v7, v8}, Lcom/trendmicro/classfile/TypeInfo;->fromType(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v8

    .line 2726
    .local v8, "typeInfo":I
    add-int/lit8 v9, v1, 0x1

    .end local v1    # "localsTop":I
    .local v9, "localsTop":I
    aput v8, v0, v1

    .line 2727
    invoke-static {v8}, Lcom/trendmicro/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2728
    add-int/lit8 v9, v9, 0x1

    move v1, v9

    goto :goto_3

    .line 2727
    :cond_5
    move v1, v9

    .line 2730
    .end local v9    # "localsTop":I
    .restart local v1    # "localsTop":I
    :goto_3
    const/4 v9, 0x0

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 2731
    .end local v7    # "internalType":Ljava/lang/String;
    .end local v8    # "typeInfo":I
    goto :goto_1

    .line 2732
    :cond_6
    return-object v0

    .line 2695
    .end local v5    # "start":I
    .end local v6    # "paramType":Ljava/lang/StringBuilder;
    :cond_7
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "bad method type"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    nop

    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static descriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "descriptor"    # Ljava/lang/String;

    .line 2649
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x46

    if-eq v0, v1, :cond_1

    const/16 v1, 0x4c

    if-eq v0, v1, :cond_0

    const/16 v1, 0x53

    if-eq v0, v1, :cond_1

    const/16 v1, 0x56

    if-eq v0, v1, :cond_1

    const/16 v1, 0x49

    if-eq v0, v1, :cond_1

    const/16 v1, 0x4a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x5b

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 2664
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad descriptor:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2662
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->classDescriptorToInternalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2660
    :cond_1
    :pswitch_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private finalizeSuperBlockStarts()V
    .locals 5

    .line 4365
    sget-boolean v0, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v0, :cond_4

    .line 4366
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    if-ge v0, v1, :cond_0

    .line 4367
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    aget-object v1, v1, v0

    .line 4368
    .local v1, "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget v2, v1, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v2

    .line 4369
    .local v2, "handlerPC":I
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 4366
    .end local v1    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v2    # "handlerPC":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 4371
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->sort([III)V

    .line 4372
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    aget v0, v0, v2

    .line 4373
    .local v0, "prev":I
    const/4 v1, 0x1

    .line 4374
    .local v1, "copyTo":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    if-ge v2, v3, :cond_3

    .line 4375
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    aget v4, v3, v2

    .line 4376
    .local v4, "curr":I
    if-eq v0, v4, :cond_2

    .line 4377
    if-eq v1, v2, :cond_1

    .line 4378
    aput v4, v3, v1

    .line 4380
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 4381
    move v0, v4

    .line 4374
    .end local v4    # "curr":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4384
    .end local v2    # "i":I
    :cond_3
    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4385
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    iget v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    if-ne v2, v3, :cond_4

    .line 4386
    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 4389
    .end local v0    # "prev":I
    .end local v1    # "copyTo":I
    :cond_4
    return-void
.end method

.method private fixLabelGotos()V
    .locals 10

    .line 1296
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    .line 1297
    .local v0, "codeBuffer":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTableTop:I

    if-ge v1, v2, :cond_2

    .line 1298
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTable:[J

    aget-wide v3, v2, v1

    .line 1299
    .local v3, "fixup":J
    const/16 v2, 0x20

    shr-long v5, v3, v2

    long-to-int v2, v5

    .line 1300
    .local v2, "label":I
    long-to-int v5, v3

    .line 1301
    .local v5, "fixupSite":I
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v6, v6, v2

    .line 1302
    .local v6, "pc":I
    const/4 v7, -0x1

    if-eq v6, v7, :cond_1

    .line 1307
    invoke-direct {p0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1308
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    add-int/lit8 v8, v5, -0x1

    invoke-virtual {v7, v6, v8}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 1309
    add-int/lit8 v7, v5, -0x1

    sub-int v7, v6, v7

    .line 1310
    .local v7, "offset":I
    int-to-short v8, v7

    if-ne v8, v7, :cond_0

    .line 1313
    shr-int/lit8 v8, v7, 0x8

    int-to-byte v8, v8

    aput-byte v8, v0, v5

    .line 1314
    add-int/lit8 v8, v5, 0x1

    int-to-byte v9, v7

    aput-byte v9, v0, v8

    .line 1297
    .end local v2    # "label":I
    .end local v3    # "fixup":J
    .end local v5    # "fixupSite":I
    .end local v6    # "pc":I
    .end local v7    # "offset":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1311
    .restart local v2    # "label":I
    .restart local v3    # "fixup":J
    .restart local v5    # "fixupSite":I
    .restart local v6    # "pc":I
    .restart local v7    # "offset":I
    :cond_0
    new-instance v8, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v9, "Program too complex: too big jump offset"

    invoke-direct {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1304
    .end local v7    # "offset":I
    :cond_1
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "unlocated label"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1316
    .end local v1    # "i":I
    .end local v2    # "label":I
    .end local v3    # "fixup":J
    .end local v5    # "fixupSite":I
    .end local v6    # "pc":I
    :cond_2
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 1317
    return-void
.end method

.method static getSlashedForm(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 106
    const/16 v0, 0x2e

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getWriteSize()I
    .locals 3

    .line 2748
    const/4 v0, 0x0

    .line 2750
    .local v0, "size":I
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v1, :cond_0

    .line 2751
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v2, "SourceFile"

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    .line 2754
    :cond_0
    add-int/lit8 v0, v0, 0x8

    .line 2755
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1}, Lcom/trendmicro/classfile/ConstantPool;->getWriteSize()I

    move-result v1

    add-int/2addr v0, v1

    .line 2756
    add-int/lit8 v0, v0, 0x2

    .line 2757
    add-int/lit8 v0, v0, 0x2

    .line 2758
    add-int/lit8 v0, v0, 0x2

    .line 2759
    add-int/lit8 v0, v0, 0x2

    .line 2760
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 2762
    add-int/lit8 v0, v0, 0x2

    .line 2763
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 2764
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/classfile/ClassFileField;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileField;->getWriteSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 2763
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2767
    .end local v1    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x2

    .line 2768
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 2769
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileMethod;->getWriteSize()I

    move-result v2

    add-int/2addr v0, v2

    .line 2768
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2772
    .end local v1    # "i":I
    :cond_2
    add-int/lit8 v0, v0, 0x2

    .line 2773
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v1, :cond_3

    .line 2774
    add-int/lit8 v0, v0, 0x2

    .line 2775
    add-int/lit8 v0, v0, 0x4

    .line 2776
    add-int/lit8 v0, v0, 0x2

    .line 2778
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v1, :cond_4

    .line 2779
    add-int/lit8 v0, v0, 0x2

    .line 2780
    add-int/lit8 v0, v0, 0x4

    .line 2781
    add-int/lit8 v0, v0, 0x2

    .line 2782
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethodsLength:I

    add-int/2addr v0, v1

    .line 2785
    :cond_4
    return v0
.end method

.method private static opcodeCount(I)I
    .locals 3
    .param p0, "opcode"    # I

    .line 3235
    const/16 v0, 0xfe

    if-eq p0, v0, :cond_0

    const/16 v0, 0xff

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 3447
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3445
    :pswitch_0
    const/4 v0, -0x1

    return v0

    .line 3441
    :pswitch_1
    const/4 v0, 0x2

    return v0

    .line 3437
    :pswitch_2
    const/4 v0, 0x1

    return v0

    .line 3387
    :cond_0
    :pswitch_3
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xbb
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static opcodeLength(IZ)I
    .locals 3
    .param p0, "opcode"    # I
    .param p1, "wide"    # Z

    .line 3006
    const/16 v0, 0xfe

    if-eq p0, v0, :cond_2

    const/16 v0, 0xff

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    const/4 v1, 0x2

    const/4 v2, 0x3

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 3228
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3214
    :pswitch_0
    const/4 v0, 0x4

    return v0

    .line 3220
    :pswitch_1
    return v0

    .line 3211
    :pswitch_2
    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    return v0

    .line 3174
    :pswitch_3
    if-eqz p1, :cond_1

    move v1, v2

    :cond_1
    return v1

    .line 3208
    :pswitch_4
    return v2

    .line 3162
    :pswitch_5
    return v1

    .line 3158
    :cond_2
    :pswitch_6
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_2
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xac
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_6
    .end packed-switch
.end method

.method static putInt16(I[BI)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "array"    # [B
    .param p2, "offset"    # I

    .line 2987
    add-int/lit8 v0, p2, 0x0

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2988
    add-int/lit8 v0, p2, 0x1

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 2989
    add-int/lit8 v0, p2, 0x2

    return v0
.end method

.method static putInt32(I[BI)I
    .locals 2
    .param p0, "value"    # I
    .param p1, "array"    # [B
    .param p2, "offset"    # I

    .line 2993
    add-int/lit8 v0, p2, 0x0

    ushr-int/lit8 v1, p0, 0x18

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2994
    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x10

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2995
    add-int/lit8 v0, p2, 0x2

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 2996
    add-int/lit8 v0, p2, 0x3

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 2997
    add-int/lit8 v0, p2, 0x4

    return v0
.end method

.method static putInt64(J[BI)I
    .locals 2
    .param p0, "value"    # J
    .param p2, "array"    # [B
    .param p3, "offset"    # I

    .line 2861
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    invoke-static {v0, p2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result p3

    .line 2862
    long-to-int v0, p0

    invoke-static {v0, p2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v0

    return v0
.end method

.method private static sizeOfParameters(Ljava/lang/String;)I
    .locals 16
    .param p0, "pString"    # Ljava/lang/String;

    .line 2884
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 2885
    .local v1, "length":I
    const/16 v2, 0x29

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 2886
    .local v2, "rightParenthesis":I
    const/4 v3, 0x3

    if-gt v3, v1, :cond_c

    const/4 v3, 0x0

    .line 2887
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x28

    if-ne v3, v4, :cond_c

    const/4 v3, 0x1

    if-gt v3, v2, :cond_c

    add-int/lit8 v4, v2, 0x1

    if-ge v4, v1, :cond_c

    .line 2889
    const/4 v4, 0x1

    .line 2890
    .local v4, "ok":Z
    const/4 v5, 0x1

    .line 2891
    .local v5, "index":I
    const/4 v6, 0x0

    .line 2892
    .local v6, "stackDiff":I
    const/4 v7, 0x0

    .line 2894
    .local v7, "count":I
    :goto_0
    const/16 v8, 0x5b

    const/16 v9, 0x5a

    const/16 v10, 0x4a

    const/16 v11, 0x49

    const/16 v12, 0x53

    const/16 v13, 0x4c

    const/16 v14, 0x46

    if-eq v5, v2, :cond_8

    .line 2895
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-eq v15, v14, :cond_7

    if-eq v15, v13, :cond_4

    if-eq v15, v12, :cond_7

    if-eq v15, v11, :cond_7

    if-eq v15, v10, :cond_3

    if-eq v15, v9, :cond_7

    if-eq v15, v8, :cond_0

    packed-switch v15, :pswitch_data_0

    .line 2897
    const/4 v4, 0x0

    .line 2898
    goto :goto_4

    .line 2914
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 2915
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    .line 2916
    .local v15, "c":I
    :goto_1
    if-ne v15, v8, :cond_1

    .line 2917
    add-int/lit8 v5, v5, 0x1

    .line 2918
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v15

    goto :goto_1

    .line 2920
    :cond_1
    if-eq v15, v14, :cond_2

    if-eq v15, v13, :cond_4

    if-eq v15, v12, :cond_2

    if-eq v15, v9, :cond_2

    if-eq v15, v11, :cond_2

    if-eq v15, v10, :cond_2

    packed-switch v15, :pswitch_data_1

    .line 2922
    const/4 v4, 0x0

    .line 2923
    goto :goto_4

    .line 2932
    :cond_2
    :pswitch_0
    add-int/lit8 v6, v6, -0x1

    .line 2933
    add-int/lit8 v7, v7, 0x1

    .line 2934
    add-int/lit8 v5, v5, 0x1

    .line 2935
    goto :goto_0

    .line 2901
    .end local v15    # "c":I
    :cond_3
    :pswitch_1
    add-int/lit8 v6, v6, -0x1

    goto :goto_3

    .line 2941
    :cond_4
    add-int/lit8 v6, v6, -0x1

    .line 2942
    add-int/lit8 v7, v7, 0x1

    .line 2943
    add-int/2addr v5, v3

    .line 2944
    const/16 v15, 0x3b

    invoke-virtual {v0, v15, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v15

    .line 2945
    .local v15, "semicolon":I
    add-int/lit8 v3, v5, 0x1

    if-gt v3, v15, :cond_6

    if-lt v15, v2, :cond_5

    goto :goto_2

    .line 2950
    :cond_5
    add-int/lit8 v5, v15, 0x1

    .line 2951
    const/4 v3, 0x1

    goto :goto_0

    .line 2947
    :cond_6
    :goto_2
    const/4 v4, 0x0

    .line 2948
    goto :goto_4

    .line 2909
    .end local v15    # "semicolon":I
    :cond_7
    :goto_3
    :pswitch_2
    add-int/lit8 v6, v6, -0x1

    .line 2910
    add-int/lit8 v7, v7, 0x1

    .line 2911
    add-int/lit8 v5, v5, 0x1

    .line 2912
    const/4 v3, 0x1

    goto :goto_0

    .line 2955
    :cond_8
    :goto_4
    if-eqz v4, :cond_c

    .line 2956
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v14, :cond_a

    if-eq v3, v13, :cond_a

    if-eq v3, v12, :cond_a

    const/16 v12, 0x56

    if-eq v3, v12, :cond_b

    if-eq v3, v11, :cond_a

    if-eq v3, v10, :cond_9

    if-eq v3, v9, :cond_a

    if-eq v3, v8, :cond_a

    packed-switch v3, :pswitch_data_2

    .line 2958
    const/4 v4, 0x0

    .line 2959
    goto :goto_5

    .line 2962
    :cond_9
    :pswitch_3
    add-int/lit8 v6, v6, 0x1

    .line 2972
    :cond_a
    :pswitch_4
    const/4 v3, 0x1

    add-int/2addr v6, v3

    .line 2977
    :cond_b
    :goto_5
    if-eqz v4, :cond_c

    .line 2978
    shl-int/lit8 v3, v7, 0x10

    const v8, 0xffff

    and-int/2addr v8, v6

    or-int/2addr v3, v8

    return v3

    .line 2982
    .end local v4    # "ok":Z
    .end local v5    # "index":I
    .end local v6    # "stackDiff":I
    .end local v7    # "count":I
    :cond_c
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bad parameter signature: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :pswitch_data_0
    .packed-switch 0x42
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x42
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x42
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private static stackChange(I)I
    .locals 3
    .param p0, "opcode"    # I

    .line 3456
    const/16 v0, 0xfe

    if-eq p0, v0, :cond_0

    const/16 v0, 0xff

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    .line 3676
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad opcode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3459
    :pswitch_0
    const/4 v0, -0x4

    return v0

    .line 3470
    :pswitch_1
    const/4 v0, -0x3

    return v0

    .line 3506
    :pswitch_2
    const/4 v0, -0x2

    return v0

    .line 3576
    :pswitch_3
    const/4 v0, -0x1

    return v0

    .line 3674
    :pswitch_4
    const/4 v0, 0x2

    return v0

    .line 3654
    :pswitch_5
    const/4 v0, 0x1

    return v0

    .line 3611
    :cond_0
    :pswitch_6
    const/4 v0, 0x0

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_3
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_3
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private xop(III)V
    .locals 1
    .param p1, "shortOp"    # I
    .param p2, "op"    # I
    .param p3, "local"    # I

    .line 1111
    if-eqz p3, :cond_3

    const/4 v0, 0x1

    if-eq p3, v0, :cond_2

    const/4 v0, 0x2

    if-eq p3, v0, :cond_1

    const/4 v0, 0x3

    if-eq p3, v0, :cond_0

    .line 1125
    invoke-virtual {p0, p2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 1122
    :cond_0
    add-int/lit8 v0, p1, 0x3

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1123
    goto :goto_0

    .line 1119
    :cond_1
    add-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1120
    goto :goto_0

    .line 1116
    :cond_2
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1117
    goto :goto_0

    .line 1113
    :cond_3
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1114
    nop

    .line 1127
    :goto_0
    return-void
.end method


# virtual methods
.method public acquireLabel()I
    .locals 4

    .line 1226
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 1227
    .local v0, "top":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    if-eqz v1, :cond_0

    array-length v1, v1

    if-ne v0, v1, :cond_2

    .line 1228
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    if-nez v1, :cond_1

    .line 1229
    const/16 v1, 0x20

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    goto :goto_0

    .line 1231
    :cond_1
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    .line 1232
    .local v2, "tmp":[I
    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1233
    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    .line 1236
    .end local v2    # "tmp":[I
    :cond_2
    :goto_0
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 1237
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    const/4 v2, -0x1

    aput v2, v1, v0

    .line 1238
    const/high16 v1, -0x80000000

    or-int/2addr v1, v0

    return v1
.end method

.method public add(I)V
    .locals 2
    .param p1, "theOpCode"    # I

    .line 426
    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->opcodeCount(I)I

    move-result v0

    if-nez v0, :cond_4

    .line 428
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 429
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 430
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 433
    :cond_1
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 434
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 435
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_2

    .line 436
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 441
    :cond_2
    const/16 v1, 0xbf

    if-ne p1, v1, :cond_3

    .line 442
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 444
    :cond_3
    return-void

    .line 427
    .end local v0    # "newStack":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unexpected operands"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public add(II)V
    .locals 5
    .param p1, "theOpCode"    # I
    .param p2, "theOperand"    # I

    .line 457
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 458
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 459
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 461
    :cond_1
    const/16 v1, 0xb4

    const/high16 v2, 0x10000

    if-eq p1, v1, :cond_11

    const/16 v1, 0xb5

    if-eq p1, v1, :cond_11

    const/16 v1, 0xbc

    const-string v3, "out of range index"

    const/16 v4, 0x100

    if-eq p1, v1, :cond_f

    const/16 v1, 0xc6

    if-eq p1, v1, :cond_a

    const/16 v1, 0xc7

    if-eq p1, v1, :cond_a

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    .line 592
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unexpected opcode for 1 operand"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 466
    :pswitch_0
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/lit8 v1, v1, 0x3

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    goto/16 :goto_2

    .line 579
    :pswitch_1
    if-ltz p2, :cond_3

    if-le v2, p2, :cond_3

    .line 581
    if-lt p2, v4, :cond_2

    .line 582
    const/16 v1, 0xc4

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 583
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 584
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto/16 :goto_5

    .line 586
    :cond_2
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 587
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 589
    goto/16 :goto_5

    .line 580
    :cond_3
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v2, "out of range variable"

    invoke-direct {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 551
    :pswitch_2
    if-ltz p2, :cond_7

    if-ge p2, v2, :cond_7

    .line 553
    const/16 v1, 0x13

    if-ge p2, v4, :cond_5

    if-eq p1, v1, :cond_5

    const/16 v2, 0x14

    if-ne p1, v2, :cond_4

    goto :goto_0

    .line 563
    :cond_4
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 564
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 566
    goto/16 :goto_5

    .line 556
    :cond_5
    :goto_0
    const/16 v2, 0x12

    if-ne p1, v2, :cond_6

    .line 557
    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_1

    .line 559
    :cond_6
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 561
    :goto_1
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto/16 :goto_5

    .line 552
    :cond_7
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    invoke-direct {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 527
    :pswitch_3
    int-to-short v1, p2

    if-ne v1, p2, :cond_8

    .line 529
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 530
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 531
    goto/16 :goto_5

    .line 528
    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range short"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 520
    :pswitch_4
    int-to-byte v1, p2

    if-ne v1, p2, :cond_9

    .line 522
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 523
    int-to-byte v1, p2

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 524
    goto/16 :goto_5

    .line 521
    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range byte"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 485
    :cond_a
    :goto_2
    :pswitch_5
    const/high16 v1, -0x80000000

    and-int v2, p2, v1

    if-eq v2, v1, :cond_c

    .line 486
    if-ltz p2, :cond_b

    const v2, 0xffff

    if-gt p2, v2, :cond_b

    goto :goto_3

    .line 487
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Bad label for branch"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 490
    :cond_c
    :goto_3
    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 491
    .local v2, "branchPC":I
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 492
    and-int v3, p2, v1

    if-eq v3, v1, :cond_d

    .line 494
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 495
    add-int v1, p2, v2

    .line 496
    .local v1, "target":I
    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 497
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v3, v1, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 498
    .end local v1    # "target":I
    goto :goto_4

    .line 499
    :cond_d
    invoke-virtual {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v1

    .line 506
    .local v1, "targetPC":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_e

    .line 507
    sub-int v3, v1, v2

    .line 508
    .local v3, "offset":I
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 509
    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 510
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v4, v1, v2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 511
    .end local v3    # "offset":I
    goto :goto_4

    .line 512
    :cond_e
    add-int/lit8 v3, v2, 0x1

    invoke-direct {p0, p2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addLabelFixup(II)V

    .line 513
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 517
    .end local v1    # "targetPC":I
    .end local v2    # "branchPC":I
    :goto_4
    goto :goto_5

    .line 534
    :cond_f
    if-ltz p2, :cond_10

    if-ge p2, v4, :cond_10

    .line 536
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 537
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 538
    goto :goto_5

    .line 535
    :cond_10
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 542
    :cond_11
    if-ltz p2, :cond_13

    if-ge p2, v2, :cond_13

    .line 544
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 545
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 546
    nop

    .line 596
    :goto_5
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 597
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_12

    .line 598
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 603
    :cond_12
    return-void

    .line 543
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range field"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x36
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x99
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_5
        :pswitch_1
    .end packed-switch
.end method

.method public add(III)V
    .locals 3
    .param p1, "theOpCode"    # I
    .param p2, "theOperand1"    # I
    .param p3, "theOperand2"    # I

    .line 685
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 686
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 687
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 689
    :cond_1
    const/high16 v1, 0x10000

    const/16 v2, 0x84

    if-ne p1, v2, :cond_6

    .line 690
    if-ltz p2, :cond_5

    if-le v1, p2, :cond_5

    .line 692
    if-ltz p3, :cond_4

    if-le v1, p3, :cond_4

    .line 695
    const/16 v1, 0xff

    if-gt p2, v1, :cond_3

    const/16 v1, -0x80

    if-lt p3, v1, :cond_3

    const/16 v1, 0x7f

    if-le p3, v1, :cond_2

    goto :goto_0

    .line 701
    :cond_2
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 702
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 703
    invoke-direct {p0, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    goto :goto_1

    .line 696
    :cond_3
    :goto_0
    const/16 v1, 0xc4

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 697
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 698
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 699
    invoke-direct {p0, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    goto :goto_1

    .line 693
    :cond_4
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v2, "out of range increment"

    invoke-direct {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 691
    :cond_5
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v2, "out of range variable"

    invoke-direct {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 705
    :cond_6
    const/16 v2, 0xc5

    if-ne p1, v2, :cond_a

    .line 706
    if-ltz p2, :cond_9

    if-ge p2, v1, :cond_9

    .line 708
    if-ltz p3, :cond_8

    const/16 v1, 0x100

    if-ge p3, v1, :cond_8

    .line 711
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 712
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 713
    invoke-direct {p0, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 718
    :goto_1
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 719
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_7

    .line 720
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 726
    :cond_7
    return-void

    .line 709
    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range dimensions"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 707
    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "out of range index"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 715
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unexpected opcode for 2 operands"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public add(ILjava/lang/String;)V
    .locals 3
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;

    .line 733
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 734
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 735
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 736
    :cond_1
    const/16 v1, 0xbb

    if-eq p1, v1, :cond_3

    const/16 v1, 0xbd

    if-eq p1, v1, :cond_3

    const/16 v1, 0xc0

    if-eq p1, v1, :cond_3

    const/16 v1, 0xc1

    if-ne p1, v1, :cond_2

    goto :goto_0

    .line 748
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad opcode for class reference"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 741
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v1

    .line 742
    .local v1, "classIndex":S
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 743
    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 745
    .end local v1    # "classIndex":S
    nop

    .line 751
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 752
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_4

    .line 753
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 758
    :cond_4
    return-void
.end method

.method public add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "fieldType"    # Ljava/lang/String;

    .line 767
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 768
    .local v0, "newStack":I
    const/4 v1, 0x0

    invoke-virtual {p4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 769
    .local v1, "fieldTypeChar":C
    const/16 v2, 0x4a

    if-eq v1, v2, :cond_1

    const/16 v2, 0x44

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 770
    :cond_0
    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x2

    .line 771
    .local v2, "fieldSize":I
    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 781
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "bad opcode for field reference"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 778
    :pswitch_0
    sub-int/2addr v0, v2

    .line 779
    goto :goto_2

    .line 774
    :pswitch_1
    add-int/2addr v0, v2

    .line 775
    nop

    .line 784
    :goto_2
    if-ltz v0, :cond_2

    const/16 v3, 0x7fff

    if-ge v3, v0, :cond_3

    .line 785
    :cond_2
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 786
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v3, p2, p3, p4}, Lcom/trendmicro/classfile/ConstantPool;->addFieldRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v3

    .line 788
    .local v3, "fieldRefIndex":S
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 789
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 791
    int-to-short v4, v0

    iput-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 792
    iget-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v4, :cond_4

    .line 793
    int-to-short v4, v0

    iput-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 798
    :cond_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xb2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public addALoad(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1100
    const/16 v0, 0x2a

    const/16 v1, 0x19

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1101
    return-void
.end method

.method public addAStore(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1055
    const/16 v0, 0x4b

    const/16 v1, 0x3a

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1056
    return-void
.end method

.method public addDLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1091
    const/16 v0, 0x26

    const/16 v1, 0x18

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1092
    return-void
.end method

.method public addDStore(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1046
    const/16 v0, 0x47

    const/16 v1, 0x39

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1047
    return-void
.end method

.method public addExceptionHandler(IIILjava/lang/String;)V
    .locals 6
    .param p1, "startLabel"    # I
    .param p2, "endLabel"    # I
    .param p3, "handlerLabel"    # I
    .param p4, "catchClassName"    # Ljava/lang/String;

    .line 1379
    const/high16 v0, -0x80000000

    and-int v1, p1, v0

    if-ne v1, v0, :cond_5

    .line 1381
    and-int v1, p2, v0

    if-ne v1, v0, :cond_4

    .line 1383
    and-int v1, p3, v0

    if-ne v1, v0, :cond_3

    .line 1391
    const/4 v0, 0x0

    if-nez p4, :cond_0

    .line 1392
    move v1, v0

    goto :goto_0

    .line 1393
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p4}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v1

    :goto_0
    nop

    .line 1394
    .local v1, "catch_type_index":S
    new-instance v2, Lcom/trendmicro/classfile/ExceptionTableEntry;

    invoke-direct {v2, p1, p2, p3, v1}, Lcom/trendmicro/classfile/ExceptionTableEntry;-><init>(IIIS)V

    .line 1399
    .local v2, "newEntry":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 1400
    .local v3, "N":I
    if-nez v3, :cond_1

    .line 1401
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/trendmicro/classfile/ExceptionTableEntry;

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    goto :goto_1

    .line 1402
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    array-length v5, v4

    if-ne v3, v5, :cond_2

    .line 1403
    mul-int/lit8 v5, v3, 0x2

    new-array v5, v5, [Lcom/trendmicro/classfile/ExceptionTableEntry;

    .line 1404
    .local v5, "tmp":[Lcom/trendmicro/classfile/ExceptionTableEntry;
    invoke-static {v4, v0, v5, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1405
    iput-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    .line 1407
    .end local v5    # "tmp":[Lcom/trendmicro/classfile/ExceptionTableEntry;
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    aput-object v2, v0, v3

    .line 1408
    add-int/lit8 v0, v3, 0x1

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 1410
    return-void

    .line 1384
    .end local v1    # "catch_type_index":S
    .end local v2    # "newEntry":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v3    # "N":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad handlerLabel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1382
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad endLabel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1380
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad startLabel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addFLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1082
    const/16 v0, 0x22

    const/16 v1, 0x17

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1083
    return-void
.end method

.method public addFStore(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1037
    const/16 v0, 0x43

    const/16 v1, 0x38

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1038
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;S)V
    .locals 4
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S

    .line 136
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 137
    .local v0, "fieldNameIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 138
    .local v1, "typeIndex":S
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    new-instance v3, Lcom/trendmicro/classfile/ClassFileField;

    invoke-direct {v3, v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileField;-><init>(SSS)V

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 139
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SD)V
    .locals 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # D

    .line 193
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 194
    .local v0, "fieldNameIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 195
    .local v1, "typeIndex":S
    new-instance v2, Lcom/trendmicro/classfile/ClassFileField;

    invoke-direct {v2, v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileField;-><init>(SSS)V

    .line 197
    .local v2, "field":Lcom/trendmicro/classfile/ClassFileField;
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 200
    invoke-virtual {v4, p4, p5}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(D)I

    move-result v4

    .line 197
    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-virtual {v2, v3, v5, v6, v4}, Lcom/trendmicro/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 201
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 202
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SI)V
    .locals 6
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # I

    .line 151
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 152
    .local v0, "fieldNameIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 153
    .local v1, "typeIndex":S
    new-instance v2, Lcom/trendmicro/classfile/ClassFileField;

    invoke-direct {v2, v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileField;-><init>(SSS)V

    .line 155
    .local v2, "field":Lcom/trendmicro/classfile/ClassFileField;
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 158
    invoke-virtual {v4, p4}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(I)I

    move-result v4

    .line 155
    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v5, v4}, Lcom/trendmicro/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 159
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 160
    return-void
.end method

.method public addField(Ljava/lang/String;Ljava/lang/String;SJ)V
    .locals 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S
    .param p4, "value"    # J

    .line 172
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 173
    .local v0, "fieldNameIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 174
    .local v1, "typeIndex":S
    new-instance v2, Lcom/trendmicro/classfile/ClassFileField;

    invoke-direct {v2, v0, v1, p3}, Lcom/trendmicro/classfile/ClassFileField;-><init>(SSS)V

    .line 176
    .local v2, "field":Lcom/trendmicro/classfile/ClassFileField;
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v4, "ConstantValue"

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v3

    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 179
    invoke-virtual {v4, p4, p5}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(J)I

    move-result v4

    .line 176
    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-virtual {v2, v3, v5, v6, v4}, Lcom/trendmicro/classfile/ClassFileField;->setAttributes(SSSI)V

    .line 180
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 181
    return-void
.end method

.method public addILoad(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1064
    const/16 v0, 0x1a

    const/16 v1, 0x15

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1065
    return-void
.end method

.method public addIStore(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1019
    const/16 v0, 0x3b

    const/16 v1, 0x36

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1020
    return-void
.end method

.method public addInterface(Ljava/lang/String;)V
    .locals 3
    .param p1, "interfaceName"    # Ljava/lang/String;

    .line 76
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v0

    .line 77
    .local v0, "interfaceIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 78
    return-void
.end method

.method public addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "theOpCode"    # I
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "methodType"    # Ljava/lang/String;

    .line 807
    invoke-static {p4}, Lcom/trendmicro/classfile/ClassFileWriter;->sizeOfParameters(Ljava/lang/String;)I

    move-result v0

    .line 808
    .local v0, "parameterInfo":I
    ushr-int/lit8 v1, v0, 0x10

    .line 809
    .local v1, "parameterCount":I
    int-to-short v2, v0

    .line 811
    .local v2, "stackDiff":I
    iget-short v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    add-int/2addr v3, v2

    .line 812
    .local v3, "newStack":I
    invoke-static {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v4

    add-int/2addr v3, v4

    .line 813
    if-ltz v3, :cond_0

    const/16 v4, 0x7fff

    if-ge v4, v3, :cond_1

    .line 814
    :cond_0
    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 816
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 840
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "bad opcode for method reference"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 821
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 822
    const/16 v4, 0xb9

    if-ne p1, v4, :cond_2

    .line 823
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 824
    invoke-virtual {v4, p2, p3, p4}, Lcom/trendmicro/classfile/ConstantPool;->addInterfaceMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v4

    .line 827
    .local v4, "ifMethodRefIndex":S
    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 828
    add-int/lit8 v5, v1, 0x1

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 829
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 830
    .end local v4    # "ifMethodRefIndex":S
    goto :goto_0

    .line 831
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v4, p2, p3, p4}, Lcom/trendmicro/classfile/ConstantPool;->addMethodRef(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v4

    .line 834
    .local v4, "methodRefIndex":S
    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 837
    .end local v4    # "methodRefIndex":S
    nop

    .line 843
    :goto_0
    int-to-short v4, v3

    iput-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 844
    iget-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v3, v4, :cond_3

    .line 845
    int-to-short v4, v3

    iput-short v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 850
    :cond_3
    return-void

    :pswitch_data_0
    .packed-switch 0xb6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public varargs addInvokeDynamic(Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/classfile/ClassFileWriter$MHandle;[Ljava/lang/Object;)V
    .locals 7
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "methodType"    # Ljava/lang/String;
    .param p3, "bsm"    # Lcom/trendmicro/classfile/ClassFileWriter$MHandle;
    .param p4, "bsmArgs"    # [Ljava/lang/Object;

    .line 858
    sget v0, Lcom/trendmicro/classfile/ClassFileWriter;->MajorVersion:I

    const/16 v1, 0x33

    if-lt v0, v1, :cond_5

    .line 863
    invoke-static {p2}, Lcom/trendmicro/classfile/ClassFileWriter;->sizeOfParameters(Ljava/lang/String;)I

    move-result v0

    .line 865
    .local v0, "parameterInfo":I
    int-to-short v1, v0

    .line 867
    .local v1, "stackDiff":I
    iget-short v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    add-int/2addr v2, v1

    .line 868
    .local v2, "newStack":I
    if-ltz v2, :cond_0

    const/16 v3, 0x7fff

    if-ge v3, v2, :cond_1

    .line 869
    :cond_0
    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 871
    :cond_1
    new-instance v3, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;

    invoke-direct {v3, p0, p3, p4}, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;-><init>(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/classfile/ClassFileWriter$MHandle;[Ljava/lang/Object;)V

    .line 873
    .local v3, "bsmEntry":Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    if-nez v4, :cond_2

    .line 874
    new-instance v4, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v4}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    .line 876
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ObjArray;->indexOf(Ljava/lang/Object;)I

    move-result v4

    .line 877
    .local v4, "bootstrapIndex":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 878
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v4

    .line 879
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 880
    iget v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethodsLength:I

    iget-object v6, v3, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    array-length v6, v6

    add-int/2addr v5, v6

    iput v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethodsLength:I

    .line 883
    :cond_3
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v5, p1, p2, v4}, Lcom/trendmicro/classfile/ConstantPool;->addInvokeDynamic(Ljava/lang/String;Ljava/lang/String;I)S

    move-result v5

    .line 886
    .local v5, "invokedynamicIndex":S
    const/16 v6, 0xba

    invoke-direct {p0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeBuffer(I)V

    .line 887
    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 888
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addToCodeInt16(I)V

    .line 890
    int-to-short v6, v2

    iput-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 891
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v2, v6, :cond_4

    .line 892
    int-to-short v6, v2

    iput-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 897
    :cond_4
    return-void

    .line 859
    .end local v0    # "parameterInfo":I
    .end local v1    # "stackDiff":I
    .end local v2    # "newStack":I
    .end local v3    # "bsmEntry":Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;
    .end local v4    # "bootstrapIndex":I
    .end local v5    # "invokedynamicIndex":S
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Please build and run with JDK 1.7 for invokedynamic support"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addLLoad(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1073
    const/16 v0, 0x1e

    const/16 v1, 0x16

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1074
    return-void
.end method

.method public addLStore(I)V
    .locals 2
    .param p1, "local"    # I

    .line 1028
    const/16 v0, 0x3f

    const/16 v1, 0x37

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->xop(III)V

    .line 1029
    return-void
.end method

.method public addLineNumberEntry(S)V
    .locals 5
    .param p1, "lineNumber"    # S

    .line 1413
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    if-eqz v0, :cond_2

    .line 1415
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 1416
    .local v0, "N":I
    const/16 v1, 0x10

    if-nez v0, :cond_0

    .line 1417
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    goto :goto_0

    .line 1418
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    array-length v3, v2

    if-ne v0, v3, :cond_1

    .line 1419
    mul-int/lit8 v3, v0, 0x2

    new-array v3, v3, [I

    .line 1420
    .local v3, "tmp":[I
    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1421
    iput-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    .line 1423
    .end local v3    # "tmp":[I
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    iget v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    shl-int/lit8 v1, v3, 0x10

    add-int/2addr v1, p1

    aput v1, v2, v0

    .line 1424
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 1425
    return-void

    .line 1414
    .end local v0    # "N":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No method to stop"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addLoadConstant(D)V
    .locals 2
    .param p1, "k"    # D

    .line 660
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(D)I

    move-result v0

    const/16 v1, 0x14

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 661
    return-void
.end method

.method public addLoadConstant(F)V
    .locals 2
    .param p1, "k"    # F

    .line 651
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(F)I

    move-result v0

    const/16 v1, 0x12

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 652
    return-void
.end method

.method public addLoadConstant(I)V
    .locals 4
    .param p1, "k"    # I

    .line 611
    const/4 v0, 0x3

    if-eqz p1, :cond_5

    const/4 v1, 0x1

    const/4 v2, 0x4

    if-eq p1, v1, :cond_4

    const/4 v1, 0x2

    const/4 v3, 0x5

    if-eq p1, v1, :cond_3

    if-eq p1, v0, :cond_2

    if-eq p1, v2, :cond_1

    if-eq p1, v3, :cond_0

    .line 631
    const/16 v0, 0x12

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p1}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 628
    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 629
    goto :goto_0

    .line 625
    :cond_1
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 626
    goto :goto_0

    .line 622
    :cond_2
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 623
    goto :goto_0

    .line 619
    :cond_3
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 620
    goto :goto_0

    .line 616
    :cond_4
    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 617
    goto :goto_0

    .line 613
    :cond_5
    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 614
    nop

    .line 634
    :goto_0
    return-void
.end method

.method public addLoadConstant(J)V
    .locals 2
    .param p1, "k"    # J

    .line 642
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(J)I

    move-result v0

    const/16 v1, 0x14

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 643
    return-void
.end method

.method public addLoadConstant(Ljava/lang/String;)V
    .locals 2
    .param p1, "k"    # Ljava/lang/String;

    .line 669
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addConstant(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x12

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 670
    return-void
.end method

.method public addLoadThis()V
    .locals 1

    .line 1107
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1108
    return-void
.end method

.method public addPush(D)V
    .locals 6
    .param p1, "k"    # D

    .line 945
    const-wide/16 v0, 0x0

    cmpl-double v2, p1, v0

    const/16 v3, 0x77

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    if-nez v2, :cond_0

    .line 947
    const/16 v2, 0xe

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 948
    div-double/2addr v4, p1

    cmpg-double v0, v4, v0

    if-gez v0, :cond_3

    .line 950
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_1

    .line 952
    :cond_0
    cmpl-double v2, p1, v4

    if-eqz v2, :cond_2

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpl-double v2, p1, v4

    if-nez v2, :cond_1

    goto :goto_0

    .line 958
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(D)V

    goto :goto_1

    .line 953
    :cond_2
    :goto_0
    const/16 v2, 0xf

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 954
    cmpg-double v0, p1, v0

    if-gez v0, :cond_3

    .line 955
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 960
    :cond_3
    :goto_1
    return-void
.end method

.method public addPush(I)V
    .locals 2
    .param p1, "k"    # I

    .line 905
    int-to-byte v0, p1

    if-ne v0, p1, :cond_2

    .line 906
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 907
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 908
    :cond_0
    if-ltz p1, :cond_1

    const/4 v0, 0x5

    if-gt p1, v0, :cond_1

    .line 909
    add-int/lit8 v0, p1, 0x3

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 911
    :cond_1
    const/16 v0, 0x10

    int-to-byte v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 913
    :cond_2
    int-to-short v0, p1

    if-ne v0, p1, :cond_3

    .line 914
    const/16 v0, 0x11

    int-to-short v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto :goto_0

    .line 916
    :cond_3
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(I)V

    .line 918
    :goto_0
    return-void
.end method

.method public addPush(J)V
    .locals 3
    .param p1, "k"    # J

    .line 930
    long-to-int v0, p1

    .line 931
    .local v0, "ik":I
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_0

    .line 932
    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 933
    const/16 v1, 0x85

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 935
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(J)V

    .line 937
    :goto_0
    return-void
.end method

.method public addPush(Ljava/lang/String;)V
    .locals 10
    .param p1, "k"    # Ljava/lang/String;

    .line 969
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 970
    .local v0, "length":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Lcom/trendmicro/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v1

    .line 971
    .local v1, "limit":I
    if-ne v1, v0, :cond_0

    .line 972
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 973
    return-void

    .line 981
    :cond_0
    const-string v2, "java/lang/StringBuilder"

    .line 982
    .local v2, "SB":Ljava/lang/String;
    const/16 v3, 0xbb

    const-string v4, "java/lang/StringBuilder"

    invoke-virtual {p0, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 983
    const/16 v3, 0x59

    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 984
    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 985
    const/16 v5, 0xb7

    const-string v6, "<init>"

    const-string v7, "(I)V"

    invoke-virtual {p0, v5, v4, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    const/4 v5, 0x0

    .line 988
    .local v5, "cursor":I
    :goto_0
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 989
    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 990
    .local v6, "s":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 991
    const/16 v7, 0xb6

    const-string v8, "append"

    const-string v9, "(Ljava/lang/String;)Ljava/lang/StringBuilder;"

    invoke-virtual {p0, v7, v4, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 993
    const/16 v8, 0x57

    invoke-virtual {p0, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 994
    if-ne v1, v0, :cond_1

    .line 995
    nop

    .line 1000
    .end local v6    # "s":Ljava/lang/String;
    const-string v3, "toString"

    const-string v6, "()Ljava/lang/String;"

    invoke-virtual {p0, v7, v4, v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1002
    return-void

    .line 997
    .restart local v6    # "s":Ljava/lang/String;
    :cond_1
    move v5, v1

    .line 998
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v7, p1, v1, v0}, Lcom/trendmicro/classfile/ConstantPool;->getUtfEncodingLimit(Ljava/lang/String;II)I

    move-result v1

    .line 999
    .end local v6    # "s":Ljava/lang/String;
    goto :goto_0
.end method

.method public addPush(Z)V
    .locals 1
    .param p1, "k"    # Z

    .line 921
    if-eqz p1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    :goto_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 922
    return-void
.end method

.method public addTableSwitch(II)I
    .locals 8
    .param p1, "low"    # I
    .param p2, "high"    # I

    .line 1134
    if-gt p1, p2, :cond_4

    .line 1137
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    const/16 v1, 0xaa

    invoke-static {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->stackChange(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 1138
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 1139
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 1141
    :cond_1
    sub-int v1, p2, p1

    add-int/lit8 v1, v1, 0x1

    .line 1142
    .local v1, "entryCount":I
    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    not-int v2, v2

    and-int/lit8 v2, v2, 0x3

    .line 1144
    .local v2, "padSize":I
    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v4, v1, 0x3

    mul-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addReservedCodeSpace(I)I

    move-result v3

    .line 1145
    .local v3, "N":I
    move v4, v3

    .line 1146
    .local v4, "switchStart":I
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    add-int/lit8 v6, v3, 0x1

    .end local v3    # "N":I
    .local v6, "N":I
    const/16 v7, -0x56

    aput-byte v7, v5, v3

    .line 1147
    :goto_0
    if-eqz v2, :cond_2

    .line 1148
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "N":I
    .local v5, "N":I
    const/4 v7, 0x0

    aput-byte v7, v3, v6

    .line 1149
    add-int/lit8 v2, v2, -0x1

    move v6, v5

    goto :goto_0

    .line 1151
    .end local v5    # "N":I
    .restart local v6    # "N":I
    :cond_2
    add-int/lit8 v6, v6, 0x4

    .line 1152
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p1, v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 1153
    .end local v6    # "N":I
    .restart local v3    # "N":I
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    invoke-static {p2, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    .line 1155
    int-to-short v5, v0

    iput-short v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1156
    iget-short v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v5, :cond_3

    .line 1157
    int-to-short v5, v0

    iput-short v5, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 1163
    :cond_3
    return v4

    .line 1135
    .end local v0    # "newStack":I
    .end local v1    # "entryCount":I
    .end local v2    # "padSize":I
    .end local v3    # "N":I
    .end local v4    # "switchStart":I
    :cond_4
    new-instance v0, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad bounds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addVariableDescriptor(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "startPC"    # I
    .param p4, "register"    # I

    .line 215
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 216
    .local v0, "nameIndex":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 217
    .local v1, "descriptorIndex":I
    const/4 v2, 0x4

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v3, 0x1

    aput v1, v2, v3

    const/4 v3, 0x2

    aput p3, v2, v3

    const/4 v3, 0x3

    aput p4, v2, v3

    .line 218
    .local v2, "chunk":[I
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    if-nez v3, :cond_0

    .line 219
    new-instance v3, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v3}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    .line 221
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 222
    return-void
.end method

.method public adjustStackTop(I)V
    .locals 2
    .param p1, "delta"    # I

    .line 1337
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    add-int/2addr v0, p1

    .line 1338
    .local v0, "newStack":I
    if-ltz v0, :cond_0

    const/16 v1, 0x7fff

    if-ge v1, v0, :cond_1

    .line 1339
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->badStack(I)V

    .line 1340
    :cond_1
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1341
    iget-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-le v0, v1, :cond_2

    .line 1342
    int-to-short v1, v0

    iput-short v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 1347
    :cond_2
    return-void
.end method

.method final getCharBuffer(I)[C
    .locals 2
    .param p1, "minimalSize"    # I

    .line 4328
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->tmpCharBuffer:[C

    array-length v1, v0

    if-le p1, v1, :cond_1

    .line 4329
    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    .line 4330
    .local v0, "newSize":I
    if-le p1, v0, :cond_0

    .line 4331
    move v0, p1

    .line 4333
    :cond_0
    new-array v1, v0, [C

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->tmpCharBuffer:[C

    .line 4335
    .end local v0    # "newSize":I
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->tmpCharBuffer:[C

    return-object v0
.end method

.method public final getClassName()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->generatedClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentCodeOffset()I
    .locals 1

    .line 1325
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    return v0
.end method

.method public getLabelPC(I)I
    .locals 2
    .param p1, "label"    # I

    .line 1267
    if-gez p1, :cond_1

    .line 1269
    const v0, 0x7fffffff

    and-int/2addr p1, v0

    .line 1270
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-ge p1, v0, :cond_0

    .line 1272
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v0, v0, p1

    return v0

    .line 1271
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1268
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label, no biscuit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getStackTop()S
    .locals 1

    .line 1329
    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    return v0
.end method

.method public isUnderStringSizeLimit(Ljava/lang/String;)Z
    .locals 1
    .param p1, "k"    # Ljava/lang/String;

    .line 1010
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->isUnderUtfEncodingLimit(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public markHandler(I)V
    .locals 1
    .param p1, "theLabel"    # I

    .line 1262
    const/4 v0, 0x1

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1263
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1264
    return-void
.end method

.method public markLabel(I)V
    .locals 3
    .param p1, "label"    # I

    .line 1242
    if-gez p1, :cond_2

    .line 1245
    const v0, 0x7fffffff

    and-int/2addr p1, v0

    .line 1246
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    if-gt p1, v0, :cond_1

    .line 1249
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTable:[I

    aget v1, v0, p1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 1253
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    aput v1, v0, p1

    .line 1254
    return-void

    .line 1250
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only mark label once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1247
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1243
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad label, no biscuit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public markLabel(IS)V
    .locals 0
    .param p1, "label"    # I
    .param p2, "stackTop"    # S

    .line 1257
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 1258
    iput-short p2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1259
    return-void
.end method

.method public final markTableSwitchCase(II)V
    .locals 2
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I

    .line 1173
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1174
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 1175
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1176
    return-void
.end method

.method public final markTableSwitchCase(III)V
    .locals 3
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I
    .param p3, "stackTop"    # I

    .line 1180
    if-ltz p3, :cond_0

    iget-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    if-gt p3, v0, :cond_0

    .line 1182
    int-to-short v0, p3

    iput-short v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1183
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1184
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 1185
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1186
    return-void

    .line 1181
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad stack index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final markTableSwitchDefault(I)V
    .locals 2
    .param p1, "switchStart"    # I

    .line 1167
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 1168
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-virtual {v0, v1, p1}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 1169
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    const/4 v1, -0x1

    invoke-virtual {p0, p1, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->setTableSwitchJump(III)V

    .line 1170
    return-void
.end method

.method public setFlags(S)V
    .locals 0
    .param p1, "flags"    # S

    .line 102
    iput-short p1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFlags:S

    .line 103
    return-void
.end method

.method public setStackTop(S)V
    .locals 0
    .param p1, "n"    # S

    .line 1333
    iput-short p1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 1334
    return-void
.end method

.method public setTableSwitchJump(III)V
    .locals 6
    .param p1, "switchStart"    # I
    .param p2, "caseIndex"    # I
    .param p3, "jumpTarget"    # I

    .line 1194
    if-ltz p3, :cond_5

    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    if-lt v0, p3, :cond_5

    .line 1196
    const/4 v0, -0x1

    if-lt p2, v0, :cond_4

    .line 1199
    not-int v0, p1

    and-int/lit8 v0, v0, 0x3

    .line 1201
    .local v0, "padSize":I
    if-gez p2, :cond_0

    .line 1203
    add-int/lit8 v1, p1, 0x1

    add-int/2addr v1, v0

    .local v1, "caseOffset":I
    goto :goto_0

    .line 1205
    .end local v1    # "caseOffset":I
    :cond_0
    add-int/lit8 v1, p1, 0x1

    add-int/2addr v1, v0

    add-int/lit8 v2, p2, 0x3

    mul-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    .line 1207
    .restart local v1    # "caseOffset":I
    :goto_0
    if-ltz p1, :cond_3

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/lit8 v3, v2, -0x10

    sub-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    if-lt v3, p1, :cond_3

    .line 1212
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    aget-byte v4, v3, p1

    and-int/lit16 v4, v4, 0xff

    const/16 v5, 0xaa

    if-ne v4, v5, :cond_2

    .line 1216
    if-ltz v1, :cond_1

    add-int/lit8 v4, v1, 0x4

    if-lt v2, v4, :cond_1

    .line 1222
    sub-int v2, p3, p1

    invoke-static {v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    .line 1223
    return-void

    .line 1219
    :cond_1
    new-instance v2, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too big case index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1213
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " is not offset of tableswitch statement"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1208
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " is outside a possible range of tableswitch in already generated code"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1197
    .end local v0    # "padSize":I
    .end local v1    # "caseOffset":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad case index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1195
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad jump target: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public startMethod(Ljava/lang/String;Ljava/lang/String;S)V
    .locals 9
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "flags"    # S

    .line 235
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v0, p1}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 236
    .local v0, "methodNameIndex":S
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v1, p2}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v7

    .line 237
    .local v7, "typeIndex":S
    new-instance v8, Lcom/trendmicro/classfile/ClassFileMethod;

    move-object v1, v8

    move-object v2, p1

    move v3, v0

    move-object v4, p2

    move v5, v7

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/classfile/ClassFileMethod;-><init>(Ljava/lang/String;SLjava/lang/String;SS)V

    iput-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    .line 239
    new-instance v1, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v1}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    .line 240
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 241
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addSuperBlockStart(I)V

    .line 242
    return-void
.end method

.method public stopMethod(S)V
    .locals 21
    .param p1, "maxLocals"    # S

    .line 254
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    if-eqz v1, :cond_11

    .line 257
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/classfile/ClassFileWriter;->fixLabelGotos()V

    .line 259
    move/from16 v1, p1

    iput-short v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxLocals:S

    .line 261
    const/4 v2, 0x0

    .line 262
    .local v2, "stackMap":Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;
    sget-boolean v3, Lcom/trendmicro/classfile/ClassFileWriter;->GenerateStackMap:Z

    if-eqz v3, :cond_0

    .line 263
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/classfile/ClassFileWriter;->finalizeSuperBlockStarts()V

    .line 264
    new-instance v3, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;

    invoke-direct {v3, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;-><init>(Lcom/trendmicro/classfile/ClassFileWriter;)V

    move-object v2, v3

    .line 265
    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->generate()V

    .line 268
    :cond_0
    const/4 v3, 0x0

    .line 269
    .local v3, "lineNumberTableLength":I
    iget-object v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    if-eqz v4, :cond_1

    .line 273
    iget v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    mul-int/lit8 v4, v4, 0x4

    add-int/lit8 v3, v4, 0x8

    .line 276
    :cond_1
    const/4 v4, 0x0

    .line 277
    .local v4, "variableTableLength":I
    iget-object v5, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v5, :cond_2

    .line 281
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0xa

    add-int/lit8 v4, v5, 0x8

    .line 284
    :cond_2
    const/4 v5, 0x0

    .line 285
    .local v5, "stackMapTableLength":I
    if-eqz v2, :cond_3

    .line 286
    invoke-virtual {v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->computeWriteSize()I

    move-result v6

    .line 287
    .local v6, "stackMapWriteSize":I
    if-lez v6, :cond_3

    .line 288
    add-int/lit8 v5, v6, 0x6

    .line 292
    .end local v6    # "stackMapWriteSize":I
    :cond_3
    iget v6, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/lit8 v6, v6, 0xe

    const/4 v7, 0x2

    add-int/2addr v6, v7

    iget v8, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    mul-int/lit8 v8, v8, 0x8

    add-int/2addr v6, v8

    add-int/2addr v6, v7

    add-int/2addr v6, v3

    add-int/2addr v6, v4

    add-int/2addr v6, v5

    .line 305
    .local v6, "attrLength":I
    const/high16 v8, 0x10000

    if-gt v6, v8, :cond_10

    .line 311
    new-array v8, v6, [B

    .line 312
    .local v8, "codeAttribute":[B
    const/4 v9, 0x0

    .line 313
    .local v9, "index":I
    iget-object v10, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v11, "Code"

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v10

    .line 314
    .local v10, "codeAttrIndex":I
    invoke-static {v10, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 315
    add-int/lit8 v6, v6, -0x6

    .line 316
    invoke-static {v6, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v9

    .line 317
    iget-short v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    invoke-static {v11, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 318
    iget-short v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxLocals:S

    invoke-static {v11, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 319
    iget v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    invoke-static {v11, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v9

    .line 320
    iget-object v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBuffer:[B

    iget v12, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    const/4 v13, 0x0

    invoke-static {v11, v13, v8, v9, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 322
    iget v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    add-int/2addr v9, v11

    .line 324
    iget v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    if-lez v11, :cond_8

    .line 325
    invoke-static {v11, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 326
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    iget v12, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    if-ge v11, v12, :cond_7

    .line 327
    iget-object v12, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    aget-object v12, v12, v11

    .line 328
    .local v12, "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget v14, v12, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v0, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v14

    int-to-short v14, v14

    .line 329
    .local v14, "startPC":S
    iget v15, v12, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsEndLabel:I

    invoke-virtual {v0, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v15

    int-to-short v15, v15

    .line 330
    .local v15, "endPC":S
    iget v7, v12, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v0, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v7

    int-to-short v7, v7

    .line 331
    .local v7, "handlerPC":S
    iget-short v13, v12, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsCatchType:S

    .line 332
    .local v13, "catchType":S
    const/4 v1, -0x1

    if-eq v14, v1, :cond_6

    .line 334
    if-eq v15, v1, :cond_5

    .line 336
    if-eq v7, v1, :cond_4

    .line 340
    invoke-static {v14, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    .line 341
    .end local v9    # "index":I
    .local v1, "index":I
    invoke-static {v15, v8, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    .line 342
    invoke-static {v7, v8, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    .line 343
    invoke-static {v13, v8, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 326
    .end local v1    # "index":I
    .end local v7    # "handlerPC":S
    .end local v12    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v13    # "catchType":S
    .end local v14    # "startPC":S
    .end local v15    # "endPC":S
    .restart local v9    # "index":I
    add-int/lit8 v11, v11, 0x1

    move/from16 v1, p1

    const/4 v7, 0x2

    const/4 v13, 0x0

    goto :goto_0

    .line 337
    .restart local v7    # "handlerPC":S
    .restart local v12    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .restart local v13    # "catchType":S
    .restart local v14    # "startPC":S
    .restart local v15    # "endPC":S
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .local v17, "lineNumberTableLength":I
    const-string v3, "handler label not defined"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 335
    .end local v17    # "lineNumberTableLength":I
    .restart local v3    # "lineNumberTableLength":I
    :cond_5
    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .restart local v17    # "lineNumberTableLength":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "end label not defined"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 333
    .end local v17    # "lineNumberTableLength":I
    .restart local v3    # "lineNumberTableLength":I
    :cond_6
    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .restart local v17    # "lineNumberTableLength":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "start label not defined"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 326
    .end local v7    # "handlerPC":S
    .end local v12    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v13    # "catchType":S
    .end local v14    # "startPC":S
    .end local v15    # "endPC":S
    .end local v17    # "lineNumberTableLength":I
    .restart local v3    # "lineNumberTableLength":I
    :cond_7
    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .end local v11    # "i":I
    .restart local v17    # "lineNumberTableLength":I
    goto :goto_1

    .line 347
    .end local v17    # "lineNumberTableLength":I
    .restart local v3    # "lineNumberTableLength":I
    :cond_8
    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .restart local v17    # "lineNumberTableLength":I
    const/4 v1, 0x0

    invoke-static {v1, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v9

    .line 350
    :goto_1
    const/4 v1, 0x0

    .line 351
    .local v1, "attributeCount":I
    iget-object v3, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    if-eqz v3, :cond_9

    .line 352
    add-int/lit8 v1, v1, 0x1

    .line 353
    :cond_9
    iget-object v3, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v3, :cond_a

    .line 354
    add-int/lit8 v1, v1, 0x1

    .line 355
    :cond_a
    if-lez v5, :cond_b

    .line 356
    add-int/lit8 v1, v1, 0x1

    .line 358
    :cond_b
    invoke-static {v1, v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 360
    .end local v9    # "index":I
    .local v3, "index":I
    iget-object v7, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    if-eqz v7, :cond_c

    .line 361
    iget-object v7, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 362
    const-string v9, "LineNumberTable"

    invoke-virtual {v7, v9}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v7

    .line 363
    .local v7, "lineNumberTableAttrIndex":I
    invoke-static {v7, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 364
    iget v9, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    mul-int/lit8 v9, v9, 0x4

    const/4 v11, 0x2

    add-int/2addr v9, v11

    .line 365
    .local v9, "tableAttrLength":I
    invoke-static {v9, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 366
    iget v11, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    invoke-static {v11, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 367
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_2
    iget v12, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    if-ge v11, v12, :cond_c

    .line 368
    iget-object v12, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTable:[I

    aget v12, v12, v11

    invoke-static {v12, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 367
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 372
    .end local v7    # "lineNumberTableAttrIndex":I
    .end local v9    # "tableAttrLength":I
    .end local v11    # "i":I
    :cond_c
    iget-object v7, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v7, :cond_e

    .line 373
    iget-object v7, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 374
    const-string v9, "LocalVariableTable"

    invoke-virtual {v7, v9}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v7

    .line 375
    .local v7, "variableTableAttrIndex":I
    invoke-static {v7, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 376
    iget-object v9, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v9}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v9

    .line 377
    .local v9, "varCount":I
    mul-int/lit8 v11, v9, 0xa

    const/4 v12, 0x2

    add-int/2addr v11, v12

    .line 378
    .local v11, "tableAttrLength":I
    invoke-static {v11, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 379
    invoke-static {v9, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 380
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    if-ge v12, v9, :cond_d

    .line 381
    iget-object v13, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v13, v12}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [I

    .line 382
    .local v13, "chunk":[I
    const/4 v14, 0x0

    aget v15, v13, v14

    .line 383
    .local v15, "nameIndex":I
    const/4 v14, 0x1

    aget v14, v13, v14

    .line 384
    .local v14, "descriptorIndex":I
    move/from16 v18, v1

    const/16 v16, 0x2

    .end local v1    # "attributeCount":I
    .local v18, "attributeCount":I
    aget v1, v13, v16

    .line 385
    .local v1, "startPC":I
    const/16 v19, 0x3

    move/from16 v20, v4

    .end local v4    # "variableTableLength":I
    .local v20, "variableTableLength":I
    aget v4, v13, v19

    .line 386
    .local v4, "register":I
    move/from16 v19, v6

    .end local v6    # "attrLength":I
    .local v19, "attrLength":I
    iget v6, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    sub-int/2addr v6, v1

    .line 388
    .local v6, "length":I
    invoke-static {v1, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 389
    invoke-static {v6, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 390
    invoke-static {v15, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 391
    invoke-static {v14, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 392
    invoke-static {v4, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 380
    .end local v1    # "startPC":I
    .end local v4    # "register":I
    .end local v6    # "length":I
    .end local v13    # "chunk":[I
    .end local v14    # "descriptorIndex":I
    .end local v15    # "nameIndex":I
    add-int/lit8 v12, v12, 0x1

    move/from16 v1, v18

    move/from16 v6, v19

    move/from16 v4, v20

    goto :goto_3

    .end local v18    # "attributeCount":I
    .end local v19    # "attrLength":I
    .end local v20    # "variableTableLength":I
    .local v1, "attributeCount":I
    .local v4, "variableTableLength":I
    .local v6, "attrLength":I
    :cond_d
    move/from16 v18, v1

    move/from16 v20, v4

    move/from16 v19, v6

    .end local v1    # "attributeCount":I
    .end local v4    # "variableTableLength":I
    .end local v6    # "attrLength":I
    .restart local v18    # "attributeCount":I
    .restart local v19    # "attrLength":I
    .restart local v20    # "variableTableLength":I
    goto :goto_4

    .line 372
    .end local v7    # "variableTableAttrIndex":I
    .end local v9    # "varCount":I
    .end local v11    # "tableAttrLength":I
    .end local v12    # "i":I
    .end local v18    # "attributeCount":I
    .end local v19    # "attrLength":I
    .end local v20    # "variableTableLength":I
    .restart local v1    # "attributeCount":I
    .restart local v4    # "variableTableLength":I
    .restart local v6    # "attrLength":I
    :cond_e
    move/from16 v18, v1

    move/from16 v20, v4

    move/from16 v19, v6

    .line 396
    .end local v1    # "attributeCount":I
    .end local v4    # "variableTableLength":I
    .end local v6    # "attrLength":I
    .restart local v18    # "attributeCount":I
    .restart local v19    # "attrLength":I
    .restart local v20    # "variableTableLength":I
    :goto_4
    if-lez v5, :cond_f

    .line 397
    iget-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    .line 398
    const-string v4, "StackMapTable"

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v1

    .line 399
    .local v1, "stackMapTableAttrIndex":I
    invoke-static {v1, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 400
    invoke-virtual {v2, v8, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->write([BI)I

    move-result v3

    .line 403
    .end local v1    # "stackMapTableAttrIndex":I
    :cond_f
    iget-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    invoke-virtual {v1, v8}, Lcom/trendmicro/classfile/ClassFileMethod;->setCodeAttribute([B)V

    .line 405
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTable:[Lcom/trendmicro/classfile/ExceptionTableEntry;

    .line 406
    const/4 v4, 0x0

    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsExceptionTableTop:I

    .line 407
    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLineNumberTableTop:I

    .line 408
    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCodeBufferTop:I

    .line 409
    iput-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsCurrentMethod:Lcom/trendmicro/classfile/ClassFileMethod;

    .line 410
    iput-short v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMaxStack:S

    .line 411
    iput-short v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsStackTop:S

    .line 412
    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsLabelTableTop:I

    .line 413
    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFixupTableTop:I

    .line 414
    iput-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsVarDescriptors:Lcom/trendmicro/hippo/ObjArray;

    .line 415
    iput-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStarts:[I

    .line 416
    iput v4, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperBlockStartsTop:I

    .line 417
    iput-object v1, v0, Lcom/trendmicro/classfile/ClassFileWriter;->itsJumpFroms:Lcom/trendmicro/hippo/UintMap;

    .line 418
    return-void

    .line 309
    .end local v8    # "codeAttribute":[B
    .end local v10    # "codeAttrIndex":I
    .end local v17    # "lineNumberTableLength":I
    .end local v18    # "attributeCount":I
    .end local v19    # "attrLength":I
    .end local v20    # "variableTableLength":I
    .local v3, "lineNumberTableLength":I
    .restart local v4    # "variableTableLength":I
    .restart local v6    # "attrLength":I
    :cond_10
    move/from16 v17, v3

    .end local v3    # "lineNumberTableLength":I
    .restart local v17    # "lineNumberTableLength":I
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;

    const-string v3, "generated bytecode for method exceeds 64K limit."

    invoke-direct {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 255
    .end local v2    # "stackMap":Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;
    .end local v4    # "variableTableLength":I
    .end local v5    # "stackMapTableLength":I
    .end local v6    # "attrLength":I
    .end local v17    # "lineNumberTableLength":I
    :cond_11
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No method to stop"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public toByteArray()[B
    .locals 12

    .line 2792
    const/4 v0, 0x0

    .line 2793
    .local v0, "bootstrapMethodsAttrNameIndex":S
    const/4 v1, 0x0

    .line 2795
    .local v1, "attributeCount":I
    const/4 v2, 0x0

    .line 2796
    .local v2, "sourceFileAttributeNameIndex":S
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    if-eqz v3, :cond_0

    .line 2797
    add-int/lit8 v1, v1, 0x1

    .line 2798
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v4, "BootstrapMethods"

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v0

    .line 2801
    :cond_0
    iget-short v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v3, :cond_1

    .line 2802
    add-int/lit8 v1, v1, 0x1

    .line 2803
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    const-string v4, "SourceFile"

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addUtf8(Ljava/lang/String;)S

    move-result v2

    .line 2809
    :cond_1
    const/4 v3, 0x0

    .line 2810
    .local v3, "offset":I
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->getWriteSize()I

    move-result v4

    .line 2811
    .local v4, "dataSize":I
    new-array v5, v4, [B

    .line 2813
    .local v5, "data":[B
    const v6, -0x35014542    # -8346975.0f

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 2814
    sget v6, Lcom/trendmicro/classfile/ClassFileWriter;->MinorVersion:I

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2815
    sget v6, Lcom/trendmicro/classfile/ClassFileWriter;->MajorVersion:I

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2816
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsConstantPool:Lcom/trendmicro/classfile/ConstantPool;

    invoke-virtual {v6, v5, v3}, Lcom/trendmicro/classfile/ConstantPool;->write([BI)I

    move-result v3

    .line 2817
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFlags:S

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2818
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsThisClassIndex:S

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2819
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSuperClassIndex:S

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2820
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v6

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2821
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_2

    .line 2822
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsInterfaces:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Short;

    invoke-virtual {v7}, Ljava/lang/Short;->shortValue()S

    move-result v7

    .line 2823
    .local v7, "interfaceIndex":I
    invoke-static {v7, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2821
    .end local v7    # "interfaceIndex":I
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 2825
    .end local v6    # "i":I
    :cond_2
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v6

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2826
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_1
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 2827
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsFields:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/classfile/ClassFileField;

    .line 2828
    .local v7, "field":Lcom/trendmicro/classfile/ClassFileField;
    invoke-virtual {v7, v5, v3}, Lcom/trendmicro/classfile/ClassFileField;->write([BI)I

    move-result v3

    .line 2826
    .end local v7    # "field":Lcom/trendmicro/classfile/ClassFileField;
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 2830
    .end local v6    # "i":I
    :cond_3
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v6

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2831
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_2
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_4

    .line 2832
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/classfile/ClassFileMethod;

    .line 2833
    .local v7, "method":Lcom/trendmicro/classfile/ClassFileMethod;
    invoke-virtual {v7, v5, v3}, Lcom/trendmicro/classfile/ClassFileMethod;->write([BI)I

    move-result v3

    .line 2831
    .end local v7    # "method":Lcom/trendmicro/classfile/ClassFileMethod;
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 2835
    .end local v6    # "i":I
    :cond_4
    invoke-static {v1, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2836
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    const/4 v7, 0x2

    if-eqz v6, :cond_5

    .line 2837
    invoke-static {v0, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2838
    iget v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethodsLength:I

    add-int/2addr v6, v7

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 2839
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v6

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2840
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_3
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v8

    if-ge v6, v8, :cond_5

    .line 2841
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsBootstrapMethods:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v8, v6}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;

    .line 2842
    .local v8, "entry":Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;
    iget-object v9, v8, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    const/4 v10, 0x0

    iget-object v11, v8, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    array-length v11, v11

    invoke-static {v9, v10, v5, v3, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2843
    iget-object v9, v8, Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;->code:[B

    array-length v9, v9

    add-int/2addr v3, v9

    .line 2840
    .end local v8    # "entry":Lcom/trendmicro/classfile/ClassFileWriter$BootstrapEntry;
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 2846
    .end local v6    # "i":I
    :cond_5
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    if-eqz v6, :cond_6

    .line 2847
    invoke-static {v2, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2848
    invoke-static {v7, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result v3

    .line 2849
    iget-short v6, p0, Lcom/trendmicro/classfile/ClassFileWriter;->itsSourceFileNameIndex:S

    invoke-static {v6, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v3

    .line 2852
    :cond_6
    if-ne v3, v4, :cond_7

    .line 2857
    return-object v5

    .line 2854
    :cond_7
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6}, Ljava/lang/RuntimeException;-><init>()V

    throw v6
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "oStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2743
    invoke-virtual {p0}, Lcom/trendmicro/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v0

    .line 2744
    .local v0, "array":[B
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 2745
    return-void
.end method
