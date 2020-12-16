.class public Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
.super Ljava/lang/Object;
.source "RequireBuilder.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

.field private postExec:Lcom/trendmicro/hippo/Script;

.field private preExec:Lcom/trendmicro/hippo/Script;

.field private sandboxed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->sandboxed:Z

    return-void
.end method


# virtual methods
.method public createRequire(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/Require;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "globalScope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 91
    new-instance v7, Lcom/trendmicro/hippo/commonjs/module/Require;

    iget-object v3, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    iget-object v4, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->preExec:Lcom/trendmicro/hippo/Script;

    iget-object v5, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->postExec:Lcom/trendmicro/hippo/Script;

    iget-boolean v6, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->sandboxed:Z

    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/commonjs/module/Require;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Script;Z)V

    return-object v7
.end method

.method public setModuleScriptProvider(Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "moduleScriptProvider"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    .line 42
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    .line 43
    return-object p0
.end method

.method public setPostExec(Lcom/trendmicro/hippo/Script;)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "postExec"    # Lcom/trendmicro/hippo/Script;

    .line 53
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->postExec:Lcom/trendmicro/hippo/Script;

    .line 54
    return-object p0
.end method

.method public setPreExec(Lcom/trendmicro/hippo/Script;)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "preExec"    # Lcom/trendmicro/hippo/Script;

    .line 64
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->preExec:Lcom/trendmicro/hippo/Script;

    .line 65
    return-object p0
.end method

.method public setSandboxed(Z)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
    .locals 0
    .param p1, "sandboxed"    # Z

    .line 77
    iput-boolean p1, p0, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->sandboxed:Z

    .line 78
    return-object p0
.end method
