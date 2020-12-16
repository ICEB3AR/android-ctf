.class public Lcom/trendmicro/hippo/NativeJavaClass;
.super Lcom/trendmicro/hippo/NativeJavaObject;
.source "NativeJavaClass.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;


# static fields
.field static final javaClassPropertyName:Ljava/lang/String; = "__javaObject__"

.field private static final serialVersionUID:J = -0x59a93e92bdc24ba0L


# instance fields
.field private staticFieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>()V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 40
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/trendmicro/hippo/NativeJavaClass;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "isAdapter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 44
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 45
    return-void
.end method

.method static constructInternal([Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Ljava/lang/Object;
    .locals 6
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "ctor"    # Lcom/trendmicro/hippo/MemberBox;

    .line 216
    iget-object v0, p1, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 218
    .local v0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-boolean v1, p1, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    if-eqz v1, :cond_4

    .line 220
    array-length v1, v0

    new-array v1, v1, [Ljava/lang/Object;

    .line 221
    .local v1, "newArgs":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_0

    .line 222
    aget-object v3, p0, v2

    aget-object v4, v0, v2

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    .line 221
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 229
    .end local v2    # "i":I
    :cond_0
    array-length v2, p0

    array-length v3, v0

    if-ne v2, v3, :cond_2

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p0, v2

    if-eqz v2, :cond_1

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p0, v2

    instance-of v2, v2, Lcom/trendmicro/hippo/NativeArray;

    if-nez v2, :cond_1

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p0, v2

    instance-of v2, v2, Lcom/trendmicro/hippo/NativeJavaArray;

    if-eqz v2, :cond_2

    .line 235
    :cond_1
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p0, v2

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v3, v0, v3

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .local v2, "varArgs":Ljava/lang/Object;
    goto :goto_2

    .line 239
    .end local v2    # "varArgs":Ljava/lang/Object;
    :cond_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v0, v2

    .line 240
    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 241
    .local v2, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v3, p0

    array-length v4, v0

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    .line 243
    .local v3, "varArgs":Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-static {v3}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 244
    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    add-int/2addr v5, v4

    aget-object v5, p0, v5

    invoke-static {v5, v2}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 246
    .local v5, "value":Ljava/lang/Object;
    invoke-static {v3, v4, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 243
    .end local v5    # "value":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    move-object v2, v3

    .line 251
    .end local v3    # "varArgs":Ljava/lang/Object;
    .end local v4    # "i":I
    .local v2, "varArgs":Ljava/lang/Object;
    :goto_2
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aput-object v2, v1, v3

    .line 253
    move-object p0, v1

    .line 254
    .end local v1    # "newArgs":[Ljava/lang/Object;
    .end local v2    # "varArgs":Ljava/lang/Object;
    goto :goto_4

    .line 255
    :cond_4
    move-object v1, p0

    .line 256
    .local v1, "origArgs":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    array-length v3, p0

    if-ge v2, v3, :cond_7

    .line 257
    aget-object v3, p0, v2

    .line 258
    .local v3, "arg":Ljava/lang/Object;
    aget-object v4, v0, v2

    invoke-static {v3, v4}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    .line 259
    .local v4, "x":Ljava/lang/Object;
    if-eq v4, v3, :cond_6

    .line 260
    if-ne p0, v1, :cond_5

    .line 261
    invoke-virtual {v1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v5

    move-object p0, v5

    check-cast p0, [Ljava/lang/Object;

    .line 263
    :cond_5
    aput-object v4, p0, v2

    .line 256
    .end local v3    # "arg":Ljava/lang/Object;
    .end local v4    # "x":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 268
    .end local v1    # "origArgs":[Ljava/lang/Object;
    .end local v2    # "i":I
    :cond_7
    :goto_4
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/MemberBox;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static constructSpecific(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "ctor"    # Lcom/trendmicro/hippo/MemberBox;

    .line 207
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/NativeJavaClass;->constructInternal([Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Ljava/lang/Object;

    move-result-object v0

    .line 210
    .local v0, "instance":Ljava/lang/Object;
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 211
    .local v1, "topLevel":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    invoke-virtual {v2, p0, v1, v0}, Lcom/trendmicro/hippo/WrapFactory;->wrapNewObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2
.end method

.method private static findNestedClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 299
    .local p0, "parentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "nestedClassName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 301
    .local v1, "loader":Ljava/lang/ClassLoader;
    if-nez v1, :cond_0

    .line 306
    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    return-object v2

    .line 308
    :cond_0
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 137
    array-length v0, p4

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    aget-object v1, p4, v0

    instance-of v1, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_2

    .line 138
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v1

    .line 139
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    aget-object v0, p4, v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 141
    .local v0, "p":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    instance-of v2, v0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_1

    .line 142
    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 143
    .local v2, "o":Ljava/lang/Object;
    invoke-virtual {v1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 144
    return-object v0

    .line 146
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 147
    if-nez v0, :cond_0

    .line 149
    .end local v0    # "p":Lcom/trendmicro/hippo/Scriptable;
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    invoke-virtual {p0, p1, p2, p4}, Lcom/trendmicro/hippo/NativeJavaClass;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 9
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 155
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v0

    .line 156
    .local v0, "classObject":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v1

    .line 157
    .local v1, "modifiers":I
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isInterface(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 158
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 160
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v2, v2, Lcom/trendmicro/hippo/JavaMembers;->ctors:Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 161
    .local v2, "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    invoke-virtual {v2, p1, p3}, Lcom/trendmicro/hippo/NativeJavaMethod;->findCachedFunction(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;)I

    move-result v3

    .line 162
    .local v3, "index":I
    if-ltz v3, :cond_0

    .line 169
    iget-object v4, v2, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v4, v4, v3

    invoke-static {p1, p2, p3, v4}, Lcom/trendmicro/hippo/NativeJavaClass;->constructSpecific(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    return-object v4

    .line 163
    :cond_0
    invoke-static {p3}, Lcom/trendmicro/hippo/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 164
    .local v4, "sig":Ljava/lang/String;
    nop

    .line 165
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 164
    const-string v6, "msg.no.java.ctor"

    invoke-static {v6, v5, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 171
    .end local v2    # "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v3    # "index":I
    .end local v4    # "sig":Ljava/lang/String;
    :cond_1
    array-length v2, p3

    if-eqz v2, :cond_5

    .line 174
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 175
    .local v2, "topLevel":Lcom/trendmicro/hippo/Scriptable;
    const-string v3, ""

    .line 179
    .local v3, "msg":Ljava/lang/String;
    :try_start_0
    const-string v4, "Dalvik"

    const-string v5, "java.vm.name"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_2

    .line 180
    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 181
    aget-object v4, p3, v5

    .line 182
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptableObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    .line 181
    invoke-static {v0, v4}, Lcom/trendmicro/hippo/NativeJavaClass;->createInterfaceAdapter(Ljava/lang/Class;Lcom/trendmicro/hippo/ScriptableObject;)Ljava/lang/Object;

    move-result-object v4

    .line 183
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, p1, p2, v4, v6}, Lcom/trendmicro/hippo/WrapFactory;->wrapAsJavaObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    return-object v5

    .line 187
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_2
    const-string v4, "JavaAdapter"

    invoke-interface {v2, v4, v2}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 188
    .local v4, "v":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/NativeJavaClass;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v6, :cond_3

    .line 189
    move-object v6, v4

    check-cast v6, Lcom/trendmicro/hippo/Function;

    .line 191
    .local v6, "f":Lcom/trendmicro/hippo/Function;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p0, v7, v5

    const/4 v8, 0x1

    aget-object v5, p3, v5

    aput-object v5, v7, v8

    move-object v5, v7

    .line 192
    .local v5, "adapterArgs":[Ljava/lang/Object;
    invoke-interface {v6, p1, v2, v5}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v7

    .line 199
    .end local v4    # "v":Ljava/lang/Object;
    .end local v5    # "adapterArgs":[Ljava/lang/Object;
    .end local v6    # "f":Lcom/trendmicro/hippo/Function;
    :cond_3
    goto :goto_0

    .line 194
    :catch_0
    move-exception v4

    .line 196
    .local v4, "ex":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 197
    .local v5, "m":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 198
    move-object v3, v5

    .line 200
    .end local v4    # "ex":Ljava/lang/Exception;
    .end local v5    # "m":Ljava/lang/String;
    :cond_4
    :goto_0
    nop

    .line 201
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 200
    const-string v5, "msg.cant.instantiate"

    invoke-static {v5, v3, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 172
    .end local v2    # "topLevel":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "msg":Ljava/lang/String;
    :cond_5
    const-string v2, "msg.adapter.zero.args"

    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 70
    const-string v0, "prototype"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    const/4 v0, 0x0

    return-object v0

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->staticFieldAndMethods:Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 74
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 75
    .local v0, "result":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 76
    return-object v0

    .line 79
    .end local v0    # "result":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 80
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaClass;->javaObject:Ljava/lang/Object;

    invoke-virtual {v0, p0, p1, v2, v1}, Lcom/trendmicro/hippo/JavaMembers;->get(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 83
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 84
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 85
    .local v1, "scope":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    .line 87
    .local v2, "wrapFactory":Lcom/trendmicro/hippo/WrapFactory;
    const-string v3, "__javaObject__"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 88
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaClass;->javaObject:Ljava/lang/Object;

    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 94
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/trendmicro/hippo/NativeJavaClass;->findNestedClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 95
    .local v3, "nestedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v3, :cond_4

    .line 96
    invoke-virtual {v2, v0, v1, v3}, Lcom/trendmicro/hippo/WrapFactory;->wrapJavaClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 98
    .local v4, "nestedValue":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v4, p0}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 99
    return-object v4

    .line 102
    .end local v4    # "nestedValue":Lcom/trendmicro/hippo/Scriptable;
    :cond_4
    iget-object v4, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    invoke-virtual {v4, p1}, Lcom/trendmicro/hippo/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 56
    const-string v0, "JavaClass"

    return-object v0
.end method

.method public getClassObject()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 116
    invoke-super {p0}, Lcom/trendmicro/hippo/NativeJavaObject;->unwrap()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

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

    .line 121
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_3

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    .line 124
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 125
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 126
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 127
    :cond_2
    return-object p0

    .line 122
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/JavaMembers;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "__javaObject__"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "value"    # Lcom/trendmicro/hippo/Scriptable;

    .line 287
    instance-of v0, p1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/trendmicro/hippo/NativeJavaClass;

    if-nez v0, :cond_0

    .line 289
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    .line 291
    .local v0, "instance":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 295
    .end local v0    # "instance":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected initMembers()V
    .locals 3

    .line 49
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->javaObject:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Class;

    .line 50
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaClass;->parent:Lcom/trendmicro/hippo/Scriptable;

    iget-boolean v2, p0, Lcom/trendmicro/hippo/NativeJavaClass;->isAdapter:Z

    invoke-static {v1, v0, v0, v2}, Lcom/trendmicro/hippo/JavaMembers;->lookupClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lcom/trendmicro/hippo/JavaMembers;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    .line 51
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v0, v2}, Lcom/trendmicro/hippo/JavaMembers;->getFieldAndMethodsObjects(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/NativeJavaClass;->staticFieldAndMethods:Ljava/util/Map;

    .line 52
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 107
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaClass;->javaObject:Ljava/lang/Object;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/JavaMembers;->put(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 108
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[JavaClass "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
