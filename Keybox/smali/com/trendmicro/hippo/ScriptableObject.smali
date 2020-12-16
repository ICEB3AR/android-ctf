.class public abstract Lcom/trendmicro/hippo/ScriptableObject;
.super Ljava/lang/Object;
.source "ScriptableObject.java"

# interfaces
.implements Lcom/trendmicro/hippo/Scriptable;
.implements Lcom/trendmicro/hippo/SymbolScriptable;
.implements Ljava/io/Serializable;
.implements Lcom/trendmicro/hippo/debug/DebuggableObject;
.implements Lcom/trendmicro/hippo/ConstProperties;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ScriptableObject$Slot;,
        Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;,
        Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;,
        Lcom/trendmicro/hippo/ScriptableObject$KeyComparator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final CONST:I = 0xd

.field public static final DONTENUM:I = 0x2

.field public static final EMPTY:I = 0x0

.field private static final GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;

.field private static final KEY_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERMANENT:I = 0x4

.field public static final READONLY:I = 0x1

.field public static final UNINITIALIZED_CONST:I = 0x8

.field private static final serialVersionUID:J = 0x2745afa870ac78baL


# instance fields
.field private volatile associatedValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private transient externalData:Lcom/trendmicro/hippo/ExternalArrayData;

.field private isExtensible:Z

.field private isSealed:Z

.field private parentScopeObject:Lcom/trendmicro/hippo/Scriptable;

.field private prototypeObject:Lcom/trendmicro/hippo/Scriptable;

.field private transient slotMap:Lcom/trendmicro/hippo/SlotMapContainer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 49
    nop

    .line 138
    :try_start_0
    const-class v0, Lcom/trendmicro/hippo/ScriptableObject;

    const-string v1, "getExternalArrayLength"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject;->GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    nop

    .line 3038
    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$KeyComparator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ScriptableObject$KeyComparator;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/ScriptableObject;->KEY_COMPARATOR:Ljava/util/Comparator;

    return-void

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "nsm":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 1

    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    .line 132
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z

    .line 376
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->createSlotMap(I)Lcom/trendmicro/hippo/SlotMapContainer;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    .line 377
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 380
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    .line 132
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z

    .line 381
    if-eqz p1, :cond_0

    .line 384
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject;->parentScopeObject:Lcom/trendmicro/hippo/Scriptable;

    .line 385
    iput-object p2, p0, Lcom/trendmicro/hippo/ScriptableObject;->prototypeObject:Lcom/trendmicro/hippo/Scriptable;

    .line 386
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->createSlotMap(I)Lcom/trendmicro/hippo/SlotMapContainer;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    .line 387
    return-void

    .line 382
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static buildClassCtor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Lcom/trendmicro/hippo/BaseFunction;
    .locals 38
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z
    .param p3, "mapInheritance"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "TT;>;ZZ)",
            "Lcom/trendmicro/hippo/BaseFunction;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1320
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1321
    .local v3, "methods":[Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-ge v4, v5, :cond_4

    .line 1322
    aget-object v5, v3, v4

    .line 1323
    .local v5, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "init"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 1324
    goto :goto_2

    .line 1325
    :cond_0
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v11

    .line 1326
    .local v11, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v12, v11

    if-ne v12, v6, :cond_2

    aget-object v12, v11, v9

    sget-object v13, Lcom/trendmicro/hippo/ScriptRuntime;->ContextClass:Ljava/lang/Class;

    if-ne v12, v13, :cond_2

    aget-object v12, v11, v10

    sget-object v13, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v12, v13, :cond_2

    aget-object v12, v11, v8

    sget-object v13, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v12, v13, :cond_2

    .line 1330
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 1332
    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v12

    aput-object v12, v6, v9

    aput-object v0, v6, v10

    .line 1333
    if-eqz v1, :cond_1

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_1

    :cond_1
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_1
    aput-object v9, v6, v8

    .line 1334
    .local v6, "args":[Ljava/lang/Object;
    invoke-virtual {v5, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1335
    return-object v7

    .line 1337
    .end local v6    # "args":[Ljava/lang/Object;
    :cond_2
    array-length v6, v11

    if-ne v6, v10, :cond_3

    aget-object v6, v11, v9

    sget-object v8, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v6, v8, :cond_3

    .line 1339
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1341
    new-array v6, v10, [Ljava/lang/Object;

    aput-object v0, v6, v9

    .line 1342
    .restart local v6    # "args":[Ljava/lang/Object;
    invoke-virtual {v5, v7, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1343
    return-object v7

    .line 1321
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "args":[Ljava/lang/Object;
    .end local v11    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1351
    .end local v4    # "i":I
    :cond_4
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 1352
    .local v4, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    const/4 v5, 0x0

    .line 1353
    .local v5, "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_3
    array-length v12, v4

    if-ge v11, v12, :cond_6

    .line 1354
    aget-object v12, v4, v11

    invoke-virtual {v12}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v12

    array-length v12, v12

    if-nez v12, :cond_5

    .line 1355
    aget-object v5, v4, v11

    .line 1356
    goto :goto_4

    .line 1353
    :cond_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 1359
    .end local v11    # "i":I
    :cond_6
    :goto_4
    if-eqz v5, :cond_31

    .line 1364
    sget-object v11, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {v5, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/trendmicro/hippo/Scriptable;

    .line 1365
    .local v11, "proto":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v11}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v12

    .line 1368
    .local v12, "className":Ljava/lang/String;
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v13

    invoke-static {v13, v12}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 1369
    .local v13, "existing":Ljava/lang/Object;
    instance-of v14, v13, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v14, :cond_8

    .line 1370
    move-object v14, v13

    check-cast v14, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v14}, Lcom/trendmicro/hippo/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v14

    .line 1371
    .local v14, "existingProto":Ljava/lang/Object;
    if-eqz v14, :cond_7

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    move-object/from16 v7, p1

    invoke-virtual {v7, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    .line 1372
    move-object v6, v13

    check-cast v6, Lcom/trendmicro/hippo/BaseFunction;

    return-object v6

    .line 1371
    :cond_7
    move-object/from16 v7, p1

    goto :goto_5

    .line 1369
    .end local v14    # "existingProto":Ljava/lang/Object;
    :cond_8
    move-object/from16 v7, p1

    .line 1378
    :cond_9
    :goto_5
    const/4 v14, 0x0

    .line 1379
    .local v14, "superProto":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v2, :cond_a

    .line 1380
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v15

    .line 1381
    .local v15, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v6, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 1382
    invoke-virtual {v15}, Ljava/lang/Class;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v6

    if-nez v6, :cond_a

    .line 1384
    nop

    .line 1385
    invoke-static {v15}, Lcom/trendmicro/hippo/ScriptableObject;->extendsScriptable(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v6

    .line 1386
    .local v6, "superScriptable":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/trendmicro/hippo/Scriptable;>;"
    invoke-static {v0, v6, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    move-result-object v8

    .line 1388
    .local v8, "name":Ljava/lang/String;
    if-eqz v8, :cond_a

    .line 1389
    invoke-static {v0, v8}, Lcom/trendmicro/hippo/ScriptableObject;->getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v14

    .line 1393
    .end local v6    # "superScriptable":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/trendmicro/hippo/Scriptable;>;"
    .end local v8    # "name":Ljava/lang/String;
    .end local v15    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    :cond_a
    if-nez v14, :cond_b

    .line 1394
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v14

    .line 1396
    :cond_b
    invoke-interface {v11, v14}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 1401
    const-string v6, "jsFunction_"

    .line 1402
    .local v6, "functionPrefix":Ljava/lang/String;
    const-string v8, "jsStaticFunction_"

    .line 1403
    .local v8, "staticFunctionPrefix":Ljava/lang/String;
    const-string v15, "jsGet_"

    .line 1404
    .local v15, "getterPrefix":Ljava/lang/String;
    const-string v16, "jsSet_"

    .line 1405
    .local v16, "setterPrefix":Ljava/lang/String;
    const-string v17, "jsConstructor"

    .line 1407
    .local v17, "ctorName":Ljava/lang/String;
    const-class v9, Lcom/trendmicro/hippo/annotations/JSConstructor;

    invoke-static {v3, v9}, Lcom/trendmicro/hippo/ScriptableObject;->findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;

    move-result-object v9

    .line 1408
    .local v9, "ctorMember":Ljava/lang/reflect/Member;
    if-nez v9, :cond_c

    .line 1409
    const-class v10, Lcom/trendmicro/hippo/annotations/JSConstructor;

    invoke-static {v4, v10}, Lcom/trendmicro/hippo/ScriptableObject;->findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;

    move-result-object v9

    .line 1411
    :cond_c
    const-string v10, "jsConstructor"

    if-nez v9, :cond_d

    .line 1412
    invoke-static {v3, v10}, Lcom/trendmicro/hippo/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 1414
    :cond_d
    if-nez v9, :cond_12

    .line 1415
    array-length v2, v4

    move-object/from16 v18, v5

    const/4 v5, 0x1

    .end local v5    # "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local v18, "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-ne v2, v5, :cond_e

    .line 1416
    const/4 v2, 0x0

    aget-object v5, v4, v2

    move-object v9, v5

    .end local v9    # "ctorMember":Ljava/lang/reflect/Member;
    .local v5, "ctorMember":Ljava/lang/reflect/Member;
    goto :goto_6

    .line 1417
    .end local v5    # "ctorMember":Ljava/lang/reflect/Member;
    .restart local v9    # "ctorMember":Ljava/lang/reflect/Member;
    :cond_e
    const/4 v2, 0x0

    array-length v5, v4

    const/4 v2, 0x2

    if-ne v5, v2, :cond_10

    .line 1418
    const/4 v2, 0x0

    aget-object v5, v4, v2

    invoke-virtual {v5}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    if-nez v2, :cond_f

    .line 1419
    const/4 v2, 0x1

    aget-object v5, v4, v2

    move-object v9, v5

    .end local v9    # "ctorMember":Ljava/lang/reflect/Member;
    .restart local v5    # "ctorMember":Ljava/lang/reflect/Member;
    goto :goto_6

    .line 1420
    .end local v5    # "ctorMember":Ljava/lang/reflect/Member;
    .restart local v9    # "ctorMember":Ljava/lang/reflect/Member;
    :cond_f
    const/4 v2, 0x1

    aget-object v5, v4, v2

    invoke-virtual {v5}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    if-nez v2, :cond_10

    .line 1421
    const/4 v2, 0x0

    aget-object v5, v4, v2

    move-object v9, v5

    .line 1423
    :cond_10
    :goto_6
    if-eqz v9, :cond_11

    goto :goto_7

    .line 1424
    :cond_11
    nop

    .line 1425
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1424
    const-string v5, "msg.ctor.multiple.parms"

    invoke-static {v5, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 1414
    .end local v18    # "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local v5, "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_12
    move-object/from16 v18, v5

    .line 1429
    .end local v5    # "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v18    # "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_7
    new-instance v2, Lcom/trendmicro/hippo/FunctionObject;

    invoke-direct {v2, v12, v9, v0}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    .line 1430
    .local v2, "ctor":Lcom/trendmicro/hippo/FunctionObject;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/FunctionObject;->isVarArgsMethod()Z

    move-result v5

    if-nez v5, :cond_30

    .line 1434
    invoke-virtual {v2, v0, v11}, Lcom/trendmicro/hippo/FunctionObject;->initAsConstructor(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 1436
    const/4 v5, 0x0

    .line 1437
    .local v5, "finishInit":Ljava/lang/reflect/Method;
    new-instance v19, Ljava/util/HashSet;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashSet;-><init>()V

    .line 1438
    .local v19, "staticNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v20, Ljava/util/HashSet;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashSet;-><init>()V

    .line 1439
    .local v20, "instanceNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v21, v4

    .end local v4    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .local v21, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v4, v3

    move-object/from16 v22, v6

    move-object v6, v5

    const/4 v5, 0x0

    .end local v5    # "finishInit":Ljava/lang/reflect/Method;
    .local v6, "finishInit":Ljava/lang/reflect/Method;
    .local v22, "functionPrefix":Ljava/lang/String;
    :goto_8
    if-ge v5, v4, :cond_2d

    move/from16 v29, v4

    aget-object v4, v3, v5

    .line 1440
    .local v4, "method":Ljava/lang/reflect/Method;
    if-ne v4, v9, :cond_13

    .line 1441
    move-object/from16 v30, v8

    move-object/from16 v33, v10

    move-object/from16 v31, v12

    move-object/from16 v32, v13

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1443
    :cond_13
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    .line 1444
    .local v7, "name":Ljava/lang/String;
    move-object/from16 v30, v8

    .end local v8    # "staticFunctionPrefix":Ljava/lang/String;
    .local v30, "staticFunctionPrefix":Ljava/lang/String;
    const-string v8, "finishInit"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_14

    .line 1445
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 1446
    .local v8, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v31, v12

    .end local v12    # "className":Ljava/lang/String;
    .local v31, "className":Ljava/lang/String;
    array-length v12, v8

    move-object/from16 v32, v13

    const/4 v13, 0x3

    .end local v13    # "existing":Ljava/lang/Object;
    .local v32, "existing":Ljava/lang/Object;
    if-ne v12, v13, :cond_15

    const/4 v12, 0x0

    aget-object v13, v8, v12

    sget-object v12, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v13, v12, :cond_15

    const/4 v12, 0x1

    aget-object v13, v8, v12

    const-class v12, Lcom/trendmicro/hippo/FunctionObject;

    if-ne v13, v12, :cond_15

    const/4 v12, 0x2

    aget-object v13, v8, v12

    sget-object v12, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-ne v13, v12, :cond_15

    .line 1450
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-eqz v12, :cond_15

    .line 1452
    move-object v6, v4

    .line 1453
    move-object/from16 v33, v10

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1444
    .end local v8    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v31    # "className":Ljava/lang/String;
    .end local v32    # "existing":Ljava/lang/Object;
    .restart local v12    # "className":Ljava/lang/String;
    .restart local v13    # "existing":Ljava/lang/Object;
    :cond_14
    move-object/from16 v31, v12

    move-object/from16 v32, v13

    .line 1457
    .end local v12    # "className":Ljava/lang/String;
    .end local v13    # "existing":Ljava/lang/Object;
    .restart local v31    # "className":Ljava/lang/String;
    .restart local v32    # "existing":Ljava/lang/Object;
    :cond_15
    const/16 v8, 0x24

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    const/4 v12, -0x1

    if-eq v8, v12, :cond_16

    .line 1458
    move-object/from16 v33, v10

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1459
    :cond_16
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_17

    .line 1460
    move-object/from16 v33, v10

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1462
    :cond_17
    const/4 v8, 0x0

    .line 1463
    .local v8, "annotation":Ljava/lang/annotation/Annotation;
    const/4 v12, 0x0

    .line 1464
    .local v12, "prefix":Ljava/lang/String;
    const-class v13, Lcom/trendmicro/hippo/annotations/JSFunction;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_18

    .line 1465
    const-class v13, Lcom/trendmicro/hippo/annotations/JSFunction;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    goto :goto_9

    .line 1466
    :cond_18
    const-class v13, Lcom/trendmicro/hippo/annotations/JSStaticFunction;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_19

    .line 1467
    const-class v13, Lcom/trendmicro/hippo/annotations/JSStaticFunction;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    goto :goto_9

    .line 1468
    :cond_19
    const-class v13, Lcom/trendmicro/hippo/annotations/JSGetter;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_1a

    .line 1469
    const-class v13, Lcom/trendmicro/hippo/annotations/JSGetter;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    goto :goto_9

    .line 1470
    :cond_1a
    const-class v13, Lcom/trendmicro/hippo/annotations/JSSetter;

    invoke-virtual {v4, v13}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_1b

    .line 1471
    move-object/from16 v33, v10

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1474
    :cond_1b
    :goto_9
    const-string v13, "jsGet_"

    move-object/from16 v33, v10

    const-string v10, "jsStaticFunction_"

    if-nez v8, :cond_1f

    .line 1475
    move-object/from16 v23, v12

    .end local v12    # "prefix":Ljava/lang/String;
    .local v23, "prefix":Ljava/lang/String;
    const-string v12, "jsFunction_"

    invoke-virtual {v7, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1c

    .line 1476
    const-string v12, "jsFunction_"

    .end local v23    # "prefix":Ljava/lang/String;
    .restart local v12    # "prefix":Ljava/lang/String;
    goto :goto_a

    .line 1477
    .end local v12    # "prefix":Ljava/lang/String;
    .restart local v23    # "prefix":Ljava/lang/String;
    :cond_1c
    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 1478
    const-string v12, "jsStaticFunction_"

    .end local v23    # "prefix":Ljava/lang/String;
    .restart local v12    # "prefix":Ljava/lang/String;
    goto :goto_a

    .line 1479
    .end local v12    # "prefix":Ljava/lang/String;
    .restart local v23    # "prefix":Ljava/lang/String;
    :cond_1d
    invoke-virtual {v7, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1e

    .line 1480
    const-string v12, "jsGet_"

    .end local v23    # "prefix":Ljava/lang/String;
    .restart local v12    # "prefix":Ljava/lang/String;
    goto :goto_a

    .line 1479
    .end local v12    # "prefix":Ljava/lang/String;
    .restart local v23    # "prefix":Ljava/lang/String;
    :cond_1e
    move-object/from16 v34, v14

    move-object/from16 v35, v15

    goto/16 :goto_12

    .line 1474
    .end local v23    # "prefix":Ljava/lang/String;
    .restart local v12    # "prefix":Ljava/lang/String;
    :cond_1f
    move-object/from16 v23, v12

    .line 1488
    :goto_a
    move-object/from16 v34, v14

    .end local v14    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .local v34, "superProto":Lcom/trendmicro/hippo/Scriptable;
    instance-of v14, v8, Lcom/trendmicro/hippo/annotations/JSStaticFunction;

    if-nez v14, :cond_21

    if-ne v12, v10, :cond_20

    goto :goto_b

    :cond_20
    const/4 v10, 0x0

    goto :goto_c

    :cond_21
    :goto_b
    const/4 v10, 0x1

    .line 1490
    .local v10, "isStatic":Z
    :goto_c
    if-eqz v10, :cond_22

    move-object/from16 v14, v19

    goto :goto_d

    :cond_22
    move-object/from16 v14, v20

    .line 1491
    .local v14, "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :goto_d
    move-object/from16 v35, v15

    .end local v15    # "getterPrefix":Ljava/lang/String;
    .local v35, "getterPrefix":Ljava/lang/String;
    invoke-static {v7, v12, v8}, Lcom/trendmicro/hippo/ScriptableObject;->getPropertyName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/annotation/Annotation;)Ljava/lang/String;

    move-result-object v15

    .line 1492
    .local v15, "propName":Ljava/lang/String;
    invoke-virtual {v14, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_2c

    .line 1496
    invoke-virtual {v14, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1497
    move-object v7, v15

    .line 1499
    move-object/from16 v36, v14

    .end local v14    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .local v36, "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    instance-of v14, v8, Lcom/trendmicro/hippo/annotations/JSGetter;

    if-nez v14, :cond_28

    if-ne v12, v13, :cond_23

    move-object/from16 v37, v8

    goto :goto_10

    .line 1516
    :cond_23
    if-eqz v10, :cond_25

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v13

    invoke-static {v13}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v13

    if-eqz v13, :cond_24

    goto :goto_e

    .line 1517
    :cond_24
    const-string v5, "jsStaticFunction must be used with static method."

    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 1521
    :cond_25
    :goto_e
    new-instance v13, Lcom/trendmicro/hippo/FunctionObject;

    invoke-direct {v13, v7, v4, v11}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    .line 1522
    .local v13, "f":Lcom/trendmicro/hippo/FunctionObject;
    invoke-virtual {v13}, Lcom/trendmicro/hippo/FunctionObject;->isVarArgsConstructor()Z

    move-result v14

    if-nez v14, :cond_27

    .line 1526
    if-eqz v10, :cond_26

    move-object v14, v2

    goto :goto_f

    :cond_26
    move-object v14, v11

    :goto_f
    move-object/from16 v37, v8

    const/4 v8, 0x2

    .end local v8    # "annotation":Ljava/lang/annotation/Annotation;
    .local v37, "annotation":Ljava/lang/annotation/Annotation;
    invoke-static {v14, v7, v13, v8}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1527
    if-eqz v1, :cond_2a

    .line 1528
    invoke-virtual {v13}, Lcom/trendmicro/hippo/FunctionObject;->sealObject()V

    goto :goto_12

    .line 1523
    .end local v37    # "annotation":Ljava/lang/annotation/Annotation;
    .restart local v8    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_27
    move-object/from16 v37, v8

    .line 1524
    .end local v8    # "annotation":Ljava/lang/annotation/Annotation;
    .restart local v37    # "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {v9}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v8, "msg.varargs.fun"

    invoke-static {v8, v5}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 1499
    .end local v13    # "f":Lcom/trendmicro/hippo/FunctionObject;
    .end local v37    # "annotation":Ljava/lang/annotation/Annotation;
    .restart local v8    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_28
    move-object/from16 v37, v8

    .line 1500
    .end local v8    # "annotation":Ljava/lang/annotation/Annotation;
    .restart local v37    # "annotation":Ljava/lang/annotation/Annotation;
    :goto_10
    instance-of v8, v11, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v8, :cond_2b

    .line 1505
    const-string v8, "jsSet_"

    invoke-static {v3, v7, v8}, Lcom/trendmicro/hippo/ScriptableObject;->findSetterMethod([Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 1506
    .local v8, "setter":Ljava/lang/reflect/Method;
    nop

    .line 1508
    if-eqz v8, :cond_29

    const/4 v13, 0x0

    goto :goto_11

    .line 1509
    :cond_29
    const/4 v13, 0x1

    :goto_11
    or-int/lit8 v13, v13, 0x6

    .line 1510
    .local v13, "attr":I
    move-object/from16 v23, v11

    check-cast v23, Lcom/trendmicro/hippo/ScriptableObject;

    const/16 v25, 0x0

    move-object/from16 v24, v7

    move-object/from16 v26, v4

    move-object/from16 v27, v8

    move/from16 v28, v13

    invoke-virtual/range {v23 .. v28}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 1513
    nop

    .line 1439
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "setter":Ljava/lang/reflect/Method;
    .end local v10    # "isStatic":Z
    .end local v12    # "prefix":Ljava/lang/String;
    .end local v13    # "attr":I
    .end local v15    # "propName":Ljava/lang/String;
    .end local v36    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v37    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_2a
    :goto_12
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v7, p1

    move/from16 v4, v29

    move-object/from16 v8, v30

    move-object/from16 v12, v31

    move-object/from16 v13, v32

    move-object/from16 v10, v33

    move-object/from16 v14, v34

    move-object/from16 v15, v35

    goto/16 :goto_8

    .line 1501
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    .restart local v7    # "name":Ljava/lang/String;
    .restart local v10    # "isStatic":Z
    .restart local v12    # "prefix":Ljava/lang/String;
    .restart local v15    # "propName":Ljava/lang/String;
    .restart local v36    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v37    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_2b
    nop

    .line 1503
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1501
    const-string v8, "msg.extend.scriptable"

    invoke-static {v8, v5, v7}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 1493
    .end local v36    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v37    # "annotation":Ljava/lang/annotation/Annotation;
    .local v8, "annotation":Ljava/lang/annotation/Annotation;
    .restart local v14    # "names":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_2c
    const-string v5, "duplicate.defineClass.name"

    invoke-static {v5, v7, v15}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 1533
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "name":Ljava/lang/String;
    .end local v10    # "isStatic":Z
    .end local v30    # "staticFunctionPrefix":Ljava/lang/String;
    .end local v31    # "className":Ljava/lang/String;
    .end local v32    # "existing":Ljava/lang/Object;
    .end local v34    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .end local v35    # "getterPrefix":Ljava/lang/String;
    .local v8, "staticFunctionPrefix":Ljava/lang/String;
    .local v12, "className":Ljava/lang/String;
    .local v13, "existing":Ljava/lang/Object;
    .local v14, "superProto":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "getterPrefix":Ljava/lang/String;
    :cond_2d
    move-object/from16 v30, v8

    move-object/from16 v31, v12

    move-object/from16 v32, v13

    move-object/from16 v34, v14

    move-object/from16 v35, v15

    .end local v8    # "staticFunctionPrefix":Ljava/lang/String;
    .end local v12    # "className":Ljava/lang/String;
    .end local v13    # "existing":Ljava/lang/Object;
    .end local v14    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .end local v15    # "getterPrefix":Ljava/lang/String;
    .restart local v30    # "staticFunctionPrefix":Ljava/lang/String;
    .restart local v31    # "className":Ljava/lang/String;
    .restart local v32    # "existing":Ljava/lang/Object;
    .restart local v34    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .restart local v35    # "getterPrefix":Ljava/lang/String;
    if-eqz v6, :cond_2e

    .line 1534
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    const/4 v5, 0x2

    aput-object v11, v4, v5

    .line 1535
    .local v4, "finishArgs":[Ljava/lang/Object;
    const/4 v5, 0x0

    invoke-virtual {v6, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1539
    .end local v4    # "finishArgs":[Ljava/lang/Object;
    :cond_2e
    if-eqz v1, :cond_2f

    .line 1540
    invoke-virtual {v2}, Lcom/trendmicro/hippo/FunctionObject;->sealObject()V

    .line 1541
    instance-of v4, v11, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v4, :cond_2f

    .line 1542
    move-object v4, v11

    check-cast v4, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ScriptableObject;->sealObject()V

    .line 1546
    :cond_2f
    return-object v2

    .line 1431
    .end local v19    # "staticNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v20    # "instanceNames":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v21    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .end local v22    # "functionPrefix":Ljava/lang/String;
    .end local v30    # "staticFunctionPrefix":Ljava/lang/String;
    .end local v31    # "className":Ljava/lang/String;
    .end local v32    # "existing":Ljava/lang/Object;
    .end local v34    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .end local v35    # "getterPrefix":Ljava/lang/String;
    .local v4, "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .local v6, "functionPrefix":Ljava/lang/String;
    .restart local v8    # "staticFunctionPrefix":Ljava/lang/String;
    .restart local v12    # "className":Ljava/lang/String;
    .restart local v13    # "existing":Ljava/lang/Object;
    .restart local v14    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .restart local v15    # "getterPrefix":Ljava/lang/String;
    :cond_30
    move-object/from16 v21, v4

    .line 1432
    .end local v4    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v21    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    invoke-interface {v9}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "msg.varargs.ctor"

    invoke-static {v5, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 1360
    .end local v2    # "ctor":Lcom/trendmicro/hippo/FunctionObject;
    .end local v6    # "functionPrefix":Ljava/lang/String;
    .end local v8    # "staticFunctionPrefix":Ljava/lang/String;
    .end local v9    # "ctorMember":Ljava/lang/reflect/Member;
    .end local v11    # "proto":Lcom/trendmicro/hippo/Scriptable;
    .end local v12    # "className":Ljava/lang/String;
    .end local v13    # "existing":Ljava/lang/Object;
    .end local v14    # "superProto":Lcom/trendmicro/hippo/Scriptable;
    .end local v15    # "getterPrefix":Ljava/lang/String;
    .end local v16    # "setterPrefix":Ljava/lang/String;
    .end local v17    # "ctorName":Ljava/lang/String;
    .end local v18    # "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v21    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v4    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .local v5, "protoCtor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_31
    move-object/from16 v21, v4

    .line 1361
    .end local v4    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    .restart local v21    # "ctors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1360
    const-string v4, "msg.zero.arg.ctor"

    invoke-static {v4, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method protected static buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 5
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "attributes"    # I

    .line 213
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 214
    .local v0, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 215
    const-string v1, "value"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 216
    and-int/lit8 v1, p2, 0x1

    const/4 v3, 0x1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v4, "writable"

    invoke-virtual {v0, v4, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 217
    and-int/lit8 v1, p2, 0x2

    if-nez v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v4, "enumerable"

    invoke-virtual {v0, v4, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 218
    and-int/lit8 v1, p2, 0x4

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    move v3, v2

    :goto_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "configurable"

    invoke-virtual {v0, v3, v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 219
    return-object v0
.end method

.method public static callMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 2679
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2680
    .local v0, "funObj":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_1

    .line 2683
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Function;

    .line 2691
    .local v1, "fun":Lcom/trendmicro/hippo/Function;
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 2692
    .local v2, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-eqz p0, :cond_0

    .line 2693
    invoke-interface {v1, p0, v2, p1, p3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 2695
    :cond_0
    const/4 v3, 0x0

    invoke-static {v3, v1, v2, p1, p3}, Lcom/trendmicro/hippo/Context;->call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 2681
    .end local v1    # "fun":Lcom/trendmicro/hippo/Function;
    .end local v2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static callMethod(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 2665
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->callMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private checkNotSealed(Ljava/lang/Object;I)V
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 2296
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->isSealed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2297
    return-void

    .line 2299
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 2300
    .local v0, "str":Ljava/lang/String;
    :goto_0
    const-string v1, "msg.modify.sealed"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method static checkValidAttributes(I)V
    .locals 3
    .param p0, "attributes"    # I

    .line 359
    const/16 v0, 0xf

    .line 360
    .local v0, "mask":I
    and-int/lit8 v1, p0, -0x10

    if-nez v1, :cond_0

    .line 363
    return-void

    .line 361
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private createSlotMap(I)Lcom/trendmicro/hippo/SlotMapContainer;
    .locals 2
    .param p1, "initialSize"    # I

    .line 367
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 368
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 369
    new-instance v1, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;

    invoke-direct {v1, p1}, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;-><init>(I)V

    return-object v1

    .line 371
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-direct {v1, p1}, Lcom/trendmicro/hippo/SlotMapContainer;-><init>(I)V

    return-object v1
.end method

.method public static defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z
    .param p3, "mapInheritance"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "TT;>;ZZ)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1304
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->buildClassCtor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 1306
    .local v0, "ctor":Lcom/trendmicro/hippo/BaseFunction;
    if-nez v0, :cond_0

    .line 1307
    const/4 v1, 0x0

    return-object v1

    .line 1308
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/BaseFunction;->getClassPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 1309
    .local v1, "name":Ljava/lang/String;
    const/4 v2, 0x2

    invoke-static {p0, v1, v0, v2}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1310
    return-object v1
.end method

.method public static defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1237
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    .line 1238
    return-void
.end method

.method public static defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "TT;>;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1268
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;ZZ)Ljava/lang/String;

    .line 1269
    return-void
.end method

.method public static defineConstProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    .locals 2
    .param p0, "destination"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "propertyName"    # Ljava/lang/String;

    .line 1689
    instance-of v0, p0, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v0, :cond_0

    .line 1690
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ConstProperties;

    .line 1691
    .local v0, "cp":Lcom/trendmicro/hippo/ConstProperties;
    invoke-interface {v0, p1, p0}, Lcom/trendmicro/hippo/ConstProperties;->defineConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)V

    .line 1692
    .end local v0    # "cp":Lcom/trendmicro/hippo/ConstProperties;
    goto :goto_0

    .line 1693
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const/16 v1, 0xd

    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1694
    :goto_0
    return-void
.end method

.method public static defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 1
    .param p0, "destination"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "attributes"    # I

    .line 1670
    instance-of v0, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v0, :cond_0

    .line 1671
    invoke-interface {p0, p1, p0, p2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 1672
    return-void

    .line 1674
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 1675
    .local v0, "so":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 1676
    return-void
.end method

.method public static deleteProperty(Lcom/trendmicro/hippo/Scriptable;I)Z
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I

    .line 2601
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2602
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2603
    return v1

    .line 2604
    :cond_0
    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    .line 2605
    invoke-interface {v0, p1, p0}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    xor-int/2addr v1, v2

    return v1
.end method

.method public static deleteProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .line 2581
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2582
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2583
    return v1

    .line 2584
    :cond_0
    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 2585
    invoke-interface {v0, p1, p0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    xor-int/2addr v1, v2

    return v1
.end method

.method protected static ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "arg"    # Ljava/lang/Object;

    .line 2118
    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 2120
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 2119
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.arg.not.object"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected static ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 2
    .param p0, "arg"    # Ljava/lang/Object;

    .line 2130
    instance-of v0, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_0

    .line 2132
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    return-object v0

    .line 2131
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.arg.not.object"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected static ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;
    .locals 2
    .param p0, "arg"    # Ljava/lang/Object;

    .line 2124
    instance-of v0, p0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v0, :cond_0

    .line 2126
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/SymbolScriptable;

    return-object v0

    .line 2125
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.object.not.symbolscriptable"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static extendsScriptable(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    .line 1619
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1620
    return-object p0

    .line 1621
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static findAnnotatedMember([Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Ljava/lang/reflect/Member;
    .locals 4
    .param p0, "members"    # [Ljava/lang/reflect/AccessibleObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/reflect/AccessibleObject;",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/lang/reflect/Member;"
        }
    .end annotation

    .line 1551
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p0, v1

    .line 1552
    .local v2, "member":Ljava/lang/reflect/AccessibleObject;
    invoke-virtual {v2, p1}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1553
    move-object v0, v2

    check-cast v0, Ljava/lang/reflect/Member;

    return-object v0

    .line 1551
    .end local v2    # "member":Ljava/lang/reflect/AccessibleObject;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1556
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private findAttributeSlot(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 2894
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2895
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-eqz v0, :cond_0

    .line 2898
    return-object v0

    .line 2896
    :cond_0
    const-string v1, "msg.prop.not.found"

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method private findAttributeSlot(Ljava/lang/String;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 2884
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2885
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_1

    .line 2886
    if-eqz p1, :cond_0

    move-object v1, p1

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 2887
    .local v1, "str":Ljava/lang/String;
    :goto_0
    const-string v2, "msg.prop.not.found"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 2889
    .end local v1    # "str":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method private static findSetterMethod([Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .locals 8
    .param p0, "methods"    # [Ljava/lang/reflect/Method;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .line 1562
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "set"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1563
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1564
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1565
    .local v0, "newStyleName":Ljava/lang/String;
    array-length v2, p0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p0, v3

    .line 1566
    .local v4, "method":Ljava/lang/reflect/Method;
    const-class v5, Lcom/trendmicro/hippo/annotations/JSSetter;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/annotations/JSSetter;

    .line 1567
    .local v5, "annotation":Lcom/trendmicro/hippo/annotations/JSSetter;
    if-eqz v5, :cond_1

    .line 1568
    invoke-interface {v5}, Lcom/trendmicro/hippo/annotations/JSSetter;->value()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1569
    invoke-interface {v5}, Lcom/trendmicro/hippo/annotations/JSSetter;->value()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1570
    :cond_0
    return-object v4

    .line 1565
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "annotation":Lcom/trendmicro/hippo/annotations/JSSetter;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1574
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1575
    .local v2, "oldStyleName":Ljava/lang/String;
    array-length v3, p0

    :goto_1
    if-ge v1, v3, :cond_4

    aget-object v4, p0, v1

    .line 1576
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1577
    return-object v4

    .line 1575
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1580
    :cond_4
    const/4 v1, 0x0

    return-object v1
.end method

.method public static getArrayPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2185
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method private static getBase(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I

    .line 2711
    :cond_0
    invoke-interface {p0, p1, p0}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2712
    goto :goto_0

    .line 2713
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2714
    if-nez p0, :cond_0

    .line 2715
    :goto_0
    return-object p0
.end method

.method private static getBase(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 2721
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v0

    invoke-interface {v0, p1, p0}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2722
    goto :goto_0

    .line 2723
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2724
    if-nez p0, :cond_0

    .line 2725
    :goto_0
    return-object p0
.end method

.method private static getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .line 2701
    :cond_0
    invoke-interface {p0, p1, p0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2702
    goto :goto_0

    .line 2703
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2704
    if-nez p0, :cond_0

    .line 2705
    :goto_0
    return-object p0
.end method

.method public static getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 4
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "className"    # Ljava/lang/String;

    .line 2207
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2208
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2210
    .local v0, "ctor":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/BaseFunction;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 2211
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v1

    .local v1, "proto":Ljava/lang/Object;
    goto :goto_0

    .line 2212
    .end local v1    # "proto":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_2

    .line 2213
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 2214
    .local v1, "ctorObj":Lcom/trendmicro/hippo/Scriptable;
    const-string v3, "prototype"

    invoke-interface {v1, v3, v1}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2215
    .local v1, "proto":Ljava/lang/Object;
    nop

    .line 2218
    :goto_0
    instance-of v3, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_1

    .line 2219
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    return-object v2

    .line 2221
    :cond_1
    return-object v2

    .line 2216
    .end local v1    # "proto":Ljava/lang/Object;
    :cond_2
    return-object v2
.end method

.method public static getDefaultValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 8
    .param p0, "object"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1041
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 1042
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_a

    .line 1044
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->StringClass:Ljava/lang/Class;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne p1, v2, :cond_1

    .line 1045
    if-nez v1, :cond_0

    move v3, v4

    :cond_0
    move v2, v3

    .local v2, "tryToString":Z
    goto :goto_1

    .line 1047
    .end local v2    # "tryToString":Z
    :cond_1
    if-ne v1, v4, :cond_2

    move v3, v4

    :cond_2
    move v2, v3

    .line 1051
    .restart local v2    # "tryToString":Z
    :goto_1
    if-eqz v2, :cond_3

    .line 1052
    const-string v3, "toString"

    .local v3, "methodName":Ljava/lang/String;
    goto :goto_2

    .line 1054
    .end local v3    # "methodName":Ljava/lang/String;
    :cond_3
    const-string v3, "valueOf"

    .line 1056
    .restart local v3    # "methodName":Ljava/lang/String;
    :goto_2
    invoke-static {p0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 1057
    .local v4, "v":Ljava/lang/Object;
    instance-of v5, v4, Lcom/trendmicro/hippo/Function;

    if-nez v5, :cond_4

    .line 1058
    goto :goto_4

    .line 1059
    :cond_4
    move-object v5, v4

    check-cast v5, Lcom/trendmicro/hippo/Function;

    .line 1060
    .local v5, "fun":Lcom/trendmicro/hippo/Function;
    if-nez v0, :cond_5

    .line 1061
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 1063
    :cond_5
    invoke-interface {v5}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v5, v0, v6, p0, v7}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1064
    if-eqz v4, :cond_9

    .line 1065
    instance-of v6, v4, Lcom/trendmicro/hippo/Scriptable;

    if-nez v6, :cond_6

    .line 1066
    return-object v4

    .line 1068
    :cond_6
    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq p1, v6, :cond_8

    sget-object v6, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne p1, v6, :cond_7

    goto :goto_3

    .line 1073
    :cond_7
    if-eqz v2, :cond_9

    instance-of v6, v4, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v6, :cond_9

    .line 1076
    move-object v6, v4

    check-cast v6, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v6}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v6

    .line 1077
    .local v6, "u":Ljava/lang/Object;
    instance-of v7, v6, Ljava/lang/String;

    if-eqz v7, :cond_9

    .line 1078
    return-object v6

    .line 1071
    .end local v6    # "u":Ljava/lang/Object;
    :cond_8
    :goto_3
    return-object v4

    .line 1042
    .end local v2    # "tryToString":Z
    .end local v3    # "methodName":Ljava/lang/String;
    .end local v4    # "v":Ljava/lang/Object;
    .end local v5    # "fun":Lcom/trendmicro/hippo/Function;
    :cond_9
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1083
    .end local v1    # "i":I
    :cond_a
    if-nez p1, :cond_b

    const-string v1, "undefined"

    goto :goto_5

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1084
    .local v1, "arg":Ljava/lang/String;
    :goto_5
    const-string v2, "msg.default.value"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2
.end method

.method public static getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2180
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Function:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2170
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I

    .line 2388
    move-object v0, p0

    .line 2391
    .local v0, "start":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-interface {p0, p1, v0}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2392
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_1

    .line 2393
    goto :goto_0

    .line 2394
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2395
    if-nez p0, :cond_0

    .line 2396
    :goto_0
    return-object v1
.end method

.method public static getProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 2333
    move-object v0, p0

    .line 2336
    .local v0, "start":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Lcom/trendmicro/hippo/SymbolScriptable;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2337
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_1

    .line 2338
    goto :goto_0

    .line 2339
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2340
    if-nez p0, :cond_0

    .line 2341
    :goto_0
    return-object v1
.end method

.method public static getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .line 2317
    move-object v0, p0

    .line 2320
    .local v0, "start":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-interface {p0, p1, v0}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 2321
    .local v1, "result":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_1

    .line 2322
    goto :goto_0

    .line 2323
    :cond_1
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2324
    if-nez p0, :cond_0

    .line 2325
    :goto_0
    return-object v1
.end method

.method public static getPropertyIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;
    .locals 6
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2619
    if-nez p0, :cond_0

    .line 2620
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    return-object v0

    .line 2622
    :cond_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    .line 2623
    .local v0, "result":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 2625
    .local v1, "map":Lcom/trendmicro/hippo/ObjToIntMap;
    :goto_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2626
    if-nez p0, :cond_2

    .line 2627
    nop

    .line 2648
    if-eqz v1, :cond_1

    .line 2649
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap;->getKeys()[Ljava/lang/Object;

    move-result-object v0

    .line 2651
    :cond_1
    return-object v0

    .line 2629
    :cond_2
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v2

    .line 2630
    .local v2, "ids":[Ljava/lang/Object;
    array-length v3, v2

    if-nez v3, :cond_3

    .line 2631
    goto :goto_0

    .line 2633
    :cond_3
    if-nez v1, :cond_6

    .line 2634
    array-length v3, v0

    if-nez v3, :cond_4

    .line 2635
    move-object v0, v2

    .line 2636
    goto :goto_0

    .line 2638
    :cond_4
    new-instance v3, Lcom/trendmicro/hippo/ObjToIntMap;

    array-length v4, v0

    array-length v5, v2

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    move-object v1, v3

    .line 2639
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v4, v0

    if-eq v3, v4, :cond_5

    .line 2640
    aget-object v4, v0, v3

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2639
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2642
    .end local v3    # "i":I
    :cond_5
    const/4 v0, 0x0

    .line 2644
    :cond_6
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v4, v2

    if-eq v3, v4, :cond_7

    .line 2645
    aget-object v4, v2, v3

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ObjToIntMap;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2644
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 2647
    .end local v2    # "ids":[Ljava/lang/Object;
    .end local v3    # "i":I
    :cond_7
    goto :goto_0
.end method

.method private static getPropertyName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/annotation/Annotation;)Ljava/lang/String;
    .locals 4
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "annotation"    # Ljava/lang/annotation/Annotation;

    .line 1586
    if-eqz p1, :cond_0

    .line 1587
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1589
    :cond_0
    const/4 v0, 0x0

    .line 1590
    .local v0, "propName":Ljava/lang/String;
    instance-of v1, p2, Lcom/trendmicro/hippo/annotations/JSGetter;

    if-eqz v1, :cond_3

    .line 1591
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/annotations/JSGetter;

    invoke-interface {v1}, Lcom/trendmicro/hippo/annotations/JSGetter;->value()Ljava/lang/String;

    move-result-object v0

    .line 1592
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_5

    .line 1593
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-le v1, v2, :cond_5

    const-string v1, "get"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1594
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1595
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1596
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 1597
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1598
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1599
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1600
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1605
    :cond_3
    instance-of v1, p2, Lcom/trendmicro/hippo/annotations/JSFunction;

    if-eqz v1, :cond_4

    .line 1606
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/annotations/JSFunction;

    invoke-interface {v1}, Lcom/trendmicro/hippo/annotations/JSFunction;->value()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1607
    :cond_4
    instance-of v1, p2, Lcom/trendmicro/hippo/annotations/JSStaticFunction;

    if-eqz v1, :cond_5

    .line 1608
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/annotations/JSStaticFunction;

    invoke-interface {v1}, Lcom/trendmicro/hippo/annotations/JSStaticFunction;->value()Ljava/lang/String;

    move-result-object v0

    .line 1610
    :cond_5
    :goto_0
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_7

    .line 1611
    :cond_6
    move-object v0, p0

    .line 1613
    :cond_7
    return-object v0
.end method

.method public static getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 2236
    :goto_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2237
    .local v0, "parent":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2238
    return-object p0

    .line 2240
    :cond_0
    move-object p0, v0

    .line 2241
    .end local v0    # "parent":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_0
.end method

.method public static getTopScopeValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "key"    # Ljava/lang/Object;

    .line 2754
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2756
    :goto_0
    instance-of v0, p0, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v0, :cond_0

    .line 2757
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 2758
    .local v0, "so":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2759
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 2760
    return-object v1

    .line 2763
    .end local v0    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object p0

    .line 2764
    if-nez p0, :cond_1

    .line 2765
    const/4 v0, 0x0

    return-object v0

    .line 2764
    :cond_1
    goto :goto_0
.end method

.method public static getTypedProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "I",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 2364
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 2365
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 2366
    const/4 v0, 0x0

    .line 2368
    :cond_0
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static getTypedProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 2416
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2417
    .local v0, "val":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 2418
    const/4 v0, 0x0

    .line 2420
    :cond_0
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static hasProperty(Lcom/trendmicro/hippo/Scriptable;I)Z
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I

    .line 2476
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hasProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Z
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 2484
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;

    .line 2436
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected static isFalse(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 2034
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected static isTrue(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 2030
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq p0, v0, :cond_0

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private putConstImpl(Ljava/lang/String;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "value"    # Ljava/lang/Object;
    .param p5, "constFlag"    # I

    .line 2846
    nop

    .line 2847
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    if-nez v0, :cond_1

    .line 2848
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 2849
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 2850
    :cond_0
    const-string v1, "msg.not.extensible"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2854
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    :goto_0
    if-eq p0, p3, :cond_2

    .line 2855
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2856
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_3

    .line 2857
    const/4 v1, 0x0

    return v1

    .line 2859
    .end local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_4

    .line 2860
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2861
    .restart local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_3

    .line 2862
    return v1

    .line 2879
    :cond_3
    invoke-virtual {v0, p4, p0, p3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1

    .line 2865
    .end local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 2867
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v0, p1, p2, v2}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2868
    .restart local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v2

    .line 2869
    .local v2, "attr":I
    and-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_6

    .line 2871
    and-int/lit8 v3, v2, 0x8

    if-eqz v3, :cond_5

    .line 2872
    iput-object p4, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2874
    const/16 v3, 0x8

    if-eq p5, v3, :cond_5

    .line 2875
    and-int/lit8 v3, v2, -0x9

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 2877
    :cond_5
    return v1

    .line 2870
    :cond_6
    const-string v1, "msg.var.redecl"

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method public static putConstProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 2538
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2539
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2540
    move-object v0, p0

    .line 2541
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v1, :cond_1

    .line 2542
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ConstProperties;

    invoke-interface {v1, p1, p0, p2}, Lcom/trendmicro/hippo/ConstProperties;->putConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2543
    :cond_1
    return-void
.end method

.method private putImpl(Ljava/lang/Object;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "value"    # Ljava/lang/Object;

    .line 2807
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    if-nez v0, :cond_1

    .line 2808
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 2809
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 2810
    :cond_0
    const-string v1, "msg.not.extensible"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 2814
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    :goto_0
    if-eq p0, p3, :cond_2

    .line 2815
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2816
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_5

    .line 2817
    const/4 v1, 0x0

    return v1

    .line 2819
    .end local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_2
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    if-nez v0, :cond_3

    .line 2820
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2821
    .restart local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_5

    .line 2822
    const/4 v1, 0x1

    return v1

    .line 2825
    .end local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_3
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z

    if-eqz v0, :cond_4

    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 2826
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v0, p1, p2, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2828
    .restart local v0    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_5
    invoke-virtual {v0, p4, p0, p3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setValue(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1
.end method

.method public static putProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;)V
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 2562
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2563
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2564
    move-object v0, p0

    .line 2565
    :cond_0
    invoke-interface {v0, p1, p0, p2}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2566
    return-void
.end method

.method public static putProperty(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;Ljava/lang/Object;)V
    .locals 2
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "value"    # Ljava/lang/Object;

    .line 2515
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Symbol;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2516
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2517
    move-object v0, p0

    .line 2518
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v1

    invoke-interface {v1, p1, p0, p2}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2519
    return-void
.end method

.method public static putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 2504
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2505
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2506
    move-object v0, p0

    .line 2507
    :cond_0
    invoke-interface {v0, p1, p0, p2}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2508
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 2980
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 2982
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 2983
    .local v0, "tableSize":I
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->createSlotMap(I)Lcom/trendmicro/hippo/SlotMapContainer;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    .line 2984
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 2985
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 2986
    .local v2, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/SlotMapContainer;->addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 2984
    .end local v2    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2988
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method public static redefineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Z)V
    .locals 3
    .param p0, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isConst"    # Z

    .line 2451
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getBase(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 2452
    .local v0, "base":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_0

    .line 2453
    return-void

    .line 2454
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v1, :cond_2

    .line 2455
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ConstProperties;

    .line 2457
    .local v1, "cp":Lcom/trendmicro/hippo/ConstProperties;
    invoke-interface {v1, p1}, Lcom/trendmicro/hippo/ConstProperties;->isConst(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 2458
    :cond_1
    const-string v2, "msg.const.redecl"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2460
    .end local v1    # "cp":Lcom/trendmicro/hippo/ConstProperties;
    :cond_2
    :goto_0
    if-nez p2, :cond_3

    .line 2462
    return-void

    .line 2461
    :cond_3
    const-string v1, "msg.var.redecl"

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;ZZ)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "getterOrSetter"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "isSetter"    # Z
    .param p5, "force"    # Z

    .line 820
    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 821
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 823
    :cond_1
    :goto_0
    if-nez p5, :cond_2

    .line 824
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 828
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 829
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v0, p1, p2, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .local v0, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    goto :goto_1

    .line 831
    .end local v0    # "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 832
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    instance-of v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v1, :cond_4

    .line 833
    return-void

    .line 834
    :cond_4
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    move-object v0, v1

    .line 837
    .local v0, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    :goto_1
    if-nez p5, :cond_6

    .line 838
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getAttributes()I

    move-result v1

    .line 839
    .local v1, "attributes":I
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_5

    goto :goto_2

    .line 840
    :cond_5
    const-string v2, "msg.modify.readonly"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 843
    .end local v1    # "attributes":I
    :cond_6
    :goto_2
    if-eqz p4, :cond_7

    .line 844
    iput-object p3, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    goto :goto_3

    .line 846
    :cond_7
    iput-object p3, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 848
    :goto_3
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 849
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 5
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2960
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 2961
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SlotMapContainer;->readLock()J

    move-result-wide v0

    .line 2963
    .local v0, "stamp":J
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/SlotMapContainer;->dirtySize()I

    move-result v2

    .line 2964
    .local v2, "objectsCount":I
    if-nez v2, :cond_0

    .line 2965
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    goto :goto_1

    .line 2967
    :cond_0
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 2968
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/SlotMapContainer;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 2969
    .local v4, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    invoke-virtual {p1, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2970
    .end local v4    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    goto :goto_0

    .line 2973
    .end local v2    # "objectsCount":I
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v2, v0, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2974
    nop

    .line 2975
    return-void

    .line 2973
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v3, v0, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2974
    throw v2
.end method


# virtual methods
.method addLazilyInitializedValue(Ljava/lang/String;ILcom/trendmicro/hippo/LazilyLoadedCtor;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "init"    # Lcom/trendmicro/hippo/LazilyLoadedCtor;
    .param p4, "attributes"    # I

    .line 898
    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 899
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 900
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 901
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v0, p1, p2, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .line 903
    .local v0, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    invoke-virtual {v0, p4}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 904
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 905
    iput-object v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 906
    iput-object p3, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 907
    return-void
.end method

.method protected applyDescriptorToAttributeBitset(ILcom/trendmicro/hippo/ScriptableObject;)I
    .locals 4
    .param p1, "attributes"    # I
    .param p2, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 2069
    const-string v0, "enumerable"

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 2070
    .local v0, "enumerable":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 2071
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2072
    and-int/lit8 v1, p1, -0x3

    goto :goto_0

    :cond_0
    or-int/lit8 v1, p1, 0x2

    :goto_0
    move p1, v1

    .line 2075
    :cond_1
    const-string v1, "writable"

    invoke-static {p2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 2076
    .local v1, "writable":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_3

    .line 2077
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2078
    and-int/lit8 v2, p1, -0x2

    goto :goto_1

    :cond_2
    or-int/lit8 v2, p1, 0x1

    :goto_1
    move p1, v2

    .line 2081
    :cond_3
    const-string v2, "configurable"

    invoke-static {p2, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 2082
    .local v2, "configurable":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_5

    .line 2083
    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2084
    and-int/lit8 v3, p1, -0x5

    goto :goto_2

    :cond_4
    or-int/lit8 v3, p1, 0x4

    :goto_2
    move p1, v3

    .line 2087
    :cond_5
    return p1
.end method

.method public final declared-synchronized associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    monitor-enter p0

    .line 2784
    if-eqz p2, :cond_1

    .line 2785
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2786
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 2787
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v0, v1

    .line 2788
    iput-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2790
    .end local p0    # "this":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_0
    invoke-static {v0, p1, p2}, Lcom/trendmicro/hippo/Kit;->initHash(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 2783
    .end local v0    # "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local p1    # "key":Ljava/lang/Object;
    .end local p2    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception p1

    goto :goto_0

    .line 2784
    .restart local p1    # "key":Ljava/lang/Object;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2783
    .end local p1    # "key":Ljava/lang/Object;
    .end local p2    # "value":Ljava/lang/Object;
    :goto_0
    monitor-exit p0

    throw p1
.end method

.method public avoidObjectDetection()Z
    .locals 1

    .line 1118
    const/4 v0, 0x0

    return v0
.end method

.method protected checkPropertyChange(Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/Object;
    .param p2, "current"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1986
    if-nez p2, :cond_1

    .line 1987
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const-string v0, "msg.not.extensible"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 1989
    :cond_1
    const-string v0, "configurable"

    invoke-virtual {p2, v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->isFalse(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1990
    invoke-static {p3, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 1993
    const-string v0, "enumerable"

    invoke-virtual {p2, v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {p3, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v0

    if-ne v1, v0, :cond_a

    .line 1996
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v0

    .line 1997
    .local v0, "isData":Z
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v1

    .line 1998
    .local v1, "isAccessor":Z
    if-nez v0, :cond_2

    if-nez v1, :cond_2

    goto/16 :goto_0

    .line 2000
    :cond_2
    if-eqz v0, :cond_5

    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2001
    const-string v2, "writable"

    invoke-virtual {p2, v2, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptableObject;->isFalse(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 2002
    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptableObject;->isTrue(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 2006
    const-string v2, "value"

    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v2, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    .line 2007
    :cond_3
    const-string v2, "msg.change.value.with.writable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2003
    :cond_4
    const-string v2, "msg.change.writable.false.to.true.with.configurable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2010
    :cond_5
    if-eqz v1, :cond_8

    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2011
    const-string v2, "set"

    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v2, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2015
    const-string v2, "get"

    invoke-static {p3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v2, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    goto :goto_0

    .line 2016
    :cond_6
    const-string v2, "msg.change.getter.with.configurable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2012
    :cond_7
    const-string v2, "msg.change.setter.with.configurable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2019
    :cond_8
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2020
    const-string v2, "msg.change.property.data.to.accessor.with.configurable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 2022
    :cond_9
    const-string v2, "msg.change.property.accessor.to.data.with.configurable.false"

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 1994
    .end local v0    # "isData":Z
    .end local v1    # "isAccessor":Z
    :cond_a
    const-string v0, "msg.change.enumerable.with.configurable.false"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 1991
    :cond_b
    const-string v0, "msg.change.configurable.false.to.true"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 2027
    :cond_c
    :goto_0
    return-void
.end method

.method protected checkPropertyDefinition(Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 3
    .param p1, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1969
    const-string v0, "get"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1970
    .local v0, "getter":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1972
    :cond_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1974
    :cond_1
    :goto_0
    const-string v1, "set"

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1975
    .local v1, "setter":Ljava/lang/Object;
    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_3

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v1, v2, :cond_3

    instance-of v2, v1, Lcom/trendmicro/hippo/Callable;

    if-eqz v2, :cond_2

    goto :goto_1

    .line 1977
    :cond_2
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1979
    :cond_3
    :goto_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_2

    .line 1980
    :cond_4
    const-string v2, "msg.both.data.and.accessor.desc"

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 1982
    :cond_5
    :goto_2
    return-void
.end method

.method public defineConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 642
    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const/4 v2, 0x0

    const/16 v5, 0x8

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptableObject;->putConstImpl(Ljava/lang/String;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 643
    return-void

    .line 645
    :cond_0
    if-eq p2, p0, :cond_2

    .line 646
    instance-of v0, p2, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v0, :cond_1

    .line 647
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ConstProperties;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/ConstProperties;->defineConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)V

    .line 648
    :cond_1
    return-void

    .line 645
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public defineFunctionProperties([Ljava/lang/String;Ljava/lang/Class;I)V
    .locals 6
    .param p1, "names"    # [Ljava/lang/String;
    .param p3, "attributes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;I)V"
        }
    .end annotation

    .line 2151
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lcom/trendmicro/hippo/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 2152
    .local v0, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 2153
    aget-object v2, p1, v1

    .line 2154
    .local v2, "name":Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 2155
    .local v3, "m":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_0

    .line 2159
    new-instance v4, Lcom/trendmicro/hippo/FunctionObject;

    invoke-direct {v4, v2, v3, p0}, Lcom/trendmicro/hippo/FunctionObject;-><init>(Ljava/lang/String;Ljava/lang/reflect/Member;Lcom/trendmicro/hippo/Scriptable;)V

    .line 2160
    .local v4, "f":Lcom/trendmicro/hippo/FunctionObject;
    invoke-virtual {p0, v2, v4, p3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 2152
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v4    # "f":Lcom/trendmicro/hippo/FunctionObject;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2156
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "m":Ljava/lang/reflect/Method;
    :cond_0
    nop

    .line 2157
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 2156
    const-string v5, "msg.method.not.found"

    invoke-static {v5, v2, v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 2162
    .end local v1    # "i":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    :cond_1
    return-void
.end method

.method public defineOwnProperties(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "props"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1878
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    .line 1879
    .local v0, "ids":[Ljava/lang/Object;
    array-length v1, v0

    new-array v1, v1, [Lcom/trendmicro/hippo/ScriptableObject;

    .line 1880
    .local v1, "descs":[Lcom/trendmicro/hippo/ScriptableObject;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v3, v0

    .local v3, "len":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 1881
    aget-object v4, v0, v2

    invoke-static {p2, v4, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v4

    .line 1882
    .local v4, "descObj":Ljava/lang/Object;
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptableObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v5

    .line 1883
    .local v5, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/ScriptableObject;->checkPropertyDefinition(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 1884
    aput-object v5, v1, v2

    .line 1880
    .end local v4    # "descObj":Ljava/lang/Object;
    .end local v5    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1886
    .end local v2    # "i":I
    .end local v3    # "len":I
    :cond_0
    const/4 v2, 0x0

    .restart local v2    # "i":I
    array-length v3, v0

    .restart local v3    # "len":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 1887
    aget-object v4, v0, v2

    aget-object v5, v1, v2

    invoke-virtual {p0, p1, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 1886
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1889
    .end local v2    # "i":I
    .end local v3    # "len":I
    :cond_1
    return-void
.end method

.method public defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1899
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->checkPropertyDefinition(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 1900
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 1901
    return-void
.end method

.method protected defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p4, "checkValid"    # Z

    .line 1916
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 1917
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1919
    .local v1, "isNew":Z
    :goto_0
    if-eqz p4, :cond_2

    .line 1920
    if-nez v0, :cond_1

    .line 1921
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v0, p1, p0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getPropertyDescriptor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v2

    .line 1922
    .local v2, "current":Lcom/trendmicro/hippo/ScriptableObject;
    :goto_1
    invoke-virtual {p0, p2, v2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->checkPropertyChange(Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 1925
    .end local v2    # "current":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_2
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    .line 1928
    .local v2, "isAccessor":Z
    if-nez v0, :cond_4

    .line 1929
    if-eqz v2, :cond_3

    sget-object v3, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    goto :goto_2

    :cond_3
    sget-object v3, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    :goto_2
    invoke-virtual {p0, p1, p2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 1930
    const/4 v3, 0x7

    invoke-virtual {p0, v3, p3}, Lcom/trendmicro/hippo/ScriptableObject;->applyDescriptorToAttributeBitset(ILcom/trendmicro/hippo/ScriptableObject;)I

    move-result v3

    .local v3, "attributes":I
    goto :goto_3

    .line 1932
    .end local v3    # "attributes":I
    :cond_4
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v3

    invoke-virtual {p0, v3, p3}, Lcom/trendmicro/hippo/ScriptableObject;->applyDescriptorToAttributeBitset(ILcom/trendmicro/hippo/ScriptableObject;)I

    move-result v3

    .line 1935
    .restart local v3    # "attributes":I
    :goto_3
    if-eqz v2, :cond_8

    .line 1936
    instance-of v4, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v4, :cond_5

    .line 1937
    sget-object v4, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {p0, p1, p2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 1940
    :cond_5
    move-object v4, v0

    check-cast v4, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .line 1942
    .local v4, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    const-string v5, "get"

    invoke-static {p3, v5}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 1943
    .local v5, "getter":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v5, v6, :cond_6

    .line 1944
    iput-object v5, v4, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 1946
    :cond_6
    const-string v6, "set"

    invoke-static {p3, v6}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 1947
    .local v6, "setter":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v6, v7, :cond_7

    .line 1948
    iput-object v6, v4, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 1951
    :cond_7
    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v7, v4, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->value:Ljava/lang/Object;

    .line 1952
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 1953
    .end local v4    # "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    .end local v5    # "getter":Ljava/lang/Object;
    .end local v6    # "setter":Ljava/lang/Object;
    goto :goto_5

    .line 1954
    :cond_8
    instance-of v4, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v4, :cond_9

    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1955
    sget-object v4, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->CONVERT_ACCESSOR_TO_DATA:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {p0, p1, p2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 1958
    :cond_9
    const-string v4, "value"

    invoke-static {p3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 1959
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v5, :cond_a

    .line 1960
    iput-object v4, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    goto :goto_4

    .line 1961
    :cond_a
    if-eqz v1, :cond_b

    .line 1962
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    iput-object v5, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 1964
    :cond_b
    :goto_4
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 1966
    .end local v4    # "value":Ljava/lang/Object;
    :goto_5
    return-void
.end method

.method public defineProperty(Lcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "attributes"    # I

    .line 1651
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 1652
    invoke-virtual {p0, p1, p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 1653
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Lcom/trendmicro/hippo/Symbol;I)V

    .line 1654
    return-void
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Class;I)V
    .locals 15
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p3, "attributes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;I)V"
        }
    .end annotation

    .line 1717
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1718
    .local v0, "length":I
    if-eqz v0, :cond_2

    .line 1719
    add-int/lit8 v1, v0, 0x3

    new-array v1, v1, [C

    .line 1720
    .local v1, "buf":[C
    const/4 v2, 0x0

    const/4 v3, 0x3

    move-object/from16 v10, p1

    invoke-virtual {v10, v2, v0, v1, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 1721
    aget-char v4, v1, v3

    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    aput-char v4, v1, v3

    .line 1722
    const/16 v3, 0x67

    aput-char v3, v1, v2

    .line 1723
    const/16 v3, 0x65

    const/4 v4, 0x1

    aput-char v3, v1, v4

    .line 1724
    const/4 v3, 0x2

    const/16 v4, 0x74

    aput-char v4, v1, v3

    .line 1725
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([C)V

    .line 1726
    .local v3, "getterName":Ljava/lang/String;
    const/16 v4, 0x73

    aput-char v4, v1, v2

    .line 1727
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    .line 1729
    .local v2, "setterName":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/FunctionObject;->getMethodList(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v11

    .line 1730
    .local v11, "methods":[Ljava/lang/reflect/Method;
    invoke-static {v11, v3}, Lcom/trendmicro/hippo/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 1731
    .local v12, "getter":Ljava/lang/reflect/Method;
    invoke-static {v11, v2}, Lcom/trendmicro/hippo/FunctionObject;->findSingleMethod([Ljava/lang/reflect/Method;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v13

    .line 1732
    .local v13, "setter":Ljava/lang/reflect/Method;
    if-nez v13, :cond_0

    .line 1733
    or-int/lit8 v4, p3, 0x1

    move v14, v4

    .end local p3    # "attributes":I
    .local v4, "attributes":I
    goto :goto_0

    .line 1732
    .end local v4    # "attributes":I
    .restart local p3    # "attributes":I
    :cond_0
    move/from16 v14, p3

    .line 1734
    .end local p3    # "attributes":I
    .local v14, "attributes":I
    :goto_0
    const/4 v6, 0x0

    .line 1735
    if-nez v13, :cond_1

    const/4 v4, 0x0

    move-object v8, v4

    goto :goto_1

    :cond_1
    move-object v8, v13

    .line 1734
    :goto_1
    move-object v4, p0

    move-object/from16 v5, p1

    move-object v7, v12

    move v9, v14

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 1736
    return-void

    .line 1718
    .end local v1    # "buf":[C
    .end local v2    # "setterName":Ljava/lang/String;
    .end local v3    # "getterName":Ljava/lang/String;
    .end local v11    # "methods":[Ljava/lang/reflect/Method;
    .end local v12    # "getter":Ljava/lang/reflect/Method;
    .end local v13    # "setter":Ljava/lang/reflect/Method;
    .end local v14    # "attributes":I
    .restart local p3    # "attributes":I
    :cond_2
    move-object/from16 v10, p1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "attributes"    # I

    .line 1637
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 1638
    invoke-virtual {p0, p1, p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 1639
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 1640
    return-void
.end method

.method public defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V
    .locals 8
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "delegateTo"    # Ljava/lang/Object;
    .param p3, "getter"    # Ljava/lang/reflect/Method;
    .param p4, "setter"    # Ljava/lang/reflect/Method;
    .param p5, "attributes"    # I

    .line 1782
    const/4 v0, 0x0

    .line 1783
    .local v0, "getterBox":Lcom/trendmicro/hippo/MemberBox;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p3, :cond_8

    .line 1784
    new-instance v3, Lcom/trendmicro/hippo/MemberBox;

    invoke-direct {v3, p3}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    move-object v0, v3

    .line 1787
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1788
    if-eqz p2, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 1789
    .local v3, "delegatedForm":Z
    :goto_0
    iput-object p2, v0, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    goto :goto_1

    .line 1791
    .end local v3    # "delegatedForm":Z
    :cond_1
    const/4 v3, 0x1

    .line 1794
    .restart local v3    # "delegatedForm":Z
    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    iput-object v4, v0, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 1797
    :goto_1
    const/4 v4, 0x0

    .line 1798
    .local v4, "errorId":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 1799
    .local v5, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v6, v5

    if-nez v6, :cond_2

    .line 1800
    if-eqz v3, :cond_6

    .line 1801
    const-string v4, "msg.obj.getter.parms"

    goto :goto_3

    .line 1803
    :cond_2
    array-length v6, v5

    if-ne v6, v1, :cond_5

    .line 1804
    aget-object v6, v5, v2

    .line 1806
    .local v6, "argType":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq v6, v7, :cond_3

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    if-eq v6, v7, :cond_3

    .line 1809
    const-string v4, "msg.bad.getter.parms"

    goto :goto_2

    .line 1810
    :cond_3
    if-nez v3, :cond_4

    .line 1811
    const-string v4, "msg.bad.getter.parms"

    .line 1813
    .end local v6    # "argType":Ljava/lang/Object;
    :cond_4
    :goto_2
    goto :goto_3

    .line 1814
    :cond_5
    const-string v4, "msg.bad.getter.parms"

    .line 1816
    :cond_6
    :goto_3
    if-nez v4, :cond_7

    goto :goto_4

    .line 1817
    :cond_7
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 1821
    .end local v3    # "delegatedForm":Z
    .end local v4    # "errorId":Ljava/lang/String;
    .end local v5    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_8
    :goto_4
    const/4 v3, 0x0

    .line 1822
    .local v3, "setterBox":Lcom/trendmicro/hippo/MemberBox;
    if-eqz p4, :cond_12

    .line 1823
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v4, v5, :cond_11

    .line 1827
    new-instance v4, Lcom/trendmicro/hippo/MemberBox;

    invoke-direct {v4, p4}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    move-object v3, v4

    .line 1830
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_a

    .line 1831
    if-eqz p2, :cond_9

    move v4, v1

    goto :goto_5

    :cond_9
    move v4, v2

    .line 1832
    .local v4, "delegatedForm":Z
    :goto_5
    iput-object p2, v3, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    goto :goto_6

    .line 1834
    .end local v4    # "delegatedForm":Z
    :cond_a
    const/4 v4, 0x1

    .line 1837
    .restart local v4    # "delegatedForm":Z
    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    iput-object v5, v3, Lcom/trendmicro/hippo/MemberBox;->delegateTo:Ljava/lang/Object;

    .line 1840
    :goto_6
    const/4 v5, 0x0

    .line 1841
    .local v5, "errorId":Ljava/lang/String;
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 1842
    .local v6, "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v6

    if-ne v7, v1, :cond_b

    .line 1843
    if-eqz v4, :cond_f

    .line 1844
    const-string v5, "msg.setter2.expected"

    goto :goto_8

    .line 1846
    :cond_b
    array-length v1, v6

    const/4 v7, 0x2

    if-ne v1, v7, :cond_e

    .line 1847
    aget-object v1, v6, v2

    .line 1849
    .local v1, "argType":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq v1, v7, :cond_c

    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableObjectClass:Ljava/lang/Class;

    if-eq v1, v7, :cond_c

    .line 1852
    const-string v5, "msg.setter2.parms"

    goto :goto_7

    .line 1853
    :cond_c
    if-nez v4, :cond_d

    .line 1854
    const-string v5, "msg.setter1.parms"

    .line 1856
    .end local v1    # "argType":Ljava/lang/Object;
    :cond_d
    :goto_7
    goto :goto_8

    .line 1857
    :cond_e
    const-string v5, "msg.setter.parms"

    .line 1859
    :cond_f
    :goto_8
    if-nez v5, :cond_10

    goto :goto_9

    .line 1860
    :cond_10
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 1824
    .end local v4    # "delegatedForm":Z
    .end local v5    # "errorId":Ljava/lang/String;
    .end local v6    # "parmTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_11
    nop

    .line 1825
    invoke-virtual {p4}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1824
    const-string v2, "msg.setter.return"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 1864
    :cond_12
    :goto_9
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    sget-object v4, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {v1, p1, v2, v4}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .line 1866
    .local v1, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    invoke-virtual {v1, p5}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setAttributes(I)V

    .line 1867
    iput-object v0, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 1868
    iput-object v3, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    .line 1869
    return-void
.end method

.method public delete(I)V
    .locals 2
    .param p1, "index"    # I

    .line 597
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 598
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/SlotMapContainer;->remove(Ljava/lang/Object;I)V

    .line 599
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 607
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 608
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v1, p1, v0}, Lcom/trendmicro/hippo/SlotMapContainer;->remove(Ljava/lang/Object;I)V

    .line 609
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 582
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 583
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v1, p1, v0}, Lcom/trendmicro/hippo/SlotMapContainer;->remove(Ljava/lang/Object;I)V

    .line 584
    return-void
.end method

.method protected equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 1136
    if-ne p0, p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    :goto_0
    return-object v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 476
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    if-eqz v0, :cond_1

    .line 477
    invoke-interface {v0}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayLength()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayElement(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 480
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0

    .line 483
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 484
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_2

    .line 485
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1

    .line 487
    :cond_2
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getValue(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 496
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 497
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_0

    .line 498
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1

    .line 500
    :cond_0
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getValue(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 3021
    const/4 v0, 0x0

    .line 3022
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 3023
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 3024
    :cond_0
    instance-of v1, p1, Lcom/trendmicro/hippo/Symbol;

    if-eqz v1, :cond_1

    .line 3025
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Symbol;

    invoke-virtual {p0, v1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 3026
    :cond_1
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 3027
    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, v1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 3029
    :cond_2
    :goto_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_5

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_3

    goto :goto_1

    .line 3031
    :cond_3
    instance-of v1, v0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v1, :cond_4

    .line 3032
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 3034
    :cond_4
    return-object v0

    .line 3030
    :cond_5
    :goto_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 459
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 460
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_0

    .line 461
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1

    .line 463
    :cond_0
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getValue(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getAllIds()[Ljava/lang/Object;
    .locals 2

    .line 1016
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 2735
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->associatedValues:Ljava/util/Map;

    .line 2736
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 2737
    const/4 v1, 0x0

    return-object v1

    .line 2738
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getAttributes(I)I
    .locals 2
    .param p1, "index"    # I

    .line 745
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Ljava/lang/String;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    return v0
.end method

.method public final getAttributes(ILcom/trendmicro/hippo/Scriptable;)I
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 685
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(I)I

    move-result v0

    return v0
.end method

.method public getAttributes(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "sym"    # Lcom/trendmicro/hippo/Symbol;

    .line 750
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    return v0
.end method

.method public getAttributes(Ljava/lang/String;)I
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 727
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Ljava/lang/String;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v0

    return v0
.end method

.method public final getAttributes(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 675
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public abstract getClassName()Ljava/lang/String;
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

    .line 1036
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getDefaultValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getExternalArrayData()Lcom/trendmicro/hippo/ExternalArrayData;
    .locals 1

    .line 940
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    return-object v0
.end method

.method public getExternalArrayLength()Ljava/lang/Object;
    .locals 1

    .line 948
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayLength()I

    move-result v0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getGetterOrSetter(Ljava/lang/String;IZ)Ljava/lang/Object;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "isSetter"    # Z

    .line 866
    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 867
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 868
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 869
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_2

    .line 870
    const/4 v1, 0x0

    return-object v1

    .line 871
    :cond_2
    instance-of v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v1, :cond_5

    .line 872
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .line 873
    .local v1, "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    if-eqz p3, :cond_3

    iget-object v2, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    goto :goto_1

    :cond_3
    iget-object v2, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    .line 874
    .local v2, "result":Ljava/lang/Object;
    :goto_1
    if-eqz v2, :cond_4

    move-object v3, v2

    goto :goto_2

    :cond_4
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_2
    return-object v3

    .line 876
    .end local v1    # "gslot":Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;
    .end local v2    # "result":Ljava/lang/Object;
    :cond_5
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 1

    .line 1000
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getIds(ZZ)[Ljava/lang/Object;
    .locals 10
    .param p1, "getNonEnumerable"    # Z
    .param p2, "getSymbols"    # Z

    .line 2903
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayLength()I

    move-result v0

    .line 2905
    .local v0, "externalLen":I
    :goto_0
    if-nez v0, :cond_1

    .line 2906
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .local v2, "a":[Ljava/lang/Object;
    goto :goto_2

    .line 2908
    .end local v2    # "a":[Ljava/lang/Object;
    :cond_1
    new-array v2, v0, [Ljava/lang/Object;

    .line 2909
    .restart local v2    # "a":[Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v0, :cond_2

    .line 2910
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 2909
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 2913
    .end local v3    # "i":I
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/SlotMapContainer;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2914
    return-object v2

    .line 2917
    :cond_3
    move v3, v0

    .line 2918
    .local v3, "c":I
    iget-object v4, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/SlotMapContainer;->readLock()J

    move-result-wide v4

    .line 2920
    .local v4, "stamp":J
    :try_start_0
    iget-object v6, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v6}, Lcom/trendmicro/hippo/SlotMapContainer;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 2921
    .local v7, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez p1, :cond_4

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v8

    and-int/lit8 v8, v8, 0x2

    if-nez v8, :cond_8

    :cond_4
    if-nez p2, :cond_5

    iget-object v8, v7, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    instance-of v8, v8, Lcom/trendmicro/hippo/Symbol;

    if-nez v8, :cond_8

    .line 2923
    :cond_5
    if-ne v3, v0, :cond_6

    .line 2925
    move-object v8, v2

    .line 2926
    .local v8, "oldA":[Ljava/lang/Object;
    iget-object v9, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v9}, Lcom/trendmicro/hippo/SlotMapContainer;->dirtySize()I

    move-result v9

    add-int/2addr v9, v0

    new-array v9, v9, [Ljava/lang/Object;

    move-object v2, v9

    .line 2927
    if-eqz v8, :cond_6

    .line 2928
    invoke-static {v8, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2931
    .end local v8    # "oldA":[Ljava/lang/Object;
    :cond_6
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "c":I
    .local v8, "c":I
    :try_start_1
    iget-object v9, v7, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    if-eqz v9, :cond_7

    .line 2932
    iget-object v9, v7, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    goto :goto_4

    .line 2933
    :cond_7
    iget v9, v7, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_4
    aput-object v9, v2, v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v3, v8

    .line 2935
    .end local v7    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .end local v8    # "c":I
    .restart local v3    # "c":I
    :cond_8
    goto :goto_3

    .line 2937
    .end local v3    # "c":I
    .restart local v8    # "c":I
    :catchall_0
    move-exception v1

    move v3, v8

    goto :goto_6

    .end local v8    # "c":I
    .restart local v3    # "c":I
    :cond_9
    iget-object v6, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v6, v4, v5}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2938
    nop

    .line 2941
    array-length v6, v2

    add-int/2addr v6, v0

    if-ne v3, v6, :cond_a

    .line 2942
    move-object v1, v2

    .local v1, "result":[Ljava/lang/Object;
    goto :goto_5

    .line 2944
    .end local v1    # "result":[Ljava/lang/Object;
    :cond_a
    new-array v6, v3, [Ljava/lang/Object;

    .line 2945
    .local v6, "result":[Ljava/lang/Object;
    invoke-static {v2, v1, v6, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v6

    .line 2948
    .end local v6    # "result":[Ljava/lang/Object;
    .restart local v1    # "result":[Ljava/lang/Object;
    :goto_5
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v6

    .line 2949
    .local v6, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v6, :cond_b

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 2951
    sget-object v7, Lcom/trendmicro/hippo/ScriptableObject;->KEY_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v1, v7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 2954
    :cond_b
    return-object v1

    .line 2937
    .end local v1    # "result":[Ljava/lang/Object;
    .end local v6    # "cx":Lcom/trendmicro/hippo/Context;
    :catchall_1
    move-exception v1

    :goto_6
    iget-object v6, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v6, v4, v5}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2938
    throw v1
.end method

.method protected getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 2991
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 2992
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 2993
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 2994
    .local v1, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v1, :cond_1

    move-object v2, p0

    goto :goto_0

    :cond_1
    move-object v2, v1

    :goto_0
    invoke-virtual {v0, p1, v2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getPropertyDescriptor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v2

    return-object v2
.end method

.method public getParentScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 975
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->parentScopeObject:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 957
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->prototypeObject:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method protected getSlot(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 2998
    instance-of v0, p2, Lcom/trendmicro/hippo/Symbol;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2999
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p2, v1, p3}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    return-object v0

    .line 3001
    :cond_0
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 3002
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 3003
    iget-object v1, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v3

    invoke-virtual {v1, v2, v3, p3}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v1

    return-object v1

    .line 3005
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v2, v0, v1, p3}, Lcom/trendmicro/hippo/SlotMapContainer;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v1

    return-object v1
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .line 395
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ScriptableObject;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "undefined"

    goto :goto_0

    :cond_0
    const-string v0, "object"

    :goto_0
    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 4
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 431
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 432
    invoke-interface {v0}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayLength()I

    move-result v0

    if-ge p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 434
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, p1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 443
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 418
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1103
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->jsDelegatesTo(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z
    .locals 1
    .param p1, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 2105
    const-string v0, "get"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "set"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

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

.method public isConst(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 659
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 660
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-nez v0, :cond_0

    .line 661
    return v1

    .line 663
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v2

    const/4 v3, 0x5

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method protected isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z
    .locals 1
    .param p1, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 2096
    const-string v0, "value"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "writable"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

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

.method public isEmpty()Z
    .locals 1

    .line 3016
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SlotMapContainer;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isExtensible()Z
    .locals 1

    .line 2245
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    return v0
.end method

.method protected isGenericDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z
    .locals 1
    .param p1, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 2114
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isGetterOrSetter(Ljava/lang/String;IZ)Z
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "setter"    # Z

    .line 887
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMapContainer;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    .line 888
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    instance-of v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v1, :cond_1

    .line 889
    const/4 v1, 0x1

    if-eqz p3, :cond_0

    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    iget-object v2, v2, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->setter:Ljava/lang/Object;

    if-eqz v2, :cond_0

    return v1

    .line 890
    :cond_0
    if-nez p3, :cond_1

    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    iget-object v2, v2, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;->getter:Ljava/lang/Object;

    if-eqz v2, :cond_1

    return v1

    .line 892
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public final isSealed()Z
    .locals 1

    .line 2291
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z

    return v0
.end method

.method public preventExtensions()V
    .locals 1

    .line 2249
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible:Z

    .line 2250
    return-void
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 538
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 539
    invoke-interface {v0}, Lcom/trendmicro/hippo/ExternalArrayData;->getArrayLength()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 540
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    invoke-interface {v0, p1, p3}, Lcom/trendmicro/hippo/ExternalArrayData;->setArrayElement(ILjava/lang/Object;)V

    .line 548
    return-void

    .line 542
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/JavaScriptException;

    .line 543
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    sget-object v3, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->RangeError:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "External array index out of bounds "

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, p0, v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->newNativeError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$NativeErrors;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-direct {v0, v2, v1, v6}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0

    .line 551
    :cond_1
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->putImpl(Ljava/lang/Object;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 552
    return-void

    .line 554
    :cond_2
    if-eq p2, p0, :cond_3

    .line 555
    invoke-interface {p2, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 556
    return-void

    .line 554
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 564
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->putImpl(Ljava/lang/Object;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    return-void

    .line 567
    :cond_0
    if-eq p2, p0, :cond_1

    .line 568
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 569
    return-void

    .line 567
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 521
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->putImpl(Ljava/lang/Object;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 522
    return-void

    .line 524
    :cond_0
    if-eq p2, p0, :cond_1

    .line 525
    invoke-interface {p2, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 526
    return-void

    .line 524
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public putConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 629
    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptableObject;->putConstImpl(Ljava/lang/String;ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 630
    return-void

    .line 632
    :cond_0
    if-eq p2, p0, :cond_2

    .line 633
    instance-of v0, p2, Lcom/trendmicro/hippo/ConstProperties;

    if-eqz v0, :cond_1

    .line 634
    move-object v0, p2

    check-cast v0, Lcom/trendmicro/hippo/ConstProperties;

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/ConstProperties;->putConst(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 636
    :cond_1
    invoke-interface {p2, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 637
    :goto_0
    return-void

    .line 632
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method protected sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 8
    .param p1, "newValue"    # Ljava/lang/Object;
    .param p2, "currentValue"    # Ljava/lang/Object;

    .line 2045
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    .line 2046
    return v1

    .line 2048
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v0, :cond_1

    .line 2049
    sget-object p2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 2053
    :cond_1
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_3

    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_3

    .line 2054
    move-object v0, p2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 2055
    .local v2, "d1":D
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .line 2056
    .local v4, "d2":D
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2057
    return v1

    .line 2059
    :cond_2
    const-wide/16 v0, 0x0

    cmpl-double v0, v2, v0

    if-nez v0, :cond_3

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v0, v0, v6

    if-eqz v0, :cond_3

    .line 2060
    const/4 v0, 0x0

    return v0

    .line 2063
    .end local v2    # "d1":D
    .end local v4    # "d2":D
    :cond_3
    invoke-static {p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public sealObject()V
    .locals 7

    .line 2262
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z

    if-nez v0, :cond_2

    .line 2263
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SlotMapContainer;->readLock()J

    move-result-wide v0

    .line 2265
    .local v0, "stamp":J
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/SlotMapContainer;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 2266
    .local v3, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2267
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Lcom/trendmicro/hippo/LazilyLoadedCtor;

    if-eqz v5, :cond_0

    .line 2268
    move-object v5, v4

    check-cast v5, Lcom/trendmicro/hippo/LazilyLoadedCtor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2270
    .local v5, "initializer":Lcom/trendmicro/hippo/LazilyLoadedCtor;
    :try_start_1
    invoke-virtual {v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->init()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2272
    :try_start_2
    invoke-virtual {v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v6

    iput-object v6, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2273
    goto :goto_1

    .line 2272
    :catchall_0
    move-exception v2

    invoke-virtual {v5}, Lcom/trendmicro/hippo/LazilyLoadedCtor;->getValue()Ljava/lang/Object;

    move-result-object v6

    iput-object v6, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 2273
    nop

    .end local v0    # "stamp":J
    throw v2

    .line 2275
    .end local v3    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .end local v4    # "value":Ljava/lang/Object;
    .end local v5    # "initializer":Lcom/trendmicro/hippo/LazilyLoadedCtor;
    .restart local v0    # "stamp":J
    :cond_0
    :goto_1
    goto :goto_0

    .line 2276
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->isSealed:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2278
    iget-object v2, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v2, v0, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2279
    goto :goto_2

    .line 2278
    :catchall_1
    move-exception v2

    iget-object v3, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v3, v0, v1}, Lcom/trendmicro/hippo/SlotMapContainer;->unlockRead(J)V

    .line 2279
    throw v2

    .line 2281
    .end local v0    # "stamp":J
    :cond_2
    :goto_2
    return-void
.end method

.method public setAttributes(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "attributes"    # I

    .line 795
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 796
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-direct {p0, v0, p1, v1}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Ljava/lang/String;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 797
    return-void
.end method

.method public setAttributes(ILcom/trendmicro/hippo/Scriptable;I)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "attributes"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 707
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(II)V

    .line 708
    return-void
.end method

.method public setAttributes(Lcom/trendmicro/hippo/Symbol;I)V
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "attributes"    # I

    .line 804
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 805
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 806
    return-void
.end method

.method public setAttributes(Ljava/lang/String;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attributes"    # I

    .line 777
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->checkNotSealed(Ljava/lang/Object;I)V

    .line 778
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    invoke-direct {p0, p1, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->findAttributeSlot(Ljava/lang/String;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 779
    return-void
.end method

.method public final setAttributes(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "attributes"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 696
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 697
    return-void
.end method

.method public setExternalArrayData(Lcom/trendmicro/hippo/ExternalArrayData;)V
    .locals 7
    .param p1, "array"    # Lcom/trendmicro/hippo/ExternalArrayData;

    .line 921
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject;->externalData:Lcom/trendmicro/hippo/ExternalArrayData;

    .line 923
    if-nez p1, :cond_0

    .line 924
    const-string v0, "length"

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->delete(Ljava/lang/String;)V

    goto :goto_0

    .line 927
    :cond_0
    const/4 v3, 0x0

    sget-object v4, Lcom/trendmicro/hippo/ScriptableObject;->GET_ARRAY_LENGTH:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    const/4 v6, 0x3

    const-string v2, "length"

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;I)V

    .line 930
    :goto_0
    return-void
.end method

.method public setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "getterOrSetter"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "isSetter"    # Z

    .line 814
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;ZZ)V

    .line 815
    return-void
.end method

.method public setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "m"    # Lcom/trendmicro/hippo/Scriptable;

    .line 984
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject;->parentScopeObject:Lcom/trendmicro/hippo/Scriptable;

    .line 985
    return-void
.end method

.method public setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "m"    # Lcom/trendmicro/hippo/Scriptable;

    .line 966
    iput-object p1, p0, Lcom/trendmicro/hippo/ScriptableObject;->prototypeObject:Lcom/trendmicro/hippo/Scriptable;

    .line 967
    return-void
.end method

.method public size()I
    .locals 1

    .line 3012
    iget-object v0, p0, Lcom/trendmicro/hippo/ScriptableObject;->slotMap:Lcom/trendmicro/hippo/SlotMapContainer;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/SlotMapContainer;->size()I

    move-result v0

    return v0
.end method
