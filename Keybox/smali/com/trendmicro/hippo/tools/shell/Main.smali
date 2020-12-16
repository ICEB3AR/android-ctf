.class public Lcom/trendmicro/hippo/tools/shell/Main;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/shell/Main$IProxy;,
        Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;,
        Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;
    }
.end annotation


# static fields
.field private static final EXITCODE_FILE_NOT_FOUND:I = 0x4

.field private static final EXITCODE_RUNTIME_ERROR:I = 0x3

.field protected static errorReporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

.field protected static exitCode:I

.field static fileList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static global:Lcom/trendmicro/hippo/tools/shell/Global;

.field static mainModule:Ljava/lang/String;

.field static modulePath:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static processStdin:Z

.field static require:Lcom/trendmicro/hippo/commonjs/module/Require;

.field static sandboxed:Z

.field private static final scriptCache:Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;

.field private static securityImpl:Lcom/trendmicro/hippo/tools/shell/SecurityProxy;

.field public static shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

.field static useRequire:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 55
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/shell/Global;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    .line 59
    const/4 v0, 0x0

    sput v0, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .line 62
    const/4 v1, 0x1

    sput-boolean v1, Lcom/trendmicro/hippo/tools/shell/Main;->processStdin:Z

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    .line 66
    sput-boolean v0, Lcom/trendmicro/hippo/tools/shell/Main;->sandboxed:Z

    .line 67
    sput-boolean v0, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    .line 70
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;-><init>(I)V

    sput-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->scriptCache:Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;

    .line 73
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    new-instance v1, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/shell/Global;->initQuitAction(Lcom/trendmicro/hippo/tools/shell/QuitAction;)V

    .line 74
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static evalInlineScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scriptText"    # Ljava/lang/String;

    .line 203
    const/4 v0, 0x3

    :try_start_0
    const-string v1, "<command>"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v1

    .line 204
    .local v1, "script":Lcom/trendmicro/hippo/Script;
    if-eqz v1, :cond_0

    .line 205
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getShellScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 211
    .end local v1    # "script":Lcom/trendmicro/hippo/Script;
    :catch_0
    move-exception v1

    .line 213
    .local v1, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v1}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 214
    nop

    .line 215
    invoke-virtual {v1}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v2

    .line 214
    const-string v3, "msg.uncaughtJSException"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 216
    .local v2, "msg":Ljava/lang/String;
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 217
    sput v0, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    goto :goto_1

    .line 207
    .end local v1    # "ex":Ljava/lang/VirtualMachineError;
    .end local v2    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 208
    .local v1, "rex":Lcom/trendmicro/hippo/HippoException;
    nop

    .line 209
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v2

    .line 208
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V

    .line 210
    sput v0, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .line 218
    .end local v1    # "rex":Lcom/trendmicro/hippo/HippoException;
    :cond_0
    :goto_0
    nop

    .line 219
    :goto_1
    return-void
.end method

.method public static exec([Ljava/lang/String;)I
    .locals 3
    .param p0, "origArgs"    # [Ljava/lang/String;

    .line 149
    new-instance v0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    sput-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->errorReporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    .line 150
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 151
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/shell/Main;->processOptions([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "args":[Ljava/lang/String;
    sget v1, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    if-lez v1, :cond_0

    .line 153
    return v1

    .line 155
    :cond_0
    sget-boolean v1, Lcom/trendmicro/hippo/tools/shell/Main;->processStdin:Z

    if-eqz v1, :cond_1

    .line 156
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    iget-boolean v1, v1, Lcom/trendmicro/hippo/tools/shell/Global;->initialized:Z

    if-nez v1, :cond_2

    .line 159
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    sget-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->init(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 161
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;-><init>(I)V

    .line 162
    .local v1, "iproxy":Lcom/trendmicro/hippo/tools/shell/Main$IProxy;
    iput-object v0, v1, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->args:[Ljava/lang/String;

    .line 163
    sget-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 165
    sget v2, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    return v2
.end method

.method private static getDigest(Ljava/lang/Object;)[B
    .locals 4
    .param p0, "source"    # Ljava/lang/Object;

    .line 605
    const/4 v0, 0x0

    .line 607
    .local v0, "digest":[B
    if-eqz p0, :cond_1

    .line 608
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 610
    :try_start_0
    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .local v1, "bytes":[B
    goto :goto_0

    .line 611
    .end local v1    # "bytes":[B
    :catch_0
    move-exception v1

    .line 612
    .local v1, "ue":Ljava/io/UnsupportedEncodingException;
    move-object v2, p0

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 613
    .local v1, "bytes":[B
    :goto_0
    goto :goto_1

    .line 615
    .end local v1    # "bytes":[B
    :cond_0
    move-object v1, p0

    check-cast v1, [B

    .line 618
    .restart local v1    # "bytes":[B
    :goto_1
    :try_start_1
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 619
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v3

    .line 623
    .end local v2    # "md":Ljava/security/MessageDigest;
    goto :goto_2

    .line 620
    :catch_1
    move-exception v2

    .line 622
    .local v2, "nsa":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 626
    .end local v1    # "bytes":[B
    .end local v2    # "nsa":Ljava/security/NoSuchAlgorithmException;
    :cond_1
    :goto_2
    return-object v0
.end method

.method public static getErr()Ljava/io/PrintStream;
    .locals 1

    .line 685
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public static getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;
    .locals 1

    .line 223
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    return-object v0
.end method

.method public static getIn()Ljava/io/InputStream;
    .locals 1

    .line 669
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->getIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getOut()Ljava/io/PrintStream;
    .locals 1

    .line 677
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method static getScope(Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 4
    .param p0, "path"    # Ljava/lang/String;

    .line 231
    sget-boolean v0, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    if-eqz v0, :cond_2

    .line 235
    if-nez p0, :cond_0

    .line 237
    new-instance v0, Ljava/io/File;

    const-string v1, "user.dir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .local v0, "uri":Ljava/net/URI;
    goto :goto_1

    .line 240
    .end local v0    # "uri":Ljava/net/URI;
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/SourceReader;->toUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 242
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0    # "uri":Ljava/net/URI;
    goto :goto_0

    .line 243
    .end local v0    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 245
    .local v0, "x":Ljava/net/URISyntaxException;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .line 246
    .local v0, "uri":Ljava/net/URI;
    :goto_0
    goto :goto_1

    .line 248
    .end local v0    # "uri":Ljava/net/URI;
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    .line 251
    .restart local v0    # "uri":Ljava/net/URI;
    :goto_1
    new-instance v1, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;

    sget-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/net/URI;Ljava/net/URI;)V

    return-object v1

    .line 253
    .end local v0    # "uri":Ljava/net/URI;
    :cond_2
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    return-object v0
.end method

.method static getShellScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 227
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Main;->getScope(Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method private static initJavaPolicySecuritySupport()V
    .locals 4

    .line 420
    :try_start_0
    const-string v0, "com.trendmicro.hippo.tools.shell.JavaPolicySecurity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 421
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/tools/shell/SecurityProxy;

    sput-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->securityImpl:Lcom/trendmicro/hippo/tools/shell/SecurityProxy;

    .line 422
    invoke-static {v1}, Lcom/trendmicro/hippo/SecurityController;->initGlobal(Lcom/trendmicro/hippo/SecurityController;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_0

    .line 423
    return-void

    .line 430
    .end local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v0

    .line 431
    .local v0, "ex":Ljava/lang/LinkageError;
    move-object v1, v0

    .local v1, "exObj":Ljava/lang/Throwable;
    goto :goto_1

    .line 428
    .end local v0    # "ex":Ljava/lang/LinkageError;
    .end local v1    # "exObj":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 429
    .local v0, "ex":Ljava/lang/InstantiationException;
    move-object v1, v0

    .end local v0    # "ex":Ljava/lang/InstantiationException;
    .restart local v1    # "exObj":Ljava/lang/Throwable;
    goto :goto_0

    .line 426
    .end local v1    # "exObj":Ljava/lang/Throwable;
    :catch_2
    move-exception v0

    .line 427
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    move-object v1, v0

    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    .restart local v1    # "exObj":Ljava/lang/Throwable;
    goto :goto_0

    .line 424
    .end local v1    # "exObj":Ljava/lang/Throwable;
    :catch_3
    move-exception v0

    .line 425
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    move-object v1, v0

    .line 432
    .end local v0    # "ex":Ljava/lang/ClassNotFoundException;
    .restart local v1    # "exObj":Ljava/lang/Throwable;
    :goto_0
    nop

    .line 433
    :goto_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can not load security support: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static loadCompiledScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;[BLjava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 633
    if-eqz p2, :cond_3

    .line 638
    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 639
    .local v0, "nameStart":I
    if-gez v0, :cond_0

    .line 640
    const/4 v0, 0x0

    goto :goto_0

    .line 642
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 644
    :goto_0
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 645
    .local v1, "nameEnd":I
    if-ge v1, v0, :cond_1

    .line 648
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 650
    :cond_1
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 652
    .local v2, "name":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v3, p3}, Lcom/trendmicro/hippo/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v3

    .line 653
    .local v3, "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    invoke-interface {v3, v2, p2}, Lcom/trendmicro/hippo/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v4

    .line 654
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v3, v4}, Lcom/trendmicro/hippo/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V

    .line 655
    const-class v5, Lcom/trendmicro/hippo/Script;

    invoke-virtual {v5, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 658
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/Script;

    return-object v5

    .line 656
    :cond_2
    const-string v5, "msg.must.implement.Script"

    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    .end local v0    # "nameStart":I
    .end local v1    # "nameEnd":I
    .end local v2    # "name":Ljava/lang/String;
    .end local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p1    # "path":Ljava/lang/String;
    .end local p2    # "data":[B
    .end local p3    # "securityDomain":Ljava/lang/Object;
    throw v5
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 662
    .end local v3    # "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v0    # "nameStart":I
    .restart local v1    # "nameEnd":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local p0    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p1    # "path":Ljava/lang/String;
    .restart local p2    # "data":[B
    .restart local p3    # "securityDomain":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 663
    .local v3, "inex":Ljava/lang/InstantiationException;
    invoke-virtual {v3}, Ljava/lang/InstantiationException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 664
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 659
    .end local v3    # "inex":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v3

    .line 660
    .local v3, "iaex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 661
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 634
    .end local v0    # "nameStart":I
    .end local v1    # "nameEnd":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "iaex":Ljava/lang/IllegalAccessException;
    :cond_3
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .param p0, "args"    # [Ljava/lang/String;

    .line 131
    :try_start_0
    const-string v0, "hippo.use_java_policy_security"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->initJavaPolicySecuritySupport()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :cond_0
    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "ex":Ljava/lang/SecurityException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/SecurityException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 138
    .end local v0    # "ex":Ljava/lang/SecurityException;
    :goto_0
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/shell/Main;->exec([Ljava/lang/String;)I

    move-result v0

    .line 139
    .local v0, "result":I
    if-eqz v0, :cond_1

    .line 140
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 142
    :cond_1
    return-void
.end method

.method public static processFile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 558
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->securityImpl:Lcom/trendmicro/hippo/tools/shell/SecurityProxy;

    if-nez v0, :cond_0

    .line 559
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/trendmicro/hippo/tools/shell/Main;->processFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 561
    :cond_0
    invoke-virtual {v0, p0, p1, p2}, Lcom/trendmicro/hippo/tools/shell/SecurityProxy;->callProcessFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    .line 563
    :goto_0
    return-void
.end method

.method public static processFileNoThrow(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "filename"    # Ljava/lang/String;

    .line 536
    const/4 v0, 0x3

    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/tools/shell/Main;->processFile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_0

    .line 552
    :goto_0
    goto :goto_1

    .line 545
    :catch_0
    move-exception v1

    .line 547
    .local v1, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v1}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 548
    nop

    .line 549
    invoke-virtual {v1}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v2

    .line 548
    const-string v3, "msg.uncaughtJSException"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 550
    .local v2, "msg":Ljava/lang/String;
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 551
    sput v0, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    goto :goto_1

    .line 541
    .end local v1    # "ex":Ljava/lang/VirtualMachineError;
    .end local v2    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 542
    .local v1, "rex":Lcom/trendmicro/hippo/HippoException;
    nop

    .line 543
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v2

    .line 542
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V

    .line 544
    sput v0, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .end local v1    # "rex":Lcom/trendmicro/hippo/HippoException;
    goto :goto_0

    .line 537
    :catch_2
    move-exception v0

    .line 538
    .local v0, "ioex":Ljava/io/IOException;
    nop

    .line 539
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 538
    const-string v2, "msg.couldnt.read.source"

    invoke-static {v2, p2, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 540
    const/4 v1, 0x4

    sput v1, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .end local v0    # "ioex":Ljava/io/IOException;
    goto :goto_0

    .line 553
    :goto_1
    return-void
.end method

.method static processFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "securityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 569
    const-string v0, ".class"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 570
    .local v0, "isClass":Z
    xor-int/lit8 v1, v0, 0x1

    invoke-static {p2, v1}, Lcom/trendmicro/hippo/tools/shell/Main;->readFileOrUrl(Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    .line 572
    .local v1, "source":Ljava/lang/Object;
    invoke-static {v1}, Lcom/trendmicro/hippo/tools/shell/Main;->getDigest(Ljava/lang/Object;)[B

    move-result-object v2

    .line 573
    .local v2, "digest":[B
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getOptimizationLevel()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 574
    .local v3, "key":Ljava/lang/String;
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->scriptCache:Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;

    invoke-virtual {v4, v3, v2}, Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;->get(Ljava/lang/String;[B)Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;

    move-result-object v4

    .line 575
    .local v4, "ref":Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/trendmicro/hippo/tools/shell/Main$ScriptReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/Script;

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 577
    .local v5, "script":Lcom/trendmicro/hippo/Script;
    :goto_0
    if-nez v5, :cond_5

    .line 578
    if-eqz v0, :cond_1

    .line 579
    move-object v6, v1

    check-cast v6, [B

    invoke-static {p0, p2, v6, p3}, Lcom/trendmicro/hippo/tools/shell/Main;->loadCompiledScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;[BLjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v5

    goto :goto_3

    .line 581
    :cond_1
    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    .line 585
    .local v6, "strSrc":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_4

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x23

    if-ne v7, v8, :cond_4

    .line 586
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_1
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eq v7, v8, :cond_4

    .line 587
    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 588
    .local v8, "c":I
    const/16 v9, 0xa

    if-eq v8, v9, :cond_3

    const/16 v9, 0xd

    if-ne v8, v9, :cond_2

    goto :goto_2

    .line 586
    .end local v8    # "c":I
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 589
    .restart local v8    # "c":I
    :cond_3
    :goto_2
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 594
    .end local v7    # "i":I
    .end local v8    # "c":I
    :cond_4
    const/4 v7, 0x1

    invoke-virtual {p0, v6, p2, v7, p3}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v5

    .line 596
    .end local v6    # "strSrc":Ljava/lang/String;
    :goto_3
    sget-object v6, Lcom/trendmicro/hippo/tools/shell/Main;->scriptCache:Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;

    invoke-virtual {v6, v3, v2, v5}, Lcom/trendmicro/hippo/tools/shell/Main$ScriptCache;->put(Ljava/lang/String;[BLcom/trendmicro/hippo/Script;)V

    .line 599
    :cond_5
    if-eqz v5, :cond_6

    .line 600
    invoke-interface {v5, p0, p1}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 602
    :cond_6
    return-void
.end method

.method static processFiles(Lcom/trendmicro/hippo/Context;[Ljava/lang/String;)V
    .locals 8
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "args"    # [Ljava/lang/String;

    .line 173
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/Object;

    .line 174
    .local v0, "array":[Ljava/lang/Object;
    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 176
    .local v1, "argsObj":Lcom/trendmicro/hippo/Scriptable;
    sget-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    const-string v3, "arguments"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v1, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 179
    sget-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 181
    .local v3, "file":Ljava/lang/String;
    const/4 v4, 0x3

    :try_start_0
    invoke-static {p0, v3}, Lcom/trendmicro/hippo/tools/shell/Main;->processSource(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_1
    goto :goto_2

    .line 190
    :catch_0
    move-exception v5

    .line 192
    .local v5, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v5}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 193
    nop

    .line 194
    invoke-virtual {v5}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v6

    .line 193
    const-string v7, "msg.uncaughtJSException"

    invoke-static {v7, v6}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 195
    .local v6, "msg":Ljava/lang/String;
    invoke-static {v6}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 196
    sput v4, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    goto :goto_2

    .line 186
    .end local v5    # "ex":Ljava/lang/VirtualMachineError;
    .end local v6    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 187
    .local v5, "rex":Lcom/trendmicro/hippo/HippoException;
    nop

    .line 188
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v6

    .line 187
    invoke-static {v6, v5}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V

    .line 189
    sput v4, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .end local v5    # "rex":Lcom/trendmicro/hippo/HippoException;
    goto :goto_1

    .line 182
    :catch_2
    move-exception v4

    .line 183
    .local v4, "ioex":Ljava/io/IOException;
    nop

    .line 184
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    .line 183
    const-string v6, "msg.couldnt.read.source"

    invoke-static {v6, v3, v5}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 185
    const/4 v5, 0x4

    sput v5, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .end local v4    # "ioex":Ljava/io/IOException;
    goto :goto_1

    .line 198
    .end local v3    # "file":Ljava/lang/String;
    :goto_2
    goto :goto_0

    .line 199
    :cond_0
    return-void
.end method

.method public static processOptions([Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;

    .line 262
    const-class v0, Lcom/trendmicro/hippo/tools/shell/Main;

    const/4 v1, 0x0

    .line 263
    .local v1, "i":I
    :goto_0
    array-length v2, p0

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    .line 264
    new-array v0, v3, [Ljava/lang/String;

    return-object v0

    .line 266
    :cond_0
    aget-object v2, p0, v1

    .line 267
    .local v2, "arg":Ljava/lang/String;
    const-string v4, "-"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-nez v5, :cond_1

    .line 268
    sput-boolean v3, Lcom/trendmicro/hippo/tools/shell/Main;->processStdin:Z

    .line 269
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    sput-object v2, Lcom/trendmicro/hippo/tools/shell/Main;->mainModule:Ljava/lang/String;

    .line 271
    array-length v0, p0

    sub-int/2addr v0, v1

    sub-int/2addr v0, v6

    new-array v0, v0, [Ljava/lang/String;

    .line 272
    .local v0, "result":[Ljava/lang/String;
    add-int/lit8 v4, v1, 0x1

    array-length v5, p0

    sub-int/2addr v5, v1

    sub-int/2addr v5, v6

    invoke-static {p0, v4, v0, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    return-object v0

    .line 275
    .end local v0    # "result":[Ljava/lang/String;
    :cond_1
    const-string v5, "-version"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v7, "msg.shell.usage"

    const/4 v8, 0x0

    if-eqz v5, :cond_4

    .line 276
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_2

    .line 277
    move-object v3, v2

    .line 278
    .local v3, "usageError":Ljava/lang/String;
    goto/16 :goto_5

    .line 282
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_2
    :try_start_0
    aget-object v3, p0, v1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .local v3, "version":I
    nop

    .line 287
    invoke-static {v3}, Lcom/trendmicro/hippo/Context;->isValidLanguageVersion(I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 288
    aget-object v4, p0, v1

    .line 289
    .local v4, "usageError":Ljava/lang/String;
    move-object v3, v4

    goto/16 :goto_5

    .line 291
    .end local v4    # "usageError":Ljava/lang/String;
    :cond_3
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setLanguageVersion(I)V

    .line 292
    goto/16 :goto_4

    .line 283
    .end local v3    # "version":I
    :catch_0
    move-exception v3

    .line 284
    .local v3, "ex":Ljava/lang/NumberFormatException;
    aget-object v4, p0, v1

    .line 285
    .restart local v4    # "usageError":Ljava/lang/String;
    move-object v3, v4

    goto/16 :goto_5

    .line 294
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    .end local v4    # "usageError":Ljava/lang/String;
    :cond_4
    const-string v5, "-opt"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1a

    const-string v5, "-O"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    goto/16 :goto_2

    .line 316
    :cond_5
    const-string v5, "-encoding"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 317
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_6

    .line 318
    move-object v3, v2

    .line 319
    .local v3, "usageError":Ljava/lang/String;
    goto/16 :goto_5

    .line 321
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_6
    aget-object v3, p0, v1

    .line 322
    .local v3, "enc":Ljava/lang/String;
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setCharacterEncoding(Ljava/lang/String;)V

    .line 323
    goto/16 :goto_4

    .line 325
    .end local v3    # "enc":Ljava/lang/String;
    :cond_7
    const-string v5, "-strict"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 326
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setStrictMode(Z)V

    .line 327
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setAllowReservedKeywords(Z)V

    .line 328
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->errorReporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->setIsReportingWarnings(Z)V

    .line 329
    goto/16 :goto_4

    .line 331
    :cond_8
    const-string v5, "-fatal-warnings"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 332
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setWarningAsError(Z)V

    .line 333
    goto/16 :goto_4

    .line 335
    :cond_9
    const-string v5, "-e"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 336
    sput-boolean v3, Lcom/trendmicro/hippo/tools/shell/Main;->processStdin:Z

    .line 337
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_a

    .line 338
    move-object v3, v2

    .line 339
    .local v3, "usageError":Ljava/lang/String;
    goto/16 :goto_5

    .line 341
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_a
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    iget-boolean v3, v3, Lcom/trendmicro/hippo/tools/shell/Global;->initialized:Z

    if-nez v3, :cond_b

    .line 342
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->init(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 344
    :cond_b
    new-instance v3, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;-><init>(I)V

    .line 345
    .local v3, "iproxy":Lcom/trendmicro/hippo/tools/shell/Main$IProxy;
    aget-object v4, p0, v1

    iput-object v4, v3, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->scriptText:Ljava/lang/String;

    .line 346
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 347
    goto/16 :goto_4

    .line 349
    .end local v3    # "iproxy":Lcom/trendmicro/hippo/tools/shell/Main$IProxy;
    :cond_c
    const-string v5, "-require"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 350
    sput-boolean v6, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    .line 351
    goto/16 :goto_4

    .line 353
    :cond_d
    const-string v5, "-sandbox"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 354
    sput-boolean v6, Lcom/trendmicro/hippo/tools/shell/Main;->sandboxed:Z

    .line 355
    sput-boolean v6, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    .line 356
    goto/16 :goto_4

    .line 358
    :cond_e
    const-string v5, "-modules"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 359
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_f

    .line 360
    move-object v3, v2

    .line 361
    .local v3, "usageError":Ljava/lang/String;
    goto/16 :goto_5

    .line 363
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_f
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->modulePath:Ljava/util/List;

    if-nez v3, :cond_10

    .line 364
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    sput-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->modulePath:Ljava/util/List;

    .line 366
    :cond_10
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->modulePath:Ljava/util/List;

    aget-object v4, p0, v1

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    sput-boolean v6, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    .line 368
    goto/16 :goto_4

    .line 370
    :cond_11
    const-string v5, "-w"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 371
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->errorReporter:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->setIsReportingWarnings(Z)V

    .line 372
    goto/16 :goto_4

    .line 374
    :cond_12
    const-string v5, "-f"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 375
    sput-boolean v3, Lcom/trendmicro/hippo/tools/shell/Main;->processStdin:Z

    .line 376
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_13

    .line 377
    move-object v3, v2

    .line 378
    .restart local v3    # "usageError":Ljava/lang/String;
    goto/16 :goto_5

    .line 380
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_13
    aget-object v3, p0, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 381
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 383
    :cond_14
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->fileList:Ljava/util/List;

    aget-object v4, p0, v1

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 384
    aget-object v3, p0, v1

    sput-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->mainModule:Ljava/lang/String;

    .line 386
    goto/16 :goto_4

    .line 388
    :cond_15
    const-string v3, "-sealedlib"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 389
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/tools/shell/Global;->setSealedStdLib(Z)V

    .line 390
    goto :goto_4

    .line 392
    :cond_16
    const-string v3, "-debug"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 393
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setGeneratingDebug(Z)V

    .line 394
    goto :goto_4

    .line 396
    :cond_17
    const-string v3, "-?"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 397
    const-string v3, "-help"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    goto :goto_1

    .line 404
    :cond_18
    move-object v3, v2

    .line 405
    .restart local v3    # "usageError":Ljava/lang/String;
    goto :goto_5

    .line 399
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_19
    :goto_1
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v3

    .line 400
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 399
    invoke-virtual {v3, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 401
    sput v6, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .line 402
    return-object v8

    .line 295
    :cond_1a
    :goto_2
    add-int/lit8 v1, v1, 0x1

    array-length v3, p0

    if-ne v1, v3, :cond_1b

    .line 296
    move-object v3, v2

    .line 297
    .restart local v3    # "usageError":Ljava/lang/String;
    goto :goto_5

    .line 301
    .end local v3    # "usageError":Ljava/lang/String;
    :cond_1b
    :try_start_1
    aget-object v3, p0, v1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 305
    .local v3, "opt":I
    nop

    .line 306
    const/4 v4, -0x2

    if-ne v3, v4, :cond_1c

    .line 308
    const/4 v3, -0x1

    goto :goto_3

    .line 309
    :cond_1c
    invoke-static {v3}, Lcom/trendmicro/hippo/Context;->isValidOptimizationLevel(I)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 310
    aget-object v4, p0, v1

    .line 311
    .restart local v4    # "usageError":Ljava/lang/String;
    move-object v3, v4

    goto :goto_5

    .line 313
    .end local v4    # "usageError":Ljava/lang/String;
    :cond_1d
    :goto_3
    sget-object v4, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->setOptimizationLevel(I)V

    .line 314
    nop

    .line 262
    .end local v2    # "arg":Ljava/lang/String;
    .end local v3    # "opt":I
    :goto_4
    add-int/2addr v1, v6

    goto/16 :goto_0

    .line 302
    .restart local v2    # "arg":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 303
    .local v3, "ex":Ljava/lang/NumberFormatException;
    aget-object v4, p0, v1

    .line 304
    .restart local v4    # "usageError":Ljava/lang/String;
    move-object v3, v4

    .line 408
    .end local v1    # "i":I
    .end local v2    # "arg":Ljava/lang/String;
    .end local v4    # "usageError":Ljava/lang/String;
    .local v3, "usageError":Ljava/lang/String;
    :goto_5
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v1

    .line 409
    const-string v2, "msg.shell.invalid"

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 408
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 410
    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v1

    .line 411
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 410
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 412
    sput v6, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .line 413
    return-object v8
.end method

.method public static processSource(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V
    .locals 17
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 448
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    if-eqz v2, :cond_2

    const-string v0, "-"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 527
    :cond_0
    sget-boolean v0, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->mainModule:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 528
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->require:Lcom/trendmicro/hippo/commonjs/module/Require;

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/commonjs/module/Require;->requireMain(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    goto/16 :goto_8

    .line 530
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/tools/shell/Main;->getScope(Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-static {v1, v0, v2}, Lcom/trendmicro/hippo/tools/shell/Main;->processFile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 449
    :cond_2
    :goto_0
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getShellScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 451
    .local v3, "scope":Lcom/trendmicro/hippo/Scriptable;
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v4

    .line 452
    .local v4, "charEnc":Ljava/lang/String;
    if-eqz v4, :cond_3

    .line 453
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    move-object v5, v0

    .local v0, "cs":Ljava/nio/charset/Charset;
    goto :goto_1

    .line 455
    .end local v0    # "cs":Ljava/nio/charset/Charset;
    :cond_3
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    move-object v5, v0

    .line 457
    .local v5, "cs":Ljava/nio/charset/Charset;
    :goto_1
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v0, v5}, Lcom/trendmicro/hippo/tools/shell/Global;->getConsole(Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    move-result-object v6

    .line 458
    .local v6, "console":Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    if-nez v2, :cond_4

    .line 460
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getImplementationVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->println(Ljava/lang/String;)V

    .line 463
    :cond_4
    const/4 v0, 0x1

    .line 464
    .local v0, "lineno":I
    const/4 v7, 0x0

    .line 465
    .local v7, "hitEOF":Z
    :goto_2
    if-nez v7, :cond_b

    .line 466
    sget-object v8, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-virtual {v8, v1}, Lcom/trendmicro/hippo/tools/shell/Global;->getPrompts(Lcom/trendmicro/hippo/Context;)[Ljava/lang/String;

    move-result-object v8

    .line 467
    .local v8, "prompts":[Ljava/lang/String;
    const/4 v9, 0x0

    .line 468
    .local v9, "prompt":Ljava/lang/String;
    if-nez v2, :cond_5

    .line 469
    const/4 v10, 0x0

    aget-object v9, v8, v10

    .line 470
    :cond_5
    invoke-virtual {v6}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->flush()V

    .line 471
    const-string v10, ""

    move-object v11, v10

    move-object v10, v9

    move v9, v0

    .line 477
    .end local v0    # "lineno":I
    .local v9, "lineno":I
    .local v10, "prompt":Ljava/lang/String;
    .local v11, "source":Ljava/lang/String;
    :goto_3
    :try_start_0
    invoke-virtual {v6, v10}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    .local v0, "newline":Ljava/lang/String;
    nop

    .line 483
    if-nez v0, :cond_6

    .line 484
    const/4 v7, 0x1

    .line 485
    goto :goto_4

    .line 487
    :cond_6
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 488
    add-int/lit8 v9, v9, 0x1

    .line 489
    invoke-virtual {v1, v11}, Lcom/trendmicro/hippo/Context;->stringIsCompilableUnit(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 490
    goto :goto_4

    .line 491
    :cond_7
    const/4 v12, 0x1

    aget-object v10, v8, v12

    .line 492
    .end local v0    # "newline":Ljava/lang/String;
    goto :goto_3

    .line 479
    :catch_0
    move-exception v0

    move-object v12, v0

    move-object v0, v12

    .line 480
    .local v0, "ioe":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->println(Ljava/lang/String;)V

    .line 481
    nop

    .line 494
    .end local v0    # "ioe":Ljava/io/IOException;
    :goto_4
    :try_start_1
    const-string v0, "<stdin>"

    const/4 v13, 0x0

    invoke-virtual {v1, v11, v0, v9, v13}, Lcom/trendmicro/hippo/Context;->compileString(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    move-object v13, v0

    .line 495
    .local v13, "script":Lcom/trendmicro/hippo/Script;
    if-eqz v13, :cond_a

    .line 496
    invoke-interface {v13, v1, v3}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    .line 498
    .local v14, "result":Ljava/lang/Object;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v0

    if-eq v14, v0, :cond_9

    instance-of v0, v14, Lcom/trendmicro/hippo/Function;

    if-eqz v0, :cond_8

    .line 500
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v15, "function"

    invoke-virtual {v0, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0
    :try_end_1
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/VirtualMachineError; {:try_start_1 .. :try_end_1} :catch_2

    if-nez v0, :cond_9

    .line 503
    :cond_8
    :try_start_2
    invoke-static {v14}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_2 .. :try_end_2} :catch_2

    .line 507
    goto :goto_5

    .line 504
    :catch_1
    move-exception v0

    .line 505
    .local v0, "rex":Lcom/trendmicro/hippo/HippoException;
    nop

    .line 506
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v15

    .line 505
    invoke-static {v15, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V

    .line 509
    .end local v0    # "rex":Lcom/trendmicro/hippo/HippoException;
    :cond_9
    :goto_5
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/shell/Global;->history:Lcom/trendmicro/hippo/NativeArray;

    .line 510
    .local v0, "h":Lcom/trendmicro/hippo/NativeArray;
    move-object/from16 v16, v13

    .end local v13    # "script":Lcom/trendmicro/hippo/Script;
    .local v16, "script":Lcom/trendmicro/hippo/Script;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v12

    long-to-int v12, v12

    invoke-virtual {v0, v12, v0, v11}, Lcom/trendmicro/hippo/NativeArray;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    :try_end_3
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/VirtualMachineError; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_6

    .line 495
    .end local v0    # "h":Lcom/trendmicro/hippo/NativeArray;
    .end local v14    # "result":Ljava/lang/Object;
    .end local v16    # "script":Lcom/trendmicro/hippo/Script;
    .restart local v13    # "script":Lcom/trendmicro/hippo/Script;
    :cond_a
    move-object/from16 v16, v13

    .end local v13    # "script":Lcom/trendmicro/hippo/Script;
    .restart local v16    # "script":Lcom/trendmicro/hippo/Script;
    goto :goto_6

    .line 516
    .end local v16    # "script":Lcom/trendmicro/hippo/Script;
    :catch_2
    move-exception v0

    .line 518
    .local v0, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 519
    nop

    .line 520
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v12

    .line 519
    const-string v13, "msg.uncaughtJSException"

    invoke-static {v13, v12}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 521
    .local v12, "msg":Ljava/lang/String;
    invoke-static {v12}, Lcom/trendmicro/hippo/Context;->reportError(Ljava/lang/String;)V

    .line 522
    const/4 v13, 0x3

    sput v13, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    goto :goto_7

    .line 512
    .end local v0    # "ex":Ljava/lang/VirtualMachineError;
    .end local v12    # "msg":Ljava/lang/String;
    :catch_3
    move-exception v0

    .line 513
    .local v0, "rex":Lcom/trendmicro/hippo/HippoException;
    nop

    .line 514
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v12

    .line 513
    invoke-static {v12, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V

    .line 515
    const/4 v12, 0x3

    sput v12, Lcom/trendmicro/hippo/tools/shell/Main;->exitCode:I

    .line 523
    .end local v0    # "rex":Lcom/trendmicro/hippo/HippoException;
    :goto_6
    nop

    .line 524
    .end local v8    # "prompts":[Ljava/lang/String;
    .end local v10    # "prompt":Ljava/lang/String;
    .end local v11    # "source":Ljava/lang/String;
    :goto_7
    move v0, v9

    goto/16 :goto_2

    .line 525
    .end local v9    # "lineno":I
    .local v0, "lineno":I
    :cond_b
    invoke-virtual {v6}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->println()V

    .line 526
    invoke-virtual {v6}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->flush()V

    .line 527
    .end local v0    # "lineno":I
    .end local v3    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "charEnc":Ljava/lang/String;
    .end local v5    # "cs":Ljava/nio/charset/Charset;
    .end local v6    # "console":Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    .end local v7    # "hitEOF":Z
    nop

    .line 532
    :goto_8
    return-void
.end method

.method private static readFileOrUrl(Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "convertToString"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 700
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    .line 701
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v0

    .line 700
    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/tools/SourceReader;->readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static setErr(Ljava/io/PrintStream;)V
    .locals 1
    .param p0, "err"    # Ljava/io/PrintStream;

    .line 689
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 690
    return-void
.end method

.method public static setIn(Ljava/io/InputStream;)V
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;

    .line 673
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 674
    return-void
.end method

.method public static setOut(Ljava/io/PrintStream;)V
    .locals 1
    .param p0, "out"    # Ljava/io/PrintStream;

    .line 681
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 682
    return-void
.end method
