.class public Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
.super Lcom/trendmicro/hippo/tools/shell/SecurityProxy;
.source "JavaPolicySecurity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;,
        Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$Loader;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 118
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/SecurityProxy;-><init>()V

    .line 120
    new-instance v0, Ljava/security/CodeSource;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, [Ljava/security/cert/Certificate;

    invoke-direct {v0, v1, v2}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 121
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/String;)Ljava/net/URL;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->getUrlObj(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/net/URL;)Ljava/security/ProtectionDomain;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;
    .param p1, "x1"    # Ljava/net/URL;

    .line 28
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->getUrlDomain(Ljava/net/URL;)Ljava/security/ProtectionDomain;

    move-result-object v0

    return-object v0
.end method

.method private getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;
    .locals 3
    .param p1, "staticDomain"    # Ljava/security/ProtectionDomain;

    .line 196
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;-><init>(Ljava/security/ProtectionDomain;)V

    .line 197
    .local v0, "p":Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$ContextPermissions;
    new-instance v1, Ljava/security/ProtectionDomain;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v0}, Ljava/security/ProtectionDomain;-><init>(Ljava/security/CodeSource;Ljava/security/PermissionCollection;)V

    .line 198
    .local v1, "contextDomain":Ljava/security/ProtectionDomain;
    return-object v1
.end method

.method private getUrlDomain(Ljava/net/URL;)Ljava/security/ProtectionDomain;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;

    .line 171
    new-instance v0, Ljava/security/CodeSource;

    const/4 v1, 0x0

    check-cast v1, [Ljava/security/cert/Certificate;

    invoke-direct {v0, p1, v1}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 172
    .local v0, "cs":Ljava/security/CodeSource;
    invoke-static {}, Ljava/security/Policy;->getPolicy()Ljava/security/Policy;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/security/Policy;->getPermissions(Ljava/security/CodeSource;)Ljava/security/PermissionCollection;

    move-result-object v1

    .line 173
    .local v1, "pc":Ljava/security/PermissionCollection;
    new-instance v2, Ljava/security/ProtectionDomain;

    invoke-direct {v2, v0, v1}, Ljava/security/ProtectionDomain;-><init>(Ljava/security/CodeSource;Ljava/security/PermissionCollection;)V

    return-object v2
.end method

.method private getUrlObj(Ljava/lang/String;)Ljava/net/URL;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;

    .line 147
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .local v0, "urlObj":Ljava/net/URL;
    goto :goto_0

    .line 148
    .end local v0    # "urlObj":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 151
    .local v0, "ex":Ljava/net/MalformedURLException;
    const-string v1, "user.dir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "curDir":Ljava/lang/String;
    const/16 v2, 0x5c

    const/16 v3, 0x2f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 153
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 154
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 157
    :cond_0
    :try_start_1
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 158
    .local v2, "curDirURL":Ljava/net/URL;
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v2, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 163
    .local v2, "urlObj":Ljava/net/URL;
    move-object v0, v2

    .line 165
    .end local v1    # "curDir":Ljava/lang/String;
    .end local v2    # "urlObj":Ljava/net/URL;
    .local v0, "urlObj":Ljava/net/URL;
    :goto_0
    return-object v0

    .line 159
    .local v0, "ex":Ljava/net/MalformedURLException;
    .restart local v1    # "curDir":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 160
    .local v2, "ex2":Ljava/net/MalformedURLException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can not construct file URL for \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\':"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method protected callProcessFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "filename"    # Ljava/lang/String;

    .line 128
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;

    invoke-direct {v0, p0, p3, p1, p2}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$1;-><init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    .line 141
    return-void
.end method

.method public callWithDomain(Ljava/lang/Object;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
    .param p1, "securityDomain"    # Ljava/lang/Object;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "args"    # [Ljava/lang/Object;

    .line 209
    move-object v0, p1

    check-cast v0, Ljava/security/ProtectionDomain;

    .line 225
    .local v0, "staticDomain":Ljava/security/ProtectionDomain;
    move-object v8, p0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;

    move-result-object v9

    .line 226
    .local v9, "dynamicDomain":Ljava/security/ProtectionDomain;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/security/ProtectionDomain;

    const/4 v2, 0x0

    aput-object v9, v1, v2

    move-object v10, v1

    .line 227
    .local v10, "tmp":[Ljava/security/ProtectionDomain;
    new-instance v1, Ljava/security/AccessControlContext;

    invoke-direct {v1, v10}, Ljava/security/AccessControlContext;-><init>([Ljava/security/ProtectionDomain;)V

    move-object v11, v1

    .line 229
    .local v11, "restricted":Ljava/security/AccessControlContext;
    new-instance v12, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;

    move-object v1, v12

    move-object v2, p0

    move-object/from16 v3, p3

    move-object v4, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$3;-><init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V

    .line 235
    .local v1, "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/Object;>;"
    invoke-static {v1, v11}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;Ljava/security/AccessControlContext;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public createClassLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;
    .locals 2
    .param p1, "parentLoader"    # Ljava/lang/ClassLoader;
    .param p2, "securityDomain"    # Ljava/lang/Object;

    .line 180
    move-object v0, p2

    check-cast v0, Ljava/security/ProtectionDomain;

    .line 181
    .local v0, "domain":Ljava/security/ProtectionDomain;
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;

    invoke-direct {v1, p0, p1, v0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity$2;-><init>(Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/GeneratedClassLoader;

    return-object v1
.end method

.method public getDynamicSecurityDomain(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "securityDomain"    # Ljava/lang/Object;

    .line 191
    move-object v0, p1

    check-cast v0, Ljava/security/ProtectionDomain;

    .line 192
    .local v0, "staticDomain":Ljava/security/ProtectionDomain;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/shell/JavaPolicySecurity;->getDynamicDomain(Ljava/security/ProtectionDomain;)Ljava/security/ProtectionDomain;

    move-result-object v1

    return-object v1
.end method

.method public getStaticSecurityDomainClassInternal()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 33
    const-class v0, Ljava/security/ProtectionDomain;

    return-object v0
.end method
