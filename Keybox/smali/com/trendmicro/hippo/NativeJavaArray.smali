.class public Lcom/trendmicro/hippo/NativeJavaArray;
.super Lcom/trendmicro/hippo/NativeJavaObject;
.source "NativeJavaArray.java"

# interfaces
.implements Lcom/trendmicro/hippo/SymbolScriptable;


# static fields
.field private static final serialVersionUID:J = -0xcd2c99e10870ec5L


# instance fields
.field array:Ljava/lang/Object;

.field cls:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field length:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 3
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "array"    # Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 42
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 43
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    .line 47
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    .line 48
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->cls:Ljava/lang/Class;

    .line 49
    return-void

    .line 44
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Array expected"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static wrap(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeJavaArray;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "array"    # Ljava/lang/Object;

    .line 32
    new-instance v0, Lcom/trendmicro/hippo/NativeJavaArray;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/NativeJavaArray;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 0
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 121
    return-void
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 82
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    if-ge p1, v0, :cond_0

    .line 83
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 84
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    invoke-static {v1, p1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 85
    .local v1, "obj":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaArray;->cls:Ljava/lang/Class;

    invoke-virtual {v2, v0, p0, v1, v3}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 87
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 92
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 95
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 68
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    iget v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 70
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/NativeJavaObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 71
    .local v0, "result":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/NativeJavaArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    .line 72
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaArray;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 74
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    .line 75
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 74
    const-string v2, "msg.java.member.not.found"

    invoke-static {v2, v1, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 77
    :cond_2
    :goto_0
    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 28
    const-string v0, "JavaArray"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 125
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_3

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 127
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    .line 128
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 129
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 130
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 131
    :cond_2
    return-object p0

    .line 126
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .line 136
    iget v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 137
    .local v0, "result":[Ljava/lang/Object;
    iget v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    .line 138
    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 139
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_0

    .line 140
    :cond_0
    return-object v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->prototype:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 154
    nop

    .line 155
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaArray;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptableObject;->getArrayPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 157
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->prototype:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 58
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 63
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->IS_CONCAT_SPREADABLE:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 53
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/NativeJavaObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

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

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "value"    # Lcom/trendmicro/hippo/Scriptable;

    .line 145
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-nez v0, :cond_0

    .line 146
    const/4 v0, 0x0

    return v0

    .line 147
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 148
    .local v0, "instance":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->cls:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 108
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    if-ge p1, v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->cls:Ljava/lang/Class;

    invoke-static {p3, v1}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p1, v1}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 116
    return-void

    .line 112
    :cond_0
    nop

    .line 113
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/trendmicro/hippo/NativeJavaArray;->length:I

    add-int/lit8 v1, v1, -0x1

    .line 114
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 112
    const-string v2, "msg.java.array.index.out.of.bounds"

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 101
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    return-void

    .line 102
    :cond_0
    const-string v0, "msg.java.array.member.not.found"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public unwrap()Ljava/lang/Object;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaArray;->array:Ljava/lang/Object;

    return-object v0
.end method
