.class public Lcom/trendmicro/hippo/NativeArray;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/List;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeArray$ElementComparator;,
        Lcom/trendmicro/hippo/NativeArray$StringLikeComparator;
    }
.end annotation


# static fields
.field private static final ARRAY_TAG:Ljava/lang/Object;

.field private static final ConstructorId_concat:I = -0xd

.field private static final ConstructorId_every:I = -0x11

.field private static final ConstructorId_filter:I = -0x12

.field private static final ConstructorId_find:I = -0x16

.field private static final ConstructorId_findIndex:I = -0x17

.field private static final ConstructorId_forEach:I = -0x13

.field private static final ConstructorId_from:I = -0x1c

.field private static final ConstructorId_indexOf:I = -0xf

.field private static final ConstructorId_isArray:I = -0x1a

.field private static final ConstructorId_join:I = -0x5

.field private static final ConstructorId_lastIndexOf:I = -0x10

.field private static final ConstructorId_map:I = -0x14

.field private static final ConstructorId_of:I = -0x1b

.field private static final ConstructorId_pop:I = -0x9

.field private static final ConstructorId_push:I = -0x8

.field private static final ConstructorId_reduce:I = -0x18

.field private static final ConstructorId_reduceRight:I = -0x19

.field private static final ConstructorId_reverse:I = -0x6

.field private static final ConstructorId_shift:I = -0xa

.field private static final ConstructorId_slice:I = -0xe

.field private static final ConstructorId_some:I = -0x15

.field private static final ConstructorId_sort:I = -0x7

.field private static final ConstructorId_splice:I = -0xc

.field private static final ConstructorId_unshift:I = -0xb

.field private static final DEFAULT_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_INITIAL_CAPACITY:I = 0xa

.field private static final GROW_FACTOR:D = 1.5

.field private static final Id_concat:I = 0xd

.field private static final Id_constructor:I = 0x1

.field private static final Id_copyWithin:I = 0x1f

.field private static final Id_entries:I = 0x1d

.field private static final Id_every:I = 0x11

.field private static final Id_fill:I = 0x1a

.field private static final Id_filter:I = 0x12

.field private static final Id_find:I = 0x16

.field private static final Id_findIndex:I = 0x17

.field private static final Id_forEach:I = 0x13

.field private static final Id_includes:I = 0x1e

.field private static final Id_indexOf:I = 0xf

.field private static final Id_join:I = 0x5

.field private static final Id_keys:I = 0x1b

.field private static final Id_lastIndexOf:I = 0x10

.field private static final Id_length:I = 0x1

.field private static final Id_map:I = 0x14

.field private static final Id_pop:I = 0x9

.field private static final Id_push:I = 0x8

.field private static final Id_reduce:I = 0x18

.field private static final Id_reduceRight:I = 0x19

.field private static final Id_reverse:I = 0x6

.field private static final Id_shift:I = 0xa

.field private static final Id_slice:I = 0xe

.field private static final Id_some:I = 0x15

.field private static final Id_sort:I = 0x7

.field private static final Id_splice:I = 0xc

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_unshift:I = 0xb

.field private static final Id_values:I = 0x1c

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PRE_GROW_SIZE:I = 0x55555554

.field private static final MAX_PROTOTYPE_ID:I = 0x20

.field private static final NEGATIVE_ONE:Ljava/lang/Long;

.field private static final STRING_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final SymbolId_iterator:I = 0x20

.field private static maximumInitialCapacity:I = 0x0

.field private static final serialVersionUID:J = 0x65be3f5055db7c6aL


# instance fields
.field private dense:[Ljava/lang/Object;

.field private denseOnly:Z

.field private length:J

.field private lengthAttr:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    const-string v0, "Array"

    sput-object v0, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    .line 44
    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    .line 2287
    new-instance v0, Lcom/trendmicro/hippo/NativeArray$StringLikeComparator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeArray$StringLikeComparator;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/NativeArray;->STRING_COMPARATOR:Ljava/util/Comparator;

    .line 2288
    new-instance v0, Lcom/trendmicro/hippo/NativeArray$ElementComparator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeArray$ElementComparator;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/NativeArray;->DEFAULT_COMPARATOR:Ljava/util/Comparator;

    .line 2491
    const/16 v0, 0x2710

    sput v0, Lcom/trendmicro/hippo/NativeArray;->maximumInitialCapacity:I

    return-void
.end method

.method public constructor <init>(J)V
    .locals 3
    .param p1, "lengthArg"    # J

    .line 61
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 2475
    const/4 v0, 0x6

    iput v0, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    .line 62
    sget v0, Lcom/trendmicro/hippo/NativeArray;->maximumInitialCapacity:I

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 63
    if-eqz v0, :cond_2

    .line 64
    long-to-int v0, p1

    .line 65
    .local v0, "intLength":I
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 66
    const/16 v0, 0xa

    .line 67
    :cond_1
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    .line 68
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .end local v0    # "intLength":I
    :cond_2
    iput-wide p1, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 71
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 2
    .param p1, "array"    # [Ljava/lang/Object;

    .line 74
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 2475
    const/4 v0, 0x6

    iput v0, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 76
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    .line 77
    array-length v0, p1

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 78
    return-void
.end method

.method static synthetic access$000()Ljava/util/Comparator;
    .locals 1

    .line 27
    sget-object v0, Lcom/trendmicro/hippo/NativeArray;->STRING_COMPARATOR:Ljava/util/Comparator;

    return-object v0
.end method

.method private static callConstructorOrCreateArray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;JZ)Lcom/trendmicro/hippo/Scriptable;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "length"    # J
    .param p5, "lengthAlways"    # Z

    .line 662
    const/4 v0, 0x0

    .line 664
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, p2, Lcom/trendmicro/hippo/Function;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 666
    if-nez p5, :cond_1

    const-wide/16 v3, 0x0

    cmp-long v1, p3, v3

    if-lez v1, :cond_0

    goto :goto_0

    .line 667
    :cond_0
    :try_start_0
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 668
    .local v1, "args":[Ljava/lang/Object;
    :goto_1
    move-object v3, p2

    check-cast v3, Lcom/trendmicro/hippo/Function;

    invoke-interface {v3, p0, p1, v1}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3
    :try_end_0
    .catch Lcom/trendmicro/hippo/EcmaError; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 675
    .end local v1    # "args":[Ljava/lang/Object;
    goto :goto_2

    .line 669
    :catch_0
    move-exception v1

    .line 670
    .local v1, "ee":Lcom/trendmicro/hippo/EcmaError;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/EcmaError;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "TypeError"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    .line 671
    :cond_2
    throw v1

    .line 678
    .end local v1    # "ee":Lcom/trendmicro/hippo/EcmaError;
    :cond_3
    :goto_2
    if-nez v0, :cond_5

    .line 680
    const-wide/32 v3, 0x7fffffff

    cmp-long v1, p3, v3

    if-lez v1, :cond_4

    goto :goto_3

    :cond_4
    long-to-int v2, p3

    :goto_3
    invoke-virtual {p0, p1, v2}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 683
    :cond_5
    return-object v0
.end method

.method private static concatSpreadArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;J)J
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "result"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "offset"    # J

    .line 1497
    const/4 v0, 0x0

    invoke-static {p0, p2, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v1

    .line 1498
    .local v1, "srclen":J
    add-long v3, v1, p3

    .line 1501
    .local v3, "newlen":J
    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v3, v5

    if-gtz v5, :cond_0

    instance-of v5, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v5, :cond_0

    .line 1502
    move-object v5, p1

    check-cast v5, Lcom/trendmicro/hippo/NativeArray;

    .line 1503
    .local v5, "denseResult":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v6, v5, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v6, :cond_0

    instance-of v6, p2, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v6, :cond_0

    .line 1504
    move-object v6, p2

    check-cast v6, Lcom/trendmicro/hippo/NativeArray;

    .line 1505
    .local v6, "denseArg":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v7, v6, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v7, :cond_0

    .line 1507
    long-to-int v7, v3

    invoke-direct {v5, v7}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    .line 1508
    iget-object v7, v6, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    iget-object v8, v5, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v9, p3

    long-to-int v10, v1

    invoke-static {v7, v0, v8, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1509
    return-wide v3

    .line 1518
    .end local v5    # "denseResult":Lcom/trendmicro/hippo/NativeArray;
    .end local v6    # "denseArg":Lcom/trendmicro/hippo/NativeArray;
    :cond_0
    move-wide v5, p3

    .line 1519
    .local v5, "dstpos":J
    const-wide/16 v7, 0x0

    .local v7, "srcpos":J
    :goto_0
    cmp-long v0, v7, v1

    if-gez v0, :cond_2

    .line 1520
    invoke-static {p2, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 1521
    .local v0, "temp":Ljava/lang/Object;
    sget-object v9, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v9, :cond_1

    .line 1522
    invoke-static {p0, p1, v5, v6, v0}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1519
    .end local v0    # "temp":Ljava/lang/Object;
    :cond_1
    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    add-long/2addr v5, v9

    goto :goto_0

    .line 1525
    .end local v7    # "srcpos":J
    :cond_2
    return-wide v3
.end method

.method private defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 6
    .param p1, "value"    # Ljava/lang/Object;

    .line 580
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 581
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    move-object v0, p0

    .line 582
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 583
    .local v1, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v1, v0, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 584
    const-string v2, "value"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 585
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "writable"

    invoke-virtual {v1, v5, v4, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 586
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "enumerable"

    invoke-virtual {v1, v5, v4, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 587
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v4, "configurable"

    invoke-virtual {v1, v4, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 588
    return-object v1
.end method

.method private static defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .line 913
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 914
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 915
    .local v0, "id":Ljava/lang/String;
    invoke-interface {p1, v0, p1, p4}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 916
    .end local v0    # "id":Ljava/lang/String;
    goto :goto_0

    .line 917
    :cond_0
    long-to-int v0, p2

    invoke-interface {p1, v0, p1, p4}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 919
    :goto_0
    return-void
.end method

.method private static deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V
    .locals 3
    .param p0, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # J

    .line 891
    long-to-int v0, p1

    .line 892
    .local v0, "i":I
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_0

    invoke-interface {p0, v0}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    goto :goto_0

    .line 893
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 894
    :goto_0
    return-void
.end method

.method private static doConcat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;J)J
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "result"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "arg"    # Ljava/lang/Object;
    .param p4, "offset"    # J

    .line 1530
    invoke-static {p0, p1, p3}, Lcom/trendmicro/hippo/NativeArray;->isConcatSpreadable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1531
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {p0, p2, v0, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->concatSpreadArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;J)J

    move-result-wide v0

    return-wide v0

    .line 1533
    :cond_0
    invoke-static {p0, p2, p4, p5, p3}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1534
    const-wide/16 v0, 0x1

    add-long/2addr v0, p4

    return-wide v0
.end method

.method private ensureCapacity(I)Z
    .locals 5
    .param p1, "capacity"    # I

    .line 464
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v0

    if-le p1, v1, :cond_1

    .line 465
    const v1, 0x55555554

    const/4 v2, 0x0

    if-le p1, v1, :cond_0

    .line 466
    iput-boolean v2, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 467
    return v2

    .line 469
    :cond_0
    array-length v0, v0

    int-to-double v0, v0

    const-wide/high16 v3, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v0, v3

    double-to-int v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 470
    new-array v0, p1, [Ljava/lang/Object;

    .line 471
    .local v0, "newDense":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v3, v1

    invoke-static {v1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 472
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v1

    array-length v2, v0

    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 474
    iput-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    .line 476
    .end local v0    # "newDense":[Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static getElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "index"    # J

    .line 898
    invoke-static {p1, p2, p3}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 899
    .local v0, "elem":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_0
    return-object v1
.end method

.method static getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "throwIfTooLarge"    # Z

    .line 850
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeString;

    if-eqz v0, :cond_0

    .line 851
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeString;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeString;->getLength()I

    move-result v0

    int-to-long v0, v0

    return-wide v0

    .line 853
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v0, :cond_1

    .line 854
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v0

    return-wide v0

    .line 857
    :cond_1
    const-string v0, "length"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 858
    .local v0, "len":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    const-wide/16 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 860
    return-wide v2

    .line 863
    :cond_2
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    .line 864
    .local v4, "doubleLen":D
    const-wide v6, 0x433fffffffffffffL    # 9.007199254740991E15

    cmpl-double v1, v4, v6

    if-lez v1, :cond_4

    .line 865
    if-nez p2, :cond_3

    .line 869
    const-wide/32 v1, 0x7fffffff

    return-wide v1

    .line 866
    :cond_3
    const-string v1, "msg.arraylength.bad"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 867
    .local v1, "msg":Ljava/lang/String;
    const-string v2, "RangeError"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 871
    .end local v1    # "msg":Ljava/lang/String;
    :cond_4
    const-wide/16 v6, 0x0

    cmpg-double v1, v4, v6

    if-gez v1, :cond_5

    .line 872
    return-wide v2

    .line 874
    :cond_5
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v1

    return-wide v1
.end method

.method static getMaximumInitialCapacity()I
    .locals 1

    .line 53
    sget v0, Lcom/trendmicro/hippo/NativeArray;->maximumInitialCapacity:I

    return v0
.end method

.method private static getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;
    .locals 2
    .param p0, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # J

    .line 904
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 905
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 907
    :cond_0
    long-to-int v0, p1

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 48
    new-instance v0, Lcom/trendmicro/hippo/NativeArray;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/NativeArray;-><init>(J)V

    .line 49
    .local v0, "obj":Lcom/trendmicro/hippo/NativeArray;
    const/16 v1, 0x20

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeArray;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 50
    return-void
.end method

.method private static isConcatSpreadable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "val"    # Ljava/lang/Object;

    .line 1470
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 1471
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v1, Lcom/trendmicro/hippo/SymbolKey;->IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

    .line 1472
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v0

    .line 1473
    .local v0, "spreadable":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    invoke-static {v0}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1476
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 1480
    .end local v0    # "spreadable":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0xc8

    if-ge v0, v1, :cond_1

    .line 1483
    const-string v0, "Array"

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getExistingCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    .line 1484
    .local v0, "ctor":Lcom/trendmicro/hippo/Function;
    invoke-static {p2, v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1485
    const/4 v1, 0x1

    return v1

    .line 1490
    .end local v0    # "ctor":Lcom/trendmicro/hippo/Function;
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static iterativeMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 26
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "idFunctionObject"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 1885
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p3

    invoke-static {v0, v1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 1891
    .local v4, "o":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 1892
    .local v5, "id":I
    const/16 v6, 0x17

    const/16 v7, 0x16

    if-eq v7, v5, :cond_1

    if-ne v6, v5, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v8, p1

    goto :goto_1

    :cond_1
    :goto_0
    move-object/from16 v8, p1

    invoke-static {v0, v4, v8}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 1894
    :goto_1
    const/16 v9, 0x14

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-ne v5, v9, :cond_2

    move v12, v10

    goto :goto_2

    :cond_2
    move v12, v11

    :goto_2
    invoke-static {v0, v4, v12}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v12

    .line 1895
    .local v12, "length":J
    array-length v14, v2

    if-lez v14, :cond_3

    aget-object v14, v2, v11

    goto :goto_3

    :cond_3
    sget-object v14, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1896
    .local v14, "callbackArg":Ljava/lang/Object;
    :goto_3
    if-eqz v14, :cond_14

    instance-of v15, v14, Lcom/trendmicro/hippo/Function;

    if-eqz v15, :cond_14

    .line 1899
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v15

    const/16 v11, 0xc8

    if-lt v15, v11, :cond_5

    instance-of v11, v14, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-nez v11, :cond_4

    goto :goto_4

    .line 1905
    :cond_4
    invoke-static {v14}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 1908
    :cond_5
    :goto_4
    move-object v11, v14

    check-cast v11, Lcom/trendmicro/hippo/Function;

    .line 1909
    .local v11, "f":Lcom/trendmicro/hippo/Function;
    invoke-static {v11}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v15

    .line 1911
    .local v15, "parent":Lcom/trendmicro/hippo/Scriptable;
    array-length v6, v2

    const/4 v7, 0x2

    if-lt v6, v7, :cond_7

    aget-object v6, v2, v10

    if-eqz v6, :cond_7

    aget-object v6, v2, v10

    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v6, v7, :cond_6

    goto :goto_5

    .line 1914
    :cond_6
    aget-object v6, v2, v10

    invoke-static {v0, v1, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .local v6, "thisArg":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_6

    .line 1912
    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    :goto_5
    move-object v6, v15

    .line 1917
    .restart local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :goto_6
    const/4 v7, 0x0

    .line 1918
    .local v7, "array":Lcom/trendmicro/hippo/Scriptable;
    const/16 v10, 0x12

    if-eq v5, v10, :cond_8

    if-ne v5, v9, :cond_a

    .line 1919
    :cond_8
    if-ne v5, v9, :cond_9

    long-to-int v9, v12

    goto :goto_7

    :cond_9
    const/4 v9, 0x0

    .line 1920
    .local v9, "resultLength":I
    :goto_7
    invoke-virtual {v0, v1, v9}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 1922
    .end local v9    # "resultLength":I
    :cond_a
    const-wide/16 v9, 0x0

    .line 1923
    .local v9, "j":J
    const-wide/16 v20, 0x0

    move-wide/from16 v1, v20

    .local v1, "i":J
    :goto_8
    cmp-long v20, v1, v12

    if-gez v20, :cond_13

    .line 1924
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    .line 1925
    .local v3, "innerArgs":[Ljava/lang/Object;
    invoke-static {v4, v1, v2}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v8

    .line 1926
    .local v8, "elem":Ljava/lang/Object;
    move-wide/from16 v20, v12

    .end local v12    # "length":J
    .local v20, "length":J
    sget-object v12, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    const-wide/16 v22, 0x1

    if-ne v8, v12, :cond_d

    .line 1927
    const/16 v12, 0x16

    if-eq v5, v12, :cond_c

    const/16 v13, 0x17

    if-ne v5, v13, :cond_b

    goto :goto_9

    :cond_b
    move-object/from16 v19, v14

    const/4 v14, 0x0

    const/16 v17, 0x2

    const/16 v18, 0x1

    goto/16 :goto_b

    :cond_c
    const/16 v13, 0x17

    .line 1928
    :goto_9
    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_a

    .line 1926
    :cond_d
    const/16 v12, 0x16

    const/16 v13, 0x17

    .line 1933
    :goto_a
    const/16 v16, 0x0

    aput-object v8, v3, v16

    .line 1934
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    const/16 v18, 0x1

    aput-object v17, v3, v18

    .line 1935
    const/16 v17, 0x2

    aput-object v4, v3, v17

    .line 1936
    invoke-interface {v11, v0, v15, v6, v3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 1937
    .local v12, "result":Ljava/lang/Object;
    packed-switch v5, :pswitch_data_0

    :pswitch_0
    move-object/from16 v19, v14

    const/4 v14, 0x0

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .local v19, "callbackArg":Ljava/lang/Object;
    goto :goto_b

    .line 1960
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_1
    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 1961
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    long-to-double v13, v1

    invoke-static {v13, v14}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v13

    return-object v13

    .line 1960
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :cond_e
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    const/4 v14, 0x0

    goto :goto_b

    .line 1956
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_2
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f

    .line 1957
    return-object v8

    .line 1956
    :cond_f
    const/4 v14, 0x0

    goto :goto_b

    .line 1952
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_3
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_10

    .line 1953
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v13

    .line 1952
    :cond_10
    const/4 v14, 0x0

    goto :goto_b

    .line 1949
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_4
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    invoke-static {v0, v7, v1, v2, v12}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1950
    const/4 v14, 0x0

    goto :goto_b

    .line 1943
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_5
    move-object/from16 v19, v14

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_11

    .line 1944
    add-long v24, v9, v22

    const/4 v14, 0x0

    .end local v9    # "j":J
    .local v24, "j":J
    aget-object v13, v3, v14

    invoke-static {v0, v7, v9, v10, v13}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    move-wide/from16 v9, v24

    goto :goto_b

    .line 1943
    .end local v24    # "j":J
    .restart local v9    # "j":J
    :cond_11
    const/4 v14, 0x0

    goto :goto_b

    .line 1939
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :pswitch_6
    move-object/from16 v19, v14

    const/4 v14, 0x0

    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_12

    .line 1940
    sget-object v13, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v13

    .line 1923
    .end local v3    # "innerArgs":[Ljava/lang/Object;
    .end local v8    # "elem":Ljava/lang/Object;
    .end local v12    # "result":Ljava/lang/Object;
    :cond_12
    :goto_b
    add-long v1, v1, v22

    move-object/from16 v8, p1

    move-object/from16 v3, p3

    move-object/from16 v14, v19

    move-wide/from16 v12, v20

    goto/16 :goto_8

    .end local v19    # "callbackArg":Ljava/lang/Object;
    .end local v20    # "length":J
    .local v12, "length":J
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :cond_13
    move-wide/from16 v20, v12

    move-object/from16 v19, v14

    .line 1965
    .end local v1    # "i":J
    .end local v12    # "length":J
    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v20    # "length":J
    packed-switch v5, :pswitch_data_1

    .line 1977
    :pswitch_7
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 1974
    :pswitch_8
    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    return-object v1

    .line 1972
    :pswitch_9
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 1970
    :pswitch_a
    return-object v7

    .line 1967
    :pswitch_b
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v1

    .line 1896
    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .end local v7    # "array":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "j":J
    .end local v11    # "f":Lcom/trendmicro/hippo/Function;
    .end local v15    # "parent":Lcom/trendmicro/hippo/Scriptable;
    .end local v19    # "callbackArg":Ljava/lang/Object;
    .end local v20    # "length":J
    .restart local v12    # "length":J
    .restart local v14    # "callbackArg":Ljava/lang/Object;
    :cond_14
    move-wide/from16 v20, v12

    move-object/from16 v19, v14

    .line 1897
    .end local v12    # "length":J
    .end local v14    # "callbackArg":Ljava/lang/Object;
    .restart local v19    # "callbackArg":Ljava/lang/Object;
    .restart local v20    # "length":J
    invoke-static/range {v19 .. v19}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x11
        :pswitch_b
        :pswitch_a
        :pswitch_7
        :pswitch_a
        :pswitch_9
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private static jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 639
    array-length v0, p2

    if-nez v0, :cond_0

    .line 640
    new-instance v0, Lcom/trendmicro/hippo/NativeArray;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/NativeArray;-><init>(J)V

    return-object v0

    .line 645
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0x78

    if-ne v0, v1, :cond_1

    .line 646
    new-instance v0, Lcom/trendmicro/hippo/NativeArray;

    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/NativeArray;-><init>([Ljava/lang/Object;)V

    return-object v0

    .line 648
    :cond_1
    const/4 v0, 0x0

    aget-object v0, p2, v0

    .line 649
    .local v0, "arg0":Ljava/lang/Object;
    array-length v1, p2

    const/4 v2, 0x1

    if-gt v1, v2, :cond_4

    instance-of v1, v0, Ljava/lang/Number;

    if-nez v1, :cond_2

    goto :goto_0

    .line 652
    :cond_2
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v1

    .line 653
    .local v1, "len":J
    long-to-double v3, v1

    move-object v5, v0

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    cmpl-double v3, v3, v5

    if-nez v3, :cond_3

    .line 657
    new-instance v3, Lcom/trendmicro/hippo/NativeArray;

    invoke-direct {v3, v1, v2}, Lcom/trendmicro/hippo/NativeArray;-><init>(J)V

    return-object v3

    .line 654
    :cond_3
    const-string v3, "msg.arraylength.bad"

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 655
    .local v3, "msg":Ljava/lang/String;
    const-string v4, "RangeError"

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 650
    .end local v1    # "len":J
    .end local v3    # "msg":Ljava/lang/String;
    :cond_4
    :goto_0
    new-instance v1, Lcom/trendmicro/hippo/NativeArray;

    invoke-direct {v1, p2}, Lcom/trendmicro/hippo/NativeArray;-><init>([Ljava/lang/Object;)V

    return-object v1
.end method

.method private static js_concat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1544
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeArray;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 1545
    const/4 v6, 0x0

    invoke-virtual {p0, p1, v6}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 1547
    .local v7, "result":Lcom/trendmicro/hippo/Scriptable;
    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, v7

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->doConcat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;J)J

    move-result-wide v0

    .line 1548
    .local v0, "length":J
    array-length v8, p3

    move-wide v9, v0

    .end local v0    # "length":J
    .local v9, "length":J
    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v11, p3, v6

    .line 1549
    .local v11, "arg":Ljava/lang/Object;
    move-object v0, p0

    move-object v1, p1

    move-object v2, v7

    move-object v3, v11

    move-wide v4, v9

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->doConcat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;J)J

    move-result-wide v9

    .line 1548
    .end local v11    # "arg":Ljava/lang/Object;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1552
    :cond_0
    invoke-static {p0, v7, v9, v10}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1553
    return-object v7
.end method

.method private static js_copyWithin(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 28
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1806
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static/range {p0 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1807
    .local v2, "o":Lcom/trendmicro/hippo/Scriptable;
    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v4

    .line 1809
    .local v4, "len":J
    array-length v6, v1

    const/4 v7, 0x1

    if-lt v6, v7, :cond_0

    aget-object v3, v1, v3

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1810
    .local v3, "targetArg":Ljava/lang/Object;
    :goto_0
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v8

    double-to-long v8, v8

    .line 1812
    .local v8, "relativeTarget":J
    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-gez v6, :cond_1

    .line 1813
    add-long v12, v4, v8

    invoke-static {v12, v13, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    .local v12, "to":J
    goto :goto_1

    .line 1816
    .end local v12    # "to":J
    :cond_1
    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    .line 1819
    .restart local v12    # "to":J
    :goto_1
    array-length v6, v1

    const/4 v14, 0x2

    if-lt v6, v14, :cond_2

    aget-object v6, v1, v7

    goto :goto_2

    :cond_2
    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1820
    .local v6, "startArg":Ljava/lang/Object;
    :goto_2
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v14

    double-to-long v14, v14

    .line 1822
    .local v14, "relativeStart":J
    cmp-long v16, v14, v10

    if-gez v16, :cond_3

    .line 1823
    move-wide/from16 v16, v8

    .end local v8    # "relativeTarget":J
    .local v16, "relativeTarget":J
    add-long v7, v4, v14

    invoke-static {v7, v8, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .local v7, "from":J
    goto :goto_3

    .line 1826
    .end local v7    # "from":J
    .end local v16    # "relativeTarget":J
    .restart local v8    # "relativeTarget":J
    :cond_3
    move-wide/from16 v16, v8

    .end local v8    # "relativeTarget":J
    .restart local v16    # "relativeTarget":J
    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    .line 1829
    .restart local v7    # "from":J
    :goto_3
    move-wide/from16 v18, v4

    .line 1830
    .local v18, "relativeEnd":J
    array-length v9, v1

    const/4 v10, 0x3

    if-lt v9, v10, :cond_4

    const/4 v9, 0x2

    aget-object v10, v1, v9

    invoke-static {v10}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 1831
    aget-object v9, v1, v9

    invoke-static {v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v9

    double-to-long v9, v9

    .end local v18    # "relativeEnd":J
    .local v9, "relativeEnd":J
    goto :goto_4

    .line 1834
    .end local v9    # "relativeEnd":J
    .restart local v18    # "relativeEnd":J
    :cond_4
    move-wide/from16 v9, v18

    .end local v18    # "relativeEnd":J
    .restart local v9    # "relativeEnd":J
    :goto_4
    move-wide/from16 v18, v14

    const-wide/16 v14, 0x0

    .end local v14    # "relativeStart":J
    .local v18, "relativeStart":J
    cmp-long v11, v9, v14

    if-gez v11, :cond_5

    .line 1835
    add-long v0, v4, v9

    invoke-static {v0, v1, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .local v0, "fin":J
    goto :goto_5

    .line 1838
    .end local v0    # "fin":J
    :cond_5
    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 1841
    .restart local v0    # "fin":J
    :goto_5
    sub-long v14, v0, v7

    move-wide/from16 v22, v0

    .end local v0    # "fin":J
    .local v22, "fin":J
    sub-long v0, v4, v12

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 1842
    .local v0, "count":J
    const/4 v11, 0x1

    .line 1843
    .local v11, "direction":I
    cmp-long v14, v7, v12

    const-wide/16 v24, 0x1

    if-gez v14, :cond_6

    add-long v14, v7, v0

    cmp-long v14, v12, v14

    if-gez v14, :cond_6

    .line 1844
    const/4 v11, -0x1

    .line 1845
    add-long v14, v7, v0

    sub-long v7, v14, v24

    .line 1846
    add-long v14, v12, v0

    sub-long v12, v14, v24

    .line 1851
    :cond_6
    instance-of v14, v2, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v14, :cond_9

    const-wide/32 v14, 0x7fffffff

    cmp-long v14, v0, v14

    if-gtz v14, :cond_9

    .line 1852
    move-object v14, v2

    check-cast v14, Lcom/trendmicro/hippo/NativeArray;

    .line 1853
    .local v14, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v15, v14, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v15, :cond_8

    .line 1854
    :goto_6
    const-wide/16 v20, 0x0

    cmp-long v15, v0, v20

    if-lez v15, :cond_7

    .line 1855
    iget-object v15, v14, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v20, v3

    .end local v3    # "targetArg":Ljava/lang/Object;
    .local v20, "targetArg":Ljava/lang/Object;
    long-to-int v3, v12

    move-wide/from16 v26, v4

    .end local v4    # "len":J
    .local v26, "len":J
    long-to-int v4, v7

    aget-object v4, v15, v4

    aput-object v4, v15, v3

    .line 1856
    int-to-long v3, v11

    add-long/2addr v7, v3

    .line 1857
    int-to-long v3, v11

    add-long/2addr v12, v3

    .line 1854
    sub-long v0, v0, v24

    move-object/from16 v3, v20

    move-wide/from16 v4, v26

    goto :goto_6

    .line 1860
    .end local v20    # "targetArg":Ljava/lang/Object;
    .end local v26    # "len":J
    .restart local v3    # "targetArg":Ljava/lang/Object;
    .restart local v4    # "len":J
    :cond_7
    return-object p2

    .line 1853
    :cond_8
    move-object/from16 v20, v3

    move-wide/from16 v26, v4

    .end local v3    # "targetArg":Ljava/lang/Object;
    .end local v4    # "len":J
    .restart local v20    # "targetArg":Ljava/lang/Object;
    .restart local v26    # "len":J
    goto :goto_7

    .line 1851
    .end local v14    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v20    # "targetArg":Ljava/lang/Object;
    .end local v26    # "len":J
    .restart local v3    # "targetArg":Ljava/lang/Object;
    .restart local v4    # "len":J
    :cond_9
    move-object/from16 v20, v3

    move-wide/from16 v26, v4

    .line 1864
    .end local v3    # "targetArg":Ljava/lang/Object;
    .end local v4    # "len":J
    .restart local v20    # "targetArg":Ljava/lang/Object;
    .restart local v26    # "len":J
    :goto_7
    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_c

    .line 1865
    invoke-static {v2, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1866
    .local v5, "temp":Ljava/lang/Object;
    sget-object v14, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v5, v14, :cond_b

    invoke-static {v5}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    move-object/from16 v14, p0

    goto :goto_8

    .line 1869
    :cond_a
    move-object/from16 v14, p0

    invoke-static {v14, v2, v12, v13, v5}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    goto :goto_9

    .line 1866
    :cond_b
    move-object/from16 v14, p0

    .line 1867
    :goto_8
    invoke-static {v2, v12, v13}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    .line 1872
    :goto_9
    int-to-long v3, v11

    add-long/2addr v7, v3

    .line 1873
    int-to-long v3, v11

    add-long/2addr v12, v3

    .line 1864
    .end local v5    # "temp":Ljava/lang/Object;
    sub-long v0, v0, v24

    goto :goto_7

    .line 1876
    :cond_c
    move-object/from16 v14, p0

    return-object p2
.end method

.method private static js_fill(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1769
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static/range {p0 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 1770
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    const/4 v4, 0x0

    invoke-static {v0, v3, v4}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v5

    .line 1772
    .local v5, "len":J
    const-wide/16 v7, 0x0

    .line 1773
    .local v7, "relativeStart":J
    array-length v9, v2

    const/4 v10, 0x2

    if-lt v9, v10, :cond_0

    .line 1774
    const/4 v9, 0x1

    aget-object v9, v2, v9

    invoke-static {v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v11

    double-to-long v7, v11

    .line 1777
    :cond_0
    const-wide/16 v11, 0x0

    cmp-long v9, v7, v11

    if-gez v9, :cond_1

    .line 1778
    add-long v13, v5, v7

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .local v13, "k":J
    goto :goto_0

    .line 1781
    .end local v13    # "k":J
    :cond_1
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v13

    .line 1784
    .restart local v13    # "k":J
    :goto_0
    move-wide v15, v5

    .line 1785
    .local v15, "relativeEnd":J
    array-length v9, v2

    const/4 v4, 0x3

    if-lt v9, v4, :cond_2

    aget-object v4, v2, v10

    invoke-static {v4}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1786
    aget-object v4, v2, v10

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v9

    double-to-long v9, v9

    .end local v15    # "relativeEnd":J
    .local v9, "relativeEnd":J
    goto :goto_1

    .line 1789
    .end local v9    # "relativeEnd":J
    .restart local v15    # "relativeEnd":J
    :cond_2
    move-wide v9, v15

    .end local v15    # "relativeEnd":J
    .restart local v9    # "relativeEnd":J
    :goto_1
    cmp-long v4, v9, v11

    if-gez v4, :cond_3

    .line 1790
    move-object v15, v3

    .end local v3    # "o":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "o":Lcom/trendmicro/hippo/Scriptable;
    add-long v3, v5, v9

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .local v3, "fin":J
    goto :goto_2

    .line 1793
    .end local v15    # "o":Lcom/trendmicro/hippo/Scriptable;
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    :cond_3
    move-object v15, v3

    .end local v3    # "o":Lcom/trendmicro/hippo/Scriptable;
    .restart local v15    # "o":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v9, v10, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 1796
    .local v3, "fin":J
    :goto_2
    array-length v11, v2

    if-lez v11, :cond_4

    const/4 v11, 0x0

    aget-object v11, v2, v11

    goto :goto_3

    :cond_4
    sget-object v11, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1797
    .local v11, "value":Ljava/lang/Object;
    :goto_3
    move-wide/from16 v16, v13

    move-wide/from16 v18, v5

    move-wide/from16 v5, v16

    .local v5, "i":J
    .local v18, "len":J
    :goto_4
    cmp-long v12, v5, v3

    if-gez v12, :cond_5

    .line 1798
    invoke-static {v0, v1, v5, v6, v11}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1797
    const-wide/16 v16, 0x1

    add-long v5, v5, v16

    goto :goto_4

    .line 1801
    .end local v5    # "i":J
    :cond_5
    return-object v1
.end method

.method private static js_from(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 24
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 687
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p3

    .line 688
    array-length v0, v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-lt v0, v11, :cond_0

    aget-object v0, v9, v10

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_0
    invoke-static {v8, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v12

    .line 689
    .local v12, "items":Lcom/trendmicro/hippo/Scriptable;
    array-length v0, v9

    const/4 v13, 0x2

    if-lt v0, v13, :cond_1

    aget-object v0, v9, v11

    goto :goto_1

    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_1
    move-object v14, v0

    .line 690
    .local v14, "mapArg":Ljava/lang/Object;
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    .line 691
    .local v0, "thisArg":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v14}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v11

    move v15, v1

    .line 692
    .local v15, "mapping":Z
    const/4 v1, 0x0

    .line 694
    .local v1, "mapFn":Lcom/trendmicro/hippo/Function;
    if-eqz v15, :cond_4

    .line 695
    instance-of v2, v14, Lcom/trendmicro/hippo/Function;

    if-eqz v2, :cond_3

    .line 698
    move-object v1, v14

    check-cast v1, Lcom/trendmicro/hippo/Function;

    .line 699
    array-length v2, v9

    const/4 v3, 0x3

    if-lt v2, v3, :cond_2

    .line 700
    aget-object v2, v9, v13

    invoke-static {v2}, Lcom/trendmicro/hippo/NativeArray;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    move-object v6, v0

    move-object v4, v1

    goto :goto_2

    .line 699
    :cond_2
    move-object v6, v0

    move-object v4, v1

    goto :goto_2

    .line 696
    :cond_3
    const-string v2, "msg.map.function.not"

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 694
    :cond_4
    move-object v6, v0

    move-object v4, v1

    .line 704
    .end local v0    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .end local v1    # "mapFn":Lcom/trendmicro/hippo/Function;
    .local v4, "mapFn":Lcom/trendmicro/hippo/Function;
    .local v6, "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :goto_2
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {v12, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v5

    .line 705
    .local v5, "iteratorProp":Ljava/lang/Object;
    instance-of v0, v12, Lcom/trendmicro/hippo/NativeArray;

    const-wide/16 v16, 0x1

    if-nez v0, :cond_9

    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v5, v0, :cond_9

    .line 706
    invoke-static {v5}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 707
    invoke-static {v12, v7, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->callIterator(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    .line 708
    .local v3, "iterator":Ljava/lang/Object;
    invoke-static {v3}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 709
    const-wide/16 v18, 0x0

    const/4 v0, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v11, v3

    .end local v3    # "iterator":Ljava/lang/Object;
    .local v11, "iterator":Ljava/lang/Object;
    move-object/from16 v3, p2

    move-object/from16 v22, v4

    move-object/from16 v21, v5

    .end local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v5    # "iteratorProp":Ljava/lang/Object;
    .local v21, "iteratorProp":Ljava/lang/Object;
    .local v22, "mapFn":Lcom/trendmicro/hippo/Function;
    move-wide/from16 v4, v18

    move-object/from16 v23, v6

    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .local v23, "thisArg":Lcom/trendmicro/hippo/Scriptable;
    move v6, v0

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeArray;->callConstructorOrCreateArray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;JZ)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 710
    .local v1, "result":Lcom/trendmicro/hippo/Scriptable;
    const-wide/16 v2, 0x0

    .line 711
    .local v2, "k":J
    new-instance v0, Lcom/trendmicro/hippo/IteratorLikeIterable;

    invoke-direct {v0, v7, v8, v11}, Lcom/trendmicro/hippo/IteratorLikeIterable;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    move-object v4, v0

    .line 712
    .local v4, "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    :try_start_0
    invoke-virtual {v4}, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator()Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 713
    .local v5, "temp":Ljava/lang/Object;
    if-eqz v15, :cond_5

    .line 714
    new-array v6, v13, [Ljava/lang/Object;

    aput-object v5, v6, v10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    const/16 v19, 0x1

    aput-object v18, v6, v19
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object/from16 v10, v22

    move-object/from16 v13, v23

    .end local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .local v10, "mapFn":Lcom/trendmicro/hippo/Function;
    .local v13, "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :try_start_1
    invoke-interface {v10, v7, v8, v13, v6}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v5, v6

    goto :goto_4

    .line 713
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_5
    move-object/from16 v10, v22

    move-object/from16 v13, v23

    .line 716
    .end local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :goto_4
    invoke-static {v7, v1, v2, v3, v5}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 717
    add-long v2, v2, v16

    .line 718
    .end local v5    # "temp":Ljava/lang/Object;
    move-object/from16 v22, v10

    move-object/from16 v23, v13

    const/4 v10, 0x0

    const/4 v13, 0x2

    goto :goto_3

    .line 711
    :catchall_0
    move-exception v0

    move-object v5, v0

    goto :goto_5

    .line 719
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_6
    move-object/from16 v10, v22

    move-object/from16 v13, v23

    .end local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/IteratorLikeIterable;->close()V

    .line 720
    .end local v4    # "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    invoke-static {v7, v1, v2, v3}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 721
    return-object v1

    .line 711
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v4    # "it":Lcom/trendmicro/hippo/IteratorLikeIterable;
    .restart local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :catchall_1
    move-exception v0

    move-object/from16 v10, v22

    move-object/from16 v13, v23

    move-object v5, v0

    .end local v22    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v23    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :goto_5
    :try_start_2
    invoke-virtual {v4}, Lcom/trendmicro/hippo/IteratorLikeIterable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_6

    :catchall_2
    move-exception v0

    move-object v6, v0

    invoke-virtual {v5, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v5

    .line 708
    .end local v1    # "result":Lcom/trendmicro/hippo/Scriptable;
    .end local v2    # "k":J
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v11    # "iterator":Ljava/lang/Object;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .end local v21    # "iteratorProp":Ljava/lang/Object;
    .restart local v3    # "iterator":Ljava/lang/Object;
    .local v4, "mapFn":Lcom/trendmicro/hippo/Function;
    .local v5, "iteratorProp":Ljava/lang/Object;
    .restart local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    move-object v11, v3

    move-object v10, v4

    move-object/from16 v21, v5

    move-object v13, v6

    .end local v3    # "iterator":Ljava/lang/Object;
    .end local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v5    # "iteratorProp":Ljava/lang/Object;
    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v11    # "iterator":Ljava/lang/Object;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v21    # "iteratorProp":Ljava/lang/Object;
    goto :goto_7

    .line 706
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v11    # "iterator":Ljava/lang/Object;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .end local v21    # "iteratorProp":Ljava/lang/Object;
    .restart local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v5    # "iteratorProp":Ljava/lang/Object;
    .restart local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_8
    move-object v10, v4

    move-object/from16 v21, v5

    move-object v13, v6

    .end local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v5    # "iteratorProp":Ljava/lang/Object;
    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v21    # "iteratorProp":Ljava/lang/Object;
    goto :goto_7

    .line 705
    .end local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .end local v21    # "iteratorProp":Ljava/lang/Object;
    .restart local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v5    # "iteratorProp":Ljava/lang/Object;
    .restart local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    :cond_9
    move-object v10, v4

    move-object/from16 v21, v5

    move-object v13, v6

    .line 725
    .end local v4    # "mapFn":Lcom/trendmicro/hippo/Function;
    .end local v5    # "iteratorProp":Ljava/lang/Object;
    .end local v6    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "mapFn":Lcom/trendmicro/hippo/Function;
    .restart local v13    # "thisArg":Lcom/trendmicro/hippo/Scriptable;
    .restart local v21    # "iteratorProp":Ljava/lang/Object;
    :goto_7
    const/4 v0, 0x0

    invoke-static {v7, v12, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v4

    .line 726
    .local v4, "length":J
    const/4 v6, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-wide/from16 v22, v4

    .end local v4    # "length":J
    .local v22, "length":J
    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeArray;->callConstructorOrCreateArray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;JZ)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 727
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    const-wide/16 v1, 0x0

    .local v1, "k":J
    :goto_8
    move-wide/from16 v3, v22

    .end local v22    # "length":J
    .local v3, "length":J
    cmp-long v5, v1, v3

    if-gez v5, :cond_c

    .line 728
    invoke-static {v12, v1, v2}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 729
    .local v5, "temp":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v5, v6, :cond_b

    .line 730
    if-eqz v15, :cond_a

    .line 731
    const/4 v6, 0x2

    new-array v11, v6, [Ljava/lang/Object;

    const/16 v18, 0x0

    aput-object v5, v11, v18

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    const/16 v20, 0x1

    aput-object v19, v11, v20

    invoke-interface {v10, v7, v8, v13, v11}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_9

    .line 730
    :cond_a
    const/4 v6, 0x2

    const/16 v18, 0x0

    const/16 v20, 0x1

    .line 733
    :goto_9
    invoke-static {v7, v0, v1, v2, v5}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    goto :goto_a

    .line 729
    :cond_b
    const/4 v6, 0x2

    const/16 v18, 0x0

    const/16 v20, 0x1

    .line 727
    .end local v5    # "temp":Ljava/lang/Object;
    :goto_a
    add-long v1, v1, v16

    move-wide/from16 v22, v3

    goto :goto_8

    .line 737
    .end local v1    # "k":J
    :cond_c
    invoke-static {v7, v0, v3, v4}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 738
    return-object v0
.end method

.method private static js_includes(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 15
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1718
    move-object/from16 v0, p3

    array-length v1, v0

    const/4 v2, 0x0

    if-lez v1, :cond_0

    aget-object v1, v0, v2

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1720
    .local v1, "compareTo":Ljava/lang/Object;
    :goto_0
    invoke-static/range {p0 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 1721
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "length"

    move-object/from16 v7, p2

    invoke-static {v7, v6}, Lcom/trendmicro/hippo/NativeArray;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toLength([Ljava/lang/Object;I)J

    move-result-wide v5

    .line 1722
    .local v5, "len":J
    const-wide/16 v8, 0x0

    cmp-long v2, v5, v8

    if-nez v2, :cond_1

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v2

    .line 1725
    :cond_1
    array-length v2, v0

    const/4 v10, 0x2

    const-wide/16 v11, 0x1

    if-ge v2, v10, :cond_2

    .line 1726
    const-wide/16 v8, 0x0

    .local v8, "k":J
    goto :goto_2

    .line 1728
    .end local v8    # "k":J
    :cond_2
    aget-object v2, v0, v4

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v13

    double-to-long v13, v13

    .line 1729
    .local v13, "k":J
    cmp-long v2, v13, v8

    if-gez v2, :cond_4

    .line 1730
    add-long/2addr v13, v5

    .line 1731
    cmp-long v2, v13, v8

    if-gez v2, :cond_3

    .line 1732
    const-wide/16 v8, 0x0

    .end local v13    # "k":J
    .restart local v8    # "k":J
    goto :goto_1

    .line 1731
    .end local v8    # "k":J
    .restart local v13    # "k":J
    :cond_3
    move-wide v8, v13

    goto :goto_1

    .line 1729
    :cond_4
    move-wide v8, v13

    .line 1734
    .end local v13    # "k":J
    .restart local v8    # "k":J
    :goto_1
    sub-long v13, v5, v11

    cmp-long v2, v8, v13

    if-lez v2, :cond_5

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v2

    .line 1736
    :cond_5
    :goto_2
    instance-of v2, v3, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v2, :cond_a

    .line 1737
    move-object v2, v3

    check-cast v2, Lcom/trendmicro/hippo/NativeArray;

    .line 1738
    .local v2, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v4, v2, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v4, :cond_a

    .line 1739
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeArray;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 1740
    .local v4, "proto":Lcom/trendmicro/hippo/Scriptable;
    long-to-int v10, v8

    .local v10, "i":I
    :goto_3
    int-to-long v11, v10

    cmp-long v11, v11, v5

    if-gez v11, :cond_9

    .line 1741
    iget-object v11, v2, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v11, v11, v10

    .line 1742
    .local v11, "elementK":Ljava/lang/Object;
    sget-object v12, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v11, v12, :cond_6

    if-eqz v4, :cond_6

    .line 1743
    invoke-static {v4, v10}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v11

    .line 1745
    :cond_6
    sget-object v12, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v11, v12, :cond_7

    .line 1746
    sget-object v11, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1748
    :cond_7
    invoke-static {v11, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->sameZero(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 1749
    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v12

    .line 1740
    .end local v11    # "elementK":Ljava/lang/Object;
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 1752
    .end local v10    # "i":I
    :cond_9
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v10

    .line 1755
    .end local v2    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v4    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_a
    :goto_4
    cmp-long v2, v8, v5

    if-gez v2, :cond_d

    .line 1756
    invoke-static {v3, v8, v9}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v2

    .line 1757
    .local v2, "elementK":Ljava/lang/Object;
    sget-object v4, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v4, :cond_b

    .line 1758
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1760
    :cond_b
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->sameZero(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 1761
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v4

    .line 1755
    .end local v2    # "elementK":Ljava/lang/Object;
    :cond_c
    add-long/2addr v8, v11

    goto :goto_4

    .line 1764
    :cond_d
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v2
.end method

.method private static js_indexOf(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1604
    array-length v0, p3

    const/4 v1, 0x0

    if-lez v0, :cond_0

    aget-object v0, p3, v1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1606
    .local v0, "compareTo":Ljava/lang/Object;
    :goto_0
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1607
    .local v2, "o":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {p0, v2, v1}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v3

    .line 1619
    .local v3, "length":J
    array-length v1, p3

    const/4 v5, 0x2

    const-wide/16 v6, 0x1

    if-ge v1, v5, :cond_1

    .line 1621
    const-wide/16 v8, 0x0

    .local v8, "start":J
    goto :goto_1

    .line 1623
    .end local v8    # "start":J
    :cond_1
    const/4 v1, 0x1

    aget-object v1, p3, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v8

    double-to-long v8, v8

    .line 1624
    .restart local v8    # "start":J
    const-wide/16 v10, 0x0

    cmp-long v1, v8, v10

    if-gez v1, :cond_2

    .line 1625
    add-long/2addr v8, v3

    .line 1626
    cmp-long v1, v8, v10

    if-gez v1, :cond_2

    .line 1627
    const-wide/16 v8, 0x0

    .line 1629
    :cond_2
    sub-long v10, v3, v6

    cmp-long v1, v8, v10

    if-lez v1, :cond_3

    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v1

    .line 1631
    :cond_3
    :goto_1
    instance-of v1, v2, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v1, :cond_7

    .line 1632
    move-object v1, v2

    check-cast v1, Lcom/trendmicro/hippo/NativeArray;

    .line 1633
    .local v1, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v5, v1, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_7

    .line 1634
    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeArray;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 1635
    .local v5, "proto":Lcom/trendmicro/hippo/Scriptable;
    long-to-int v6, v8

    .local v6, "i":I
    :goto_2
    int-to-long v10, v6

    cmp-long v7, v10, v3

    if-gez v7, :cond_6

    .line 1636
    iget-object v7, v1, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v7, v7, v6

    .line 1637
    .local v7, "val":Ljava/lang/Object;
    sget-object v10, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v7, v10, :cond_4

    if-eqz v5, :cond_4

    .line 1638
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v7

    .line 1640
    :cond_4
    sget-object v10, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v10, :cond_5

    .line 1641
    invoke-static {v7, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1643
    int-to-long v10, v6

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    return-object v10

    .line 1635
    .end local v7    # "val":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1646
    .end local v6    # "i":I
    :cond_6
    sget-object v6, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v6

    .line 1649
    .end local v1    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v5    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    move-wide v10, v8

    .local v10, "i":J
    :goto_3
    cmp-long v1, v10, v3

    if-gez v1, :cond_9

    .line 1650
    invoke-static {v2, v10, v11}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v1

    .line 1651
    .local v1, "val":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v5, :cond_8

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 1652
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    return-object v5

    .line 1649
    .end local v1    # "val":Ljava/lang/Object;
    :cond_8
    add-long/2addr v10, v6

    goto :goto_3

    .line 1655
    .end local v10    # "i":J
    :cond_9
    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v1
.end method

.method private static js_isArray(Ljava/lang/Object;)Z
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;

    .line 2021
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 2022
    const/4 v0, 0x0

    return v0

    .line 2024
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Array"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static js_join(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1044
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v1

    .line 1045
    .local v1, "llength":J
    long-to-int v3, v1

    .line 1046
    .local v3, "length":I
    int-to-long v4, v3

    cmp-long v4, v1, v4

    if-nez v4, :cond_c

    .line 1051
    array-length v4, p2

    const/4 v5, 0x1

    if-lt v4, v5, :cond_1

    aget-object v4, p2, v0

    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v4, v5, :cond_0

    goto :goto_0

    .line 1053
    :cond_0
    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1052
    :cond_1
    :goto_0
    const-string v0, ","

    .line 1053
    :goto_1
    nop

    .line 1054
    .local v0, "separator":Ljava/lang/String;
    instance-of v4, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v4, :cond_5

    .line 1055
    move-object v4, p1

    check-cast v4, Lcom/trendmicro/hippo/NativeArray;

    .line 1056
    .local v4, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v5, v4, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_5

    .line 1057
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 1058
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    if-ge v6, v3, :cond_4

    .line 1059
    if-eqz v6, :cond_2

    .line 1060
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1062
    :cond_2
    iget-object v7, v4, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v8, v7

    if-ge v6, v8, :cond_3

    .line 1063
    aget-object v7, v7, v6

    .line 1064
    .local v7, "temp":Ljava/lang/Object;
    if-eqz v7, :cond_3

    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v7, v8, :cond_3

    sget-object v8, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v7, v8, :cond_3

    .line 1067
    invoke-static {v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1058
    .end local v7    # "temp":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1071
    .end local v6    # "i":I
    :cond_4
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 1074
    .end local v4    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    :cond_5
    if-nez v3, :cond_6

    .line 1075
    const-string v4, ""

    return-object v4

    .line 1077
    :cond_6
    new-array v4, v3, [Ljava/lang/String;

    .line 1078
    .local v4, "buf":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 1079
    .local v5, "total_size":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_3
    if-eq v6, v3, :cond_8

    .line 1080
    int-to-long v7, v6

    invoke-static {p0, p1, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->getElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v7

    .line 1081
    .restart local v7    # "temp":Ljava/lang/Object;
    if-eqz v7, :cond_7

    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v7, v8, :cond_7

    .line 1082
    invoke-static {v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 1083
    .local v8, "str":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v5, v9

    .line 1084
    aput-object v8, v4, v6

    .line 1079
    .end local v7    # "temp":Ljava/lang/Object;
    .end local v8    # "str":Ljava/lang/String;
    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1087
    .end local v6    # "i":I
    :cond_8
    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    mul-int/2addr v6, v7

    add-int/2addr v5, v6

    .line 1088
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1089
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    if-eq v7, v3, :cond_b

    .line 1090
    if-eqz v7, :cond_9

    .line 1091
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1093
    :cond_9
    aget-object v8, v4, v7

    .line 1094
    .restart local v8    # "str":Ljava/lang/String;
    if-eqz v8, :cond_a

    .line 1096
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1089
    .end local v8    # "str":Ljava/lang/String;
    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 1099
    .end local v7    # "i":I
    :cond_b
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 1047
    .end local v0    # "separator":Ljava/lang/String;
    .end local v4    # "buf":[Ljava/lang/String;
    .end local v5    # "total_size":I
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    :cond_c
    nop

    .line 1048
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 1047
    const-string v4, "msg.arraylength.too.big"

    invoke-static {v4, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method private static js_lastIndexOf(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1660
    move-object/from16 v0, p3

    array-length v1, v0

    const/4 v2, 0x0

    if-lez v1, :cond_0

    aget-object v1, v0, v2

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1662
    .local v1, "compareTo":Ljava/lang/Object;
    :goto_0
    invoke-static/range {p0 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 1663
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v4, p0

    invoke-static {v4, v3, v2}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v5

    .line 1676
    .local v5, "length":J
    array-length v2, v0

    const/4 v7, 0x2

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x1

    if-ge v2, v7, :cond_1

    .line 1678
    sub-long v12, v5, v10

    .local v12, "start":J
    goto :goto_2

    .line 1680
    .end local v12    # "start":J
    :cond_1
    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v12

    double-to-long v12, v12

    .line 1681
    .restart local v12    # "start":J
    cmp-long v2, v12, v5

    if-ltz v2, :cond_2

    .line 1682
    sub-long v12, v5, v10

    goto :goto_1

    .line 1683
    :cond_2
    cmp-long v2, v12, v8

    if-gez v2, :cond_3

    .line 1684
    add-long/2addr v12, v5

    .line 1685
    :cond_3
    :goto_1
    cmp-long v2, v12, v8

    if-gez v2, :cond_4

    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v2

    .line 1687
    :cond_4
    :goto_2
    instance-of v2, v3, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v2, :cond_8

    .line 1688
    move-object v2, v3

    check-cast v2, Lcom/trendmicro/hippo/NativeArray;

    .line 1689
    .local v2, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v7, v2, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v7, :cond_8

    .line 1690
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeArray;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 1691
    .local v7, "proto":Lcom/trendmicro/hippo/Scriptable;
    long-to-int v8, v12

    .local v8, "i":I
    :goto_3
    if-ltz v8, :cond_7

    .line 1692
    iget-object v9, v2, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v9, v8

    .line 1693
    .local v9, "val":Ljava/lang/Object;
    sget-object v10, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v9, v10, :cond_5

    if-eqz v7, :cond_5

    .line 1694
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v9

    .line 1696
    :cond_5
    sget-object v10, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_6

    .line 1697
    invoke-static {v9, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 1699
    int-to-long v10, v8

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    return-object v10

    .line 1691
    .end local v9    # "val":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v8, v8, -0x1

    goto :goto_3

    .line 1702
    .end local v8    # "i":I
    :cond_7
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v8

    .line 1705
    .end local v2    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v7    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_8
    move-wide v14, v12

    .local v14, "i":J
    :goto_4
    cmp-long v2, v14, v8

    if-ltz v2, :cond_a

    .line 1706
    invoke-static {v3, v14, v15}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v2

    .line 1707
    .local v2, "val":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v7, :cond_9

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 1708
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    return-object v7

    .line 1705
    .end local v2    # "val":Ljava/lang/Object;
    :cond_9
    sub-long/2addr v14, v10

    goto :goto_4

    .line 1711
    .end local v14    # "i":J
    :cond_a
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->NEGATIVE_ONE:Ljava/lang/Long;

    return-object v2
.end method

.method private static js_of(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 743
    array-length v0, p3

    int-to-long v4, v0

    .line 744
    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeArray;->callConstructorOrCreateArray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;JZ)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 746
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p3

    if-ge v1, v2, :cond_0

    .line 747
    int-to-long v2, v1

    aget-object v4, p3, v1

    invoke-static {p0, v0, v2, v3, v4}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 746
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 749
    .end local v1    # "i":I
    :cond_0
    array-length v1, p3

    int-to-long v1, v1

    invoke-static {p0, v0, v1, v2}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 751
    return-object v0
.end method

.method private static js_pop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1227
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    const-wide/16 v1, 0x1

    const-wide/16 v3, 0x0

    if-eqz v0, :cond_0

    .line 1228
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 1229
    .local v0, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v5, v0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_0

    iget-wide v5, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v7, v5, v3

    if-lez v7, :cond_0

    .line 1230
    sub-long/2addr v5, v1

    iput-wide v5, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 1231
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v2, v5

    aget-object v2, v1, v2

    .line 1232
    .local v2, "result":Ljava/lang/Object;
    long-to-int v3, v5

    sget-object v4, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v4, v1, v3

    .line 1233
    return-object v2

    .line 1236
    .end local v0    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v2    # "result":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v5

    .line 1237
    .local v5, "length":J
    cmp-long v0, v5, v3

    if-lez v0, :cond_1

    .line 1238
    sub-long/2addr v5, v1

    .line 1241
    invoke-static {p0, p1, v5, v6}, Lcom/trendmicro/hippo/NativeArray;->getElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 1245
    .local v0, "result":Ljava/lang/Object;
    invoke-static {p1, v5, v6}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    goto :goto_0

    .line 1247
    .end local v0    # "result":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1251
    .restart local v0    # "result":Ljava/lang/Object;
    :goto_0
    invoke-static {p0, p1, v5, v6}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1253
    return-object v0
.end method

.method private static js_push(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1191
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v0, :cond_1

    .line 1192
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 1193
    .local v0, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v1, v0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v1, :cond_1

    iget-wide v1, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v1, v1

    array-length v2, p2

    add-int/2addr v1, v2

    .line 1194
    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1196
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    .line 1197
    iget-object v2, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v3, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    const-wide/16 v5, 0x1

    add-long/2addr v5, v3

    iput-wide v5, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v3, v3

    aget-object v4, p2, v1

    aput-object v4, v2, v3

    .line 1196
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1199
    .end local v1    # "i":I
    :cond_0
    iget-wide v1, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-double v1, v1

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    return-object v1

    .line 1202
    .end local v0    # "na":Lcom/trendmicro/hippo/NativeArray;
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v0

    .line 1203
    .local v0, "length":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, p2

    if-ge v2, v3, :cond_2

    .line 1204
    int-to-long v3, v2

    add-long/2addr v3, v0

    aget-object v5, p2, v2

    invoke-static {p0, p1, v3, v4, v5}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1203
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1207
    .end local v2    # "i":I
    :cond_2
    array-length v2, p2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 1208
    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v2

    .line 1214
    .local v2, "lengthObj":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_4

    .line 1216
    array-length v3, p2

    if-nez v3, :cond_3

    .line 1217
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_2

    .line 1218
    :cond_3
    array-length v3, p2

    add-int/lit8 v3, v3, -0x1

    aget-object v3, p2, v3

    .line 1216
    :goto_2
    return-object v3

    .line 1220
    :cond_4
    return-object v2
.end method

.method private static js_reverse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1107
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v0, :cond_1

    .line 1108
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 1109
    .local v0, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v1, v0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v1, :cond_1

    .line 1110
    const/4 v1, 0x0

    .local v1, "i":I
    iget-wide v2, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v2, v2

    add-int/lit8 v2, v2, -0x1

    .local v2, "j":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 1111
    iget-object v3, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v4, v3, v1

    .line 1112
    .local v4, "temp":Ljava/lang/Object;
    aget-object v5, v3, v2

    aput-object v5, v3, v1

    .line 1113
    aput-object v4, v3, v2

    .line 1110
    .end local v4    # "temp":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 1115
    .end local v1    # "i":I
    .end local v2    # "j":I
    :cond_0
    return-object p1

    .line 1118
    .end local v0    # "na":Lcom/trendmicro/hippo/NativeArray;
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v0

    .line 1120
    .local v0, "len":J
    const-wide/16 v2, 0x2

    div-long v2, v0, v2

    .line 1121
    .local v2, "half":J
    const-wide/16 v4, 0x0

    .local v4, "i":J
    :goto_1
    cmp-long v6, v4, v2

    if-gez v6, :cond_2

    .line 1122
    sub-long v6, v0, v4

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    .line 1123
    .local v6, "j":J
    invoke-static {p1, v4, v5}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v10

    .line 1124
    .local v10, "temp1":Ljava/lang/Object;
    invoke-static {p1, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v11

    .line 1125
    .local v11, "temp2":Ljava/lang/Object;
    invoke-static {p0, p1, v4, v5, v11}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1126
    invoke-static {p0, p1, v6, v7, v10}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1121
    .end local v6    # "j":J
    .end local v10    # "temp1":Ljava/lang/Object;
    .end local v11    # "temp2":Ljava/lang/Object;
    add-long/2addr v4, v8

    goto :goto_1

    .line 1128
    .end local v4    # "i":J
    :cond_2
    return-object p1
.end method

.method private static js_shift(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1258
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x1

    if-eqz v0, :cond_1

    .line 1259
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 1260
    .local v0, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v6, v0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v6, :cond_1

    iget-wide v6, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v8, v6, v1

    if-lez v8, :cond_1

    .line 1261
    sub-long/2addr v6, v4

    iput-wide v6, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 1262
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v2, v1, v3

    .line 1263
    .local v2, "result":Ljava/lang/Object;
    const/4 v4, 0x1

    long-to-int v5, v6

    invoke-static {v1, v4, v1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1264
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v3, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v3, v3

    sget-object v4, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v4, v1, v3

    .line 1265
    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v1, :cond_0

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    return-object v1

    .line 1269
    .end local v0    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1
    invoke-static {p0, p1, v3}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v6

    .line 1270
    .local v6, "length":J
    cmp-long v0, v6, v1

    if-lez v0, :cond_3

    .line 1271
    const-wide/16 v8, 0x0

    .line 1272
    .local v8, "i":J
    sub-long/2addr v6, v4

    .line 1275
    invoke-static {p0, p1, v8, v9}, Lcom/trendmicro/hippo/NativeArray;->getElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 1281
    .local v0, "result":Ljava/lang/Object;
    cmp-long v1, v6, v1

    if-lez v1, :cond_2

    .line 1282
    const-wide/16 v1, 0x1

    move-wide v8, v1

    :goto_1
    cmp-long v1, v8, v6

    if-gtz v1, :cond_2

    .line 1283
    invoke-static {p1, v8, v9}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v1

    .line 1284
    .local v1, "temp":Ljava/lang/Object;
    sub-long v2, v8, v4

    invoke-static {p0, p1, v2, v3, v1}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1282
    .end local v1    # "temp":Ljava/lang/Object;
    add-long/2addr v8, v4

    goto :goto_1

    .line 1289
    :cond_2
    invoke-static {p1, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    .line 1290
    .end local v8    # "i":J
    goto :goto_2

    .line 1291
    .end local v0    # "result":Ljava/lang/Object;
    :cond_3
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1293
    .restart local v0    # "result":Ljava/lang/Object;
    :goto_2
    invoke-static {p0, p1, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1294
    return-object v0
.end method

.method private js_slice(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 16
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1558
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/NativeArray;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 1559
    .local v3, "scope":Lcom/trendmicro/hippo/Scriptable;
    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 1560
    .local v5, "result":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v0, v1, v4}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v6

    .line 1563
    .local v6, "len":J
    array-length v8, v2

    if-nez v8, :cond_0

    .line 1564
    const-wide/16 v8, 0x0

    .line 1565
    .local v8, "begin":J
    move-wide v10, v6

    .local v10, "end":J
    goto :goto_1

    .line 1567
    .end local v8    # "begin":J
    .end local v10    # "end":J
    :cond_0
    aget-object v4, v2, v4

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v8

    invoke-static {v8, v9, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v8

    .line 1568
    .restart local v8    # "begin":J
    array-length v4, v2

    const/4 v10, 0x1

    if-eq v4, v10, :cond_2

    aget-object v4, v2, v10

    sget-object v11, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v4, v11, :cond_1

    goto :goto_0

    .line 1571
    :cond_1
    aget-object v4, v2, v10

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    invoke-static {v10, v11, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v10

    .restart local v10    # "end":J
    goto :goto_1

    .line 1569
    .end local v10    # "end":J
    :cond_2
    :goto_0
    move-wide v10, v6

    .line 1575
    .restart local v10    # "end":J
    :goto_1
    move-wide v12, v8

    .local v12, "slot":J
    :goto_2
    cmp-long v4, v12, v10

    if-gez v4, :cond_4

    .line 1576
    invoke-static {v1, v12, v13}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v4

    .line 1577
    .local v4, "temp":Ljava/lang/Object;
    sget-object v14, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v14, :cond_3

    .line 1578
    sub-long v14, v12, v8

    invoke-static {v0, v5, v14, v15, v4}, Lcom/trendmicro/hippo/NativeArray;->defineElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1575
    .end local v4    # "temp":Ljava/lang/Object;
    :cond_3
    const-wide/16 v14, 0x1

    add-long/2addr v12, v14

    goto :goto_2

    .line 1581
    .end local v12    # "slot":J
    :cond_4
    const-wide/16 v12, 0x0

    sub-long v14, v10, v8

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    invoke-static {v0, v5, v12, v13}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1583
    return-object v5
.end method

.method private static js_sort(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1138
    array-length v0, p3

    const/4 v1, 0x0

    if-lez v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v2, p3, v1

    if-eq v0, v2, :cond_0

    .line 1139
    aget-object v0, p3, v1

    .line 1140
    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    .line 1141
    .local v0, "jsCompareFunction":Lcom/trendmicro/hippo/Callable;
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 1142
    .local v8, "funThis":Lcom/trendmicro/hippo/Scriptable;
    const/4 v2, 0x2

    new-array v9, v2, [Ljava/lang/Object;

    .line 1143
    .local v9, "cmpBuf":[Ljava/lang/Object;
    new-instance v10, Lcom/trendmicro/hippo/NativeArray$ElementComparator;

    new-instance v11, Lcom/trendmicro/hippo/NativeArray$1;

    move-object v2, v11

    move-object v3, v9

    move-object v4, v0

    move-object v5, p0

    move-object v6, p1

    move-object v7, v8

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/NativeArray$1;-><init>([Ljava/lang/Object;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-direct {v10, v11}, Lcom/trendmicro/hippo/NativeArray$ElementComparator;-><init>(Ljava/util/Comparator;)V

    move-object v0, v10

    .line 1161
    .end local v8    # "funThis":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "cmpBuf":[Ljava/lang/Object;
    .local v0, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    goto :goto_0

    .line 1162
    .end local v0    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/NativeArray;->DEFAULT_COMPARATOR:Ljava/util/Comparator;

    .line 1165
    .restart local v0    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    :goto_0
    invoke-static {p0, p2, v1}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v1

    .line 1166
    .local v1, "llength":J
    long-to-int v3, v1

    .line 1167
    .local v3, "length":I
    int-to-long v4, v3

    cmp-long v4, v1, v4

    if-nez v4, :cond_3

    .line 1173
    new-array v4, v3, [Ljava/lang/Object;

    .line 1174
    .local v4, "working":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-eq v5, v3, :cond_1

    .line 1175
    int-to-long v6, v5

    invoke-static {p2, v6, v7}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1174
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1178
    .end local v5    # "i":I
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Sorting;->get()Lcom/trendmicro/hippo/Sorting;

    move-result-object v5

    invoke-virtual {v5, v4, v0}, Lcom/trendmicro/hippo/Sorting;->hybridSort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1181
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_2
    if-ge v5, v3, :cond_2

    .line 1182
    int-to-long v6, v5

    aget-object v8, v4, v5

    invoke-static {p0, p2, v6, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1181
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1185
    .end local v5    # "i":I
    :cond_2
    return-object p2

    .line 1168
    .end local v4    # "working":[Ljava/lang/Object;
    :cond_3
    nop

    .line 1169
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    .line 1168
    const-string v5, "msg.arraylength.too.big"

    invoke-static {v5, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4
.end method

.method private static js_splice(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 27
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1338
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const/4 v3, 0x0

    .line 1339
    .local v3, "na":Lcom/trendmicro/hippo/NativeArray;
    const/4 v4, 0x0

    .line 1340
    .local v4, "denseMode":Z
    instance-of v5, v1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v5, :cond_0

    .line 1341
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/NativeArray;

    .line 1342
    iget-boolean v4, v3, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 1346
    :cond_0
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/NativeArray;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 1347
    .end local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .local v5, "scope":Lcom/trendmicro/hippo/Scriptable;
    array-length v6, v2

    .line 1348
    .local v6, "argc":I
    const/4 v7, 0x0

    if-nez v6, :cond_1

    .line 1349
    invoke-virtual {v0, v5, v7}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    return-object v7

    .line 1350
    :cond_1
    invoke-static {v0, v1, v7}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v8

    .line 1353
    .local v8, "length":J
    aget-object v10, v2, v7

    invoke-static {v10}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    invoke-static {v10, v11, v8, v9}, Lcom/trendmicro/hippo/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v10

    .line 1354
    .local v10, "begin":J
    add-int/lit8 v6, v6, -0x1

    .line 1358
    array-length v12, v2

    const/4 v13, 0x1

    if-ne v12, v13, :cond_2

    .line 1359
    sub-long v12, v8, v10

    .local v12, "count":J
    goto :goto_1

    .line 1361
    .end local v12    # "count":J
    :cond_2
    aget-object v12, v2, v13

    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v12

    .line 1362
    .local v12, "dcount":D
    const-wide/16 v14, 0x0

    cmpg-double v14, v12, v14

    if-gez v14, :cond_3

    .line 1363
    const-wide/16 v14, 0x0

    .local v14, "count":J
    goto :goto_0

    .line 1364
    .end local v14    # "count":J
    :cond_3
    sub-long v14, v8, v10

    long-to-double v14, v14

    cmpl-double v14, v12, v14

    if-lez v14, :cond_4

    .line 1365
    sub-long v14, v8, v10

    .restart local v14    # "count":J
    goto :goto_0

    .line 1367
    .end local v14    # "count":J
    :cond_4
    double-to-long v14, v12

    .line 1369
    .restart local v14    # "count":J
    :goto_0
    add-int/lit8 v6, v6, -0x1

    move-wide v12, v14

    .line 1372
    .end local v14    # "count":J
    .local v12, "count":J
    :goto_1
    add-long v14, v10, v12

    .line 1376
    .local v14, "end":J
    const-wide/16 v16, 0x0

    cmp-long v18, v12, v16

    const/16 v7, 0x78

    const-wide/16 v19, 0x1

    if-eqz v18, :cond_9

    .line 1377
    cmp-long v18, v12, v19

    if-nez v18, :cond_5

    .line 1378
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v2

    if-ne v2, v7, :cond_5

    .line 1391
    invoke-static {v0, v1, v10, v11}, Lcom/trendmicro/hippo/NativeArray;->getElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v18, v3

    move-wide/from16 v21, v8

    move-wide/from16 v23, v12

    .local v2, "result":Ljava/lang/Object;
    goto :goto_4

    .line 1393
    .end local v2    # "result":Ljava/lang/Object;
    :cond_5
    if-eqz v4, :cond_6

    .line 1394
    move-wide/from16 v21, v8

    .end local v8    # "length":J
    .local v21, "length":J
    sub-long v7, v14, v10

    long-to-int v2, v7

    .line 1395
    .local v2, "intLen":I
    new-array v7, v2, [Ljava/lang/Object;

    .line 1396
    .local v7, "copy":[Ljava/lang/Object;
    iget-object v8, v3, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v9, v10

    move-object/from16 v18, v3

    const/4 v3, 0x0

    .end local v3    # "na":Lcom/trendmicro/hippo/NativeArray;
    .local v18, "na":Lcom/trendmicro/hippo/NativeArray;
    invoke-static {v8, v9, v7, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1397
    invoke-virtual {v0, v5, v7}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1398
    .end local v7    # "copy":[Ljava/lang/Object;
    .local v2, "result":Ljava/lang/Object;
    move-wide/from16 v23, v12

    goto :goto_4

    .line 1399
    .end local v2    # "result":Ljava/lang/Object;
    .end local v18    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v21    # "length":J
    .restart local v3    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v8    # "length":J
    :cond_6
    move-object/from16 v18, v3

    move-wide/from16 v21, v8

    const/4 v3, 0x0

    .end local v3    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v8    # "length":J
    .restart local v18    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v21    # "length":J
    invoke-virtual {v0, v5, v3}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1400
    .local v2, "resultArray":Lcom/trendmicro/hippo/Scriptable;
    move-wide v7, v10

    .local v7, "last":J
    :goto_2
    cmp-long v3, v7, v14

    if-eqz v3, :cond_8

    .line 1401
    invoke-static {v1, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1402
    .local v3, "temp":Ljava/lang/Object;
    sget-object v9, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v9, :cond_7

    .line 1403
    move-wide/from16 v23, v12

    .end local v12    # "count":J
    .local v23, "count":J
    sub-long v12, v7, v10

    invoke-static {v0, v2, v12, v13, v3}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    goto :goto_3

    .line 1402
    .end local v23    # "count":J
    .restart local v12    # "count":J
    :cond_7
    move-wide/from16 v23, v12

    .line 1400
    .end local v3    # "temp":Ljava/lang/Object;
    .end local v12    # "count":J
    .restart local v23    # "count":J
    :goto_3
    add-long v7, v7, v19

    move-wide/from16 v12, v23

    goto :goto_2

    .end local v23    # "count":J
    .restart local v12    # "count":J
    :cond_8
    move-wide/from16 v23, v12

    .line 1407
    .end local v7    # "last":J
    .end local v12    # "count":J
    .restart local v23    # "count":J
    sub-long v7, v14, v10

    invoke-static {v0, v2, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1408
    nop

    .line 1409
    .local v2, "result":Ljava/lang/Object;
    goto :goto_4

    .line 1412
    .end local v2    # "result":Ljava/lang/Object;
    .end local v18    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v21    # "length":J
    .end local v23    # "count":J
    .local v3, "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v8    # "length":J
    .restart local v12    # "count":J
    :cond_9
    move-object/from16 v18, v3

    move-wide/from16 v21, v8

    move-wide/from16 v23, v12

    .end local v3    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v8    # "length":J
    .end local v12    # "count":J
    .restart local v18    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v21    # "length":J
    .restart local v23    # "count":J
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v2

    if-ne v2, v7, :cond_a

    .line 1414
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .restart local v2    # "result":Ljava/lang/Object;
    goto :goto_4

    .line 1416
    .end local v2    # "result":Ljava/lang/Object;
    :cond_a
    const/4 v2, 0x0

    invoke-virtual {v0, v5, v2}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1421
    .restart local v2    # "result":Ljava/lang/Object;
    :goto_4
    int-to-long v7, v6

    sub-long v7, v7, v23

    .line 1422
    .local v7, "delta":J
    if-eqz v4, :cond_e

    add-long v12, v21, v7

    const-wide/32 v25, 0x7fffffff

    cmp-long v3, v12, v25

    if-gez v3, :cond_e

    add-long v12, v21, v7

    long-to-int v3, v12

    .line 1423
    move-object/from16 v9, v18

    .end local v18    # "na":Lcom/trendmicro/hippo/NativeArray;
    .local v9, "na":Lcom/trendmicro/hippo/NativeArray;
    invoke-direct {v9, v3}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 1425
    iget-object v3, v9, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v12, v14

    move v13, v4

    move-object/from16 p1, v5

    .end local v4    # "denseMode":Z
    .end local v5    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .local v13, "denseMode":Z
    .restart local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    int-to-long v4, v6

    add-long/2addr v4, v10

    long-to-int v4, v4

    sub-long v0, v21, v14

    long-to-int v0, v0

    invoke-static {v3, v12, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1427
    if-lez v6, :cond_b

    .line 1428
    const/4 v0, 0x2

    iget-object v1, v9, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v3, v10

    move-object/from16 v4, p3

    invoke-static {v4, v0, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_5

    .line 1427
    :cond_b
    move-object/from16 v4, p3

    .line 1430
    :goto_5
    cmp-long v0, v7, v16

    if-gez v0, :cond_c

    .line 1431
    iget-object v0, v9, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    move v1, v13

    .end local v13    # "denseMode":Z
    .local v1, "denseMode":Z
    add-long v12, v21, v7

    long-to-int v3, v12

    move-wide/from16 v12, v21

    .end local v21    # "length":J
    .local v12, "length":J
    long-to-int v5, v12

    move/from16 v18, v1

    .end local v1    # "denseMode":Z
    .local v18, "denseMode":Z
    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v0, v3, v5, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_6

    .line 1430
    .end local v12    # "length":J
    .end local v18    # "denseMode":Z
    .restart local v13    # "denseMode":Z
    .restart local v21    # "length":J
    :cond_c
    move/from16 v18, v13

    move-wide/from16 v12, v21

    .line 1434
    .end local v13    # "denseMode":Z
    .end local v21    # "length":J
    .restart local v12    # "length":J
    .restart local v18    # "denseMode":Z
    :goto_6
    add-long v0, v12, v7

    iput-wide v0, v9, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 1435
    return-object v2

    .line 1423
    .end local v12    # "length":J
    .end local v18    # "denseMode":Z
    .end local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v4    # "denseMode":Z
    .restart local v5    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v21    # "length":J
    :cond_d
    move/from16 v18, v4

    move-object/from16 p1, v5

    move-wide/from16 v12, v21

    move-object/from16 v4, p3

    .end local v4    # "denseMode":Z
    .end local v5    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v21    # "length":J
    .restart local v12    # "length":J
    .restart local v18    # "denseMode":Z
    .restart local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_7

    .line 1422
    .end local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v12    # "length":J
    .end local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local v4    # "denseMode":Z
    .restart local v5    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .local v18, "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v21    # "length":J
    :cond_e
    move-object/from16 p1, v5

    move-object/from16 v9, v18

    move-wide/from16 v12, v21

    move/from16 v18, v4

    move-object/from16 v4, p3

    .line 1438
    .end local v4    # "denseMode":Z
    .end local v5    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v21    # "length":J
    .restart local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v12    # "length":J
    .local v18, "denseMode":Z
    .restart local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    :goto_7
    cmp-long v0, v7, v16

    if-lez v0, :cond_10

    .line 1439
    sub-long v0, v12, v19

    .local v0, "last":J
    :goto_8
    cmp-long v3, v0, v14

    if-ltz v3, :cond_f

    .line 1440
    move-object/from16 v3, p2

    invoke-static {v3, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1441
    .local v5, "temp":Ljava/lang/Object;
    move-wide/from16 v21, v10

    move-object v11, v9

    .end local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v10    # "begin":J
    .local v11, "na":Lcom/trendmicro/hippo/NativeArray;
    .local v21, "begin":J
    add-long v9, v0, v7

    move-object/from16 v25, v11

    move-object/from16 v11, p0

    .end local v11    # "na":Lcom/trendmicro/hippo/NativeArray;
    .local v25, "na":Lcom/trendmicro/hippo/NativeArray;
    invoke-static {v11, v3, v9, v10, v5}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1439
    .end local v5    # "temp":Ljava/lang/Object;
    sub-long v0, v0, v19

    move-wide/from16 v10, v21

    move-object/from16 v9, v25

    goto :goto_8

    .end local v21    # "begin":J
    .end local v25    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v10    # "begin":J
    :cond_f
    move-object/from16 v3, p2

    move-object/from16 v25, v9

    move-wide/from16 v21, v10

    move-object/from16 v11, p0

    .end local v0    # "last":J
    .end local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v10    # "begin":J
    .restart local v21    # "begin":J
    .restart local v25    # "na":Lcom/trendmicro/hippo/NativeArray;
    goto :goto_b

    .line 1443
    .end local v21    # "begin":J
    .end local v25    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .restart local v10    # "begin":J
    :cond_10
    move-object/from16 v3, p2

    move-object/from16 v25, v9

    move-wide/from16 v21, v10

    move-object/from16 v11, p0

    .end local v9    # "na":Lcom/trendmicro/hippo/NativeArray;
    .end local v10    # "begin":J
    .restart local v21    # "begin":J
    .restart local v25    # "na":Lcom/trendmicro/hippo/NativeArray;
    cmp-long v0, v7, v16

    if-gez v0, :cond_12

    .line 1444
    move-wide v0, v14

    .restart local v0    # "last":J
    :goto_9
    cmp-long v5, v0, v12

    if-gez v5, :cond_11

    .line 1445
    invoke-static {v3, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1446
    .restart local v5    # "temp":Ljava/lang/Object;
    add-long v9, v0, v7

    invoke-static {v11, v3, v9, v10, v5}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1444
    .end local v5    # "temp":Ljava/lang/Object;
    add-long v0, v0, v19

    goto :goto_9

    .line 1452
    .end local v0    # "last":J
    :cond_11
    sub-long v0, v12, v19

    .local v0, "k":J
    :goto_a
    add-long v9, v12, v7

    cmp-long v5, v0, v9

    if-ltz v5, :cond_12

    .line 1453
    invoke-static {v3, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    .line 1452
    sub-long v0, v0, v19

    goto :goto_a

    .line 1458
    .end local v0    # "k":J
    :cond_12
    :goto_b
    array-length v0, v4

    sub-int/2addr v0, v6

    .line 1459
    .local v0, "argoffset":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v6, :cond_13

    .line 1460
    int-to-long v9, v1

    add-long v9, v21, v9

    add-int v5, v1, v0

    aget-object v5, v4, v5

    invoke-static {v11, v3, v9, v10, v5}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1459
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 1464
    .end local v1    # "i":I
    :cond_13
    add-long v9, v12, v7

    invoke-static {v11, v3, v9, v10}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    .line 1465
    return-object v2
.end method

.method private static js_unshift(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 1299
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1300
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 1301
    .local v0, "na":Lcom/trendmicro/hippo/NativeArray;
    iget-boolean v2, v0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v2, :cond_1

    iget-wide v2, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v2, v2

    array-length v3, p2

    add-int/2addr v2, v3

    .line 1302
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1304
    iget-object v2, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v3, p2

    iget-wide v4, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-int v4, v4

    invoke-static {v2, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1306
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    .line 1307
    iget-object v2, v0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v3, p2, v1

    aput-object v3, v2, v1

    .line 1306
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1309
    .end local v1    # "i":I
    :cond_0
    iget-wide v1, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    array-length v3, p2

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, v0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 1310
    long-to-double v1, v1

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    return-object v1

    .line 1313
    .end local v0    # "na":Lcom/trendmicro/hippo/NativeArray;
    :cond_1
    invoke-static {p0, p1, v1}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v0

    .line 1314
    .local v0, "length":J
    array-length v2, p2

    .line 1316
    .local v2, "argc":I
    array-length v3, p2

    if-lez v3, :cond_3

    .line 1318
    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_2

    .line 1319
    const-wide/16 v5, 0x1

    sub-long v7, v0, v5

    .local v7, "last":J
    :goto_1
    cmp-long v9, v7, v3

    if-ltz v9, :cond_2

    .line 1320
    invoke-static {p1, v7, v8}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    .line 1321
    .local v9, "temp":Ljava/lang/Object;
    int-to-long v10, v2

    add-long/2addr v10, v7

    invoke-static {p0, p1, v10, v11, v9}, Lcom/trendmicro/hippo/NativeArray;->setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1319
    .end local v9    # "temp":Ljava/lang/Object;
    sub-long/2addr v7, v5

    goto :goto_1

    .line 1326
    .end local v7    # "last":J
    :cond_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    array-length v4, p2

    if-ge v3, v4, :cond_3

    .line 1327
    int-to-long v4, v3

    aget-object v6, p2, v3

    invoke-static {p0, p1, v4, v5, v6}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 1326
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1331
    .end local v3    # "i":I
    :cond_3
    array-length v3, p2

    int-to-long v3, v3

    add-long/2addr v0, v3

    .line 1332
    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method private static reduceMethod(Lcom/trendmicro/hippo/Context;ILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 23
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "id"    # I
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 1987
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 1989
    .local v4, "o":Lcom/trendmicro/hippo/Scriptable;
    const/4 v5, 0x0

    invoke-static {v0, v4, v5}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v6

    .line 1990
    .local v6, "length":J
    array-length v8, v1

    if-lez v8, :cond_0

    aget-object v8, v1, v5

    goto :goto_0

    :cond_0
    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1991
    .local v8, "callbackArg":Ljava/lang/Object;
    :goto_0
    if-eqz v8, :cond_8

    instance-of v9, v8, Lcom/trendmicro/hippo/Function;

    if-eqz v9, :cond_8

    .line 1994
    move-object v9, v8

    check-cast v9, Lcom/trendmicro/hippo/Function;

    .line 1995
    .local v9, "f":Lcom/trendmicro/hippo/Function;
    invoke-static {v9}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    .line 1997
    .local v10, "parent":Lcom/trendmicro/hippo/Scriptable;
    const/16 v11, 0x18

    const/4 v12, 0x1

    move/from16 v13, p1

    if-ne v13, v11, :cond_1

    move v11, v12

    goto :goto_1

    :cond_1
    move v11, v5

    .line 1998
    .local v11, "movingLeft":Z
    :goto_1
    array-length v14, v1

    if-le v14, v12, :cond_2

    aget-object v14, v1, v12

    goto :goto_2

    :cond_2
    sget-object v14, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    .line 1999
    .local v14, "value":Ljava/lang/Object;
    :goto_2
    const-wide/16 v15, 0x0

    .local v15, "i":J
    :goto_3
    cmp-long v17, v15, v6

    if-gez v17, :cond_6

    .line 2000
    const-wide/16 v17, 0x1

    if-eqz v11, :cond_3

    move-wide/from16 v19, v15

    goto :goto_4

    :cond_3
    sub-long v19, v6, v17

    sub-long v19, v19, v15

    :goto_4
    move-wide/from16 v21, v19

    .line 2001
    .local v21, "index":J
    move-wide/from16 v12, v21

    .end local v21    # "index":J
    .local v12, "index":J
    invoke-static {v4, v12, v13}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 2002
    .local v5, "elem":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v5, v1, :cond_4

    .line 2003
    const/16 v19, 0x1

    const/16 v20, 0x0

    goto :goto_5

    .line 2005
    :cond_4
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v14, v1, :cond_5

    .line 2007
    move-object v1, v5

    move-object v14, v1

    const/16 v19, 0x1

    const/16 v20, 0x0

    .end local v14    # "value":Ljava/lang/Object;
    .local v1, "value":Ljava/lang/Object;
    goto :goto_5

    .line 2009
    .end local v1    # "value":Ljava/lang/Object;
    .restart local v14    # "value":Ljava/lang/Object;
    :cond_5
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/16 v20, 0x0

    aput-object v14, v1, v20

    const/16 v19, 0x1

    aput-object v5, v1, v19

    const/16 v21, 0x2

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    aput-object v22, v1, v21

    const/16 v21, 0x3

    aput-object v4, v1, v21

    .line 2010
    .local v1, "innerArgs":[Ljava/lang/Object;
    invoke-interface {v9, v0, v10, v10, v1}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 1999
    .end local v1    # "innerArgs":[Ljava/lang/Object;
    .end local v5    # "elem":Ljava/lang/Object;
    .end local v12    # "index":J
    :goto_5
    add-long v15, v15, v17

    move/from16 v13, p1

    move-object/from16 v1, p4

    move/from16 v12, v19

    move/from16 v5, v20

    goto :goto_3

    .line 2013
    .end local v15    # "i":J
    :cond_6
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v14, v1, :cond_7

    .line 2017
    return-object v14

    .line 2015
    :cond_7
    const-string v1, "msg.empty.array.reduce"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 1992
    .end local v9    # "f":Lcom/trendmicro/hippo/Function;
    .end local v10    # "parent":Lcom/trendmicro/hippo/Scriptable;
    .end local v11    # "movingLeft":Z
    .end local v14    # "value":Ljava/lang/Object;
    :cond_8
    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private static setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .line 924
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 925
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 926
    .local v0, "id":Ljava/lang/String;
    invoke-static {p1, v0, p4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 927
    .end local v0    # "id":Ljava/lang/String;
    goto :goto_0

    .line 928
    :cond_0
    long-to-int v0, p2

    invoke-static {p1, v0, p4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)V

    .line 930
    :goto_0
    return-void
.end method

.method private setLength(Ljava/lang/Object;)V
    .locals 11
    .param p1, "val"    # Ljava/lang/Object;

    .line 786
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    .line 787
    return-void

    .line 790
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 791
    .local v0, "d":D
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(D)J

    move-result-wide v2

    .line 792
    .local v2, "longVal":J
    long-to-double v4, v2

    cmpl-double v4, v4, v0

    if-nez v4, :cond_a

    .line 797
    iget-boolean v4, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v4, :cond_3

    .line 798
    iget-wide v4, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    .line 800
    iget-object v4, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v5, v2

    array-length v6, v4

    sget-object v7, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v4, v5, v6, v7}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 801
    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 802
    return-void

    .line 803
    :cond_1
    const-wide/32 v6, 0x55555554

    cmp-long v6, v2, v6

    if-gez v6, :cond_2

    long-to-double v6, v2

    long-to-double v4, v4

    const-wide/high16 v8, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v4, v8

    cmpg-double v4, v6, v4

    if-gez v4, :cond_2

    long-to-int v4, v2

    .line 805
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 807
    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 808
    return-void

    .line 810
    :cond_2
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 813
    :cond_3
    iget-wide v4, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_9

    .line 815
    sub-long/2addr v4, v2

    const-wide/16 v6, 0x1000

    cmp-long v4, v4, v6

    if-lez v4, :cond_8

    .line 817
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v4

    .line 818
    .local v4, "e":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v6, v4

    if-ge v5, v6, :cond_7

    .line 819
    aget-object v6, v4, v5

    .line 820
    .local v6, "id":Ljava/lang/Object;
    instance-of v7, v6, Ljava/lang/String;

    if-eqz v7, :cond_5

    .line 822
    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    .line 823
    .local v7, "strId":Ljava/lang/String;
    invoke-static {v7}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v8

    .line 824
    .local v8, "index":J
    cmp-long v10, v8, v2

    if-ltz v10, :cond_4

    .line 825
    invoke-virtual {p0, v7}, Lcom/trendmicro/hippo/NativeArray;->delete(Ljava/lang/String;)V

    .line 826
    .end local v7    # "strId":Ljava/lang/String;
    .end local v8    # "index":J
    :cond_4
    goto :goto_1

    .line 827
    :cond_5
    move-object v7, v6

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 828
    .local v7, "index":I
    int-to-long v8, v7

    cmp-long v8, v8, v2

    if-ltz v8, :cond_6

    .line 829
    invoke-virtual {p0, v7}, Lcom/trendmicro/hippo/NativeArray;->delete(I)V

    .line 818
    .end local v6    # "id":Ljava/lang/Object;
    .end local v7    # "index":I
    :cond_6
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 832
    .end local v4    # "e":[Ljava/lang/Object;
    .end local v5    # "i":I
    :cond_7
    goto :goto_3

    .line 834
    :cond_8
    move-wide v4, v2

    .local v4, "i":J
    :goto_2
    iget-wide v6, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v6, v4, v6

    if-gez v6, :cond_9

    .line 835
    invoke-static {p0, v4, v5}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    .line 834
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    goto :goto_2

    .line 839
    .end local v4    # "i":J
    :cond_9
    :goto_3
    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 840
    return-void

    .line 793
    :cond_a
    const-string v4, "msg.arraylength.bad"

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 794
    .local v4, "msg":Ljava/lang/String;
    const-string v5, "RangeError"

    invoke-static {v5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5
.end method

.method private static setLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "length"    # J

    .line 880
    long-to-double v0, p2

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 881
    .local v0, "len":Ljava/lang/Object;
    const-string v1, "length"

    invoke-static {p1, v1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 882
    return-object v0
.end method

.method static setMaximumInitialCapacity(I)V
    .locals 0
    .param p0, "maximumInitialCapacity"    # I

    .line 57
    sput p0, Lcom/trendmicro/hippo/NativeArray;->maximumInitialCapacity:I

    .line 58
    return-void
.end method

.method private static setRawElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .line 935
    sget-object v0, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne p4, v0, :cond_0

    .line 936
    invoke-static {p1, p2, p3}, Lcom/trendmicro/hippo/NativeArray;->deleteElem(Lcom/trendmicro/hippo/Scriptable;J)V

    goto :goto_0

    .line 938
    :cond_0
    invoke-static {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/NativeArray;->setElem(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;JLjava/lang/Object;)V

    .line 940
    :goto_0
    return-void
.end method

.method private static toArrayIndex(D)J
    .locals 4
    .param p0, "d"    # D

    .line 434
    cmpl-double v0, p0, p0

    if-nez v0, :cond_0

    .line 435
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(D)J

    move-result-wide v0

    .line 436
    .local v0, "index":J
    long-to-double v2, v0

    cmpl-double v2, v2, p0

    if-nez v2, :cond_0

    const-wide v2, 0xffffffffL

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 437
    return-wide v0

    .line 440
    .end local v0    # "index":J
    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private static toArrayIndex(Ljava/lang/Object;)J
    .locals 2
    .param p0, "id"    # Ljava/lang/Object;

    .line 412
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 413
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    .line 414
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 415
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    return-wide v0

    .line 417
    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private static toArrayIndex(Ljava/lang/String;)J
    .locals 4
    .param p0, "id"    # Ljava/lang/String;

    .line 424
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    .line 427
    .local v0, "index":J
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 428
    return-wide v0

    .line 430
    :cond_0
    const-wide/16 v2, -0x1

    return-wide v2
.end method

.method private static toDenseIndex(Ljava/lang/Object;)I
    .locals 4
    .param p0, "id"    # Ljava/lang/Object;

    .line 444
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v0

    .line 445
    .local v0, "index":J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gtz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    long-to-int v2, v0

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    :goto_0
    return v2
.end method

.method private static toSliceIndex(DJ)J
    .locals 4
    .param p0, "value"    # D
    .param p2, "length"    # J

    .line 1588
    const-wide/16 v0, 0x0

    cmpg-double v2, p0, v0

    if-gez v2, :cond_1

    .line 1589
    long-to-double v2, p2

    add-double/2addr v2, p0

    cmpg-double v0, v2, v0

    if-gez v0, :cond_0

    .line 1590
    const-wide/16 v0, 0x0

    .local v0, "result":J
    goto :goto_0

    .line 1592
    .end local v0    # "result":J
    :cond_0
    long-to-double v0, p2

    add-double/2addr v0, p0

    double-to-long v0, v0

    .restart local v0    # "result":J
    goto :goto_0

    .line 1594
    .end local v0    # "result":J
    :cond_1
    long-to-double v0, p2

    cmpl-double v0, p0, v0

    if-lez v0, :cond_2

    .line 1595
    move-wide v0, p2

    .restart local v0    # "result":J
    goto :goto_0

    .line 1597
    .end local v0    # "result":J
    :cond_2
    double-to-long v0, p0

    .line 1599
    .restart local v0    # "result":J
    :goto_0
    return-wide v0
.end method

.method private static toStringHelper(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ZZ)Ljava/lang/String;
    .locals 17
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "toSource"    # Z
    .param p4, "toLocale"    # Z

    .line 950
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const/4 v0, 0x0

    invoke-static {v1, v3, v0}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v4

    .line 952
    .local v4, "length":J
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x100

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 957
    .local v6, "result":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_0

    .line 958
    const/16 v7, 0x5b

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 959
    const-string v7, ", "

    .local v7, "separator":Ljava/lang/String;
    goto :goto_0

    .line 961
    .end local v7    # "separator":Ljava/lang/String;
    :cond_0
    const-string v7, ","

    .line 964
    .restart local v7    # "separator":Ljava/lang/String;
    :goto_0
    const/4 v8, 0x0

    .line 965
    .local v8, "haslast":Z
    const-wide/16 v9, 0x0

    .line 968
    .local v9, "i":J
    iget-object v11, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    if-nez v11, :cond_1

    .line 969
    const/4 v11, 0x1

    .line 970
    .local v11, "toplevel":Z
    const/4 v12, 0x0

    .line 971
    .local v12, "iterating":Z
    new-instance v13, Lcom/trendmicro/hippo/ObjToIntMap;

    const/16 v14, 0x1f

    invoke-direct {v13, v14}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v13, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    goto :goto_1

    .line 973
    .end local v11    # "toplevel":Z
    .end local v12    # "iterating":Z
    :cond_1
    const/4 v11, 0x0

    .line 974
    .restart local v11    # "toplevel":Z
    iget-object v12, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v12, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v12

    .line 980
    .restart local v12    # "iterating":Z
    :goto_1
    const-wide/16 v13, 0x0

    if-nez v12, :cond_e

    .line 981
    :try_start_0
    iget-object v15, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v15, v3, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 983
    if-eqz p3, :cond_3

    .line 984
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v15

    const/16 v0, 0x96

    if-ge v15, v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v0, 0x1

    .line 985
    .local v0, "skipUndefinedAndNull":Z
    :goto_3
    const-wide/16 v9, 0x0

    :goto_4
    cmp-long v15, v9, v4

    if-gez v15, :cond_c

    .line 986
    cmp-long v15, v9, v13

    if-lez v15, :cond_4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 987
    :cond_4
    invoke-static {v3, v9, v10}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v15

    .line 988
    .local v15, "elem":Ljava/lang/Object;
    sget-object v13, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v15, v13, :cond_b

    if-eqz v0, :cond_6

    if-eqz v15, :cond_5

    sget-object v13, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v15, v13, :cond_6

    :cond_5
    move/from16 v16, v0

    goto :goto_7

    .line 993
    :cond_6
    const/4 v8, 0x1

    .line 995
    if-eqz p3, :cond_7

    .line 996
    invoke-static {v1, v2, v15}, Lcom/trendmicro/hippo/ScriptRuntime;->uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v16, v0

    goto :goto_8

    .line 998
    :cond_7
    instance-of v13, v15, Ljava/lang/String;

    if-eqz v13, :cond_9

    .line 999
    move-object v13, v15

    check-cast v13, Ljava/lang/String;

    .line 1000
    .local v13, "s":Ljava/lang/String;
    if-eqz p3, :cond_8

    .line 1001
    const/16 v14, 0x22

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1002
    invoke-static {v13}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1003
    const/16 v14, 0x22

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 1005
    :cond_8
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1008
    .end local v13    # "s":Ljava/lang/String;
    :goto_5
    move/from16 v16, v0

    goto :goto_8

    .line 1009
    :cond_9
    if-eqz p4, :cond_a

    .line 1012
    const-string v13, "toLocaleString"

    invoke-static {v15, v13, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v13

    .line 1014
    .local v13, "fun":Lcom/trendmicro/hippo/Callable;
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v14

    .line 1015
    .local v14, "funThis":Lcom/trendmicro/hippo/Scriptable;
    move/from16 v16, v0

    .end local v0    # "skipUndefinedAndNull":Z
    .local v16, "skipUndefinedAndNull":Z
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v13, v1, v2, v14, v0}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    goto :goto_6

    .line 1009
    .end local v13    # "fun":Lcom/trendmicro/hippo/Callable;
    .end local v14    # "funThis":Lcom/trendmicro/hippo/Scriptable;
    .end local v16    # "skipUndefinedAndNull":Z
    .restart local v0    # "skipUndefinedAndNull":Z
    :cond_a
    move/from16 v16, v0

    .line 1018
    .end local v0    # "skipUndefinedAndNull":Z
    .restart local v16    # "skipUndefinedAndNull":Z
    :goto_6
    invoke-static {v15}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_8

    .line 988
    .end local v16    # "skipUndefinedAndNull":Z
    .restart local v0    # "skipUndefinedAndNull":Z
    :cond_b
    move/from16 v16, v0

    .line 990
    .end local v0    # "skipUndefinedAndNull":Z
    .restart local v16    # "skipUndefinedAndNull":Z
    :goto_7
    const/4 v0, 0x0

    .line 991
    .end local v8    # "haslast":Z
    .local v0, "haslast":Z
    move v8, v0

    .line 985
    .end local v0    # "haslast":Z
    .end local v15    # "elem":Ljava/lang/Object;
    .restart local v8    # "haslast":Z
    :goto_8
    const-wide/16 v13, 0x1

    add-long/2addr v9, v13

    move/from16 v0, v16

    const-wide/16 v13, 0x0

    goto :goto_4

    .end local v16    # "skipUndefinedAndNull":Z
    .local v0, "skipUndefinedAndNull":Z
    :cond_c
    move/from16 v16, v0

    .end local v0    # "skipUndefinedAndNull":Z
    .restart local v16    # "skipUndefinedAndNull":Z
    const/4 v13, 0x0

    goto :goto_9

    .line 1023
    .end local v16    # "skipUndefinedAndNull":Z
    :catchall_0
    move-exception v0

    if-eqz v11, :cond_d

    .line 1024
    const/4 v13, 0x0

    iput-object v13, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1026
    :cond_d
    throw v0

    .line 980
    :cond_e
    const/4 v13, 0x0

    .line 1023
    :goto_9
    if-eqz v11, :cond_f

    .line 1024
    iput-object v13, v1, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1028
    :cond_f
    if-eqz p3, :cond_11

    .line 1030
    if-nez v8, :cond_10

    const-wide/16 v13, 0x0

    cmp-long v0, v9, v13

    if-lez v0, :cond_10

    .line 1031
    const-string v0, ", ]"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 1033
    :cond_10
    const/16 v0, 0x5d

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1035
    :cond_11
    :goto_a
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .line 2253
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 2223
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/util/Collection;

    .line 2258
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .line 2233
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .locals 1

    .line 2248
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 2031
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/NativeArray;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "c"    # Ljava/util/Collection;

    .line 2057
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 2058
    .local v1, "aC":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/NativeArray;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2059
    const/4 v0, 0x0

    return v0

    .line 2058
    .end local v1    # "aC":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 2060
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method protected defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p4, "checkValid"    # Z

    .line 616
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 617
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    .line 618
    .local v0, "values":[Ljava/lang/Object;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    .line 619
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 620
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 621
    aget-object v2, v0, v1

    sget-object v3, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_0

    .line 622
    aget-object v2, v0, v1

    invoke-virtual {p0, v1, p0, v2}, Lcom/trendmicro/hippo/NativeArray;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 620
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 626
    .end local v0    # "values":[Ljava/lang/Object;
    .end local v1    # "i":I
    :cond_1
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v0

    .line 627
    .local v0, "index":J
    iget-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    .line 628
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 630
    :cond_2
    invoke-super {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 631
    return-void
.end method

.method public delete(I)V
    .locals 2
    .param p1, "index"    # I

    .line 515
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    array-length v0, v0

    if-ge p1, v0, :cond_1

    .line 516
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->isSealed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lcom/trendmicro/hippo/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_1

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v1, v0, p1

    goto :goto_0

    .line 520
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->delete(I)V

    .line 522
    :goto_0
    return-void
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 243
    sget-object v0, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 244
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 246
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 249
    .local v0, "id":I
    :goto_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    .line 387
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Array.prototype has no method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 360
    :pswitch_0
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_copyWithin(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 354
    :pswitch_1
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_includes(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 379
    :pswitch_2
    invoke-static {p2, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 380
    new-instance v1, Lcom/trendmicro/hippo/NativeArrayIterator;

    sget-object v2, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->ENTRIES:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    invoke-direct {v1, p3, p4, v2}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V

    return-object v1

    .line 384
    :pswitch_3
    invoke-static {p2, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 385
    new-instance v1, Lcom/trendmicro/hippo/NativeArrayIterator;

    sget-object v2, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->VALUES:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    invoke-direct {v1, p3, p4, v2}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V

    return-object v1

    .line 375
    :pswitch_4
    invoke-static {p2, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 376
    new-instance v1, Lcom/trendmicro/hippo/NativeArrayIterator;

    sget-object v2, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->KEYS:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    invoke-direct {v1, p3, p4, v2}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V

    return-object v1

    .line 357
    :pswitch_5
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_fill(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 372
    :pswitch_6
    invoke-static {p2, v0, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->reduceMethod(Lcom/trendmicro/hippo/Context;ILcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 369
    :pswitch_7
    invoke-static {p2, p1, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->iterativeMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 351
    :pswitch_8
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_lastIndexOf(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 348
    :pswitch_9
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_indexOf(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 345
    :pswitch_a
    invoke-direct {p0, p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_slice(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 342
    :pswitch_b
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_concat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 339
    :pswitch_c
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_splice(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 336
    :pswitch_d
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_unshift(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 333
    :pswitch_e
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_shift(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 330
    :pswitch_f
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_pop(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 327
    :pswitch_10
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_push(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 324
    :pswitch_11
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_sort(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 321
    :pswitch_12
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_reverse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 318
    :pswitch_13
    invoke-static {p2, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_join(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 315
    :pswitch_14
    invoke-static {p2, p3, p4, v1, v2}, Lcom/trendmicro/hippo/NativeArray;->toStringHelper(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 312
    :pswitch_15
    invoke-static {p2, p3, p4, v2, v1}, Lcom/trendmicro/hippo/NativeArray;->toStringHelper(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 308
    :pswitch_16
    const/4 v1, 0x4

    .line 309
    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    .line 308
    invoke-static {p2, p3, p4, v1, v2}, Lcom/trendmicro/hippo/NativeArray;->toStringHelper(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 299
    :pswitch_17
    if-nez p4, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    .line 300
    .local v1, "inNewExpr":Z
    :goto_1
    if-nez v1, :cond_2

    .line 302
    invoke-virtual {p1, p2, p3, p5}, Lcom/trendmicro/hippo/IdFunctionObject;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2

    .line 304
    :cond_2
    invoke-static {p2, p3, p5}, Lcom/trendmicro/hippo/NativeArray;->jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 276
    .end local v1    # "inNewExpr":Z
    :pswitch_18
    array-length v3, p5

    if-lez v3, :cond_4

    .line 277
    aget-object v2, p5, v2

    invoke-static {p2, p3, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 278
    array-length v2, p5

    sub-int/2addr v2, v1

    new-array v1, v2, [Ljava/lang/Object;

    .line 279
    .local v1, "newArgs":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v3, v1

    if-ge v2, v3, :cond_3

    .line 280
    add-int/lit8 v3, v2, 0x1

    aget-object v3, p5, v3

    aput-object v3, v1, v2

    .line 279
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 281
    .end local v2    # "i":I
    :cond_3
    move-object p5, v1

    .line 283
    .end local v1    # "newArgs":[Ljava/lang/Object;
    :cond_4
    neg-int v0, v0

    .line 284
    goto/16 :goto_0

    .line 288
    :pswitch_19
    array-length v3, p5

    if-lez v3, :cond_5

    aget-object v3, p5, v2

    invoke-static {v3}, Lcom/trendmicro/hippo/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_3

    :cond_5
    move v1, v2

    :goto_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 291
    :pswitch_1a
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_of(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 295
    :pswitch_1b
    invoke-static {p2, p3, p4, p5}, Lcom/trendmicro/hippo/NativeArray;->js_from(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch -0x1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 12
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 140
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "join"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 142
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v9, -0x6

    const-string v10, "reverse"

    const/4 v11, 0x0

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 144
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "sort"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 146
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v9, -0x8

    const-string v10, "push"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 148
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x9

    const-string v4, "pop"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 150
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xa

    const-string v10, "shift"

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 152
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "unshift"

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 154
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xc

    const-string v10, "splice"

    const/4 v11, 0x2

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 156
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "concat"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 158
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xe

    const-string v10, "slice"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 160
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "indexOf"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 162
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x10

    const-string v10, "lastIndexOf"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 164
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x11

    const-string v4, "every"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 166
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x12

    const-string v10, "filter"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 168
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x13

    const-string v4, "forEach"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 170
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x14

    const-string v10, "map"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 172
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x15

    const-string v4, "some"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 174
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x16

    const-string v10, "find"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 176
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x17

    const-string v4, "findIndex"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 178
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x18

    const-string v10, "reduce"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 180
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x19

    const-string v4, "reduceRight"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 182
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x1a

    const-string v10, "isArray"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 184
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x1b

    const-string v4, "of"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 186
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x1c

    const-string v10, "from"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeArray;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 188
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 189
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 106
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeArray;->instanceIdInfo(II)I

    move-result v0

    return v0

    .line 109
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 2279
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2280
    const/16 v0, 0x20

    return v0

    .line 2282
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 14
    .param p1, "s"    # Ljava/lang/String;

    .line 2348
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 2349
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xe

    if-eq v2, v3, :cond_15

    const/16 v3, 0x6f

    const/16 v4, 0x76

    const/16 v5, 0x66

    const/16 v6, 0x63

    const/16 v7, 0x73

    const/16 v8, 0x69

    const/16 v9, 0x6c

    const/4 v10, 0x1

    const/4 v11, 0x2

    const/16 v12, 0x72

    const/4 v13, 0x0

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_0

    .line 2389
    :pswitch_0
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2390
    .local v2, "c":I
    if-ne v2, v6, :cond_0

    const-string v1, "constructor"

    const/4 v0, 0x1

    goto/16 :goto_0

    .line 2391
    :cond_0
    if-ne v2, v9, :cond_1

    const-string v1, "lastIndexOf"

    const/16 v0, 0x10

    goto/16 :goto_0

    .line 2392
    :cond_1
    if-ne v2, v12, :cond_16

    const-string v1, "reduceRight"

    const/16 v0, 0x19

    goto/16 :goto_0

    .line 2388
    .end local v2    # "c":I
    :pswitch_1
    const-string v1, "copyWithin"

    const/16 v0, 0x1f

    goto/16 :goto_0

    .line 2387
    :pswitch_2
    const-string v1, "findIndex"

    const/16 v0, 0x17

    goto/16 :goto_0

    .line 2382
    :pswitch_3
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2383
    .restart local v2    # "c":I
    if-ne v2, v9, :cond_2

    const-string v1, "includes"

    const/16 v0, 0x1e

    goto/16 :goto_0

    .line 2384
    :cond_2
    if-ne v2, v3, :cond_3

    const-string v1, "toSource"

    const/4 v0, 0x4

    goto/16 :goto_0

    .line 2385
    :cond_3
    const/16 v3, 0x74

    if-ne v2, v3, :cond_16

    const-string v1, "toString"

    const/4 v0, 0x2

    goto/16 :goto_0

    .line 2375
    .end local v2    # "c":I
    :pswitch_4
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x65

    if-eq v2, v3, :cond_8

    if-eq v2, v5, :cond_7

    if-eq v2, v8, :cond_6

    if-eq v2, v12, :cond_5

    const/16 v3, 0x75

    if-eq v2, v3, :cond_4

    .line 2381
    goto/16 :goto_0

    .line 2380
    :cond_4
    const-string v1, "unshift"

    const/16 v0, 0xb

    goto/16 :goto_0

    .line 2379
    :cond_5
    const-string v1, "reverse"

    const/4 v0, 0x6

    goto/16 :goto_0

    .line 2378
    :cond_6
    const-string v1, "indexOf"

    const/16 v0, 0xf

    goto/16 :goto_0

    .line 2377
    :cond_7
    const-string v1, "forEach"

    const/16 v0, 0x13

    goto/16 :goto_0

    .line 2376
    :cond_8
    const-string v1, "entries"

    const/16 v0, 0x1d

    goto/16 :goto_0

    .line 2368
    :pswitch_5
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v6, :cond_d

    if-eq v2, v5, :cond_c

    if-eq v2, v4, :cond_b

    if-eq v2, v12, :cond_a

    if-eq v2, v7, :cond_9

    .line 2374
    goto/16 :goto_0

    .line 2372
    :cond_9
    const-string v1, "splice"

    const/16 v0, 0xc

    goto/16 :goto_0

    .line 2371
    :cond_a
    const-string v1, "reduce"

    const/16 v0, 0x18

    goto/16 :goto_0

    .line 2373
    :cond_b
    const-string v1, "values"

    const/16 v0, 0x1c

    goto/16 :goto_0

    .line 2370
    :cond_c
    const-string v1, "filter"

    const/16 v0, 0x12

    goto/16 :goto_0

    .line 2369
    :cond_d
    const-string v1, "concat"

    const/16 v0, 0xd

    goto/16 :goto_0

    .line 2363
    :pswitch_6
    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2364
    .restart local v2    # "c":I
    const/16 v3, 0x68

    if-ne v2, v3, :cond_e

    const-string v1, "shift"

    const/16 v0, 0xa

    goto/16 :goto_0

    .line 2365
    :cond_e
    if-ne v2, v9, :cond_f

    const-string v1, "slice"

    const/16 v0, 0xe

    goto/16 :goto_0

    .line 2366
    :cond_f
    if-ne v2, v4, :cond_16

    const-string v1, "every"

    const/16 v0, 0x11

    goto/16 :goto_0

    .line 2354
    .end local v2    # "c":I
    :pswitch_7
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v8, :cond_13

    const/16 v3, 0x79

    if-eq v2, v3, :cond_12

    if-eq v2, v12, :cond_11

    if-eq v2, v7, :cond_10

    packed-switch v2, :pswitch_data_1

    .line 2362
    goto :goto_0

    .line 2358
    :pswitch_8
    const-string v1, "find"

    const/16 v0, 0x16

    goto :goto_0

    .line 2357
    :pswitch_9
    const-string v1, "some"

    const/16 v0, 0x15

    goto :goto_0

    .line 2356
    :pswitch_a
    const-string v1, "fill"

    const/16 v0, 0x1a

    goto :goto_0

    .line 2360
    :cond_10
    const-string v1, "push"

    const/16 v0, 0x8

    goto :goto_0

    .line 2359
    :cond_11
    const-string v1, "sort"

    const/4 v0, 0x7

    goto :goto_0

    .line 2361
    :cond_12
    const-string v1, "keys"

    const/16 v0, 0x1b

    goto :goto_0

    .line 2355
    :cond_13
    const-string v1, "join"

    const/4 v0, 0x5

    goto :goto_0

    .line 2350
    :pswitch_b
    invoke-virtual {p1, v13}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2351
    .restart local v2    # "c":I
    const/16 v4, 0x6d

    const/16 v5, 0x70

    if-ne v2, v4, :cond_14

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_16

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_16

    const/16 v0, 0x14

    goto :goto_1

    .line 2352
    :cond_14
    if-ne v2, v5, :cond_16

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_16

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_16

    const/16 v0, 0x9

    goto :goto_1

    .line 2394
    .end local v2    # "c":I
    :cond_15
    const-string v1, "toLocaleString"

    const/4 v0, 0x3

    .line 2396
    :cond_16
    :goto_0
    if-eqz v1, :cond_17

    if-eq v1, p1, :cond_17

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_17

    const/4 v0, 0x0

    .line 2400
    .end local v1    # "X":Ljava/lang/String;
    :cond_17
    :goto_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_b
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x6c
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .line 2093
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/NativeArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 394
    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/trendmicro/hippo/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    array-length v1, v0

    if-ge p1, v1, :cond_1

    .line 397
    aget-object v0, v0, p1

    return-object v0

    .line 398
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(J)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # J

    .line 2078
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_3

    .line 2081
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeArray;->getRawElem(Lcom/trendmicro/hippo/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 2082
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_2

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2084
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v1, :cond_1

    .line 2085
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 2087
    :cond_1
    return-object v0

    .line 2083
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return-object v1

    .line 2079
    .end local v0    # "value":Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getAttributes(I)I
    .locals 2
    .param p1, "index"    # I

    .line 593
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-object v0, v0, p1

    sget-object v1, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 595
    const/4 v0, 0x0

    return v0

    .line 597
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getAttributes(I)I

    move-result v0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 83
    const-string v0, "Array"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 571
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 572
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 573
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_0

    .line 574
    iget-wide v1, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    return-object v1

    .line 576
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getIds(ZZ)[Ljava/lang/Object;
    .locals 10
    .param p1, "nonEnumerable"    # Z
    .param p2, "getSymbols"    # Z

    .line 527
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    .line 528
    .local v0, "superIds":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-nez v1, :cond_0

    return-object v0

    .line 529
    :cond_0
    array-length v1, v1

    .line 530
    .local v1, "N":I
    iget-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 531
    .local v2, "currentLength":J
    int-to-long v4, v1

    cmp-long v4, v4, v2

    if-lez v4, :cond_1

    .line 532
    long-to-int v1, v2

    .line 534
    :cond_1
    if-nez v1, :cond_2

    return-object v0

    .line 535
    :cond_2
    array-length v4, v0

    .line 536
    .local v4, "superLength":I
    add-int v5, v1, v4

    new-array v5, v5, [Ljava/lang/Object;

    .line 538
    .local v5, "ids":[Ljava/lang/Object;
    const/4 v6, 0x0

    .line 539
    .local v6, "presentCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-eq v7, v1, :cond_4

    .line 541
    iget-object v8, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v8, v8, v7

    sget-object v9, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v8, v9, :cond_3

    .line 542
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    .line 543
    add-int/lit8 v6, v6, 0x1

    .line 539
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 546
    .end local v7    # "i":I
    :cond_4
    const/4 v7, 0x0

    if-eq v6, v1, :cond_5

    .line 548
    add-int v8, v6, v4

    new-array v8, v8, [Ljava/lang/Object;

    .line 549
    .local v8, "tmp":[Ljava/lang/Object;
    invoke-static {v5, v7, v8, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 550
    move-object v5, v8

    .line 552
    .end local v8    # "tmp":[Ljava/lang/Object;
    :cond_5
    invoke-static {v0, v7, v5, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 553
    return-object v5
.end method

.method public getIndexIds()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 557
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v0

    .line 558
    .local v0, "ids":[Ljava/lang/Object;
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 559
    .local v1, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 560
    .local v4, "id":Ljava/lang/Object;
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    .line 561
    .local v5, "int32Id":I
    if-ltz v5, :cond_0

    int-to-double v6, v5

    invoke-static {v6, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 562
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    .end local v4    # "id":Ljava/lang/Object;
    .end local v5    # "int32Id":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 565
    :cond_1
    return-object v1
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 115
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "length"

    return-object v0

    .line 116
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 122
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 123
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    long-to-double v0, v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 125
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLength()J
    .locals 2

    .line 755
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    return-wide v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 602
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 603
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeArray;->toDenseIndex(Ljava/lang/Object;)I

    move-result v0

    .line 604
    .local v0, "index":I
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_0

    aget-object v1, v1, v0

    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_0

    .line 605
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v1, v1, v0

    .line 606
    .local v1, "value":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/NativeArray;->defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v2

    return-object v2

    .line 609
    .end local v0    # "index":I
    .end local v1    # "value":Ljava/lang/Object;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 3
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 404
    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/trendmicro/hippo/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 405
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 406
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_2

    if-ltz p1, :cond_2

    array-length v2, v0

    if-ge p1, v2, :cond_2

    .line 407
    aget-object v0, v0, p1

    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 408
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 2098
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 2099
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_5

    .line 2102
    long-to-int v2, v0

    .line 2103
    .local v2, "len":I
    if-nez p1, :cond_2

    .line 2104
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    .line 2105
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    .line 2106
    return v3

    .line 2104
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .end local v3    # "i":I
    :cond_1
    goto :goto_2

    .line 2110
    :cond_2
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    if-ge v3, v2, :cond_4

    .line 2111
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2112
    return v3

    .line 2110
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2116
    .end local v3    # "i":I
    :cond_4
    :goto_2
    const/4 v3, -0x1

    return v3

    .line 2100
    .end local v2    # "len":I
    :cond_5
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method

.method protected initPrototypeId(I)V
    .locals 13
    .param p1, "id"    # I

    .line 194
    const/16 v0, 0x20

    if-ne p1, v0, :cond_0

    .line 195
    sget-object v2, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    sget-object v4, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v6, 0x0

    const-string v5, "[Symbol.iterator]"

    move-object v1, p0

    move v3, p1

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeArray;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 196
    return-void

    .line 199
    :cond_0
    const/4 v0, 0x0

    .line 201
    .local v0, "fnName":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 233
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 232
    :pswitch_0
    const/4 v1, 0x2

    .local v1, "arity":I
    const-string v2, "copyWithin"

    .local v2, "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 231
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "includes"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 230
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "entries"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 229
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "values"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 228
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "keys"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 227
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "fill"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 226
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "reduceRight"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 225
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "reduce"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 224
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "findIndex"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 223
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "find"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 222
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "some"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 221
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "map"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 220
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "forEach"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 219
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "filter"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 218
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "every"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 217
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "lastIndexOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 216
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "indexOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 215
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "slice"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 214
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "concat"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 213
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "splice"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 212
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "unshift"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 211
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "shift"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 210
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "pop"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 209
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "push"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 208
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "sort"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 207
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "reverse"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 206
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "join"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 205
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toSource"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 204
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toLocaleString"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 203
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toString"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 202
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "constructor"

    .line 236
    .restart local v2    # "s":Ljava/lang/String;
    :goto_0
    sget-object v8, Lcom/trendmicro/hippo/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    move-object v7, p0

    move v9, p1

    move-object v10, v2

    move-object v11, v0

    move v12, v1

    invoke-virtual/range {v7 .. v12}, Lcom/trendmicro/hippo/NativeArray;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 237
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
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

.method public isEmpty()Z
    .locals 4

    .line 2074
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .line 2144
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public jsGet_length()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 761
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 2121
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 2122
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_5

    .line 2125
    long-to-int v2, v0

    .line 2126
    .local v2, "len":I
    if-nez p1, :cond_2

    .line 2127
    add-int/lit8 v3, v2, -0x1

    .local v3, "i":I
    :goto_0
    if-ltz v3, :cond_1

    .line 2128
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_0

    .line 2129
    return v3

    .line 2127
    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .end local v3    # "i":I
    :cond_1
    goto :goto_2

    .line 2133
    :cond_2
    add-int/lit8 v3, v2, -0x1

    .restart local v3    # "i":I
    :goto_1
    if-ltz v3, :cond_4

    .line 2134
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2135
    return v3

    .line 2133
    :cond_3
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 2139
    .end local v3    # "i":I
    :cond_4
    :goto_2
    const/4 v3, -0x1

    return v3

    .line 2123
    .end local v2    # "len":I
    :cond_5
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 1

    .line 2149
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 6
    .param p1, "start"    # I

    .line 2154
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 2155
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 2158
    long-to-int v2, v0

    .line 2160
    .local v2, "len":I
    if-ltz p1, :cond_0

    if-gt p1, v2, :cond_0

    .line 2164
    new-instance v3, Lcom/trendmicro/hippo/NativeArray$2;

    invoke-direct {v3, p0, p1, v2}, Lcom/trendmicro/hippo/NativeArray$2;-><init>(Lcom/trendmicro/hippo/NativeArray;II)V

    return-object v3

    .line 2161
    :cond_0
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2156
    .end local v2    # "len":I
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 10
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 482
    const-wide/16 v0, 0x1

    const/4 v2, 0x1

    if-ne p2, p0, :cond_5

    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->isSealed()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v3, :cond_5

    if-ltz p1, :cond_5

    iget-boolean v3, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-nez v3, :cond_0

    const/4 v3, 0x0

    .line 483
    invoke-virtual {p0, v3, p1, v2}, Lcom/trendmicro/hippo/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v3

    if-nez v3, :cond_5

    .line 485
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->isExtensible()Z

    move-result v3

    if-nez v3, :cond_1

    iget-wide v3, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    int-to-long v5, p1

    cmp-long v3, v3, v5

    if-gtz v3, :cond_1

    .line 486
    return-void

    .line 487
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    array-length v4, v3

    if-ge p1, v4, :cond_3

    .line 488
    aput-object p3, v3, p1

    .line 489
    iget-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    int-to-long v4, p1

    cmp-long v2, v2, v4

    if-gtz v2, :cond_2

    .line 490
    int-to-long v2, p1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 491
    :cond_2
    return-void

    .line 492
    :cond_3
    iget-boolean v4, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v4, :cond_4

    int-to-double v4, p1

    array-length v3, v3

    int-to-double v6, v3

    const-wide/high16 v8, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v6, v8

    cmpg-double v3, v4, v6

    if-gez v3, :cond_4

    add-int/lit8 v3, p1, 0x1

    .line 493
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/NativeArray;->ensureCapacity(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 495
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeArray;->dense:[Ljava/lang/Object;

    aput-object p3, v2, p1

    .line 496
    int-to-long v2, p1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 497
    return-void

    .line 499
    :cond_4
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 502
    :cond_5
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 503
    if-ne p2, p0, :cond_6

    iget v3, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    and-int/2addr v2, v3

    if-nez v2, :cond_6

    .line 505
    iget-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    int-to-long v4, p1

    cmp-long v2, v2, v4

    if-gtz v2, :cond_6

    .line 507
    int-to-long v2, p1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 510
    :cond_6
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 451
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 452
    if-ne p2, p0, :cond_0

    .line 454
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    .line 455
    .local v0, "index":J
    iget-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 456
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 457
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 460
    .end local v0    # "index":J
    :cond_0
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 2268
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 2228
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .line 2238
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "c"    # Ljava/util/Collection;

    .line 2243
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .line 2263
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method setDenseOnly(Z)V
    .locals 1
    .param p1, "denseOnly"    # Z

    .line 774
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 775
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 776
    :cond_1
    :goto_0
    iput-boolean p1, p0, Lcom/trendmicro/hippo/NativeArray;->denseOnly:Z

    .line 777
    return-void
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 98
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 99
    iput p2, p0, Lcom/trendmicro/hippo/NativeArray;->lengthAttr:I

    .line 101
    :cond_0
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 131
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 132
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/NativeArray;->setLength(Ljava/lang/Object;)V

    return-void

    .line 134
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 135
    return-void
.end method

.method public size()I
    .locals 4

    .line 2065
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 2066
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 2069
    long-to-int v2, v0

    return v2

    .line 2067
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .line 2273
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .line 2036
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/NativeArray;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .param p1, "a"    # [Ljava/lang/Object;

    .line 2041
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeArray;->length:J

    .line 2042
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    .line 2045
    long-to-int v2, v0

    .line 2046
    .local v2, "len":I
    array-length v3, p1

    if-lt v3, v2, :cond_0

    .line 2047
    move-object v3, p1

    goto :goto_0

    .line 2048
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    :goto_0
    nop

    .line 2049
    .local v3, "array":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v2, :cond_1

    .line 2050
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v4

    .line 2049
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2052
    .end local v4    # "i":I
    :cond_1
    return-object v3

    .line 2043
    .end local v2    # "len":I
    .end local v3    # "array":[Ljava/lang/Object;
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method
