.class Lcom/trendmicro/hippo/tools/shell/Main$IProxy;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Lcom/trendmicro/hippo/ContextAction;
.implements Lcom/trendmicro/hippo/tools/shell/QuitAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IProxy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/trendmicro/hippo/ContextAction<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/trendmicro/hippo/tools/shell/QuitAction;"
    }
.end annotation


# static fields
.field private static final EVAL_INLINE_SCRIPT:I = 0x2

.field private static final PROCESS_FILES:I = 0x1

.field private static final SYSTEM_EXIT:I = 0x3


# instance fields
.field args:[Ljava/lang/String;

.field scriptText:Ljava/lang/String;

.field private type:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "type"    # I

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput p1, p0, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->type:I

    .line 92
    return-void
.end method


# virtual methods
.method public quit(Lcom/trendmicro/hippo/Context;I)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "exitCode"    # I

    .line 113
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 114
    invoke-static {p2}, Ljava/lang/System;->exit(I)V

    .line 115
    return-void

    .line 117
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public run(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 97
    sget-boolean v0, Lcom/trendmicro/hippo/tools/shell/Main;->useRequire:Z

    if-eqz v0, :cond_0

    .line 98
    sget-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->global:Lcom/trendmicro/hippo/tools/shell/Global;

    sget-object v1, Lcom/trendmicro/hippo/tools/shell/Main;->modulePath:Ljava/util/List;

    sget-boolean v2, Lcom/trendmicro/hippo/tools/shell/Main;->sandboxed:Z

    invoke-virtual {v0, p1, v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->installRequire(Lcom/trendmicro/hippo/Context;Ljava/util/List;Z)Lcom/trendmicro/hippo/commonjs/module/Require;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/tools/shell/Main;->require:Lcom/trendmicro/hippo/commonjs/module/Require;

    .line 100
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 101
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->args:[Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/tools/shell/Main;->processFiles(Lcom/trendmicro/hippo/Context;[Ljava/lang/String;)V

    goto :goto_0

    .line 102
    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 103
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Main$IProxy;->scriptText:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/tools/shell/Main;->evalInlineScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V

    .line 107
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 105
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
