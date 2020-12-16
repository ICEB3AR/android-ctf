.class public abstract Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.super Ljava/lang/Object;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;,
        Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;,
        Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;,
        Lcom/trendmicro/hippo/tools/shell/ShellConsole$ConsoleInputStream;
    }
.end annotation


# static fields
.field private static final BOOLEAN_ARG:[Ljava/lang/Class;

.field private static final CHARSEQ_ARG:[Ljava/lang/Class;

.field private static final NO_ARG:[Ljava/lang/Class;

.field private static final STRING_ARG:[Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 31
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    sput-object v1, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;

    .line 32
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v0

    sput-object v2, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->BOOLEAN_ARG:[Ljava/lang/Class;

    .line 33
    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v0

    sput-object v2, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->STRING_ARG:[Ljava/lang/Class;

    .line 34
    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Ljava/lang/CharSequence;

    aput-object v2, v1, v0

    sput-object v1, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->CHARSEQ_ARG:[Ljava/lang/Class;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method static synthetic access$000()[Ljava/lang/Class;
    .locals 1

    .line 29
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # [Ljava/lang/Class;
    .param p3, "x3"    # [Ljava/lang/Object;

    .line 29
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()[Ljava/lang/Class;
    .locals 1

    .line 29
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->STRING_ARG:[Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$300()[Ljava/lang/Class;
    .locals 1

    .line 29
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->CHARSEQ_ARG:[Ljava/lang/Class;

    return-object v0
.end method

.method public static getConsole(Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    .locals 4
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "cs"    # Ljava/nio/charset/Charset;

    .line 334
    const-class v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 335
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_0

    .line 338
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 340
    :cond_0
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 343
    return-object v1

    .line 347
    :cond_1
    :try_start_0
    const-string v2, "jline.console.ConsoleReader"

    invoke-static {v0, v2}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 349
    .local v2, "readerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v2, :cond_2

    .line 350
    invoke-static {v0, v2, p0, p1}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getJLineShellConsoleV2(Ljava/lang/ClassLoader;Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;

    move-result-object v1

    return-object v1

    .line 353
    :cond_2
    const-string v3, "jline.ConsoleReader"

    invoke-static {v0, v3}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    move-object v2, v3

    .line 354
    if-eqz v2, :cond_3

    .line 355
    invoke-static {v0, v2, p0, p1}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getJLineShellConsoleV1(Ljava/lang/ClassLoader;Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 354
    .end local v2    # "readerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    goto :goto_0

    .line 360
    :catch_0
    move-exception v2

    goto :goto_1

    .line 359
    :catch_1
    move-exception v2

    goto :goto_0

    .line 358
    :catch_2
    move-exception v2

    goto :goto_0

    .line 357
    :catch_3
    move-exception v2

    .line 361
    :goto_0
    nop

    .line 362
    :goto_1
    return-object v1
.end method

.method public static getConsole(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "ps"    # Ljava/io/PrintStream;
    .param p2, "cs"    # Ljava/nio/charset/Charset;

    .line 323
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;

    invoke-direct {v0, p0, p1, p2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;-><init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method private static getJLineShellConsoleV1(Ljava/lang/ClassLoader;Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;
    .locals 7
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "cs"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 370
    .local p1, "readerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 371
    .local v1, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 374
    .local v2, "reader":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->BOOLEAN_ARG:[Ljava/lang/Class;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v6, v5, v0

    const-string v6, "setBellEnabled"

    invoke-static {v2, v6, v3, v5}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    const-string v3, "jline.Completor"

    invoke-static {p0, v3}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 379
    .local v3, "completorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v5, v4, [Ljava/lang/Class;

    aput-object v3, v5, v0

    new-instance v6, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;

    invoke-direct {v6, v3, p2}, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;-><init>(Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-static {p0, v5, v6}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v5

    .line 382
    .local v5, "completor":Ljava/lang/Object;
    new-array v6, v4, [Ljava/lang/Class;

    aput-object v3, v6, v0

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v5, v4, v0

    const-string v0, "addCompletor"

    invoke-static {v2, v0, v6, v4}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;

    invoke-direct {v0, v2, p3}, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;-><init>(Ljava/lang/Object;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method private static getJLineShellConsoleV2(Ljava/lang/ClassLoader;Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;
    .locals 7
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "cs"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 392
    .local p1, "readerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 393
    .local v1, "c":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 396
    .local v2, "reader":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->BOOLEAN_ARG:[Ljava/lang/Class;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v6, v5, v0

    const-string v6, "setBellEnabled"

    invoke-static {v2, v6, v3, v5}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    const-string v3, "jline.console.completer.Completer"

    invoke-static {p0, v3}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 401
    .local v3, "completorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-array v5, v4, [Ljava/lang/Class;

    aput-object v3, v5, v0

    new-instance v6, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;

    invoke-direct {v6, v3, p2}, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;-><init>(Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-static {p0, v5, v6}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v5

    .line 404
    .local v5, "completor":Ljava/lang/Object;
    new-array v6, v4, [Ljava/lang/Class;

    aput-object v3, v6, v0

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v5, v4, v0

    const-string v0, "addCompleter"

    invoke-static {v2, v0, v6, v4}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;

    invoke-direct {v0, v2, p3}, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;-><init>(Ljava/lang/Object;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method private static varargs tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "paramTypes"    # [Ljava/lang/Class;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 79
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 80
    .local v0, "m":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {v0, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 80
    .end local v0    # "m":Ljava/lang/reflect/Method;
    :cond_0
    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    goto :goto_1

    .line 85
    :catch_1
    move-exception v0

    goto :goto_0

    .line 84
    :catch_2
    move-exception v0

    goto :goto_0

    .line 83
    :catch_3
    move-exception v0

    .line 87
    :goto_0
    nop

    .line 88
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getIn()Ljava/io/InputStream;
.end method

.method public abstract print(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract println()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract println(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readLine()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readLine(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
