.class public Lcom/trendmicro/hippo/NativeJavaObject;
.super Ljava/lang/Object;
.source "NativeJavaObject.java"

# interfaces
.implements Lcom/trendmicro/hippo/Scriptable;
.implements Lcom/trendmicro/hippo/SymbolScriptable;
.implements Lcom/trendmicro/hippo/Wrapper;
.implements Ljava/io/Serializable;


# static fields
.field private static final COERCED_INTERFACE_KEY:Ljava/lang/Object;

.field static final CONVERSION_NONE:B = 0x63t

.field static final CONVERSION_NONTRIVIAL:B = 0x0t

.field static final CONVERSION_TRIVIAL:B = 0x1t

.field private static final JSTYPE_BOOLEAN:I = 0x2

.field private static final JSTYPE_JAVA_ARRAY:I = 0x7

.field private static final JSTYPE_JAVA_CLASS:I = 0x5

.field private static final JSTYPE_JAVA_OBJECT:I = 0x6

.field private static final JSTYPE_NULL:I = 0x1

.field private static final JSTYPE_NUMBER:I = 0x3

.field private static final JSTYPE_OBJECT:I = 0x8

.field private static final JSTYPE_STRING:I = 0x4

.field private static final JSTYPE_UNDEFINED:I = 0x0

.field private static adapter_readAdapterObject:Ljava/lang/reflect/Method; = null

.field private static adapter_writeAdapterObject:Ljava/lang/reflect/Method; = null

.field private static final serialVersionUID:J = -0x606e5a61ca3bce1fL


# instance fields
.field private transient fieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field

.field protected transient isAdapter:Z

.field protected transient javaObject:Ljava/lang/Object;

.field protected transient members:Lcom/trendmicro/hippo/JavaMembers;

.field protected parent:Lcom/trendmicro/hippo/Scriptable;

.field protected prototype:Lcom/trendmicro/hippo/Scriptable;

.field protected transient staticType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 978
    const-string v0, "Coerced Interface"

    sput-object v0, Lcom/trendmicro/hippo/NativeJavaObject;->COERCED_INTERFACE_KEY:Ljava/lang/Object;

    .line 984
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    .line 985
    .local v0, "sig2":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v1, "com.trendmicro.hippo.JavaAdapter"

    invoke-static {v1}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 986
    .local v1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_0

    .line 988
    :try_start_0
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 989
    const-string v2, "java.io.ObjectOutputStream"

    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v0, v4

    .line 990
    const-string v2, "writeAdapterObject"

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    .line 993
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v2, v0, v3

    .line 994
    const-string v2, "java.io.ObjectInputStream"

    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v0, v4

    .line 995
    const-string v2, "readAdapterObject"

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1001
    goto :goto_0

    .line 998
    :catch_0
    move-exception v2

    .line 999
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    const/4 v3, 0x0

    sput-object v3, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    .line 1000
    sput-object v3, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;

    .line 1003
    .end local v0    # "sig2":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v1    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :cond_0
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 40
    .local p3, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V
    .locals 0
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .param p4, "isAdapter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 45
    .local p3, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->parent:Lcom/trendmicro/hippo/Scriptable;

    .line 47
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    .line 48
    iput-object p3, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    .line 49
    iput-boolean p4, p0, Lcom/trendmicro/hippo/NativeJavaObject;->isAdapter:Z

    .line 50
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaObject;->initMembers()V

    .line 51
    return-void
.end method

.method public static canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z
    .locals 2
    .param p0, "fromObj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 257
    .local p1, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v0

    .line 259
    .local v0, "weight":I
    const/16 v1, 0x63

    if-ge v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 729
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 732
    .local v0, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_19

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    if-ne p0, v1, :cond_0

    goto/16 :goto_a

    .line 743
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_17

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_17

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_1

    goto/16 :goto_8

    .line 750
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_f

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_2

    goto/16 :goto_4

    .line 775
    :cond_2
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_d

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_3

    goto/16 :goto_3

    .line 785
    :cond_3
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->LongClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_b

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_4

    goto :goto_2

    .line 804
    :cond_4
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_9

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_5

    goto :goto_1

    .line 814
    :cond_5
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_6

    goto :goto_0

    .line 824
    :cond_6
    new-instance v1, Ljava/lang/Double;

    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    return-object v1

    .line 815
    :cond_7
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_8

    .line 816
    return-object p1

    .line 818
    :cond_8
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    const-wide/high16 v4, -0x3fa0000000000000L    # -128.0

    const-wide v6, 0x405fc00000000000L    # 127.0

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-byte v1, v1

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    return-object v1

    .line 805
    :cond_9
    :goto_1
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_a

    .line 806
    return-object p1

    .line 808
    :cond_a
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    const-wide/high16 v4, -0x3f20000000000000L    # -32768.0

    const-wide v6, 0x40dfffc000000000L    # 32767.0

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-short v1, v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    return-object v1

    .line 786
    :cond_b
    :goto_2
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->LongClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_c

    .line 787
    return-object p1

    .line 796
    :cond_c
    const-wide v1, 0x43dfffffffffffffL    # 9.2233720368547748E18

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v1

    .line 797
    .local v1, "max":D
    const-wide/high16 v3, -0x3c20000000000000L    # -9.223372036854776E18

    invoke-static {v3, v4}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v9

    .line 798
    .local v9, "min":D
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->LongClass:Ljava/lang/Class;

    move-object v3, p1

    move-wide v5, v9

    move-wide v7, v1

    invoke-static/range {v3 .. v8}, Lcom/trendmicro/hippo/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    return-object v3

    .line 776
    .end local v1    # "max":D
    .end local v9    # "min":D
    :cond_d
    :goto_3
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_e

    .line 777
    return-object p1

    .line 779
    :cond_e
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    const-wide/high16 v4, -0x3e20000000000000L    # -2.147483648E9

    const-wide v6, 0x41dfffffffc00000L    # 2.147483647E9

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 751
    :cond_f
    :goto_4
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_10

    .line 752
    return-object p1

    .line 754
    :cond_10
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v1

    .line 755
    .local v1, "number":D
    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    if-nez v3, :cond_16

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-nez v3, :cond_16

    const-wide/16 v3, 0x0

    cmpl-double v5, v1, v3

    if-nez v5, :cond_11

    goto :goto_7

    .line 760
    :cond_11
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    .line 761
    .local v5, "absNumber":D
    const-wide/high16 v7, 0x36a0000000000000L    # 1.401298464324817E-45

    cmpg-double v7, v5, v7

    if-gez v7, :cond_13

    .line 762
    cmpl-double v3, v1, v3

    if-lez v3, :cond_12

    const/4 v3, 0x0

    goto :goto_5

    :cond_12
    const/high16 v3, -0x80000000

    :goto_5
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3

    .line 764
    :cond_13
    const-wide v7, 0x47efffffe0000000L    # 3.4028234663852886E38

    cmpl-double v7, v5, v7

    if-lez v7, :cond_15

    .line 765
    cmpl-double v3, v1, v3

    if-lez v3, :cond_14

    .line 766
    const/high16 v3, 0x7f800000    # Float.POSITIVE_INFINITY

    goto :goto_6

    .line 767
    :cond_14
    const/high16 v3, -0x800000    # Float.NEGATIVE_INFINITY

    .line 765
    :goto_6
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3

    .line 770
    :cond_15
    double-to-float v3, v1

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3

    .line 757
    .end local v5    # "absNumber":D
    :cond_16
    :goto_7
    double-to-float v3, v1

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3

    .line 745
    .end local v1    # "number":D
    :cond_17
    :goto_8
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_18

    .line 746
    move-object v1, p1

    goto :goto_9

    .line 747
    :cond_18
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 745
    :goto_9
    return-object v1

    .line 733
    :cond_19
    :goto_a
    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_1a

    .line 734
    return-object p1

    .line 736
    :cond_1a
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    const-wide/16 v4, 0x0

    const-wide v6, 0x40efffe000000000L    # 65535.0

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-char v1, v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    return-object v1
.end method

.method public static coerceType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 516
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 525
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 526
    return-object p1

    .line 529
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->getJSTypeCode(Ljava/lang/Object;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_7

    .line 650
    :pswitch_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_1

    .line 651
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 653
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 654
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    .line 655
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 657
    :cond_2
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 659
    :cond_3
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 660
    return-object p1

    .line 662
    :cond_4
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->DateClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_5

    instance-of v0, p1, Lcom/trendmicro/hippo/NativeDate;

    if-eqz v0, :cond_5

    .line 665
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeDate;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeDate;->getJSTimeValue()D

    move-result-wide v0

    .line 667
    .local v0, "time":D
    new-instance v2, Ljava/util/Date;

    double-to-long v3, v0

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    return-object v2

    .line 669
    .end local v0    # "time":D
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_7

    instance-of v0, p1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v0, :cond_7

    .line 672
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeArray;

    .line 673
    .local v0, "array":Lcom/trendmicro/hippo/NativeArray;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v1

    .line 674
    .local v1, "length":J
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    .line 675
    .local v3, "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    long-to-int v4, v1

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    .line 676
    .local v4, "Result":Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    int-to-long v6, v5

    cmp-long v6, v6, v1

    if-gez v6, :cond_6

    .line 678
    nop

    .line 679
    :try_start_0
    invoke-virtual {v0, v5, v0}, Lcom/trendmicro/hippo/NativeArray;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    .line 678
    invoke-static {v3, v6}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_0
    .catch Lcom/trendmicro/hippo/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_0

    .line 683
    goto :goto_1

    .line 681
    :catch_0
    move-exception v6

    .line 682
    .local v6, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 676
    .end local v6    # "ee":Lcom/trendmicro/hippo/EvaluatorException;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 686
    .end local v5    # "i":I
    :cond_6
    return-object v4

    .line 688
    .end local v0    # "array":Lcom/trendmicro/hippo/NativeArray;
    .end local v1    # "length":J
    .end local v3    # "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "Result":Ljava/lang/Object;
    :cond_7
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_9

    .line 689
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 690
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 691
    return-object p1

    .line 692
    :cond_8
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_7

    .line 694
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_b

    instance-of v0, p1, Lcom/trendmicro/hippo/NativeObject;

    if-nez v0, :cond_a

    instance-of v0, p1, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v0, :cond_b

    .line 697
    :cond_a
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/NativeJavaObject;->createInterfaceAdapter(Ljava/lang/Class;Lcom/trendmicro/hippo/ScriptableObject;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 699
    :cond_b
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_7

    .line 631
    :pswitch_1
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_c

    .line 632
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 634
    :cond_c
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 635
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_d

    .line 636
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 638
    :cond_d
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 640
    :cond_e
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_f

    .line 641
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 643
    :cond_f
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 644
    return-object p1

    .line 646
    :cond_10
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 647
    goto/16 :goto_7

    .line 613
    :pswitch_2
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_11

    .line 614
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 617
    :cond_11
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_14

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_12

    goto :goto_2

    .line 621
    :cond_12
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_13

    .line 622
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 625
    :cond_13
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 627
    goto/16 :goto_7

    .line 619
    :cond_14
    :goto_2
    return-object p1

    .line 587
    :pswitch_3
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_1c

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_4

    .line 590
    :cond_15
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_1a

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_16

    goto :goto_3

    .line 602
    :cond_16
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_17

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_18

    :cond_17
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    .line 603
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 605
    :cond_18
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 608
    :cond_19
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 610
    goto/16 :goto_7

    .line 597
    :cond_1a
    :goto_3
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 598
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    return-object v0

    .line 600
    :cond_1b
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 588
    :cond_1c
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 562
    :pswitch_4
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_1d

    .line 563
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 565
    :cond_1d
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_1f

    .line 566
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 567
    .local v0, "context":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_1e

    const/16 v1, 0x12

    .line 568
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 570
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    move-result-wide v1

    .line 571
    .local v1, "roundedValue":J
    long-to-double v3, v1

    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v5

    cmpl-double v3, v3, v5

    if-nez v3, :cond_1e

    .line 572
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v3, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 575
    .end local v1    # "roundedValue":J
    :cond_1e
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 577
    .end local v0    # "context":Lcom/trendmicro/hippo/Context;
    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_20

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_21

    :cond_20
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    .line 578
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 579
    :cond_21
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 582
    :cond_22
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 584
    goto :goto_7

    .line 548
    :pswitch_5
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_25

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_25

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_23

    goto :goto_5

    .line 553
    :cond_23
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_24

    .line 554
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 557
    :cond_24
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 559
    goto :goto_7

    .line 551
    :cond_25
    :goto_5
    return-object p1

    .line 533
    :pswitch_6
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 534
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 536
    :cond_26
    const/4 v0, 0x0

    return-object v0

    .line 539
    :pswitch_7
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    const-string v1, "undefined"

    if-eq p0, v0, :cond_28

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v0, :cond_27

    goto :goto_6

    .line 543
    :cond_27
    invoke-static {v1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 544
    goto :goto_7

    .line 541
    :cond_28
    :goto_6
    return-object v1

    .line 704
    :goto_7
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected static createInterfaceAdapter(Ljava/lang/Class;Lcom/trendmicro/hippo/ScriptableObject;)Ljava/lang/Object;
    .locals 4
    .param p1, "so"    # Lcom/trendmicro/hippo/ScriptableObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/ScriptableObject;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 714
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/NativeJavaObject;->COERCED_INTERFACE_KEY:Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/Kit;->makeHashKeyFromPair(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 715
    .local v0, "key":Ljava/lang/Object;
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 716
    .local v1, "old":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 718
    return-object v1

    .line 720
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 721
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v2, p0, p1}, Lcom/trendmicro/hippo/InterfaceAdapter;->create(Lcom/trendmicro/hippo/Context;Ljava/lang/Class;Lcom/trendmicro/hippo/ScriptableObject;)Ljava/lang/Object;

    move-result-object v3

    .line 723
    .local v3, "glue":Ljava/lang/Object;
    invoke-virtual {p1, v0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 724
    return-object v3
.end method

.method static getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I
    .locals 7
    .param p0, "fromObj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 286
    .local p1, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeJavaObject;->getJSTypeCode(Ljava/lang/Object;)I

    move-result v0

    .line 288
    .local v0, "fromCode":I
    const/16 v1, 0x63

    const/4 v2, 0x3

    const/4 v3, 0x4

    const/4 v4, 0x2

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 391
    :pswitch_0
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-eq p1, v6, :cond_0

    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 393
    return v5

    .line 395
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 396
    instance-of v2, p0, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v2, :cond_19

    .line 400
    return v4

    .line 403
    :cond_1
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v6, :cond_2

    .line 404
    return v2

    .line 406
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_3

    .line 407
    return v3

    .line 409
    :cond_3
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->DateClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_4

    .line 410
    instance-of v2, p0, Lcom/trendmicro/hippo/NativeDate;

    if-eqz v2, :cond_19

    .line 412
    return v5

    .line 415
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 417
    instance-of v1, p0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v1, :cond_5

    .line 419
    return v5

    .line 421
    :cond_5
    instance-of v1, p0, Lcom/trendmicro/hippo/NativeObject;

    if-eqz v1, :cond_6

    .line 422
    return v4

    .line 424
    :cond_6
    const/16 v1, 0xc

    return v1

    .line 426
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_19

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v2, :cond_19

    .line 427
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v1

    add-int/2addr v1, v3

    return v1

    .line 373
    :pswitch_1
    move-object v2, p0

    .line 374
    .local v2, "javaObj":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v3, :cond_8

    .line 375
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 377
    :cond_8
    invoke-virtual {p1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 378
    const/4 v1, 0x0

    return v1

    .line 380
    :cond_9
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_a

    .line 381
    return v4

    .line 383
    :cond_a
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_19

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v3, :cond_19

    .line 384
    const/4 v3, 0x7

    if-ne v0, v3, :cond_b

    .line 385
    goto :goto_0

    :cond_b
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v1

    add-int/2addr v1, v4

    .line 384
    :goto_0
    return v1

    .line 360
    .end local v2    # "javaObj":Ljava/lang/Object;
    :pswitch_2
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_c

    .line 361
    return v5

    .line 363
    :cond_c
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_d

    .line 364
    return v2

    .line 366
    :cond_d
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_19

    .line 367
    return v3

    .line 344
    :pswitch_3
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v6, :cond_e

    .line 345
    return v5

    .line 347
    :cond_e
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 348
    return v4

    .line 350
    :cond_f
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_19

    .line 351
    sget-object v4, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v4, :cond_10

    .line 352
    return v2

    .line 353
    :cond_10
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v2, :cond_19

    .line 354
    return v3

    .line 320
    :pswitch_4
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 321
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_11

    .line 322
    return v5

    .line 324
    :cond_11
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v2, :cond_19

    .line 325
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v1

    add-int/2addr v1, v5

    return v1

    .line 329
    :cond_12
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_13

    .line 331
    const/16 v1, 0x9

    return v1

    .line 333
    :cond_13
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_14

    .line 334
    const/16 v1, 0xa

    return v1

    .line 336
    :cond_14
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 338
    return v4

    .line 305
    :pswitch_5
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v6, :cond_15

    .line 306
    return v5

    .line 308
    :cond_15
    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v5, :cond_16

    .line 309
    return v4

    .line 311
    :cond_16
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_17

    .line 312
    return v2

    .line 314
    :cond_17
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_19

    .line 315
    return v3

    .line 298
    :pswitch_6
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_19

    .line 299
    return v5

    .line 291
    :pswitch_7
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p1, v2, :cond_18

    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_19

    .line 293
    :cond_18
    return v5

    .line 432
    :cond_19
    :goto_1
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getJSTypeCode(Ljava/lang/Object;)I
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 466
    if-nez p0, :cond_0

    .line 467
    const/4 v0, 0x1

    return v0

    .line 469
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v0, :cond_1

    .line 470
    const/4 v0, 0x0

    return v0

    .line 472
    :cond_1
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    .line 473
    const/4 v0, 0x4

    return v0

    .line 475
    :cond_2
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 476
    const/4 v0, 0x3

    return v0

    .line 478
    :cond_3
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    .line 479
    const/4 v0, 0x2

    return v0

    .line 481
    :cond_4
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v1, 0x7

    const/4 v2, 0x6

    const/4 v3, 0x5

    if-eqz v0, :cond_8

    .line 482
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;

    if-eqz v0, :cond_5

    .line 483
    return v3

    .line 485
    :cond_5
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;

    if-eqz v0, :cond_6

    .line 486
    return v1

    .line 488
    :cond_6
    instance-of v0, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_7

    .line 489
    return v2

    .line 492
    :cond_7
    const/16 v0, 0x8

    return v0

    .line 495
    :cond_8
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_9

    .line 496
    return v3

    .line 499
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 500
    .local v0, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 501
    return v1

    .line 503
    :cond_a
    return v2
.end method

.method static getSizeRank(Ljava/lang/Class;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 436
    .local p0, "aType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_0

    .line 437
    const/4 v0, 0x1

    return v0

    .line 439
    :cond_0
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1

    .line 440
    const/4 v0, 0x2

    return v0

    .line 442
    :cond_1
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    .line 443
    const/4 v0, 0x3

    return v0

    .line 445
    :cond_2
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_3

    .line 446
    const/4 v0, 0x4

    return v0

    .line 448
    :cond_3
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_4

    .line 449
    const/4 v0, 0x5

    return v0

    .line 451
    :cond_4
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_5

    .line 452
    const/4 v0, 0x6

    return v0

    .line 454
    :cond_5
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_6

    .line 455
    const/4 v0, 0x7

    return v0

    .line 457
    :cond_6
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_7

    .line 458
    const/16 v0, 0x63

    return v0

    .line 461
    :cond_7
    const/16 v0, 0x8

    return v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 935
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 937
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->isAdapter:Z

    .line 938
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 939
    sget-object v0, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 941
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    .line 943
    .local v2, "args":[Ljava/lang/Object;
    :try_start_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 946
    nop

    .line 947
    .end local v2    # "args":[Ljava/lang/Object;
    goto :goto_0

    .line 944
    .restart local v2    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 945
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 940
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "args":[Ljava/lang/Object;
    :cond_0
    new-instance v0, Ljava/lang/ClassNotFoundException;

    invoke-direct {v0}, Ljava/lang/ClassNotFoundException;-><init>()V

    throw v0

    .line 948
    :cond_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    .line 951
    :goto_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 952
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 953
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    goto :goto_1

    .line 955
    :cond_2
    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    .line 958
    :goto_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaObject;->initMembers()V

    .line 959
    return-void
.end method

.method static reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 899
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    nop

    .line 901
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 902
    invoke-static {p1}, Lcom/trendmicro/hippo/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .line 899
    const-string v2, "msg.conversion.not.allowed"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method private static toDouble(Ljava/lang/Object;)D
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 830
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 831
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0

    .line 833
    :cond_0
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 834
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    .line 836
    :cond_1
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_3

    .line 837
    instance-of v0, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_2

    .line 839
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v0

    return-wide v0

    .line 841
    :cond_2
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    return-wide v0

    .line 846
    :cond_3
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "doubleValue"

    move-object v3, v0

    check-cast v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .local v1, "meth":Ljava/lang/reflect/Method;
    goto :goto_0

    .line 851
    .end local v1    # "meth":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .line 852
    .local v1, "e":Ljava/lang/SecurityException;
    const/4 v2, 0x0

    move-object v1, v2

    .local v2, "meth":Ljava/lang/reflect/Method;
    goto :goto_1

    .line 848
    .end local v1    # "e":Ljava/lang/SecurityException;
    .end local v2    # "meth":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v1

    .line 849
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    .line 853
    .local v1, "meth":Ljava/lang/reflect/Method;
    :goto_0
    nop

    .line 854
    :goto_1
    if-eqz v1, :cond_4

    .line 856
    :try_start_1
    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2

    return-wide v2

    .line 862
    :catch_2
    move-exception v0

    .line 864
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v2}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_2

    .line 858
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_3
    move-exception v0

    .line 860
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v2}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 867
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v2

    return-wide v2
.end method

.method private static toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p2, "min"    # D
    .param p4, "max"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;DD)J"
        }
    .end annotation

    .line 874
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v0

    .line 876
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 878
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 881
    :cond_1
    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-lez v2, :cond_2

    .line 882
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    goto :goto_0

    .line 885
    :cond_2
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    .line 888
    :goto_0
    cmpg-double v2, v0, p2

    if-ltz v2, :cond_3

    cmpl-double v2, v0, p4

    if-lez v2, :cond_4

    .line 890
    :cond_3
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 892
    :cond_4
    double-to-long v2, v0

    return-wide v2
.end method

.method public static wrap(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 198
    .local p2, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 199
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v1

    invoke-virtual {v1, v0, p0, p1, p2}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 5
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 908
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 910
    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->isAdapter:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 911
    iget-boolean v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->isAdapter:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 912
    sget-object v0, Lcom/trendmicro/hippo/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 915
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    .line 917
    .local v2, "args":[Ljava/lang/Object;
    :try_start_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 920
    nop

    .line 921
    .end local v2    # "args":[Ljava/lang/Object;
    goto :goto_0

    .line 918
    .restart local v2    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 919
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 913
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "args":[Ljava/lang/Object;
    :cond_0
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 922
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 925
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    if-eqz v0, :cond_2

    .line 926
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_1

    .line 928
    :cond_2
    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 930
    :goto_1
    return-void
.end method


# virtual methods
.method public delete(I)V
    .locals 0
    .param p1, "index"    # I

    .line 150
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 0
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 146
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 142
    return-void
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 102
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 97
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->fieldAndMethods:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 84
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 85
    .local v0, "result":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 86
    return-object v0

    .line 91
    .end local v0    # "result":Ljava/lang/Object;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, p1, v1, v2}, Lcom/trendmicro/hippo/JavaMembers;->get(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 209
    const-string v0, "JavaObject"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 216
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    .line 217
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 218
    sget-object p1, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    .line 221
    :cond_0
    if-eqz p1, :cond_7

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    goto :goto_2

    .line 225
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 226
    const-string v0, "booleanValue"

    .local v0, "converterName":Ljava/lang/String;
    goto :goto_0

    .line 227
    .end local v0    # "converterName":Ljava/lang/String;
    :cond_2
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_6

    .line 228
    const-string v0, "doubleValue"

    .line 232
    .restart local v0    # "converterName":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v0, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 233
    .local v1, "converterObject":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Function;

    if-eqz v2, :cond_3

    .line 234
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Function;

    .line 235
    .local v2, "f":Lcom/trendmicro/hippo/Function;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v3

    invoke-interface {v2}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v2, v3, v4, p0, v5}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 237
    .local v2, "value":Ljava/lang/Object;
    goto :goto_3

    .line 238
    .end local v2    # "value":Ljava/lang/Object;
    :cond_3
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v2, :cond_5

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_5

    .line 241
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 242
    .local v2, "b":Z
    if-eqz v2, :cond_4

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    goto :goto_1

    :cond_4
    const-wide/16 v3, 0x0

    :goto_1
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 243
    .local v2, "value":Ljava/lang/Object;
    goto :goto_3

    .line 244
    .end local v2    # "value":Ljava/lang/Object;
    :cond_5
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "value":Ljava/lang/Object;
    goto :goto_3

    .line 230
    .end local v0    # "converterName":Ljava/lang/String;
    .end local v1    # "converterObject":Ljava/lang/Object;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_6
    const-string v0, "msg.default.value"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 222
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 248
    .restart local v2    # "value":Ljava/lang/Object;
    :goto_3
    return-object v2
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/JavaMembers;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParentScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->parent:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 2

    .line 154
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->parent:Lcom/trendmicro/hippo/Scriptable;

    .line 156
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->String:Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 155
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "value"    # Lcom/trendmicro/hippo/Scriptable;

    .line 137
    const/4 v0, 0x0

    return v0
.end method

.method protected initMembers()V
    .locals 4

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .local v0, "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_0

    .line 58
    .end local v0    # "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    .line 60
    .restart local v0    # "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->parent:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaObject;->staticType:Ljava/lang/Class;

    iget-boolean v3, p0, Lcom/trendmicro/hippo/NativeJavaObject;->isAdapter:Z

    invoke-static {v1, v0, v2, v3}, Lcom/trendmicro/hippo/JavaMembers;->lookupClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lcom/trendmicro/hippo/JavaMembers;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    .line 62
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v3, 0x0

    .line 63
    invoke-virtual {v1, p0, v2, v3}, Lcom/trendmicro/hippo/JavaMembers;->getFieldAndMethodsObjects(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->fieldAndMethods:Ljava/util/Map;

    .line 64
    return-void
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 131
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 7
    .param p1, "symbol"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 121
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 122
    .local v6, "name":Ljava/lang/String;
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, v6, v1}, Lcom/trendmicro/hippo/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_2

    .line 125
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1, v0, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_1

    .line 123
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, v6

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/JavaMembers;->put(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 127
    :cond_2
    :goto_1
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, v0, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_1

    .line 111
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v4, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v5, p3

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/JavaMembers;->put(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 114
    :goto_1
    return-void
.end method

.method public setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "m"    # Lcom/trendmicro/hippo/Scriptable;

    .line 183
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->parent:Lcom/trendmicro/hippo/Scriptable;

    .line 184
    return-void
.end method

.method public setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "m"    # Lcom/trendmicro/hippo/Scriptable;

    .line 167
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaObject;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 168
    return-void
.end method

.method public unwrap()Ljava/lang/Object;
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaObject;->javaObject:Ljava/lang/Object;

    return-object v0
.end method
