.class final Lcom/trendmicro/hippo/NativeString;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeString.java"


# static fields
.field private static final ConstructorId_charAt:I = -0x5

.field private static final ConstructorId_charCodeAt:I = -0x6

.field private static final ConstructorId_concat:I = -0xe

.field private static final ConstructorId_equalsIgnoreCase:I = -0x1e

.field private static final ConstructorId_fromCharCode:I = -0x1

.field private static final ConstructorId_indexOf:I = -0x7

.field private static final ConstructorId_lastIndexOf:I = -0x8

.field private static final ConstructorId_localeCompare:I = -0x22

.field private static final ConstructorId_match:I = -0x1f

.field private static final ConstructorId_replace:I = -0x21

.field private static final ConstructorId_search:I = -0x20

.field private static final ConstructorId_slice:I = -0xf

.field private static final ConstructorId_split:I = -0x9

.field private static final ConstructorId_substr:I = -0xd

.field private static final ConstructorId_substring:I = -0xa

.field private static final ConstructorId_toLocaleLowerCase:I = -0x23

.field private static final ConstructorId_toLowerCase:I = -0xb

.field private static final ConstructorId_toUpperCase:I = -0xc

.field private static final Id_anchor:I = 0x1c

.field private static final Id_big:I = 0x15

.field private static final Id_blink:I = 0x16

.field private static final Id_bold:I = 0x10

.field private static final Id_charAt:I = 0x5

.field private static final Id_charCodeAt:I = 0x6

.field private static final Id_codePointAt:I = 0x2d

.field private static final Id_concat:I = 0xe

.field private static final Id_constructor:I = 0x1

.field private static final Id_endsWith:I = 0x2a

.field private static final Id_equals:I = 0x1d

.field private static final Id_equalsIgnoreCase:I = 0x1e

.field private static final Id_fixed:I = 0x12

.field private static final Id_fontcolor:I = 0x1a

.field private static final Id_fontsize:I = 0x19

.field private static final Id_includes:I = 0x28

.field private static final Id_indexOf:I = 0x7

.field private static final Id_italics:I = 0x11

.field private static final Id_lastIndexOf:I = 0x8

.field private static final Id_length:I = 0x1

.field private static final Id_link:I = 0x1b

.field private static final Id_localeCompare:I = 0x22

.field private static final Id_match:I = 0x1f

.field private static final Id_normalize:I = 0x2b

.field private static final Id_padEnd:I = 0x2f

.field private static final Id_padStart:I = 0x2e

.field private static final Id_repeat:I = 0x2c

.field private static final Id_replace:I = 0x21

.field private static final Id_search:I = 0x20

.field private static final Id_slice:I = 0xf

.field private static final Id_small:I = 0x14

.field private static final Id_split:I = 0x9

.field private static final Id_startsWith:I = 0x29

.field private static final Id_strike:I = 0x13

.field private static final Id_sub:I = 0x18

.field private static final Id_substr:I = 0xd

.field private static final Id_substring:I = 0xa

.field private static final Id_sup:I = 0x17

.field private static final Id_toLocaleLowerCase:I = 0x23

.field private static final Id_toLocaleUpperCase:I = 0x24

.field private static final Id_toLowerCase:I = 0xb

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_toUpperCase:I = 0xc

.field private static final Id_trim:I = 0x25

.field private static final Id_trimLeft:I = 0x26

.field private static final Id_trimRight:I = 0x27

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x30

.field private static final STRING_TAG:Ljava/lang/Object;

.field private static final SymbolId_iterator:I = 0x30

.field private static final serialVersionUID:J = 0xcc57334977d230fL


# instance fields
.field private string:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const-string v0, "String"

    sput-object v0, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;

    .line 42
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    .line 44
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 38
    new-instance v0, Lcom/trendmicro/hippo/NativeString;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeString;-><init>(Ljava/lang/CharSequence;)V

    .line 39
    .local v0, "obj":Lcom/trendmicro/hippo/NativeString;
    const/16 v1, 0x30

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeString;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 40
    return-void
.end method

.method private static js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 719
    array-length v0, p1

    .line 720
    .local v0, "N":I
    if-nez v0, :cond_0

    return-object p0

    .line 721
    :cond_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 722
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 723
    .local v1, "arg":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 728
    .end local v1    # "arg":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 729
    .local v1, "size":I
    new-array v2, v0, [Ljava/lang/String;

    .line 730
    .local v2, "argsAsStrings":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v0, :cond_2

    .line 731
    aget-object v4, p1, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 732
    .local v4, "s":Ljava/lang/String;
    aput-object v4, v2, v3

    .line 733
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v1, v5

    .line 730
    .end local v4    # "s":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 736
    .end local v3    # "i":I
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 737
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v0, :cond_3

    .line 739
    aget-object v5, v2, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 741
    .end local v4    # "i":I
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I
    .locals 11
    .param p0, "methodId"    # I
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 601
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    .line 602
    .local v1, "searchStr":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-static {p2, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 604
    .local v3, "position":D
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v5, v5

    cmpl-double v5, v3, v5

    const/16 v6, 0x29

    const/4 v7, -0x1

    const/16 v8, 0x2a

    if-lez v5, :cond_0

    if-eq p0, v6, :cond_0

    if-eq p0, v8, :cond_0

    .line 605
    return v7

    .line 608
    :cond_0
    const-wide/16 v9, 0x0

    cmpg-double v5, v3, v9

    if-gez v5, :cond_1

    const-wide/16 v3, 0x0

    goto :goto_0

    .line 609
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v9, v5

    cmpl-double v5, v3, v9

    if-lez v5, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v3, v5

    goto :goto_0

    .line 610
    :cond_2
    if-ne p0, v8, :cond_4

    cmpl-double v5, v3, v3

    if-nez v5, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v9, v5

    cmpl-double v5, v3, v9

    if-lez v5, :cond_4

    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    int-to-double v3, v5

    .line 612
    :cond_4
    :goto_0
    if-ne v8, p0, :cond_8

    .line 613
    array-length v5, p2

    if-eqz v5, :cond_5

    array-length v5, p2

    if-eq v5, v2, :cond_5

    array-length v5, p2

    const/4 v6, 0x2

    if-ne v5, v6, :cond_6

    aget-object v2, p2, v2

    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v2, v5, :cond_6

    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    int-to-double v3, v2

    .line 614
    :cond_6
    double-to-int v2, v3

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_1

    :cond_7
    move v0, v7

    :goto_1
    return v0

    .line 616
    :cond_8
    if-ne p0, v6, :cond_a

    .line 617
    double-to-int v2, v3

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_9

    goto :goto_2

    :cond_9
    move v0, v7

    goto :goto_2

    .line 618
    :cond_a
    double-to-int v0, v3

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 616
    :goto_2
    return v0
.end method

.method private static js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I
    .locals 5
    .param p0, "target"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 627
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v0

    .line 628
    .local v0, "search":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v1

    .line 630
    .local v1, "end":D
    cmpl-double v3, v1, v1

    if-nez v3, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v3, v3

    cmpl-double v3, v1, v3

    if-lez v3, :cond_0

    goto :goto_0

    .line 632
    :cond_0
    const-wide/16 v3, 0x0

    cmpg-double v3, v1, v3

    if-gez v3, :cond_2

    .line 633
    const-wide/16 v1, 0x0

    goto :goto_1

    .line 631
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v1, v3

    .line 635
    :cond_2
    :goto_1
    double-to-int v3, v1

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    return v3
.end method

.method private static js_pad(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "atStart"    # Ljava/lang/Boolean;

    .line 814
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 815
    .local v0, "pad":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {p3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toLength([Ljava/lang/Object;I)J

    move-result-wide v2

    .line 816
    .local v2, "intMaxLength":J
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    cmp-long v4, v2, v4

    if-gtz v4, :cond_0

    .line 817
    return-object v0

    .line 820
    :cond_0
    const-string v4, " "

    .line 821
    .local v4, "filler":Ljava/lang/String;
    array-length v5, p3

    const/4 v6, 0x2

    if-lt v5, v6, :cond_1

    const/4 v5, 0x1

    aget-object v6, p3, v5

    invoke-static {v6}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 822
    aget-object v6, p3, v5

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 823
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, v5, :cond_1

    .line 824
    return-object v0

    .line 829
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    int-to-long v5, v5

    sub-long v5, v2, v5

    long-to-int v5, v5

    .line 830
    .local v5, "fillLen":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 832
    .local v6, "concat":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 833
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lt v7, v5, :cond_3

    .line 834
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 836
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 837
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 840
    :cond_2
    invoke-virtual {v6, v1, v0}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 833
    :cond_3
    goto :goto_0
.end method

.method private static js_repeat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 775
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 776
    .local v0, "str":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {p3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v2

    .line 778
    .local v2, "cnt":D
    const-wide/16 v4, 0x0

    cmpg-double v6, v2, v4

    if-ltz v6, :cond_5

    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v6, v2, v6

    if-eqz v6, :cond_5

    .line 782
    cmpl-double v4, v2, v4

    if-eqz v4, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 786
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    int-to-long v4, v4

    double-to-long v6, v2

    mul-long/2addr v4, v6

    .line 788
    .local v4, "size":J
    const-wide v6, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double v6, v2, v6

    if-gtz v6, :cond_3

    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v4, v6

    if-gtz v6, :cond_3

    .line 792
    new-instance v6, Ljava/lang/StringBuilder;

    long-to-int v7, v4

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 793
    .local v6, "retval":Ljava/lang/StringBuilder;
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 795
    const/4 v7, 0x1

    .line 796
    .local v7, "i":I
    double-to-int v8, v2

    .line 797
    .local v8, "icnt":I
    :goto_0
    div-int/lit8 v9, v8, 0x2

    if-gt v7, v9, :cond_1

    .line 798
    invoke-virtual {v6, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 799
    mul-int/lit8 v7, v7, 0x2

    goto :goto_0

    .line 801
    :cond_1
    if-ge v7, v8, :cond_2

    .line 802
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    sub-int v10, v8, v7

    mul-int/2addr v9, v10

    invoke-virtual {v6, v1, v9}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 805
    :cond_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 789
    .end local v6    # "retval":Ljava/lang/StringBuilder;
    .end local v7    # "i":I
    .end local v8    # "icnt":I
    :cond_3
    const-string v1, "Invalid size or count value"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->rangeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 783
    .end local v4    # "size":J
    :cond_4
    :goto_1
    const-string v1, ""

    return-object v1

    .line 779
    :cond_5
    const-string v1, "Invalid count value"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->rangeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private static js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 10
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 745
    array-length v0, p1

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    if-ge v0, v1, :cond_0

    move-wide v4, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v4

    .line 747
    .local v4, "begin":D
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 748
    .local v0, "length":I
    cmpg-double v6, v4, v2

    if-gez v6, :cond_1

    .line 749
    int-to-double v6, v0

    add-double/2addr v4, v6

    .line 750
    cmpg-double v6, v4, v2

    if-gez v6, :cond_2

    .line 751
    const-wide/16 v4, 0x0

    goto :goto_1

    .line 752
    :cond_1
    int-to-double v6, v0

    cmpl-double v6, v4, v6

    if-lez v6, :cond_2

    .line 753
    int-to-double v4, v0

    .line 756
    :cond_2
    :goto_1
    array-length v6, p1

    const/4 v7, 0x2

    if-lt v6, v7, :cond_6

    aget-object v6, p1, v1

    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v6, v7, :cond_3

    goto :goto_3

    .line 759
    :cond_3
    aget-object v1, p1, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v6

    .line 760
    .local v6, "end":D
    cmpg-double v1, v6, v2

    if-gez v1, :cond_4

    .line 761
    int-to-double v8, v0

    add-double/2addr v6, v8

    .line 762
    cmpg-double v1, v6, v2

    if-gez v1, :cond_5

    .line 763
    const-wide/16 v6, 0x0

    goto :goto_2

    .line 764
    :cond_4
    int-to-double v1, v0

    cmpl-double v1, v6, v1

    if-lez v1, :cond_5

    .line 765
    int-to-double v6, v0

    .line 767
    :cond_5
    :goto_2
    cmpg-double v1, v6, v4

    if-gez v1, :cond_7

    .line 768
    move-wide v6, v4

    goto :goto_4

    .line 757
    .end local v6    # "end":D
    :cond_6
    :goto_3
    int-to-double v6, v0

    .line 770
    .restart local v6    # "end":D
    :cond_7
    :goto_4
    double-to-int v1, v4

    double-to-int v2, v6

    invoke-interface {p0, v1, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1
.end method

.method private static js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 8
    .param p0, "target"    # Ljava/lang/CharSequence;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 686
    array-length v0, p1

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 687
    return-object p0

    .line 689
    :cond_0
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v2

    .line 691
    .local v2, "begin":D
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 693
    .local v0, "length":I
    const-wide/16 v4, 0x0

    cmpg-double v6, v2, v4

    if-gez v6, :cond_1

    .line 694
    int-to-double v6, v0

    add-double/2addr v2, v6

    .line 695
    cmpg-double v6, v2, v4

    if-gez v6, :cond_2

    .line 696
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 697
    :cond_1
    int-to-double v6, v0

    cmpl-double v6, v2, v6

    if-lez v6, :cond_2

    .line 698
    int-to-double v2, v0

    .line 701
    :cond_2
    :goto_0
    array-length v6, p1

    if-ne v6, v1, :cond_3

    .line 702
    int-to-double v4, v0

    .local v4, "end":D
    goto :goto_1

    .line 704
    .end local v4    # "end":D
    :cond_3
    aget-object v1, p1, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v6

    .line 705
    .local v6, "end":D
    cmpg-double v1, v6, v4

    if-gez v1, :cond_4

    .line 706
    const-wide/16 v6, 0x0

    .line 707
    :cond_4
    add-double v4, v6, v2

    .line 708
    .end local v6    # "end":D
    .restart local v4    # "end":D
    int-to-double v6, v0

    cmpl-double v1, v4, v6

    if-lez v1, :cond_5

    .line 709
    int-to-double v4, v0

    .line 712
    :cond_5
    :goto_1
    double-to-int v1, v2

    double-to-int v6, v4

    invoke-interface {p0, v1, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1
.end method

.method private static js_substring(Lcom/trendmicro/hippo/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "target"    # Ljava/lang/CharSequence;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 645
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 646
    .local v0, "length":I
    const/4 v1, 0x0

    invoke-static {p2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v1

    .line 649
    .local v1, "start":D
    const-wide/16 v3, 0x0

    cmpg-double v5, v1, v3

    if-gez v5, :cond_0

    .line 650
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 651
    :cond_0
    int-to-double v5, v0

    cmpl-double v5, v1, v5

    if-lez v5, :cond_1

    .line 652
    int-to-double v1, v0

    .line 654
    :cond_1
    :goto_0
    array-length v5, p2

    const/4 v6, 0x1

    if-le v5, v6, :cond_6

    aget-object v5, p2, v6

    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v7, :cond_2

    goto :goto_2

    .line 657
    :cond_2
    aget-object v5, p2, v6

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v5

    .line 658
    .local v5, "end":D
    cmpg-double v3, v5, v3

    if-gez v3, :cond_3

    .line 659
    const-wide/16 v5, 0x0

    goto :goto_1

    .line 660
    :cond_3
    int-to-double v3, v0

    cmpl-double v3, v5, v3

    if-lez v3, :cond_4

    .line 661
    int-to-double v5, v0

    .line 664
    :cond_4
    :goto_1
    cmpg-double v3, v5, v1

    if-gez v3, :cond_7

    .line 665
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v3

    const/16 v4, 0x78

    if-eq v3, v4, :cond_5

    .line 666
    move-wide v3, v1

    .line 667
    .local v3, "temp":D
    move-wide v1, v5

    .line 668
    move-wide v5, v3

    .line 669
    .end local v3    # "temp":D
    goto :goto_3

    .line 671
    :cond_5
    move-wide v5, v1

    goto :goto_3

    .line 655
    .end local v5    # "end":D
    :cond_6
    :goto_2
    int-to-double v5, v0

    .line 675
    .restart local v5    # "end":D
    :cond_7
    :goto_3
    double-to-int v3, v1

    double-to-int v4, v5

    invoke-interface {p1, v3, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    return-object v3
.end method

.method private static realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeString;
    .locals 1
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 511
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeString;

    if-eqz v0, :cond_0

    .line 513
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeString;

    return-object v0

    .line 512
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeString;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 4
    .param p0, "thisObj"    # Ljava/lang/Object;
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 522
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 523
    .local v0, "str":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 524
    .local v1, "result":Ljava/lang/StringBuilder;
    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 525
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    if-eqz p2, :cond_0

    .line 527
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 528
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    const/4 v2, 0x0

    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 533
    :cond_0
    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 534
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    const-string v3, "</"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 538
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 195
    sget-object v0, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 198
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 201
    .local v0, "id":I
    :goto_0
    const-string v1, ""

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eq v0, v2, :cond_23

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    const-string v5, "a"

    const-string v6, "font"

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    packed-switch v0, :pswitch_data_2

    .line 505
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "String.prototype has no method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 502
    :pswitch_0
    new-instance v1, Lcom/trendmicro/hippo/NativeStringIterator;

    invoke-direct {v1, p3, p4}, Lcom/trendmicro/hippo/NativeStringIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    return-object v1

    .line 493
    :pswitch_1
    invoke-static {p2, p4, p1}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 494
    .local v1, "str":Ljava/lang/String;
    invoke-static {p5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v2

    .line 496
    .local v2, "cnt":D
    cmpg-double v4, v2, v7

    if-ltz v4, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    int-to-double v4, v4

    cmpl-double v4, v2, v4

    if-ltz v4, :cond_1

    goto :goto_1

    .line 498
    :cond_1
    double-to-int v4, v2

    invoke-virtual {v1, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2

    .line 497
    :cond_2
    :goto_1
    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 496
    :goto_2
    return-object v4

    .line 489
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "cnt":D
    :pswitch_2
    invoke-static {p2, p4, p1, p5}, Lcom/trendmicro/hippo/NativeString;->js_repeat(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 475
    :pswitch_3
    invoke-static {p5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    .line 478
    .local v1, "formStr":Ljava/lang/String;
    sget-object v2, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-virtual {v2}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    .local v2, "form":Ljava/text/Normalizer$Form;
    goto :goto_4

    .line 479
    .end local v2    # "form":Ljava/text/Normalizer$Form;
    :cond_3
    sget-object v2, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-virtual {v2}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    .restart local v2    # "form":Ljava/text/Normalizer$Form;
    goto :goto_4

    .line 480
    .end local v2    # "form":Ljava/text/Normalizer$Form;
    :cond_4
    sget-object v2, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    invoke-virtual {v2}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v2, Ljava/text/Normalizer$Form;->NFKD:Ljava/text/Normalizer$Form;

    .restart local v2    # "form":Ljava/text/Normalizer$Form;
    goto :goto_4

    .line 481
    .end local v2    # "form":Ljava/text/Normalizer$Form;
    :cond_5
    sget-object v2, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    invoke-virtual {v2}, Ljava/text/Normalizer$Form;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    array-length v2, p5

    if-nez v2, :cond_6

    goto :goto_3

    .line 482
    :cond_6
    const-string v2, "The normalization form should be one of NFC, NFD, NFKC, NFKD"

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->rangeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 481
    :cond_7
    :goto_3
    sget-object v2, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    .line 484
    .restart local v2    # "form":Ljava/text/Normalizer$Form;
    :goto_4
    invoke-static {p2, p4, p1}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 296
    .end local v1    # "formStr":Ljava/lang/String;
    .end local v2    # "form":Ljava/text/Normalizer$Form;
    :pswitch_4
    invoke-static {p2, p4, p1}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 297
    .local v1, "s":Ljava/lang/String;
    array-length v5, p5

    if-lez v5, :cond_9

    aget-object v5, p5, v4

    instance-of v5, v5, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-nez v5, :cond_8

    goto :goto_5

    .line 298
    :cond_8
    const-class v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "msg.first.arg.not.regexp"

    invoke-static {v4, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 301
    :cond_9
    :goto_5
    invoke-static {v0, v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v5

    .line 303
    .local v5, "idx":I
    const/16 v6, 0x28

    if-ne v0, v6, :cond_b

    .line 304
    if-eq v5, v2, :cond_a

    goto :goto_6

    :cond_a
    move v3, v4

    :goto_6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 306
    :cond_b
    const/16 v6, 0x29

    if-ne v0, v6, :cond_d

    .line 307
    if-nez v5, :cond_c

    goto :goto_7

    :cond_c
    move v3, v4

    :goto_7
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 309
    :cond_d
    const/16 v6, 0x2a

    if-ne v0, v6, :cond_f

    .line 310
    if-eq v5, v2, :cond_e

    goto :goto_8

    :cond_e
    move v3, v4

    :goto_8
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 316
    .end local v1    # "s":Ljava/lang/String;
    .end local v5    # "idx":I
    :cond_f
    :pswitch_5
    const/16 v1, 0x2e

    if-ne v0, v1, :cond_10

    goto :goto_9

    :cond_10
    move v3, v4

    :goto_9
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p2, p4, p1, p5, v1}, Lcom/trendmicro/hippo/NativeString;->js_pad(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 461
    :pswitch_6
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 462
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 464
    .local v2, "chars":[C
    const/4 v3, 0x0

    .line 466
    .local v3, "start":I
    array-length v4, v2

    .line 467
    .local v4, "end":I
    :goto_a
    if-le v4, v3, :cond_11

    add-int/lit8 v5, v4, -0x1

    aget-char v5, v2, v5

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 468
    add-int/lit8 v4, v4, -0x1

    goto :goto_a

    .line 471
    :cond_11
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 448
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "chars":[C
    .end local v3    # "start":I
    .end local v4    # "end":I
    :pswitch_7
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 449
    .restart local v1    # "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 451
    .restart local v2    # "chars":[C
    const/4 v3, 0x0

    .line 452
    .restart local v3    # "start":I
    :goto_b
    array-length v4, v2

    if-ge v3, v4, :cond_12

    aget-char v4, v2, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 453
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 455
    :cond_12
    array-length v4, v2

    .line 457
    .restart local v4    # "end":I
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 433
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "chars":[C
    .end local v3    # "start":I
    .end local v4    # "end":I
    :pswitch_8
    invoke-static {p2, p4, p1}, Lcom/trendmicro/hippo/ScriptRuntimeES6;->requireObjectCoercible(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 434
    .restart local v1    # "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 436
    .restart local v2    # "chars":[C
    const/4 v3, 0x0

    .line 437
    .restart local v3    # "start":I
    :goto_c
    array-length v4, v2

    if-ge v3, v4, :cond_13

    aget-char v4, v2, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 438
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 440
    :cond_13
    array-length v4, v2

    .line 441
    .restart local v4    # "end":I
    :goto_d
    if-le v4, v3, :cond_14

    add-int/lit8 v5, v4, -0x1

    aget-char v5, v2, v5

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 442
    add-int/lit8 v4, v4, -0x1

    goto :goto_d

    .line 445
    :cond_14
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 429
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "chars":[C
    .end local v3    # "start":I
    .end local v4    # "end":I
    :pswitch_9
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 430
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Context;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 429
    return-object v1

    .line 425
    :pswitch_a
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 426
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Context;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 425
    return-object v1

    .line 417
    :pswitch_b
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Context;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v1

    .line 418
    .local v1, "collator":Ljava/text/Collator;
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/text/Collator;->setStrength(I)V

    .line 419
    invoke-virtual {v1, v3}, Ljava/text/Collator;->setDecomposition(I)V

    .line 420
    nop

    .line 421
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 422
    invoke-static {p5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    .line 420
    invoke-virtual {v1, v2, v3}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    int-to-double v2, v2

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    return-object v2

    .line 401
    .end local v1    # "collator":Ljava/text/Collator;
    :pswitch_c
    const/16 v1, 0x1f

    if-ne v0, v1, :cond_15

    .line 402
    const/4 v1, 0x1

    move v7, v1

    .local v1, "actionType":I
    goto :goto_e

    .line 403
    .end local v1    # "actionType":I
    :cond_15
    const/16 v1, 0x20

    if-ne v0, v1, :cond_16

    .line 404
    const/4 v1, 0x3

    move v7, v1

    .restart local v1    # "actionType":I
    goto :goto_e

    .line 406
    .end local v1    # "actionType":I
    :cond_16
    const/4 v1, 0x2

    move v7, v1

    .line 408
    .local v7, "actionType":I
    :goto_e
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->checkRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v1

    .line 409
    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, v7

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/RegExpProxy;->action(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 408
    return-object v1

    .line 390
    .end local v7    # "actionType":I
    :pswitch_d
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 391
    .local v1, "s1":Ljava/lang/String;
    invoke-static {p5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 393
    .local v2, "s2":Ljava/lang/String;
    const/16 v3, 0x1d

    if-ne v0, v3, :cond_17

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_f

    .line 394
    :cond_17
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 392
    :goto_f
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3

    .line 386
    .end local v1    # "s1":Ljava/lang/String;
    .end local v2    # "s2":Ljava/lang/String;
    :pswitch_e
    const-string v1, "name"

    invoke-static {p4, v5, v1, p5}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 383
    :pswitch_f
    const-string v1, "href"

    invoke-static {p4, v5, v1, p5}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 380
    :pswitch_10
    const-string v1, "color"

    invoke-static {p4, v6, v1, p5}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 377
    :pswitch_11
    const-string v1, "size"

    invoke-static {p4, v6, v1, p5}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 374
    :pswitch_12
    const-string v1, "sub"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 371
    :pswitch_13
    const-string v1, "sup"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 368
    :pswitch_14
    const-string v1, "blink"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 365
    :pswitch_15
    const-string v1, "big"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 362
    :pswitch_16
    const-string v1, "small"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 359
    :pswitch_17
    const-string v1, "strike"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 356
    :pswitch_18
    const-string v1, "tt"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 353
    :pswitch_19
    const-string v1, "i"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 350
    :pswitch_1a
    const-string v1, "b"

    invoke-static {p4, v1, v9, v9}, Lcom/trendmicro/hippo/NativeString;->tagify(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 347
    :pswitch_1b
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_slice(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1

    .line 344
    :pswitch_1c
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_concat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 341
    :pswitch_1d
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_substr(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1

    .line 337
    :pswitch_1e
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 332
    :pswitch_1f
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 328
    :pswitch_20
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {p2, v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_substring(Lcom/trendmicro/hippo/Context;Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    return-object v1

    .line 323
    :pswitch_21
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->checkRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v1

    .line 324
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, p2, p3, v2, p5}, Lcom/trendmicro/hippo/RegExpProxy;->js_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 323
    return-object v1

    .line 319
    :pswitch_22
    nop

    .line 320
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 319
    invoke-static {v1, p5}, Lcom/trendmicro/hippo/NativeString;->js_lastIndexOf(Ljava/lang/String;[Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 291
    :pswitch_23
    const/4 v1, 0x7

    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p5}, Lcom/trendmicro/hippo/NativeString;->js_indexOf(ILjava/lang/String;[Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 279
    :pswitch_24
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 280
    .local v2, "target":Ljava/lang/CharSequence;
    invoke-static {p5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 281
    .local v3, "pos":D
    cmpg-double v5, v3, v7

    const/4 v6, 0x5

    if-ltz v5, :cond_1a

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v5

    int-to-double v7, v5

    cmpl-double v5, v3, v7

    if-ltz v5, :cond_18

    goto :goto_10

    .line 285
    :cond_18
    double-to-int v1, v3

    invoke-interface {v2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 286
    .local v1, "c":C
    if-ne v0, v6, :cond_19

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 287
    :cond_19
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v5

    return-object v5

    .line 282
    .end local v1    # "c":C
    :cond_1a
    :goto_10
    if-ne v0, v6, :cond_1b

    return-object v1

    .line 283
    :cond_1b
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v1

    .line 272
    .end local v2    # "target":Ljava/lang/CharSequence;
    .end local v3    # "pos":D
    :pswitch_25
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/NativeString;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeString;

    move-result-object v1

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    .line 273
    .local v1, "s":Ljava/lang/CharSequence;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(new String(\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\"))"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 268
    .end local v1    # "s":Ljava/lang/CharSequence;
    :pswitch_26
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/NativeString;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/NativeString;

    move-result-object v1

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    .line 269
    .local v1, "cs":Ljava/lang/CharSequence;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_1c

    move-object v2, v1

    goto :goto_11

    :cond_1c
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_11
    return-object v2

    .line 247
    .end local v1    # "cs":Ljava/lang/CharSequence;
    :pswitch_27
    array-length v1, p5

    if-nez v1, :cond_1d

    .line 248
    const-string v1, ""

    .local v1, "s":Ljava/lang/CharSequence;
    goto :goto_12

    .line 249
    .end local v1    # "s":Ljava/lang/CharSequence;
    :cond_1d
    aget-object v1, p5, v4

    .line 250
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    if-eqz p4, :cond_1e

    .line 253
    aget-object v1, p5, v4

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "s":Ljava/lang/CharSequence;
    goto :goto_12

    .line 255
    .end local v1    # "s":Ljava/lang/CharSequence;
    :cond_1e
    aget-object v1, p5, v4

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 257
    .restart local v1    # "s":Ljava/lang/CharSequence;
    :goto_12
    if-nez p4, :cond_1f

    .line 259
    new-instance v2, Lcom/trendmicro/hippo/NativeString;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/NativeString;-><init>(Ljava/lang/CharSequence;)V

    return-object v2

    .line 262
    :cond_1f
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_20

    move-object v2, v1

    goto :goto_13

    :cond_20
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_13
    return-object v2

    .line 219
    .end local v1    # "s":Ljava/lang/CharSequence;
    :pswitch_28
    array-length v1, p5

    if-lez v1, :cond_22

    .line 220
    aget-object v1, p5, v4

    .line 221
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 220
    invoke-static {p2, p3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 222
    array-length v1, p5

    sub-int/2addr v1, v3

    new-array v1, v1, [Ljava/lang/Object;

    .line 223
    .local v1, "newArgs":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    array-length v3, v1

    if-ge v2, v3, :cond_21

    .line 224
    add-int/lit8 v3, v2, 0x1

    aget-object v3, p5, v3

    aput-object v3, v1, v2

    .line 223
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 225
    .end local v2    # "i":I
    :cond_21
    move-object p5, v1

    .line 226
    .end local v1    # "newArgs":[Ljava/lang/Object;
    goto :goto_15

    .line 227
    :cond_22
    nop

    .line 228
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 227
    invoke-static {p2, p3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p4

    .line 230
    :goto_15
    neg-int v0, v0

    .line 231
    goto/16 :goto_0

    .line 235
    :cond_23
    array-length v2, p5

    .line 236
    .local v2, "N":I
    if-ge v2, v3, :cond_24

    .line 237
    return-object v1

    .line 238
    :cond_24
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 239
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_16
    if-eq v3, v2, :cond_25

    .line 240
    aget-object v4, p5, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint16(Ljava/lang/Object;)C

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 239
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 242
    .end local v3    # "i":I
    :cond_25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    nop

    :pswitch_data_0
    .packed-switch -0x23
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0xf
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_26
        :pswitch_24
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
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
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_5
        :pswitch_5
        :pswitch_0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 12
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 89
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "fromCharCode"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 91
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v9, -0x5

    const-string v10, "charAt"

    const/4 v11, 0x2

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 93
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "charCodeAt"

    const/4 v5, 0x2

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 95
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v9, -0x7

    const-string v10, "indexOf"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 97
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "lastIndexOf"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 99
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0x9

    const-string v10, "split"

    const/4 v11, 0x3

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 101
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xa

    const-string v4, "substring"

    const/4 v5, 0x3

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 103
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0xb

    const-string v10, "toLowerCase"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 105
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xc

    const-string v4, "toUpperCase"

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 107
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0xd

    const-string v10, "substr"

    const/4 v11, 0x3

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 109
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0xe

    const-string v4, "concat"

    const/4 v5, 0x2

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 111
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0xf

    const-string v10, "slice"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 113
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x1e

    const-string v4, "equalsIgnoreCase"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 115
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0x1f

    const-string v10, "match"

    const/4 v11, 0x2

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 117
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x20

    const-string v4, "search"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 119
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0x21

    const-string v10, "replace"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 121
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v3, -0x22

    const-string v4, "localeCompare"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 123
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    const/16 v9, -0x23

    const-string v10, "toLocaleLowerCase"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeString;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 125
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 126
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 64
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const/4 v0, 0x7

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/NativeString;->instanceIdInfo(II)I

    move-result v0

    return v0

    .line 67
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 846
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 847
    const/16 v0, 0x30

    return v0

    .line 849
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 16
    .param p1, "s"    # Ljava/lang/String;

    .line 859
    move-object/from16 v0, p1

    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v2, 0x0

    .line 860
    .local v2, "X":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x55

    const/16 v5, 0x4c

    const/16 v6, 0x66

    const/16 v7, 0x72

    const/16 v8, 0x63

    const/16 v12, 0x64

    const/4 v13, 0x2

    const/16 v15, 0x65

    const/16 v10, 0x6e

    const/16 v11, 0x73

    const/16 v9, 0x74

    const/4 v14, 0x0

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 926
    :pswitch_1
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 927
    .local v3, "c":I
    if-ne v3, v5, :cond_0

    const-string v2, "toLocaleLowerCase"

    const/16 v1, 0x23

    goto/16 :goto_0

    .line 928
    :cond_0
    if-ne v3, v4, :cond_29

    const-string v2, "toLocaleUpperCase"

    const/16 v1, 0x24

    goto/16 :goto_0

    .line 925
    .end local v3    # "c":I
    :pswitch_2
    const-string v2, "equalsIgnoreCase"

    const/16 v1, 0x1e

    goto/16 :goto_0

    .line 924
    :pswitch_3
    const-string v2, "localeCompare"

    const/16 v1, 0x22

    goto/16 :goto_0

    .line 917
    :pswitch_4
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v5, :cond_5

    if-eq v3, v4, :cond_4

    if-eq v3, v12, :cond_3

    if-eq v3, v10, :cond_2

    if-eq v3, v11, :cond_1

    .line 923
    goto/16 :goto_0

    .line 922
    :cond_1
    const-string v2, "lastIndexOf"

    const/16 v1, 0x8

    goto/16 :goto_0

    .line 921
    :cond_2
    const-string v2, "constructor"

    const/4 v1, 0x1

    goto/16 :goto_0

    .line 920
    :cond_3
    const-string v2, "codePointAt"

    const/16 v1, 0x2d

    goto/16 :goto_0

    .line 919
    :cond_4
    const-string v2, "toUpperCase"

    const/16 v1, 0xc

    goto/16 :goto_0

    .line 918
    :cond_5
    const-string v2, "toLowerCase"

    const/16 v1, 0xb

    goto/16 :goto_0

    .line 913
    :pswitch_5
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 914
    .restart local v3    # "c":I
    if-ne v3, v8, :cond_6

    const-string v2, "charCodeAt"

    const/4 v1, 0x6

    goto/16 :goto_0

    .line 915
    :cond_6
    if-ne v3, v11, :cond_29

    const-string v2, "startsWith"

    const/16 v1, 0x29

    goto/16 :goto_0

    .line 907
    .end local v3    # "c":I
    :pswitch_6
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v6, :cond_a

    if-eq v3, v10, :cond_9

    if-eq v3, v11, :cond_8

    if-eq v3, v9, :cond_7

    .line 912
    goto/16 :goto_0

    .line 911
    :cond_7
    const-string v2, "trimRight"

    const/16 v1, 0x27

    goto/16 :goto_0

    .line 910
    :cond_8
    const-string v2, "substring"

    const/16 v1, 0xa

    goto/16 :goto_0

    .line 909
    :cond_9
    const-string v2, "normalize"

    const/16 v1, 0x2b

    goto/16 :goto_0

    .line 908
    :cond_a
    const-string v2, "fontcolor"

    const/16 v1, 0x1a

    goto/16 :goto_0

    .line 898
    :pswitch_7
    const/4 v3, 0x6

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v8, :cond_11

    if-eq v3, v10, :cond_10

    if-eq v3, v7, :cond_f

    if-eq v3, v9, :cond_e

    const/16 v4, 0x7a

    if-eq v3, v4, :cond_d

    if-eq v3, v15, :cond_c

    if-eq v3, v6, :cond_b

    .line 906
    goto/16 :goto_0

    .line 901
    :cond_b
    const-string v2, "trimLeft"

    const/16 v1, 0x26

    goto/16 :goto_0

    .line 900
    :cond_c
    const-string v2, "includes"

    const/16 v1, 0x28

    goto/16 :goto_0

    .line 905
    :cond_d
    const-string v2, "fontsize"

    const/16 v1, 0x19

    goto/16 :goto_0

    .line 904
    :cond_e
    const-string v2, "endsWith"

    const/16 v1, 0x2a

    goto/16 :goto_0

    .line 903
    :cond_f
    const-string v2, "padStart"

    const/16 v1, 0x2e

    goto/16 :goto_0

    .line 902
    :cond_10
    const-string v2, "toString"

    const/4 v1, 0x2

    goto/16 :goto_0

    .line 899
    :cond_11
    const-string v2, "toSource"

    const/4 v1, 0x3

    goto/16 :goto_0

    .line 892
    :pswitch_8
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-eq v3, v4, :cond_15

    if-eq v3, v15, :cond_14

    if-eq v3, v10, :cond_13

    if-eq v3, v9, :cond_12

    .line 897
    goto/16 :goto_0

    .line 896
    :cond_12
    const-string v2, "italics"

    const/16 v1, 0x11

    goto/16 :goto_0

    .line 895
    :cond_13
    const-string v2, "indexOf"

    const/4 v1, 0x7

    goto/16 :goto_0

    .line 894
    :cond_14
    const-string v2, "replace"

    const/16 v1, 0x21

    goto/16 :goto_0

    .line 893
    :cond_15
    const-string v2, "valueOf"

    const/4 v1, 0x4

    goto/16 :goto_0

    .line 879
    :pswitch_9
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-eq v3, v4, :cond_1e

    if-eq v3, v15, :cond_1c

    const/16 v4, 0x68

    if-eq v3, v4, :cond_1b

    const/16 v4, 0x71

    if-eq v3, v4, :cond_1a

    if-eq v3, v10, :cond_19

    const/16 v4, 0x6f

    if-eq v3, v4, :cond_18

    if-eq v3, v9, :cond_17

    const/16 v4, 0x75

    if-eq v3, v4, :cond_16

    .line 891
    goto/16 :goto_0

    .line 890
    :cond_16
    const-string v2, "substr"

    const/16 v1, 0xd

    goto/16 :goto_0

    .line 889
    :cond_17
    const-string v2, "strike"

    const/16 v1, 0x13

    goto/16 :goto_0

    .line 887
    :cond_18
    const-string v2, "concat"

    const/16 v1, 0xe

    goto/16 :goto_0

    .line 886
    :cond_19
    const-string v2, "anchor"

    const/16 v1, 0x1c

    goto/16 :goto_0

    .line 888
    :cond_1a
    const-string v2, "equals"

    const/16 v1, 0x1d

    goto/16 :goto_0

    .line 885
    :cond_1b
    const-string v2, "charAt"

    const/4 v1, 0x5

    goto/16 :goto_0

    .line 881
    :cond_1c
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 882
    .restart local v3    # "c":I
    if-ne v3, v7, :cond_1d

    const-string v2, "repeat"

    const/16 v1, 0x2c

    goto/16 :goto_0

    .line 883
    :cond_1d
    if-ne v3, v11, :cond_29

    const-string v2, "search"

    const/16 v1, 0x20

    goto/16 :goto_0

    .line 880
    .end local v3    # "c":I
    :cond_1e
    const-string v2, "padEnd"

    const/16 v1, 0x2f

    goto/16 :goto_0

    .line 871
    :pswitch_a
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v12, :cond_24

    if-eq v3, v15, :cond_23

    const/16 v4, 0x68

    if-eq v3, v4, :cond_22

    if-eq v3, v9, :cond_21

    const/16 v4, 0x6b

    if-eq v3, v4, :cond_20

    const/16 v4, 0x6c

    if-eq v3, v4, :cond_1f

    .line 878
    goto/16 :goto_0

    .line 876
    :cond_1f
    const-string v2, "small"

    const/16 v1, 0x14

    goto/16 :goto_0

    .line 875
    :cond_20
    const-string v2, "blink"

    const/16 v1, 0x16

    goto/16 :goto_0

    .line 877
    :cond_21
    const-string v2, "split"

    const/16 v1, 0x9

    goto/16 :goto_0

    .line 874
    :cond_22
    const-string v2, "match"

    const/16 v1, 0x1f

    goto/16 :goto_0

    .line 873
    :cond_23
    const-string v2, "slice"

    const/16 v1, 0xf

    goto/16 :goto_0

    .line 872
    :cond_24
    const-string v2, "fixed"

    const/16 v1, 0x12

    goto/16 :goto_0

    .line 866
    :pswitch_b
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 867
    .restart local v3    # "c":I
    const/16 v4, 0x62

    if-ne v3, v4, :cond_25

    const-string v2, "bold"

    const/16 v1, 0x10

    goto :goto_0

    .line 868
    :cond_25
    const/16 v4, 0x6c

    if-ne v3, v4, :cond_26

    const-string v2, "link"

    const/16 v1, 0x1b

    goto :goto_0

    .line 869
    :cond_26
    if-ne v3, v9, :cond_29

    const-string v2, "trim"

    const/16 v1, 0x25

    goto :goto_0

    .line 861
    .end local v3    # "c":I
    :pswitch_c
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 862
    .restart local v3    # "c":I
    const/16 v4, 0x62

    if-ne v3, v4, :cond_27

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v11, :cond_29

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x75

    if-ne v4, v5, :cond_29

    const/16 v1, 0x18

    goto :goto_1

    .line 863
    :cond_27
    const/16 v4, 0x67

    if-ne v3, v4, :cond_28

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x62

    if-ne v4, v5, :cond_29

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x69

    if-ne v4, v5, :cond_29

    const/16 v1, 0x15

    goto :goto_1

    .line 864
    :cond_28
    const/16 v4, 0x70

    if-ne v3, v4, :cond_29

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v11, :cond_29

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x75

    if-ne v4, v5, :cond_29

    const/16 v1, 0x17

    goto :goto_1

    .line 931
    .end local v3    # "c":I
    :cond_29
    :goto_0
    if-eqz v2, :cond_2a

    if-eq v2, v0, :cond_2a

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    const/4 v1, 0x0

    .line 935
    .end local v2    # "X":Ljava/lang/String;
    :cond_2a
    :goto_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 555
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 556
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 558
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 48
    const-string v0, "String"

    return-object v0
.end method

.method protected getIds(ZZ)[Ljava/lang/Object;
    .locals 6
    .param p1, "nonEnumerable"    # Z
    .param p2, "getSymbols"    # Z

    .line 581
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 582
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0xc8

    if-lt v1, v2, :cond_1

    .line 583
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v1

    .line 584
    .local v1, "sids":[Ljava/lang/Object;
    array-length v2, v1

    iget-object v3, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    add-int/2addr v2, v3

    new-array v2, v2, [Ljava/lang/Object;

    .line 586
    .local v2, "a":[Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 587
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 586
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 589
    :cond_0
    const/4 v4, 0x0

    array-length v5, v1

    invoke-static {v1, v4, v2, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 590
    return-object v2

    .line 592
    .end local v1    # "sids":[Ljava/lang/Object;
    .end local v2    # "a":[Ljava/lang/Object;
    .end local v3    # "i":I
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 73
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "length"

    return-object v0

    .line 74
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 80
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 83
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getLength()I
    .locals 1

    .line 679
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 58
    const/4 v0, 0x1

    return v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 571
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 572
    const/4 v0, 0x1

    return v0

    .line 574
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 13
    .param p1, "id"    # I

    .line 131
    const/16 v0, 0x30

    if-ne p1, v0, :cond_0

    .line 132
    sget-object v2, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    sget-object v4, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v6, 0x0

    const-string v5, "[Symbol.iterator]"

    move-object v1, p0

    move v3, p1

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeString;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 133
    return-void

    .line 136
    :cond_0
    const/4 v0, 0x0

    .line 138
    .local v0, "fnName":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 186
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :pswitch_0
    const/4 v1, 0x1

    .local v1, "arity":I
    const-string v2, "padEnd"

    .local v2, "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 184
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "padStart"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 183
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "codePointAt"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 182
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "repeat"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 181
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "normalize"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 180
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "endsWith"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 179
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "startsWith"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 178
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "includes"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 177
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "trimRight"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 176
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "trimLeft"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 175
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "trim"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 174
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toLocaleUpperCase"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 173
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toLocaleLowerCase"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 172
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "localeCompare"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 171
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "replace"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 170
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "search"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 169
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "match"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 168
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_11
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "equalsIgnoreCase"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 167
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_12
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "equals"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 166
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_13
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "anchor"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 165
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_14
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "link"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 164
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_15
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "fontcolor"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 163
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "fontsize"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 162
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_17
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "sub"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 161
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_18
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "sup"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_0

    .line 160
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_19
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "blink"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 159
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "big"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 158
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1b
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "small"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 157
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1c
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "strike"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 156
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1d
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "fixed"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 155
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "italics"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 154
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_1f
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "bold"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 153
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_20
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "slice"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 152
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_21
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "concat"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 151
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "substr"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 150
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_23
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toUpperCase"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 149
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_24
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toLowerCase"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 148
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_25
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "substring"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 147
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "split"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 146
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_27
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "lastIndexOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 145
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_28
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "indexOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 144
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_29
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "charCodeAt"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 143
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "charAt"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 142
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2b
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "valueOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 141
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2c
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toSource"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 140
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2d
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toString"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 139
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "constructor"

    .line 188
    .restart local v2    # "s":Ljava/lang/String;
    :goto_0
    sget-object v8, Lcom/trendmicro/hippo/NativeString;->STRING_TAG:Ljava/lang/Object;

    move-object v7, p0

    move v9, p1

    move-object v10, v2

    move-object v11, v0

    move v12, v1

    invoke-virtual/range {v7 .. v12}, Lcom/trendmicro/hippo/NativeString;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 189
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
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

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 563
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 564
    return-void

    .line 566
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 567
    return-void
.end method

.method public toCharSequence()Ljava/lang/CharSequence;
    .locals 1

    .line 542
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 547
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeString;->string:Ljava/lang/CharSequence;

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
