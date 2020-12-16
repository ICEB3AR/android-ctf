.class final Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;
.super Ljava/lang/Object;
.source "IdScriptableObject.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/IdScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PrototypeValues"
.end annotation


# static fields
.field private static final NAME_SLOT:I = 0x1

.field private static final SLOT_SPAN:I = 0x2

.field private static final serialVersionUID:J = 0x2a2b6fc82e6217a3L


# instance fields
.field private attributeArray:[S

.field private constructor:Lcom/trendmicro/hippo/IdFunctionObject;

.field private constructorAttrs:S

.field constructorId:I

.field private maxId:I

.field private obj:Lcom/trendmicro/hippo/IdScriptableObject;

.field private valueArray:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/IdScriptableObject;I)V
    .locals 1
    .param p1, "obj"    # Lcom/trendmicro/hippo/IdScriptableObject;
    .param p2, "maxId"    # I

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    if-eqz p1, :cond_1

    .line 60
    const/4 v0, 0x1

    if-lt p2, v0, :cond_0

    .line 61
    iput-object p1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    .line 62
    iput p2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    .line 63
    return-void

    .line 60
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 59
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private ensureId(I)Ljava/lang/Object;
    .locals 7
    .param p1, "id"    # I

    .line 306
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 307
    .local v0, "array":[Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 308
    monitor-enter p0

    .line 309
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    move-object v0, v1

    .line 310
    if-nez v0, :cond_0

    .line 311
    iget v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    move-object v0, v1

    .line 312
    iput-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 313
    iget v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    new-array v1, v1, [S

    iput-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    .line 315
    :cond_0
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 317
    :cond_1
    :goto_0
    add-int/lit8 v1, p1, -0x1

    mul-int/lit8 v1, v1, 0x2

    .line 318
    .local v1, "valueSlot":I
    aget-object v2, v0, v1

    .line 319
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_4

    .line 320
    iget v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    if-ne p1, v3, :cond_2

    .line 321
    const-string v4, "constructor"

    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    iget-short v6, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorAttrs:S

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initSlot(ILjava/lang/Object;Ljava/lang/Object;I)V

    .line 323
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    goto :goto_1

    .line 325
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->initPrototypeId(I)V

    .line 327
    :goto_1
    aget-object v2, v0, v1

    .line 328
    if-eqz v2, :cond_3

    goto :goto_2

    .line 329
    :cond_3
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    .line 330
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".initPrototypeId(int id) did not initialize id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    :cond_4
    :goto_2
    return-object v2
.end method

.method private initSlot(ILjava/lang/Object;Ljava/lang/Object;I)V
    .locals 6
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .line 121
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 122
    .local v0, "array":[Ljava/lang/Object;
    if-eqz v0, :cond_3

    .line 125
    if-nez p3, :cond_0

    .line 126
    sget-object p3, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    move-object v1, p3

    goto :goto_0

    .line 125
    :cond_0
    move-object v1, p3

    .line 128
    .end local p3    # "value":Ljava/lang/Object;
    .local v1, "value":Ljava/lang/Object;
    :goto_0
    add-int/lit8 p3, p1, -0x1

    mul-int/lit8 v2, p3, 0x2

    .line 129
    .local v2, "index":I
    monitor-enter p0

    .line 130
    :try_start_0
    aget-object p3, v0, v2

    .line 131
    .local p3, "value2":Ljava/lang/Object;
    if-nez p3, :cond_1

    .line 132
    aput-object v1, v0, v2

    .line 133
    add-int/lit8 v3, v2, 0x1

    aput-object p2, v0, v3

    .line 134
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v4, p1, -0x1

    int-to-short v5, p4

    aput-short v5, v3, v4

    goto :goto_1

    .line 136
    :cond_1
    add-int/lit8 v3, v2, 0x1

    aget-object v3, v0, v3

    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 139
    .end local p3    # "value2":Ljava/lang/Object;
    :goto_1
    monitor-exit p0

    .line 140
    return-void

    .line 137
    .restart local p3    # "value2":Ljava/lang/Object;
    :cond_2
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    .end local v0    # "array":[Ljava/lang/Object;
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "index":I
    .end local p1    # "id":I
    .end local p2    # "name":Ljava/lang/Object;
    .end local p4    # "attributes":I
    throw v3

    .line 139
    .end local p3    # "value2":Ljava/lang/Object;
    .restart local v0    # "array":[Ljava/lang/Object;
    .restart local v1    # "value":Ljava/lang/Object;
    .restart local v2    # "index":I
    .restart local p1    # "id":I
    .restart local p2    # "name":Ljava/lang/Object;
    .restart local p4    # "attributes":I
    :catchall_0
    move-exception p3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p3

    .line 123
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "index":I
    .local p3, "value":Ljava/lang/Object;
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method


# virtual methods
.method final createPrecachedConstructor()Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 3

    .line 144
    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    if-nez v0, :cond_2

    .line 145
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    const-string v1, "constructor"

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    .line 146
    if-eqz v0, :cond_1

    .line 150
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->initPrototypeId(I)V

    .line 151
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v0, :cond_0

    .line 156
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/IdScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    .line 157
    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 156
    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->initFunction(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)V

    .line 158
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/IdFunctionObject;->markAsConstructor(Lcom/trendmicro/hippo/Scriptable;)V

    .line 159
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    return-object v0

    .line 152
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    .line 153
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".initPrototypeId() did not initialize id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No id for constructor property"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method final delete(I)V
    .locals 5
    .param p1, "id"    # I

    .line 228
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 229
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    aget-short v0, v0, v1

    .line 231
    .local v0, "attr":I
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_1

    .line 232
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 233
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 238
    .end local v1    # "cx":Lcom/trendmicro/hippo/Context;
    goto :goto_0

    .line 234
    .restart local v1    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_0
    add-int/lit8 v2, p1, -0x1

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x1

    .line 235
    .local v2, "nameSlot":I
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aget-object v3, v3, v2

    check-cast v3, Ljava/lang/String;

    .line 236
    .local v3, "name":Ljava/lang/String;
    const-string v4, "msg.delete.property.with.configurable.false"

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 239
    .end local v1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v2    # "nameSlot":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, p1, -0x1

    mul-int/lit8 v1, v1, 0x2

    .line 240
    .local v1, "valueSlot":I
    monitor-enter p0

    .line 241
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    aput-object v3, v2, v1

    .line 242
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x0

    aput-short v4, v2, v3

    .line 243
    monitor-exit p0

    .line 245
    .end local v1    # "valueSlot":I
    :goto_0
    return-void

    .line 243
    .restart local v1    # "valueSlot":I
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method final findId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    return v0
.end method

.method final findId(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method final get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 190
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    move-result-object v0

    .line 191
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_0

    .line 192
    const/4 v0, 0x0

    .line 194
    :cond_0
    return-object v0
.end method

.method final getAttributes(I)I
    .locals 2
    .param p1, "id"    # I

    .line 249
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 250
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    aget-short v0, v0, v1

    return v0
.end method

.method final getMaxId()I
    .locals 1

    .line 67
    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    return v0
.end method

.method final getNames(ZZ[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .param p1, "getAll"    # Z
    .param p2, "getSymbols"    # Z
    .param p3, "extraEntries"    # [Ljava/lang/Object;

    .line 264
    const/4 v0, 0x0

    .line 265
    .local v0, "names":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 266
    .local v1, "count":I
    const/4 v2, 0x1

    .local v2, "id":I
    :goto_0
    iget v3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    if-gt v2, v3, :cond_5

    .line 267
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    move-result-object v3

    .line 268
    .local v3, "value":Ljava/lang/Object;
    if-nez p1, :cond_0

    iget-object v4, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v5, v2, -0x1

    aget-short v4, v4, v5

    and-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_4

    .line 269
    :cond_0
    sget-object v4, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v4, :cond_4

    .line 270
    add-int/lit8 v4, v2, -0x1

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, 0x1

    .line 271
    .local v4, "nameSlot":I
    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aget-object v5, v5, v4

    .line 272
    .local v5, "name":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 273
    if-nez v0, :cond_1

    .line 274
    iget v6, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    new-array v0, v6, [Ljava/lang/Object;

    .line 276
    :cond_1
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "count":I
    .local v6, "count":I
    aput-object v5, v0, v1

    move v1, v6

    goto :goto_1

    .line 277
    .end local v6    # "count":I
    .restart local v1    # "count":I
    :cond_2
    if-eqz p2, :cond_4

    instance-of v6, v5, Lcom/trendmicro/hippo/Symbol;

    if-eqz v6, :cond_4

    .line 278
    if-nez v0, :cond_3

    .line 279
    iget v6, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    new-array v0, v6, [Ljava/lang/Object;

    .line 281
    :cond_3
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "count":I
    .restart local v6    # "count":I
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v0, v1

    move v1, v6

    .line 266
    .end local v3    # "value":Ljava/lang/Object;
    .end local v4    # "nameSlot":I
    .end local v5    # "name":Ljava/lang/Object;
    .end local v6    # "count":I
    .restart local v1    # "count":I
    :cond_4
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 286
    .end local v2    # "id":I
    :cond_5
    if-nez v1, :cond_6

    .line 287
    return-object p3

    .line 288
    :cond_6
    const/4 v2, 0x0

    if-eqz p3, :cond_8

    array-length v3, p3

    if-nez v3, :cond_7

    goto :goto_2

    .line 296
    :cond_7
    array-length v3, p3

    .line 297
    .local v3, "extra":I
    add-int v4, v3, v1

    new-array v4, v4, [Ljava/lang/Object;

    .line 298
    .local v4, "tmp":[Ljava/lang/Object;
    invoke-static {p3, v2, v4, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    invoke-static {v0, v2, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    return-object v4

    .line 289
    .end local v3    # "extra":I
    .end local v4    # "tmp":[Ljava/lang/Object;
    :cond_8
    :goto_2
    array-length v3, v0

    if-eq v1, v3, :cond_9

    .line 290
    new-array v3, v1, [Ljava/lang/Object;

    .line 291
    .local v3, "tmp":[Ljava/lang/Object;
    invoke-static {v0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 292
    move-object v0, v3

    .line 294
    .end local v3    # "tmp":[Ljava/lang/Object;
    :cond_9
    return-object v0
.end method

.method final has(I)Z
    .locals 5
    .param p1, "id"    # I

    .line 174
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    .line 175
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 177
    return v1

    .line 179
    :cond_0
    add-int/lit8 v2, p1, -0x1

    mul-int/lit8 v2, v2, 0x2

    .line 180
    .local v2, "valueSlot":I
    aget-object v3, v0, v2

    .line 181
    .local v3, "value":Ljava/lang/Object;
    if-nez v3, :cond_1

    .line 183
    return v1

    .line 185
    :cond_1
    sget-object v4, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v3, v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method final initValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .line 96
    const/4 v0, 0x1

    if-gt v0, p1, :cond_5

    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    if-gt p1, v0, :cond_5

    .line 98
    if-eqz p2, :cond_4

    .line 100
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq p3, v0, :cond_3

    .line 102
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptableObject;->checkValidAttributes(I)V

    .line 103
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    if-ne v0, p1, :cond_2

    .line 106
    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    if-ne p1, v0, :cond_1

    .line 107
    instance-of v0, p3, Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v0, :cond_0

    .line 110
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/IdFunctionObject;

    iput-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    .line 111
    int-to-short v0, p4

    iput-short v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorAttrs:S

    .line 112
    return-void

    .line 108
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "consructor should be initialized with IdFunctionObject"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initSlot(ILjava/lang/Object;Ljava/lang/Object;I)V

    .line 116
    return-void

    .line 104
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 99
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 97
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method final initValue(ILjava/lang/String;Ljava/lang/Object;I)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .line 72
    const/4 v0, 0x1

    if-gt v0, p1, :cond_5

    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->maxId:I

    if-gt p1, v0, :cond_5

    .line 74
    if-eqz p2, :cond_4

    .line 76
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq p3, v0, :cond_3

    .line 78
    invoke-static {p4}, Lcom/trendmicro/hippo/ScriptableObject;->checkValidAttributes(I)V

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->findPrototypeId(Ljava/lang/String;)I

    move-result v0

    if-ne v0, p1, :cond_2

    .line 82
    iget v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    if-ne p1, v0, :cond_1

    .line 83
    instance-of v0, p3, Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v0, :cond_0

    .line 86
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/IdFunctionObject;

    iput-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructor:Lcom/trendmicro/hippo/IdFunctionObject;

    .line 87
    int-to-short v0, p4

    iput-short v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorAttrs:S

    .line 88
    return-void

    .line 84
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "consructor should be initialized with IdFunctionObject"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initSlot(ILjava/lang/Object;Ljava/lang/Object;I)V

    .line 92
    return-void

    .line 80
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 75
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 73
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method final set(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 199
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq p3, v0, :cond_4

    .line 200
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 201
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    aget-short v0, v0, v1

    .line 202
    .local v0, "attr":I
    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_3

    .line 203
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->obj:Lcom/trendmicro/hippo/IdScriptableObject;

    if-ne p2, v1, :cond_1

    .line 204
    if-nez p3, :cond_0

    .line 205
    sget-object p3, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    move-object v1, p3

    goto :goto_0

    .line 204
    :cond_0
    move-object v1, p3

    .line 207
    .end local p3    # "value":Ljava/lang/Object;
    .local v1, "value":Ljava/lang/Object;
    :goto_0
    add-int/lit8 p3, p1, -0x1

    mul-int/lit8 v2, p3, 0x2

    .line 208
    .local v2, "valueSlot":I
    monitor-enter p0

    .line 209
    :try_start_0
    iget-object p3, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aput-object v1, p3, v2

    .line 210
    monitor-exit p0

    .line 211
    .end local v2    # "valueSlot":I
    move-object p3, v1

    goto :goto_1

    .line 210
    .restart local v2    # "valueSlot":I
    :catchall_0
    move-exception p3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p3

    .line 213
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "valueSlot":I
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v1, p1, -0x1

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    .line 214
    .local v1, "nameSlot":I
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->valueArray:[Ljava/lang/Object;

    aget-object v2, v2, v1

    .line 215
    .local v2, "name":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/Symbol;

    if-eqz v3, :cond_2

    .line 216
    instance-of v3, p2, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v3, :cond_3

    .line 217
    move-object v3, p2

    check-cast v3, Lcom/trendmicro/hippo/SymbolScriptable;

    move-object v4, v2

    check-cast v4, Lcom/trendmicro/hippo/Symbol;

    invoke-interface {v3, v4, p2, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_1

    .line 220
    :cond_2
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-interface {p2, v3, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 224
    .end local v1    # "nameSlot":I
    .end local v2    # "name":Ljava/lang/Object;
    :cond_3
    :goto_1
    return-void

    .line 199
    .end local v0    # "attr":I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method final setAttributes(II)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "attributes"    # I

    .line 255
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkValidAttributes(I)V

    .line 256
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->ensureId(I)Ljava/lang/Object;

    .line 257
    monitor-enter p0

    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->attributeArray:[S

    add-int/lit8 v1, p1, -0x1

    int-to-short v2, p2

    aput-short v2, v0, v1

    .line 259
    monitor-exit p0

    .line 260
    return-void

    .line 259
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
