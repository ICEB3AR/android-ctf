.class public Lcom/trendmicro/hippo/ScriptRuntime;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;,
        Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;,
        Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;,
        Lcom/trendmicro/hippo/ScriptRuntime$DefaultMessageProvider;
    }
.end annotation


# static fields
.field public static final BooleanClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ByteClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final CharacterClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ClassClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ContextClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ContextFactoryClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final DEFAULT_NS_TAG:Ljava/lang/String; = "__default_namespace__"

.field public static final DateClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final DoubleClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ENUMERATE_ARRAY:I = 0x2

.field public static final ENUMERATE_ARRAY_NO_ITERATOR:I = 0x5

.field public static final ENUMERATE_KEYS:I = 0x0

.field public static final ENUMERATE_KEYS_NO_ITERATOR:I = 0x3

.field public static final ENUMERATE_VALUES:I = 0x1

.field public static final ENUMERATE_VALUES_IN_ORDER:I = 0x6

.field public static final ENUMERATE_VALUES_NO_ITERATOR:I = 0x4

.field public static final FloatClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final FunctionClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final IntegerClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final LIBRARY_SCOPE_KEY:Ljava/lang/Object;

.field public static final LongClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final NaN:D

.field public static final NaNobj:Ljava/lang/Double;

.field public static final NumberClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ObjectClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static ROOT_LOCALE:Ljava/util/Locale;

.field public static final ScriptableClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">;"
        }
    .end annotation
.end field

.field public static final ScriptableObjectClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final ShortClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final StringClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final emptyArgs:[Ljava/lang/Object;

.field public static final emptyStrings:[Ljava/lang/String;

.field public static messageProvider:Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;

.field public static final negativeZero:D


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 113
    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    .line 114
    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    .line 115
    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    .line 116
    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    .line 117
    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    .line 118
    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    .line 119
    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    .line 120
    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->LongClass:Ljava/lang/Class;

    .line 121
    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    .line 122
    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 123
    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    .line 124
    const-string v0, "java.lang.String"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    .line 125
    const-string v0, "java.util.Date"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->DateClass:Ljava/lang/Class;

    .line 128
    nop

    .line 129
    const-string v0, "com.trendmicro.hippo.Context"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    .line 130
    nop

    .line 131
    const-string v0, "com.trendmicro.hippo.ContextFactory"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    .line 132
    nop

    .line 133
    const-string v0, "com.trendmicro.hippo.Function"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    .line 134
    nop

    .line 135
    const-string v0, "com.trendmicro.hippo.ScriptableObject"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    .line 136
    const-class v0, Lcom/trendmicro/hippo/Scriptable;

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    .line 140
    new-instance v0, Ljava/util/Locale;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ROOT_LOCALE:Ljava/util/Locale;

    .line 142
    const-string v0, "LIBRARY_SCOPE"

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    .line 463
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    sput-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    .line 467
    const-wide/high16 v0, -0x8000000000000000L

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    sput-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    .line 469
    new-instance v0, Ljava/lang/Double;

    sget-wide v1, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    .line 4189
    new-instance v0, Lcom/trendmicro/hippo/ScriptRuntime$DefaultMessageProvider;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime$DefaultMessageProvider;-><init>(Lcom/trendmicro/hippo/ScriptRuntime$1;)V

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->messageProvider:Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;

    .line 4584
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Object;

    sput-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 4585
    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyStrings:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static add(Ljava/lang/CharSequence;Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "val1"    # Ljava/lang/CharSequence;
    .param p1, "val2"    # Ljava/lang/Object;

    .line 2951
    new-instance v0, Lcom/trendmicro/hippo/ConsString;

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static add(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/CharSequence;

    .line 2955
    new-instance v0, Lcom/trendmicro/hippo/ConsString;

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public static add(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 4
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 2918
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 2919
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    move-object v2, p1

    check-cast v2, Ljava/lang/Number;

    .line 2920
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    add-double/2addr v0, v2

    .line 2919
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 2922
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_1

    .line 2923
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->addValues(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2924
    .local v0, "test":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 2925
    return-object v0

    .line 2928
    .end local v0    # "test":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_2

    .line 2929
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p0}, Lcom/trendmicro/hippo/xml/XMLObject;->addValues(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2930
    .restart local v0    # "test":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_2

    .line 2931
    return-object v0

    .line 2934
    .end local v0    # "test":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_7

    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_7

    .line 2937
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 2938
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 2939
    :cond_3
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_4

    .line 2940
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 2941
    :cond_4
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-nez v0, :cond_6

    instance-of v0, p1, Ljava/lang/CharSequence;

    if-nez v0, :cond_6

    .line 2942
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_5

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_5

    .line 2943
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    move-object v2, p1

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 2945
    :cond_5
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 2947
    :cond_6
    new-instance v0, Lcom/trendmicro/hippo/ConsString;

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-object v0

    .line 2935
    :cond_7
    const-string v0, "msg.not.a.number"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static addInstructionCount(Lcom/trendmicro/hippo/Context;I)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "instructionsToAdd"    # I

    .line 3609
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    .line 3610
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    iget v1, p0, Lcom/trendmicro/hippo/Context;->instructionThreshold:I

    if-le v0, v1, :cond_0

    .line 3612
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->observeInstructionCount(I)V

    .line 3613
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Context;->instructionCount:I

    .line 3615
    :cond_0
    return-void
.end method

.method public static applyOrCall(ZLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "isApply"    # Z
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 2727
    array-length v0, p4

    .line 2728
    .local v0, "L":I
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getCallable(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    .line 2730
    .local v1, "function":Lcom/trendmicro/hippo/Callable;
    const/4 v2, 0x0

    .line 2731
    .local v2, "callThis":Lcom/trendmicro/hippo/Scriptable;
    const/16 v3, 0xf

    const/4 v4, 0x0

    if-eqz v0, :cond_2

    .line 2732
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2733
    aget-object v5, p4, v4

    invoke-static {p1, v5, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    goto :goto_1

    .line 2735
    :cond_0
    aget-object v5, p4, v4

    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v6, :cond_1

    sget-object v5, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    :cond_1
    aget-object v5, p4, v4

    invoke-static {p1, v5, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    :goto_0
    move-object v2, v5

    .line 2738
    :cond_2
    :goto_1
    if-nez v2, :cond_3

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2739
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 2743
    :cond_3
    const/4 v3, 0x1

    if-eqz p0, :cond_5

    .line 2745
    if-gt v0, v3, :cond_4

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    goto :goto_2

    .line 2746
    :cond_4
    aget-object v3, p4, v3

    invoke-static {p1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->getApplyArguments(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    :goto_2
    nop

    .local v3, "callArgs":[Ljava/lang/Object;
    goto :goto_3

    .line 2749
    .end local v3    # "callArgs":[Ljava/lang/Object;
    :cond_5
    if-gt v0, v3, :cond_6

    .line 2750
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .restart local v3    # "callArgs":[Ljava/lang/Object;
    goto :goto_3

    .line 2752
    .end local v3    # "callArgs":[Ljava/lang/Object;
    :cond_6
    add-int/lit8 v5, v0, -0x1

    new-array v5, v5, [Ljava/lang/Object;

    .line 2753
    .local v5, "callArgs":[Ljava/lang/Object;
    add-int/lit8 v6, v0, -0x1

    invoke-static {p4, v3, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v3, v5

    .line 2757
    .end local v5    # "callArgs":[Ljava/lang/Object;
    .restart local v3    # "callArgs":[Ljava/lang/Object;
    :goto_3
    invoke-interface {v1, p1, p2, v2, v3}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4
.end method

.method public static bind(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "id"    # Ljava/lang/String;

    .line 2050
    const/4 v0, 0x0

    .line 2051
    .local v0, "firstXMLObject":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2052
    .local v1, "parent":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v1, :cond_7

    move-object v2, v0

    .line 2054
    .end local v0    # "firstXMLObject":Lcom/trendmicro/hippo/Scriptable;
    .local v2, "firstXMLObject":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v0, :cond_5

    .line 2055
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2056
    .local v0, "withObj":Lcom/trendmicro/hippo/Scriptable;
    instance-of v3, v0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v3, :cond_2

    .line 2057
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 2058
    .local v3, "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v3, p0, p2}, Lcom/trendmicro/hippo/xml/XMLObject;->has(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2059
    return-object v3

    .line 2061
    :cond_0
    if-nez v2, :cond_1

    .line 2062
    move-object v2, v3

    .line 2064
    .end local v3    # "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_1
    goto :goto_1

    .line 2065
    :cond_2
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2066
    return-object v0

    .line 2069
    :cond_3
    :goto_1
    move-object p1, v1

    .line 2070
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2071
    if-nez v1, :cond_4

    .line 2072
    move-object v0, v2

    goto :goto_2

    .line 2074
    .end local v0    # "withObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_4
    goto :goto_0

    .line 2076
    :cond_5
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2077
    return-object p1

    .line 2079
    :cond_6
    move-object p1, v1

    .line 2080
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2081
    if-nez v1, :cond_5

    .line 2082
    move-object v0, v2

    .line 2087
    .end local v2    # "firstXMLObject":Lcom/trendmicro/hippo/Scriptable;
    .local v0, "firstXMLObject":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    :goto_2
    iget-boolean v2, p0, Lcom/trendmicro/hippo/Context;->useDynamicScope:Z

    if-eqz v2, :cond_8

    .line 2088
    iget-object v2, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDynamicScope(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 2090
    :cond_8
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2091
    return-object p1

    .line 2095
    :cond_9
    return-object v0
.end method

.method public static call(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "fun"    # Ljava/lang/Object;
    .param p2, "thisArg"    # Ljava/lang/Object;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1169
    instance-of v0, p1, Lcom/trendmicro/hippo/Function;

    if-eqz v0, :cond_1

    .line 1172
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Function;

    .line 1173
    .local v0, "function":Lcom/trendmicro/hippo/Function;
    invoke-static {p0, p2, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 1174
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v1, :cond_0

    .line 1177
    invoke-interface {v0, p0, p4, v1, p3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1175
    :cond_0
    const-string v2, "function"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1170
    .end local v0    # "function":Lcom/trendmicro/hippo/Function;
    .end local v1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static callIterator(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2629
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    .line 2630
    invoke-static {p0, v0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    .line 2631
    .local v0, "getIterator":Lcom/trendmicro/hippo/Callable;
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2632
    .local v1, "iterable":Lcom/trendmicro/hippo/Scriptable;
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, p1, p2, v1, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static callRef(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Ref;
    .locals 5
    .param p0, "function"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 2647
    instance-of v0, p0, Lcom/trendmicro/hippo/RefCallable;

    if-eqz v0, :cond_1

    .line 2648
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/RefCallable;

    .line 2649
    .local v0, "rfunction":Lcom/trendmicro/hippo/RefCallable;
    invoke-interface {v0, p3, p1, p2}, Lcom/trendmicro/hippo/RefCallable;->refCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    .line 2650
    .local v1, "ref":Lcom/trendmicro/hippo/Ref;
    if-eqz v1, :cond_0

    .line 2653
    return-object v1

    .line 2651
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".refCall() returned null"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2656
    .end local v0    # "rfunction":Lcom/trendmicro/hippo/RefCallable;
    .end local v1    # "ref":Lcom/trendmicro/hippo/Ref;
    :cond_1
    nop

    .line 2657
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2656
    const-string v1, "msg.no.ref.from.function"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2658
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "ReferenceError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static callSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "fun"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "callerThis"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "callType"    # I
    .param p7, "filename"    # Ljava/lang/String;
    .param p8, "lineNumber"    # I

    .line 2682
    const/4 v0, 0x1

    if-ne p6, v0, :cond_0

    .line 2683
    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/trendmicro/hippo/NativeGlobal;->isEvalFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2684
    move-object v0, p0

    move-object v1, p4

    move-object v2, p5

    move-object v3, p3

    move-object v4, p7

    move v5, p8

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptRuntime;->evalSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2687
    :cond_0
    const/4 v0, 0x2

    if-ne p6, v0, :cond_3

    .line 2688
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeWith;->isWithFunction(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2696
    :cond_1
    invoke-interface {p1, p0, p4, p2, p3}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2689
    :cond_2
    const-string v0, "msg.only.from.new"

    const-string v1, "With"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 2693
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method static checkDeprecated(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "name"    # Ljava/lang/String;

    .line 4129
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    .line 4130
    .local v0, "version":I
    const/16 v1, 0x8c

    if-ge v0, v1, :cond_0

    if-nez v0, :cond_1

    .line 4131
    :cond_0
    const-string v1, "msg.deprec.ctor"

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 4132
    .local v1, "msg":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 4133
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 4137
    .end local v1    # "msg":Ljava/lang/String;
    :cond_1
    return-void

    .line 4135
    .restart local v1    # "msg":Ljava/lang/String;
    :cond_2
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method static checkDynamicScope(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "possibleDynamicScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "staticTopScope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3592
    if-ne p0, p1, :cond_0

    .line 3593
    return-object p0

    .line 3595
    :cond_0
    move-object v0, p0

    .line 3597
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 3598
    if-ne v0, p1, :cond_1

    .line 3599
    return-object p0

    .line 3601
    :cond_1
    if-nez v0, :cond_2

    .line 3602
    return-object p1

    .line 3601
    :cond_2
    goto :goto_0
.end method

.method public static checkRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4394
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v0

    .line 4395
    .local v0, "result":Lcom/trendmicro/hippo/RegExpProxy;
    if-eqz v0, :cond_0

    .line 4398
    return-object v0

    .line 4396
    :cond_0
    const-string v1, "msg.no.regexp"

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method public static cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;

    .line 3482
    instance-of v0, p0, Ljava/lang/Number;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 3483
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 3484
    .local v3, "d1":D
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    .local v5, "d2":D
    goto :goto_1

    .line 3486
    .end local v3    # "d1":D
    .end local v5    # "d2":D
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_6

    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_6

    .line 3489
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    .line 3490
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {v0, v3}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 3491
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_2

    .line 3492
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {v0, v3}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 3493
    :cond_2
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 3494
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-gtz v0, :cond_3

    goto :goto_0

    :cond_3
    move v1, v2

    :goto_0
    return v1

    .line 3496
    :cond_4
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    .line 3497
    .restart local v3    # "d1":D
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 3499
    .restart local v5    # "d2":D
    :goto_1
    cmpg-double v0, v3, v5

    if-gtz v0, :cond_5

    goto :goto_2

    :cond_5
    move v1, v2

    :goto_2
    return v1

    .line 3487
    .end local v3    # "d1":D
    .end local v5    # "d2":D
    :cond_6
    const-string v0, "msg.compare.symbol"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 7
    .param p0, "val1"    # Ljava/lang/Object;
    .param p1, "val2"    # Ljava/lang/Object;

    .line 3459
    instance-of v0, p0, Ljava/lang/Number;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 3460
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 3461
    .local v3, "d1":D
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    .local v5, "d2":D
    goto :goto_1

    .line 3463
    .end local v3    # "d1":D
    .end local v5    # "d2":D
    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_6

    instance-of v0, p1, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_6

    .line 3466
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    .line 3467
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {v0, v3}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 3468
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_2

    .line 3469
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {v0, v3}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    .line 3470
    :cond_2
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 3471
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_3

    goto :goto_0

    :cond_3
    move v1, v2

    :goto_0
    return v1

    .line 3473
    :cond_4
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    .line 3474
    .restart local v3    # "d1":D
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 3476
    .restart local v5    # "d2":D
    :goto_1
    cmpg-double v0, v3, v5

    if-gez v0, :cond_5

    goto :goto_2

    :cond_5
    move v1, v2

    :goto_2
    return v1

    .line 3464
    .end local v3    # "d1":D
    .end local v5    # "d2":D
    :cond_6
    const-string v0, "msg.compare.symbol"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 8
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 4232
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 4233
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v7

    .line 4234
    .local v7, "filename":Ljava/lang/String;
    const/4 v1, 0x0

    aget v4, v0, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, v7

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;
    .locals 8
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "lineNumberDelta"    # I

    .line 4241
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 4242
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v7

    .line 4243
    .local v7, "filename":Ljava/lang/String;
    const/4 v1, 0x0

    aget v2, v0, v1

    if-eqz v2, :cond_0

    .line 4244
    aget v2, v0, v1

    add-int/2addr v2, p2

    aput v2, v0, v1

    .line 4246
    :cond_0
    aget v4, v0, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, v7

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;
    .locals 8
    .param p0, "error"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "columnNumber"    # I

    .line 4256
    new-instance v7, Lcom/trendmicro/hippo/EcmaError;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/EcmaError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    return-object v7
.end method

.method public static createArrowFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;
    .locals 7
    .param p0, "funObj"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "isStrict"    # Z

    .line 3681
    new-instance v6, Lcom/trendmicro/hippo/NativeCall;

    const/4 v4, 0x1

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeCall;-><init>(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;ZZ)V

    return-object v6
.end method

.method public static createFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "funObj"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3665
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->createFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static createFunctionActivation(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Lcom/trendmicro/hippo/Scriptable;
    .locals 7
    .param p0, "funObj"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "isStrict"    # Z

    .line 3673
    new-instance v6, Lcom/trendmicro/hippo/NativeCall;

    const/4 v4, 0x0

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeCall;-><init>(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;ZZ)V

    return-object v6
.end method

.method private static currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4409
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_2

    .line 4412
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->cachedXMLLib:Lcom/trendmicro/hippo/xml/XMLLib;

    .line 4413
    .local v0, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    if-nez v0, :cond_1

    .line 4414
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1}, Lcom/trendmicro/hippo/xml/XMLLib;->extractFromScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v0

    .line 4415
    if-eqz v0, :cond_0

    .line 4417
    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->cachedXMLLib:Lcom/trendmicro/hippo/xml/XMLLib;

    goto :goto_0

    .line 4416
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 4420
    :cond_1
    :goto_0
    return-object v0

    .line 4410
    .end local v0    # "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method static defaultObjectToSource(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 989
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    if-nez v0, :cond_0

    .line 990
    const/4 v0, 0x1

    .line 991
    .local v0, "toplevel":Z
    const/4 v1, 0x0

    .line 992
    .local v1, "iterating":Z
    new-instance v2, Lcom/trendmicro/hippo/ObjToIntMap;

    const/16 v3, 0x1f

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v2, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    goto :goto_0

    .line 994
    .end local v0    # "toplevel":Z
    .end local v1    # "iterating":Z
    :cond_0
    const/4 v0, 0x0

    .line 995
    .restart local v0    # "toplevel":Z
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v1

    .line 998
    .restart local v1    # "iterating":Z
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x80

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 999
    .local v2, "result":Ljava/lang/StringBuilder;
    if-eqz v0, :cond_1

    .line 1000
    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1002
    :cond_1
    const/16 v3, 0x7b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1007
    const/4 v3, 0x0

    if-nez v1, :cond_9

    .line 1008
    :try_start_0
    iget-object v4, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v4, p2}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v4

    .line 1010
    .local v4, "ids":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v6, v4

    if-ge v5, v6, :cond_9

    .line 1011
    aget-object v6, v4, v5

    .line 1013
    .local v6, "id":Ljava/lang/Object;
    instance-of v7, v6, Ljava/lang/Integer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v8, ", "

    if-eqz v7, :cond_4

    .line 1014
    :try_start_1
    move-object v7, v6

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1015
    .local v7, "intId":I
    invoke-interface {p2, v7, p2}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    .line 1016
    .local v9, "value":Ljava/lang/Object;
    sget-object v10, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v9, v10, :cond_2

    .line 1017
    goto :goto_3

    .line 1018
    :cond_2
    if-lez v5, :cond_3

    .line 1019
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1020
    :cond_3
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1021
    nop

    .end local v7    # "intId":I
    goto :goto_2

    .line 1022
    .end local v9    # "value":Ljava/lang/Object;
    :cond_4
    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    .line 1023
    .local v7, "strId":Ljava/lang/String;
    invoke-interface {p2, v7, p2}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    .line 1024
    .restart local v9    # "value":Ljava/lang/Object;
    sget-object v10, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v9, v10, :cond_5

    .line 1025
    goto :goto_3

    .line 1026
    :cond_5
    if-lez v5, :cond_6

    .line 1027
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1028
    :cond_6
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v8

    invoke-static {v7, p0, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->isValidIdentifierName(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Z)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1029
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1031
    :cond_7
    const/16 v8, 0x27

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1032
    nop

    .line 1033
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v10

    .line 1032
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1034
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1037
    .end local v7    # "strId":Ljava/lang/String;
    :goto_2
    const/16 v7, 0x3a

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1038
    invoke-static {p0, p1, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1010
    .end local v6    # "id":Ljava/lang/Object;
    .end local v9    # "value":Ljava/lang/Object;
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1042
    .end local v4    # "ids":[Ljava/lang/Object;
    .end local v5    # "i":I
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_8

    .line 1043
    iput-object v3, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1045
    :cond_8
    throw v4

    .line 1042
    :cond_9
    if-eqz v0, :cond_a

    .line 1043
    iput-object v3, p0, Lcom/trendmicro/hippo/Context;->iterating:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 1047
    :cond_a
    const/16 v3, 0x7d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1048
    if-eqz v0, :cond_b

    .line 1049
    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1051
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method static defaultObjectToString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 894
    if-nez p0, :cond_0

    .line 895
    const-string v0, "[object Null]"

    return-object v0

    .line 896
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 897
    const-string v0, "[object Undefined]"

    return-object v0

    .line 898
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[object "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1879
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "isName"    # Z

    .line 1915
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1916
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_1

    .line 1917
    if-eqz p4, :cond_0

    .line 1918
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v1

    .line 1920
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefDeleteError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1922
    :cond_1
    invoke-static {v0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->deleteObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v1

    .line 1923
    .local v1, "result":Z
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2
.end method

.method public static delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "isName"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1898
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static deleteObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z
    .locals 3
    .param p0, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1791
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1792
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v0

    .line 1793
    .local v0, "so":Lcom/trendmicro/hippo/SymbolScriptable;
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Symbol;

    .line 1794
    .local v1, "s":Lcom/trendmicro/hippo/Symbol;
    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/SymbolScriptable;->delete(Lcom/trendmicro/hippo/Symbol;)V

    .line 1795
    invoke-interface {v0, v1, p0}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    return v2

    .line 1797
    .end local v0    # "so":Lcom/trendmicro/hippo/SymbolScriptable;
    .end local v1    # "s":Lcom/trendmicro/hippo/Symbol;
    :cond_0
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1798
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 1799
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v1

    .line 1800
    .local v1, "index":I
    invoke-interface {p0, v1}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    .line 1801
    invoke-interface {p0, v1, p0}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    return v2

    .line 1803
    .end local v1    # "index":I
    :cond_1
    invoke-interface {p0, v0}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 1804
    invoke-interface {p0, v0, p0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    return v1
.end method

.method private static doScriptableIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 6
    .param p0, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "protoChainStart"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "incrDecrMask"    # I

    .line 3042
    and-int/lit8 v0, p4, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 3044
    .local v0, "post":Z
    :goto_0
    instance-of v1, p3, Ljava/lang/Number;

    if-eqz v1, :cond_1

    .line 3045
    move-object v1, p3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    .local v1, "number":D
    goto :goto_1

    .line 3047
    .end local v1    # "number":D
    :cond_1
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    .line 3048
    .restart local v1    # "number":D
    if-eqz v0, :cond_2

    .line 3050
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object p3

    .line 3053
    :cond_2
    :goto_1
    and-int/lit8 v3, p4, 0x1

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    if-nez v3, :cond_3

    .line 3054
    add-double/2addr v1, v4

    goto :goto_2

    .line 3056
    :cond_3
    sub-double/2addr v1, v4

    .line 3058
    :goto_2
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 3059
    .local v3, "result":Ljava/lang/Number;
    invoke-interface {p0, p1, p2, v3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 3060
    if-eqz v0, :cond_4

    .line 3061
    return-object p3

    .line 3063
    :cond_4
    return-object v3
.end method

.method public static doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p0, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3548
    iget-boolean v5, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 9
    .param p0, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;
    .param p5, "isTopLevelStrict"    # Z

    .line 3555
    if-eqz p2, :cond_3

    .line 3557
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_2

    .line 3560
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    .line 3561
    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    iput-boolean v0, p1, Lcom/trendmicro/hippo/Context;->useDynamicScope:Z

    .line 3562
    iget-boolean v0, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    .line 3563
    .local v0, "previousTopLevelStrict":Z
    iput-boolean p5, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    .line 3564
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v7

    .line 3566
    .local v7, "f":Lcom/trendmicro/hippo/ContextFactory;
    const/4 v8, 0x0

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    :try_start_0
    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/ContextFactory;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3568
    .local v1, "result":Ljava/lang/Object;
    iput-object v8, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    .line 3570
    iput-object v8, p1, Lcom/trendmicro/hippo/Context;->cachedXMLLib:Lcom/trendmicro/hippo/xml/XMLLib;

    .line 3571
    iput-boolean v0, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    .line 3573
    iget-object v2, p1, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    if-nez v2, :cond_0

    .line 3579
    return-object v1

    .line 3576
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 3568
    .end local v1    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    iput-object v8, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    .line 3570
    iput-object v8, p1, Lcom/trendmicro/hippo/Context;->cachedXMLLib:Lcom/trendmicro/hippo/xml/XMLLib;

    .line 3571
    iput-boolean v0, p1, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    .line 3573
    iget-object v2, p1, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    if-eqz v2, :cond_1

    .line 3576
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 3578
    :cond_1
    throw v1

    .line 3557
    .end local v0    # "previousTopLevelStrict":Z
    .end local v7    # "f":Lcom/trendmicro/hippo/ContextFactory;
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 3556
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3073
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "index"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "incrDecrMask"    # I

    .line 3080
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 3081
    .local v0, "value":Ljava/lang/Object;
    and-int/lit8 v1, p4, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 3083
    .local v1, "post":Z
    :goto_0
    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_1

    .line 3084
    move-object v2, v0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .local v2, "number":D
    goto :goto_1

    .line 3086
    .end local v2    # "number":D
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 3087
    .restart local v2    # "number":D
    if-eqz v1, :cond_2

    .line 3089
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 3092
    :cond_2
    :goto_1
    and-int/lit8 v4, p4, 0x1

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-nez v4, :cond_3

    .line 3093
    add-double/2addr v2, v5

    goto :goto_2

    .line 3095
    :cond_3
    sub-double/2addr v2, v5

    .line 3097
    :goto_2
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .line 3098
    .local v4, "result":Ljava/lang/Number;
    invoke-static {p0, p1, v4, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 3099
    if-eqz v1, :cond_4

    .line 3100
    return-object v0

    .line 3102
    :cond_4
    return-object v4
.end method

.method public static enterActivationFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3687
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 3689
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeCall;

    .line 3690
    .local v0, "call":Lcom/trendmicro/hippo/NativeCall;
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    iput-object v1, v0, Lcom/trendmicro/hippo/NativeCall;->parentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3691
    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3692
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeCall;->defineAttributesForArguments()V

    .line 3693
    return-void

    .line 3688
    .end local v0    # "call":Lcom/trendmicro/hippo/NativeCall;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public static enterDotQuery(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3928
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 3931
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 3932
    .local v0, "object":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->enterDotQuery(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;

    move-result-object v1

    return-object v1

    .line 3929
    .end local v0    # "object":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static enterWith(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3909
    invoke-static {p1, p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 3910
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 3913
    instance-of v1, v0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v1, :cond_0

    .line 3914
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 3915
    .local v1, "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/xml/XMLObject;->enterWith(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeWith;

    move-result-object v2

    return-object v2

    .line 3917
    .end local v1    # "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/NativeWith;

    invoke-direct {v1, p2, v0}, Lcom/trendmicro/hippo/NativeWith;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    return-object v1

    .line 3911
    :cond_1
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.undef.with"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private static enumChangeObject(Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)V
    .locals 6
    .param p0, "x"    # Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2419
    const/4 v0, 0x0

    .line 2420
    .local v0, "ids":[Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_1

    .line 2421
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    .line 2422
    array-length v1, v0

    if-eqz v1, :cond_0

    .line 2423
    goto :goto_1

    .line 2425
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    .line 2427
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    if-eqz v1, :cond_3

    .line 2428
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    .line 2429
    .local v1, "previous":[Ljava/lang/Object;
    array-length v2, v1

    .line 2430
    .local v2, "L":I
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->used:Lcom/trendmicro/hippo/ObjToIntMap;

    if-nez v3, :cond_2

    .line 2431
    new-instance v3, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v3, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->used:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 2433
    :cond_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    if-eq v3, v2, :cond_3

    .line 2434
    iget-object v4, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->used:Lcom/trendmicro/hippo/ObjToIntMap;

    aget-object v5, v1, v3

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2433
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2437
    .end local v1    # "previous":[Ljava/lang/Object;
    .end local v2    # "L":I
    .end local v3    # "i":I
    :cond_3
    iput-object v0, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    .line 2438
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->index:I

    .line 2439
    return-void
.end method

.method public static enumId(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 5
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 2376
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2377
    .local v0, "x":Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 2378
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    return-object v1

    .line 2380
    :cond_0
    iget v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumType:I

    if-eqz v1, :cond_4

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3

    const/4 v3, 0x2

    if-eq v1, v3, :cond_2

    const/4 v4, 0x3

    if-eq v1, v4, :cond_4

    const/4 v4, 0x4

    if-eq v1, v4, :cond_3

    const/4 v4, 0x5

    if-ne v1, v4, :cond_1

    goto :goto_0

    .line 2392
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2389
    :cond_2
    :goto_0
    new-array v1, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    aput-object v4, v1, v3

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->enumValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    .line 2390
    .local v1, "elements":[Ljava/lang/Object;
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2

    .line 2386
    .end local v1    # "elements":[Ljava/lang/Object;
    :cond_3
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->enumValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 2383
    :cond_4
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    return-object v1
.end method

.method public static enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "enumType"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2236
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "enumType"    # I

    .line 2242
    new-instance v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;-><init>(Lcom/trendmicro/hippo/ScriptRuntime$1;)V

    .line 2243
    .local v0, "x":Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;
    invoke-static {p1, p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    iput-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 2245
    const/4 v2, 0x6

    if-ne p3, v2, :cond_0

    .line 2246
    iput p3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumType:I

    .line 2247
    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    .line 2248
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumInitInOrder(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 2250
    :cond_0
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    if-nez v2, :cond_1

    .line 2253
    return-object v0

    .line 2255
    :cond_1
    iput p3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumType:I

    .line 2256
    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    .line 2257
    const/4 v1, 0x3

    if-eq p3, v1, :cond_3

    const/4 v1, 0x4

    if-eq p3, v1, :cond_3

    const/4 v1, 0x5

    if-eq p3, v1, :cond_3

    .line 2261
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    if-nez p3, :cond_2

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_0
    invoke-static {p1, v1, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toIterator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    .line 2264
    :cond_3
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    if-nez v1, :cond_4

    .line 2267
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumChangeObject(Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)V

    .line 2270
    :cond_4
    return-object v0
.end method

.method public static enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "enumValues"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2218
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 2219
    :cond_0
    const/4 v0, 0x0

    .line 2218
    :goto_0
    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumInit(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static enumInitInOrder(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)Ljava/lang/Object;
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "x"    # Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2274
    iget-object v0, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    instance-of v0, v0, Lcom/trendmicro/hippo/ScriptableObject;

    const-string v1, "msg.not.iterable"

    if-eqz v0, :cond_3

    .line 2278
    iget-object v0, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 2279
    .local v0, "xo":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v2, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {v0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2282
    sget-object v2, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {v0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v2

    .line 2283
    .local v2, "iterator":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/Callable;

    if-eqz v3, :cond_1

    .line 2286
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/Callable;

    .line 2287
    .local v3, "f":Lcom/trendmicro/hippo/Callable;
    iget-object v4, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v4}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 2288
    .local v4, "scope":Lcom/trendmicro/hippo/Scriptable;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    .line 2289
    .local v5, "args":[Ljava/lang/Object;
    iget-object v6, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, p0, v4, v6, v5}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 2290
    .local v6, "v":Ljava/lang/Object;
    instance-of v7, v6, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v7, :cond_0

    .line 2293
    move-object v1, v6

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    iput-object v1, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    .line 2294
    return-object p1

    .line 2291
    :cond_0
    iget-object v7, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2284
    .end local v3    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v4    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v5    # "args":[Ljava/lang/Object;
    .end local v6    # "v":Ljava/lang/Object;
    :cond_1
    iget-object v3, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2280
    .end local v2    # "iterator":Ljava/lang/Object;
    :cond_2
    iget-object v2, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2275
    .end local v0    # "xo":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_3
    iget-object v0, p1, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 7
    .param p0, "enumObj"    # Ljava/lang/Object;

    .line 2303
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2304
    .local v0, "x":Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_3

    .line 2305
    iget v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumType:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    .line 2306
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumNextInOrder(Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 2308
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    const-string v2, "next"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2309
    .local v1, "v":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Callable;

    if-nez v2, :cond_1

    .line 2310
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v2

    .line 2311
    :cond_1
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Callable;

    .line 2312
    .local v2, "f":Lcom/trendmicro/hippo/Callable;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v3

    .line 2314
    .local v3, "cx":Lcom/trendmicro/hippo/Context;
    :try_start_0
    iget-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v4}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    iget-object v5, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2316
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_0
    .catch Lcom/trendmicro/hippo/JavaScriptException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 2317
    :catch_0
    move-exception v4

    .line 2318
    .local v4, "e":Lcom/trendmicro/hippo/JavaScriptException;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/JavaScriptException;->getValue()Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Lcom/trendmicro/hippo/NativeIterator$StopIteration;

    if-eqz v5, :cond_2

    .line 2319
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v5

    .line 2321
    :cond_2
    throw v4

    .line 2325
    .end local v1    # "v":Ljava/lang/Object;
    .end local v2    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v3    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v4    # "e":Lcom/trendmicro/hippo/JavaScriptException;
    :cond_3
    :goto_0
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    if-nez v1, :cond_4

    .line 2326
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 2328
    :cond_4
    iget v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->index:I

    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    array-length v2, v2

    if-ne v1, v2, :cond_5

    .line 2329
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 2330
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->enumChangeObject(Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)V

    .line 2331
    goto :goto_0

    .line 2333
    :cond_5
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->ids:[Ljava/lang/Object;

    iget v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->index:I

    aget-object v1, v1, v2

    .line 2334
    .local v1, "id":Ljava/lang/Object;
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->used:Lcom/trendmicro/hippo/ObjToIntMap;

    if-eqz v2, :cond_6

    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->used:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2335
    goto :goto_0

    .line 2337
    :cond_6
    instance-of v2, v1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v2, :cond_7

    .line 2338
    goto :goto_0

    .line 2339
    :cond_7
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_9

    .line 2340
    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    .line 2341
    .local v2, "strId":Ljava/lang/String;
    iget-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, v2, v4}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 2342
    goto :goto_0

    .line 2343
    :cond_8
    iput-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2344
    .end local v2    # "strId":Ljava/lang/String;
    goto :goto_2

    .line 2345
    :cond_9
    move-object v2, v1

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 2346
    .local v2, "intId":I
    iget-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, v2, v4}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 2347
    goto :goto_0

    .line 2348
    :cond_a
    iget-boolean v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumNumbers:Z

    if-eqz v3, :cond_b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_1

    .line 2349
    :cond_b
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    iput-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2351
    .end local v2    # "intId":I
    :goto_2
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v2
.end method

.method private static enumNextInOrder(Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;)Ljava/lang/Boolean;
    .locals 8
    .param p0, "enumObj"    # Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2357
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    const-string v1, "next"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2358
    .local v0, "v":Ljava/lang/Object;
    instance-of v2, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v2, :cond_1

    .line 2361
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    .line 2362
    .local v1, "f":Lcom/trendmicro/hippo/Callable;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 2363
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 2364
    .local v3, "scope":Lcom/trendmicro/hippo/Scriptable;
    iget-object v4, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 2365
    .local v4, "r":Ljava/lang/Object;
    invoke-static {v2, v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    .line 2366
    .local v5, "iteratorResult":Lcom/trendmicro/hippo/Scriptable;
    const-string v6, "done"

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 2367
    .local v6, "done":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v6, v7, :cond_0

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 2368
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v7

    .line 2370
    :cond_0
    const-string v7, "value"

    invoke-static {v5, v7}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    .line 2371
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v7

    .line 2359
    .end local v1    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v3    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "r":Ljava/lang/Object;
    .end local v5    # "iteratorResult":Lcom/trendmicro/hippo/Scriptable;
    .end local v6    # "done":Ljava/lang/Object;
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->iterator:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static enumValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 5
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 2397
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    .line 2401
    .local v0, "x":Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2402
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v1

    .line 2403
    .local v1, "so":Lcom/trendmicro/hippo/SymbolScriptable;
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    check-cast v2, Lcom/trendmicro/hippo/Symbol;

    iget-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1, v2, v3}, Lcom/trendmicro/hippo/SymbolScriptable;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2404
    .local v1, "result":Ljava/lang/Object;
    goto :goto_0

    .line 2405
    .end local v1    # "result":Ljava/lang/Object;
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->currentId:Ljava/lang/Object;

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 2406
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 2407
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v2

    .line 2408
    .local v2, "index":I
    iget-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v4, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, v2, v4}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 2409
    .local v2, "result":Ljava/lang/Object;
    move-object v1, v2

    goto :goto_0

    .line 2410
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->obj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v2, v1, v3}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    .line 2414
    .local v1, "result":Ljava/lang/Object;
    :goto_0
    return-object v1
.end method

.method public static eq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .line 3165
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_16

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v2, :cond_0

    goto/16 :goto_6

    .line 3176
    :cond_0
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_1

    .line 3177
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v0

    return v0

    .line 3178
    :cond_1
    if-ne p0, p1, :cond_2

    .line 3179
    return v0

    .line 3180
    :cond_2
    instance-of v2, p0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_3

    .line 3181
    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 3182
    :cond_3
    instance-of v2, p0, Ljava/lang/Boolean;

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    const-wide/16 v5, 0x0

    if-eqz v2, :cond_8

    .line 3183
    move-object v2, p0

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 3184
    .local v2, "b":Z
    instance-of v7, p1, Ljava/lang/Boolean;

    if-eqz v7, :cond_5

    .line 3185
    move-object v3, p1

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-ne v2, v3, :cond_4

    goto :goto_0

    :cond_4
    move v0, v1

    :goto_0
    return v0

    .line 3187
    :cond_5
    instance-of v0, p1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_6

    .line 3188
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3189
    .local v0, "test":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_6

    .line 3190
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 3193
    .end local v0    # "test":Ljava/lang/Object;
    :cond_6
    if-eqz v2, :cond_7

    goto :goto_1

    :cond_7
    move-wide v3, v5

    :goto_1
    invoke-static {v3, v4, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v0

    return v0

    .line 3194
    .end local v2    # "b":Z
    :cond_8
    instance-of v2, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_14

    .line 3195
    instance-of v2, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_e

    .line 3196
    instance-of v2, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v2, :cond_9

    .line 3197
    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3198
    .local v2, "test":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_9

    .line 3199
    move-object v0, v2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 3202
    .end local v2    # "test":Ljava/lang/Object;
    :cond_9
    instance-of v2, p1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v2, :cond_a

    .line 3203
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v2, p0}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3204
    .restart local v2    # "test":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_a

    .line 3205
    move-object v0, v2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 3208
    .end local v2    # "test":Ljava/lang/Object;
    :cond_a
    instance-of v2, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_d

    instance-of v2, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_d

    .line 3211
    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 3212
    .local v2, "unwrappedX":Ljava/lang/Object;
    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    .line 3213
    .local v3, "unwrappedY":Ljava/lang/Object;
    if-eq v2, v3, :cond_c

    .line 3214
    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->isPrimitive(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 3215
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->isPrimitive(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 3216
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    goto :goto_2

    :cond_b
    move v0, v1

    goto :goto_3

    :cond_c
    :goto_2
    nop

    .line 3213
    :goto_3
    return v0

    .line 3218
    .end local v2    # "unwrappedX":Ljava/lang/Object;
    .end local v3    # "unwrappedY":Ljava/lang/Object;
    :cond_d
    return v1

    .line 3219
    :cond_e
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_11

    .line 3220
    instance-of v0, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_f

    .line 3221
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3222
    .restart local v0    # "test":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_f

    .line 3223
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 3226
    .end local v0    # "test":Ljava/lang/Object;
    :cond_f
    move-object v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_4

    :cond_10
    move-wide v3, v5

    :goto_4
    move-wide v0, v3

    .line 3227
    .local v0, "d":D
    invoke-static {v0, v1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    return v2

    .line 3228
    .end local v0    # "d":D
    :cond_11
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_12

    .line 3229
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v0

    return v0

    .line 3230
    :cond_12
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_13

    .line 3231
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 3234
    :cond_13
    return v1

    .line 3236
    :cond_14
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3237
    if-ne p0, p1, :cond_15

    goto :goto_5

    :cond_15
    move v0, v1

    :goto_5
    return v0

    .line 3166
    :cond_16
    :goto_6
    if-eqz p1, :cond_19

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v2, :cond_17

    goto :goto_7

    .line 3169
    :cond_17
    instance-of v0, p1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_18

    .line 3170
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3171
    .local v0, "test":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v2, :cond_18

    .line 3172
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 3175
    .end local v0    # "test":Ljava/lang/Object;
    :cond_18
    return v1

    .line 3167
    :cond_19
    :goto_7
    return v0
.end method

.method static eqNumber(DLjava/lang/Object;)Z
    .locals 5
    .param p0, "x"    # D
    .param p2, "y"    # Ljava/lang/Object;

    .line 3306
    :goto_0
    const/4 v0, 0x0

    if-eqz p2, :cond_b

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v1, :cond_0

    goto :goto_2

    .line 3308
    :cond_0
    instance-of v1, p2, Ljava/lang/Number;

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 3309
    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    cmpl-double v1, p0, v3

    if-nez v1, :cond_1

    move v0, v2

    :cond_1
    return v0

    .line 3310
    :cond_2
    instance-of v1, p2, Ljava/lang/CharSequence;

    if-eqz v1, :cond_4

    .line 3311
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    cmpl-double v1, p0, v3

    if-nez v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 3312
    :cond_4
    instance-of v1, p2, Ljava/lang/Boolean;

    if-eqz v1, :cond_7

    .line 3313
    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    goto :goto_1

    :cond_5
    const-wide/16 v3, 0x0

    :goto_1
    cmpl-double v1, p0, v3

    if-nez v1, :cond_6

    move v0, v2

    :cond_6
    return v0

    .line 3314
    :cond_7
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 3315
    return v0

    .line 3316
    :cond_8
    instance-of v1, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_a

    .line 3317
    instance-of v0, p2, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_9

    .line 3318
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 3319
    .local v0, "xval":Ljava/lang/Object;
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3320
    .local v1, "test":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_9

    .line 3321
    move-object v2, v1

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    return v2

    .line 3324
    .end local v0    # "xval":Ljava/lang/Object;
    .end local v1    # "test":Ljava/lang/Object;
    :cond_9
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_0

    .line 3326
    :cond_a
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3327
    return v0

    .line 3307
    :cond_b
    :goto_2
    return v0
.end method

.method private static eqString(Ljava/lang/CharSequence;Ljava/lang/Object;)Z
    .locals 7
    .param p0, "x"    # Ljava/lang/CharSequence;
    .param p1, "y"    # Ljava/lang/Object;

    .line 3335
    :goto_0
    const/4 v0, 0x0

    if-eqz p1, :cond_b

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v1, :cond_0

    goto/16 :goto_2

    .line 3337
    :cond_0
    instance-of v1, p1, Ljava/lang/CharSequence;

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 3338
    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    .line 3339
    .local v1, "c":Ljava/lang/CharSequence;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ne v3, v4, :cond_1

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v0, v2

    :cond_1
    return v0

    .line 3340
    .end local v1    # "c":Ljava/lang/CharSequence;
    :cond_2
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_4

    .line 3341
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v3

    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    cmpl-double v1, v3, v5

    if-nez v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 3342
    :cond_4
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_7

    .line 3343
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v3

    move-object v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    goto :goto_1

    :cond_5
    const-wide/16 v5, 0x0

    :goto_1
    cmpl-double v1, v3, v5

    if-nez v1, :cond_6

    move v0, v2

    :cond_6
    return v0

    .line 3344
    :cond_7
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 3345
    return v0

    .line 3346
    :cond_8
    instance-of v1, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_a

    .line 3347
    instance-of v0, p1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_9

    .line 3348
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3349
    .local v0, "test":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_9

    .line 3350
    move-object v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 3353
    .end local v0    # "test":Ljava/lang/Object;
    :cond_9
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 3354
    goto/16 :goto_0

    .line 3356
    :cond_a
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3357
    return v0

    .line 3336
    :cond_b
    :goto_2
    return v0
.end method

.method private static errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/Object;

    .line 4548
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    return-object v0
.end method

.method public static escapeAttributeValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4431
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v0

    .line 4432
    .local v0, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xml/XMLLib;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static escapeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 764
    const/16 v0, 0x22

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escapeString(Ljava/lang/String;C)Ljava/lang/String;
    .locals 10
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "escapeQuote"    # C

    .line 773
    const/16 v0, 0x22

    if-eq p1, v0, :cond_0

    const/16 v0, 0x27

    if-eq p1, v0, :cond_0

    const/16 v0, 0x60

    if-eq p1, v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 774
    :cond_0
    const/4 v0, 0x0

    .line 776
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "L":I
    :goto_0
    if-eq v1, v2, :cond_a

    .line 777
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 779
    .local v3, "c":I
    const/16 v4, 0x20

    const/16 v5, 0x5c

    if-gt v4, v3, :cond_1

    const/16 v6, 0x7e

    if-gt v3, v6, :cond_1

    if-eq v3, p1, :cond_1

    if-eq v3, v5, :cond_1

    .line 782
    if-eqz v0, :cond_9

    .line 783
    int-to-char v4, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5

    .line 787
    :cond_1
    if-nez v0, :cond_2

    .line 788
    new-instance v6, Ljava/lang/StringBuilder;

    add-int/lit8 v7, v2, 0x3

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v0, v6

    .line 789
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 793
    :cond_2
    const/4 v6, -0x1

    .line 794
    .local v6, "escape":I
    if-eq v3, v4, :cond_4

    if-eq v3, v5, :cond_3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 798
    :pswitch_0
    const/16 v6, 0x72

    goto :goto_1

    .line 796
    :pswitch_1
    const/16 v6, 0x66

    goto :goto_1

    .line 800
    :pswitch_2
    const/16 v6, 0x76

    goto :goto_1

    .line 797
    :pswitch_3
    const/16 v6, 0x6e

    goto :goto_1

    .line 799
    :pswitch_4
    const/16 v6, 0x74

    goto :goto_1

    .line 795
    :pswitch_5
    const/16 v6, 0x62

    goto :goto_1

    .line 802
    :cond_3
    const/16 v6, 0x5c

    goto :goto_1

    .line 801
    :cond_4
    const/16 v6, 0x20

    .line 804
    :goto_1
    if-ltz v6, :cond_5

    .line 806
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 807
    int-to-char v4, v6

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 808
    :cond_5
    if-ne v3, p1, :cond_6

    .line 809
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 810
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 813
    :cond_6
    const/16 v4, 0x100

    if-ge v3, v4, :cond_7

    .line 815
    const-string v4, "\\x"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 816
    const/4 v4, 0x2

    .local v4, "hexSize":I
    goto :goto_2

    .line 819
    .end local v4    # "hexSize":I
    :cond_7
    const-string v4, "\\u"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 820
    const/4 v4, 0x4

    .line 823
    .restart local v4    # "hexSize":I
    :goto_2
    add-int/lit8 v5, v4, -0x1

    mul-int/lit8 v5, v5, 0x4

    .local v5, "shift":I
    :goto_3
    if-ltz v5, :cond_9

    .line 824
    shr-int v7, v3, v5

    and-int/lit8 v7, v7, 0xf

    .line 825
    .local v7, "digit":I
    const/16 v8, 0xa

    if-ge v7, v8, :cond_8

    add-int/lit8 v8, v7, 0x30

    goto :goto_4

    :cond_8
    add-int/lit8 v8, v7, 0x57

    .line 826
    .local v8, "hc":I
    :goto_4
    int-to-char v9, v8

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 823
    .end local v7    # "digit":I
    .end local v8    # "hc":I
    add-int/lit8 v5, v5, -0x4

    goto :goto_3

    .line 776
    .end local v3    # "c":I
    .end local v4    # "hexSize":I
    .end local v5    # "shift":I
    .end local v6    # "escape":I
    :cond_9
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 830
    .end local v1    # "i":I
    .end local v2    # "L":I
    :cond_a
    if-nez v0, :cond_b

    move-object v1, p0

    goto :goto_6

    :cond_b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_6
    return-object v1

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static escapeTextValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4443
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v0

    .line 4444
    .local v0, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/xml/XMLLib;->escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static evalSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 15
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisArg"    # Ljava/lang/Object;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "filename"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I

    .line 2809
    move-object v7, p0

    move-object/from16 v8, p3

    array-length v0, v8

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 2810
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 2811
    :cond_0
    const/4 v0, 0x0

    aget-object v9, v8, v0

    .line 2812
    .local v9, "x":Ljava/lang/Object;
    instance-of v2, v9, Ljava/lang/CharSequence;

    if-nez v2, :cond_2

    .line 2813
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x9

    .line 2814
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2818
    const-string v0, "msg.eval.nonstring"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2819
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 2820
    return-object v9

    .line 2816
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    const-string v0, "msg.eval.nonstring.strict"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 2822
    :cond_2
    if-nez p4, :cond_4

    .line 2823
    new-array v2, v1, [I

    .line 2824
    .local v2, "linep":[I
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v3

    .line 2825
    .end local p4    # "filename":Ljava/lang/String;
    .local v3, "filename":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 2826
    aget v0, v2, v0

    move v11, v0

    move-object v10, v3

    .end local p5    # "lineNumber":I
    .local v0, "lineNumber":I
    goto :goto_0

    .line 2828
    .end local v0    # "lineNumber":I
    .restart local p5    # "lineNumber":I
    :cond_3
    const-string v0, ""

    move/from16 v11, p5

    move-object v10, v0

    .end local v3    # "filename":Ljava/lang/String;
    .local v0, "filename":Ljava/lang/String;
    goto :goto_0

    .line 2822
    .end local v0    # "filename":Ljava/lang/String;
    .end local v2    # "linep":[I
    .restart local p4    # "filename":Ljava/lang/String;
    :cond_4
    move-object/from16 v10, p4

    move/from16 v11, p5

    .line 2831
    .end local p4    # "filename":Ljava/lang/String;
    .end local p5    # "lineNumber":I
    .local v10, "filename":Ljava/lang/String;
    .local v11, "lineNumber":I
    :goto_0
    nop

    .line 2832
    invoke-static {v1, v10, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    .line 2835
    .local v12, "sourceName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/DefaultErrorReporter;->forEval(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v13

    .line 2837
    .local v13, "reporter":Lcom/trendmicro/hippo/ErrorReporter;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v14

    .line 2838
    .local v14, "evaluator":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v14, :cond_5

    .line 2845
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, v14

    move-object v3, v13

    move-object v4, v12

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    .line 2847
    .local v0, "script":Lcom/trendmicro/hippo/Script;
    invoke-interface {v14, v0}, Lcom/trendmicro/hippo/Evaluator;->setEvalScriptFlag(Lcom/trendmicro/hippo/Script;)V

    .line 2848
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    .line 2849
    .local v1, "c":Lcom/trendmicro/hippo/Callable;
    move-object/from16 v2, p2

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v4, p1

    invoke-interface {v1, p0, v4, v2, v3}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 2839
    .end local v0    # "script":Lcom/trendmicro/hippo/Script;
    .end local v1    # "c":Lcom/trendmicro/hippo/Callable;
    :cond_5
    move-object/from16 v4, p1

    new-instance v0, Lcom/trendmicro/hippo/JavaScriptException;

    const-string v1, "Interpreter not present"

    invoke-direct {v0, v1, v10, v11}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0
.end method

.method public static exitActivationFunction(Lcom/trendmicro/hippo/Context;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3697
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3698
    .local v0, "call":Lcom/trendmicro/hippo/NativeCall;
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCall;->parentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    iput-object v1, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3699
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trendmicro/hippo/NativeCall;->parentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3700
    return-void
.end method

.method static findFunctionActivation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/NativeCall;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "f"    # Lcom/trendmicro/hippo/Function;

    .line 3704
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 3705
    .local v0, "call":Lcom/trendmicro/hippo/NativeCall;
    :goto_0
    if-eqz v0, :cond_1

    .line 3706
    iget-object v1, v0, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    if-ne v1, p1, :cond_0

    .line 3707
    return-object v0

    .line 3708
    :cond_0
    iget-object v0, v0, Lcom/trendmicro/hippo/NativeCall;->parentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    goto :goto_0

    .line 3710
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method static getApplyArguments(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "arg1"    # Ljava/lang/Object;

    .line 2774
    if-eqz p1, :cond_3

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 2776
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isArrayLike(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2777
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->getElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2778
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_2

    .line 2779
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    return-object v0

    .line 2781
    :cond_2
    const-string v0, "msg.arg.isnt.array"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 2775
    :cond_3
    :goto_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    return-object v0
.end method

.method public static getArrayElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;
    .locals 8
    .param p0, "object"    # Lcom/trendmicro/hippo/Scriptable;

    .line 4109
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 4110
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/trendmicro/hippo/NativeArray;->getLengthProperty(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)J

    move-result-wide v1

    .line 4111
    .local v1, "longLen":J
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-gtz v3, :cond_3

    .line 4115
    long-to-int v3, v1

    .line 4116
    .local v3, "len":I
    if-nez v3, :cond_0

    .line 4117
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    return-object v4

    .line 4119
    :cond_0
    new-array v4, v3, [Ljava/lang/Object;

    .line 4120
    .local v4, "result":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_2

    .line 4121
    invoke-static {p0, v5}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v6

    .line 4122
    .local v6, "elem":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v6, v7, :cond_1

    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    .line 4123
    :cond_1
    move-object v7, v6

    :goto_1
    aput-object v7, v4, v5

    .line 4120
    .end local v6    # "elem":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 4125
    .end local v5    # "i":I
    :cond_2
    return-object v4

    .line 4113
    .end local v3    # "len":I
    .end local v4    # "result":[Ljava/lang/Object;
    :cond_3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3
.end method

.method static getCallable(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;
    .locals 2
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2788
    instance-of v0, p0, Lcom/trendmicro/hippo/Callable;

    if-eqz v0, :cond_0

    .line 2789
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Callable;

    .local v0, "function":Lcom/trendmicro/hippo/Callable;
    goto :goto_0

    .line 2791
    .end local v0    # "function":Lcom/trendmicro/hippo/Callable;
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    invoke-interface {p0, v0}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 2792
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_1

    .line 2795
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    move-object v0, v1

    .line 2797
    .local v0, "function":Lcom/trendmicro/hippo/Callable;
    :goto_0
    return-object v0

    .line 2793
    .local v0, "value":Ljava/lang/Object;
    :cond_1
    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2485
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    return-object v0
.end method

.method public static getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2501
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2502
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2503
    .local v0, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 2506
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Symbol;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "value":Ljava/lang/Object;
    goto :goto_0

    .line 2504
    .end local v1    # "value":Ljava/lang/Object;
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2509
    .end local v0    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2510
    .local v0, "str":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 2511
    invoke-static {p0, v0, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    return-object v1

    .line 2513
    :cond_2
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v1

    .line 2515
    .local v1, "index":I
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 2516
    .local v2, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v2, :cond_4

    .line 2520
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v2

    move-object v1, v3

    .line 2523
    .end local v2    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .local v0, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    .local v1, "value":Ljava/lang/Object;
    :goto_0
    instance-of v2, v1, Lcom/trendmicro/hippo/Callable;

    if-eqz v2, :cond_3

    .line 2527
    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2528
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Callable;

    return-object v2

    .line 2524
    :cond_3
    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2517
    .local v0, "str":Ljava/lang/String;
    .local v1, "index":I
    .restart local v2    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_4
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method static getExistingCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;

    .line 1347
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1348
    .local v0, "ctorVal":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_0

    .line 1349
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Function;

    return-object v1

    .line 1351
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 1352
    const-string v1, "msg.ctor.not.found"

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 1355
    :cond_1
    const-string v1, "msg.not.ctor"

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method public static getGlobal(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3507
    const-string v0, "com.trendmicro.hippo.tools.shell.Global"

    .line 3508
    .local v0, "GLOBAL_CLASS":Ljava/lang/String;
    const-string v1, "com.trendmicro.hippo.tools.shell.Global"

    invoke-static {v1}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 3509
    .local v1, "globalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_0

    .line 3511
    const/4 v2, 0x1

    :try_start_0
    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 3512
    .local v3, "parm":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 3513
    .local v4, "globalClassCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    .line 3514
    .local v2, "arg":[Ljava/lang/Object;
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ScriptableObject;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    .line 3519
    .end local v2    # "arg":[Ljava/lang/Object;
    .end local v3    # "parm":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v4    # "globalClassCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :catch_0
    move-exception v2

    goto :goto_0

    .line 3516
    :catch_1
    move-exception v2

    .line 3517
    .local v2, "e":Ljava/lang/RuntimeException;
    throw v2

    .line 3523
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :cond_0
    :goto_0
    new-instance v2, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v2, p0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;)V

    return-object v2
.end method

.method static getIndexObject(D)Ljava/lang/Object;
    .locals 3
    .param p0, "d"    # D

    .line 1471
    double-to-int v0, p0

    .line 1472
    .local v0, "i":I
    int-to-double v1, v0

    cmpl-double v1, v1, p0

    if-nez v1, :cond_0

    .line 1473
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 1475
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getIndexObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .line 1458
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v0

    .line 1459
    .local v0, "indexTest":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 1460
    long-to-int v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    return-object v2

    .line 1462
    :cond_0
    return-object p0
.end method

.method public static getLibraryScopeOrNull(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 310
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    .line 311
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopScopeValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 312
    .local v0, "libScope":Lcom/trendmicro/hippo/ScriptableObject;
    return-object v0
.end method

.method public static getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arguments"    # [Ljava/lang/Object;

    .line 4193
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->messageProvider:Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;

    invoke-interface {v0, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "messageId"    # Ljava/lang/String;

    .line 4141
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;

    .line 4146
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 4147
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .line 4153
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 4154
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;

    .line 4160
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    .line 4161
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMessage4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;
    .param p4, "arg4"    # Ljava/lang/Object;

    .line 4167
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    const/4 v1, 0x3

    aput-object p4, v0, v1

    .line 4168
    .local v0, "arguments":[Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getNameFunctionAndThis(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2452
    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2453
    .local v0, "parent":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_2

    .line 2454
    invoke-static {p1, p2, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->topScopeName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2455
    .local v1, "result":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Callable;

    if-nez v2, :cond_1

    .line 2456
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    .line 2457
    invoke-static {p2, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFoundError(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2459
    :cond_0
    invoke-static {v1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2462
    :cond_1
    move-object v2, p2

    .line 2463
    .local v2, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {p1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2464
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/Callable;

    return-object v3

    .line 2468
    .end local v1    # "result":Ljava/lang/Object;
    .end local v2    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_2
    const/4 v1, 0x1

    invoke-static {p1, p2, v0, p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->nameOrFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    return-object v1
.end method

.method public static getObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1537
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 1538
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    invoke-virtual {v0, p2, p1}, Lcom/trendmicro/hippo/xml/XMLObject;->get(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "result":Ljava/lang/Object;
    goto :goto_0

    .line 1539
    .end local v0    # "result":Ljava/lang/Object;
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1540
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Symbol;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;

    move-result-object v0

    .restart local v0    # "result":Ljava/lang/Object;
    goto :goto_0

    .line 1542
    .end local v0    # "result":Ljava/lang/Object;
    :cond_1
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1543
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 1544
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v1

    .line 1545
    .local v1, "index":I
    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v1

    .line 1546
    .local v1, "result":Ljava/lang/Object;
    move-object v0, v1

    goto :goto_0

    .line 1547
    .end local v1    # "result":Ljava/lang/Object;
    :cond_2
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    .line 1551
    .local v0, "result":Ljava/lang/Object;
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_3

    .line 1552
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1555
    :cond_3
    return-object v0
.end method

.method public static getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1516
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1524
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1525
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 1528
    invoke-static {v0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1526
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static getObjectIndex(Lcom/trendmicro/hippo/Scriptable;ILcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1661
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 1662
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 1663
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1666
    :cond_0
    return-object v0
.end method

.method public static getObjectIndex(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1635
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectIndex(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectIndex(Ljava/lang/Object;DLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1645
    invoke-static {p3, p0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1646
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 1650
    double-to-int v1, p1

    .line 1651
    .local v1, "index":I
    int-to-double v2, v1

    cmpl-double v2, v2, p1

    if-nez v2, :cond_0

    .line 1652
    invoke-static {v0, v1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectIndex(Lcom/trendmicro/hippo/Scriptable;ILcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1654
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v2

    .line 1655
    .local v2, "s":Ljava/lang/String;
    invoke-static {v0, v2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 1647
    .end local v1    # "index":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static getObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1589
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1590
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 1591
    const/16 v1, 0xb

    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1592
    const-string v1, "msg.ref.undefined.prop"

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 1595
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 1598
    :cond_1
    return-object v0
.end method

.method public static getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1567
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1578
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1579
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 1582
    invoke-static {v0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1580
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1608
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1614
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1615
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 1618
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1619
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    .line 1620
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v2

    .line 1622
    :cond_0
    return-object v1

    .line 1616
    .end local v1    # "result":Ljava/lang/Object;
    :cond_1
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2547
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    return-object v0
.end method

.method public static getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2561
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2562
    .local v0, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThisHelper(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    return-object v1
.end method

.method private static getPropFunctionAndThisHelper(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2568
    if-eqz p3, :cond_2

    .line 2572
    invoke-static {p3, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2573
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-nez v1, :cond_0

    .line 2574
    const-string v1, "__noSuchMethod__"

    invoke-static {p3, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2575
    .local v1, "noSuchMethod":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Callable;

    if-eqz v2, :cond_0

    .line 2576
    new-instance v2, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;

    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/Callable;

    invoke-direct {v2, v3, p1}, Lcom/trendmicro/hippo/ScriptRuntime$NoSuchMethodShim;-><init>(Lcom/trendmicro/hippo/Callable;Ljava/lang/String;)V

    move-object v0, v2

    .line 2579
    .end local v1    # "noSuchMethod":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_1

    .line 2583
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2584
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    return-object v1

    .line 2580
    :cond_1
    invoke-static {p3, v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2569
    .end local v0    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4383
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getRegExpProxy()Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v0

    return-object v0
.end method

.method public static getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3533
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    .line 3534
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 3537
    return-object v0

    .line 3535
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method public static getTopLevelProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/String;

    .line 1340
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 1341
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static getTopPackageNames()[Ljava/lang/String;
    .locals 8

    .line 302
    const-string v0, "java.vm.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Dalvik"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    const-string v1, "java"

    const-string v2, "javax"

    const-string v3, "org"

    const-string v4, "com"

    const-string v5, "edu"

    const-string v6, "net"

    const-string v7, "android"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 304
    :cond_0
    const-string v1, "java"

    const-string v2, "javax"

    const-string v3, "org"

    const-string v4, "com"

    const-string v5, "edu"

    const-string v6, "net"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    .line 302
    :goto_0
    return-object v0
.end method

.method public static getValueFunctionAndThis(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Callable;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 2596
    instance-of v0, p0, Lcom/trendmicro/hippo/Callable;

    if-eqz v0, :cond_5

    .line 2600
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Callable;

    .line 2601
    .local v0, "f":Lcom/trendmicro/hippo/Callable;
    const/4 v1, 0x0

    .line 2602
    .local v1, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    instance-of v2, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_0

    .line 2603
    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2605
    :cond_0
    if-nez v1, :cond_2

    .line 2606
    iget-object v2, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_1

    .line 2607
    iget-object v1, p1, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    .line 2606
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 2609
    :cond_2
    :goto_0
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 2610
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v2, :cond_3

    goto :goto_1

    .line 2613
    :cond_3
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeCall;

    if-eqz v2, :cond_4

    .line 2615
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2618
    :cond_4
    :goto_1
    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2619
    return-object v0

    .line 2597
    .end local v0    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v1    # "thisObj":Lcom/trendmicro/hippo/Scriptable;
    :cond_5
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static hasObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z
    .locals 2
    .param p0, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1812
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1813
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Symbol;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Z

    move-result v0

    .local v0, "result":Z
    goto :goto_0

    .line 1815
    .end local v0    # "result":Z
    :cond_0
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1816
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 1817
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v1

    .line 1818
    .local v1, "index":I
    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;I)Z

    move-result v1

    .line 1819
    .local v1, "result":Z
    move v0, v1

    goto :goto_0

    .line 1820
    .end local v1    # "result":Z
    :cond_1
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v1

    move v0, v1

    .line 1824
    .local v0, "result":Z
    :goto_0
    return v0
.end method

.method public static hasTopCall(Lcom/trendmicro/hippo/Context;)Z
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3528
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static in(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3449
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 3453
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->hasObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    return v0

    .line 3450
    :cond_0
    const-string v0, "msg.in.not.object"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static indexFromString(Ljava/lang/String;)J
    .locals 12
    .param p0, "str"    # Ljava/lang/String;

    .line 1367
    const/16 v0, 0xa

    .line 1369
    .local v0, "MAX_VALUE_LENGTH":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1370
    .local v1, "len":I
    const-wide/16 v2, -0x1

    if-lez v1, :cond_7

    .line 1371
    const/4 v4, 0x0

    .line 1372
    .local v4, "i":I
    const/4 v5, 0x0

    .line 1373
    .local v5, "negate":Z
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 1374
    .local v6, "c":I
    const/16 v7, 0x2d

    const/16 v8, 0x30

    const/4 v9, 0x1

    if-ne v6, v7, :cond_1

    .line 1375
    if-le v1, v9, :cond_1

    .line 1376
    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 1377
    if-ne v6, v8, :cond_0

    return-wide v2

    .line 1378
    :cond_0
    const/4 v4, 0x1

    .line 1379
    const/4 v5, 0x1

    .line 1382
    :cond_1
    add-int/lit8 v6, v6, -0x30

    .line 1383
    if-ltz v6, :cond_7

    const/16 v7, 0x9

    if-gt v6, v7, :cond_7

    .line 1384
    if-eqz v5, :cond_2

    const/16 v10, 0xb

    goto :goto_0

    :cond_2
    const/16 v10, 0xa

    :goto_0
    if-gt v1, v10, :cond_7

    .line 1389
    neg-int v10, v6

    .line 1390
    .local v10, "index":I
    const/4 v11, 0x0

    .line 1391
    .local v11, "oldIndex":I
    add-int/2addr v4, v9

    .line 1392
    if-eqz v10, :cond_3

    .line 1394
    :goto_1
    if-eq v4, v1, :cond_3

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    sub-int/2addr v9, v8

    move v6, v9

    if-ltz v9, :cond_3

    if-gt v6, v7, :cond_3

    .line 1396
    move v11, v10

    .line 1397
    mul-int/lit8 v9, v10, 0xa

    sub-int v10, v9, v6

    .line 1398
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1403
    :cond_3
    if-ne v4, v1, :cond_7

    const v7, -0xccccccc

    if-gt v11, v7, :cond_5

    if-ne v11, v7, :cond_7

    .line 1406
    if-eqz v5, :cond_4

    const/16 v7, 0x8

    goto :goto_2

    .line 1407
    :cond_4
    const/4 v7, 0x7

    :goto_2
    if-gt v6, v7, :cond_7

    .line 1409
    :cond_5
    const-wide v2, 0xffffffffL

    if-eqz v5, :cond_6

    move v7, v10

    goto :goto_3

    :cond_6
    neg-int v7, v10

    :goto_3
    int-to-long v7, v7

    and-long/2addr v2, v7

    return-wide v2

    .line 1413
    .end local v4    # "i":I
    .end local v5    # "negate":Z
    .end local v6    # "c":I
    .end local v10    # "index":I
    .end local v11    # "oldIndex":I
    :cond_7
    return-wide v2
.end method

.method public static initFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeFunction;IZ)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "function"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p3, "type"    # I
    .param p4, "fromEvalCode"    # Z

    .line 3980
    const/4 v0, 0x1

    if-ne p3, v0, :cond_2

    .line 3981
    invoke-virtual {p2}, Lcom/trendmicro/hippo/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 3982
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 3983
    if-nez p4, :cond_0

    .line 3986
    const/4 v1, 0x4

    .line 3987
    invoke-static {p1, v0, p2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_0

    .line 3989
    :cond_0
    invoke-interface {p1, v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 3992
    .end local v0    # "name":Ljava/lang/String;
    :cond_1
    :goto_0
    goto :goto_2

    :cond_2
    const/4 v0, 0x3

    if-ne p3, v0, :cond_5

    .line 3993
    invoke-virtual {p2}, Lcom/trendmicro/hippo/NativeFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 3994
    .restart local v0    # "name":Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 3998
    :goto_1
    instance-of v1, p1, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v1, :cond_3

    .line 3999
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    goto :goto_1

    .line 4001
    :cond_3
    invoke-interface {p1, v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 4003
    .end local v0    # "name":Ljava/lang/String;
    :cond_4
    nop

    .line 4006
    :goto_2
    return-void

    .line 4004
    :cond_5
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static initSafeStandardObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "sealed"    # Z

    .line 158
    if-nez p1, :cond_0

    .line 159
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    move-object p1, v0

    .line 161
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->LIBRARY_SCOPE_KEY:Ljava/lang/Object;

    invoke-virtual {p1, v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    new-instance v0, Lcom/trendmicro/hippo/ClassCache;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ClassCache;-><init>()V

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ClassCache;->associate(Lcom/trendmicro/hippo/ScriptableObject;)Z

    .line 164
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 165
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeObject;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 167
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 170
    .local v6, "objectProto":Lcom/trendmicro/hippo/Scriptable;
    const-string v0, "Function"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 171
    .local v7, "functionProto":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v7, v6}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 174
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-nez v0, :cond_1

    .line 175
    invoke-virtual {p1, v6}, Lcom/trendmicro/hippo/ScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 178
    :cond_1
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeError;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 179
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeGlobal;->init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 181
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeArray;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 182
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getOptimizationLevel()I

    move-result v0

    if-lez v0, :cond_2

    .line 186
    const v0, 0x30d40

    invoke-static {v0}, Lcom/trendmicro/hippo/NativeArray;->setMaximumInitialCapacity(I)V

    .line 188
    :cond_2
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeString;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 189
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeBoolean;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 190
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeNumber;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 191
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeDate;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 192
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeMath;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 193
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeJSON;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 195
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeWith;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 196
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeCall;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 197
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeScript;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 199
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeIterator;->init(Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 201
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeArrayIterator;->init(Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 202
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeStringIterator;->init(Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 204
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 205
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getE4xImplementationFactory()Lcom/trendmicro/hippo/xml/XMLLib$Factory;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    move v8, v0

    .line 208
    .local v8, "withXml":Z
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const/4 v5, 0x1

    const-string v2, "RegExp"

    const-string v3, "com.trendmicro.hippo.regexp.NativeRegExp"

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 210
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Continuation"

    const-string v3, "com.trendmicro.hippo.NativeContinuation"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 213
    if-eqz v8, :cond_4

    .line 214
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getE4xImplementationFactory()Lcom/trendmicro/hippo/xml/XMLLib$Factory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xml/XMLLib$Factory;->getImplementationClassName()Ljava/lang/String;

    move-result-object v9

    .line 215
    .local v9, "xmlImpl":Ljava/lang/String;
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const/4 v5, 0x1

    const-string v2, "XML"

    move-object v1, p1

    move-object v3, v9

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 216
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "XMLList"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 217
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Namespace"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 218
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "QName"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 221
    .end local v9    # "xmlImpl":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0xb4

    const/16 v9, 0xc8

    if-lt v0, v1, :cond_5

    const/16 v0, 0xe

    .line 222
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_6

    .line 223
    :cond_5
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    if-lt v0, v9, :cond_7

    .line 225
    :cond_6
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const/4 v5, 0x1

    const-string v2, "ArrayBuffer"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeArrayBuffer"

    move-object v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 228
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Int8Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeInt8Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 231
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Uint8Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeUint8Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 234
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Uint8ClampedArray"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeUint8ClampedArray"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 237
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Int16Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeInt16Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 240
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Uint16Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeUint16Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 243
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Int32Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeInt32Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 246
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Uint32Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeUint32Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 249
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Float32Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeFloat32Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 252
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Float64Array"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeFloat64Array"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 255
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "DataView"

    const-string v3, "com.trendmicro.hippo.typedarrays.NativeDataView"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 260
    :cond_7
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    if-lt v0, v9, :cond_8

    .line 261
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeSymbol;->init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 262
    const-string v0, "Set Iterator"

    invoke-static {p1, v0, p2}, Lcom/trendmicro/hippo/NativeCollectionIterator;->init(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Z)V

    .line 263
    const-string v0, "Map Iterator"

    invoke-static {p1, v0, p2}, Lcom/trendmicro/hippo/NativeCollectionIterator;->init(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Z)V

    .line 264
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeMap;->init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 265
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeSet;->init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 266
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeWeakMap;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 267
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/NativeWeakSet;->init(Lcom/trendmicro/hippo/Scriptable;Z)V

    .line 270
    :cond_8
    instance-of v0, p1, Lcom/trendmicro/hippo/TopLevel;

    if-eqz v0, :cond_9

    .line 271
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/TopLevel;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/TopLevel;->cacheBuiltins()V

    .line 274
    :cond_9
    return-object p1
.end method

.method public static initScript(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 7
    .param p0, "funObj"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "evalScript"    # Z

    .line 3621
    iget-object v0, p2, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_5

    .line 3624
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeFunction;->getParamAndVarCount()I

    move-result v0

    .line 3625
    .local v0, "varCount":I
    if-eqz v0, :cond_4

    .line 3627
    move-object v1, p3

    .line 3630
    .local v1, "varScope":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v2, :cond_0

    .line 3631
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    goto :goto_0

    .line 3634
    :cond_0
    move v2, v0

    .local v2, "i":I
    :goto_1
    add-int/lit8 v3, v2, -0x1

    .end local v2    # "i":I
    .local v3, "i":I
    if-eqz v2, :cond_4

    .line 3635
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v2

    .line 3636
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarConst(I)Z

    move-result v4

    .line 3639
    .local v4, "isConst":Z
    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 3640
    if-eqz v4, :cond_1

    .line 3641
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineConstProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    goto :goto_2

    .line 3642
    :cond_1
    if-nez p4, :cond_2

    .line 3644
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const/4 v6, 0x4

    invoke-static {v1, v2, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_2

    .line 3648
    :cond_2
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-interface {v1, v2, v1, v5}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_2

    .line 3651
    :cond_3
    invoke-static {p3, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->redefineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Z)V

    .line 3653
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "isConst":Z
    :goto_2
    move v2, v3

    goto :goto_1

    .line 3655
    .end local v1    # "varScope":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "i":I
    :cond_4
    return-void

    .line 3622
    .end local v0    # "varCount":I
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public static initStandardObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 11
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "sealed"    # Z

    .line 281
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->initSafeStandardObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v6

    .line 283
    .local v6, "s":Lcom/trendmicro/hippo/ScriptableObject;
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "Packages"

    const-string v3, "com.trendmicro.hippo.NativeJavaTopPackage"

    const/4 v5, 0x1

    move-object v1, v6

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 285
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "getClass"

    const-string v3, "com.trendmicro.hippo.NativeJavaTopPackage"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 287
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "JavaAdapter"

    const-string v3, "com.trendmicro.hippo.JavaAdapter"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 289
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const-string v2, "JavaImporter"

    const-string v3, "com.trendmicro.hippo.ImporterTopLevel"

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 292
    invoke-static {}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopPackageNames()[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    const/4 v0, 0x0

    move v9, v0

    :goto_0
    if-ge v9, v8, :cond_0

    aget-object v10, v7, v9

    .line 293
    .local v10, "packageName":Ljava/lang/String;
    new-instance v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    const/4 v5, 0x1

    const-string v3, "com.trendmicro.hippo.NativeJavaTopPackage"

    move-object v1, v6

    move-object v2, v10

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;-><init>(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 292
    .end local v10    # "packageName":Ljava/lang/String;
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 297
    :cond_0
    return-object v6
.end method

.method public static instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z
    .locals 2
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3406
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    .line 3411
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 3412
    const/4 v0, 0x0

    return v0

    .line 3414
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 3407
    :cond_1
    const-string v0, "msg.instanceof.not.object"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static isArrayLike(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2765
    if-eqz p0, :cond_1

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeArray;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/trendmicro/hippo/Arguments;

    if-nez v0, :cond_0

    .line 2768
    const-string v0, "length"

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 2765
    :goto_0
    return v0
.end method

.method public static isArrayObject(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .line 4104
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeArray;

    if-nez v0, :cond_1

    instance-of v0, p0, Lcom/trendmicro/hippo/Arguments;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method static isGeneratedScript(Ljava/lang/String;)Z
    .locals 1
    .param p0, "sourceUrl"    # Ljava/lang/String;

    .line 4533
    const-string v0, "(eval)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_1

    .line 4534
    const-string v0, "(Function)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 4533
    :goto_1
    return v0
.end method

.method public static isHippoRuntimeType(Ljava/lang/Class;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 146
    .local p0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 147
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 149
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_2

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v0, :cond_2

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    .line 150
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    .line 151
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    move v1, v2

    .line 149
    :cond_3
    return v1
.end method

.method public static isJSLineTerminator(I)Z
    .locals 2
    .param p0, "c"    # I

    .line 320
    const v0, 0xdfd0

    and-int/2addr v0, p0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 321
    return v1

    .line 323
    :cond_0
    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2028

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2029

    if-ne p0, v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static isJSWhitespaceOrLineTerminator(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 327
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isNaN(Ljava/lang/Object;)Z
    .locals 7
    .param p0, "n"    # Ljava/lang/Object;

    .line 3283
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    const/4 v1, 0x1

    if-ne p0, v0, :cond_0

    .line 3284
    return v1

    .line 3286
    :cond_0
    instance-of v0, p0, Ljava/lang/Double;

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 3287
    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    .line 3288
    .local v0, "d":Ljava/lang/Double;
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    sget-wide v5, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :cond_2
    :goto_0
    return v1

    .line 3290
    .end local v0    # "d":Ljava/lang/Double;
    :cond_3
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_6

    .line 3291
    move-object v0, p0

    check-cast v0, Ljava/lang/Float;

    .line 3292
    .local v0, "f":Ljava/lang/Float;
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    float-to-double v3, v3

    sget-wide v5, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_5

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    move v1, v2

    :cond_5
    :goto_1
    return v1

    .line 3294
    .end local v0    # "f":Ljava/lang/Float;
    :cond_6
    return v2
.end method

.method public static isObject(Ljava/lang/Object;)Z
    .locals 4
    .param p0, "value"    # Ljava/lang/Object;

    .line 2888
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2889
    return v0

    .line 2891
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2892
    return v0

    .line 2894
    :cond_1
    instance-of v1, p0, Lcom/trendmicro/hippo/ScriptableObject;

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 2895
    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getTypeOf()Ljava/lang/String;

    move-result-object v1

    .line 2896
    .local v1, "type":Ljava/lang/String;
    const-string v3, "object"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "function"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    move v0, v2

    :cond_3
    return v0

    .line 2898
    .end local v1    # "type":Ljava/lang/String;
    :cond_4
    instance-of v1, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_5

    .line 2899
    instance-of v0, p0, Lcom/trendmicro/hippo/Callable;

    xor-int/2addr v0, v2

    return v0

    .line 2901
    :cond_5
    return v0
.end method

.method public static isPrimitive(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .line 3298
    if-eqz p0, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v0, :cond_1

    instance-of v0, p0, Ljava/lang/Number;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method static isSpecialProperty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 1854
    const-string v0, "__proto__"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "__parent__"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method static isStrWhiteSpaceChar(I)Z
    .locals 3
    .param p0, "c"    # I

    .line 347
    const/16 v0, 0x20

    const/4 v1, 0x1

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa0

    if-eq p0, v0, :cond_1

    const v0, 0xfeff

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2028

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2029

    if-eq p0, v0, :cond_1

    packed-switch p0, :pswitch_data_0

    .line 360
    invoke-static {p0}, Ljava/lang/Character;->getType(I)I

    move-result v0

    const/16 v2, 0xc

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 358
    :cond_1
    :pswitch_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static isSymbol(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .line 4542
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeSymbol;

    .line 4543
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeSymbol;->isSymbol()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    instance-of v0, p0, Lcom/trendmicro/hippo/SymbolKey;

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 4542
    :goto_0
    return v0
.end method

.method static isValidIdentifierName(Ljava/lang/String;Lcom/trendmicro/hippo/Context;Z)Z
    .locals 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "isStrict"    # Z

    .line 835
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 836
    .local v0, "L":I
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 837
    return v1

    .line 838
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 839
    return v1

    .line 840
    :cond_1
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_3

    .line 841
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 842
    return v1

    .line 840
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 844
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v1

    invoke-static {p0, v1, p2}, Lcom/trendmicro/hippo/TokenStream;->isKeyword(Ljava/lang/String;IZ)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    return v1
.end method

.method private static isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "obj"    # Ljava/lang/Object;

    .line 3901
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getClassShutter()Lcom/trendmicro/hippo/ClassShutter;

    move-result-object v0

    .line 3902
    .local v0, "shutter":Lcom/trendmicro/hippo/ClassShutter;
    if-eqz v0, :cond_1

    .line 3903
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/ClassShutter;->visibleToScripts(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 3902
    :goto_1
    return v1
.end method

.method public static jsDelegatesTo(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p0, "lhs"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "rhs"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3423
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 3425
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    if-eqz v0, :cond_1

    .line 3426
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    return v1

    .line 3427
    :cond_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    goto :goto_0

    .line 3430
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method static lastIndexResult(Lcom/trendmicro/hippo/Context;)I
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4488
    iget v0, p0, Lcom/trendmicro/hippo/Context;->scratchIndex:I

    return v0
.end method

.method public static lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4516
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->scratchScriptable:Lcom/trendmicro/hippo/Scriptable;

    .line 4517
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/Context;->scratchScriptable:Lcom/trendmicro/hippo/Scriptable;

    .line 4518
    return-object v0
.end method

.method public static lastUint32Result(Lcom/trendmicro/hippo/Context;)J
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 4500
    iget-wide v0, p0, Lcom/trendmicro/hippo/Context;->scratchUint32:J

    .line 4501
    .local v0, "value":J
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 4503
    return-wide v0

    .line 4502
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method

.method public static leaveDotQuery(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3944
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeWith;

    .line 3945
    .local v0, "nw":Lcom/trendmicro/hippo/NativeWith;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeWith;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static leaveWith(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3922
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeWith;

    .line 3923
    .local v0, "nw":Lcom/trendmicro/hippo/NativeWith;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeWith;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method static makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "isEval"    # Z
    .param p1, "masterScriptUrl"    # Ljava/lang/String;
    .param p2, "masterScriptLine"    # I

    .line 4524
    const/16 v0, 0x23

    if-eqz p0, :cond_0

    .line 4525
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "(eval)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 4527
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "(Function)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static memberRef(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "memberTypeFlags"    # I

    .line 4450
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 4453
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 4454
    .local v0, "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v0, p2, p1, p3}, Lcom/trendmicro/hippo/xml/XMLObject;->memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    return-object v1

    .line 4451
    .end local v0    # "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static memberRef(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;I)Lcom/trendmicro/hippo/Ref;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "namespace"    # Ljava/lang/Object;
    .param p2, "elem"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "memberTypeFlags"    # I

    .line 4460
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 4463
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 4464
    .local v0, "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v0, p3, p1, p2, p4}, Lcom/trendmicro/hippo/xml/XMLObject;->memberRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    return-object v1

    .line 4461
    .end local v0    # "xmlObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static name(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "name"    # Ljava/lang/String;

    .line 1931
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1932
    .local v0, "parent":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_1

    .line 1933
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->topScopeName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1934
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_0

    .line 1937
    return-object v1

    .line 1935
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->notFoundError(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1940
    .end local v1    # "result":Ljava/lang/Object;
    :cond_1
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, p2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->nameOrFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static nameIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 1
    .param p0, "scopeChain"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2967
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->nameIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static nameIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 3
    .param p0, "scopeChain"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "incrDecrMask"    # I

    .line 2977
    :goto_0
    iget-boolean v0, p2, Lcom/trendmicro/hippo/Context;->useDynamicScope:Z

    if-eqz v0, :cond_0

    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2978
    iget-object v0, p2, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDynamicScope(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2980
    :cond_0
    move-object v0, p0

    .line 2982
    .local v0, "target":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v1, :cond_2

    .line 2983
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    instance-of v1, v1, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v1, :cond_2

    .line 2984
    goto :goto_1

    .line 2986
    :cond_2
    invoke-interface {v0, p1, p0}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2987
    .local v1, "value":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_3

    .line 2988
    nop

    .line 2996
    invoke-static {v0, p1, p0, v1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->doScriptableIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 2990
    :cond_3
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2991
    if-nez v0, :cond_1

    .line 2992
    .end local v1    # "value":Ljava/lang/Object;
    :goto_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2993
    if-eqz p0, :cond_4

    goto :goto_0

    .line 2994
    :cond_4
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFoundError(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private static nameOrFunction(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "parentScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "asFunctionCall"    # Z

    .line 1948
    move-object v0, p1

    .line 1950
    .local v0, "thisObj":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x0

    .line 1952
    .local v1, "firstXMLObject":Lcom/trendmicro/hippo/xml/XMLObject;
    :goto_0
    instance-of v2, p1, Lcom/trendmicro/hippo/NativeWith;

    if-eqz v2, :cond_4

    .line 1953
    invoke-interface {p1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1954
    .local v2, "withObj":Lcom/trendmicro/hippo/Scriptable;
    instance-of v3, v2, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v3, :cond_2

    .line 1955
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/xml/XMLObject;

    .line 1956
    .local v3, "xmlObj":Lcom/trendmicro/hippo/xml/XMLObject;
    invoke-virtual {v3, p3, v3}, Lcom/trendmicro/hippo/xml/XMLObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1958
    move-object v0, v3

    .line 1959
    invoke-virtual {v3, p3, v3}, Lcom/trendmicro/hippo/xml/XMLObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 1960
    .local v4, "result":Ljava/lang/Object;
    goto :goto_4

    .line 1962
    .end local v4    # "result":Ljava/lang/Object;
    :cond_0
    if-nez v1, :cond_1

    .line 1963
    move-object v1, v3

    .line 1965
    .end local v3    # "xmlObj":Lcom/trendmicro/hippo/xml/XMLObject;
    :cond_1
    goto :goto_1

    .line 1966
    :cond_2
    invoke-static {v2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 1967
    .restart local v4    # "result":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v3, :cond_3

    .line 1969
    move-object v0, v2

    .line 1970
    goto :goto_4

    .line 1973
    .end local v2    # "withObj":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "result":Ljava/lang/Object;
    :cond_3
    :goto_1
    goto :goto_2

    :cond_4
    instance-of v2, p1, Lcom/trendmicro/hippo/NativeCall;

    if-eqz v2, :cond_5

    .line 1976
    invoke-interface {p1, p3, p1}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 1977
    .restart local v4    # "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v2, :cond_6

    .line 1978
    if-eqz p4, :cond_9

    .line 1981
    nop

    .line 1982
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    goto :goto_4

    .line 1989
    .end local v4    # "result":Ljava/lang/Object;
    :cond_5
    invoke-static {p1, p3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 1990
    .restart local v4    # "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v2, :cond_6

    .line 1991
    move-object v0, p1

    .line 1992
    goto :goto_4

    .line 1995
    .end local v4    # "result":Ljava/lang/Object;
    :cond_6
    :goto_2
    move-object p1, p2

    .line 1996
    invoke-interface {p2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p2

    .line 1997
    if-nez p2, :cond_c

    .line 1998
    invoke-static {p0, p1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->topScopeName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1999
    .local v2, "result":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v3, :cond_8

    .line 2000
    if-eqz v1, :cond_7

    if-nez p4, :cond_7

    .line 2007
    invoke-virtual {v1, p3, v1}, Lcom/trendmicro/hippo/xml/XMLObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    goto :goto_3

    .line 2001
    :cond_7
    invoke-static {p1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->notFoundError(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1999
    :cond_8
    move-object v4, v2

    .line 2010
    .end local v2    # "result":Ljava/lang/Object;
    .restart local v4    # "result":Ljava/lang/Object;
    :goto_3
    move-object v0, p1

    .line 2011
    nop

    .line 2015
    :cond_9
    :goto_4
    if-eqz p4, :cond_b

    .line 2016
    instance-of v2, v4, Lcom/trendmicro/hippo/Callable;

    if-eqz v2, :cond_a

    .line 2019
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    goto :goto_5

    .line 2017
    :cond_a
    invoke-static {v4, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 2022
    :cond_b
    :goto_5
    return-object v4

    .line 1997
    .end local v4    # "result":Ljava/lang/Object;
    :cond_c
    goto :goto_0
.end method

.method public static nameRef(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
    .locals 2
    .param p0, "name"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "memberTypeFlags"    # I

    .line 4470
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v0

    .line 4471
    .local v0, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    invoke-virtual {v0, p1, p0, p2, p3}, Lcom/trendmicro/hippo/xml/XMLLib;->nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v1

    return-object v1
.end method

.method public static nameRef(Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
    .locals 7
    .param p0, "namespace"    # Ljava/lang/Object;
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "memberTypeFlags"    # I

    .line 4477
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v6

    .line 4478
    .local v6, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    move-object v0, v6

    move-object v1, p2

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/xml/XMLLib;->nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;

    move-result-object v0

    return-object v0
.end method

.method public static newArrayLiteral([Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 9
    .param p0, "objects"    # [Ljava/lang/Object;
    .param p1, "skipIndices"    # [I
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 4012
    const/4 v0, 0x2

    .line 4013
    .local v0, "SKIP_DENSITY":I
    array-length v1, p0

    .line 4014
    .local v1, "count":I
    const/4 v2, 0x0

    .line 4015
    .local v2, "skipCount":I
    if-eqz p1, :cond_0

    .line 4016
    array-length v2, p1

    .line 4018
    :cond_0
    add-int v3, v1, v2

    .line 4019
    .local v3, "length":I
    const/4 v4, 0x1

    if-le v3, v4, :cond_4

    mul-int/lit8 v4, v2, 0x2

    if-ge v4, v3, :cond_4

    .line 4022
    if-nez v2, :cond_1

    .line 4023
    move-object v4, p0

    .local v4, "sparse":[Ljava/lang/Object;
    goto :goto_2

    .line 4025
    .end local v4    # "sparse":[Ljava/lang/Object;
    :cond_1
    new-array v4, v3, [Ljava/lang/Object;

    .line 4026
    .restart local v4    # "sparse":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 4027
    .local v5, "skip":I
    const/4 v6, 0x0

    .local v6, "i":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_0
    if-eq v6, v3, :cond_3

    .line 4028
    if-eq v5, v2, :cond_2

    aget v8, p1, v5

    if-ne v8, v6, :cond_2

    .line 4029
    sget-object v8, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    aput-object v8, v4, v6

    .line 4030
    add-int/lit8 v5, v5, 0x1

    .line 4031
    goto :goto_1

    .line 4033
    :cond_2
    aget-object v8, p0, v7

    aput-object v8, v4, v6

    .line 4034
    add-int/lit8 v7, v7, 0x1

    .line 4027
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 4037
    .end local v5    # "skip":I
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_3
    :goto_2
    invoke-virtual {p2, p3, v4}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    return-object v5

    .line 4040
    .end local v4    # "sparse":[Ljava/lang/Object;
    :cond_4
    invoke-virtual {p2, p3, v3}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 4042
    .local v4, "array":Lcom/trendmicro/hippo/Scriptable;
    const/4 v5, 0x0

    .line 4043
    .restart local v5    # "skip":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_3
    if-eq v6, v3, :cond_6

    .line 4044
    if-eq v5, v2, :cond_5

    aget v8, p1, v5

    if-ne v8, v6, :cond_5

    .line 4045
    add-int/lit8 v5, v5, 0x1

    .line 4046
    goto :goto_4

    .line 4048
    :cond_5
    aget-object v8, p0, v7

    invoke-interface {v4, v6, v4, v8}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 4049
    add-int/lit8 v7, v7, 0x1

    .line 4043
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 4051
    .end local v6    # "i":I
    .end local v7    # "j":I
    :cond_6
    return-object v4
.end method

.method public static newBuiltinObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1193
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 1194
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    .line 1195
    .local v0, "ctor":Lcom/trendmicro/hippo/Function;
    if-nez p3, :cond_0

    sget-object p3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1196
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newCatchScope(Ljava/lang/Throwable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 16
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "lastCatchScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "exceptionName"    # Ljava/lang/String;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3722
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    instance-of v3, v0, Lcom/trendmicro/hippo/JavaScriptException;

    if-eqz v3, :cond_0

    .line 3723
    const/4 v3, 0x0

    .line 3724
    .local v3, "cacheObj":Z
    move-object v4, v0

    check-cast v4, Lcom/trendmicro/hippo/JavaScriptException;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/JavaScriptException;->getValue()Ljava/lang/Object;

    move-result-object v4

    .local v4, "obj":Ljava/lang/Object;
    goto/16 :goto_2

    .line 3726
    .end local v3    # "cacheObj":Z
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_0
    const/4 v3, 0x1

    .line 3731
    .restart local v3    # "cacheObj":Z
    if-eqz p1, :cond_2

    .line 3732
    move-object/from16 v4, p1

    check-cast v4, Lcom/trendmicro/hippo/NativeObject;

    .line 3733
    .local v4, "last":Lcom/trendmicro/hippo/NativeObject;
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 3734
    .local v5, "obj":Ljava/lang/Object;
    if-nez v5, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 3807
    .end local v4    # "last":Lcom/trendmicro/hippo/NativeObject;
    :cond_1
    move-object v4, v5

    goto/16 :goto_2

    .line 3741
    .end local v5    # "obj":Ljava/lang/Object;
    :cond_2
    const/4 v4, 0x0

    .line 3743
    .local v4, "javaException":Ljava/lang/Throwable;
    instance-of v5, v0, Lcom/trendmicro/hippo/EcmaError;

    if-eqz v5, :cond_3

    .line 3744
    move-object v5, v0

    check-cast v5, Lcom/trendmicro/hippo/EcmaError;

    .line 3745
    .local v5, "ee":Lcom/trendmicro/hippo/EcmaError;
    move-object v6, v5

    .line 3746
    .local v6, "re":Lcom/trendmicro/hippo/HippoException;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/EcmaError;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    move-result-object v7

    .line 3747
    .local v7, "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/EcmaError;->getErrorMessage()Ljava/lang/String;

    move-result-object v5

    .line 3748
    .local v5, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v5    # "errorMsg":Ljava/lang/String;
    .end local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    :cond_3
    instance-of v5, v0, Lcom/trendmicro/hippo/WrappedException;

    if-eqz v5, :cond_4

    .line 3749
    move-object v5, v0

    check-cast v5, Lcom/trendmicro/hippo/WrappedException;

    .line 3750
    .local v5, "we":Lcom/trendmicro/hippo/WrappedException;
    move-object v6, v5

    .line 3751
    .restart local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/WrappedException;->getWrappedException()Ljava/lang/Throwable;

    move-result-object v4

    .line 3752
    sget-object v7, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->JavaException:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 3753
    .restart local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3754
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3755
    .local v5, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v5    # "errorMsg":Ljava/lang/String;
    .end local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    :cond_4
    instance-of v5, v0, Lcom/trendmicro/hippo/EvaluatorException;

    if-eqz v5, :cond_5

    .line 3757
    move-object v5, v0

    check-cast v5, Lcom/trendmicro/hippo/EvaluatorException;

    .line 3758
    .local v5, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    move-object v6, v5

    .line 3759
    .restart local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    sget-object v7, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->InternalError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 3760
    .restart local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 3761
    .local v5, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v5    # "errorMsg":Ljava/lang/String;
    .end local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    :cond_5
    const/16 v5, 0xd

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 3764
    new-instance v5, Lcom/trendmicro/hippo/WrappedException;

    invoke-direct {v5, v0}, Lcom/trendmicro/hippo/WrappedException;-><init>(Ljava/lang/Throwable;)V

    move-object v6, v5

    .line 3765
    .restart local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    sget-object v7, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->JavaException:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 3766
    .restart local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3773
    .restart local v5    # "errorMsg":Ljava/lang/String;
    :goto_0
    invoke-virtual {v6}, Lcom/trendmicro/hippo/HippoException;->sourceName()Ljava/lang/String;

    move-result-object v8

    .line 3774
    .local v8, "sourceUri":Ljava/lang/String;
    if-nez v8, :cond_6

    .line 3775
    const-string v8, ""

    .line 3777
    :cond_6
    invoke-virtual {v6}, Lcom/trendmicro/hippo/HippoException;->lineNumber()I

    move-result v9

    .line 3779
    .local v9, "line":I
    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x2

    if-lez v9, :cond_7

    .line 3780
    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    aput-object v5, v13, v11

    aput-object v8, v13, v10

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v13, v12

    move-object v10, v13

    .local v10, "args":[Ljava/lang/Object;
    goto :goto_1

    .line 3782
    .end local v10    # "args":[Ljava/lang/Object;
    :cond_7
    new-array v12, v12, [Ljava/lang/Object;

    aput-object v5, v12, v11

    aput-object v8, v12, v10

    move-object v10, v12

    .line 3785
    .restart local v10    # "args":[Ljava/lang/Object;
    :goto_1
    invoke-static {v1, v2, v7, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->newNativeError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$NativeErrors;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v11

    .line 3787
    .local v11, "errorObject":Lcom/trendmicro/hippo/Scriptable;
    instance-of v12, v11, Lcom/trendmicro/hippo/NativeError;

    if-eqz v12, :cond_8

    .line 3788
    move-object v12, v11

    check-cast v12, Lcom/trendmicro/hippo/NativeError;

    invoke-virtual {v12, v6}, Lcom/trendmicro/hippo/NativeError;->setStackProvider(Lcom/trendmicro/hippo/HippoException;)V

    .line 3791
    :cond_8
    const/4 v12, 0x7

    const/4 v13, 0x0

    if-eqz v4, :cond_9

    invoke-static {v1, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 3792
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v14

    invoke-virtual {v14, v1, v2, v4, v13}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v14

    .line 3794
    .local v14, "wrap":Ljava/lang/Object;
    const-string v15, "javaException"

    invoke-static {v11, v15, v14, v12}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3798
    .end local v14    # "wrap":Ljava/lang/Object;
    :cond_9
    invoke-static {v1, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 3799
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v14

    invoke-virtual {v14, v1, v2, v6, v13}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v13

    .line 3800
    .local v13, "wrap":Ljava/lang/Object;
    const-string v14, "hippoException"

    invoke-static {v11, v14, v13, v12}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3804
    .end local v13    # "wrap":Ljava/lang/Object;
    :cond_a
    move-object v12, v11

    move-object v4, v12

    .line 3807
    .end local v5    # "errorMsg":Ljava/lang/String;
    .end local v6    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v7    # "type":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .end local v8    # "sourceUri":Ljava/lang/String;
    .end local v9    # "line":I
    .end local v10    # "args":[Ljava/lang/Object;
    .end local v11    # "errorObject":Lcom/trendmicro/hippo/Scriptable;
    .local v4, "obj":Ljava/lang/Object;
    :goto_2
    new-instance v5, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v5}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 3809
    .local v5, "catchScopeObject":Lcom/trendmicro/hippo/NativeObject;
    const/4 v6, 0x4

    move-object/from16 v7, p2

    invoke-virtual {v5, v7, v4, v6}, Lcom/trendmicro/hippo/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3812
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 3816
    nop

    .line 3817
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    const/4 v8, 0x6

    .line 3816
    const-string v9, "__exception__"

    invoke-virtual {v5, v9, v6, v8}, Lcom/trendmicro/hippo/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3821
    :cond_b
    if-eqz v3, :cond_c

    .line 3822
    invoke-virtual {v5, v0, v4}, Lcom/trendmicro/hippo/NativeObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3824
    :cond_c
    return-object v5

    .line 3770
    .end local v5    # "catchScopeObject":Lcom/trendmicro/hippo/NativeObject;
    .local v4, "javaException":Ljava/lang/Throwable;
    :cond_d
    move-object/from16 v7, p2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
.end method

.method static newNativeError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$NativeErrors;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1202
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 1203
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/TopLevel;->getNativeErrorCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$NativeErrors;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    .line 1204
    .local v0, "ctor":Lcom/trendmicro/hippo/Function;
    if-nez p3, :cond_0

    sget-object p3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1205
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1183
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 1184
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getExistingCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    .line 1185
    .local v0, "ctor":Lcom/trendmicro/hippo/Function;
    if-nez p3, :cond_0

    sget-object p3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 1186
    :cond_0
    invoke-interface {v0, p0, p1, p3}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public static newObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "fun"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 2669
    instance-of v0, p0, Lcom/trendmicro/hippo/Function;

    if-eqz v0, :cond_0

    .line 2672
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Function;

    .line 2673
    .local v0, "function":Lcom/trendmicro/hippo/Function;
    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 2670
    .end local v0    # "function":Lcom/trendmicro/hippo/Function;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "propertyIds"    # [Ljava/lang/Object;
    .param p1, "propertyValues"    # [Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 4067
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 11
    .param p0, "propertyIds"    # [Ljava/lang/Object;
    .param p1, "propertyValues"    # [Ljava/lang/Object;
    .param p2, "getterSetters"    # [I
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 4075
    invoke-virtual {p3, p4}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 4076
    .local v0, "object":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, p0

    .local v2, "end":I
    :goto_0
    if-eq v1, v2, :cond_5

    .line 4077
    aget-object v3, p0, v1

    .line 4078
    .local v3, "id":Ljava/lang/Object;
    const/4 v4, 0x0

    if-nez p2, :cond_0

    move v5, v4

    goto :goto_1

    :cond_0
    aget v5, p2, v1

    .line 4079
    .local v5, "getterSetter":I
    :goto_1
    aget-object v6, p1, v1

    .line 4080
    .local v6, "value":Ljava/lang/Object;
    instance-of v7, v3, Ljava/lang/String;

    if-eqz v7, :cond_4

    .line 4081
    if-nez v5, :cond_2

    .line 4082
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isSpecialProperty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 4083
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-static {v0, v4, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;

    move-result-object v4

    .line 4084
    .local v4, "ref":Lcom/trendmicro/hippo/Ref;
    invoke-virtual {v4, p3, p4, v6}, Lcom/trendmicro/hippo/Ref;->set(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4085
    .end local v4    # "ref":Lcom/trendmicro/hippo/Ref;
    goto :goto_3

    .line 4086
    :cond_1
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v4, v0, v6}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_3

    .line 4089
    :cond_2
    move-object v7, v0

    check-cast v7, Lcom/trendmicro/hippo/ScriptableObject;

    .line 4090
    .local v7, "so":Lcom/trendmicro/hippo/ScriptableObject;
    move-object v8, v6

    check-cast v8, Lcom/trendmicro/hippo/Callable;

    .line 4091
    .local v8, "getterOrSetter":Lcom/trendmicro/hippo/Callable;
    const/4 v9, 0x1

    if-ne v5, v9, :cond_3

    goto :goto_2

    :cond_3
    move v9, v4

    .line 4092
    .local v9, "isSetter":Z
    :goto_2
    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v7, v10, v4, v8, v9}, Lcom/trendmicro/hippo/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 4093
    .end local v7    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v8    # "getterOrSetter":Lcom/trendmicro/hippo/Callable;
    .end local v9    # "isSetter":Z
    goto :goto_3

    .line 4095
    :cond_4
    move-object v4, v3

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 4096
    .local v4, "index":I
    invoke-interface {v0, v4, v0, v6}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 4076
    .end local v3    # "id":Ljava/lang/Object;
    .end local v4    # "index":I
    .end local v5    # "getterSetter":I
    .end local v6    # "value":Ljava/lang/Object;
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4099
    .end local v1    # "i":I
    .end local v2    # "end":I
    :cond_5
    return-object v0
.end method

.method public static newSpecial(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;[Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "fun"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "callType"    # I

    .line 2703
    const/4 v0, 0x1

    if-ne p4, v0, :cond_1

    .line 2704
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeGlobal;->isEvalFunction(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2705
    :cond_0
    const-string v0, "msg.not.ctor"

    const-string v1, "eval"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 2707
    :cond_1
    const/4 v0, 0x2

    if-ne p4, v0, :cond_3

    .line 2708
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeWith;->isWithFunction(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2709
    invoke-static {p0, p3, p2}, Lcom/trendmicro/hippo/NativeWith;->newWithSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2715
    :cond_2
    :goto_0
    invoke-static {p1, p0, p3, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->newObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 2712
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static notFoundError(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "object"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "property"    # Ljava/lang/String;

    .line 4323
    const-string v0, "msg.is.not.defined"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4324
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "ReferenceError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 4329
    invoke-static {p0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    return-object v0
.end method

.method public static notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "messageHelper"    # Ljava/lang/Object;

    .line 4336
    if-nez p1, :cond_0

    .line 4337
    const-string v0, "null"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4338
    .local v0, "msg":Ljava/lang/String;
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p0, v1, :cond_1

    .line 4339
    const-string v1, "msg.function.not.found"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1

    .line 4341
    :cond_1
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.isnt.function"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "propertyName"    # Ljava/lang/String;

    .line 4348
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4349
    .local v0, "objString":Ljava/lang/String;
    instance-of v1, p0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v1, :cond_0

    .line 4351
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 4352
    .local v1, "paren":I
    const/16 v2, 0x7b

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 4353
    .local v2, "curly":I
    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 4354
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "...}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4357
    .end local v1    # "paren":I
    .end local v2    # "curly":I
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v1, :cond_1

    .line 4358
    const-string v1, "msg.function.not.found.in"

    invoke-static {v1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1

    .line 4361
    :cond_1
    nop

    .line 4362
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 4361
    const-string v2, "msg.isnt.function.in"

    invoke-static {v2, p2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method private static notXmlError(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .line 4367
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.isnt.xml.object"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static numberToString(DI)Ljava/lang/String;
    .locals 3
    .param p0, "d"    # D
    .param p2, "base"    # I

    .line 914
    const/4 v0, 0x2

    if-lt p2, v0, :cond_6

    const/16 v0, 0x24

    if-gt p2, v0, :cond_6

    .line 919
    cmpl-double v0, p0, p0

    if-eqz v0, :cond_0

    .line 920
    const-string v0, "NaN"

    return-object v0

    .line 921
    :cond_0
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v0, p0, v0

    if-nez v0, :cond_1

    .line 922
    const-string v0, "Infinity"

    return-object v0

    .line 923
    :cond_1
    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v0, p0, v0

    if-nez v0, :cond_2

    .line 924
    const-string v0, "-Infinity"

    return-object v0

    .line 925
    :cond_2
    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-nez v0, :cond_3

    .line 926
    const-string v0, "0"

    return-object v0

    .line 928
    :cond_3
    const/16 v0, 0xa

    if-eq p2, v0, :cond_4

    .line 929
    invoke-static {p2, p0, p1}, Lcom/trendmicro/hippo/DToA;->JS_dtobasestr(ID)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 933
    :cond_4
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->numberToString(D)Ljava/lang/String;

    move-result-object v0

    .line 934
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_5

    .line 935
    return-object v0

    .line 937
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 938
    .local v1, "buffer":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    invoke-static {v1, v2, v2, p0, p1}, Lcom/trendmicro/hippo/DToA;->JS_dtostr(Ljava/lang/StringBuilder;IID)V

    .line 939
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 915
    .end local v0    # "result":Ljava/lang/String;
    .end local v1    # "buffer":Ljava/lang/StringBuilder;
    :cond_6
    nop

    .line 916
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 915
    const-string v1, "msg.bad.radix"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public static padArguments([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "count"    # I

    .line 746
    array-length v0, p0

    if-ge p1, v0, :cond_0

    .line 747
    return-object p0

    .line 750
    :cond_0
    new-array v0, p1, [Ljava/lang/Object;

    .line 751
    .local v0, "result":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 752
    aget-object v2, p0, v1

    aput-object v2, v0, v1

    .line 751
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 755
    :cond_1
    :goto_1
    if-ge v1, p1, :cond_2

    .line 756
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aput-object v2, v0, v1

    .line 755
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 759
    :cond_2
    return-object v0
.end method

.method public static propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3007
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "incrDecrMask"    # I

    .line 3014
    invoke-static {p2, p0, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 3015
    .local v0, "start":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_2

    .line 3019
    move-object v1, v0

    .line 3023
    .local v1, "target":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-interface {v1, p1, v0}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 3024
    .local v2, "value":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_1

    .line 3025
    nop

    .line 3032
    invoke-static {v1, p1, v0, v2, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->doScriptableIncrDecr(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 3027
    :cond_1
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 3028
    if-nez v1, :cond_0

    .line 3029
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    invoke-interface {v0, p1, v0, v3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 3030
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v3

    .line 3016
    .end local v1    # "target":Lcom/trendmicro/hippo/Scriptable;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static rangeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .line 4262
    const-string v0, "RangeError"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static refDel(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1849
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Ref;->delete(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static refGet(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1829
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Ref;->get(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refIncrDecr(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;I)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "incrDecrMask"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3111
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, v0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->refIncrDecr(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refIncrDecr(Lcom/trendmicro/hippo/Ref;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 7
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "incrDecrMask"    # I

    .line 3117
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Ref;->get(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 3118
    .local v0, "value":Ljava/lang/Object;
    and-int/lit8 v1, p3, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 3120
    .local v1, "post":Z
    :goto_0
    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_1

    .line 3121
    move-object v2, v0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .local v2, "number":D
    goto :goto_1

    .line 3123
    .end local v2    # "number":D
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 3124
    .restart local v2    # "number":D
    if-eqz v1, :cond_2

    .line 3126
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 3129
    :cond_2
    :goto_1
    and-int/lit8 v4, p3, 0x1

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-nez v4, :cond_3

    .line 3130
    add-double/2addr v2, v5

    goto :goto_2

    .line 3132
    :cond_3
    sub-double/2addr v2, v5

    .line 3134
    :goto_2
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .line 3135
    .local v4, "result":Ljava/lang/Number;
    invoke-virtual {p0, p1, p2, v4}, Lcom/trendmicro/hippo/Ref;->set(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3136
    if-eqz v1, :cond_4

    .line 3137
    return-object v0

    .line 3139
    :cond_4
    return-object v4
.end method

.method public static refSet(Lcom/trendmicro/hippo/Ref;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1838
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->refSet(Lcom/trendmicro/hippo/Ref;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static refSet(Lcom/trendmicro/hippo/Ref;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Lcom/trendmicro/hippo/Ref;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1844
    invoke-virtual {p0, p2, p3, p1}, Lcom/trendmicro/hippo/Ref;->set(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static same(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .line 3246
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3247
    const/4 v0, 0x0

    return v0

    .line 3249
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_2

    .line 3250
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isNaN(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isNaN(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3251
    const/4 v0, 0x1

    return v0

    .line 3253
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 3255
    :cond_2
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static sameZero(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .line 3262
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3263
    const/4 v0, 0x0

    return v0

    .line 3265
    :cond_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_5

    .line 3266
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isNaN(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isNaN(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3267
    return v1

    .line 3269
    :cond_1
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 3270
    .local v2, "dx":D
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_4

    .line 3271
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 3272
    .local v4, "dy":D
    sget-wide v6, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    cmpl-double v0, v2, v6

    const-wide/16 v6, 0x0

    if-nez v0, :cond_2

    cmpl-double v0, v4, v6

    if-eqz v0, :cond_3

    :cond_2
    cmpl-double v0, v2, v6

    if-nez v0, :cond_4

    sget-wide v6, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    cmpl-double v0, v4, v6

    if-nez v0, :cond_4

    .line 3274
    :cond_3
    return v1

    .line 3277
    .end local v4    # "dy":D
    :cond_4
    invoke-static {v2, v3, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v0

    return v0

    .line 3279
    .end local v2    # "dx":D
    :cond_5
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static searchDefaultNamespace(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1316
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 1317
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 1318
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1322
    :cond_0
    :goto_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 1323
    .local v1, "parent":Lcom/trendmicro/hippo/Scriptable;
    const-string v2, "__default_namespace__"

    if-nez v1, :cond_1

    .line 1324
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1325
    .local v2, "nsObject":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v3, :cond_2

    .line 1326
    const/4 v3, 0x0

    return-object v3

    .line 1330
    .end local v2    # "nsObject":Ljava/lang/Object;
    :cond_1
    invoke-interface {v0, v2, v0}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 1331
    .restart local v2    # "nsObject":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_3

    .line 1332
    nop

    .line 1336
    .end local v1    # "parent":Lcom/trendmicro/hippo/Scriptable;
    :cond_2
    return-object v2

    .line 1334
    .restart local v1    # "parent":Lcom/trendmicro/hippo/Scriptable;
    :cond_3
    move-object v0, v1

    .line 1335
    .end local v1    # "parent":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_0
.end method

.method public static setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V
    .locals 1
    .param p0, "object"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 3970
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 3971
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3972
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3973
    return-void
.end method

.method public static setConst(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "bound"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "id"    # Ljava/lang/String;

    .line 2147
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 2148
    invoke-interface {p0, p3, p0, p1}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 2150
    :cond_0
    invoke-static {p0, p3, p1}, Lcom/trendmicro/hippo/ScriptableObject;->putConstProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2152
    :goto_0
    return-object p1
.end method

.method public static setDefaultNamespace(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 5
    .param p0, "namespace"    # Ljava/lang/Object;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1293
    iget-object v0, p1, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 1294
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 1295
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1298
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->currentXMLLib(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v1

    .line 1299
    .local v1, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    invoke-virtual {v1, p1, p0}, Lcom/trendmicro/hippo/xml/XMLLib;->toDefaultXmlNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1302
    .local v2, "ns":Ljava/lang/Object;
    const-string v3, "__default_namespace__"

    invoke-interface {v0, v3, v0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1304
    const/4 v4, 0x6

    invoke-static {v0, v3, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_0

    .line 1308
    :cond_1
    invoke-interface {v0, v3, v0, v2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 1311
    :goto_0
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v3
.end method

.method public static setEnumNumbers(Ljava/lang/Object;Z)V
    .locals 1
    .param p0, "enumObj"    # Ljava/lang/Object;
    .param p1, "enumNumbers"    # Z

    .line 2298
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;

    iput-boolean p1, v0, Lcom/trendmicro/hippo/ScriptRuntime$IdEnumeration;->enumNumbers:Z

    .line 2299
    return-void
.end method

.method public static setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p0, "fn"    # Lcom/trendmicro/hippo/BaseFunction;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3951
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/BaseFunction;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3952
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/BaseFunction;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3953
    return-void
.end method

.method public static setName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "bound"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "id"    # Ljava/lang/String;

    .line 2101
    if-eqz p0, :cond_0

    .line 2104
    invoke-static {p0, p4, p1}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 2109
    :cond_0
    const/16 v0, 0xb

    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x8

    .line 2110
    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2112
    :cond_1
    nop

    .line 2113
    const-string v0, "msg.assn.create.strict"

    invoke-static {v0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2112
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 2116
    :cond_2
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2117
    iget-boolean v0, p2, Lcom/trendmicro/hippo/Context;->useDynamicScope:Z

    if-eqz v0, :cond_3

    .line 2118
    iget-object v0, p2, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDynamicScope(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2120
    :cond_3
    invoke-interface {p0, p4, p0, p1}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2122
    :goto_0
    return-object p1
.end method

.method public static setObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1697
    instance-of v0, p0, Lcom/trendmicro/hippo/xml/XMLObject;

    if-eqz v0, :cond_0

    .line 1698
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/xml/XMLObject;

    invoke-virtual {v0, p3, p1, p2}, Lcom/trendmicro/hippo/xml/XMLObject;->put(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 1699
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1700
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Symbol;

    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;Ljava/lang/Object;)V

    goto :goto_0

    .line 1702
    :cond_1
    invoke-static {p3, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1703
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 1704
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v1

    .line 1705
    .local v1, "index":I
    invoke-static {p0, v1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)V

    .line 1706
    .end local v1    # "index":I
    goto :goto_0

    .line 1707
    :cond_2
    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1711
    .end local v0    # "s":Ljava/lang/String;
    :goto_0
    return-object p2
.end method

.method public static setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1678
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "elem"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1687
    invoke-static {p3, p0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1688
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 1691
    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1689
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static setObjectIndex(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 0
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1784
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)V

    .line 1785
    return-object p2
.end method

.method public static setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1757
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "dblIndex"    # D
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p5, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1768
    invoke-static {p4, p0, p5}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1769
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 1773
    double-to-int v1, p1

    .line 1774
    .local v1, "index":I
    int-to-double v2, v1

    cmpl-double v2, v2, p1

    if-nez v2, :cond_0

    .line 1775
    invoke-static {v0, v1, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectIndex(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 1777
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v2

    .line 1778
    .local v2, "s":Ljava/lang/String;
    invoke-static {v0, v2, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 1770
    .end local v1    # "index":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static setObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 0
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1743
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1744
    return-object p2
.end method

.method public static setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1723
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1733
    invoke-static {p3, p0, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 1734
    .local v0, "sobj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 1737
    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1735
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p0, "object"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3959
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 3960
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3961
    nop

    .line 3962
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 3963
    .local v0, "proto":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 3964
    return-void
.end method

.method public static setRegExpProxy(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/RegExpProxy;)V
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "proxy"    # Lcom/trendmicro/hippo/RegExpProxy;

    .line 4388
    if-eqz p1, :cond_0

    .line 4389
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->regExpProxy:Lcom/trendmicro/hippo/RegExpProxy;

    .line 4390
    return-void

    .line 4388
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 6
    .param p0, "x"    # Ljava/lang/Object;
    .param p1, "y"    # Ljava/lang/Object;

    .line 3363
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, p1, :cond_2

    .line 3364
    instance-of v2, p0, Ljava/lang/Number;

    if-nez v2, :cond_0

    .line 3365
    return v1

    .line 3368
    :cond_0
    move-object v2, p0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 3369
    .local v2, "d":D
    cmpl-double v4, v2, v2

    if-nez v4, :cond_1

    move v0, v1

    :cond_1
    return v0

    .line 3371
    .end local v2    # "d":D
    :cond_2
    if-eqz p0, :cond_c

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v2, :cond_c

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    if-ne p0, v2, :cond_3

    goto :goto_0

    .line 3375
    :cond_3
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_5

    .line 3376
    instance-of v2, p1, Ljava/lang/Number;

    if-eqz v2, :cond_9

    .line 3377
    move-object v2, p0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    move-object v4, p1

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    cmpl-double v2, v2, v4

    if-nez v2, :cond_4

    move v0, v1

    :cond_4
    return v0

    .line 3379
    :cond_5
    instance-of v2, p0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_6

    .line 3380
    instance-of v1, p1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_9

    .line 3381
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 3383
    :cond_6
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    .line 3384
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_9

    .line 3385
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 3387
    :cond_7
    instance-of v2, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_a

    .line 3388
    instance-of v2, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_9

    instance-of v2, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_9

    .line 3389
    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    move-object v3, p1

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    if-ne v2, v3, :cond_8

    move v0, v1

    :cond_8
    return v0

    .line 3395
    :cond_9
    return v0

    .line 3392
    :cond_a
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 3393
    if-ne p0, p1, :cond_b

    move v0, v1

    :cond_b
    return v0

    .line 3372
    :cond_c
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v2, :cond_d

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    if-eq p1, v2, :cond_e

    :cond_d
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    if-ne p0, v2, :cond_f

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v2, :cond_f

    .line 3373
    :cond_e
    return v1

    .line 3374
    :cond_f
    return v0
.end method

.method public static specialRef(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Ref;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "specialProperty"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1864
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;

    move-result-object v0

    return-object v0
.end method

.method public static specialRef(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Ref;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "specialProperty"    # Ljava/lang/String;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1870
    invoke-static {p2, p3, p0, p1}, Lcom/trendmicro/hippo/SpecialRef;->createSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/String;)Lcom/trendmicro/hippo/Ref;

    move-result-object v0

    return-object v0
.end method

.method private static storeIndexResult(Lcom/trendmicro/hippo/Context;I)V
    .locals 0
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "index"    # I

    .line 4483
    iput p1, p0, Lcom/trendmicro/hippo/Context;->scratchIndex:I

    .line 4484
    return-void
.end method

.method private static storeScriptable(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "value"    # Lcom/trendmicro/hippo/Scriptable;

    .line 4509
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->scratchScriptable:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 4511
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->scratchScriptable:Lcom/trendmicro/hippo/Scriptable;

    .line 4512
    return-void

    .line 4510
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public static storeUint32Result(Lcom/trendmicro/hippo/Context;J)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "value"    # J

    .line 4493
    const/16 v0, 0x20

    ushr-long v0, p1, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 4495
    iput-wide p1, p0, Lcom/trendmicro/hippo/Context;->scratchUint32:J

    .line 4496
    return-void

    .line 4494
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static strictSetName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "bound"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "id"    # Ljava/lang/String;

    .line 2127
    if-eqz p0, :cond_0

    .line 2136
    invoke-static {p0, p4, p1}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2137
    return-object p1

    .line 2140
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Assignment to undefined \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\" in strict mode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2141
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "ReferenceError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method static stringPrefixToNumber(Ljava/lang/String;II)D
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "radix"    # I

    .line 472
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-static {p0, p1, v0, p2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->stringToNumber(Ljava/lang/String;IIIZ)D

    move-result-wide v0

    return-wide v0
.end method

.method static stringToNumber(Ljava/lang/String;III)D
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "radix"    # I

    .line 476
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->stringToNumber(Ljava/lang/String;IIIZ)D

    move-result-wide v0

    return-wide v0
.end method

.method private static stringToNumber(Ljava/lang/String;IIIZ)D
    .locals 35
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "sourceStart"    # I
    .param p2, "sourceEnd"    # I
    .param p3, "radix"    # I
    .param p4, "isPrefix"    # Z

    .line 483
    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p3

    const/16 v0, 0x39

    .line 484
    .local v0, "digitMax":C
    const/16 v4, 0x61

    .line 485
    .local v4, "lowerCaseBound":C
    const/16 v5, 0x41

    .line 486
    .local v5, "upperCaseBound":C
    const/4 v6, 0x1

    const/16 v7, 0xa

    if-ge v3, v7, :cond_0

    .line 487
    add-int/lit8 v8, v3, 0x30

    sub-int/2addr v8, v6

    int-to-char v0, v8

    move v8, v0

    goto :goto_0

    .line 486
    :cond_0
    move v8, v0

    .line 489
    .end local v0    # "digitMax":C
    .local v8, "digitMax":C
    :goto_0
    if-le v3, v7, :cond_1

    .line 490
    add-int/lit8 v0, v3, 0x61

    sub-int/2addr v0, v7

    int-to-char v4, v0

    .line 491
    add-int/lit8 v0, v3, 0x41

    sub-int/2addr v0, v7

    int-to-char v5, v0

    .line 494
    :cond_1
    const-wide/16 v9, 0x0

    .line 495
    .local v9, "sum":D
    move/from16 v0, p1

    move-wide v10, v9

    move v9, v0

    .local v9, "end":I
    .local v10, "sum":D
    :goto_1
    const/16 v0, 0x61

    const/16 v12, 0x30

    move/from16 v13, p2

    if-gt v9, v13, :cond_5

    .line 496
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v14

    .line 498
    .local v14, "c":C
    if-gt v12, v14, :cond_2

    if-gt v14, v8, :cond_2

    .line 499
    add-int/lit8 v0, v14, -0x30

    .local v0, "newDigit":I
    goto :goto_2

    .line 500
    .end local v0    # "newDigit":I
    :cond_2
    if-gt v0, v14, :cond_3

    if-ge v14, v4, :cond_3

    .line 501
    add-int/lit8 v0, v14, -0x61

    add-int/2addr v0, v7

    .restart local v0    # "newDigit":I
    goto :goto_2

    .line 502
    .end local v0    # "newDigit":I
    :cond_3
    const/16 v15, 0x41

    if-gt v15, v14, :cond_4

    if-ge v14, v5, :cond_4

    .line 503
    add-int/lit8 v0, v14, -0x41

    add-int/2addr v0, v7

    .line 508
    .restart local v0    # "newDigit":I
    :goto_2
    int-to-double v6, v3

    mul-double/2addr v6, v10

    move/from16 v17, v4

    move/from16 v18, v5

    .end local v4    # "lowerCaseBound":C
    .end local v5    # "upperCaseBound":C
    .local v17, "lowerCaseBound":C
    .local v18, "upperCaseBound":C
    int-to-double v4, v0

    add-double v10, v6, v4

    .line 495
    .end local v0    # "newDigit":I
    .end local v14    # "c":C
    add-int/lit8 v9, v9, 0x1

    move/from16 v4, v17

    move/from16 v5, v18

    const/4 v6, 0x1

    const/16 v7, 0xa

    goto :goto_1

    .line 502
    .end local v17    # "lowerCaseBound":C
    .end local v18    # "upperCaseBound":C
    .restart local v4    # "lowerCaseBound":C
    .restart local v5    # "upperCaseBound":C
    .restart local v14    # "c":C
    :cond_4
    move/from16 v17, v4

    move/from16 v18, v5

    .line 504
    .end local v4    # "lowerCaseBound":C
    .end local v5    # "upperCaseBound":C
    .restart local v17    # "lowerCaseBound":C
    .restart local v18    # "upperCaseBound":C
    if-nez p4, :cond_6

    .line 505
    sget-wide v4, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v4

    .line 495
    .end local v14    # "c":C
    .end local v17    # "lowerCaseBound":C
    .end local v18    # "upperCaseBound":C
    .restart local v4    # "lowerCaseBound":C
    .restart local v5    # "upperCaseBound":C
    :cond_5
    move/from16 v17, v4

    move/from16 v18, v5

    .line 510
    .end local v4    # "lowerCaseBound":C
    .end local v5    # "upperCaseBound":C
    .restart local v17    # "lowerCaseBound":C
    .restart local v18    # "upperCaseBound":C
    :cond_6
    if-ne v2, v9, :cond_7

    .line 511
    sget-wide v4, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v4

    .line 513
    :cond_7
    const-wide v4, 0x433fffffffffffffL    # 9.007199254740991E15

    cmpl-double v4, v10, v4

    if-lez v4, :cond_1b

    .line 514
    const/16 v4, 0xa

    if-ne v3, v4, :cond_8

    .line 521
    :try_start_0
    invoke-virtual {v1, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v4

    .line 522
    :catch_0
    move-exception v0

    .line 523
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    sget-wide v4, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v4

    .line 525
    .end local v0    # "nfe":Ljava/lang/NumberFormatException;
    :cond_8
    const/4 v4, 0x2

    const/4 v5, 0x4

    if-eq v3, v4, :cond_9

    if-eq v3, v5, :cond_9

    const/16 v6, 0x8

    if-eq v3, v6, :cond_9

    const/16 v6, 0x10

    if-eq v3, v6, :cond_9

    const/16 v6, 0x20

    if-ne v3, v6, :cond_1b

    .line 538
    :cond_9
    const/4 v6, 0x1

    .line 539
    .local v6, "bitShiftInChar":I
    const/4 v7, 0x0

    .line 541
    .local v7, "digit":I
    const/4 v14, 0x0

    .line 542
    .local v14, "SKIP_LEADING_ZEROS":I
    const/16 v16, 0x1

    .line 543
    .local v16, "FIRST_EXACT_53_BITS":I
    const/16 v19, 0x2

    .line 544
    .local v19, "AFTER_BIT_53":I
    const/16 v20, 0x3

    .line 545
    .local v20, "ZEROS_AFTER_54":I
    const/16 v21, 0x4

    .line 547
    .local v21, "MIXED_AFTER_54":I
    const/16 v22, 0x0

    .line 548
    .local v22, "state":I
    const/16 v23, 0x35

    .line 549
    .local v23, "exactBitsLimit":I
    const-wide/16 v24, 0x0

    .line 550
    .local v24, "factor":D
    const/16 v26, 0x0

    .line 552
    .local v26, "bit53":Z
    const/16 v27, 0x0

    .line 553
    .local v27, "bit54":Z
    move/from16 v28, p1

    move/from16 v15, v22

    move/from16 v4, v28

    .line 556
    .end local v22    # "state":I
    .local v4, "pos":I
    .local v15, "state":I
    :goto_3
    const/4 v0, 0x3

    const-wide/high16 v30, 0x3ff0000000000000L    # 1.0

    const/4 v12, 0x1

    if-ne v6, v12, :cond_12

    .line 557
    if-ne v4, v9, :cond_f

    .line 558
    nop

    .line 604
    if-eqz v15, :cond_e

    if-eq v15, v0, :cond_c

    if-eq v15, v5, :cond_a

    goto/16 :goto_8

    .line 622
    :cond_a
    if-eqz v27, :cond_b

    .line 623
    add-double v10, v10, v30

    .line 624
    :cond_b
    mul-double v10, v10, v24

    goto/16 :goto_8

    .line 615
    :cond_c
    and-int v0, v27, v26

    if-eqz v0, :cond_d

    .line 616
    add-double v10, v10, v30

    .line 617
    :cond_d
    mul-double v10, v10, v24

    .line 618
    goto/16 :goto_8

    .line 606
    :cond_e
    const-wide/16 v10, 0x0

    .line 607
    goto/16 :goto_8

    .line 559
    :cond_f
    add-int/lit8 v22, v4, 0x1

    .end local v4    # "pos":I
    .local v22, "pos":I
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 560
    .end local v7    # "digit":I
    .local v4, "digit":I
    const/16 v7, 0x30

    if-gt v7, v4, :cond_10

    const/16 v7, 0x39

    if-gt v4, v7, :cond_10

    .line 561
    add-int/lit8 v4, v4, -0x30

    goto :goto_4

    .line 562
    :cond_10
    const/16 v7, 0x61

    if-gt v7, v4, :cond_11

    const/16 v7, 0x7a

    if-gt v4, v7, :cond_11

    .line 563
    add-int/lit8 v4, v4, -0x57

    goto :goto_4

    .line 565
    :cond_11
    add-int/lit8 v4, v4, -0x37

    .line 566
    :goto_4
    move/from16 v6, p3

    move v7, v4

    move/from16 v4, v22

    const/16 v22, 0x61

    const/16 v29, 0x30

    goto :goto_5

    .line 556
    .end local v22    # "pos":I
    .local v4, "pos":I
    .restart local v7    # "digit":I
    :cond_12
    const/16 v22, 0x61

    const/16 v29, 0x30

    .line 568
    :goto_5
    const/4 v12, 0x1

    shr-int/2addr v6, v12

    .line 569
    and-int v32, v7, v6

    if-eqz v32, :cond_13

    const/16 v32, 0x1

    goto :goto_6

    :cond_13
    const/16 v32, 0x0

    .line 571
    .local v32, "bit":Z
    :goto_6
    if-eqz v15, :cond_19

    const-wide/high16 v33, 0x4000000000000000L    # 2.0

    const/4 v12, 0x1

    if-eq v15, v12, :cond_17

    const/4 v12, 0x2

    if-eq v15, v12, :cond_16

    if-eq v15, v0, :cond_14

    if-eq v15, v5, :cond_15

    goto :goto_7

    .line 595
    :cond_14
    if-eqz v32, :cond_15

    .line 596
    const/4 v15, 0x4

    .line 600
    :cond_15
    mul-double v24, v24, v33

    goto :goto_7

    .line 590
    :cond_16
    move/from16 v0, v32

    .line 591
    .end local v27    # "bit54":Z
    .local v0, "bit54":Z
    const-wide/high16 v24, 0x4000000000000000L    # 2.0

    .line 592
    const/4 v15, 0x3

    .line 593
    move/from16 v27, v0

    goto :goto_7

    .line 580
    .end local v0    # "bit54":Z
    .restart local v27    # "bit54":Z
    :cond_17
    const/4 v12, 0x2

    mul-double v10, v10, v33

    .line 581
    if-eqz v32, :cond_18

    .line 582
    add-double v10, v10, v30

    .line 583
    :cond_18
    add-int/lit8 v23, v23, -0x1

    .line 584
    if-nez v23, :cond_1a

    .line 585
    move/from16 v0, v32

    .line 586
    .end local v26    # "bit53":Z
    .local v0, "bit53":Z
    const/4 v15, 0x2

    move/from16 v26, v0

    goto :goto_7

    .line 573
    .end local v0    # "bit53":Z
    .restart local v26    # "bit53":Z
    :cond_19
    const/4 v12, 0x2

    if-eqz v32, :cond_1a

    .line 574
    add-int/lit8 v23, v23, -0x1

    .line 575
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    .line 576
    const/4 v0, 0x1

    move v15, v0

    .line 603
    .end local v32    # "bit":Z
    :cond_1a
    :goto_7
    move/from16 v0, v22

    move/from16 v12, v29

    goto/16 :goto_3

    .line 630
    .end local v4    # "pos":I
    .end local v6    # "bitShiftInChar":I
    .end local v7    # "digit":I
    .end local v14    # "SKIP_LEADING_ZEROS":I
    .end local v15    # "state":I
    .end local v16    # "FIRST_EXACT_53_BITS":I
    .end local v19    # "AFTER_BIT_53":I
    .end local v20    # "ZEROS_AFTER_54":I
    .end local v21    # "MIXED_AFTER_54":I
    .end local v23    # "exactBitsLimit":I
    .end local v24    # "factor":D
    .end local v26    # "bit53":Z
    .end local v27    # "bit54":Z
    :cond_1b
    :goto_8
    return-wide v10
.end method

.method public static testUint32String(Ljava/lang/String;)J
    .locals 15
    .param p0, "str"    # Ljava/lang/String;

    .line 1424
    const/16 v0, 0xa

    .line 1426
    .local v0, "MAX_VALUE_LENGTH":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1427
    .local v1, "len":I
    const-wide/16 v2, -0x1

    const/4 v4, 0x1

    if-gt v4, v1, :cond_5

    const/16 v5, 0xa

    if-gt v1, v5, :cond_5

    .line 1428
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1429
    .local v5, "c":I
    add-int/lit8 v5, v5, -0x30

    .line 1430
    const-wide/16 v6, 0x0

    if-nez v5, :cond_1

    .line 1432
    if-ne v1, v4, :cond_0

    move-wide v2, v6

    :cond_0
    return-wide v2

    .line 1434
    :cond_1
    if-gt v4, v5, :cond_5

    const/16 v4, 0x9

    if-gt v5, v4, :cond_5

    .line 1435
    int-to-long v8, v5

    .line 1436
    .local v8, "v":J
    const/4 v10, 0x1

    .local v10, "i":I
    :goto_0
    if-eq v10, v1, :cond_4

    .line 1437
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v11

    add-int/lit8 v5, v11, -0x30

    .line 1438
    if-ltz v5, :cond_3

    if-le v5, v4, :cond_2

    goto :goto_1

    .line 1441
    :cond_2
    const-wide/16 v11, 0xa

    mul-long/2addr v11, v8

    int-to-long v13, v5

    add-long v8, v11, v13

    .line 1436
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 1439
    :cond_3
    :goto_1
    return-wide v2

    .line 1444
    .end local v10    # "i":I
    :cond_4
    const/16 v4, 0x20

    ushr-long v10, v8, v4

    cmp-long v4, v10, v6

    if-nez v4, :cond_5

    .line 1445
    return-wide v8

    .line 1449
    .end local v5    # "c":I
    .end local v8    # "v":J
    :cond_5
    return-wide v2
.end method

.method public static throwCustomError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .line 4577
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput v2, v1, v2

    .line 4578
    .local v1, "linep":[I
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v3

    .line 4579
    .local v3, "filename":Ljava/lang/String;
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p3, v4, v2

    aput-object v3, v4, v0

    aget v0, v1, v2

    .line 4580
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v5, 0x2

    aput-object v0, v4, v5

    .line 4579
    invoke-virtual {p0, p1, p2, v4}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 4581
    .local v0, "error":Lcom/trendmicro/hippo/Scriptable;
    new-instance v4, Lcom/trendmicro/hippo/JavaScriptException;

    aget v2, v1, v2

    invoke-direct {v4, v0, v3, v2}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    return-object v4
.end method

.method public static throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;
    .locals 7
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "message"    # Ljava/lang/String;

    .line 4560
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput v2, v1, v2

    .line 4561
    .local v1, "linep":[I
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v3

    .line 4562
    .local v3, "filename":Ljava/lang/String;
    sget-object v4, Lcom/trendmicro/hippo/TopLevel$Builtins;->Error:Lcom/trendmicro/hippo/TopLevel$Builtins;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v2

    aput-object v3, v5, v0

    aget v0, v1, v2

    .line 4563
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x2

    aput-object v0, v5, v6

    .line 4562
    invoke-static {p0, p1, v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->newBuiltinObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 4564
    .local v0, "error":Lcom/trendmicro/hippo/Scriptable;
    new-instance v4, Lcom/trendmicro/hippo/JavaScriptException;

    aget v2, v1, v2

    invoke-direct {v4, v0, v3, v2}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    return-object v4
.end method

.method public static toBoolean(Ljava/lang/Object;)Z
    .locals 7
    .param p0, "val"    # Ljava/lang/Object;

    .line 390
    :cond_0
    :goto_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 391
    move-object v0, p0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 392
    :cond_1
    const/4 v0, 0x0

    if-eqz p0, :cond_b

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v1, :cond_2

    goto :goto_1

    .line 394
    :cond_2
    instance-of v1, p0, Ljava/lang/CharSequence;

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 395
    move-object v1, p0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-eqz v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 396
    :cond_4
    instance-of v1, p0, Ljava/lang/Number;

    if-eqz v1, :cond_6

    .line 397
    move-object v1, p0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 398
    .local v3, "d":D
    cmpl-double v1, v3, v3

    if-nez v1, :cond_5

    const-wide/16 v5, 0x0

    cmpl-double v1, v3, v5

    if-eqz v1, :cond_5

    move v0, v2

    :cond_5
    return v0

    .line 400
    .end local v3    # "d":D
    :cond_6
    instance-of v1, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_a

    .line 401
    instance-of v1, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v1, :cond_7

    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject;

    .line 402
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ScriptableObject;->avoidObjectDetection()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 404
    return v0

    .line 406
    :cond_7
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isVersionECMA1()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 408
    return v2

    .line 411
    :cond_8
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 412
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_0

    .line 413
    :cond_9
    const-string v0, "msg.primitive.expected"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 416
    :cond_a
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 417
    return v2

    .line 393
    :cond_b
    :goto_1
    return v0
.end method

.method public static toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "val"    # Ljava/lang/Object;

    .line 848
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeString;

    if-eqz v0, :cond_0

    .line 849
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeString;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeString;->toCharSequence()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    .line 851
    :cond_0
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static toInt32(D)I
    .locals 1
    .param p0, "d"    # D

    .line 1263
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v0

    return v0
.end method

.method public static toInt32(Ljava/lang/Object;)I
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .line 1252
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 1253
    move-object v0, p0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 1255
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v0

    return v0
.end method

.method public static toInt32([Ljava/lang/Object;I)I
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .line 1259
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static toInteger(D)D
    .locals 5
    .param p0, "d"    # D

    .line 1219
    cmpl-double v0, p0, p0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    .line 1220
    return-wide v1

    .line 1222
    :cond_0
    cmpl-double v0, p0, v1

    if-eqz v0, :cond_3

    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v0, p0, v3

    if-eqz v0, :cond_3

    const-wide/high16 v3, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v0, p0, v3

    if-nez v0, :cond_1

    goto :goto_0

    .line 1227
    :cond_1
    cmpl-double v0, p0, v1

    if-lez v0, :cond_2

    .line 1228
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    return-wide v0

    .line 1230
    :cond_2
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    return-wide v0

    .line 1225
    :cond_3
    :goto_0
    return-wide p0
.end method

.method public static toInteger(Ljava/lang/Object;)D
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .line 1213
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toInteger([Ljava/lang/Object;I)D
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .line 1234
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public static toIterator(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/Scriptable;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "keyOnly"    # Z

    .line 2190
    const-string v0, "__iterator__"

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2193
    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2195
    .local v0, "v":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_2

    .line 2198
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    .line 2199
    .local v1, "f":Lcom/trendmicro/hippo/Callable;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    if-eqz p3, :cond_0

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 2200
    :cond_0
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    aput-object v4, v2, v3

    .line 2201
    .local v2, "args":[Ljava/lang/Object;
    invoke-interface {v1, p0, p1, p2, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2202
    instance-of v3, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_1

    .line 2205
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    return-object v3

    .line 2203
    :cond_1
    const-string v3, "msg.iterator.primitive"

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 2196
    .end local v1    # "f":Lcom/trendmicro/hippo/Callable;
    .end local v2    # "args":[Ljava/lang/Object;
    :cond_2
    const-string v1, "msg.invalid.iterator"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2207
    .end local v0    # "v":Ljava/lang/Object;
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public static toLength([Ljava/lang/Object;I)J
    .locals 4
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .line 1238
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger([Ljava/lang/Object;I)D

    move-result-wide v0

    .line 1239
    .local v0, "len":D
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_0

    .line 1240
    const-wide/16 v2, 0x0

    return-wide v2

    .line 1242
    :cond_0
    const-wide v2, 0x433fffffffffffffL    # 9.007199254740991E15

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    double-to-long v2, v2

    return-wide v2
.end method

.method public static toNumber(Ljava/lang/Object;)D
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .line 429
    :cond_0
    :goto_0
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 430
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0

    .line 431
    :cond_1
    const-wide/16 v0, 0x0

    if-nez p0, :cond_2

    .line 432
    return-wide v0

    .line 433
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v2, :cond_3

    .line 434
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    .line 435
    :cond_3
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 436
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    .line 437
    :cond_4
    instance-of v2, p0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_5

    .line 438
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    .line 439
    :cond_5
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_7

    .line 440
    move-object v2, p0

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_6

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    :cond_6
    return-wide v0

    .line 441
    :cond_7
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_a

    .line 443
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_9

    .line 444
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 445
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_0

    .line 446
    :cond_8
    const-string v0, "msg.primitive.expected"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 449
    :cond_9
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 450
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v0

    .line 442
    :cond_a
    const-string v0, "msg.not.a.number"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static toNumber(Ljava/lang/String;)D
    .locals 17
    .param p0, "s"    # Ljava/lang/String;

    .line 639
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 642
    .local v2, "len":I
    const/4 v0, 0x0

    move v3, v0

    .line 645
    .local v3, "start":I
    :goto_0
    if-ne v3, v2, :cond_0

    .line 647
    const-wide/16 v4, 0x0

    return-wide v4

    .line 649
    :cond_0
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 650
    .local v4, "startChar":C
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 652
    nop

    .line 658
    add-int/lit8 v0, v2, -0x1

    move v5, v0

    .line 660
    .local v5, "end":I
    :goto_1
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    move v6, v0

    .local v6, "endChar":C
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 661
    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    .line 673
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v7

    .line 674
    .local v7, "cx":Lcom/trendmicro/hippo/Context;
    const/4 v0, 0x0

    const/4 v8, 0x1

    if-eqz v7, :cond_3

    .line 675
    invoke-virtual {v7}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v9

    const/16 v10, 0xc8

    if-ge v9, v10, :cond_2

    goto :goto_2

    :cond_2
    move v9, v0

    goto :goto_3

    :cond_3
    :goto_2
    move v9, v8

    .line 678
    .local v9, "oldParsingMode":Z
    :goto_3
    const/16 v10, 0x58

    const/16 v11, 0x78

    const/16 v12, 0x2b

    const/16 v13, 0x30

    const/16 v14, 0x2d

    if-ne v4, v13, :cond_c

    .line 679
    add-int/lit8 v15, v3, 0x2

    if-gt v15, v5, :cond_10

    .line 680
    add-int/lit8 v15, v3, 0x1

    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    .line 681
    .local v15, "radixC":C
    const/16 v16, -0x1

    .line 682
    .local v16, "radix":I
    if-eq v15, v11, :cond_9

    if-ne v15, v10, :cond_4

    goto :goto_4

    .line 684
    :cond_4
    if-nez v9, :cond_6

    const/16 v10, 0x6f

    if-eq v15, v10, :cond_5

    const/16 v10, 0x4f

    if-ne v15, v10, :cond_6

    .line 685
    :cond_5
    const/16 v16, 0x8

    move/from16 v10, v16

    goto :goto_5

    .line 686
    :cond_6
    if-nez v9, :cond_8

    const/16 v10, 0x62

    if-eq v15, v10, :cond_7

    const/16 v10, 0x42

    if-ne v15, v10, :cond_8

    .line 687
    :cond_7
    const/16 v16, 0x2

    move/from16 v10, v16

    goto :goto_5

    .line 689
    :cond_8
    move/from16 v10, v16

    goto :goto_5

    .line 683
    :cond_9
    :goto_4
    const/16 v16, 0x10

    move/from16 v10, v16

    .line 689
    .end local v16    # "radix":I
    .local v10, "radix":I
    :goto_5
    const/4 v11, -0x1

    if-eq v10, v11, :cond_b

    .line 690
    if-eqz v9, :cond_a

    .line 691
    add-int/lit8 v0, v3, 0x2

    invoke-static {v1, v0, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->stringPrefixToNumber(Ljava/lang/String;II)D

    move-result-wide v11

    return-wide v11

    .line 693
    :cond_a
    add-int/lit8 v0, v3, 0x2

    invoke-static {v1, v0, v5, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->stringToNumber(Ljava/lang/String;III)D

    move-result-wide v11

    return-wide v11

    .line 695
    .end local v10    # "radix":I
    .end local v15    # "radixC":C
    :cond_b
    goto :goto_7

    .line 696
    :cond_c
    if-eqz v9, :cond_10

    if-eq v4, v12, :cond_d

    if-ne v4, v14, :cond_10

    .line 698
    :cond_d
    add-int/lit8 v15, v3, 0x3

    if-gt v15, v5, :cond_10

    add-int/lit8 v15, v3, 0x1

    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-ne v15, v13, :cond_10

    .line 699
    add-int/lit8 v15, v3, 0x2

    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    .line 700
    .restart local v15    # "radixC":C
    if-eq v15, v11, :cond_e

    if-ne v15, v10, :cond_10

    .line 701
    :cond_e
    add-int/lit8 v0, v3, 0x3

    const/16 v8, 0x10

    invoke-static {v1, v0, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->stringPrefixToNumber(Ljava/lang/String;II)D

    move-result-wide v10

    .line 702
    .local v10, "val":D
    if-ne v4, v14, :cond_f

    neg-double v12, v10

    goto :goto_6

    :cond_f
    move-wide v12, v10

    :goto_6
    return-wide v12

    .line 707
    .end local v10    # "val":D
    .end local v15    # "radixC":C
    :cond_10
    :goto_7
    const/16 v10, 0x79

    if-ne v6, v10, :cond_15

    .line 709
    if-eq v4, v12, :cond_11

    if-ne v4, v14, :cond_12

    .line 710
    :cond_11
    add-int/lit8 v3, v3, 0x1

    .line 712
    :cond_12
    add-int/lit8 v8, v3, 0x7

    if-ne v8, v5, :cond_14

    const/16 v8, 0x8

    const-string v10, "Infinity"

    invoke-virtual {v1, v3, v10, v0, v8}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 713
    if-ne v4, v14, :cond_13

    .line 714
    const-wide/high16 v10, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    goto :goto_8

    .line 715
    :cond_13
    const-wide/high16 v10, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 713
    :goto_8
    return-wide v10

    .line 717
    :cond_14
    sget-wide v10, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v10

    .line 721
    :cond_15
    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 724
    .local v10, "sub":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v8

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_19

    .line 725
    invoke-virtual {v10, v0}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 726
    .local v8, "c":C
    if-gt v13, v8, :cond_16

    const/16 v11, 0x39

    if-le v8, v11, :cond_18

    :cond_16
    const/16 v11, 0x2e

    if-eq v8, v11, :cond_18

    const/16 v11, 0x65

    if-eq v8, v11, :cond_18

    const/16 v11, 0x45

    if-eq v8, v11, :cond_18

    if-eq v8, v12, :cond_18

    if-ne v8, v14, :cond_17

    .line 729
    goto :goto_a

    .line 730
    :cond_17
    sget-wide v11, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v11

    .line 724
    .end local v8    # "c":C
    :cond_18
    :goto_a
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 733
    .end local v0    # "i":I
    :cond_19
    :try_start_0
    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v11
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v11

    .line 734
    :catch_0
    move-exception v0

    move-object v8, v0

    move-object v0, v8

    .line 735
    .local v0, "ex":Ljava/lang/NumberFormatException;
    sget-wide v11, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    return-wide v11

    .line 654
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    .end local v5    # "end":I
    .end local v6    # "endChar":C
    .end local v7    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v9    # "oldParsingMode":Z
    .end local v10    # "sub":Ljava/lang/String;
    :cond_1a
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0
.end method

.method public static toNumber([Ljava/lang/Object;I)D
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .line 455
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    goto :goto_0

    :cond_0
    sget-wide v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    :goto_0
    return-wide v0
.end method

.method public static toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "val"    # Ljava/lang/Object;

    .line 1113
    if-eqz p2, :cond_7

    .line 1116
    invoke-static {p2}, Lcom/trendmicro/hippo/Undefined;->isUndefined(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 1120
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1121
    new-instance v0, Lcom/trendmicro/hippo/NativeSymbol;

    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeSymbol;-><init>(Lcom/trendmicro/hippo/NativeSymbol;)V

    .line 1122
    .local v0, "result":Lcom/trendmicro/hippo/NativeSymbol;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Symbol:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1123
    return-object v0

    .line 1125
    .end local v0    # "result":Lcom/trendmicro/hippo/NativeSymbol;
    :cond_0
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_1

    .line 1126
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 1128
    :cond_1
    instance-of v0, p2, Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    .line 1130
    new-instance v0, Lcom/trendmicro/hippo/NativeString;

    move-object v1, p2

    check-cast v1, Ljava/lang/CharSequence;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeString;-><init>(Ljava/lang/CharSequence;)V

    .line 1131
    .local v0, "result":Lcom/trendmicro/hippo/NativeString;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->String:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1132
    return-object v0

    .line 1134
    .end local v0    # "result":Lcom/trendmicro/hippo/NativeString;
    :cond_2
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 1135
    new-instance v0, Lcom/trendmicro/hippo/NativeNumber;

    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/NativeNumber;-><init>(D)V

    .line 1136
    .local v0, "result":Lcom/trendmicro/hippo/NativeNumber;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Number:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1137
    return-object v0

    .line 1139
    .end local v0    # "result":Lcom/trendmicro/hippo/NativeNumber;
    :cond_3
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    .line 1140
    new-instance v0, Lcom/trendmicro/hippo/NativeBoolean;

    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeBoolean;-><init>(Z)V

    .line 1141
    .local v0, "result":Lcom/trendmicro/hippo/NativeBoolean;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Boolean:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1142
    return-object v0

    .line 1146
    .end local v0    # "result":Lcom/trendmicro/hippo/NativeBoolean;
    :cond_4
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, p2, v1}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 1147
    .local v0, "wrapped":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_5

    .line 1148
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    return-object v1

    .line 1149
    :cond_5
    const-string v1, "msg.invalid.type"

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1117
    .end local v0    # "wrapped":Ljava/lang/Object;
    :cond_6
    const-string v0, "msg.undef.to.object"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 1114
    :cond_7
    const-string v0, "msg.null.to.object"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/trendmicro/hippo/Scriptable;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1159
    .local p3, "staticClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "val"    # Ljava/lang/Object;

    .line 1056
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 1057
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 1059
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/trendmicro/hippo/Scriptable;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1100
    .local p2, "staticClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 1101
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 1103
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1071
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 1072
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 1073
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p1, v0, :cond_1

    .line 1074
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 1076
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1085
    instance-of v0, p1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 1086
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 1087
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p1, v0, :cond_1

    .line 1088
    invoke-static {p0, p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 1090
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static toPrimitive(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "val"    # Ljava/lang/Object;

    .line 3143
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toPrimitive(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static toPrimitive(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 3148
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 3149
    return-object p0

    .line 3151
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 3152
    .local v0, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 3153
    .local v1, "result":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_2

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 3154
    :cond_1
    const-string v2, "msg.bad.default.value"

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 3155
    :cond_2
    :goto_0
    return-object v1
.end method

.method public static toString(D)Ljava/lang/String;
    .locals 1
    .param p0, "val"    # D

    .line 910
    const/16 v0, 0xa

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .line 861
    :cond_0
    :goto_0
    if-nez p0, :cond_1

    .line 862
    const-string v0, "null"

    return-object v0

    .line 864
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v0, :cond_9

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->SCRIPTABLE_UNDEFINED:Lcom/trendmicro/hippo/Scriptable;

    if-ne p0, v0, :cond_2

    goto :goto_1

    .line 867
    :cond_2
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 868
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 870
    :cond_3
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 871
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 873
    :cond_4
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_5

    .line 876
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 878
    :cond_5
    instance-of v0, p0, Lcom/trendmicro/hippo/Symbol;

    if-nez v0, :cond_8

    .line 881
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_7

    .line 882
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    .line 883
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_0

    .line 884
    :cond_6
    const-string v0, "msg.primitive.expected"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 888
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 879
    :cond_8
    const-string v0, "msg.not.a.string"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 865
    :cond_9
    :goto_1
    const-string v0, "undefined"

    return-object v0
.end method

.method public static toString([Ljava/lang/Object;I)Ljava/lang/String;
    .locals 1
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .line 903
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "undefined"

    :goto_0
    return-object v0
.end method

.method static toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "id"    # Ljava/lang/Object;

    .line 1485
    instance-of v0, p1, Ljava/lang/Number;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1486
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 1487
    .local v2, "d":D
    double-to-int v0, v2

    .line 1488
    .local v0, "index":I
    int-to-double v4, v0

    cmpl-double v4, v4, v2

    if-nez v4, :cond_0

    .line 1489
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->storeIndexResult(Lcom/trendmicro/hippo/Context;I)V

    .line 1490
    return-object v1

    .line 1492
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1495
    .end local v0    # "index":I
    .end local v2    # "d":D
    :cond_1
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 1496
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    .local v0, "s":Ljava/lang/String;
    goto :goto_0

    .line 1498
    .end local v0    # "s":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1500
    .restart local v0    # "s":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->indexFromString(Ljava/lang/String;)J

    move-result-wide v2

    .line 1501
    .local v2, "indexTest":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_3

    .line 1502
    long-to-int v4, v2

    invoke-static {p0, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->storeIndexResult(Lcom/trendmicro/hippo/Context;I)V

    .line 1503
    return-object v1

    .line 1505
    :cond_3
    return-object v0
.end method

.method public static toUint16(Ljava/lang/Object;)C
    .locals 3
    .param p0, "val"    # Ljava/lang/Object;

    .line 1283
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 1284
    .local v0, "d":D
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v2

    int-to-char v2, v2

    return v2
.end method

.method public static toUint32(D)J
    .locals 4
    .param p0, "d"    # D

    .line 1271
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleConversion;->doubleToInt32(D)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static toUint32(Ljava/lang/Object;)J
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .line 1275
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(D)J

    move-result-wide v0

    return-wide v0
.end method

.method private static topScopeName(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "name"    # Ljava/lang/String;

    .line 2028
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->useDynamicScope:Z

    if-eqz v0, :cond_0

    .line 2029
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDynamicScope(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 2031
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .line 4267
    const-string v0, "TypeError"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;

    .line 4272
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4273
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;

    .line 4278
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4279
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .line 4285
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4286
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/String;
    .param p2, "arg2"    # Ljava/lang/String;
    .param p3, "arg3"    # Ljava/lang/String;

    .line 4292
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 4293
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    return-object v1
.end method

.method public static typeErrorThrower()Lcom/trendmicro/hippo/BaseFunction;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 44
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeErrorThrower(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    return-object v0
.end method

.method public static typeErrorThrower(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/BaseFunction;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 52
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->typeErrorThrower:Lcom/trendmicro/hippo/BaseFunction;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lcom/trendmicro/hippo/ScriptRuntime$1;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ScriptRuntime$1;-><init>()V

    .line 65
    .local v0, "thrower":Lcom/trendmicro/hippo/BaseFunction;
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->topCallScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 66
    invoke-virtual {v0}, Lcom/trendmicro/hippo/BaseFunction;->preventExtensions()V

    .line 67
    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->typeErrorThrower:Lcom/trendmicro/hippo/BaseFunction;

    .line 69
    .end local v0    # "thrower":Lcom/trendmicro/hippo/BaseFunction;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->typeErrorThrower:Lcom/trendmicro/hippo/BaseFunction;

    return-object v0
.end method

.method public static typeof(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .line 2857
    const-string v0, "object"

    if-nez p0, :cond_0

    .line 2858
    return-object v0

    .line 2859
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v1, :cond_1

    .line 2860
    const-string v0, "undefined"

    return-object v0

    .line 2861
    :cond_1
    instance-of v1, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v1, :cond_2

    .line 2862
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject;->getTypeOf()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2863
    :cond_2
    instance-of v1, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_4

    .line 2864
    instance-of v1, p0, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_3

    const-string v0, "function"

    :cond_3
    return-object v0

    .line 2865
    :cond_4
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_5

    .line 2866
    const-string v0, "string"

    return-object v0

    .line 2867
    :cond_5
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_6

    .line 2868
    const-string v0, "number"

    return-object v0

    .line 2869
    :cond_6
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    .line 2870
    const-string v0, "boolean"

    return-object v0

    .line 2871
    :cond_7
    const-string v0, "msg.invalid.type"

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->errorWithClassName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public static typeofName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "id"    # Ljava/lang/String;

    .line 2879
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 2880
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v0, p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->bind(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2881
    .local v1, "val":Lcom/trendmicro/hippo/Scriptable;
    if-nez v1, :cond_0

    .line 2882
    const-string v2, "undefined"

    return-object v2

    .line 2883
    :cond_0
    invoke-static {v1, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static undefCallError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .line 4303
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.undef.method.call"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method private static undefDeleteError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .line 4316
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.undef.prop.delete"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;

    .line 4298
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.undef.prop.read"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static undefWriteError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .line 4310
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 4311
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 4310
    const-string v3, "msg.undef.prop.write"

    invoke-static {v3, v0, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method static uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;

    .line 944
    if-nez p2, :cond_0

    .line 945
    const-string v0, "null"

    return-object v0

    .line 947
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v0, :cond_1

    .line 948
    const-string v0, "undefined"

    return-object v0

    .line 950
    :cond_1
    instance-of v0, p2, Ljava/lang/CharSequence;

    if-eqz v0, :cond_2

    .line 951
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 952
    .local v0, "escaped":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 953
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 954
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 955
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 956
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 958
    .end local v0    # "escaped":Ljava/lang/String;
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_2
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_4

    .line 959
    move-object v0, p2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 960
    .local v0, "d":D
    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-nez v4, :cond_3

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    div-double/2addr v4, v0

    cmpg-double v2, v4, v2

    if-gez v2, :cond_3

    .line 961
    const-string v2, "-0"

    return-object v2

    .line 963
    :cond_3
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 965
    .end local v0    # "d":D
    :cond_4
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    .line 966
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 968
    :cond_5
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_7

    .line 969
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 972
    .local v0, "obj":Lcom/trendmicro/hippo/Scriptable;
    const-string v1, "toSource"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 973
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 974
    .local v1, "v":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Function;

    if-eqz v2, :cond_6

    .line 975
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Function;

    .line 976
    .local v2, "f":Lcom/trendmicro/hippo/Function;
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v2, p0, p1, v0, v3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 979
    .end local v1    # "v":Ljava/lang/Object;
    .end local v2    # "f":Lcom/trendmicro/hippo/Function;
    :cond_6
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 981
    .end local v0    # "obj":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->warnAboutNonJSObject(Ljava/lang/Object;)V

    .line 982
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static updateDotQuery(ZLcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p0, "value"    # Z
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 3938
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeWith;

    .line 3939
    .local v0, "nw":Lcom/trendmicro/hippo/NativeWith;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeWith;->updateDotQuery(Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static warnAboutNonJSObject(Ljava/lang/Object;)V
    .locals 3
    .param p0, "nonJSObject"    # Ljava/lang/Object;

    .line 4372
    const-string v0, "params.omit.non.js.object.warning"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4373
    .local v0, "omitParam":Ljava/lang/String;
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4374
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.non.js.object.warning"

    invoke-static {v2, p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 4375
    .local v1, "message":Ljava/lang/String;
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 4377
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 4379
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static wrapBoolean(Z)Ljava/lang/Boolean;
    .locals 1
    .param p0, "b"    # Z

    .line 366
    if-eqz p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v0
.end method

.method public static wrapException(Ljava/lang/Throwable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;
    .locals 12
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 3833
    const/4 v0, 0x0

    .line 3835
    .local v0, "javaException":Ljava/lang/Throwable;
    instance-of v1, p0, Lcom/trendmicro/hippo/EcmaError;

    if-eqz v1, :cond_0

    .line 3836
    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/EcmaError;

    .line 3837
    .local v1, "ee":Lcom/trendmicro/hippo/EcmaError;
    move-object v2, v1

    .line 3838
    .local v2, "re":Lcom/trendmicro/hippo/HippoException;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/EcmaError;->getName()Ljava/lang/String;

    move-result-object v3

    .line 3839
    .local v3, "errorName":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/EcmaError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 3840
    .local v1, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v3    # "errorName":Ljava/lang/String;
    :cond_0
    instance-of v1, p0, Lcom/trendmicro/hippo/WrappedException;

    if-eqz v1, :cond_1

    .line 3841
    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/WrappedException;

    .line 3842
    .local v1, "we":Lcom/trendmicro/hippo/WrappedException;
    move-object v2, v1

    .line 3843
    .restart local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/WrappedException;->getWrappedException()Ljava/lang/Throwable;

    move-result-object v0

    .line 3844
    const-string v3, "JavaException"

    .line 3845
    .restart local v3    # "errorName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3846
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3847
    .local v1, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v3    # "errorName":Ljava/lang/String;
    :cond_1
    instance-of v1, p0, Lcom/trendmicro/hippo/EvaluatorException;

    if-eqz v1, :cond_2

    .line 3849
    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/EvaluatorException;

    .line 3850
    .local v1, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    move-object v2, v1

    .line 3851
    .restart local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    const-string v3, "InternalError"

    .line 3852
    .restart local v3    # "errorName":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 3853
    .local v1, "errorMsg":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v3    # "errorName":Ljava/lang/String;
    :cond_2
    const/16 v1, 0xd

    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 3856
    new-instance v1, Lcom/trendmicro/hippo/WrappedException;

    invoke-direct {v1, p0}, Lcom/trendmicro/hippo/WrappedException;-><init>(Ljava/lang/Throwable;)V

    move-object v2, v1

    .line 3857
    .restart local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    const-string v3, "JavaException"

    .line 3858
    .restart local v3    # "errorName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3865
    .restart local v1    # "errorMsg":Ljava/lang/String;
    :goto_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/HippoException;->sourceName()Ljava/lang/String;

    move-result-object v4

    .line 3866
    .local v4, "sourceUri":Ljava/lang/String;
    if-nez v4, :cond_3

    .line 3867
    const-string v4, ""

    .line 3869
    :cond_3
    invoke-virtual {v2}, Lcom/trendmicro/hippo/HippoException;->lineNumber()I

    move-result v5

    .line 3871
    .local v5, "line":I
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x2

    if-lez v5, :cond_4

    .line 3872
    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v7

    aput-object v4, v9, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v9, v8

    move-object v6, v9

    .local v6, "args":[Ljava/lang/Object;
    goto :goto_1

    .line 3874
    .end local v6    # "args":[Ljava/lang/Object;
    :cond_4
    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v7

    aput-object v4, v8, v6

    move-object v6, v8

    .line 3877
    .restart local v6    # "args":[Ljava/lang/Object;
    :goto_1
    invoke-virtual {p2, p1, v3, v6}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 3878
    .local v7, "errorObject":Lcom/trendmicro/hippo/Scriptable;
    const-string v8, "name"

    invoke-static {v7, v8, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3880
    instance-of v8, v7, Lcom/trendmicro/hippo/NativeError;

    if-eqz v8, :cond_5

    .line 3881
    move-object v8, v7

    check-cast v8, Lcom/trendmicro/hippo/NativeError;

    invoke-virtual {v8, v2}, Lcom/trendmicro/hippo/NativeError;->setStackProvider(Lcom/trendmicro/hippo/HippoException;)V

    .line 3884
    :cond_5
    const/4 v8, 0x7

    const/4 v9, 0x0

    if-eqz v0, :cond_6

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 3885
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v10

    invoke-virtual {v10, p2, p1, v0, v9}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    .line 3887
    .local v10, "wrap":Ljava/lang/Object;
    const-string v11, "javaException"

    invoke-static {v7, v11, v10, v8}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3891
    .end local v10    # "wrap":Ljava/lang/Object;
    :cond_6
    invoke-static {p2, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->isVisible(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 3892
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v10

    invoke-virtual {v10, p2, p1, v2, v9}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    .line 3893
    .local v9, "wrap":Ljava/lang/Object;
    const-string v10, "hippoException"

    invoke-static {v7, v10, v9, v8}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 3897
    .end local v9    # "wrap":Ljava/lang/Object;
    :cond_7
    return-object v7

    .line 3862
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "re":Lcom/trendmicro/hippo/HippoException;
    .end local v3    # "errorName":Ljava/lang/String;
    .end local v4    # "sourceUri":Ljava/lang/String;
    .end local v5    # "line":I
    .end local v6    # "args":[Ljava/lang/Object;
    .end local v7    # "errorObject":Lcom/trendmicro/hippo/Scriptable;
    :cond_8
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static wrapInt(I)Ljava/lang/Integer;
    .locals 1
    .param p0, "i"    # I

    .line 371
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static wrapNumber(D)Ljava/lang/Number;
    .locals 1
    .param p0, "x"    # D

    .line 376
    cmpl-double v0, p0, p0

    if-eqz v0, :cond_0

    .line 377
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 379
    :cond_0
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p0, p1}, Ljava/lang/Double;-><init>(D)V

    return-object v0
.end method

.method public static wrapRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "compiled"    # Ljava/lang/Object;

    .line 4403
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getRegExpProxy()Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lcom/trendmicro/hippo/RegExpProxy;->wrapRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method
