.class public Lcom/trendmicro/hippo/NativeSymbol;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeSymbol.java"

# interfaces
.implements Lcom/trendmicro/hippo/Symbol;


# static fields
.field public static final CLASS_NAME:Ljava/lang/String; = "Symbol"

.field private static final CONSTRUCTOR_SLOT:Ljava/lang/Object;

.field private static final ConstructorId_for:I = -0x1

.field private static final ConstructorId_keyFor:I = -0x2

.field private static final GLOBAL_TABLE_KEY:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x5

.field private static final SymbolId_toPrimitive:I = 0x5

.field private static final SymbolId_toStringTag:I = 0x3

.field public static final TYPE_NAME:Ljava/lang/String; = "symbol"

.field private static final serialVersionUID:J = -0x82e774764cfb173L


# instance fields
.field private final key:Lcom/trendmicro/hippo/SymbolKey;

.field private final symbolData:Lcom/trendmicro/hippo/NativeSymbol;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/NativeSymbol;->GLOBAL_TABLE_KEY:Ljava/lang/Object;

    .line 28
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/NativeSymbol;)V
    .locals 1
    .param p1, "s"    # Lcom/trendmicro/hippo/NativeSymbol;

    .line 77
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 78
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    .line 79
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    .line 80
    return-void
.end method

.method private constructor <init>(Lcom/trendmicro/hippo/SymbolKey;)V
    .locals 0
    .param p1, "key"    # Lcom/trendmicro/hippo/SymbolKey;

    .line 72
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    .line 74
    iput-object p0, p0, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    .line 75
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "desc"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 68
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    .line 70
    return-void
.end method

.method public static construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/Context;->putThreadLocal(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 90
    :try_start_0
    const-string v0, "Symbol"

    invoke-virtual {p0, p1, v0, p2}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/NativeSymbol;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    sget-object v1, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Context;->removeThreadLocal(Ljava/lang/Object;)V

    .line 90
    return-object v0

    .line 92
    :catchall_0
    move-exception v0

    sget-object v1, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Context;->removeThreadLocal(Ljava/lang/Object;)V

    .line 93
    throw v0
.end method

.method private static createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "ctor"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "key"    # Lcom/trendmicro/hippo/SymbolKey;

    .line 112
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    const/4 v1, 0x1

    aput-object p4, v0, v1

    const-string v1, "Symbol"

    invoke-virtual {p0, p1, v1, v0}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 113
    .local v0, "sym":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x7

    invoke-virtual {p2, p3, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 114
    return-void
.end method

.method private getGlobalMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/NativeSymbol;",
            ">;"
        }
    .end annotation

    .line 349
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeSymbol;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 350
    .local v0, "top":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v1, Lcom/trendmicro/hippo/NativeSymbol;->GLOBAL_TABLE_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 351
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    if-nez v1, :cond_0

    .line 352
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move-object v1, v2

    .line 353
    sget-object v2, Lcom/trendmicro/hippo/NativeSymbol;->GLOBAL_TABLE_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    :cond_0
    return-object v1
.end method

.method private static getSelf(Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;
    .locals 3
    .param p0, "thisObj"    # Ljava/lang/Object;

    .line 217
    :try_start_0
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeSymbol;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "cce":Ljava/lang/ClassCastException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "msg.invalid.type"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 34
    new-instance v0, Lcom/trendmicro/hippo/NativeSymbol;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/NativeSymbol;-><init>(Ljava/lang/String;)V

    .line 35
    .local v0, "obj":Lcom/trendmicro/hippo/NativeSymbol;
    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/trendmicro/hippo/NativeSymbol;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v1

    .line 37
    .local v1, "ctor":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v2, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/Context;->putThreadLocal(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    :try_start_0
    const-string v2, "iterator"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 40
    const-string v2, "species"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->SPECIES:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 41
    const-string v2, "toStringTag"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 42
    const-string v2, "hasInstance"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->HAS_INSTANCE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 43
    const-string v2, "isConcatSpreadable"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 44
    const-string v2, "isRegExp"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->IS_REGEXP:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 45
    const-string v2, "toPrimitive"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->TO_PRIMITIVE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 46
    const-string v2, "match"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->MATCH:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 47
    const-string v2, "replace"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->REPLACE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 48
    const-string v2, "search"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->SEARCH:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 49
    const-string v2, "split"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->SPLIT:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V

    .line 50
    const-string v2, "unscopables"

    sget-object v3, Lcom/trendmicro/hippo/SymbolKey;->UNSCOPABLES:Lcom/trendmicro/hippo/SymbolKey;

    invoke-static {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/NativeSymbol;->createStandardSymbol(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Lcom/trendmicro/hippo/SymbolKey;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    sget-object v2, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Context;->removeThreadLocal(Ljava/lang/Object;)V

    .line 54
    nop

    .line 56
    if-eqz p2, :cond_0

    .line 58
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ScriptableObject;->sealObject()V

    .line 60
    :cond_0
    return-void

    .line 53
    :catchall_0
    move-exception v2

    sget-object v3, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Context;->removeThreadLocal(Ljava/lang/Object;)V

    .line 54
    throw v2
.end method

.method private isStrictMode()Z
    .locals 2

    .line 284
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 285
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static js_constructor([Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;

    .line 225
    array-length v0, p0

    if-lez v0, :cond_1

    .line 226
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 227
    const-string v0, ""

    .local v0, "desc":Ljava/lang/String;
    goto :goto_0

    .line 229
    .end local v0    # "desc":Ljava/lang/String;
    :cond_0
    aget-object v0, p0, v1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "desc":Ljava/lang/String;
    goto :goto_0

    .line 232
    .end local v0    # "desc":Ljava/lang/String;
    :cond_1
    const-string v0, ""

    .line 235
    .restart local v0    # "desc":Ljava/lang/String;
    :goto_0
    array-length v1, p0

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 236
    new-instance v1, Lcom/trendmicro/hippo/NativeSymbol;

    aget-object v2, p0, v2

    check-cast v2, Lcom/trendmicro/hippo/SymbolKey;

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeSymbol;-><init>(Lcom/trendmicro/hippo/SymbolKey;)V

    return-object v1

    .line 239
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/NativeSymbol;

    new-instance v2, Lcom/trendmicro/hippo/SymbolKey;

    invoke-direct {v2, v0}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/NativeSymbol;-><init>(Lcom/trendmicro/hippo/SymbolKey;)V

    return-object v1
.end method

.method private js_for(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 248
    array-length v0, p3

    const/4 v1, 0x0

    if-lez v0, :cond_0

    aget-object v0, p3, v1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "name":Ljava/lang/String;
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeSymbol;->getGlobalMap()Ljava/util/Map;

    move-result-object v2

    .line 251
    .local v2, "table":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/NativeSymbol;

    .line 253
    .local v3, "ret":Lcom/trendmicro/hippo/NativeSymbol;
    if-nez v3, :cond_1

    .line 254
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v1

    invoke-static {p1, p2, v4}, Lcom/trendmicro/hippo/NativeSymbol;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;

    move-result-object v3

    .line 255
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_1
    return-object v3
.end method

.method private js_keyFor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 261
    array-length v0, p3

    if-lez v0, :cond_0

    const/4 v0, 0x0

    aget-object v0, p3, v0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 262
    .local v0, "s":Ljava/lang/Object;
    :goto_0
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v1, :cond_3

    .line 265
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/NativeSymbol;

    .line 267
    .local v1, "sym":Lcom/trendmicro/hippo/NativeSymbol;
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeSymbol;->getGlobalMap()Ljava/util/Map;

    move-result-object v2

    .line 268
    .local v2, "table":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 269
    .local v4, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/NativeSymbol;

    iget-object v5, v5, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    iget-object v6, v1, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    if-ne v5, v6, :cond_1

    .line 270
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 272
    .end local v4    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    :cond_1
    goto :goto_1

    .line 273
    :cond_2
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v3

    .line 263
    .end local v1    # "sym":Lcom/trendmicro/hippo/NativeSymbol;
    .end local v2    # "table":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/NativeSymbol;>;"
    :cond_3
    const-string v1, "TypeError"

    const-string v2, "Not a Symbol"

    invoke-static {p1, p2, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->throwCustomError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v1

    throw v1
.end method

.method private js_valueOf()Ljava/lang/Object;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x"    # Ljava/lang/Object;

    .line 341
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 184
    const-string v0, "Symbol"

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 187
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 188
    .local v0, "id":I
    const/4 v1, -0x2

    if-eq v0, v1, :cond_7

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    .line 211
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 209
    :cond_1
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeSymbol;->getSelf(Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;

    move-result-object v1

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeSymbol;->js_valueOf()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 206
    :cond_2
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeSymbol;->getSelf(Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeSymbol;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 195
    :cond_3
    if-nez p4, :cond_5

    .line 196
    sget-object v1, Lcom/trendmicro/hippo/NativeSymbol;->CONSTRUCTOR_SLOT:Ljava/lang/Object;

    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Context;->getThreadLocal(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 201
    invoke-static {p5}, Lcom/trendmicro/hippo/NativeSymbol;->js_constructor([Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;

    move-result-object v1

    return-object v1

    .line 198
    :cond_4
    const-string v1, "msg.no.symbol.new"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 203
    :cond_5
    invoke-static {p2, p3, p5}, Lcom/trendmicro/hippo/NativeSymbol;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeSymbol;

    move-result-object v1

    return-object v1

    .line 190
    :cond_6
    invoke-direct {p0, p2, p3, p5}, Lcom/trendmicro/hippo/NativeSymbol;->js_for(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 192
    :cond_7
    invoke-direct {p0, p2, p3, p5}, Lcom/trendmicro/hippo/NativeSymbol;->js_keyFor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 12
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 103
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 104
    const-string v2, "Symbol"

    const/4 v3, -0x1

    const-string v4, "for"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeSymbol;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 105
    const-string v8, "Symbol"

    const/4 v9, -0x2

    const-string v10, "keyFor"

    const/4 v11, 0x1

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeSymbol;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 106
    return-void
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 136
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    const/4 v0, 0x3

    return v0

    .line 138
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_PRIMITIVE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    const/4 v0, 0x5

    return v0

    .line 141
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 120
    const/4 v0, 0x0

    .line 122
    .local v0, "id":I
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 123
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 124
    .local v2, "s_length":I
    const/4 v3, 0x7

    if-ne v2, v3, :cond_0

    const-string v1, "valueOf"

    const/4 v0, 0x4

    goto :goto_0

    .line 125
    :cond_0
    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 126
    :cond_1
    const/16 v3, 0xb

    if-ne v2, v3, :cond_2

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 127
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 131
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 98
    const-string v0, "Symbol"

    return-object v0
.end method

.method getKey()Lcom/trendmicro/hippo/SymbolKey;
    .locals 1

    .line 345
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    return-object v0
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .line 331
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isSymbol()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "symbol"

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getTypeOf()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SymbolKey;->hashCode()I

    move-result v0

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 7
    .param p1, "id"    # I

    .line 160
    const/4 v0, 0x1

    const-string v1, "Symbol"

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    const/4 v2, 0x0

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 177
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->initPrototypeId(I)V

    goto :goto_0

    .line 174
    :cond_0
    sget-object v4, Lcom/trendmicro/hippo/SymbolKey;->TO_PRIMITIVE:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v6, 0x1

    const-string v2, "Symbol"

    const-string v5, "Symbol.toPrimitive"

    move-object v1, p0

    move v3, p1

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/NativeSymbol;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 175
    goto :goto_0

    .line 168
    :cond_1
    const-string v0, "valueOf"

    invoke-virtual {p0, v1, p1, v0, v2}, Lcom/trendmicro/hippo/NativeSymbol;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 169
    goto :goto_0

    .line 171
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/trendmicro/hippo/NativeSymbol;->initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 172
    goto :goto_0

    .line 165
    :cond_3
    const-string v0, "toString"

    invoke-virtual {p0, v1, p1, v0, v2}, Lcom/trendmicro/hippo/NativeSymbol;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 166
    goto :goto_0

    .line 162
    :cond_4
    const-string v2, "constructor"

    invoke-virtual {p0, v1, p1, v2, v0}, Lcom/trendmicro/hippo/NativeSymbol;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 163
    nop

    .line 180
    :goto_0
    return-void
.end method

.method public isSymbol()Z
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->symbolData:Lcom/trendmicro/hippo/NativeSymbol;

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 301
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isSymbol()Z

    move-result v0

    if-nez v0, :cond_0

    .line 302
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 303
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isStrictMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 306
    :goto_0
    return-void

    .line 304
    :cond_1
    const-string v0, "msg.no.assign.symbol.strict"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 311
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isSymbol()Z

    move-result v0

    if-nez v0, :cond_0

    .line 312
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 313
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isStrictMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 316
    :goto_0
    return-void

    .line 314
    :cond_1
    const-string v0, "msg.no.assign.symbol.strict"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 291
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isSymbol()Z

    move-result v0

    if-nez v0, :cond_0

    .line 292
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 293
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeSymbol;->isStrictMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 296
    :goto_0
    return-void

    .line 294
    :cond_1
    const-string v0, "msg.no.assign.symbol.strict"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeSymbol;->key:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SymbolKey;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
