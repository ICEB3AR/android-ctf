.class Lcom/trendmicro/hippo/JavaMembers;
.super Ljava/lang/Object;
.source "JavaMembers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    }
.end annotation


# instance fields
.field private cl:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field ctors:Lcom/trendmicro/hippo/NativeJavaMethod;

.field private fieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field

.field private members:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

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

.field private staticMembers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V
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

    .line 35
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/trendmicro/hippo/JavaMembers;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V

    .line 36
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V
    .locals 4
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "includeProtected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;Z)V"
        }
    .end annotation

    .line 39
    .local p2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    :try_start_0
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ContextFactory;->enterContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 42
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getClassShutter()Lcom/trendmicro/hippo/ClassShutter;

    move-result-object v1

    .line 43
    .local v1, "shutter":Lcom/trendmicro/hippo/ClassShutter;
    if-eqz v1, :cond_1

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/trendmicro/hippo/ClassShutter;->visibleToScripts(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 44
    :cond_0
    const-string v2, "msg.access.prohibited"

    .line 45
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 44
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    .end local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local p2    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local p3    # "includeProtected":Z
    throw v2

    .line 47
    .restart local p1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .restart local p2    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local p3    # "includeProtected":Z
    :cond_1
    :goto_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 48
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    .line 49
    iput-object p2, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    .line 50
    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v2

    .line 52
    .local v2, "includePrivate":Z
    invoke-direct {p0, p1, p3, v2}, Lcom/trendmicro/hippo/JavaMembers;->reflect(Lcom/trendmicro/hippo/Scriptable;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local v1    # "shutter":Lcom/trendmicro/hippo/ClassShutter;
    .end local v2    # "includePrivate":Z
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 55
    nop

    .line 56
    return-void

    .line 54
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 55
    throw v0
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V
    .locals 8
    .param p2, "includeProtected"    # Z
    .param p3, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Lcom/trendmicro/hippo/JavaMembers$MethodSignature;",
            "Ljava/lang/reflect/Method;",
            ">;ZZ)V"
        }
    .end annotation

    .line 317
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/JavaMembers$MethodSignature;Ljava/lang/reflect/Method;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    if-eqz p3, :cond_b

    .line 319
    :cond_0
    if-nez p2, :cond_3

    if-eqz p3, :cond_1

    goto :goto_1

    .line 358
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 359
    .local v0, "methods":[Ljava/lang/reflect/Method;
    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_e

    aget-object v4, v0, v3

    .line 360
    .local v4, "method":Ljava/lang/reflect/Method;
    new-instance v5, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;

    invoke-direct {v5, v4}, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 362
    .local v5, "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    invoke-interface {p1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 363
    invoke-interface {p1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 367
    .end local v0    # "methods":[Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    goto/16 :goto_5

    .line 320
    :cond_3
    :goto_1
    if-eqz p0, :cond_e

    .line 322
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 323
    .restart local v0    # "methods":[Ljava/lang/reflect/Method;
    array-length v2, v0

    move v3, v1

    :goto_2
    if-ge v3, v2, :cond_7

    aget-object v4, v0, v3

    .line 324
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    .line 326
    .local v5, "mods":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-nez v6, :cond_4

    .line 327
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v6

    if-nez v6, :cond_4

    if-eqz p3, :cond_6

    .line 329
    :cond_4
    new-instance v6, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;

    invoke-direct {v6, v4}, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 330
    .local v6, "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    invoke-interface {p1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 331
    if-eqz p3, :cond_5

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v7

    if-nez v7, :cond_5

    .line 332
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 333
    :cond_5
    invoke-interface {p1, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "mods":I
    .end local v6    # "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 337
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 338
    .local v2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v3, v2

    move v4, v1

    :goto_3
    if-ge v4, v3, :cond_8

    aget-object v5, v2, v4

    .line 339
    .local v5, "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v5, p1, p2, p3}, Lcom/trendmicro/hippo/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 338
    .end local v5    # "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 342
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    move-object p0, v3

    .line 355
    .end local v0    # "methods":[Ljava/lang/reflect/Method;
    .end local v2    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    goto :goto_1

    .line 343
    :catch_1
    move-exception v0

    .line 347
    .local v0, "e":Ljava/lang/SecurityException;
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 348
    .local v2, "methods":[Ljava/lang/reflect/Method;
    array-length v3, v2

    move v4, v1

    :goto_4
    if-ge v4, v3, :cond_a

    aget-object v5, v2, v4

    .line 349
    .local v5, "method":Ljava/lang/reflect/Method;
    new-instance v6, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;

    invoke-direct {v6, v5}, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 350
    .restart local v6    # "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    invoke-interface {p1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 351
    invoke-interface {p1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 348
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "sig":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 353
    :cond_a
    goto :goto_7

    .line 368
    .end local v2    # "methods":[Ljava/lang/reflect/Method;
    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not discover accessible methods of class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " due to lack of privileges, attemping superclasses/interfaces."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 368
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 377
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    .line 378
    .local v0, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v2, v0

    :goto_6
    if-ge v1, v2, :cond_c

    aget-object v3, v0, v1

    .line 379
    .local v3, "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v3, p1, p2, p3}, Lcom/trendmicro/hippo/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 378
    .end local v3    # "intface":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 382
    :cond_c
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 383
    .local v1, "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_d

    .line 384
    invoke-static {v1, p1, p2, p3}, Lcom/trendmicro/hippo/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 387
    :cond_d
    return-void

    .line 366
    .end local v0    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v1    # "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_e
    :goto_7
    return-void
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;ZZ)[Ljava/lang/reflect/Method;
    .locals 3
    .param p1, "includeProtected"    # Z
    .param p2, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;ZZ)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 308
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 309
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/JavaMembers$MethodSignature;Ljava/lang/reflect/Method;>;"
    invoke-static {p0, v0, p1, p2}, Lcom/trendmicro/hippo/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;ZZ)V

    .line 310
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/reflect/Method;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Method;

    return-object v1
.end method

.method private static extractGetMethod([Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;
    .locals 4
    .param p0, "methods"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p1, "isStatic"    # Z

    .line 720
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p0, v1

    .line 723
    .local v2, "method":Lcom/trendmicro/hippo/MemberBox;
    iget-object v3, v2, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    array-length v3, v3

    if-nez v3, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 724
    :cond_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    .line 725
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_2

    .line 726
    return-object v2

    .line 720
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method":Lcom/trendmicro/hippo/MemberBox;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 731
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private static extractSetMethod(Ljava/lang/Class;[Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;
    .locals 9
    .param p1, "methods"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p2, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Lcom/trendmicro/hippo/MemberBox;",
            "Z)",
            "Lcom/trendmicro/hippo/MemberBox;"
        }
    .end annotation

    .line 745
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    .local v0, "pass":I
    :goto_0
    const/4 v1, 0x2

    if-gt v0, v1, :cond_5

    .line 746
    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    if-ge v4, v2, :cond_4

    aget-object v5, p1, v4

    .line 747
    .local v5, "method":Lcom/trendmicro/hippo/MemberBox;
    if-eqz p2, :cond_0

    invoke-virtual {v5}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 748
    :cond_0
    iget-object v6, v5, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 749
    .local v6, "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v6

    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    .line 750
    if-ne v0, v8, :cond_1

    .line 751
    aget-object v7, v6, v3

    if-ne v7, p0, :cond_3

    .line 752
    return-object v5

    .line 755
    :cond_1
    if-eq v0, v1, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 756
    :cond_2
    aget-object v7, v6, v3

    invoke-virtual {v7, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 757
    return-object v5

    .line 746
    .end local v5    # "method":Lcom/trendmicro/hippo/MemberBox;
    .end local v6    # "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 745
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 764
    .end local v0    # "pass":I
    :cond_5
    const/4 v0, 0x0

    return-object v0
.end method

.method private static extractSetMethod([Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;
    .locals 5
    .param p0, "methods"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p1, "isStatic"    # Z

    .line 771
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p0, v1

    .line 772
    .local v2, "method":Lcom/trendmicro/hippo/MemberBox;
    if-eqz p1, :cond_0

    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 773
    :cond_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v3, v4, :cond_1

    .line 774
    iget-object v3, v2, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    array-length v3, v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 775
    return-object v2

    .line 771
    .end local v2    # "method":Lcom/trendmicro/hippo/MemberBox;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 780
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private findExplicitFunction(Ljava/lang/String;Z)Lcom/trendmicro/hippo/MemberBox;
    .locals 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStatic"    # Z

    .line 223
    const/16 v0, 0x28

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 224
    .local v0, "sigStart":I
    const/4 v1, 0x0

    if-gez v0, :cond_0

    return-object v1

    .line 226
    :cond_0
    if-eqz p2, :cond_1

    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 227
    .local v2, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    const/4 v3, 0x0

    .line 228
    .local v3, "methodsOrCtors":[Lcom/trendmicro/hippo/MemberBox;
    const/4 v4, 0x0

    if-eqz p2, :cond_2

    if-nez v0, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    move v5, v4

    .line 230
    .local v5, "isCtor":Z
    :goto_1
    if-eqz v5, :cond_3

    .line 232
    iget-object v6, p0, Lcom/trendmicro/hippo/JavaMembers;->ctors:Lcom/trendmicro/hippo/NativeJavaMethod;

    iget-object v3, v6, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    goto :goto_2

    .line 235
    :cond_3
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 236
    .local v6, "trueName":Ljava/lang/String;
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 237
    .local v7, "obj":Ljava/lang/Object;
    if-nez p2, :cond_4

    if-nez v7, :cond_4

    .line 239
    iget-object v8, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    invoke-interface {v8, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 241
    :cond_4
    instance-of v8, v7, Lcom/trendmicro/hippo/NativeJavaMethod;

    if-eqz v8, :cond_5

    .line 242
    move-object v8, v7

    check-cast v8, Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 243
    .local v8, "njm":Lcom/trendmicro/hippo/NativeJavaMethod;
    iget-object v3, v8, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    .line 247
    .end local v6    # "trueName":Ljava/lang/String;
    .end local v7    # "obj":Ljava/lang/Object;
    .end local v8    # "njm":Lcom/trendmicro/hippo/NativeJavaMethod;
    :cond_5
    :goto_2
    if-eqz v3, :cond_7

    .line 248
    array-length v6, v3

    move v7, v4

    :goto_3
    if-ge v7, v6, :cond_7

    aget-object v8, v3, v7

    .line 249
    .local v8, "methodsOrCtor":Lcom/trendmicro/hippo/MemberBox;
    iget-object v9, v8, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 250
    .local v9, "type":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {v9}, Lcom/trendmicro/hippo/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v10

    .line 251
    .local v10, "sig":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v11, v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v12

    if-ne v11, v12, :cond_6

    .line 252
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {p1, v0, v10, v4, v11}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 254
    return-object v8

    .line 248
    .end local v8    # "methodsOrCtor":Lcom/trendmicro/hippo/MemberBox;
    .end local v9    # "type":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v10    # "sig":Ljava/lang/String;
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 259
    :cond_7
    return-object v1
.end method

.method private findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/MemberBox;
    .locals 4
    .param p1, "isStatic"    # Z
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/trendmicro/hippo/MemberBox;"
        }
    .end annotation

    .line 703
    .local p2, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p3, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 704
    .local v0, "getterName":Ljava/lang/String;
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 706
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 707
    .local v1, "member":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeJavaMethod;

    if-eqz v2, :cond_0

    .line 708
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 709
    .local v2, "njmGet":Lcom/trendmicro/hippo/NativeJavaMethod;
    iget-object v3, v2, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    invoke-static {v3, p1}, Lcom/trendmicro/hippo/JavaMembers;->extractGetMethod([Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v3

    return-object v3

    .line 712
    .end local v1    # "member":Ljava/lang/Object;
    .end local v2    # "njmGet":Lcom/trendmicro/hippo/NativeJavaMethod;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private getAccessibleConstructors(Z)[Ljava/lang/reflect/Constructor;
    .locals 3
    .param p1, "includePrivate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)[",
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation

    .line 652
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-eq v0, v1, :cond_0

    .line 654
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 655
    .local v0, "cons":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 657
    return-object v0

    .line 658
    .end local v0    # "cons":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    :catch_0
    move-exception v0

    .line 660
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not access constructor  of class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    .line 661
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " due to lack of privileges."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 660
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 665
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method private getAccessibleFields(ZZ)[Ljava/lang/reflect/Field;
    .locals 8
    .param p1, "includeProtected"    # Z
    .param p2, "includePrivate"    # Z

    .line 670
    if-nez p2, :cond_0

    if-eqz p1, :cond_6

    .line 672
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 673
    .local v0, "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    .line 675
    .local v1, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v1, :cond_5

    .line 678
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 679
    .local v2, "declared":[Ljava/lang/reflect/Field;
    array-length v3, v2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_4

    aget-object v5, v2, v4

    .line 680
    .local v5, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 681
    .local v6, "mod":I
    if-nez p2, :cond_1

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-nez v7, :cond_1

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 682
    :cond_1
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v7

    if-nez v7, :cond_2

    .line 683
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 684
    :cond_2
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 679
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "mod":I
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 689
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    move-object v1, v3

    .line 690
    .end local v2    # "declared":[Ljava/lang/reflect/Field;
    goto :goto_0

    .line 692
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/reflect/Field;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/reflect/Field;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 693
    .end local v0    # "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v1    # "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v0

    .line 697
    :cond_6
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    return-object v0
.end method

.method private getExplicitFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 7
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "isStatic"    # Z

    .line 265
    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 266
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    const/4 v1, 0x0

    .line 267
    .local v1, "member":Ljava/lang/Object;
    invoke-direct {p0, p2, p4}, Lcom/trendmicro/hippo/JavaMembers;->findExplicitFunction(Ljava/lang/String;Z)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v2

    .line 269
    .local v2, "methodOrCtor":Lcom/trendmicro/hippo/MemberBox;
    if-eqz v2, :cond_2

    .line 270
    nop

    .line 271
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 273
    .local v3, "prototype":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->isCtor()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 274
    new-instance v4, Lcom/trendmicro/hippo/NativeJavaConstructor;

    invoke-direct {v4, v2}, Lcom/trendmicro/hippo/NativeJavaConstructor;-><init>(Lcom/trendmicro/hippo/MemberBox;)V

    .line 276
    .local v4, "fun":Lcom/trendmicro/hippo/NativeJavaConstructor;
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/NativeJavaConstructor;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 277
    move-object v1, v4

    .line 278
    invoke-interface {v0, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    .end local v4    # "fun":Lcom/trendmicro/hippo/NativeJavaConstructor;
    goto :goto_1

    .line 280
    :cond_1
    invoke-virtual {v2}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v4

    .line 281
    .local v4, "trueName":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 283
    instance-of v5, v1, Lcom/trendmicro/hippo/NativeJavaMethod;

    if-eqz v5, :cond_2

    move-object v5, v1

    check-cast v5, Lcom/trendmicro/hippo/NativeJavaMethod;

    iget-object v5, v5, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_2

    .line 285
    new-instance v5, Lcom/trendmicro/hippo/NativeJavaMethod;

    invoke-direct {v5, v2, p2}, Lcom/trendmicro/hippo/NativeJavaMethod;-><init>(Lcom/trendmicro/hippo/MemberBox;Ljava/lang/String;)V

    .line 287
    .local v5, "fun":Lcom/trendmicro/hippo/NativeJavaMethod;
    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/NativeJavaMethod;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 288
    invoke-interface {v0, p2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    move-object v1, v5

    .line 294
    .end local v3    # "prototype":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "trueName":Ljava/lang/String;
    .end local v5    # "fun":Lcom/trendmicro/hippo/NativeJavaMethod;
    :cond_2
    :goto_1
    return-object v1
.end method

.method static javaSignature(Ljava/lang/Class;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 182
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 185
    :cond_0
    const/4 v0, 0x0

    .line 187
    .local v0, "arrayDimension":I
    :goto_0
    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 188
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p0

    .line 189
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_3

    .line 190
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 191
    .local v2, "name":Ljava/lang/String;
    const-string v3, "[]"

    .line 192
    .local v3, "suffix":Ljava/lang/String;
    if-ne v0, v1, :cond_1

    .line 193
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 195
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    mul-int/2addr v4, v0

    add-int/2addr v1, v4

    .line 196
    .local v1, "length":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 197
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    :goto_1
    if-eqz v0, :cond_2

    .line 199
    add-int/lit8 v0, v0, -0x1

    .line 200
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 202
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 189
    .end local v1    # "length":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "suffix":Ljava/lang/String;
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    goto :goto_0
.end method

.method static liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 207
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v0, p0

    .line 208
    .local v0, "N":I
    if-nez v0, :cond_0

    const-string v1, "()"

    return-object v1

    .line 209
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_2

    .line 212
    if-eqz v2, :cond_1

    .line 213
    const/16 v3, 0x2c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 215
    :cond_1
    aget-object v3, p0, v2

    invoke-static {v3}, Lcom/trendmicro/hippo/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 217
    .end local v2    # "i":I
    :cond_2
    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 218
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static lookupClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lcom/trendmicro/hippo/JavaMembers;
    .locals 7
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "includeProtected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;Z)",
            "Lcom/trendmicro/hippo/JavaMembers;"
        }
    .end annotation

    .line 804
    .local p1, "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/trendmicro/hippo/ClassCache;->get(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ClassCache;

    move-result-object v0

    .line 805
    .local v0, "cache":Lcom/trendmicro/hippo/ClassCache;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->getClassCacheMap()Ljava/util/Map;

    move-result-object v1

    .line 807
    .local v1, "ct":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lcom/trendmicro/hippo/JavaMembers;>;"
    move-object v2, p1

    .line 809
    .local v2, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/JavaMembers;

    .line 810
    .local v3, "members":Lcom/trendmicro/hippo/JavaMembers;
    if-eqz v3, :cond_1

    .line 811
    if-eq v2, p1, :cond_0

    .line 814
    invoke-interface {v1, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 816
    :cond_0
    return-object v3

    .line 819
    :cond_1
    :try_start_0
    new-instance v4, Lcom/trendmicro/hippo/JavaMembers;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->getAssociatedScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    invoke-direct {v4, v5, v2, p3}, Lcom/trendmicro/hippo/JavaMembers;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;Z)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v4

    .line 821
    nop

    .line 845
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ClassCache;->isCachingEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 846
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 847
    if-eq v2, p1, :cond_2

    .line 850
    invoke-interface {v1, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 853
    :cond_2
    return-object v3

    .line 822
    :catch_0
    move-exception v4

    .line 827
    .local v4, "e":Ljava/lang/SecurityException;
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 828
    move-object v2, p2

    .line 829
    const/4 p2, 0x0

    goto :goto_2

    .line 831
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    .line 832
    .local v5, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v5, :cond_5

    .line 833
    invoke-virtual {v2}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 835
    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    goto :goto_1

    .line 837
    :cond_4
    throw v4

    .line 840
    :cond_5
    :goto_1
    move-object v2, v5

    .line 842
    .end local v4    # "e":Ljava/lang/SecurityException;
    .end local v5    # "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    goto :goto_0
.end method

.method private reflect(Lcom/trendmicro/hippo/Scriptable;ZZ)V
    .locals 27
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "includeProtected"    # Z
    .param p3, "includePrivate"    # Z

    .line 431
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    iget-object v0, v1, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    invoke-static {v0, v3, v4}, Lcom/trendmicro/hippo/JavaMembers;->discoverAccessibleMethods(Ljava/lang/Class;ZZ)[Ljava/lang/reflect/Method;

    move-result-object v5

    .line 433
    .local v5, "methods":[Ljava/lang/reflect/Method;
    array-length v0, v5

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v0, :cond_4

    aget-object v8, v5, v7

    .line 434
    .local v8, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v9

    .line 435
    .local v9, "mods":I
    invoke-static {v9}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v10

    .line 436
    .local v10, "isStatic":Z
    if-eqz v10, :cond_0

    iget-object v11, v1, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_1

    :cond_0
    iget-object v11, v1, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 437
    .local v11, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_1
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v12

    .line 438
    .local v12, "name":Ljava/lang/String;
    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 439
    .local v13, "value":Ljava/lang/Object;
    if-nez v13, :cond_1

    .line 440
    invoke-interface {v11, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 443
    :cond_1
    instance-of v14, v13, Lcom/trendmicro/hippo/ObjArray;

    if-eqz v14, :cond_2

    .line 444
    move-object v14, v13

    check-cast v14, Lcom/trendmicro/hippo/ObjArray;

    .local v14, "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    goto :goto_2

    .line 446
    .end local v14    # "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    :cond_2
    instance-of v14, v13, Ljava/lang/reflect/Method;

    if-nez v14, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 449
    :cond_3
    new-instance v14, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v14}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    .line 450
    .restart local v14    # "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    invoke-virtual {v14, v13}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 451
    invoke-interface {v11, v12, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    :goto_2
    invoke-virtual {v14, v8}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 433
    .end local v8    # "method":Ljava/lang/reflect/Method;
    .end local v9    # "mods":I
    .end local v10    # "isStatic":Z
    .end local v11    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/Object;
    .end local v14    # "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 459
    :cond_4
    const/4 v0, 0x0

    .local v0, "tableCursor":I
    :goto_4
    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eq v0, v7, :cond_c

    .line 460
    if-nez v0, :cond_5

    move v9, v8

    goto :goto_5

    :cond_5
    move v9, v6

    .line 461
    .local v9, "isStatic":Z
    :goto_5
    if-eqz v9, :cond_6

    iget-object v10, v1, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_6

    :cond_6
    iget-object v10, v1, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 462
    .local v10, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_6
    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 464
    .local v12, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    .line 465
    .restart local v13    # "value":Ljava/lang/Object;
    instance-of v14, v13, Ljava/lang/reflect/Method;

    if-eqz v14, :cond_7

    .line 466
    new-array v14, v8, [Lcom/trendmicro/hippo/MemberBox;

    .line 467
    .local v14, "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    new-instance v15, Lcom/trendmicro/hippo/MemberBox;

    move-object v8, v13

    check-cast v8, Ljava/lang/reflect/Method;

    invoke-direct {v15, v8}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    aput-object v15, v14, v6

    move-object/from16 v17, v5

    goto :goto_9

    .line 469
    .end local v14    # "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    :cond_7
    move-object v8, v13

    check-cast v8, Lcom/trendmicro/hippo/ObjArray;

    .line 470
    .local v8, "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v14

    .line 471
    .local v14, "N":I
    if-ge v14, v7, :cond_8

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 472
    :cond_8
    new-array v15, v14, [Lcom/trendmicro/hippo/MemberBox;

    .line 473
    .local v15, "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    const/16 v17, 0x0

    move/from16 v6, v17

    .local v6, "i":I
    :goto_8
    if-eq v6, v14, :cond_9

    .line 474
    invoke-virtual {v8, v6}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v7, v17

    check-cast v7, Ljava/lang/reflect/Method;

    .line 475
    .local v7, "method":Ljava/lang/reflect/Method;
    move-object/from16 v17, v5

    .end local v5    # "methods":[Ljava/lang/reflect/Method;
    .local v17, "methods":[Ljava/lang/reflect/Method;
    new-instance v5, Lcom/trendmicro/hippo/MemberBox;

    invoke-direct {v5, v7}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    aput-object v5, v15, v6

    .line 473
    .end local v7    # "method":Ljava/lang/reflect/Method;
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v5, v17

    const/4 v7, 0x2

    goto :goto_8

    .end local v17    # "methods":[Ljava/lang/reflect/Method;
    .restart local v5    # "methods":[Ljava/lang/reflect/Method;
    :cond_9
    move-object/from16 v17, v5

    .end local v5    # "methods":[Ljava/lang/reflect/Method;
    .restart local v17    # "methods":[Ljava/lang/reflect/Method;
    move-object v14, v15

    .line 478
    .end local v6    # "i":I
    .end local v8    # "overloadedMethods":Lcom/trendmicro/hippo/ObjArray;
    .end local v15    # "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    .local v14, "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    :goto_9
    new-instance v5, Lcom/trendmicro/hippo/NativeJavaMethod;

    invoke-direct {v5, v14}, Lcom/trendmicro/hippo/NativeJavaMethod;-><init>([Lcom/trendmicro/hippo/MemberBox;)V

    .line 479
    .local v5, "fun":Lcom/trendmicro/hippo/NativeJavaMethod;
    if-eqz v2, :cond_a

    .line 480
    invoke-static {v5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 482
    :cond_a
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v10, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    .end local v5    # "fun":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v12    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v13    # "value":Ljava/lang/Object;
    .end local v14    # "methodBoxes":[Lcom/trendmicro/hippo/MemberBox;
    move-object/from16 v5, v17

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x1

    goto :goto_7

    .line 462
    .end local v17    # "methods":[Ljava/lang/reflect/Method;
    .local v5, "methods":[Ljava/lang/reflect/Method;
    :cond_b
    move-object/from16 v17, v5

    .line 459
    .end local v5    # "methods":[Ljava/lang/reflect/Method;
    .end local v9    # "isStatic":Z
    .end local v10    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v17    # "methods":[Ljava/lang/reflect/Method;
    add-int/lit8 v0, v0, 0x1

    const/4 v6, 0x0

    goto/16 :goto_4

    .end local v17    # "methods":[Ljava/lang/reflect/Method;
    .restart local v5    # "methods":[Ljava/lang/reflect/Method;
    :cond_c
    move-object/from16 v17, v5

    .line 487
    .end local v0    # "tableCursor":I
    .end local v5    # "methods":[Ljava/lang/reflect/Method;
    .restart local v17    # "methods":[Ljava/lang/reflect/Method;
    invoke-direct {v1, v3, v4}, Lcom/trendmicro/hippo/JavaMembers;->getAccessibleFields(ZZ)[Ljava/lang/reflect/Field;

    move-result-object v5

    .line 488
    .local v5, "fields":[Ljava/lang/reflect/Field;
    array-length v6, v5

    const/4 v7, 0x0

    :goto_a
    if-ge v7, v6, :cond_15

    aget-object v8, v5, v7

    .line 489
    .local v8, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    .line 490
    .local v9, "name":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v10

    .line 492
    .local v10, "mods":I
    :try_start_0
    invoke-static {v10}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    .line 493
    .local v0, "isStatic":Z
    if-eqz v0, :cond_d

    iget-object v11, v1, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_b

    :cond_d
    iget-object v11, v1, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 494
    .restart local v11    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_b
    invoke-interface {v11, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 495
    .local v12, "member":Ljava/lang/Object;
    if-nez v12, :cond_e

    .line 496
    invoke-interface {v11, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 497
    :cond_e
    instance-of v13, v12, Lcom/trendmicro/hippo/NativeJavaMethod;

    if-eqz v13, :cond_12

    .line 498
    move-object v13, v12

    check-cast v13, Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 499
    .local v13, "method":Lcom/trendmicro/hippo/NativeJavaMethod;
    new-instance v14, Lcom/trendmicro/hippo/FieldAndMethods;

    iget-object v15, v13, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    invoke-direct {v14, v2, v15, v8}, Lcom/trendmicro/hippo/FieldAndMethods;-><init>(Lcom/trendmicro/hippo/Scriptable;[Lcom/trendmicro/hippo/MemberBox;Ljava/lang/reflect/Field;)V

    .line 501
    .local v14, "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    if-eqz v0, :cond_f

    iget-object v15, v1, Lcom/trendmicro/hippo/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    goto :goto_c

    .line 502
    :cond_f
    iget-object v15, v1, Lcom/trendmicro/hippo/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    :goto_c
    nop

    .line 503
    .local v15, "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/FieldAndMethods;>;"
    if-nez v15, :cond_11

    .line 504
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v15, v19

    .line 505
    if-eqz v0, :cond_10

    .line 506
    iput-object v15, v1, Lcom/trendmicro/hippo/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    goto :goto_d

    .line 508
    :cond_10
    iput-object v15, v1, Lcom/trendmicro/hippo/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    .line 511
    :cond_11
    :goto_d
    invoke-interface {v15, v9, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    invoke-interface {v11, v9, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    nop

    .end local v13    # "method":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v14    # "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    .end local v15    # "fmht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/FieldAndMethods;>;"
    goto :goto_e

    :cond_12
    instance-of v13, v12, Ljava/lang/reflect/Field;

    if-eqz v13, :cond_14

    .line 514
    move-object v13, v12

    check-cast v13, Ljava/lang/reflect/Field;

    .line 521
    .local v13, "oldField":Ljava/lang/reflect/Field;
    invoke-virtual {v13}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v14

    .line 522
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_13

    .line 524
    invoke-interface {v11, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    .end local v13    # "oldField":Ljava/lang/reflect/Field;
    :cond_13
    goto :goto_e

    .line 528
    :cond_14
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 535
    .end local v0    # "isStatic":Z
    .end local v11    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v12    # "member":Ljava/lang/Object;
    :goto_e
    goto :goto_f

    .line 530
    :catch_0
    move-exception v0

    .line 532
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Could not access field "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " of class "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v1, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    .line 533
    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " due to lack of privileges."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 532
    invoke-static {v11}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 488
    .end local v0    # "e":Ljava/lang/SecurityException;
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "mods":I
    :goto_f
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_a

    .line 540
    :cond_15
    const/4 v0, 0x0

    .local v0, "tableCursor":I
    :goto_10
    const/4 v6, 0x2

    if-eq v0, v6, :cond_29

    .line 541
    if-nez v0, :cond_16

    const/4 v7, 0x1

    goto :goto_11

    :cond_16
    const/4 v7, 0x0

    .line 542
    .local v7, "isStatic":Z
    :goto_11
    if-eqz v7, :cond_17

    iget-object v8, v1, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_12

    :cond_17
    iget-object v8, v1, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 544
    .local v8, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_12
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 547
    .local v9, "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/BeanProperty;>;"
    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_13
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_27

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 549
    .local v11, "name":Ljava/lang/String;
    const-string v12, "get"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    .line 550
    .local v13, "memberIsGetMethod":Z
    const-string v14, "set"

    invoke-virtual {v11, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    .line 551
    .local v15, "memberIsSetMethod":Z
    const-string v6, "is"

    invoke-virtual {v11, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    .line 552
    .local v19, "memberIsIsMethod":Z
    if-nez v13, :cond_19

    if-nez v19, :cond_19

    if-eqz v15, :cond_18

    goto :goto_14

    :cond_18
    move-object/from16 v22, v5

    move-object/from16 v24, v10

    const/4 v6, 0x1

    goto/16 :goto_1b

    .line 555
    :cond_19
    :goto_14
    nop

    .line 556
    if-eqz v19, :cond_1a

    const/4 v2, 0x2

    goto :goto_15

    :cond_1a
    const/16 v20, 0x3

    move/from16 v2, v20

    :goto_15
    invoke-virtual {v11, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 557
    .local v2, "nameComponent":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_1b

    .line 558
    move-object/from16 v2, p1

    const/4 v6, 0x2

    goto :goto_13

    .line 561
    :cond_1b
    move-object/from16 v20, v2

    .line 562
    .local v20, "beanPropertyName":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v18

    .line 563
    .local v18, "ch0":C
    invoke-static/range {v18 .. v18}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v21

    if-eqz v21, :cond_1e

    .line 564
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    move-object/from16 v22, v5

    const/4 v5, 0x1

    .end local v5    # "fields":[Ljava/lang/reflect/Field;
    .local v22, "fields":[Ljava/lang/reflect/Field;
    if-ne v3, v5, :cond_1c

    .line 565
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v24, v10

    move-object/from16 v3, v20

    goto :goto_17

    .line 567
    :cond_1c
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 568
    .local v3, "ch1":C
    invoke-static {v3}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v16

    if-nez v16, :cond_1d

    .line 569
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v23, v3

    .end local v3    # "ch1":C
    .local v23, "ch1":C
    invoke-static/range {v18 .. v18}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 570
    move-object/from16 v24, v10

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v3, v20

    goto :goto_17

    .line 568
    .end local v23    # "ch1":C
    .restart local v3    # "ch1":C
    :cond_1d
    move/from16 v23, v3

    move-object/from16 v24, v10

    .end local v3    # "ch1":C
    .restart local v23    # "ch1":C
    goto :goto_16

    .line 563
    .end local v22    # "fields":[Ljava/lang/reflect/Field;
    .end local v23    # "ch1":C
    .restart local v5    # "fields":[Ljava/lang/reflect/Field;
    :cond_1e
    move-object/from16 v22, v5

    move-object/from16 v24, v10

    .line 577
    .end local v5    # "fields":[Ljava/lang/reflect/Field;
    .restart local v22    # "fields":[Ljava/lang/reflect/Field;
    :goto_16
    move-object/from16 v3, v20

    .end local v20    # "beanPropertyName":Ljava/lang/String;
    .local v3, "beanPropertyName":Ljava/lang/String;
    :goto_17
    invoke-interface {v9, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 578
    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, v22

    move-object/from16 v10, v24

    const/4 v6, 0x2

    goto/16 :goto_13

    .line 579
    :cond_1f
    invoke-interface {v8, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 580
    .local v5, "v":Ljava/lang/Object;
    if-eqz v5, :cond_21

    .line 582
    if-eqz v4, :cond_20

    instance-of v10, v5, Ljava/lang/reflect/Member;

    if-eqz v10, :cond_20

    move-object v10, v5

    check-cast v10, Ljava/lang/reflect/Member;

    .line 583
    invoke-interface {v10}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v10

    invoke-static {v10}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v10

    if-nez v10, :cond_21

    .line 586
    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, v22

    move-object/from16 v10, v24

    const/4 v6, 0x2

    goto/16 :goto_13

    .line 582
    :cond_20
    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, v22

    move-object/from16 v10, v24

    const/4 v6, 0x2

    goto/16 :goto_13

    .line 592
    :cond_21
    const/4 v10, 0x0

    .line 593
    .local v10, "getter":Lcom/trendmicro/hippo/MemberBox;
    invoke-direct {v1, v7, v8, v12, v2}, Lcom/trendmicro/hippo/JavaMembers;->findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v10

    .line 595
    if-nez v10, :cond_22

    .line 596
    invoke-direct {v1, v7, v8, v6, v2}, Lcom/trendmicro/hippo/JavaMembers;->findGetter(ZLjava/util/Map;Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v10

    .line 600
    :cond_22
    const/4 v6, 0x0

    .line 601
    .local v6, "setter":Lcom/trendmicro/hippo/MemberBox;
    const/4 v12, 0x0

    .line 602
    .local v12, "setters":Lcom/trendmicro/hippo/NativeJavaMethod;
    invoke-virtual {v14, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 604
    .local v14, "setterName":Ljava/lang/String;
    invoke-interface {v8, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_26

    .line 606
    move-object/from16 v20, v2

    .end local v2    # "nameComponent":Ljava/lang/String;
    .local v20, "nameComponent":Ljava/lang/String;
    invoke-interface {v8, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 607
    .local v2, "member":Ljava/lang/Object;
    move-object/from16 v23, v5

    .end local v5    # "v":Ljava/lang/Object;
    .local v23, "v":Ljava/lang/Object;
    instance-of v5, v2, Lcom/trendmicro/hippo/NativeJavaMethod;

    if-eqz v5, :cond_25

    .line 608
    move-object v5, v2

    check-cast v5, Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 609
    .local v5, "njmSet":Lcom/trendmicro/hippo/NativeJavaMethod;
    if-eqz v10, :cond_23

    .line 612
    invoke-virtual {v10}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v25

    move-object/from16 v26, v2

    .end local v2    # "member":Ljava/lang/Object;
    .local v26, "member":Ljava/lang/Object;
    invoke-virtual/range {v25 .. v25}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    .line 613
    .local v2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v25, v6

    .end local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .local v25, "setter":Lcom/trendmicro/hippo/MemberBox;
    iget-object v6, v5, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    invoke-static {v2, v6, v7}, Lcom/trendmicro/hippo/JavaMembers;->extractSetMethod(Ljava/lang/Class;[Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v2

    .line 615
    .end local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .local v2, "setter":Lcom/trendmicro/hippo/MemberBox;
    move-object v6, v2

    goto :goto_18

    .line 617
    .end local v26    # "member":Ljava/lang/Object;
    .local v2, "member":Ljava/lang/Object;
    .restart local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    :cond_23
    move-object/from16 v26, v2

    move-object/from16 v25, v6

    .end local v2    # "member":Ljava/lang/Object;
    .end local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v26    # "member":Ljava/lang/Object;
    iget-object v2, v5, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    invoke-static {v2, v7}, Lcom/trendmicro/hippo/JavaMembers;->extractSetMethod([Lcom/trendmicro/hippo/MemberBox;Z)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v2

    move-object v6, v2

    .line 620
    .end local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    :goto_18
    iget-object v2, v5, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v2, v2

    move-object/from16 v25, v6

    const/4 v6, 0x1

    .end local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    if-le v2, v6, :cond_24

    .line 621
    move-object v12, v5

    move-object/from16 v2, v25

    goto :goto_1a

    .line 620
    :cond_24
    move-object/from16 v2, v25

    goto :goto_1a

    .line 607
    .end local v5    # "njmSet":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .end local v26    # "member":Ljava/lang/Object;
    .restart local v2    # "member":Ljava/lang/Object;
    .restart local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    :cond_25
    move-object/from16 v26, v2

    move-object/from16 v25, v6

    const/4 v6, 0x1

    .end local v2    # "member":Ljava/lang/Object;
    .end local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v26    # "member":Ljava/lang/Object;
    goto :goto_19

    .line 604
    .end local v20    # "nameComponent":Ljava/lang/String;
    .end local v23    # "v":Ljava/lang/Object;
    .end local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .end local v26    # "member":Ljava/lang/Object;
    .local v2, "nameComponent":Ljava/lang/String;
    .local v5, "v":Ljava/lang/Object;
    .restart local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    :cond_26
    move-object/from16 v20, v2

    move-object/from16 v23, v5

    move-object/from16 v25, v6

    const/4 v6, 0x1

    .line 626
    .end local v2    # "nameComponent":Ljava/lang/String;
    .end local v5    # "v":Ljava/lang/Object;
    .end local v6    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .restart local v20    # "nameComponent":Ljava/lang/String;
    .restart local v23    # "v":Ljava/lang/Object;
    .restart local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    :goto_19
    move-object/from16 v2, v25

    .end local v25    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .local v2, "setter":Lcom/trendmicro/hippo/MemberBox;
    :goto_1a
    new-instance v5, Lcom/trendmicro/hippo/BeanProperty;

    invoke-direct {v5, v10, v2, v12}, Lcom/trendmicro/hippo/BeanProperty;-><init>(Lcom/trendmicro/hippo/MemberBox;Lcom/trendmicro/hippo/MemberBox;Lcom/trendmicro/hippo/NativeJavaMethod;)V

    .line 628
    .local v5, "bp":Lcom/trendmicro/hippo/BeanProperty;
    invoke-interface {v9, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    .end local v2    # "setter":Lcom/trendmicro/hippo/MemberBox;
    .end local v3    # "beanPropertyName":Ljava/lang/String;
    .end local v5    # "bp":Lcom/trendmicro/hippo/BeanProperty;
    .end local v10    # "getter":Lcom/trendmicro/hippo/MemberBox;
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "setters":Lcom/trendmicro/hippo/NativeJavaMethod;
    .end local v13    # "memberIsGetMethod":Z
    .end local v14    # "setterName":Ljava/lang/String;
    .end local v15    # "memberIsSetMethod":Z
    .end local v18    # "ch0":C
    .end local v19    # "memberIsIsMethod":Z
    .end local v20    # "nameComponent":Ljava/lang/String;
    .end local v23    # "v":Ljava/lang/Object;
    :goto_1b
    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, v22

    move-object/from16 v10, v24

    const/4 v6, 0x2

    goto/16 :goto_13

    .line 633
    .end local v22    # "fields":[Ljava/lang/reflect/Field;
    .local v5, "fields":[Ljava/lang/reflect/Field;
    :cond_27
    move-object/from16 v22, v5

    const/4 v6, 0x1

    .end local v5    # "fields":[Ljava/lang/reflect/Field;
    .restart local v22    # "fields":[Ljava/lang/reflect/Field;
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 634
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v9, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 635
    .local v5, "value":Ljava/lang/Object;
    invoke-interface {v8, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    goto :goto_1c

    .line 540
    .end local v7    # "isStatic":Z
    .end local v8    # "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9    # "toAdd":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/BeanProperty;>;"
    :cond_28
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v5, v22

    goto/16 :goto_10

    .end local v22    # "fields":[Ljava/lang/reflect/Field;
    .local v5, "fields":[Ljava/lang/reflect/Field;
    :cond_29
    move-object/from16 v22, v5

    .line 640
    .end local v0    # "tableCursor":I
    .end local v5    # "fields":[Ljava/lang/reflect/Field;
    .restart local v22    # "fields":[Ljava/lang/reflect/Field;
    invoke-direct {v1, v4}, Lcom/trendmicro/hippo/JavaMembers;->getAccessibleConstructors(Z)[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 641
    .local v0, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v2, v0

    new-array v2, v2, [Lcom/trendmicro/hippo/MemberBox;

    .line 642
    .local v2, "ctorMembers":[Lcom/trendmicro/hippo/MemberBox;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    array-length v5, v0

    if-eq v3, v5, :cond_2a

    .line 643
    new-instance v5, Lcom/trendmicro/hippo/MemberBox;

    aget-object v6, v0, v3

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Constructor;)V

    aput-object v5, v2, v3

    .line 642
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 645
    .end local v3    # "i":I
    :cond_2a
    new-instance v3, Lcom/trendmicro/hippo/NativeJavaMethod;

    iget-object v5, v1, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v2, v5}, Lcom/trendmicro/hippo/NativeJavaMethod;-><init>([Lcom/trendmicro/hippo/MemberBox;Ljava/lang/String;)V

    iput-object v3, v1, Lcom/trendmicro/hippo/JavaMembers;->ctors:Lcom/trendmicro/hippo/NativeJavaMethod;

    .line 646
    return-void
.end method


# virtual methods
.method get(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 6
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "isStatic"    # Z

    .line 71
    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 72
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 73
    .local v1, "member":Ljava/lang/Object;
    if-nez p4, :cond_1

    if-nez v1, :cond_1

    .line 75
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 77
    :cond_1
    if-nez v1, :cond_2

    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/JavaMembers;->getExplicitFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v1

    .line 80
    if-nez v1, :cond_2

    .line 81
    sget-object v2, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v2

    .line 83
    :cond_2
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_3

    .line 84
    return-object v1

    .line 86
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 90
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    :try_start_0
    instance-of v3, v1, Lcom/trendmicro/hippo/BeanProperty;

    if-eqz v3, :cond_5

    .line 91
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/BeanProperty;

    .line 92
    .local v3, "bp":Lcom/trendmicro/hippo/BeanProperty;
    iget-object v4, v3, Lcom/trendmicro/hippo/BeanProperty;->getter:Lcom/trendmicro/hippo/MemberBox;

    if-nez v4, :cond_4

    .line 93
    sget-object v4, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v4

    .line 94
    :cond_4
    iget-object v4, v3, Lcom/trendmicro/hippo/BeanProperty;->getter:Lcom/trendmicro/hippo/MemberBox;

    sget-object v5, Lcom/trendmicro/hippo/Context;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {v4, p3, v5}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 95
    .local v4, "rval":Ljava/lang/Object;
    iget-object v5, v3, Lcom/trendmicro/hippo/BeanProperty;->getter:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    move-object v3, v5

    .line 96
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_2

    .line 97
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "rval":Ljava/lang/Object;
    :cond_5
    move-object v3, v1

    check-cast v3, Ljava/lang/reflect/Field;

    .line 98
    .local v3, "field":Ljava/lang/reflect/Field;
    if-eqz p4, :cond_6

    const/4 v4, 0x0

    goto :goto_1

    :cond_6
    move-object v4, p3

    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 99
    .restart local v4    # "rval":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v5

    .line 103
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    nop

    .line 105
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 106
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v5

    invoke-virtual {v5, v2, p1, v4, v3}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    return-object v5

    .line 101
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "rval":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 102
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v3}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4
.end method

.method getFieldAndMethodsObjects(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;
    .locals 8
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .param p3, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Object;",
            "Z)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/FieldAndMethods;",
            ">;"
        }
    .end annotation

    .line 786
    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticFieldAndMethods:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->fieldAndMethods:Ljava/util/Map;

    .line 787
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/FieldAndMethods;>;"
    :goto_0
    if-nez v0, :cond_1

    .line 788
    const/4 v1, 0x0

    return-object v1

    .line 789
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    .line 790
    .local v1, "len":I
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 791
    .local v2, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/FieldAndMethods;>;"
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/FieldAndMethods;

    .line 792
    .local v4, "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    new-instance v5, Lcom/trendmicro/hippo/FieldAndMethods;

    iget-object v6, v4, Lcom/trendmicro/hippo/FieldAndMethods;->methods:[Lcom/trendmicro/hippo/MemberBox;

    iget-object v7, v4, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-direct {v5, p1, v6, v7}, Lcom/trendmicro/hippo/FieldAndMethods;-><init>(Lcom/trendmicro/hippo/Scriptable;[Lcom/trendmicro/hippo/MemberBox;Ljava/lang/reflect/Field;)V

    .line 794
    .local v5, "famNew":Lcom/trendmicro/hippo/FieldAndMethods;
    iput-object p2, v5, Lcom/trendmicro/hippo/FieldAndMethods;->javaObject:Ljava/lang/Object;

    .line 795
    iget-object v6, v4, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    .end local v4    # "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    .end local v5    # "famNew":Lcom/trendmicro/hippo/FieldAndMethods;
    goto :goto_1

    .line 797
    :cond_2
    return-object v2
.end method

.method getIds(Z)[Ljava/lang/Object;
    .locals 3
    .param p1, "isStatic"    # Z

    .line 176
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 177
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method has(Ljava/lang/String;Z)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStatic"    # Z

    .line 60
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 61
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 62
    .local v1, "obj":Ljava/lang/Object;
    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 63
    return v2

    .line 65
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/JavaMembers;->findExplicitFunction(Ljava/lang/String;Z)Lcom/trendmicro/hippo/MemberBox;

    move-result-object v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    return v2
.end method

.method put(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V
    .locals 8
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;
    .param p5, "isStatic"    # Z

    .line 112
    if-eqz p5, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->members:Ljava/util/Map;

    .line 113
    .local v0, "ht":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 114
    .local v1, "member":Ljava/lang/Object;
    if-nez p5, :cond_1

    if-nez v1, :cond_1

    .line 116
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers;->staticMembers:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 118
    :cond_1
    if-eqz v1, :cond_a

    .line 120
    instance-of v2, v1, Lcom/trendmicro/hippo/FieldAndMethods;

    if-eqz v2, :cond_2

    .line 121
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/FieldAndMethods;

    .line 122
    .local v2, "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    iget-object v1, v2, Lcom/trendmicro/hippo/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    .line 126
    .end local v2    # "fam":Lcom/trendmicro/hippo/FieldAndMethods;
    :cond_2
    instance-of v2, v1, Lcom/trendmicro/hippo/BeanProperty;

    if-eqz v2, :cond_6

    .line 127
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/BeanProperty;

    .line 128
    .local v2, "bp":Lcom/trendmicro/hippo/BeanProperty;
    iget-object v3, v2, Lcom/trendmicro/hippo/BeanProperty;->setter:Lcom/trendmicro/hippo/MemberBox;

    if-eqz v3, :cond_5

    .line 134
    iget-object v3, v2, Lcom/trendmicro/hippo/BeanProperty;->setters:Lcom/trendmicro/hippo/NativeJavaMethod;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_4

    if-nez p4, :cond_3

    goto :goto_1

    .line 143
    :cond_3
    new-array v3, v4, [Ljava/lang/Object;

    aput-object p4, v3, v5

    .line 144
    .local v3, "args":[Ljava/lang/Object;
    iget-object v4, v2, Lcom/trendmicro/hippo/BeanProperty;->setters:Lcom/trendmicro/hippo/NativeJavaMethod;

    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v5

    .line 145
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 144
    invoke-virtual {v4, v5, v6, p1, v3}, Lcom/trendmicro/hippo/NativeJavaMethod;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 135
    .end local v3    # "args":[Ljava/lang/Object;
    :cond_4
    :goto_1
    iget-object v3, v2, Lcom/trendmicro/hippo/BeanProperty;->setter:Lcom/trendmicro/hippo/MemberBox;

    iget-object v3, v3, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    aget-object v3, v3, v5

    .line 136
    .local v3, "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p4, v3}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    .line 138
    .local v4, "args":[Ljava/lang/Object;
    :try_start_0
    iget-object v5, v2, Lcom/trendmicro/hippo/BeanProperty;->setter:Lcom/trendmicro/hippo/MemberBox;

    invoke-virtual {v5, p3, v4}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    nop

    .line 142
    .end local v3    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "args":[Ljava/lang/Object;
    nop

    .line 148
    .end local v2    # "bp":Lcom/trendmicro/hippo/BeanProperty;
    :goto_2
    goto :goto_4

    .line 139
    .restart local v2    # "bp":Lcom/trendmicro/hippo/BeanProperty;
    .restart local v3    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 140
    .local v5, "ex":Ljava/lang/Exception;
    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 129
    .end local v3    # "setType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "args":[Ljava/lang/Object;
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_5
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 150
    .end local v2    # "bp":Lcom/trendmicro/hippo/BeanProperty;
    :cond_6
    instance-of v2, v1, Ljava/lang/reflect/Field;

    if-nez v2, :cond_8

    .line 151
    if-nez v1, :cond_7

    const-string v2, "msg.java.internal.private"

    goto :goto_3

    .line 152
    :cond_7
    const-string v2, "msg.java.method.assign"

    :goto_3
    nop

    .line 153
    .local v2, "str":Ljava/lang/String;
    invoke-static {v2, p2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    throw v3

    .line 155
    .end local v2    # "str":Ljava/lang/String;
    :cond_8
    move-object v2, v1

    check-cast v2, Ljava/lang/reflect/Field;

    .line 156
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {p4, v3}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 158
    .local v3, "javaValue":Ljava/lang/Object;
    :try_start_1
    invoke-virtual {v2, p3, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 170
    nop

    .line 172
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "javaValue":Ljava/lang/Object;
    :goto_4
    return-void

    .line 165
    .restart local v2    # "field":Ljava/lang/reflect/Field;
    .restart local v3    # "javaValue":Ljava/lang/Object;
    :catch_1
    move-exception v4

    .line 166
    .local v4, "argEx":Ljava/lang/IllegalArgumentException;
    nop

    .line 168
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 169
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 166
    const-string v7, "msg.java.internal.field.type"

    invoke-static {v7, v5, v2, v6}, Lcom/trendmicro/hippo/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 159
    .end local v4    # "argEx":Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v4

    .line 160
    .local v4, "accessEx":Ljava/lang/IllegalAccessException;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    and-int/lit8 v5, v5, 0x10

    if-eqz v5, :cond_9

    .line 162
    return-void

    .line 164
    :cond_9
    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 119
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "javaValue":Ljava/lang/Object;
    .end local v4    # "accessEx":Ljava/lang/IllegalAccessException;
    :cond_a
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p1, "memberName"    # Ljava/lang/String;

    .line 858
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers;->cl:Ljava/lang/Class;

    .line 859
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 858
    const-string v1, "msg.java.member.not.found"

    invoke-static {v1, v0, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    return-object v0
.end method
