.class public final Lcom/trendmicro/hippo/JavaAdapter;
.super Ljava/lang/Object;
.source "JavaAdapter.java"

# interfaces
.implements Lcom/trendmicro/hippo/IdFunctionCall;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;
    }
.end annotation


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_JavaAdapter:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1195
    const-string v0, "JavaAdapter"

    sput-object v0, Lcom/trendmicro/hippo/JavaAdapter;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I
    .locals 5
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/StringBuilder;",
            ")I"
        }
    .end annotation

    .line 1138
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v0, 0x28

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1139
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    .line 1140
    .local v0, "firstLocal":I
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p0, v2

    .line 1141
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2, v3}, Lcom/trendmicro/hippo/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 1142
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq v3, v4, :cond_0

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v3, v4, :cond_1

    .line 1144
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 1140
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1147
    :cond_2
    const/16 v1, 0x29

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1148
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 1149
    return v0
.end method

.method private static appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Method;",
            ">;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 503
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    .local p2, "skip":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 504
    .local v0, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_5

    .line 505
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v0, v1

    aget-object v4, v0, v1

    .line 507
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 506
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 508
    .local v2, "methodKey":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 509
    goto :goto_1

    .line 510
    :cond_0
    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    .line 511
    .local v3, "mods":I
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 512
    goto :goto_1

    .line 513
    :cond_1
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 516
    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 517
    goto :goto_1

    .line 519
    :cond_2
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 520
    :cond_3
    aget-object v4, v0, v1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 521
    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 504
    .end local v2    # "methodKey":Ljava/lang/String;
    .end local v3    # "mods":I
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 524
    .end local v1    # "i":I
    :cond_5
    return-void
.end method

.method private static appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/StringBuilder;"
        }
    .end annotation

    .line 1154
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1155
    const/16 v0, 0x5b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1156
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    goto :goto_0

    .line 1158
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1160
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    .line 1161
    const/16 v0, 0x5a

    .local v0, "typeLetter":C
    goto :goto_1

    .line 1162
    .end local v0    # "typeLetter":C
    :cond_1
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 1163
    const/16 v0, 0x4a

    .restart local v0    # "typeLetter":C
    goto :goto_1

    .line 1165
    .end local v0    # "typeLetter":C
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1166
    .local v0, "typeName":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    move v0, v1

    .line 1168
    .local v0, "typeLetter":C
    :goto_1
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1169
    .end local v0    # "typeLetter":C
    goto :goto_2

    .line 1170
    :cond_3
    const/16 v0, 0x4c

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1171
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1172
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1174
    :goto_2
    return-object p0
.end method

.method public static callMethod(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 9
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/Function;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsToWrap"    # J

    .line 579
    if-nez p2, :cond_0

    .line 581
    const/4 v0, 0x0

    return-object v0

    .line 583
    :cond_0
    if-nez p0, :cond_1

    .line 584
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object p0

    .line 587
    :cond_1
    invoke-interface {p2}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v7

    .line 588
    .local v7, "scope":Lcom/trendmicro/hippo/Scriptable;
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-nez v0, :cond_2

    .line 589
    invoke-static {p0, p2, v7, p1, p3}, Lcom/trendmicro/hippo/Context;->call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 592
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v8

    .line 593
    .local v8, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v8, :cond_3

    .line 594
    move-object v0, v8

    move-object v1, v7

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-wide v5, p4

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/JavaAdapter;->doCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 596
    :cond_3
    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    #disallowed odex opcode
    #sget-object-volatile v6, Landroid/app/Notification;->audioStreamType:I
    nop

    nop

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convertResult(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "result"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 107
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p1, v0, :cond_0

    .line 112
    const/4 v0, 0x0

    return-object v0

    .line 114
    :cond_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static createAdapterCode(Lcom/trendmicro/hippo/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B
    .locals 26
    .param p0, "functionNames"    # Lcom/trendmicro/hippo/ObjToIntMap;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p4, "scriptClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/ObjToIntMap;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")[B"
        }
    .end annotation

    .line 360
    .local p2, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v1, p0

    move-object/from16 v9, p1

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    new-instance v0, Lcom/trendmicro/classfile/ClassFileWriter;

    .line 361
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "<adapter>"

    invoke-direct {v0, v9, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v12, v0

    .line 363
    .local v12, "cfw":Lcom/trendmicro/classfile/ClassFileWriter;
    const-string v0, "factory"

    const-string v2, "Lcom/trendmicro/hippo/ContextFactory;"

    const/16 v3, 0x11

    invoke-virtual {v12, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 366
    const-string v0, "delegee"

    const-string v2, "Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v12, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 369
    const-string v0, "self"

    invoke-virtual {v12, v0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 372
    if-nez v10, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, v10

    :goto_0
    move v14, v0

    .line 373
    .local v14, "interfacesCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v14, :cond_2

    .line 374
    aget-object v2, v10, v0

    if-eqz v2, :cond_1

    .line 375
    aget-object v2, v10, v0

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addInterface(Ljava/lang/String;)V

    .line 373
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 378
    .end local v0    # "i":I
    :cond_2
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v15

    .line 379
    .local v15, "superName":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v8

    .line 380
    .local v8, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v0, v8

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v0, :cond_5

    aget-object v3, v8, v2

    .line 381
    .local v3, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v3}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v4

    .line 382
    .local v4, "mod":I
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 383
    :cond_3
    invoke-static {v12, v9, v15, v3}, Lcom/trendmicro/hippo/JavaAdapter;->generateCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)V

    .line 380
    .end local v3    # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "mod":I
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 386
    :cond_5
    invoke-static {v12, v9, v15}, Lcom/trendmicro/hippo/JavaAdapter;->generateSerialCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    if-eqz v11, :cond_6

    .line 388
    invoke-static {v12, v9, v15, v11}, Lcom/trendmicro/hippo/JavaAdapter;->generateEmptyCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    :cond_6
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    move-object v7, v0

    .line 392
    .local v7, "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    move-object v6, v0

    .line 395
    .local v6, "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    const/4 v0, 0x0

    move v5, v0

    .local v5, "i":I
    :goto_3
    if-ge v5, v14, :cond_c

    .line 396
    aget-object v0, v10, v5

    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 397
    .local v4, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    move v3, v0

    .local v3, "j":I
    :goto_4
    array-length v0, v4

    if-ge v3, v0, :cond_b

    .line 398
    aget-object v2, v4, v3

    .line 399
    .local v2, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v16

    .line 400
    .local v16, "mods":I
    invoke-static/range {v16 .. v16}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static/range {v16 .. v16}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->isDefault()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 401
    move/from16 v19, v3

    move-object/from16 v24, v4

    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    move-object/from16 v18, v8

    goto/16 :goto_6

    .line 403
    :cond_7
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v13

    .line 404
    .local v13, "methodName":Ljava/lang/String;
    move-object/from16 v18, v8

    .end local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .local v18, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 405
    .local v8, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {v1, v13}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 407
    move-object/from16 v9, p2

    :try_start_0
    invoke-virtual {v9, v13, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 411
    move/from16 v19, v3

    move-object/from16 v24, v4

    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    goto/16 :goto_6

    .line 412
    :catch_0
    move-exception v0

    goto :goto_5

    .line 405
    :cond_8
    move-object/from16 v9, p2

    .line 418
    :goto_5
    invoke-static {v2, v8}, Lcom/trendmicro/hippo/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 419
    .local v0, "methodSignature":Ljava/lang/String;
    move/from16 v19, v3

    .end local v3    # "j":I
    .local v19, "j":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 420
    .local v3, "methodKey":Ljava/lang/String;
    invoke-virtual {v7, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_9

    .line 421
    nop

    .line 422
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v20

    const/16 v21, 0x1

    .line 421
    move-object/from16 v22, v2

    .end local v2    # "method":Ljava/lang/reflect/Method;
    .local v22, "method":Ljava/lang/reflect/Method;
    move-object v2, v12

    move-object/from16 v23, v3

    .end local v3    # "methodKey":Ljava/lang/String;
    .local v23, "methodKey":Ljava/lang/String;
    move-object/from16 v3, p1

    move-object/from16 v24, v4

    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    .local v24, "methods":[Ljava/lang/reflect/Method;
    move-object v4, v13

    move/from16 v25, v5

    .end local v5    # "i":I
    .local v25, "i":I
    move-object v5, v8

    move-object v9, v6

    .end local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .local v9, "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    move-object/from16 v6, v20

    move-object v10, v7

    .end local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .local v10, "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    move/from16 v7, v21

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/JavaAdapter;->generateMethod(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    .line 423
    move-object/from16 v2, v23

    const/4 v3, 0x0

    .end local v23    # "methodKey":Ljava/lang/String;
    .local v2, "methodKey":Ljava/lang/String;
    invoke-virtual {v10, v2, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 424
    invoke-virtual {v9, v13, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    goto :goto_6

    .line 420
    .end local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v22    # "method":Ljava/lang/reflect/Method;
    .end local v24    # "methods":[Ljava/lang/reflect/Method;
    .end local v25    # "i":I
    .local v2, "method":Ljava/lang/reflect/Method;
    .restart local v3    # "methodKey":Ljava/lang/String;
    .restart local v4    # "methods":[Ljava/lang/reflect/Method;
    .restart local v5    # "i":I
    .restart local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    :cond_9
    move-object/from16 v22, v2

    move-object v2, v3

    move-object/from16 v24, v4

    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    .end local v3    # "methodKey":Ljava/lang/String;
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    .end local v5    # "i":I
    .end local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .local v2, "methodKey":Ljava/lang/String;
    .restart local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v22    # "method":Ljava/lang/reflect/Method;
    .restart local v24    # "methods":[Ljava/lang/reflect/Method;
    .restart local v25    # "i":I
    goto :goto_6

    .line 400
    .end local v0    # "methodSignature":Ljava/lang/String;
    .end local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v13    # "methodName":Ljava/lang/String;
    .end local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .end local v19    # "j":I
    .end local v22    # "method":Ljava/lang/reflect/Method;
    .end local v24    # "methods":[Ljava/lang/reflect/Method;
    .end local v25    # "i":I
    .local v2, "method":Ljava/lang/reflect/Method;
    .local v3, "j":I
    .restart local v4    # "methods":[Ljava/lang/reflect/Method;
    .restart local v5    # "i":I
    .restart local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .local v8, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    :cond_a
    move-object/from16 v22, v2

    move/from16 v19, v3

    move-object/from16 v24, v4

    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    move-object/from16 v18, v8

    .line 397
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "j":I
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    .end local v5    # "i":I
    .end local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .end local v16    # "mods":I
    .restart local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v19    # "j":I
    .restart local v24    # "methods":[Ljava/lang/reflect/Method;
    .restart local v25    # "i":I
    :goto_6
    add-int/lit8 v3, v19, 0x1

    move-object v6, v9

    move-object v7, v10

    move-object/from16 v8, v18

    move-object/from16 v4, v24

    move/from16 v5, v25

    move-object/from16 v9, p1

    move-object/from16 v10, p3

    .end local v19    # "j":I
    .restart local v3    # "j":I
    goto/16 :goto_4

    .end local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .end local v24    # "methods":[Ljava/lang/reflect/Method;
    .end local v25    # "i":I
    .restart local v4    # "methods":[Ljava/lang/reflect/Method;
    .restart local v5    # "i":I
    .restart local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    :cond_b
    move/from16 v19, v3

    move-object/from16 v24, v4

    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    move-object/from16 v18, v8

    .line 395
    .end local v3    # "j":I
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    .end local v5    # "i":I
    .end local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v25    # "i":I
    add-int/lit8 v5, v25, 0x1

    move-object/from16 v9, p1

    move-object/from16 v10, p3

    .end local v25    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_3

    .end local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    :cond_c
    move/from16 v25, v5

    move-object v9, v6

    move-object v10, v7

    move-object/from16 v18, v8

    .line 433
    .end local v5    # "i":I
    .end local v6    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v7    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .end local v8    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v9    # "generatedMethods":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v10    # "generatedOverrides":Lcom/trendmicro/hippo/ObjToIntMap;
    .restart local v18    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/JavaAdapter;->getOverridableMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 434
    .local v0, "methods":[Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    move v13, v2

    .local v13, "j":I
    :goto_7
    array-length v2, v0

    if-ge v13, v2, :cond_11

    .line 435
    aget-object v8, v0, v13

    .line 436
    .local v8, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v16

    .line 440
    .restart local v16    # "mods":I
    invoke-static/range {v16 .. v16}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v19

    .line 441
    .local v19, "isAbstractMethod":Z
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    .line 442
    .local v7, "methodName":Ljava/lang/String;
    if-nez v19, :cond_e

    invoke-virtual {v1, v7}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    goto :goto_8

    :cond_d
    move-object/from16 v22, v0

    const/16 v20, 0x0

    goto/16 :goto_9

    .line 445
    :cond_e
    :goto_8
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 446
    .local v6, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {v8, v6}, Lcom/trendmicro/hippo/JavaAdapter;->getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    .line 447
    .local v5, "methodSignature":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 448
    .local v4, "methodKey":Ljava/lang/String;
    invoke-virtual {v10, v4}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 449
    nop

    .line 450
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v20

    const/16 v21, 0x1

    .line 449
    move-object v2, v12

    move-object/from16 v3, p1

    move-object/from16 v22, v0

    move-object v0, v4

    .end local v4    # "methodKey":Ljava/lang/String;
    .local v0, "methodKey":Ljava/lang/String;
    .local v22, "methods":[Ljava/lang/reflect/Method;
    move-object v4, v7

    move-object/from16 v23, v5

    .end local v5    # "methodSignature":Ljava/lang/String;
    .local v23, "methodSignature":Ljava/lang/String;
    move-object v5, v6

    move-object/from16 v24, v6

    .end local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local v24, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v6, v20

    move-object v11, v7

    .end local v7    # "methodName":Ljava/lang/String;
    .local v11, "methodName":Ljava/lang/String;
    move/from16 v7, v21

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/JavaAdapter;->generateMethod(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    .line 451
    const/4 v7, 0x0

    invoke-virtual {v10, v0, v7}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 452
    invoke-virtual {v9, v11, v7}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 456
    if-nez v19, :cond_f

    .line 457
    nop

    .line 459
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v17

    .line 457
    move-object v2, v12

    move-object/from16 v3, p1

    move-object v4, v15

    move-object v5, v11

    move-object/from16 v6, v23

    move/from16 v20, v7

    move-object/from16 v7, v24

    move-object/from16 v21, v8

    .end local v8    # "method":Ljava/lang/reflect/Method;
    .local v21, "method":Ljava/lang/reflect/Method;
    move-object/from16 v8, v17

    invoke-static/range {v2 .. v8}, Lcom/trendmicro/hippo/JavaAdapter;->generateSuper(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_9

    .line 456
    .end local v21    # "method":Ljava/lang/reflect/Method;
    .restart local v8    # "method":Ljava/lang/reflect/Method;
    :cond_f
    move/from16 v20, v7

    move-object/from16 v21, v8

    .end local v8    # "method":Ljava/lang/reflect/Method;
    .restart local v21    # "method":Ljava/lang/reflect/Method;
    goto :goto_9

    .line 448
    .end local v11    # "methodName":Ljava/lang/String;
    .end local v21    # "method":Ljava/lang/reflect/Method;
    .end local v22    # "methods":[Ljava/lang/reflect/Method;
    .end local v23    # "methodSignature":Ljava/lang/String;
    .end local v24    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local v0, "methods":[Ljava/lang/reflect/Method;
    .restart local v4    # "methodKey":Ljava/lang/String;
    .restart local v5    # "methodSignature":Ljava/lang/String;
    .restart local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v7    # "methodName":Ljava/lang/String;
    .restart local v8    # "method":Ljava/lang/reflect/Method;
    :cond_10
    move-object/from16 v22, v0

    move-object v0, v4

    move-object/from16 v23, v5

    move-object/from16 v24, v6

    move-object v11, v7

    move-object/from16 v21, v8

    const/16 v20, 0x0

    .line 434
    .end local v0    # "methods":[Ljava/lang/reflect/Method;
    .end local v4    # "methodKey":Ljava/lang/String;
    .end local v5    # "methodSignature":Ljava/lang/String;
    .end local v6    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v8    # "method":Ljava/lang/reflect/Method;
    .end local v16    # "mods":I
    .end local v19    # "isAbstractMethod":Z
    .restart local v22    # "methods":[Ljava/lang/reflect/Method;
    :goto_9
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v11, p4

    move-object/from16 v0, v22

    goto/16 :goto_7

    .end local v22    # "methods":[Ljava/lang/reflect/Method;
    .restart local v0    # "methods":[Ljava/lang/reflect/Method;
    :cond_11
    move-object/from16 v22, v0

    .line 467
    .end local v0    # "methods":[Ljava/lang/reflect/Method;
    .end local v13    # "j":I
    .restart local v22    # "methods":[Ljava/lang/reflect/Method;
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;-><init>(Lcom/trendmicro/hippo/ObjToIntMap;)V

    .line 468
    .local v0, "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->start()V

    :goto_a
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->done()Z

    move-result v2

    if-nez v2, :cond_14

    .line 469
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Ljava/lang/String;

    .line 470
    .local v8, "functionName":Ljava/lang/String;
    invoke-virtual {v9, v8}, Lcom/trendmicro/hippo/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 471
    goto :goto_c

    .line 472
    :cond_12
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getValue()I

    move-result v11

    .line 473
    .local v11, "length":I
    new-array v13, v11, [Ljava/lang/Class;

    .line 474
    .local v13, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_b
    if-ge v2, v11, :cond_13

    .line 475
    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    aput-object v3, v13, v2

    .line 474
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 476
    .end local v2    # "k":I
    :cond_13
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    const/4 v7, 0x0

    move-object v2, v12

    move-object/from16 v3, p1

    move-object v4, v8

    move-object v5, v13

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/JavaAdapter;->generateMethod(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V

    .line 468
    .end local v8    # "functionName":Ljava/lang/String;
    .end local v11    # "length":I
    .end local v13    # "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_c
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->next()V

    goto :goto_a

    .line 479
    :cond_14
    invoke-virtual {v12}, Lcom/trendmicro/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public static createAdapterWrapper(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 4
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "adapter"    # Ljava/lang/Object;

    .line 119
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 120
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    new-instance v1, Lcom/trendmicro/hippo/NativeJavaObject;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, v0, p1, v2, v3}, Lcom/trendmicro/hippo/NativeJavaObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 121
    .local v1, "res":Lcom/trendmicro/hippo/NativeJavaObject;
    invoke-virtual {v1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 122
    return-object v1
.end method

.method private static doCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;J)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "f"    # Lcom/trendmicro/hippo/Function;
    .param p4, "args"    # [Ljava/lang/Object;
    .param p5, "argsToWrap"    # J

    .line 604
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p4

    if-eq v0, v1, :cond_1

    .line 605
    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    shl-int/2addr v3, v0

    int-to-long v3, v3

    and-long/2addr v3, p5

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 606
    aget-object v1, p4, v0

    .line 607
    .local v1, "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-nez v2, :cond_0

    .line 608
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, p1, v1, v3}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p4, v0

    .line 604
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 613
    .end local v0    # "i":I
    :cond_1
    invoke-interface {p3, p0, p1, p2, p4}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static generateCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Constructor;)V
    .locals 16
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor<",
            "*>;)V"
        }
    .end annotation

    .line 628
    .local p3, "superCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x3

    .line 629
    .local v3, "locals":S
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 633
    .local v4, "parameters":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v4

    const/16 v6, 0xb7

    const-string v7, "<init>"

    const/4 v8, 0x1

    const/16 v9, 0x2a

    if-nez v5, :cond_0

    .line 634
    const-string v5, "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ContextFactory;)V"

    invoke-virtual {v0, v7, v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 640
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 641
    const-string v5, "()V"

    invoke-virtual {v0, v6, v2, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 643
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v10, "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/ContextFactory;"

    invoke-direct {v5, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 646
    .local v5, "sig":Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    .line 647
    .local v10, "marker":I
    array-length v11, v4

    const/4 v12, 0x0

    move v13, v12

    :goto_0
    if-ge v13, v11, :cond_1

    aget-object v14, v4, v13

    .line 648
    .local v14, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v5, v14}, Lcom/trendmicro/hippo/JavaAdapter;->appendTypeString(Ljava/lang/StringBuilder;Ljava/lang/Class;)Ljava/lang/StringBuilder;

    .line 647
    .end local v14    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 650
    :cond_1
    const-string v11, ")V"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v7, v11, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 654
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 655
    const/4 v11, 0x3

    .line 656
    .local v11, "paramOffset":S
    array-length v13, v4

    :goto_1
    if-ge v12, v13, :cond_2

    aget-object v14, v4, v12

    .line 657
    .local v14, "parameter":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0, v11, v14}, Lcom/trendmicro/hippo/JavaAdapter;->generatePushParam(Lcom/trendmicro/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v15

    add-int/2addr v15, v11

    int-to-short v11, v15

    .line 656
    .end local v14    # "parameter":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 659
    :cond_2
    move v3, v11

    .line 660
    invoke-virtual {v5, v8, v10}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 661
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v6, v2, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 665
    .end local v5    # "sig":Ljava/lang/StringBuilder;
    .end local v10    # "marker":I
    .end local v11    # "paramOffset":S
    :goto_2
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 666
    const/16 v5, 0x2b

    invoke-virtual {v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 667
    const/16 v6, 0xb5

    const-string v7, "delegee"

    const-string v8, "Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v6, v1, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 672
    const/16 v7, 0x2c

    invoke-virtual {v0, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 673
    const-string v7, "factory"

    const-string v10, "Lcom/trendmicro/hippo/ContextFactory;"

    invoke-virtual {v0, v6, v1, v7, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 678
    invoke-virtual {v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 679
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 680
    const/16 v5, 0xb8

    const-string v7, "com/trendmicro/hippo/JavaAdapter"

    const-string v9, "createAdapterWrapper"

    const-string v10, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v5, v7, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    const-string v5, "self"

    invoke-virtual {v0, v6, v1, v5, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    const/16 v5, 0xb1

    invoke-virtual {v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 690
    invoke-virtual {v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 691
    return-void
.end method

.method private static generateEmptyCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .param p3, "scriptClassName"    # Ljava/lang/String;

    .line 734
    const-string v0, "<init>"

    const-string v1, "()V"

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 737
    const/16 v3, 0x2a

    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 738
    const/16 v4, 0xb7

    invoke-virtual {p0, v4, p2, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 741
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 742
    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 743
    const/16 v2, 0xb5

    const-string v5, "factory"

    const-string v6, "Lcom/trendmicro/hippo/ContextFactory;"

    invoke-virtual {p0, v2, p1, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    const/16 v5, 0xbb

    invoke-virtual {p0, v5, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 748
    const/16 v5, 0x59

    invoke-virtual {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 749
    invoke-virtual {p0, v4, p3, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    const/16 v0, 0xb8

    const-string v1, "com/trendmicro/hippo/JavaAdapter"

    const-string v4, "runScript"

    const-string v5, "(Lcom/trendmicro/hippo/Script;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {p0, v0, v1, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    const/16 v4, 0x4c

    invoke-virtual {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 760
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 761
    const/16 v4, 0x2b

    invoke-virtual {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 762
    const-string v5, "delegee"

    const-string v6, "Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {p0, v2, p1, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 765
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 767
    invoke-virtual {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 768
    invoke-virtual {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 769
    const-string v3, "createAdapterWrapper"

    const-string v4, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {p0, v0, v1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    const-string v0, "self"

    invoke-virtual {p0, v2, p1, v0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 778
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 779
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 780
    return-void
.end method

.method private static generateMethod(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;Z)V
    .locals 16
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "genName"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p5, "convertResult"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 951
    .local p3, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p4, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 952
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-static {v3, v4, v5}, Lcom/trendmicro/hippo/JavaAdapter;->appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I

    move-result v6

    .line 953
    .local v6, "paramsEnd":I
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 954
    .local v7, "methodSignature":Ljava/lang/String;
    const/4 v8, 0x1

    invoke-virtual {v0, v2, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 960
    const/16 v9, 0x2a

    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 961
    const/16 v10, 0xb4

    const-string v11, "factory"

    const-string v12, "Lcom/trendmicro/hippo/ContextFactory;"

    invoke-virtual {v0, v10, v1, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 965
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 966
    const-string v11, "self"

    const-string v12, "Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v10, v1, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 971
    const-string v9, "delegee"

    invoke-virtual {v0, v10, v1, v9, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 973
    invoke-virtual {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 974
    const/16 v9, 0xb8

    const-string v10, "com/trendmicro/hippo/JavaAdapter"

    const-string v11, "getFunction"

    const-string v12, "(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;"

    invoke-virtual {v0, v9, v10, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    array-length v11, v3

    invoke-static {v0, v3, v11}, Lcom/trendmicro/hippo/JavaAdapter;->generatePushWrappedArgs(Lcom/trendmicro/classfile/ClassFileWriter;[Ljava/lang/Class;I)V

    .line 985
    array-length v11, v3

    const/16 v12, 0x40

    if-gt v11, v12, :cond_2

    .line 992
    const-wide/16 v11, 0x0

    .line 993
    .local v11, "convertionMask":J
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    array-length v14, v3

    if-eq v13, v14, :cond_1

    .line 994
    aget-object v14, v3, v13

    invoke-virtual {v14}, Ljava/lang/Class;->isPrimitive()Z

    move-result v14

    if-nez v14, :cond_0

    .line 995
    shl-int v14, v8, v13

    int-to-long v14, v14

    or-long/2addr v11, v14

    .line 993
    :cond_0
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 998
    .end local v13    # "i":I
    :cond_1
    invoke-virtual {v0, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(J)V

    .line 1002
    const-string v8, "callMethod"

    const-string v13, "(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;J)Ljava/lang/Object;"

    invoke-virtual {v0, v9, v10, v8, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1012
    move/from16 v8, p5

    invoke-static {v0, v4, v8}, Lcom/trendmicro/hippo/JavaAdapter;->generateReturnResult(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/Class;Z)V

    .line 1014
    int-to-short v9, v6

    invoke-virtual {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1015
    return-void

    .line 988
    .end local v11    # "convertionMask":J
    :cond_2
    move/from16 v8, p5

    const-string v9, "JavaAdapter can not subclass methods with more then 64 arguments."

    invoke-static {v9}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v9

    throw v9
.end method

.method private static generatePopResult(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/Class;)V
    .locals 3
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1061
    .local p1, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1062
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1063
    .local v0, "typeName":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x66

    if-eq v1, v2, :cond_2

    const/16 v2, 0x69

    if-eq v1, v2, :cond_1

    const/16 v2, 0x6c

    if-eq v1, v2, :cond_0

    const/16 v2, 0x73

    if-eq v1, v2, :cond_1

    const/16 v2, 0x7a

    if-eq v1, v2, :cond_1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 1078
    :pswitch_0
    const/16 v1, 0xaf

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_0

    .line 1072
    :cond_0
    const/16 v1, 0xad

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1073
    goto :goto_0

    .line 1069
    :cond_1
    :pswitch_1
    const/16 v1, 0xac

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1070
    goto :goto_0

    .line 1075
    :cond_2
    const/16 v1, 0xae

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1076
    nop

    .line 1081
    .end local v0    # "typeName":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 1082
    :cond_3
    const/16 v0, 0xb0

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1084
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x62
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static generatePushParam(Lcom/trendmicro/classfile/ClassFileWriter;ILjava/lang/Class;)I
    .locals 5
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "paramOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "I",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 1024
    .local p2, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1025
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1026
    return v1

    .line 1028
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1029
    .local v0, "typeName":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x66

    if-eq v2, v3, :cond_3

    const/16 v3, 0x69

    if-eq v2, v3, :cond_2

    const/16 v3, 0x6c

    const/4 v4, 0x2

    if-eq v2, v3, :cond_1

    const/16 v3, 0x73

    if-eq v2, v3, :cond_2

    const/16 v3, 0x7a

    if-eq v2, v3, :cond_2

    packed-switch v2, :pswitch_data_0

    .line 1050
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1047
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 1048
    return v4

    .line 1040
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLLoad(I)V

    .line 1041
    return v4

    .line 1036
    :cond_2
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 1037
    return v1

    .line 1044
    :cond_3
    invoke-virtual {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addFLoad(I)V

    .line 1045
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x62
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static generatePushWrappedArgs(Lcom/trendmicro/classfile/ClassFileWriter;[Ljava/lang/Class;I)V
    .locals 3
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "arrayLength"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "[",
            "Ljava/lang/Class<",
            "*>;I)V"
        }
    .end annotation

    .line 792
    .local p1, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 793
    const/16 v0, 0xbd

    const-string v1, "java/lang/Object"

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 794
    const/4 v0, 0x1

    .line 795
    .local v0, "paramOffset":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-eq v1, v2, :cond_0

    .line 796
    const/16 v2, 0x59

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 797
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 798
    aget-object v2, p1, v1

    invoke-static {p0, v0, v2}, Lcom/trendmicro/hippo/JavaAdapter;->generateWrapArg(Lcom/trendmicro/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v2

    add-int/2addr v0, v2

    .line 799
    const/16 v2, 0x53

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 795
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 801
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method static generateReturnResult(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/Class;Z)V
    .locals 5
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "callConvertResult"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 874
    .local p1, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 875
    const/16 v0, 0x57

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 876
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 878
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/16 v1, 0xac

    const-string v2, "com/trendmicro/hippo/Context"

    const/16 v3, 0xb8

    if-ne p1, v0, :cond_1

    .line 879
    const-string v0, "toBoolean"

    const-string v4, "(Ljava/lang/Object;)Z"

    invoke-virtual {p0, v3, v2, v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 882
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 884
    :cond_1
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_2

    .line 888
    const-string v0, "toString"

    const-string v4, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-virtual {p0, v3, v2, v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 893
    const/16 v0, 0xb6

    const-string v2, "java/lang/String"

    const-string v3, "charAt"

    const-string v4, "(I)C"

    invoke-virtual {p0, v0, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto/16 :goto_2

    .line 897
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 898
    const-string v0, "toNumber"

    const-string v4, "(Ljava/lang/Object;)D"

    invoke-virtual {p0, v3, v2, v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 901
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 902
    .local v0, "typeName":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x62

    if-eq v2, v3, :cond_7

    const/16 v3, 0x64

    if-eq v2, v3, :cond_6

    const/16 v3, 0x66

    if-eq v2, v3, :cond_5

    const/16 v3, 0x69

    if-eq v2, v3, :cond_7

    const/16 v3, 0x6c

    if-eq v2, v3, :cond_4

    const/16 v3, 0x73

    if-ne v2, v3, :cond_3

    goto :goto_0

    .line 921
    :cond_3
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected return type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 922
    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 910
    :cond_4
    const/16 v1, 0x8f

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 911
    const/16 v1, 0xad

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 912
    goto :goto_1

    .line 914
    :cond_5
    const/16 v1, 0x90

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 915
    const/16 v1, 0xae

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 916
    goto :goto_1

    .line 918
    :cond_6
    const/16 v1, 0xaf

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 919
    goto :goto_1

    .line 906
    :cond_7
    :goto_0
    const/16 v2, 0x8e

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 907
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 908
    nop

    .line 925
    .end local v0    # "typeName":Ljava/lang/String;
    :goto_1
    goto :goto_2

    .line 926
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 927
    .local v0, "retTypeStr":Ljava/lang/String;
    if-eqz p2, :cond_9

    .line 928
    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadConstant(Ljava/lang/String;)V

    .line 929
    const-string v1, "java/lang/Class"

    const-string v2, "forName"

    const-string v4, "(Ljava/lang/String;)Ljava/lang/Class;"

    invoke-virtual {p0, v3, v1, v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 934
    const-string v1, "com/trendmicro/hippo/JavaAdapter"

    const-string v2, "convertResult"

    const-string v4, "(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;"

    invoke-virtual {p0, v3, v1, v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    :cond_9
    const/16 v1, 0xc0

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 943
    const/16 v1, 0xb0

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 945
    .end local v0    # "retTypeStr":Ljava/lang/String;
    :goto_2
    return-void
.end method

.method private static generateSerialCtor(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "adapterName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;

    .line 697
    const-string v0, "<init>"

    const-string v1, "(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V"

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 705
    const/16 v1, 0x2a

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 706
    const/16 v2, 0xb7

    const-string v3, "()V"

    invoke-virtual {p0, v2, p2, v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 709
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 710
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 711
    const/16 v0, 0xb5

    const-string v2, "factory"

    const-string v3, "Lcom/trendmicro/hippo/ContextFactory;"

    invoke-virtual {p0, v0, p1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 716
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 717
    const-string v2, "delegee"

    const-string v3, "Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {p0, v0, p1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 721
    const/16 v1, 0x2d

    invoke-virtual {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 722
    const-string v1, "self"

    invoke-virtual {p0, v0, p1, v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    const/16 v0, 0xb1

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 726
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 727
    return-void
.end method

.method private static generateSuper(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 5
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "genName"    # Ljava/lang/String;
    .param p2, "superName"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "methodSignature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1096
    .local p5, "parms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p6, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "super$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p4, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1100
    const/16 v0, 0x19

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 1103
    const/4 v0, 0x1

    .line 1104
    .local v0, "paramOffset":I
    array-length v2, p5

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, p5, v1

    .line 1105
    .local v3, "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v0, v3}, Lcom/trendmicro/hippo/JavaAdapter;->generatePushParam(Lcom/trendmicro/classfile/ClassFileWriter;ILjava/lang/Class;)I

    move-result v4

    add-int/2addr v0, v4

    .line 1104
    .end local v3    # "parm":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1109
    :cond_0
    const/16 v1, 0xb7

    invoke-virtual {p0, v1, p2, p3, p4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    move-object v1, p6

    .line 1116
    .local v1, "retType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1117
    invoke-static {p0, v1}, Lcom/trendmicro/hippo/JavaAdapter;->generatePopResult(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/Class;)V

    goto :goto_1

    .line 1119
    :cond_1
    const/16 v2, 0xb1

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1121
    :goto_1
    add-int/lit8 v2, v0, 0x1

    int-to-short v2, v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1122
    return-void
.end method

.method private static generateWrapArg(Lcom/trendmicro/classfile/ClassFileWriter;ILjava/lang/Class;)I
    .locals 8
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p1, "paramOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/classfile/ClassFileWriter;",
            "I",
            "Ljava/lang/Class<",
            "*>;)I"
        }
    .end annotation

    .line 811
    .local p2, "argType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    .line 812
    .local v0, "size":I
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-nez v1, :cond_0

    .line 813
    const/16 v1, 0x19

    invoke-virtual {p0, v1, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    goto/16 :goto_1

    .line 815
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string v2, "<init>"

    const/16 v3, 0xb7

    const/16 v4, 0x59

    const/16 v5, 0xbb

    const/16 v6, 0x15

    if-ne p2, v1, :cond_1

    .line 817
    const-string v1, "java/lang/Boolean"

    invoke-virtual {p0, v5, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 818
    invoke-virtual {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 819
    invoke-virtual {p0, v6, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 820
    const-string v4, "(Z)V"

    invoke-virtual {p0, v3, v1, v2, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 823
    :cond_1
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v1, :cond_2

    .line 825
    invoke-virtual {p0, v6, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 826
    const/16 v1, 0xb8

    const-string v2, "java/lang/String"

    const-string v3, "valueOf"

    const-string v4, "(C)Ljava/lang/String;"

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 831
    :cond_2
    const-string v1, "java/lang/Double"

    invoke-virtual {p0, v5, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 832
    invoke-virtual {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 833
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 834
    .local v4, "typeName":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x62

    if-eq v5, v7, :cond_6

    const/16 v7, 0x64

    if-eq v5, v7, :cond_5

    const/16 v7, 0x66

    if-eq v5, v7, :cond_4

    const/16 v7, 0x69

    if-eq v5, v7, :cond_6

    const/16 v7, 0x6c

    if-eq v5, v7, :cond_3

    const/16 v7, 0x73

    if-eq v5, v7, :cond_6

    goto :goto_0

    .line 844
    :cond_3
    const/16 v5, 0x16

    invoke-virtual {p0, v5, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 845
    const/16 v5, 0x8a

    invoke-virtual {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 846
    const/4 v0, 0x2

    .line 847
    goto :goto_0

    .line 850
    :cond_4
    const/16 v5, 0x17

    invoke-virtual {p0, v5, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 851
    const/16 v5, 0x8d

    invoke-virtual {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 852
    goto :goto_0

    .line 854
    :cond_5
    const/16 v5, 0x18

    invoke-virtual {p0, v5, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 855
    const/4 v0, 0x2

    goto :goto_0

    .line 839
    :cond_6
    invoke-virtual {p0, v6, p1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 840
    const/16 v5, 0x87

    invoke-virtual {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 841
    nop

    .line 858
    :goto_0
    const-string v5, "(D)V"

    invoke-virtual {p0, v3, v1, v2, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 861
    .end local v4    # "typeName":Ljava/lang/String;
    :goto_1
    return v0
.end method

.method private static getAdapterClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Class;
    .locals 8
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/Scriptable;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 333
    .local p1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/trendmicro/hippo/ClassCache;->get(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ClassCache;

    move-result-object v0

    .line 334
    .local v0, "cache":Lcom/trendmicro/hippo/ClassCache;
    nop

    .line 335
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->getInterfaceAdapterCacheMap()Ljava/util/Map;

    move-result-object v1

    .line 337
    .local v1, "generated":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;Ljava/lang/Class<*>;>;"
    invoke-static {p3}, Lcom/trendmicro/hippo/JavaAdapter;->getObjectFunctionNames(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ObjToIntMap;

    move-result-object v2

    .line 339
    .local v2, "names":Lcom/trendmicro/hippo/ObjToIntMap;
    new-instance v3, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;

    invoke-direct {v3, p1, p2, v2}, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;-><init>(Ljava/lang/Class;[Ljava/lang/Class;Lcom/trendmicro/hippo/ObjToIntMap;)V

    .line 340
    .local v3, "sig":Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 341
    .local v4, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v4, :cond_0

    .line 342
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "adapter"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->newClassSerialNumber()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 343
    .local v5, "adapterName":Ljava/lang/String;
    const/4 v6, 0x0

    invoke-static {v2, v5, p1, p2, v6}, Lcom/trendmicro/hippo/JavaAdapter;->createAdapterCode(Lcom/trendmicro/hippo/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B

    move-result-object v6

    .line 346
    .local v6, "code":[B
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/JavaAdapter;->loadAdapterClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v4

    .line 347
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->isCachingEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 348
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    .end local v5    # "adapterName":Ljava/lang/String;
    .end local v6    # "code":[B
    :cond_0
    return-object v4
.end method

.method public static getAdapterSelf(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "adapter"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 128
    .local p0, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "self"

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 129
    .local v0, "self":Ljava/lang/reflect/Field;
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static getArgsToConvert([Ljava/lang/Class;)[I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)[I"
        }
    .end annotation

    .line 1179
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 1180
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-eq v1, v2, :cond_1

    .line 1181
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1182
    add-int/lit8 v0, v0, 0x1

    .line 1180
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1184
    .end local v1    # "i":I
    :cond_1
    if-nez v0, :cond_2

    .line 1185
    const/4 v1, 0x0

    return-object v1

    .line 1186
    :cond_2
    new-array v1, v0, [I

    .line 1187
    .local v1, "array":[I
    const/4 v0, 0x0

    .line 1188
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, p0

    if-eq v2, v3, :cond_4

    .line 1189
    aget-object v3, p0, v2

    invoke-virtual {v3}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-nez v3, :cond_3

    .line 1190
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "count":I
    .local v3, "count":I
    aput v2, v1, v0

    move v0, v3

    .line 1188
    .end local v3    # "count":I
    .restart local v0    # "count":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1192
    .end local v2    # "i":I
    :cond_4
    return-object v1
.end method

.method public static getFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "functionName"    # Ljava/lang/String;

    .line 555
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 556
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 562
    const/4 v1, 0x0

    return-object v1

    .line 564
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_1

    .line 567
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Function;

    return-object v1

    .line 565
    :cond_1
    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private static getMethodSignature(Ljava/lang/reflect/Method;[Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1129
    .local p1, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1130
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lcom/trendmicro/hippo/JavaAdapter;->appendMethodSignature([Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/StringBuilder;)I

    .line 1131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getObjectFunctionNames(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ObjToIntMap;
    .locals 7
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 310
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getPropertyIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    .line 311
    .local v0, "ids":[Ljava/lang/Object;
    new-instance v1, Lcom/trendmicro/hippo/ObjToIntMap;

    array-length v2, v0

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    .line 312
    .local v1, "map":Lcom/trendmicro/hippo/ObjToIntMap;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-eq v2, v3, :cond_3

    .line 313
    aget-object v3, v0, v2

    instance-of v3, v3, Ljava/lang/String;

    if-nez v3, :cond_0

    .line 314
    goto :goto_1

    .line 315
    :cond_0
    aget-object v3, v0, v2

    check-cast v3, Ljava/lang/String;

    .line 316
    .local v3, "id":Ljava/lang/String;
    invoke-static {p0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 317
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Lcom/trendmicro/hippo/Function;

    if-eqz v5, :cond_2

    .line 318
    move-object v5, v4

    check-cast v5, Lcom/trendmicro/hippo/Function;

    .line 319
    .local v5, "f":Lcom/trendmicro/hippo/Function;
    nop

    .line 320
    const-string v6, "length"

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 319
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v6

    .line 321
    .local v6, "length":I
    if-gez v6, :cond_1

    .line 322
    const/4 v6, 0x0

    .line 324
    :cond_1
    invoke-virtual {v1, v3, v6}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 312
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    .end local v5    # "f":Lcom/trendmicro/hippo/Function;
    .end local v6    # "length":I
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 327
    .end local v2    # "i":I
    :cond_3
    return-object v1
.end method

.method static getOverridableMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 484
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 485
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 490
    .local v1, "skip":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object v2, p0

    .local v2, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v2, :cond_0

    .line 491
    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/JavaAdapter;->appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 490
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_0

    .line 493
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    move-object v2, p0

    .restart local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz v2, :cond_2

    .line 494
    invoke-virtual {v2}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v4, :cond_1

    aget-object v6, v3, v5

    .line 495
    .local v6, "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v6, v0, v1}, Lcom/trendmicro/hippo/JavaAdapter;->appendOverridableMethods(Ljava/lang/Class;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 494
    .end local v6    # "intf":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 493
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_1

    .line 497
    .end local v2    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/reflect/Method;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/reflect/Method;

    return-object v2
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 83
    new-instance v1, Lcom/trendmicro/hippo/JavaAdapter;

    invoke-direct {v1}, Lcom/trendmicro/hippo/JavaAdapter;-><init>()V

    .line 84
    .local v1, "obj":Lcom/trendmicro/hippo/JavaAdapter;
    new-instance v7, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v2, Lcom/trendmicro/hippo/JavaAdapter;->FTAG:Ljava/lang/Object;

    const/4 v3, 0x1

    const-string v4, "JavaAdapter"

    const/4 v5, 0x1

    move-object v0, v7

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 86
    .local v0, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->markAsConstructor(Lcom/trendmicro/hippo/Scriptable;)V

    .line 87
    if-eqz p2, :cond_0

    .line 88
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 90
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 91
    return-void
.end method

.method static js_createAdapter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 134
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    array-length v3, v2

    .line 135
    .local v3, "N":I
    if-eqz v3, :cond_b

    .line 146
    const/4 v0, 0x0

    move v4, v0

    .local v4, "classCount":I
    :goto_0
    add-int/lit8 v0, v3, -0x1

    if-ge v4, v0, :cond_2

    .line 147
    aget-object v0, v2, v4

    .line 152
    .local v0, "arg":Ljava/lang/Object;
    instance-of v5, v0, Lcom/trendmicro/hippo/NativeObject;

    if-eqz v5, :cond_0

    .line 153
    goto :goto_1

    .line 155
    :cond_0
    instance-of v5, v0, Lcom/trendmicro/hippo/NativeJavaClass;

    if-eqz v5, :cond_1

    .line 146
    .end local v0    # "arg":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 156
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_1
    nop

    .line 157
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    .line 158
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 156
    const-string v7, "msg.not.java.class.arg"

    invoke-static {v7, v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 161
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 162
    .local v0, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v5, v4, [Ljava/lang/Class;

    .line 163
    .local v5, "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 164
    .local v6, "interfaceCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v4, :cond_5

    .line 165
    aget-object v8, v2, v7

    check-cast v8, Lcom/trendmicro/hippo/NativeJavaClass;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/NativeJavaClass;->getClassObject()Ljava/lang/Class;

    move-result-object v8

    .line 166
    .local v8, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v8}, Ljava/lang/Class;->isInterface()Z

    move-result v9

    if-nez v9, :cond_4

    .line 167
    if-nez v0, :cond_3

    .line 171
    move-object v0, v8

    goto :goto_3

    .line 168
    :cond_3
    nop

    .line 169
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    .line 168
    const-string v11, "msg.only.one.super"

    invoke-static {v11, v9, v10}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v9

    throw v9

    .line 173
    :cond_4
    add-int/lit8 v9, v6, 0x1

    .end local v6    # "interfaceCount":I
    .local v9, "interfaceCount":I
    aput-object v8, v5, v6

    move v6, v9

    .line 164
    .end local v8    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "interfaceCount":I
    .restart local v6    # "interfaceCount":I
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 177
    .end local v7    # "i":I
    :cond_5
    if-nez v0, :cond_6

    .line 178
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    move-object v7, v0

    goto :goto_4

    .line 177
    :cond_6
    move-object v7, v0

    .line 181
    .end local v0    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local v7, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4
    new-array v8, v6, [Ljava/lang/Class;

    .line 182
    .local v8, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {v5, v0, v8, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    aget-object v9, v2, v4

    invoke-static {v9}, Lcom/trendmicro/hippo/ScriptableObject;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v9

    .line 186
    .local v9, "obj":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v1, v7, v8, v9}, Lcom/trendmicro/hippo/JavaAdapter;->getAdapterClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Class;

    move-result-object v10

    .line 189
    .local v10, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sub-int v11, v3, v4

    const/4 v12, 0x1

    sub-int/2addr v11, v12

    .line 191
    .local v11, "argsCount":I
    const/4 v13, 0x2

    if-lez v11, :cond_8

    .line 195
    add-int/lit8 v14, v11, 0x2

    :try_start_0
    new-array v14, v14, [Ljava/lang/Object;

    .line 196
    .local v14, "ctorArgs":[Ljava/lang/Object;
    aput-object v9, v14, v0

    .line 197
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    aput-object v0, v14, v12

    .line 198
    add-int/lit8 v0, v4, 0x1

    invoke-static {v2, v0, v14, v13, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    new-instance v0, Lcom/trendmicro/hippo/NativeJavaClass;

    invoke-direct {v0, v1, v10, v12}, Lcom/trendmicro/hippo/NativeJavaClass;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V

    .line 202
    .local v0, "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    iget-object v12, v0, Lcom/trendmicro/hippo/NativeJavaClass;->members:Lcom/trendmicro/hippo/JavaMembers;

    iget-object v12, v12, Lcom/trendmicro/hippo/JavaMembers;->ctors:Lcom/trendmicro/hippo/NativeJavaMethod;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 203
    .local v12, "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    move-object/from16 v15, p0

    :try_start_1
    invoke-virtual {v12, v15, v14}, Lcom/trendmicro/hippo/NativeJavaMethod;->findCachedFunction(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;)I

    move-result v13
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 204
    .local v13, "index":I
    if-ltz v13, :cond_7

    .line 211
    move-object/from16 v16, v0

    .end local v0    # "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    .local v16, "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    :try_start_2
    iget-object v0, v12, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v0, v0, v13

    invoke-static {v14, v0}, Lcom/trendmicro/hippo/NativeJavaClass;->constructInternal([Ljava/lang/Object;Lcom/trendmicro/hippo/MemberBox;)Ljava/lang/Object;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 212
    .end local v12    # "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v13    # "index":I
    .end local v14    # "ctorArgs":[Ljava/lang/Object;
    .end local v16    # "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    .local v0, "adapter":Ljava/lang/Object;
    move/from16 v17, v3

    goto :goto_6

    .line 234
    .end local v0    # "adapter":Ljava/lang/Object;
    :catch_0
    move-exception v0

    move/from16 v17, v3

    goto :goto_7

    .line 205
    .local v0, "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    .restart local v12    # "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    .restart local v13    # "index":I
    .restart local v14    # "ctorArgs":[Ljava/lang/Object;
    :cond_7
    move-object/from16 v16, v0

    .end local v0    # "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    .restart local v16    # "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    :try_start_3
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "sig":Ljava/lang/String;
    const-string v2, "msg.no.java.ctor"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 207
    move/from16 v17, v3

    .end local v3    # "N":I
    .local v17, "N":I
    :try_start_4
    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 206
    invoke-static {v2, v3, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    .end local v4    # "classCount":I
    .end local v5    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "interfaceCount":I
    .end local v7    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .end local v10    # "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "argsCount":I
    .end local v17    # "N":I
    .end local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "args":[Ljava/lang/Object;
    throw v2

    .line 234
    .end local v0    # "sig":Ljava/lang/String;
    .end local v12    # "ctors":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v13    # "index":I
    .end local v14    # "ctorArgs":[Ljava/lang/Object;
    .end local v16    # "classWrapper":Lcom/trendmicro/hippo/NativeJavaClass;
    .restart local v3    # "N":I
    .restart local v4    # "classCount":I
    .restart local v5    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v6    # "interfaceCount":I
    .restart local v7    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v8    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v9    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .restart local v10    # "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v11    # "argsCount":I
    .restart local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "args":[Ljava/lang/Object;
    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    move-object/from16 v15, p0

    :goto_5
    move/from16 v17, v3

    .end local v3    # "N":I
    .restart local v17    # "N":I
    goto :goto_7

    .line 213
    .end local v17    # "N":I
    .restart local v3    # "N":I
    :cond_8
    move-object/from16 v15, p0

    move/from16 v17, v3

    .end local v3    # "N":I
    .restart local v17    # "N":I
    new-array v2, v13, [Ljava/lang/Class;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v3, v2, v0

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    aput-object v3, v2, v12

    .line 217
    .local v2, "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-array v3, v13, [Ljava/lang/Object;

    aput-object v9, v3, v0

    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    aput-object v0, v3, v12

    move-object v0, v3

    .line 218
    .local v0, "ctorArgs":[Ljava/lang/Object;
    invoke-virtual {v10, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    .line 221
    .end local v2    # "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local v0, "adapter":Ljava/lang/Object;
    :goto_6
    invoke-static {v10, v0}, Lcom/trendmicro/hippo/JavaAdapter;->getAdapterSelf(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 223
    .local v2, "self":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v3, :cond_a

    .line 224
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    .line 225
    .local v3, "unwrapped":Ljava/lang/Object;
    instance-of v12, v3, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v12, :cond_a

    .line 226
    instance-of v12, v3, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v12, :cond_9

    .line 227
    move-object v12, v3

    check-cast v12, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-static {v12, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 230
    :cond_9
    return-object v3

    .line 233
    .end local v3    # "unwrapped":Ljava/lang/Object;
    :cond_a
    return-object v2

    .line 234
    .end local v0    # "adapter":Ljava/lang/Object;
    .end local v2    # "self":Ljava/lang/Object;
    :catch_3
    move-exception v0

    .line 235
    .local v0, "ex":Ljava/lang/Exception;
    :goto_7
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 136
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v4    # "classCount":I
    .end local v5    # "intfs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "interfaceCount":I
    .end local v7    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .end local v10    # "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "argsCount":I
    .end local v17    # "N":I
    .local v3, "N":I
    :cond_b
    const-string v0, "msg.adapter.zero.args"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static synthetic lambda$callMethod$0(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;JLcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 7
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/Function;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsToWrap"    # J
    .param p6, "cx2"    # Lcom/trendmicro/hippo/Context;

    .line 596
    move-object v0, p6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-wide v5, p4

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/JavaAdapter;->doCall(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static synthetic lambda$runScript$1(Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 1
    .param p0, "script"    # Lcom/trendmicro/hippo/Script;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 619
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getGlobal(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 620
    .local v0, "global":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-interface {p0, p1, v0}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 621
    return-object v0
.end method

.method static loadAdapterClass(Ljava/lang/String;[B)Ljava/lang/Class;
    .locals 4
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classBytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 529
    invoke-static {}, Lcom/trendmicro/hippo/SecurityController;->getStaticSecurityDomainClass()Ljava/lang/Class;

    move-result-object v0

    .line 530
    .local v0, "domainClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/security/CodeSource;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    const-class v1, Ljava/security/ProtectionDomain;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 544
    :cond_0
    const/4 v1, 0x0

    .local v1, "staticDomain":Ljava/lang/Object;
    goto :goto_3

    .line 532
    .end local v1    # "staticDomain":Ljava/lang/Object;
    :cond_1
    :goto_0
    invoke-static {}, Lcom/trendmicro/hippo/SecurityUtilities;->getScriptProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v1

    .line 533
    .local v1, "protectionDomain":Ljava/security/ProtectionDomain;
    if-nez v1, :cond_2

    .line 534
    const-class v3, Lcom/trendmicro/hippo/JavaAdapter;

    invoke-virtual {v3}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v1

    .line 536
    :cond_2
    const-class v3, Ljava/security/CodeSource;

    if-ne v0, v3, :cond_4

    .line 537
    if-nez v1, :cond_3

    move-object v3, v2

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Ljava/security/ProtectionDomain;->getCodeSource()Ljava/security/CodeSource;

    move-result-object v3

    :goto_1
    move-object v1, v3

    .local v3, "staticDomain":Ljava/lang/Object;
    goto :goto_2

    .line 540
    .end local v3    # "staticDomain":Ljava/lang/Object;
    :cond_4
    move-object v3, v1

    .line 542
    .local v1, "staticDomain":Ljava/lang/Object;
    :goto_2
    nop

    .line 546
    :goto_3
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v2

    .line 548
    .local v2, "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    invoke-interface {v2, p0, p1}, Lcom/trendmicro/hippo/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v3

    .line 549
    .local v3, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v2, v3}, Lcom/trendmicro/hippo/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V

    .line 550
    return-object v3
.end method

.method public static readAdapterObject(Lcom/trendmicro/hippo/Scriptable;Ljava/io/ObjectInputStream;)Ljava/lang/Object;
    .locals 13
    .param p0, "self"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 271
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 272
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v1

    .local v1, "factory":Lcom/trendmicro/hippo/ContextFactory;
    goto :goto_0

    .line 275
    .end local v1    # "factory":Lcom/trendmicro/hippo/ContextFactory;
    :cond_0
    const/4 v1, 0x0

    .line 278
    .restart local v1    # "factory":Lcom/trendmicro/hippo/ContextFactory;
    :goto_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 280
    .local v2, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 281
    .local v3, "interfaceNames":[Ljava/lang/String;
    array-length v4, v3

    new-array v4, v4, [Ljava/lang/Class;

    .line 283
    .local v4, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v6, v3

    if-ge v5, v6, :cond_1

    .line 284
    aget-object v6, v3, v5

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v4, v5

    .line 283
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 286
    .end local v5    # "i":I
    :cond_1
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/Scriptable;

    .line 288
    .local v5, "delegee":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {p0, v2, v4, v5}, Lcom/trendmicro/hippo/JavaAdapter;->getAdapterClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;[Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Class;

    move-result-object v6

    .line 291
    .local v6, "adapterClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x3

    new-array v8, v7, [Ljava/lang/Class;

    sget-object v9, Lcom/trendmicro/hippo/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    const/4 v10, 0x0

    aput-object v9, v8, v10

    sget-object v9, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    const/4 v11, 0x1

    aput-object v9, v8, v11

    sget-object v9, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    const/4 v12, 0x2

    aput-object v9, v8, v12

    .line 296
    .local v8, "ctorParms":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-array v7, v7, [Ljava/lang/Object;

    aput-object v1, v7, v10

    aput-object v5, v7, v11

    aput-object p0, v7, v12

    .line 298
    .local v7, "ctorArgs":[Ljava/lang/Object;
    :try_start_0
    invoke-virtual {v6, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v9

    .line 302
    :catch_0
    move-exception v9

    goto :goto_3

    .line 301
    :catch_1
    move-exception v9

    goto :goto_2

    .line 300
    :catch_2
    move-exception v9

    goto :goto_2

    .line 299
    :catch_3
    move-exception v9

    .line 303
    :goto_2
    nop

    .line 305
    :goto_3
    new-instance v9, Ljava/lang/ClassNotFoundException;

    const-string v10, "adapter"

    invoke-direct {v9, v10}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method public static runScript(Lcom/trendmicro/hippo/Script;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "script"    # Lcom/trendmicro/hippo/Script;

    .line 618
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    #disallowed odex opcode
    #iput-object-volatile v0, v1, Landroid/app/Notification;->bigContentView:Landroid/widget/RemoteViews;
    nop

    move/from16 v0, p266

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public static writeAdapterObject(Ljava/lang/Object;Ljava/io/ObjectOutputStream;)V
    .locals 5
    .param p0, "javaObject"    # Ljava/lang/Object;
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 245
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 247
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 248
    .local v1, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v2, v1

    new-array v2, v2, [Ljava/lang/String;

    .line 250
    .local v2, "interfaceNames":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 251
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 250
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 253
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 256
    :try_start_0
    const-string v3, "delegee"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 257
    .local v3, "delegee":Ljava/lang/Object;
    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    return-void

    .line 260
    .end local v3    # "delegee":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_1

    .line 259
    :catch_1
    move-exception v3

    .line 261
    nop

    .line 262
    :goto_1
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/trendmicro/hippo/JavaAdapter;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 99
    invoke-static {p2, p3, p5}, Lcom/trendmicro/hippo/JavaAdapter;->js_createAdapter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 102
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
