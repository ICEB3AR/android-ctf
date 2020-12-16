.class Lcom/trendmicro/hippo/ScriptableObject$Slot;
.super Ljava/lang/Object;
.source "ScriptableObject.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Slot"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x548617c41c7a8763L


# instance fields
.field private attributes:S

.field indexOrHash:I

.field name:Ljava/lang/Object;

.field transient next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

.field transient orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;II)V
    .locals 1
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "indexOrHash"    # I
    .param p3, "attributes"    # I

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 161
    iput p2, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    .line 162
    int-to-short v0, p3

    iput-short v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->attributes:S

    .line 163
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 168
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    .line 172
    :cond_0
    return-void
.end method


# virtual methods
.method getAttributes()I
    .locals 1

    .line 195
    iget-short v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->attributes:S

    return v0
.end method

.method getPropertyDescriptor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 205
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    iget-short v1, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->attributes:S

    invoke-static {p2, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method getValue(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 190
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    return-object v0
.end method

.method declared-synchronized setAttributes(I)V
    .locals 1
    .param p1, "value"    # I

    monitor-enter p0

    .line 200
    :try_start_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->checkValidAttributes(I)V

    .line 201
    int-to-short v0, p1

    iput-short v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->attributes:S
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    monitor-exit p0

    return-void

    .line 199
    .end local p0    # "this":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .end local p1    # "value":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method setValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 3
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "owner"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 175
    iget-short v0, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->attributes:S

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    .line 176
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 177
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 180
    return v1

    .line 178
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    const-string v2, "msg.modify.readonly"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 182
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    if-ne p2, p3, :cond_2

    .line 183
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 184
    return v1

    .line 186
    :cond_2
    const/4 v0, 0x0

    return v0
.end method
