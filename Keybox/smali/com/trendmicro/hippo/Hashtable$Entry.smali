.class public final Lcom/trendmicro/hippo/Hashtable$Entry;
.super Ljava/lang/Object;
.source "Hashtable.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Hashtable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field protected deleted:Z

.field private final hashCode:I

.field protected key:Ljava/lang/Object;

.field protected next:Lcom/trendmicro/hippo/Hashtable$Entry;

.field protected prev:Lcom/trendmicro/hippo/Hashtable$Entry;

.field protected value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->hashCode:I

    .line 52
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p1, "k"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_0

    instance-of v0, p1, Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 57
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    goto :goto_0

    .line 59
    :cond_0
    iput-object p1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    .line 62
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 63
    iput v1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->hashCode:I

    goto :goto_1

    .line 64
    :cond_1
    sget-wide v2, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 65
    iput v1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->hashCode:I

    goto :goto_1

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->hashCode:I

    .line 70
    :goto_1
    iput-object p2, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    .line 71
    return-void
.end method


# virtual methods
.method clear()Ljava/lang/Object;
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    .line 86
    .local v0, "ret":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    .line 87
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    .line 88
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->deleted:Z

    .line 89
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 100
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v1, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->sameZero(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "cce":Ljava/lang/ClassCastException;
    const/4 v1, 0x0

    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 94
    iget v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->hashCode:I

    return v0
.end method

.method public key()Ljava/lang/Object;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public value()Ljava/lang/Object;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    return-object v0
.end method
