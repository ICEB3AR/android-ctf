.class public Lcom/trendmicro/hippo/NativeJavaTopPackage;
.super Lcom/trendmicro/hippo/NativeJavaPackage;
.source "NativeJavaTopPackage.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;
.implements Lcom/trendmicro/hippo/IdFunctionCall;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_getClass:I = 0x1

.field private static final commonPackages:[[Ljava/lang/String;

.field private static final serialVersionUID:J = -0x1433fecca5b554afL


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 29
    const/16 v0, 0x8

    new-array v0, v0, [[Ljava/lang/String;

    const-string v1, "java"

    const-string v2, "lang"

    const-string v3, "reflect"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-string v2, "io"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const-string v2, "math"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v0, v3

    const-string v2, "net"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v0, v3

    const-string v2, "util"

    const-string v3, "zip"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    aput-object v2, v0, v3

    const-string v2, "text"

    const-string v3, "resources"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v0, v3

    const-string v2, "applet"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "javax"

    const-string v2, "swing"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lcom/trendmicro/hippo/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    .line 154
    const-string v0, "JavaTopPackage"

    sput-object v0, Lcom/trendmicro/hippo/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .line 42
    const/4 v0, 0x1

    const-string v1, ""

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 43
    return-void
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 76
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 77
    .local v0, "loader":Ljava/lang/ClassLoader;
    new-instance v1, Lcom/trendmicro/hippo/NativeJavaTopPackage;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/NativeJavaTopPackage;-><init>(Ljava/lang/ClassLoader;)V

    .line 78
    .local v1, "top":Lcom/trendmicro/hippo/NativeJavaTopPackage;
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 79
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 81
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v3, Lcom/trendmicro/hippo/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    array-length v3, v3

    if-eq v2, v3, :cond_1

    .line 82
    move-object v3, v1

    .line 83
    .local v3, "parent":Lcom/trendmicro/hippo/NativeJavaPackage;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    sget-object v5, Lcom/trendmicro/hippo/NativeJavaTopPackage;->commonPackages:[[Ljava/lang/String;

    aget-object v6, v5, v2

    array-length v6, v6

    if-eq v4, v6, :cond_0

    .line 84
    aget-object v5, v5, v2

    aget-object v5, v5, v4

    invoke-virtual {v3, v5, p1}, Lcom/trendmicro/hippo/NativeJavaPackage;->forcePackage(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/NativeJavaPackage;

    move-result-object v3

    .line 83
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 81
    .end local v3    # "parent":Lcom/trendmicro/hippo/NativeJavaPackage;
    .end local v4    # "j":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 89
    .end local v2    # "i":I
    :cond_1
    new-instance v9, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v4, Lcom/trendmicro/hippo/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    const/4 v5, 0x1

    const/4 v7, 0x1

    const-string v6, "getClass"

    move-object v2, v9

    move-object v3, v1

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 95
    .local v2, "getClass":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-static {}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopPackageNames()[Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "topNames":[Ljava/lang/String;
    array-length v4, v3

    new-array v4, v4, [Lcom/trendmicro/hippo/NativeJavaPackage;

    .line 97
    .local v4, "topPackages":[Lcom/trendmicro/hippo/NativeJavaPackage;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    array-length v6, v3

    if-ge v5, v6, :cond_2

    .line 98
    aget-object v6, v3, v5

    invoke-virtual {v1, v6, v1}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/NativeJavaPackage;

    aput-object v6, v4, v5

    .line 97
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 103
    .end local v5    # "i":I
    :cond_2
    move-object v5, p1

    check-cast v5, Lcom/trendmicro/hippo/ScriptableObject;

    .line 105
    .local v5, "global":Lcom/trendmicro/hippo/ScriptableObject;
    if-eqz p2, :cond_3

    .line 106
    invoke-virtual {v2}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 108
    :cond_3
    invoke-virtual {v2}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 109
    const-string v6, "Packages"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v1, v7}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 110
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    array-length v8, v3

    if-ge v6, v8, :cond_4

    .line 111
    aget-object v8, v3, v6

    aget-object v9, v4, v6

    invoke-virtual {v5, v8, v9, v7}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 110
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 114
    .end local v6    # "i":I
    :cond_4
    return-void
.end method

.method private js_getClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 9
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 130
    array-length v0, p3

    if-lez v0, :cond_2

    const/4 v0, 0x0

    aget-object v1, p3, v0

    instance-of v1, v1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v1, :cond_2

    .line 131
    move-object v1, p0

    .line 132
    .local v1, "result":Lcom/trendmicro/hippo/Scriptable;
    aget-object v0, p3, v0

    check-cast v0, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 135
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 138
    .local v3, "offset":I
    :goto_0
    const/16 v4, 0x2e

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 139
    .local v4, "index":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 140
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 141
    :cond_0
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    :goto_1
    nop

    .line 142
    .local v6, "propName":Ljava/lang/String;
    invoke-interface {v1, v6, v1}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .line 143
    .local v7, "prop":Ljava/lang/Object;
    instance-of v8, v7, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v8, :cond_2

    .line 145
    move-object v1, v7

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 146
    if-ne v4, v5, :cond_1

    .line 147
    return-object v1

    .line 148
    :cond_1
    add-int/lit8 v3, v4, 0x1

    .line 149
    .end local v4    # "index":I
    .end local v6    # "propName":Ljava/lang/String;
    .end local v7    # "prop":Ljava/lang/Object;
    goto :goto_0

    .line 151
    .end local v0    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "result":Lcom/trendmicro/hippo/Scriptable;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "offset":I
    :cond_2
    const-string v0, "msg.not.java.obj"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 49
    invoke-virtual {p0, p1, p2, p4}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, "loader":Ljava/lang/ClassLoader;
    array-length v1, p3

    if-eqz v1, :cond_1

    .line 57
    const/4 v1, 0x0

    aget-object v1, p3, v1

    .line 58
    .local v1, "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_0

    .line 59
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 61
    :cond_0
    instance-of v2, v1, Ljava/lang/ClassLoader;

    if-eqz v2, :cond_1

    .line 62
    move-object v0, v1

    check-cast v0, Ljava/lang/ClassLoader;

    .line 65
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_1
    if-nez v0, :cond_2

    .line 66
    const-string v1, "msg.not.classloader"

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    .line 67
    const/4 v1, 0x0

    return-object v1

    .line 69
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/NativeJavaPackage;

    const/4 v2, 0x1

    const-string v3, ""

    invoke-direct {v1, v2, v3, v0}, Lcom/trendmicro/hippo/NativeJavaPackage;-><init>(ZLjava/lang/String;Ljava/lang/ClassLoader;)V

    .line 70
    .local v1, "pkg":Lcom/trendmicro/hippo/NativeJavaPackage;
    invoke-static {v1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;)V

    .line 71
    return-object v1
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/trendmicro/hippo/NativeJavaTopPackage;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 122
    invoke-direct {p0, p2, p3, p5}, Lcom/trendmicro/hippo/NativeJavaTopPackage;->js_getClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 125
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
