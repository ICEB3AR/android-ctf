.class public Lcom/trendmicro/hippo/tools/debugger/Main;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;
    }
.end annotation


# instance fields
.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private dim:Lcom/trendmicro/hippo/tools/debugger/Dim;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 41
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-direct {v0, v1, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 42
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .line 208
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Main;

    const-string v1, "Debugger"

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;-><init>(Ljava/lang/String;)V

    .line 209
    .local v0, "main":Lcom/trendmicro/hippo/tools/debugger/Main;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->doBreak()V

    .line 210
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;->setExitAction(Ljava/lang/Runnable;)V

    .line 212
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V

    .line 213
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 214
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 216
    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/Main;->getGlobal()Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v1

    .line 217
    .local v1, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 218
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 219
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 221
    sget-object v3, Lcom/trendmicro/hippo/tools/shell/Main;->shellContextFactory:Lcom/trendmicro/hippo/tools/shell/ShellContextFactory;

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/tools/debugger/Main;->attachTo(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 224
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;->setScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 226
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->pack()V

    .line 227
    const/16 v3, 0x258

    const/16 v4, 0x1cc

    invoke-virtual {v0, v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Main;->setSize(II)V

    .line 228
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/Main;->setVisible(Z)V

    .line 230
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/shell/Main;->exec([Ljava/lang/String;)I

    .line 231
    return-void
.end method

.method public static mainEmbedded(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;
    .locals 1
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "title"    # Ljava/lang/String;

    .line 254
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Main;->mainEmbeddedImpl(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;

    move-result-object v0

    return-object v0
.end method

.method public static mainEmbedded(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;
    .locals 1
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p1, "scopeProvider"    # Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;
    .param p2, "title"    # Ljava/lang/String;

    .line 265
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/Main;->mainEmbeddedImpl(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;

    move-result-object v0

    return-object v0
.end method

.method public static mainEmbedded(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;
    .locals 3
    .param p0, "title"    # Ljava/lang/String;

    .line 240
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v0

    .line 241
    .local v0, "factory":Lcom/trendmicro/hippo/ContextFactory;
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/Global;

    invoke-direct {v1}, Lcom/trendmicro/hippo/tools/shell/Global;-><init>()V

    .line 242
    .local v1, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->init(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 243
    invoke-static {v0, v1, p0}, Lcom/trendmicro/hippo/tools/debugger/Main;->mainEmbedded(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;

    move-result-object v2

    return-object v2
.end method

.method private static mainEmbeddedImpl(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/Object;Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Main;
    .locals 5
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;
    .param p1, "scopeProvider"    # Ljava/lang/Object;
    .param p2, "title"    # Ljava/lang/String;

    .line 274
    if-nez p2, :cond_0

    .line 275
    const-string p2, "Debugger (embedded usage)"

    .line 277
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/Main;

    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/Main;-><init>(Ljava/lang/String;)V

    .line 278
    .local v0, "main":Lcom/trendmicro/hippo/tools/debugger/Main;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->doBreak()V

    .line 279
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;->setExitAction(Ljava/lang/Runnable;)V

    .line 281
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/Main;->attachTo(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 282
    instance-of v1, p1, Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    if-eqz v1, :cond_1

    .line 283
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;->setScopeProvider(Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;)V

    goto :goto_0

    .line 285
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 286
    .local v1, "scope":Lcom/trendmicro/hippo/Scriptable;
    instance-of v3, v1, Lcom/trendmicro/hippo/tools/shell/Global;

    if-eqz v3, :cond_2

    .line 287
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/tools/shell/Global;

    .line 288
    .local v3, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getIn()Ljava/io/InputStream;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->setIn(Ljava/io/InputStream;)V

    .line 289
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getOut()Ljava/io/PrintStream;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 290
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->getErr()Ljava/io/PrintStream;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 292
    .end local v3    # "global":Lcom/trendmicro/hippo/tools/shell/Global;
    :cond_2
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Main;->setScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 295
    .end local v1    # "scope":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->pack()V

    .line 296
    const/16 v1, 0x258

    const/16 v3, 0x1cc

    invoke-virtual {v0, v1, v3}, Lcom/trendmicro/hippo/tools/debugger/Main;->setSize(II)V

    .line 297
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/Main;->setVisible(Z)V

    .line 298
    return-object v0
.end method


# virtual methods
.method public attachTo(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 193
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->attachTo(Lcom/trendmicro/hippo/ContextFactory;)V

    .line 194
    return-void
.end method

.method public clearAllBreakpoints()V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->clearAllBreakpoints()V

    .line 87
    return-void
.end method

.method public contextCreated(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 343
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextEntered(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 325
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextExited(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 334
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public contextReleased(Lcom/trendmicro/hippo/Context;)V
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 353
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public detach()V
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->detach()V

    .line 201
    return-void
.end method

.method public dispose()V
    .locals 1

    .line 183
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/Main;->clearAllBreakpoints()V

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->go()V

    .line 185
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dispose()V

    .line 186
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 187
    return-void
.end method

.method public doBreak()V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreak()V

    .line 56
    return-void
.end method

.method public getDebugFrame()Ljavax/swing/JFrame;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    return-object v0
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getConsole()Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->getErr()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getConsole()Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->getIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getConsole()Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public go()V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->go()V

    .line 94
    return-void
.end method

.method public isVisible()Z
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->isVisible()Z

    move-result v0

    return v0
.end method

.method public pack()V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->pack()V

    .line 156
    return-void
.end method

.method public setBreakOnEnter(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 70
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnEnter(Z)V

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getMenubar()Lcom/trendmicro/hippo/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->getBreakOnEnter()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 72
    return-void
.end method

.method public setBreakOnExceptions(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 62
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnExceptions(Z)V

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getMenubar()Lcom/trendmicro/hippo/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->getBreakOnExceptions()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 64
    return-void
.end method

.method public setBreakOnReturn(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 78
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnReturn(Z)V

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getMenubar()Lcom/trendmicro/hippo/tools/debugger/Menubar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->getBreakOnReturn()Ljavax/swing/JCheckBoxMenuItem;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 80
    return-void
.end method

.method public setExitAction(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 124
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setExitAction(Ljava/lang/Runnable;)V

    .line 125
    return-void
.end method

.method public setOptimizationLevel(I)V
    .locals 0
    .param p1, "level"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 317
    return-void
.end method

.method public setScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 100
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/Main$IProxy;->newScopeProvider(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/Main;->setScopeProvider(Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;)V

    .line 101
    return-void
.end method

.method public setScopeProvider(Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;)V
    .locals 1
    .param p1, "p"    # Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;

    .line 108
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setScopeProvider(Lcom/trendmicro/hippo/tools/debugger/ScopeProvider;)V

    .line 109
    return-void
.end method

.method public setSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .line 162
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setSize(II)V

    .line 163
    return-void
.end method

.method public setSize(Ljava/awt/Dimension;)V
    .locals 3
    .param p1, "dimension"    # Ljava/awt/Dimension;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 308
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget v1, p1, Ljava/awt/Dimension;->width:I

    iget v2, p1, Ljava/awt/Dimension;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setSize(II)V

    .line 309
    return-void
.end method

.method public setSourceProvider(Lcom/trendmicro/hippo/tools/debugger/SourceProvider;)V
    .locals 1
    .param p1, "sourceProvider"    # Lcom/trendmicro/hippo/tools/debugger/SourceProvider;

    .line 116
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setSourceProvider(Lcom/trendmicro/hippo/tools/debugger/SourceProvider;)V

    .line 117
    return-void
.end method

.method public setVisible(Z)V
    .locals 1
    .param p1, "flag"    # Z

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Main;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setVisible(Z)V

    .line 170
    return-void
.end method
