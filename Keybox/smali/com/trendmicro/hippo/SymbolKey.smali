.class public Lcom/trendmicro/hippo/SymbolKey;
.super Ljava/lang/Object;
.source "SymbolKey.java"

# interfaces
.implements Lcom/trendmicro/hippo/Symbol;
.implements Ljava/io/Serializable;


# static fields
.field public static final HAS_INSTANCE:Lcom/trendmicro/hippo/SymbolKey;

.field public static final IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

.field public static final IS_REGEXP:Lcom/trendmicro/hippo/SymbolKey;

.field public static final ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

.field public static final MATCH:Lcom/trendmicro/hippo/SymbolKey;

.field public static final REPLACE:Lcom/trendmicro/hippo/SymbolKey;

.field public static final SEARCH:Lcom/trendmicro/hippo/SymbolKey;

.field public static final SPECIES:Lcom/trendmicro/hippo/SymbolKey;

.field public static final SPLIT:Lcom/trendmicro/hippo/SymbolKey;

.field public static final TO_PRIMITIVE:Lcom/trendmicro/hippo/SymbolKey;

.field public static final TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

.field public static final UNSCOPABLES:Lcom/trendmicro/hippo/SymbolKey;

.field private static final serialVersionUID:J = -0x538a907bcd218e42L


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 19
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.iterator"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    .line 20
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.toStringTag"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    .line 21
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.species"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->SPECIES:Lcom/trendmicro/hippo/SymbolKey;

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.hasInstance"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->HAS_INSTANCE:Lcom/trendmicro/hippo/SymbolKey;

    .line 23
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.isConcatSpreadable"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

    .line 24
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.isRegExp"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->IS_REGEXP:Lcom/trendmicro/hippo/SymbolKey;

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.toPrimitive"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_PRIMITIVE:Lcom/trendmicro/hippo/SymbolKey;

    .line 26
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.match"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->MATCH:Lcom/trendmicro/hippo/SymbolKey;

    .line 27
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.replace"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->REPLACE:Lcom/trendmicro/hippo/SymbolKey;

    .line 28
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.search"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->SEARCH:Lcom/trendmicro/hippo/SymbolKey;

    .line 29
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.split"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->SPLIT:Lcom/trendmicro/hippo/SymbolKey;

    .line 30
    new-instance v0, Lcom/trendmicro/hippo/SymbolKey;

    const-string v1, "Symbol.unscopables"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/SymbolKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/trendmicro/hippo/SymbolKey;->UNSCOPABLES:Lcom/trendmicro/hippo/SymbolKey;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/trendmicro/hippo/SymbolKey;->name:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 52
    instance-of v0, p1, Lcom/trendmicro/hippo/SymbolKey;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 53
    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 55
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/NativeSymbol;

    if-eqz v0, :cond_3

    .line 56
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeSymbol;->getKey()Lcom/trendmicro/hippo/SymbolKey;

    move-result-object v0

    if-ne v0, p0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1

    .line 58
    :cond_3
    return v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/trendmicro/hippo/SymbolKey;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 46
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/SymbolKey;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 65
    const-string v0, "Symbol()"

    return-object v0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Symbol("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/SymbolKey;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
