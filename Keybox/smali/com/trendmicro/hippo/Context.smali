.class public Lcom/trendmicro/hippo/Context;
.super Ljava/lang/Object;
.source "Context.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Context$ClassShutterSetter;
    }
.end annotation


# static fields
.field public static final FEATURE_DYNAMIC_SCOPE:I = 0x7

.field public static final FEATURE_E4X:I = 0x6

.field public static final FEATURE_ENHANCED_JAVA_ACCESS:I = 0xd

.field public static final FEATURE_ENUMERATE_IDS_FIRST:I = 0x10

.field public static final FEATURE_INTEGER_WITHOUT_DECIMAL_PLACE:I = 0x12

.field public static final FEATURE_LITTLE_ENDIAN:I = 0x13

.field public static final FEATURE_LOCATION_INFORMATION_IN_ERROR:I = 0xa

.field public static final FEATURE_MEMBER_EXPR_AS_FUNCTION_NAME:I = 0x2

.field public static final FEATURE_NON_ECMA_GET_YEAR:I = 0x1

.field public static final FEATURE_OLD_UNDEF_NULL_THIS:I = 0xf

.field public static final FEATURE_PARENT_PROTO_PROPERTIES:I = 0x5

.field public static final FEATURE_PARENT_PROTO_PROPRTIES:I = 0x5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FEATURE_RESERVED_KEYWORD_AS_IDENTIFIER:I = 0x3

.field public static final FEATURE_STRICT_EVAL:I = 0x9

.field public static final FEATURE_STRICT_MODE:I = 0xb

.field public static final FEATURE_STRICT_VARS:I = 0x8

.field public static final FEATURE_THREAD_SAFE_OBJECTS:I = 0x11

.field public static final FEATURE_TO_STRING_AS_SOURCE:I = 0x4

.field public static final FEATURE_V8_EXTENSIONS:I = 0xe

.field public static final FEATURE_WARNING_AS_ERROR:I = 0xc

.field public static final VERSION_1_0:I = 0x64

.field public static final VERSION_1_1:I = 0x6e

.field public static final VERSION_1_2:I = 0x78

.field public static final VERSION_1_3:I = 0x82

.field public static final VERSION_1_4:I = 0x8c

.field public static final VERSION_1_5:I = 0x96

.field public static final VERSION_1_6:I = 0xa0

.field public static final VERSION_1_7:I = 0xaa

.field public static final VERSION_1_8:I = 0xb4

.field public static final VERSION_DEFAULT:I = 0x0

.field public static final VERSION_ES6:I = 0xc8

.field public static final VERSION_UNKNOWN:I = -0x1

.field private static codegenClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final emptyArgs:[Ljava/lang/Object;

.field public static final errorReporterProperty:Ljava/lang/String; = "error reporter"

.field private static implementationVersion:Ljava/lang/String; = null

.field private static interpreterClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final languageVersionProperty:Ljava/lang/String; = "language version"


# instance fields
.field activationNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private applicationClassLoader:Ljava/lang/ClassLoader;

.field cachedXMLLib:Lcom/trendmicro/hippo/xml/XMLLib;

.field private classShutter:Lcom/trendmicro/hippo/ClassShutter;

.field currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

.field debugger:Lcom/trendmicro/hippo/debug/Debugger;

.field private debuggerData:Ljava/lang/Object;

.field private enterCount:I

.field private errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

.field private final factory:Lcom/trendmicro/hippo/ContextFactory;

.field public generateObserverCount:Z

.field private generatingDebug:Z

.field private generatingDebugChanged:Z

.field private generatingSource:Z

.field private hasClassShutter:Z

.field instructionCount:I

.field instructionThreshold:I

.field interpreterSecurityDomain:Ljava/lang/Object;

.field isContinuationsTopCall:Z

.field isTopLevelStrict:Z

.field iterating:Lcom/trendmicro/hippo/ObjToIntMap;

.field lastInterpreterFrame:Ljava/lang/Object;

.field private locale:Ljava/util/Locale;

.field private maximumInterpreterStackDepth:I

.field private optimizationLevel:I

.field previousInterpreterInvocations:Lcom/trendmicro/hippo/ObjArray;

.field private propertyListeners:Ljava/lang/Object;

.field regExpProxy:Lcom/trendmicro/hippo/RegExpProxy;

.field scratchIndex:I

.field scratchScriptable:Lcom/trendmicro/hippo/Scriptable;

.field scratchUint32:J

.field private sealKey:Ljava/lang/Object;

.field private sealed:Z

.field private securityController:Lcom/trendmicro/hippo/SecurityController;

.field private threadLocalMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field topCallScope:Lcom/trendmicro/hippo/Scriptable;

.field typeErrorThrower:Lcom/trendmicro/hippo/BaseFunction;

.field useDynamicScope:Z

.field version:I

.field private wrapFactory:Lcom/trendmicro/hippo/WrapFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 356
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    sput-object v0, Lcom/trendmicro/hippo/Context;->emptyArgs:[Ljava/lang/Object;

    .line 2608
    const-string v0, "com.trendmicro.hippo.optimizer.Codegen"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/Context;->codegenClass:Ljava/lang/Class;

    .line 2610
    const-string v0, "com.trendmicro.hippo.Interpreter"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/Context;->interpreterClass:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 374
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Context;-><init>(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 375
    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 2
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 387
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2764
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generatingSource:Z

    .line 2803
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generateObserverCount:Z

    .line 388
    if-eqz p1, :cond_1

    .line 391
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->factory:Lcom/trendmicro/hippo/ContextFactory;

    .line 392
    iput v0, p0, Lcom/trendmicro/hippo/Context;->version:I

    .line 393
    sget-object v1, Lcom/trendmicro/hippo/Context;->codegenClass:Ljava/lang/Class;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    iput v0, p0, Lcom/trendmicro/hippo/Context;->optimizationLevel:I

    .line 394
    const v0, 0x7fffffff

    iput v0, p0, Lcom/trendmicro/hippo/Context;->maximumInterpreterStackDepth:I

    .line 395
    return-void

    .line 389
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "factory == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/ClassShutter;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/Context;

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->classShutter:Lcom/trendmicro/hippo/ClassShutter;

    return-object v0
.end method

.method static synthetic access$002(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ClassShutter;)Lcom/trendmicro/hippo/ClassShutter;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/Context;
    .param p1, "x1"    # Lcom/trendmicro/hippo/ClassShutter;

    .line 61
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->classShutter:Lcom/trendmicro/hippo/ClassShutter;

    return-object p1
.end method

.method public static addContextListener(Lcom/trendmicro/hippo/ContextListener;)V
    .locals 7
    .param p0, "listener"    # Lcom/trendmicro/hippo/ContextListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 568
    const-string v0, "com.trendmicro.hippo.tools.debugger.Main"

    .line 569
    .local v0, "DBG":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 570
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 571
    .local v1, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "com.trendmicro.hippo.ContextFactory"

    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 573
    .local v2, "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    .line 574
    .local v4, "sig":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v6

    aput-object v6, v3, v5

    .line 576
    .local v3, "args":[Ljava/lang/Object;
    :try_start_0
    const-string v5, "attachTo"

    invoke-virtual {v1, v5, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 577
    .local v5, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v5, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 580
    nop

    .line 581
    .end local v5    # "m":Ljava/lang/reflect/Method;
    return-void

    .line 578
    :catch_0
    move-exception v5

    .line 579
    .local v5, "ex":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 584
    .end local v1    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "args":[Ljava/lang/Object;
    .end local v4    # "sig":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v5    # "ex":Ljava/lang/Exception;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/trendmicro/hippo/ContextFactory;->addListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V

    .line 585
    return-void
.end method

.method public static call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trendmicro/hippo/ContextAction<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 518
    .local p0, "action":Lcom/trendmicro/hippo/ContextAction;, "Lcom/trendmicro/hippo/ContextAction<TT;>;"
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/Context;->call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p1, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 540
    if-nez p0, :cond_0

    .line 541
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object p0

    .line 543
    :cond_0
    #disallowed odex opcode
    #iput-object-volatile v0, p3, Landroid/app/Notification$Action;->actionIntent:Landroid/app/PendingIntent;
    nop

    if-eq p3, p4, :cond_1

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/Context;->call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
    :cond_1
.end method

.method static call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;
    .locals 2
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trendmicro/hippo/ContextFactory;",
            "Lcom/trendmicro/hippo/ContextAction<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 550
    .local p1, "action":Lcom/trendmicro/hippo/ContextAction;, "Lcom/trendmicro/hippo/ContextAction<TT;>;"
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/trendmicro/hippo/Context;->enter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 552
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    :try_start_0
    invoke-interface {p1, v0}, Lcom/trendmicro/hippo/ContextAction;->run(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 555
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 552
    return-object v1

    .line 555
    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 556
    throw v1
.end method

.method public static checkLanguageVersion(I)V
    .locals 3
    .param p0, "version"    # I

    .line 716
    invoke-static {p0}, Lcom/trendmicro/hippo/Context;->isValidLanguageVersion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 717
    return-void

    .line 719
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad language version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkOptimizationLevel(I)V
    .locals 3
    .param p0, "optimizationLevel"    # I

    .line 2033
    invoke-static {p0}, Lcom/trendmicro/hippo/Context;->isValidOptimizationLevel(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2034
    return-void

    .line 2036
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Optimization level outside [-1..9]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private compileImpl(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;ZLcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;)Ljava/lang/Object;
    .locals 19
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sourceReader"    # Ljava/io/Reader;
    .param p3, "sourceString"    # Ljava/lang/String;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineno"    # I
    .param p6, "securityDomain"    # Ljava/lang/Object;
    .param p7, "returnFunction"    # Z
    .param p8, "compiler"    # Lcom/trendmicro/hippo/Evaluator;
    .param p9, "compilationErrorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2497
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p6

    move/from16 v12, p7

    if-nez p4, :cond_0

    .line 2498
    const-string v0, "unnamed script"

    move-object v13, v0

    .end local p4    # "sourceName":Ljava/lang/String;
    .local v0, "sourceName":Ljava/lang/String;
    goto :goto_0

    .line 2497
    .end local v0    # "sourceName":Ljava/lang/String;
    .restart local p4    # "sourceName":Ljava/lang/String;
    :cond_0
    move-object/from16 v13, p4

    .line 2500
    .end local p4    # "sourceName":Ljava/lang/String;
    .local v13, "sourceName":Ljava/lang/String;
    :goto_0
    if-eqz v11, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getSecurityController()Lcom/trendmicro/hippo/SecurityController;

    move-result-object v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 2501
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "securityDomain should be null if setSecurityController() was never called"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2506
    :cond_2
    :goto_1
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_3

    move v2, v0

    goto :goto_2

    :cond_3
    move v2, v1

    :goto_2
    if-nez p3, :cond_4

    move v3, v0

    goto :goto_3

    :cond_4
    move v3, v1

    :goto_3
    xor-int/2addr v2, v3

    if-nez v2, :cond_5

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2508
    :cond_5
    if-nez v10, :cond_6

    goto :goto_4

    :cond_6
    move v0, v1

    :goto_4
    xor-int/2addr v0, v12

    if-nez v0, :cond_7

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2510
    :cond_7
    new-instance v0, Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;-><init>()V

    move-object v14, v0

    .line 2511
    .local v14, "compilerEnv":Lcom/trendmicro/hippo/CompilerEnvirons;
    invoke-virtual {v14, v9}, Lcom/trendmicro/hippo/CompilerEnvirons;->initFromContext(Lcom/trendmicro/hippo/Context;)V

    .line 2512
    if-nez p9, :cond_8

    .line 2513
    invoke-virtual {v14}, Lcom/trendmicro/hippo/CompilerEnvirons;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    move-object v15, v0

    .end local p9    # "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .local v0, "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    goto :goto_5

    .line 2512
    .end local v0    # "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local p9    # "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    :cond_8
    move-object/from16 v15, p9

    .line 2516
    .end local p9    # "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .local v15, "compilationErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    :goto_5
    iget-object v0, v9, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    if-eqz v0, :cond_9

    .line 2517
    if-eqz p2, :cond_9

    .line 2518
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/Kit;->readReader(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    .line 2519
    .end local p3    # "sourceString":Ljava/lang/String;
    .local v0, "sourceString":Ljava/lang/String;
    const/4 v1, 0x0

    move-object v8, v0

    move-object/from16 v16, v1

    .end local p2    # "sourceReader":Ljava/io/Reader;
    .local v1, "sourceReader":Ljava/io/Reader;
    goto :goto_6

    .line 2523
    .end local v0    # "sourceString":Ljava/lang/String;
    .end local v1    # "sourceReader":Ljava/io/Reader;
    .restart local p2    # "sourceReader":Ljava/io/Reader;
    .restart local p3    # "sourceString":Ljava/lang/String;
    :cond_9
    move-object/from16 v16, p2

    move-object/from16 v8, p3

    .end local p2    # "sourceReader":Ljava/io/Reader;
    .end local p3    # "sourceString":Ljava/lang/String;
    .local v8, "sourceString":Ljava/lang/String;
    .local v16, "sourceReader":Ljava/io/Reader;
    :goto_6
    move-object/from16 v1, p0

    move-object/from16 v2, v16

    move-object v3, v8

    move-object v4, v13

    move/from16 v5, p5

    move-object v6, v14

    move-object v7, v15

    move-object/from16 p2, v8

    .end local v8    # "sourceString":Ljava/lang/String;
    .local p2, "sourceString":Ljava/lang/String;
    move/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/trendmicro/hippo/Context;->parse(Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;Z)Lcom/trendmicro/hippo/ast/ScriptNode;

    move-result-object v8

    .line 2528
    .local v8, "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    if-nez p8, :cond_a

    .line 2529
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->createCompiler()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v0
    :try_end_0
    .catch Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    .end local p8    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    .local v0, "compiler":Lcom/trendmicro/hippo/Evaluator;
    goto :goto_7

    .line 2533
    .end local v0    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    .restart local p8    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    :catch_0
    move-exception v0

    move-object/from16 v1, p8

    goto :goto_8

    .line 2528
    :cond_a
    move-object/from16 v1, p8

    .line 2532
    .end local p8    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    .local v1, "compiler":Lcom/trendmicro/hippo/Evaluator;
    :goto_7
    :try_start_1
    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSource()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v14, v8, v0, v12}, Lcom/trendmicro/hippo/Evaluator;->compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catch Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2541
    .local v0, "bytecode":Ljava/lang/Object;
    goto :goto_9

    .line 2533
    .end local v0    # "bytecode":Ljava/lang/Object;
    :catch_1
    move-exception v0

    .line 2535
    .local v0, "e":Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;
    :goto_8
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v7

    .line 2538
    .end local v1    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    .local v7, "compiler":Lcom/trendmicro/hippo/Evaluator;
    move-object/from16 v1, p0

    move-object/from16 v2, v16

    move-object/from16 v3, p2

    move-object v4, v13

    move/from16 v5, p5

    move-object v6, v14

    move-object/from16 p3, v0

    move-object v0, v7

    .end local v7    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    .local v0, "compiler":Lcom/trendmicro/hippo/Evaluator;
    .local p3, "e":Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;
    move-object v7, v15

    move-object/from16 v17, v8

    .end local v8    # "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    .local v17, "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    move/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/trendmicro/hippo/Context;->parse(Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;Z)Lcom/trendmicro/hippo/ast/ScriptNode;

    move-result-object v8

    .line 2540
    .end local v17    # "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    .restart local v8    # "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSource()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v14, v8, v1, v12}, Lcom/trendmicro/hippo/Evaluator;->compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    move-object v1, v0

    move-object/from16 v0, v18

    .line 2543
    .end local p3    # "e":Lcom/trendmicro/classfile/ClassFileWriter$ClassFileFormatException;
    .local v0, "bytecode":Ljava/lang/Object;
    .restart local v1    # "compiler":Lcom/trendmicro/hippo/Evaluator;
    :goto_9
    iget-object v2, v9, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    if-eqz v2, :cond_d

    .line 2544
    move-object/from16 v2, p2

    .end local p2    # "sourceString":Ljava/lang/String;
    .local v2, "sourceString":Ljava/lang/String;
    if-nez v2, :cond_b

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2545
    :cond_b
    instance-of v3, v0, Lcom/trendmicro/hippo/debug/DebuggableScript;

    if-eqz v3, :cond_c

    .line 2546
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/debug/DebuggableScript;

    .line 2547
    .local v3, "dscript":Lcom/trendmicro/hippo/debug/DebuggableScript;
    invoke-static {v9, v3, v2}, Lcom/trendmicro/hippo/Context;->notifyDebugger_r(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    .line 2548
    .end local v3    # "dscript":Lcom/trendmicro/hippo/debug/DebuggableScript;
    goto :goto_a

    .line 2549
    :cond_c
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "NOT SUPPORTED"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2543
    .end local v2    # "sourceString":Ljava/lang/String;
    .restart local p2    # "sourceString":Ljava/lang/String;
    :cond_d
    move-object/from16 v2, p2

    .line 2554
    .end local p2    # "sourceString":Ljava/lang/String;
    .restart local v2    # "sourceString":Ljava/lang/String;
    :goto_a
    if-eqz v12, :cond_e

    .line 2555
    invoke-interface {v1, v9, v10, v0, v11}, Lcom/trendmicro/hippo/Evaluator;->createFunctionObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Function;

    move-result-object v3

    .local v3, "result":Ljava/lang/Object;
    goto :goto_b

    .line 2557
    .end local v3    # "result":Ljava/lang/Object;
    :cond_e
    invoke-interface {v1, v0, v11}, Lcom/trendmicro/hippo/Evaluator;->createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v3

    .line 2560
    .restart local v3    # "result":Ljava/lang/Object;
    :goto_b
    return-object v3
.end method

.method private createCompiler()Lcom/trendmicro/hippo/Evaluator;
    .locals 2

    .line 2615
    const/4 v0, 0x0

    .line 2616
    .local v0, "result":Lcom/trendmicro/hippo/Evaluator;
    iget v1, p0, Lcom/trendmicro/hippo/Context;->optimizationLevel:I

    if-ltz v1, :cond_0

    sget-object v1, Lcom/trendmicro/hippo/Context;->codegenClass:Ljava/lang/Class;

    if-eqz v1, :cond_0

    .line 2617
    invoke-static {v1}, Lcom/trendmicro/hippo/Kit;->newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/trendmicro/hippo/Evaluator;

    .line 2619
    :cond_0
    if-nez v0, :cond_1

    .line 2620
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v0

    .line 2622
    :cond_1
    return-object v0
.end method

.method static createInterpreter()Lcom/trendmicro/hippo/Evaluator;
    .locals 1

    .line 2627
    sget-object v0, Lcom/trendmicro/hippo/Context;->interpreterClass:Ljava/lang/Class;

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Evaluator;

    return-object v0
.end method

.method public static enter()Lcom/trendmicro/hippo/Context;
    .locals 1

    .line 425
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->enter(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    return-object v0
.end method

.method public static enter(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Context;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 446
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/Context;->enter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    return-object v0
.end method

.method static final enter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/Context;
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 451
    sget-object v0, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/VMBridge;->getThreadContextHelper()Ljava/lang/Object;

    move-result-object v0

    .line 452
    .local v0, "helper":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/VMBridge;->getContext(Ljava/lang/Object;)Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 453
    .local v1, "old":Lcom/trendmicro/hippo/Context;
    if-eqz v1, :cond_0

    .line 454
    move-object p0, v1

    goto :goto_1

    .line 456
    :cond_0
    if-nez p0, :cond_2

    .line 457
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ContextFactory;->makeContext()Lcom/trendmicro/hippo/Context;

    move-result-object p0

    .line 458
    iget v2, p0, Lcom/trendmicro/hippo/Context;->enterCount:I

    if-nez v2, :cond_1

    .line 461
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ContextFactory;->onContextCreated(Lcom/trendmicro/hippo/Context;)V

    .line 462
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ContextFactory;->isSealed()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->isSealed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 463
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Context;->seal(Ljava/lang/Object;)V

    goto :goto_0

    .line 459
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "factory.makeContext() returned Context instance already associated with some thread"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 466
    :cond_2
    iget v2, p0, Lcom/trendmicro/hippo/Context;->enterCount:I

    if-nez v2, :cond_4

    .line 470
    :cond_3
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v2, v0, p0}, Lcom/trendmicro/hippo/VMBridge;->setContext(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)V

    .line 472
    :goto_1
    iget v2, p0, Lcom/trendmicro/hippo/Context;->enterCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/Context;->enterCount:I

    .line 473
    return-object p0

    .line 467
    :cond_4
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "can not use Context instance already associated with some thread"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static exit()V
    .locals 4

    .line 489
    sget-object v0, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/VMBridge;->getThreadContextHelper()Ljava/lang/Object;

    move-result-object v0

    .line 490
    .local v0, "helper":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/VMBridge;->getContext(Ljava/lang/Object;)Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 491
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v1, :cond_2

    .line 495
    iget v2, v1, Lcom/trendmicro/hippo/Context;->enterCount:I

    const/4 v3, 0x1

    if-ge v2, v3, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 496
    :cond_0
    iget v2, v1, Lcom/trendmicro/hippo/Context;->enterCount:I

    sub-int/2addr v2, v3

    iput v2, v1, Lcom/trendmicro/hippo/Context;->enterCount:I

    if-nez v2, :cond_1

    .line 497
    sget-object v2, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Lcom/trendmicro/hippo/VMBridge;->setContext(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)V

    .line 498
    iget-object v2, v1, Lcom/trendmicro/hippo/Context;->factory:Lcom/trendmicro/hippo/ContextFactory;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ContextFactory;->onContextReleased(Lcom/trendmicro/hippo/Context;)V

    .line 500
    :cond_1
    return-void

    .line 492
    :cond_2
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Calling Context.exit without previous Context.enter"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private firePropertyChangeImpl(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p1, "listeners"    # Ljava/lang/Object;
    .param p2, "property"    # Ljava/lang/String;
    .param p3, "oldValue"    # Ljava/lang/Object;
    .param p4, "newValue"    # Ljava/lang/Object;

    .line 887
    const/4 v0, 0x0

    .line 888
    .local v0, "i":I
    :goto_0
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/Kit;->getListener(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 889
    .local v1, "l":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 890
    nop

    .line 897
    .end local v0    # "i":I
    .end local v1    # "l":Ljava/lang/Object;
    return-void

    .line 891
    .restart local v0    # "i":I
    .restart local v1    # "l":Ljava/lang/Object;
    :cond_0
    instance-of v2, v1, Ljava/beans/PropertyChangeListener;

    if-eqz v2, :cond_1

    .line 892
    move-object v2, v1

    check-cast v2, Ljava/beans/PropertyChangeListener;

    .line 893
    .local v2, "pcl":Ljava/beans/PropertyChangeListener;
    new-instance v3, Ljava/beans/PropertyChangeEvent;

    invoke-direct {v3, p0, p2, p3, p4}, Ljava/beans/PropertyChangeEvent;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/beans/PropertyChangeListener;->propertyChange(Ljava/beans/PropertyChangeEvent;)V

    .line 887
    .end local v1    # "l":Ljava/lang/Object;
    .end local v2    # "pcl":Ljava/beans/PropertyChangeListener;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static getContext()Lcom/trendmicro/hippo/Context;
    .locals 3

    .line 2481
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 2482
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 2486
    return-object v0

    .line 2483
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "No Context associated with current Thread"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getCurrentContext()Lcom/trendmicro/hippo/Context;
    .locals 2

    .line 411
    sget-object v0, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/VMBridge;->getThreadContextHelper()Ljava/lang/Object;

    move-result-object v0

    .line 412
    .local v0, "helper":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/VMBridge;->instance:Lcom/trendmicro/hippo/VMBridge;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/VMBridge;->getContext(Ljava/lang/Object;)Lcom/trendmicro/hippo/Context;

    move-result-object v1

    return-object v1
.end method

.method public static getDebuggableView(Lcom/trendmicro/hippo/Script;)Lcom/trendmicro/hippo/debug/DebuggableScript;
    .locals 1
    .param p0, "script"    # Lcom/trendmicro/hippo/Script;

    .line 2286
    instance-of v0, p0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v0, :cond_0

    .line 2287
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/NativeFunction;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeFunction;->getDebuggableView()Lcom/trendmicro/hippo/debug/DebuggableScript;

    move-result-object v0

    return-object v0

    .line 2289
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method static getSourcePositionFromStack([I)Ljava/lang/String;
    .locals 9
    .param p0, "linep"    # [I

    .line 2632
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 2633
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2634
    return-object v1

    .line 2635
    :cond_0
    iget-object v2, v0, Lcom/trendmicro/hippo/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v2, :cond_1

    .line 2636
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v2

    .line 2637
    .local v2, "evaluator":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v2, :cond_1

    .line 2638
    invoke-interface {v2, v0, p0}, Lcom/trendmicro/hippo/Evaluator;->getSourcePositionFromStack(Lcom/trendmicro/hippo/Context;[I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 2644
    .end local v2    # "evaluator":Lcom/trendmicro/hippo/Evaluator;
    :cond_1
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 2645
    .local v2, "stackTrace":[Ljava/lang/StackTraceElement;
    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_3

    aget-object v6, v2, v5

    .line 2646
    .local v6, "st":Ljava/lang/StackTraceElement;
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v7

    .line 2647
    .local v7, "file":Ljava/lang/String;
    if-eqz v7, :cond_2

    const-string v8, ".java"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 2648
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v8

    .line 2649
    .local v8, "line":I
    if-ltz v8, :cond_2

    .line 2650
    aput v8, p0, v4

    .line 2651
    return-object v7

    .line 2645
    .end local v6    # "st":Ljava/lang/StackTraceElement;
    .end local v7    # "file":Ljava/lang/String;
    .end local v8    # "line":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 2656
    :cond_3
    return-object v1
.end method

.method public static getUndefinedValue()Ljava/lang/Object;
    .locals 1

    .line 1239
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public static isValidLanguageVersion(I)Z
    .locals 1
    .param p0, "version"    # I

    .line 697
    sparse-switch p0, :sswitch_data_0

    .line 711
    const/4 v0, 0x0

    return v0

    .line 709
    :sswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x64 -> :sswitch_0
        0x6e -> :sswitch_0
        0x78 -> :sswitch_0
        0x82 -> :sswitch_0
        0x8c -> :sswitch_0
        0x96 -> :sswitch_0
        0xa0 -> :sswitch_0
        0xaa -> :sswitch_0
        0xb4 -> :sswitch_0
        0xc8 -> :sswitch_0
    .end sparse-switch
.end method

.method public static isValidOptimizationLevel(I)Z
    .locals 1
    .param p0, "optimizationLevel"    # I

    .line 2028
    const/4 v0, -0x1

    if-gt v0, p0, :cond_0

    const/16 v0, 0x9

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1849
    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Number;

    if-nez v0, :cond_2

    instance-of v0, p0, Ljava/lang/Boolean;

    if-nez v0, :cond_2

    instance-of v0, p0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1853
    :cond_0
    instance-of v0, p0, Ljava/lang/Character;

    if-eqz v0, :cond_1

    .line 1854
    move-object v0, p0

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1856
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 1857
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p1, p0, v2}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1852
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_2
    :goto_0
    return-object p0
.end method

.method public static jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/EvaluatorException;
        }
    .end annotation

    .line 1875
    .local p1, "desiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/NativeJavaObject;->coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static synthetic lambda$call$0(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p0, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 543
    invoke-interface {p0, p4, p1, p2, p3}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static notifyDebugger_r(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "dscript"    # Lcom/trendmicro/hippo/debug/DebuggableScript;
    .param p2, "debugSource"    # Ljava/lang/String;

    .line 2602
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    invoke-interface {v0, p0, p1, p2}, Lcom/trendmicro/hippo/debug/Debugger;->handleCompilationDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    .line 2603
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getFunctionCount()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 2604
    invoke-interface {p1, v0}, Lcom/trendmicro/hippo/debug/DebuggableScript;->getFunction(I)Lcom/trendmicro/hippo/debug/DebuggableScript;

    move-result-object v1

    invoke-static {p0, v1, p2}, Lcom/trendmicro/hippo/Context;->notifyDebugger_r(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/debug/DebuggableScript;Ljava/lang/String;)V

    .line 2603
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2606
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method static onSealedMutation()V
    .locals 1

    .line 656
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method private parse(Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;Z)Lcom/trendmicro/hippo/ast/ScriptNode;
    .locals 5
    .param p1, "sourceReader"    # Ljava/io/Reader;
    .param p2, "sourceString"    # Ljava/lang/String;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "lineno"    # I
    .param p5, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p6, "compilationErrorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;
    .param p7, "returnFunction"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2567
    new-instance v0, Lcom/trendmicro/hippo/Parser;

    invoke-direct {v0, p5, p6}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 2568
    .local v0, "p":Lcom/trendmicro/hippo/Parser;
    const/4 v1, 0x1

    if-eqz p7, :cond_0

    .line 2569
    iput-boolean v1, v0, Lcom/trendmicro/hippo/Parser;->calledByCompileFunction:Z

    .line 2571
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2572
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Parser;->setDefaultUseStrictDirective(Z)V

    .line 2576
    :cond_1
    if-eqz p2, :cond_2

    .line 2577
    invoke-virtual {v0, p2, p3, p4}, Lcom/trendmicro/hippo/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v1

    .local v1, "ast":Lcom/trendmicro/hippo/ast/AstRoot;
    goto :goto_0

    .line 2579
    .end local v1    # "ast":Lcom/trendmicro/hippo/ast/AstRoot;
    :cond_2
    invoke-virtual {v0, p1, p3, p4}, Lcom/trendmicro/hippo/Parser;->parse(Ljava/io/Reader;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v1

    .line 2581
    .restart local v1    # "ast":Lcom/trendmicro/hippo/ast/AstRoot;
    :goto_0
    if-eqz p7, :cond_4

    .line 2583
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstRoot;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 2584
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstRoot;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x6e

    if-ne v2, v3, :cond_3

    goto :goto_1

    .line 2589
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "compileFunction only accepts source with single JS function: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2594
    :cond_4
    :goto_1
    new-instance v2, Lcom/trendmicro/hippo/IRFactory;

    invoke-direct {v2, p5, p6}, Lcom/trendmicro/hippo/IRFactory;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 2595
    .local v2, "irf":Lcom/trendmicro/hippo/IRFactory;
    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IRFactory;->transformTree(Lcom/trendmicro/hippo/ast/AstRoot;)Lcom/trendmicro/hippo/ast/ScriptNode;

    move-result-object v3

    .line 2596
    .local v3, "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    return-object v3
.end method

.method public static removeContextListener(Lcom/trendmicro/hippo/ContextListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/trendmicro/hippo/ContextListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 595
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ContextFactory;->addListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V

    .line 596
    return-void
.end method

.method public static reportError(Ljava/lang/String;)V
    .locals 5
    .param p0, "message"    # Ljava/lang/String;

    .line 978
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 979
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 980
    .local v2, "filename":Ljava/lang/String;
    aget v3, v0, v1

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4, v1}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 981
    return-void
.end method

.method public static reportError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 8
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "sourceName"    # Ljava/lang/String;
    .param p2, "lineno"    # I
    .param p3, "lineSource"    # Ljava/lang/String;
    .param p4, "lineOffset"    # I

    .line 960
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 961
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 962
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v1

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 968
    return-void

    .line 965
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/EvaluatorException;

    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    throw v1
.end method

.method public static reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 5
    .param p0, "message"    # Ljava/lang/String;

    .line 1055
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 1056
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 1057
    .local v2, "filename":Ljava/lang/String;
    aget v3, v0, v1

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method public static reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 8
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "sourceName"    # Ljava/lang/String;
    .param p2, "lineno"    # I
    .param p3, "lineSource"    # Ljava/lang/String;
    .param p4, "lineOffset"    # I

    .line 1001
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 1002
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_0

    .line 1003
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v1

    .line 1004
    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    invoke-interface/range {v1 .. v6}, Lcom/trendmicro/hippo/ErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    .line 1003
    return-object v1

    .line 1007
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/EvaluatorException;

    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    throw v1
.end method

.method static reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;

    .line 1012
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1013
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;

    .line 1019
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1020
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .line 1026
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1027
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;

    .line 1034
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1035
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;
    .param p3, "arg3"    # Ljava/lang/Object;
    .param p4, "arg4"    # Ljava/lang/Object;

    .line 1042
    nop

    .line 1043
    invoke-static {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1044
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method public static reportWarning(Ljava/lang/String;)V
    .locals 5
    .param p0, "message"    # Ljava/lang/String;

    .line 929
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 930
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 931
    .local v2, "filename":Ljava/lang/String;
    aget v3, v0, v1

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4, v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 932
    return-void
.end method

.method public static reportWarning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 8
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "sourceName"    # Ljava/lang/String;
    .param p2, "lineno"    # I
    .param p3, "lineSource"    # Ljava/lang/String;
    .param p4, "lineOffset"    # I

    .line 913
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 914
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 915
    invoke-static {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_0

    .line 917
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v2

    move-object v3, p0

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    move v7, p4

    invoke-interface/range {v2 .. v7}, Lcom/trendmicro/hippo/ErrorReporter;->warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 919
    :goto_0
    return-void
.end method

.method public static reportWarning(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 8
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 936
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    .line 937
    .local v0, "linep":[I
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v2

    .line 938
    .local v2, "filename":Ljava/lang/String;
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 939
    .local v3, "sw":Ljava/io/Writer;
    new-instance v4, Ljava/io/PrintWriter;

    invoke-direct {v4, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 940
    .local v4, "pw":Ljava/io/PrintWriter;
    invoke-virtual {v4, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 941
    invoke-virtual {p1, v4}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 942
    invoke-virtual {v4}, Ljava/io/PrintWriter;->flush()V

    .line 943
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    aget v6, v0, v1

    const/4 v7, 0x0

    invoke-static {v5, v2, v6, v7, v1}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 944
    return-void
.end method

.method public static setCachingEnabled(Z)V
    .locals 0
    .param p0, "cachingEnabled"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2217
    return-void
.end method

.method public static throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "e"    # Ljava/lang/Throwable;

    .line 1915
    :goto_0
    instance-of v0, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v0, :cond_0

    .line 1916
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    .line 1919
    :cond_0
    instance-of v0, p0, Ljava/lang/Error;

    if-eqz v0, :cond_2

    .line 1920
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 1921
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v0, :cond_1

    const/16 v1, 0xd

    .line 1922
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 1924
    :cond_1
    move-object v1, p0

    check-cast v1, Ljava/lang/Error;

    throw v1

    .line 1927
    .end local v0    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_2
    :goto_1
    instance-of v0, p0, Lcom/trendmicro/hippo/HippoException;

    if-eqz v0, :cond_3

    .line 1928
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/HippoException;

    throw v0

    .line 1930
    :cond_3
    new-instance v0, Lcom/trendmicro/hippo/WrappedException;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/WrappedException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 1753
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static toNumber(Ljava/lang/Object;)D
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .line 1769
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1805
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/trendmicro/hippo/Scriptable;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1816
    .local p2, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Ljava/lang/Object;

    .line 1783
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toType(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1890
    .local p1, "desiredType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Lcom/trendmicro/hippo/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1891
    :catch_0
    move-exception v0

    .line 1892
    .local v0, "ex":Lcom/trendmicro/hippo/EvaluatorException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public addActivationName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 2699
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2700
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    if-nez v0, :cond_1

    .line 2701
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    .line 2702
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 2703
    return-void
.end method

.method public final addPropertyChangeListener(Ljava/beans/PropertyChangeListener;)V
    .locals 1
    .param p1, "l"    # Ljava/beans/PropertyChangeListener;

    .line 848
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 849
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/Kit;->addListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    .line 850
    return-void
.end method

.method public callFunctionWithContinuations(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "function"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/ContinuationPending;
        }
    .end annotation

    .line 1345
    instance-of v0, p1, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v0, :cond_1

    .line 1350
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->hasTopCall(Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1356
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->isContinuationsTopCall:Z

    .line 1357
    iget-boolean v6, p0, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v1 .. v6}, Lcom/trendmicro/hippo/ScriptRuntime;->doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 1351
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot have any pending top calls when executing a script with continuations"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1347
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Function argument was not created by interpreted mode "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public captureContinuation()Lcom/trendmicro/hippo/ContinuationPending;
    .locals 2

    .line 1374
    new-instance v0, Lcom/trendmicro/hippo/ContinuationPending;

    .line 1375
    invoke-static {p0}, Lcom/trendmicro/hippo/Interpreter;->captureContinuation(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/NativeContinuation;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ContinuationPending;-><init>(Lcom/trendmicro/hippo/NativeContinuation;)V

    .line 1374
    return-object v0
.end method

.method final compileFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Function;
    .locals 11
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "compiler"    # Lcom/trendmicro/hippo/Evaluator;
    .param p4, "compilationErrorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;
    .param p5, "sourceName"    # Ljava/lang/String;
    .param p6, "lineno"    # I
    .param p7, "securityDomain"    # Ljava/lang/Object;

    .line 1558
    const/4 v3, 0x0

    const/4 v8, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object v9, p3

    move-object v10, p4

    :try_start_0
    invoke-direct/range {v1 .. v10}, Lcom/trendmicro/hippo/Context;->compileImpl(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;ZLcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Function;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1562
    :catch_0
    move-exception v0

    .line 1565
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final compileFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Function;
    .locals 8
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "lineno"    # I
    .param p5, "securityDomain"    # Ljava/lang/Object;

    .line 1547
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/trendmicro/hippo/Context;->compileFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    return-object v0
.end method

.method public final compileReader(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "in"    # Ljava/io/Reader;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "lineno"    # I
    .param p5, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1450
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/trendmicro/hippo/Context;->compileReader(Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    return-object v0
.end method

.method public final compileReader(Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 10
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .param p4, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1474
    if-gez p3, :cond_0

    .line 1476
    const/4 p3, 0x0

    .line 1478
    :cond_0
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v9}, Lcom/trendmicro/hippo/Context;->compileImpl(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;ZLcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Script;

    return-object v0
.end method

.method final compileString(Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 11
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "compiler"    # Lcom/trendmicro/hippo/Evaluator;
    .param p3, "compilationErrorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineno"    # I
    .param p6, "securityDomain"    # Ljava/lang/Object;

    .line 1517
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    move-object v9, p2

    move-object v10, p3

    :try_start_0
    invoke-direct/range {v1 .. v10}, Lcom/trendmicro/hippo/Context;->compileImpl(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;ZLcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Script;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1520
    :catch_0
    move-exception v0

    .line 1522
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 7
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .param p4, "securityDomain"    # Ljava/lang/Object;

    .line 1502
    if-gez p3, :cond_0

    .line 1504
    const/4 p3, 0x0

    .line 1506
    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    return-object v0
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;)Lcom/trendmicro/hippo/GeneratedClassLoader;
    .locals 2
    .param p1, "parent"    # Ljava/lang/ClassLoader;

    .line 2422
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    .line 2423
    .local v0, "f":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ContextFactory;->createClassLoader(Ljava/lang/ClassLoader;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v1

    return-object v1
.end method

.method public final decompileFunction(Lcom/trendmicro/hippo/Function;I)Ljava/lang/String;
    .locals 2
    .param p1, "fun"    # Lcom/trendmicro/hippo/Function;
    .param p2, "indent"    # I

    .line 1599
    instance-of v0, p1, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v0, :cond_0

    .line 1600
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1602
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "function "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lcom/trendmicro/hippo/Function;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "() {\n\t[native code]\n}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final decompileFunctionBody(Lcom/trendmicro/hippo/Function;I)Ljava/lang/String;
    .locals 2
    .param p1, "fun"    # Lcom/trendmicro/hippo/Function;
    .param p2, "indent"    # I

    .line 1620
    instance-of v0, p1, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v0, :cond_0

    .line 1621
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    .line 1622
    .local v0, "bf":Lcom/trendmicro/hippo/BaseFunction;
    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1625
    .end local v0    # "bf":Lcom/trendmicro/hippo/BaseFunction;
    :cond_0
    const-string v0, "[native code]\n"

    return-object v0
.end method

.method public final decompileScript(Lcom/trendmicro/hippo/Script;I)Ljava/lang/String;
    .locals 2
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;
    .param p2, "indent"    # I

    .line 1580
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/NativeFunction;

    .line 1581
    .local v0, "scriptImpl":Lcom/trendmicro/hippo/NativeFunction;
    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/trendmicro/hippo/NativeFunction;->decompile(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final evaluateReader(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "in"    # Ljava/io/Reader;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "lineno"    # I
    .param p5, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1293
    invoke-virtual/range {p0 .. p5}, Lcom/trendmicro/hippo/Context;->compileReader(Lcom/trendmicro/hippo/Scriptable;Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    .line 1295
    .local v0, "script":Lcom/trendmicro/hippo/Script;
    if-eqz v0, :cond_0

    .line 1296
    invoke-interface {v0, p0, p1}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1298
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public final evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "sourceName"    # Ljava/lang/String;
    .param p4, "lineno"    # I
    .param p5, "securityDomain"    # Ljava/lang/Object;

    .line 1263
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    .line 1265
    .local v0, "script":Lcom/trendmicro/hippo/Script;
    if-eqz v0, :cond_0

    .line 1266
    invoke-interface {v0, p0, p1}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 1268
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public executeScriptWithContinuations(Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/ContinuationPending;
        }
    .end annotation

    .line 1317
    instance-of v0, p1, Lcom/trendmicro/hippo/InterpretedFunction;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/InterpretedFunction;

    .line 1318
    invoke-virtual {v0}, Lcom/trendmicro/hippo/InterpretedFunction;->isScript()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1324
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/InterpretedFunction;

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {p0, v0, p2, v1}, Lcom/trendmicro/hippo/Context;->callFunctionWithContinuations(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 1321
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Script argument was not a script or was not created by interpreted mode "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final firePropertyChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "oldValue"    # Ljava/lang/Object;
    .param p3, "newValue"    # Ljava/lang/Object;

    .line 878
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    .line 879
    .local v0, "listeners":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 880
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/trendmicro/hippo/Context;->firePropertyChangeImpl(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 882
    :cond_0
    return-void
.end method

.method public final getApplicationClassLoader()Ljava/lang/ClassLoader;
    .locals 5

    .line 2428
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->applicationClassLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_3

    .line 2429
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    .line 2430
    .local v0, "f":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ContextFactory;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 2431
    .local v1, "loader":Ljava/lang/ClassLoader;
    if-nez v1, :cond_2

    .line 2433
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 2434
    .local v2, "threadLoader":Ljava/lang/ClassLoader;
    if-eqz v2, :cond_0

    .line 2435
    invoke-static {v2}, Lcom/trendmicro/hippo/Kit;->testIfCanLoadHippoClasses(Ljava/lang/ClassLoader;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2441
    return-object v2

    .line 2446
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 2447
    .local v3, "fClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    if-eq v3, v4, :cond_1

    .line 2448
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    goto :goto_0

    .line 2450
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 2453
    .end local v2    # "threadLoader":Ljava/lang/ClassLoader;
    .end local v3    # "fClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/trendmicro/hippo/Context;->applicationClassLoader:Ljava/lang/ClassLoader;

    .line 2455
    .end local v0    # "f":Lcom/trendmicro/hippo/ContextFactory;
    .end local v1    # "loader":Ljava/lang/ClassLoader;
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->applicationClassLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method final declared-synchronized getClassShutter()Lcom/trendmicro/hippo/ClassShutter;
    .locals 1

    monitor-enter p0

    .line 2134
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->classShutter:Lcom/trendmicro/hippo/ClassShutter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 2134
    .end local p0    # "this":Lcom/trendmicro/hippo/Context;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getClassShutterSetter()Lcom/trendmicro/hippo/Context$ClassShutterSetter;
    .locals 1

    monitor-enter p0

    .line 2143
    :try_start_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->hasClassShutter:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 2144
    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    .line 2145
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->hasClassShutter:Z

    .line 2146
    new-instance v0, Lcom/trendmicro/hippo/Context$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/Context$1;-><init>(Lcom/trendmicro/hippo/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    .line 2142
    .end local p0    # "this":Lcom/trendmicro/hippo/Context;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getDebugger()Lcom/trendmicro/hippo/debug/Debugger;
    .locals 1

    .line 2253
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    return-object v0
.end method

.method public final getDebuggerContextData()Ljava/lang/Object;
    .locals 1

    .line 2262
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->debuggerData:Ljava/lang/Object;

    return-object v0
.end method

.method public getE4xImplementationFactory()Lcom/trendmicro/hippo/xml/XMLLib$Factory;
    .locals 1

    .line 2336
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ContextFactory;->getE4xImplementationFactory()Lcom/trendmicro/hippo/xml/XMLLib$Factory;

    move-result-object v0

    return-object v0
.end method

.method public final getElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;
    .locals 1
    .param p1, "object"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1739
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getArrayElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;
    .locals 1

    .line 783
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    if-nez v0, :cond_0

    .line 784
    sget-object v0, Lcom/trendmicro/hippo/DefaultErrorReporter;->instance:Lcom/trendmicro/hippo/DefaultErrorReporter;

    return-object v0

    .line 786
    :cond_0
    return-object v0
.end method

.method public final getFactory()Lcom/trendmicro/hippo/ContextFactory;
    .locals 1

    .line 603
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->factory:Lcom/trendmicro/hippo/ContextFactory;

    return-object v0
.end method

.method public final getImplementationVersion()Ljava/lang/String;
    .locals 9

    .line 740
    const-string v0, " "

    sget-object v1, Lcom/trendmicro/hippo/Context;->implementationVersion:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 743
    :try_start_0
    const-class v1, Lcom/trendmicro/hippo/Context;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "META-INF/MANIFEST.MF"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 746
    .local v1, "urls":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    nop

    .line 749
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 750
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 751
    .local v2, "metaUrl":Ljava/net/URL;
    const/4 v3, 0x0

    .line 753
    .local v3, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v4

    move-object v3, v4

    .line 754
    new-instance v4, Ljava/util/jar/Manifest;

    invoke-direct {v4, v3}, Ljava/util/jar/Manifest;-><init>(Ljava/io/InputStream;)V

    .line 755
    .local v4, "mf":Ljava/util/jar/Manifest;
    invoke-virtual {v4}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v5

    .line 756
    .local v5, "attrs":Ljava/util/jar/Attributes;
    const-string v6, "Hippo"

    const-string v7, "Implementation-Title"

    invoke-virtual {v5, v7}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 757
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Hippo "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "Implementation-Version"

    .line 758
    invoke-virtual {v5, v7}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "Built-Date"

    invoke-virtual {v5, v7}, Ljava/util/jar/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "-"

    invoke-virtual {v7, v8, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sput-object v6, Lcom/trendmicro/hippo/Context;->implementationVersion:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 759
    nop

    .line 765
    if-eqz v3, :cond_0

    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 766
    :catch_0
    move-exception v0

    goto :goto_2

    .line 768
    :cond_0
    :goto_1
    nop

    .line 759
    :goto_2
    return-object v6

    .line 765
    .end local v4    # "mf":Ljava/util/jar/Manifest;
    .end local v5    # "attrs":Ljava/util/jar/Attributes;
    :cond_1
    if-eqz v3, :cond_3

    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_5

    .line 764
    :catchall_0
    move-exception v0

    .line 765
    if-eqz v3, :cond_2

    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_3

    .line 766
    :catch_1
    move-exception v4

    goto :goto_4

    .line 768
    :cond_2
    :goto_3
    nop

    .line 769
    :goto_4
    throw v0

    .line 761
    :catch_2
    move-exception v4

    .line 765
    if-eqz v3, :cond_3

    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    .line 766
    :catch_3
    move-exception v4

    .line 769
    goto :goto_6

    .line 768
    :cond_3
    :goto_5
    nop

    .line 770
    .end local v2    # "metaUrl":Ljava/net/URL;
    .end local v3    # "is":Ljava/io/InputStream;
    :goto_6
    goto :goto_0

    .line 744
    .end local v1    # "urls":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    :catch_4
    move-exception v0

    .line 745
    .local v0, "ioe":Ljava/io/IOException;
    const/4 v1, 0x0

    return-object v1

    .line 773
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_4
    sget-object v0, Lcom/trendmicro/hippo/Context;->implementationVersion:Ljava/lang/String;

    return-object v0
.end method

.method public final getInstructionObserverThreshold()I
    .locals 1

    .line 2349
    iget v0, p0, Lcom/trendmicro/hippo/Context;->instructionThreshold:I

    return v0
.end method

.method public final getLanguageVersion()I
    .locals 1

    .line 669
    iget v0, p0, Lcom/trendmicro/hippo/Context;->version:I

    return v0
.end method

.method public final getLocale()Ljava/util/Locale;
    .locals 1

    .line 821
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->locale:Ljava/util/Locale;

    if-nez v0, :cond_0

    .line 822
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->locale:Ljava/util/Locale;

    .line 823
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public final getMaximumInterpreterStackDepth()I
    .locals 1

    .line 2056
    iget v0, p0, Lcom/trendmicro/hippo/Context;->maximumInterpreterStackDepth:I

    return v0
.end method

.method public final getOptimizationLevel()I
    .locals 1

    .line 1993
    iget v0, p0, Lcom/trendmicro/hippo/Context;->optimizationLevel:I

    return v0
.end method

.method getRegExpProxy()Lcom/trendmicro/hippo/RegExpProxy;
    .locals 2

    .line 2661
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->regExpProxy:Lcom/trendmicro/hippo/RegExpProxy;

    if-nez v0, :cond_0

    .line 2662
    const-string v0, "com.trendmicro.hippo.regexp.RegExpImpl"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2664
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_0

    .line 2665
    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/RegExpProxy;

    iput-object v1, p0, Lcom/trendmicro/hippo/Context;->regExpProxy:Lcom/trendmicro/hippo/RegExpProxy;

    .line 2668
    .end local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->regExpProxy:Lcom/trendmicro/hippo/RegExpProxy;

    return-object v0
.end method

.method getSecurityController()Lcom/trendmicro/hippo/SecurityController;
    .locals 2

    .line 2679
    invoke-static {}, Lcom/trendmicro/hippo/SecurityController;->global()Lcom/trendmicro/hippo/SecurityController;

    move-result-object v0

    .line 2680
    .local v0, "global":Lcom/trendmicro/hippo/SecurityController;
    if-eqz v0, :cond_0

    .line 2681
    return-object v0

    .line 2683
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->securityController:Lcom/trendmicro/hippo/SecurityController;

    return-object v1
.end method

.method public final getThreadLocal(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 2177
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->threadLocalMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 2178
    const/4 v0, 0x0

    return-object v0

    .line 2179
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;
    .locals 1

    .line 2241
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->wrapFactory:Lcom/trendmicro/hippo/WrapFactory;

    if-nez v0, :cond_0

    .line 2242
    new-instance v0, Lcom/trendmicro/hippo/WrapFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/WrapFactory;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->wrapFactory:Lcom/trendmicro/hippo/WrapFactory;

    .line 2244
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->wrapFactory:Lcom/trendmicro/hippo/WrapFactory;

    return-object v0
.end method

.method public hasFeature(I)Z
    .locals 2
    .param p1, "featureIndex"    # I

    .line 2320
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    .line 2321
    .local v0, "f":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v0, p0, p1}, Lcom/trendmicro/hippo/ContextFactory;->hasFeature(Lcom/trendmicro/hippo/Context;I)Z

    move-result v1

    return v1
.end method

.method public final initSafeStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1157
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Context;->initSafeStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public final initSafeStandardObjects()Lcom/trendmicro/hippo/ScriptableObject;
    .locals 2

    .line 1103
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/Context;->initSafeStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public initSafeStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "sealed"    # Z

    .line 1231
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->initSafeStandardObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public final initStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 1126
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/Context;->initStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public final initStandardObjects()Lcom/trendmicro/hippo/ScriptableObject;
    .locals 2

    .line 1076
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/Context;->initStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public initStandardObjects(Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p2, "sealed"    # Z

    .line 1190
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->initStandardObjects(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;Z)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0
.end method

.method public final isActivationNeeded(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 2715
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isGeneratingDebug()Z
    .locals 1

    .line 1939
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generatingDebug:Z

    return v0
.end method

.method public final isGeneratingDebugChanged()Z
    .locals 1

    .line 2688
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generatingDebugChanged:Z

    return v0
.end method

.method public final isGeneratingSource()Z
    .locals 1

    .line 1964
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generatingSource:Z

    return v0
.end method

.method public final isSealed()Z
    .locals 1

    .line 614
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    return v0
.end method

.method public final isStrictMode()Z
    .locals 1

    .line 2732
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->isTopLevelStrict:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->currentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    if-eqz v0, :cond_0

    iget-boolean v0, v0, Lcom/trendmicro/hippo/NativeCall;->isStrict:Z

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

.method final isVersionECMA1()Z
    .locals 2

    .line 2673
    iget v0, p0, Lcom/trendmicro/hippo/Context;->version:I

    if-eqz v0, :cond_1

    const/16 v1, 0x82

    if-lt v0, v1, :cond_0

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

.method public newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "length"    # I

    .line 1694
    new-instance v0, Lcom/trendmicro/hippo/NativeArray;

    int-to-long v1, p2

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/NativeArray;-><init>(J)V

    .line 1695
    .local v0, "result":Lcom/trendmicro/hippo/NativeArray;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1697
    return-object v0
.end method

.method public newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "elements"    # [Ljava/lang/Object;

    .line 1712
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne v0, v1, :cond_0

    .line 1714
    new-instance v0, Lcom/trendmicro/hippo/NativeArray;

    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/NativeArray;-><init>([Ljava/lang/Object;)V

    .line 1715
    .local v0, "result":Lcom/trendmicro/hippo/NativeArray;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Array:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1717
    return-object v0

    .line 1713
    .end local v0    # "result":Lcom/trendmicro/hippo/NativeArray;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 1638
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 1639
    .local v0, "result":Lcom/trendmicro/hippo/NativeObject;
    sget-object v1, Lcom/trendmicro/hippo/TopLevel$Builtins;->Object:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {v0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 1641
    return-object v0
.end method

.method public newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;

    .line 1656
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {p0, p1, p2, v0}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "constructorName"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1681
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->newObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method protected observeInstructionCount(I)V
    .locals 1
    .param p1, "instructionCount"    # I

    .line 2411
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    .line 2412
    .local v0, "f":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v0, p0, p1}, Lcom/trendmicro/hippo/ContextFactory;->observeInstructionCount(Lcom/trendmicro/hippo/Context;I)V

    .line 2413
    return-void
.end method

.method public final declared-synchronized putThreadLocal(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    monitor-enter p0

    .line 2190
    :try_start_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2191
    .end local p0    # "this":Lcom/trendmicro/hippo/Context;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->threadLocalMap:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 2192
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->threadLocalMap:Ljava/util/Map;

    .line 2193
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->threadLocalMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2194
    monitor-exit p0

    return-void

    .line 2189
    .end local p1    # "key":Ljava/lang/Object;
    .end local p2    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public removeActivationName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 2726
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2727
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->activationNames:Ljava/util/Set;

    if-eqz v0, :cond_1

    .line 2728
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 2729
    :cond_1
    return-void
.end method

.method public final removePropertyChangeListener(Ljava/beans/PropertyChangeListener;)V
    .locals 1
    .param p1, "l"    # Ljava/beans/PropertyChangeListener;

    .line 861
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 862
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/Kit;->removeListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    .line 863
    return-void
.end method

.method public final removeThreadLocal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 2203
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2204
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->threadLocalMap:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 2205
    return-void

    .line 2206
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2207
    return-void
.end method

.method public resumeContinuation(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "continuation"    # Ljava/lang/Object;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "functionResult"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trendmicro/hippo/ContinuationPending;
        }
    .end annotation

    .line 1398
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    .line 1399
    .local v0, "args":[Ljava/lang/Object;
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/NativeContinuation;

    invoke-static {v1, p0, p2, v0}, Lcom/trendmicro/hippo/Interpreter;->restartContinuation(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final seal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "sealKey"    # Ljava/lang/Object;

    .line 631
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 632
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    .line 633
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->sealKey:Ljava/lang/Object;

    .line 634
    return-void
.end method

.method public final setApplicationClassLoader(Ljava/lang/ClassLoader;)V
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .line 2460
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2461
    :cond_0
    if-nez p1, :cond_1

    .line 2463
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->applicationClassLoader:Ljava/lang/ClassLoader;

    .line 2464
    return-void

    .line 2466
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/Kit;->testIfCanLoadHippoClasses(Ljava/lang/ClassLoader;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2470
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->applicationClassLoader:Ljava/lang/ClassLoader;

    .line 2471
    return-void

    .line 2467
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Loader can not resolve Hippo classes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final declared-synchronized setClassShutter(Lcom/trendmicro/hippo/ClassShutter;)V
    .locals 2
    .param p1, "shutter"    # Lcom/trendmicro/hippo/ClassShutter;

    monitor-enter p0

    .line 2122
    :try_start_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2123
    .end local p0    # "this":Lcom/trendmicro/hippo/Context;
    :cond_0
    if-eqz p1, :cond_2

    .line 2124
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->hasClassShutter:Z

    if-nez v0, :cond_1

    .line 2128
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->classShutter:Lcom/trendmicro/hippo/ClassShutter;

    .line 2129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->hasClassShutter:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2130
    monitor-exit p0

    return-void

    .line 2125
    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Cannot overwrite existing ClassShutter object"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2123
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2121
    .end local p1    # "shutter":Lcom/trendmicro/hippo/ClassShutter;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final setDebugger(Lcom/trendmicro/hippo/debug/Debugger;Ljava/lang/Object;)V
    .locals 1
    .param p1, "debugger"    # Lcom/trendmicro/hippo/debug/Debugger;
    .param p2, "contextData"    # Ljava/lang/Object;

    .line 2274
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2275
    :cond_0
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->debugger:Lcom/trendmicro/hippo/debug/Debugger;

    .line 2276
    iput-object p2, p0, Lcom/trendmicro/hippo/Context;->debuggerData:Ljava/lang/Object;

    .line 2277
    return-void
.end method

.method public final setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;
    .locals 3
    .param p1, "reporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 797
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 798
    :cond_0
    if-eqz p1, :cond_3

    .line 799
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    .line 800
    .local v0, "old":Lcom/trendmicro/hippo/ErrorReporter;
    if-ne p1, v0, :cond_1

    .line 801
    return-object v0

    .line 803
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    .line 804
    .local v1, "listeners":Ljava/lang/Object;
    if-eqz v1, :cond_2

    .line 805
    const-string v2, "error reporter"

    invoke-direct {p0, v1, v2, v0, p1}, Lcom/trendmicro/hippo/Context;->firePropertyChangeImpl(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 808
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->errorReporter:Lcom/trendmicro/hippo/ErrorReporter;

    .line 809
    return-object v0

    .line 798
    .end local v0    # "old":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v1    # "listeners":Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public setGenerateObserverCount(Z)V
    .locals 0
    .param p1, "generateObserverCount"    # Z

    .line 2387
    iput-boolean p1, p0, Lcom/trendmicro/hippo/Context;->generateObserverCount:Z

    .line 2388
    return-void
.end method

.method public final setGeneratingDebug(Z)V
    .locals 1
    .param p1, "generatingDebug"    # Z

    .line 1951
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 1952
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->generatingDebugChanged:Z

    .line 1953
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getOptimizationLevel()I

    move-result v0

    if-lez v0, :cond_1

    .line 1954
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 1955
    :cond_1
    iput-boolean p1, p0, Lcom/trendmicro/hippo/Context;->generatingDebug:Z

    .line 1956
    return-void
.end method

.method public final setGeneratingSource(Z)V
    .locals 1
    .param p1, "generatingSource"    # Z

    .line 1979
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 1980
    :cond_0
    iput-boolean p1, p0, Lcom/trendmicro/hippo/Context;->generatingSource:Z

    .line 1981
    return-void
.end method

.method public final setInstructionObserverThreshold(I)V
    .locals 1
    .param p1, "threshold"    # I

    .line 2369
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2370
    :cond_0
    if-ltz p1, :cond_2

    .line 2371
    iput p1, p0, Lcom/trendmicro/hippo/Context;->instructionThreshold:I

    .line 2372
    if-lez p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->setGenerateObserverCount(Z)V

    .line 2373
    return-void

    .line 2370
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public setLanguageVersion(I)V
    .locals 4
    .param p1, "version"    # I

    .line 684
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 685
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkLanguageVersion(I)V

    .line 686
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->propertyListeners:Ljava/lang/Object;

    .line 687
    .local v0, "listeners":Ljava/lang/Object;
    if-eqz v0, :cond_1

    iget v1, p0, Lcom/trendmicro/hippo/Context;->version:I

    if-eq p1, v1, :cond_1

    .line 688
    nop

    .line 689
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 690
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 688
    const-string v3, "language version"

    invoke-direct {p0, v0, v3, v1, v2}, Lcom/trendmicro/hippo/Context;->firePropertyChangeImpl(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 692
    :cond_1
    iput p1, p0, Lcom/trendmicro/hippo/Context;->version:I

    .line 693
    return-void
.end method

.method public final setLocale(Ljava/util/Locale;)Ljava/util/Locale;
    .locals 1
    .param p1, "loc"    # Ljava/util/Locale;

    .line 833
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 834
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->locale:Ljava/util/Locale;

    .line 835
    .local v0, "result":Ljava/util/Locale;
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->locale:Ljava/util/Locale;

    .line 836
    return-object v0
.end method

.method public final setMaximumInterpreterStackDepth(I)V
    .locals 2
    .param p1, "max"    # I

    .line 2078
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2079
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/Context;->optimizationLevel:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 2082
    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    .line 2085
    iput p1, p0, Lcom/trendmicro/hippo/Context;->maximumInterpreterStackDepth:I

    .line 2086
    return-void

    .line 2083
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set maximumInterpreterStackDepth to less than 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2080
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set maximumInterpreterStackDepth when optimizationLevel != -1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setOptimizationLevel(I)V
    .locals 1
    .param p1, "optimizationLevel"    # I

    .line 2015
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2016
    :cond_0
    const/4 v0, -0x2

    if-ne p1, v0, :cond_1

    .line 2018
    const/4 p1, -0x1

    .line 2020
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/Context;->checkOptimizationLevel(I)V

    .line 2021
    sget-object v0, Lcom/trendmicro/hippo/Context;->codegenClass:Ljava/lang/Class;

    if-nez v0, :cond_2

    .line 2022
    const/4 p1, -0x1

    .line 2023
    :cond_2
    iput p1, p0, Lcom/trendmicro/hippo/Context;->optimizationLevel:I

    .line 2024
    return-void
.end method

.method public final setSecurityController(Lcom/trendmicro/hippo/SecurityController;)V
    .locals 2
    .param p1, "controller"    # Lcom/trendmicro/hippo/SecurityController;

    .line 2101
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2102
    :cond_0
    if-eqz p1, :cond_3

    .line 2103
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->securityController:Lcom/trendmicro/hippo/SecurityController;

    if-nez v0, :cond_2

    .line 2106
    invoke-static {}, Lcom/trendmicro/hippo/SecurityController;->hasGlobal()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2109
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->securityController:Lcom/trendmicro/hippo/SecurityController;

    .line 2110
    return-void

    .line 2107
    :cond_1
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Can not overwrite existing global SecurityController object"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2104
    :cond_2
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Can not overwrite existing SecurityController object"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2102
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final setWrapFactory(Lcom/trendmicro/hippo/WrapFactory;)V
    .locals 1
    .param p1, "wrapFactory"    # Lcom/trendmicro/hippo/WrapFactory;

    .line 2229
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Context;->onSealedMutation()V

    .line 2230
    :cond_0
    if-eqz p1, :cond_1

    .line 2231
    iput-object p1, p0, Lcom/trendmicro/hippo/Context;->wrapFactory:Lcom/trendmicro/hippo/WrapFactory;

    .line 2232
    return-void

    .line 2230
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final stringIsCompilableUnit(Ljava/lang/String;)Z
    .locals 6
    .param p1, "source"    # Ljava/lang/String;

    .line 1421
    const/4 v0, 0x0

    .line 1422
    .local v0, "errorseen":Z
    new-instance v1, Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v1}, Lcom/trendmicro/hippo/CompilerEnvirons;-><init>()V

    .line 1423
    .local v1, "compilerEnv":Lcom/trendmicro/hippo/CompilerEnvirons;
    invoke-virtual {v1, p0}, Lcom/trendmicro/hippo/CompilerEnvirons;->initFromContext(Lcom/trendmicro/hippo/Context;)V

    .line 1426
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->setGeneratingSource(Z)V

    .line 1427
    new-instance v3, Lcom/trendmicro/hippo/Parser;

    sget-object v4, Lcom/trendmicro/hippo/DefaultErrorReporter;->instance:Lcom/trendmicro/hippo/DefaultErrorReporter;

    invoke-direct {v3, v1, v4}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 1429
    .local v3, "p":Lcom/trendmicro/hippo/Parser;
    const/4 v4, 0x0

    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {v3, p1, v4, v5}, Lcom/trendmicro/hippo/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;
    :try_end_0
    .catch Lcom/trendmicro/hippo/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1432
    goto :goto_0

    .line 1430
    :catch_0
    move-exception v4

    .line 1431
    .local v4, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    const/4 v0, 0x1

    .line 1436
    .end local v4    # "ee":Lcom/trendmicro/hippo/EvaluatorException;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v3}, Lcom/trendmicro/hippo/Parser;->eof()Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    move v2, v5

    :cond_1
    return v2
.end method

.method public final unseal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "sealKey"    # Ljava/lang/Object;

    .line 647
    if-eqz p1, :cond_2

    .line 648
    iget-object v0, p0, Lcom/trendmicro/hippo/Context;->sealKey:Ljava/lang/Object;

    if-ne v0, p1, :cond_1

    .line 649
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    if-eqz v0, :cond_0

    .line 650
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Context;->sealed:Z

    .line 651
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Context;->sealKey:Ljava/lang/Object;

    .line 652
    return-void

    .line 649
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 648
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 647
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method
