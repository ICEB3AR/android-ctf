.class Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IProxy"
.end annotation


# static fields
.field public static final EXIT_ACTION:I = 0x1

.field public static final SCOPE_PROVIDER:I = 0x2


# instance fields
.field private scope:Lcom/trendmicro/hippo/Scriptable;

.field private final type:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "type"    # I

    .line 380
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 381
    iput p1, p0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->type:I

    .line 382
    return-void
.end method

.method public static newScopeProvider(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 388
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;-><init>(I)V

    .line 389
    .local v0, "scopeProvider":Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;
    iput-object p0, v0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 390
    return-object v0
.end method


# virtual methods
.method public getScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 2

    .line 409
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->type:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 410
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->scope:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->scope:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public run()V
    .locals 2

    .line 399
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 400
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 401
    return-void
.end method
