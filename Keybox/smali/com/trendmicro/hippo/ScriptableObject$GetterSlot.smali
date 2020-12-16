.class final Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
.super Lcom/trendmicro/hippo/ScriptableObject$Slot;
.source "ScriptableObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "GetterSlot"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x440256dc8cdfe294L


# instance fields
.field getter:Ljava/lang/Object;

.field setter:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;II)V
    .locals 0
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "indexOrHash"    # I
    .param p3, "attributes"    # I

    .line 235
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;-><init>(Ljava/lang/Object;II)V

    .line 236
    return-void
.end method


# virtual methods
.method getPropertyDescriptor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 240
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getAttributes()I

    move-result v0

    .line 241
    .local v0, "attr":I
    new-instance v1, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 242
    .local v1, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v1, p2, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 243
    and-int/lit8 v2, v0, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v5, "enumerable"

    invoke-virtual {v1, v5, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 244
    and-int/lit8 v2, v0, 0x4

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    move v2, v4

    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v5, "configurable"

    invoke-virtual {v1, v5, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 245
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-nez v2, :cond_3

    .line 246
    and-int/lit8 v2, v0, 0x1

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    move v3, v4

    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "writable"

    invoke-virtual {v1, v3, v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 249
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->name:Ljava/lang/Object;

    if-nez v2, :cond_4

    const-string v2, "f"

    goto :goto_3

    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->name:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 250
    .local v2, "fName":Ljava/lang/String;
    :goto_3
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v3, :cond_7

    .line 251
    instance-of v5, v3, Lcom/trendmicro/hippo/MemberBox;

    const-string v6, "get"

    if-eqz v5, :cond_5

    .line 252
    new-instance v3, Lcom/trendmicro/hippo/FunctionObject;

    iget-object v5, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    check-cast v5, Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/MemberBox;->member()Ljava/lang/reflect/Member;

    move-result-object v5

    invoke-direct {v3, v2, v5, p2}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_4

    .line 253
    :cond_5
    instance-of v5, v3, Ljava/lang/reflect/Member;

    if-eqz v5, :cond_6

    .line 254
    new-instance v3, Lcom/trendmicro/hippo/FunctionObject;

    iget-object v5, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    check-cast v5, Ljava/lang/reflect/Member;

    invoke-direct {v3, v2, v5, p2}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_4

    .line 256
    :cond_6
    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 259
    :cond_7
    :goto_4
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-eqz v3, :cond_a

    .line 260
    instance-of v5, v3, Lcom/trendmicro/hippo/MemberBox;

    const-string v6, "set"

    if-eqz v5, :cond_8

    .line 261
    new-instance v3, Lcom/trendmicro/hippo/FunctionObject;

    iget-object v5, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    check-cast v5, Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/MemberBox;->member()Ljava/lang/reflect/Member;

    move-result-object v5

    invoke-direct {v3, v2, v5, p2}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_5

    .line 262
    :cond_8
    instance-of v5, v3, Ljava/lang/reflect/Member;

    if-eqz v5, :cond_9

    .line 263
    new-instance v3, Lcom/trendmicro/hippo/FunctionObject;

    iget-object v5, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    check-cast v5, Ljava/lang/reflect/Member;

    invoke-direct {v3, v2, v5, p2}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_5

    .line 265
    :cond_9
    invoke-virtual {v1, v6, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 268
    :cond_a
    :goto_5
    return-object v1
.end method

.method getValue(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p1, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 324
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v0, :cond_2

    .line 325
    instance-of v1, v0, Lcom/trendmicro/hippo/MemberBox;

    if-eqz v1, :cond_1

    .line 326
    check-cast v0, Lcom/trendmicro/hippo/MemberBox;

    .line 329
    .local v0, "nativeGetter":Lcom/trendmicro/hippo/MemberBox;
    iget-object v1, v0, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 330
    move-object v1, p1

    .line 331
    .local v1, "getterThis":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .local v2, "args":[Ljava/lang/Object;
    goto :goto_0

    .line 333
    .end local v1    # "getterThis":Ljava/lang/Object;
    .end local v2    # "args":[Ljava/lang/Object;
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 334
    .restart local v1    # "getterThis":Ljava/lang/Object;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 336
    .restart local v2    # "args":[Ljava/lang/Object;
    :goto_0
    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 337
    .end local v0    # "nativeGetter":Lcom/trendmicro/hippo/MemberBox;
    .end local v1    # "getterThis":Ljava/lang/Object;
    .end local v2    # "args":[Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_2

    .line 338
    check-cast v0, Lcom/trendmicro/hippo/Function;

    .line 339
    .local v0, "f":Lcom/trendmicro/hippo/Function;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 340
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    invoke-interface {v0}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, p1, v3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 344
    .end local v0    # "f":Lcom/trendmicro/hippo/Function;
    .end local v1    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 345
    .local v0, "val":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    if-eqz v1, :cond_3

    .line 346
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    .line 348
    .local v1, "initializer":Lcom/trendmicro/hippo/LazilyLoadedCtor;
    :try_start_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->init()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    invoke-virtual {v1}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    iput-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 351
    goto :goto_1

    .line 350
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    iput-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 351
    throw v2

    .line 353
    .end local v1    # "initializer":Lcom/trendmicro/hippo/LazilyLoadedCtor;
    :cond_3
    :goto_1
    return-object v0
.end method

.method setValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 10
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "owner"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 273
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez v0, :cond_4

    .line 274
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v0, :cond_3

    .line 275
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 276
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v2

    if-nez v2, :cond_1

    const/16 v2, 0xb

    .line 279
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 289
    :cond_0
    return v1

    .line 281
    :cond_1
    :goto_0
    const-string v1, ""

    .line 282
    .local v1, "prop":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->name:Ljava/lang/Object;

    if-eqz v2, :cond_2

    .line 283
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p3}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->name:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 285
    :cond_2
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "msg.set.prop.no.setter"

    invoke-static {v3, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 319
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v1    # "prop":Ljava/lang/String;
    :cond_3
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 292
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 293
    .restart local v0    # "cx":Lcom/trendmicro/hippo/Context;
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    instance-of v3, v2, Lcom/trendmicro/hippo/MemberBox;

    const/4 v4, 0x0

    if-eqz v3, :cond_6

    .line 294
    check-cast v2, Lcom/trendmicro/hippo/MemberBox;

    .line 295
    .local v2, "nativeSetter":Lcom/trendmicro/hippo/MemberBox;
    iget-object v3, v2, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 298
    .local v3, "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v3

    sub-int/2addr v5, v1

    aget-object v5, v3, v5

    .line 299
    .local v5, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v5}, Lcom/trendmicro/hippo/FunctionObject;->getTypeTag(Ljava/lang/Class;)I

    move-result v6

    .line 300
    .local v6, "tag":I
    invoke-static {v0, p3, p1, v6}, Lcom/trendmicro/hippo/FunctionObject;->convertArg(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v7

    .line 304
    .local v7, "actualArg":Ljava/lang/Object;
    iget-object v8, v2, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    if-nez v8, :cond_5

    .line 305
    move-object v8, p3

    .line 306
    .local v8, "setterThis":Ljava/lang/Object;
    new-array v9, v1, [Ljava/lang/Object;

    aput-object v7, v9, v4

    move-object v4, v9

    .local v4, "args":[Ljava/lang/Object;
    goto :goto_1

    .line 308
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v8    # "setterThis":Ljava/lang/Object;
    :cond_5
    iget-object v8, v2, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 309
    .restart local v8    # "setterThis":Ljava/lang/Object;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    aput-object p3, v9, v4

    aput-object v7, v9, v1

    move-object v4, v9

    .line 311
    .restart local v4    # "args":[Ljava/lang/Object;
    :goto_1
    invoke-virtual {v2, v8, v4}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .end local v2    # "nativeSetter":Lcom/trendmicro/hippo/MemberBox;
    .end local v3    # "pTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v5    # "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "tag":I
    .end local v7    # "actualArg":Ljava/lang/Object;
    .end local v8    # "setterThis":Ljava/lang/Object;
    goto :goto_2

    .line 312
    :cond_6
    instance-of v3, v2, Lcom/trendmicro/hippo/Function;

    if-eqz v3, :cond_7

    .line 313
    check-cast v2, Lcom/trendmicro/hippo/Function;

    .line 314
    .local v2, "f":Lcom/trendmicro/hippo/Function;
    invoke-interface {v2}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v4

    invoke-interface {v2, v0, v3, p3, v5}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 312
    .end local v2    # "f":Lcom/trendmicro/hippo/Function;
    :cond_7
    :goto_2
    nop

    .line 317
    :goto_3
    return v1
.end method
