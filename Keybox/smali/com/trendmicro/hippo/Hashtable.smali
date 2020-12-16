.class public Lcom/trendmicro/hippo/Hashtable;
.super Ljava/lang/Object;
.source "Hashtable.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Hashtable$Entry;,
        Lcom/trendmicro/hippo/Hashtable$Iter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Iterable<",
        "Lcom/trendmicro/hippo/Hashtable$Entry;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private first:Lcom/trendmicro/hippo/Hashtable$Entry;

.field private last:Lcom/trendmicro/hippo/Hashtable$Entry;

.field private final map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Object;",
            "Lcom/trendmicro/hippo/Hashtable$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 34
    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/Hashtable;)Lcom/trendmicro/hippo/Hashtable$Entry;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Hashtable;

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/Hashtable;->makeDummy()Lcom/trendmicro/hippo/Hashtable$Entry;

    move-result-object v0

    return-object v0
.end method

.method private makeDummy()Lcom/trendmicro/hippo/Hashtable$Entry;
    .locals 1

    .line 108
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>()V

    .line 109
    .local v0, "d":Lcom/trendmicro/hippo/Hashtable$Entry;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Hashtable$Entry;->clear()Ljava/lang/Object;

    .line 110
    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 194
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Hashtable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 195
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/trendmicro/hippo/Hashtable$Entry;>;"
    #disallowed odex opcode
    #iput-object-volatile v0, v0, Landroid/app/Notification$Action;->title:Ljava/lang/CharSequence;
    nop

    nop

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Iterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    .line 201
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v1, :cond_0

    .line 202
    new-instance v1, Lcom/trendmicro/hippo/Hashtable$Entry;

    invoke-direct {v1}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>()V

    .line 203
    .local v1, "dummy":Lcom/trendmicro/hippo/Hashtable$Entry;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Hashtable$Entry;->clear()Ljava/lang/Object;

    .line 204
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 205
    iput-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 209
    .end local v1    # "dummy":Lcom/trendmicro/hippo/Hashtable$Entry;
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 210
    return-void
.end method

.method public delete(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;

    .line 150
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .local v0, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 152
    .local v2, "v":Lcom/trendmicro/hippo/Hashtable$Entry;
    if-nez v2, :cond_0

    .line 153
    return-object v1

    .line 164
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-ne v2, v3, :cond_2

    .line 165
    iget-object v3, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-ne v2, v3, :cond_1

    .line 168
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Hashtable$Entry;->clear()Ljava/lang/Object;

    .line 169
    iput-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 171
    :cond_1
    iget-object v3, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v3, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 172
    iput-object v1, v3, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 173
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v1, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v1, :cond_4

    .line 174
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v1, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iget-object v3, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v3, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 178
    :cond_2
    iget-object v3, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 179
    .local v3, "prev":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v4, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v4, v3, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 180
    iput-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 181
    iget-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-eqz v1, :cond_3

    .line 182
    iget-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v3, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 184
    :cond_3
    nop

    .line 185
    iput-object v3, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 189
    .end local v3    # "prev":Lcom/trendmicro/hippo/Hashtable$Entry;
    :cond_4
    :goto_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Hashtable$Entry;->clear()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 136
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .local v0, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 138
    .local v2, "v":Lcom/trendmicro/hippo/Hashtable$Entry;
    if-nez v2, :cond_0

    .line 139
    return-object v1

    .line 141
    :cond_0
    iget-object v1, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    return-object v1
.end method

.method public has(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 145
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 146
    .local v0, "e":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/Hashtable$Entry;",
            ">;"
        }
    .end annotation

    .line 213
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Iter;

    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/Hashtable$Iter;-><init>(Lcom/trendmicro/hippo/Hashtable;Lcom/trendmicro/hippo/Hashtable$Entry;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .line 118
    new-instance v0, Lcom/trendmicro/hippo/Hashtable$Entry;

    invoke-direct {v0, p1, p2}, Lcom/trendmicro/hippo/Hashtable$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 119
    .local v0, "nv":Lcom/trendmicro/hippo/Hashtable$Entry;
    iget-object v1, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v1, v0, v0}, Ljava/util/HashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 120
    .local v1, "ev":Lcom/trendmicro/hippo/Hashtable$Entry;
    if-nez v1, :cond_1

    .line 122
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    if-nez v2, :cond_0

    .line 123
    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->first:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 125
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v0, v2, Lcom/trendmicro/hippo/Hashtable$Entry;->next:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 126
    iget-object v2, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    iput-object v2, v0, Lcom/trendmicro/hippo/Hashtable$Entry;->prev:Lcom/trendmicro/hippo/Hashtable$Entry;

    .line 127
    iput-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->last:Lcom/trendmicro/hippo/Hashtable$Entry;

    goto :goto_0

    .line 131
    :cond_1
    iput-object p2, v1, Lcom/trendmicro/hippo/Hashtable$Entry;->value:Ljava/lang/Object;

    .line 133
    :goto_0
    return-void
.end method

.method public size()I
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/trendmicro/hippo/Hashtable;->map:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method
