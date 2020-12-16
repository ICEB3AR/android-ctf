.class Lcom/trendmicro/hippo/tools/debugger/FileWindow;
.super Ljavax/swing/JInternalFrame;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = -0x5636d11088fc17c2L


# instance fields
.field currentPos:I

.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

.field private p:Ljavax/swing/JScrollPane;

.field private sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

.field textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
    .locals 7
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;
    .param p2, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 2289
    invoke-virtual {p2}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x1

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Ljavax/swing/JInternalFrame;-><init>(Ljava/lang/String;ZZZZ)V

    .line 2291
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 2292
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 2293
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->updateToolTip()V

    .line 2294
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->currentPos:I

    .line 2295
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;-><init>(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    .line 2296
    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->setRows(I)V

    .line 2297
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->setColumns(I)V

    .line 2298
    new-instance v0, Ljavax/swing/JScrollPane;

    invoke-direct {v0}, Ljavax/swing/JScrollPane;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    .line 2299
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;-><init>(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    .line 2300
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v0, v1}, Ljavax/swing/JScrollPane;->setViewportView(Ljava/awt/Component;)V

    .line 2301
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v0, v1}, Ljavax/swing/JScrollPane;->setRowHeaderView(Ljava/awt/Component;)V

    .line 2302
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setContentPane(Ljava/awt/Container;)V

    .line 2303
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->pack()V

    .line 2304
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->updateText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    .line 2305
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(I)V

    .line 2306
    return-void
.end method

.method private updateToolTip()V
    .locals 4

    .line 2314
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getComponentCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 2315
    .local v0, "n":I
    if-le v0, v1, :cond_0

    .line 2316
    const/4 v0, 0x1

    goto :goto_0

    .line 2317
    :cond_0
    if-gez v0, :cond_1

    .line 2318
    return-void

    .line 2320
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getComponent(I)Ljava/awt/Component;

    move-result-object v1

    .line 2322
    .local v1, "c":Ljava/awt/Component;
    if-eqz v1, :cond_2

    instance-of v2, v1, Ljavax/swing/JComponent;

    if-eqz v2, :cond_2

    .line 2323
    move-object v2, v1

    check-cast v2, Ljavax/swing/JComponent;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/swing/JComponent;->setToolTipText(Ljava/lang/String;)V

    .line 2325
    :cond_2
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 2386
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 2387
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 2389
    :cond_0
    const-string v1, "Copy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2390
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->copy()V

    goto :goto_0

    .line 2391
    :cond_1
    const-string v1, "Paste"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2394
    :goto_0
    return-void
.end method

.method public clearBreakPoint(I)V
    .locals 2
    .param p1, "line"    # I

    .line 2277
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2278
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoint(IZ)Z

    move-result v0

    .line 2279
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 2280
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->repaint()V

    .line 2283
    .end local v0    # "changed":Z
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 1

    .line 2375
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->removeWindow(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V

    .line 2376
    invoke-super {p0}, Ljavax/swing/JInternalFrame;->dispose()V

    .line 2377
    return-void
.end method

.method public getPosition(I)I
    .locals 2
    .param p1, "line"    # I

    .line 2235
    const/4 v0, -0x1

    .line 2237
    .local v0, "result":I
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v1
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 2239
    goto :goto_0

    .line 2238
    :catch_0
    move-exception v1

    .line 2240
    :goto_0
    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 2331
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isBreakPoint(I)Z
    .locals 1
    .param p1, "line"    # I

    .line 2247
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoint(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method load()V
    .locals 4

    .line 2222
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 2223
    .local v0, "url":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 2224
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/RunProxy;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/RunProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V

    .line 2225
    .local v1, "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    iput-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 2226
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->source()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 2227
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 2229
    .end local v1    # "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    :cond_0
    return-void
.end method

.method public select(II)V
    .locals 2
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 2365
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v0

    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v0

    .line 2366
    .local v0, "docEnd":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1, v0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V

    .line 2367
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1, p1, p2}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V

    .line 2368
    return-void
.end method

.method public setBreakPoint(I)V
    .locals 2
    .param p1, "line"    # I

    .line 2265
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2266
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->breakpoint(IZ)Z

    move-result v0

    .line 2267
    .local v0, "changed":Z
    if-eqz v0, :cond_0

    .line 2268
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->repaint()V

    .line 2271
    .end local v0    # "changed":Z
    :cond_0
    return-void
.end method

.method public setPosition(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 2356
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(I)V

    .line 2357
    iput p1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->currentPos:I

    .line 2358
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->repaint()V

    .line 2359
    return-void
.end method

.method public toggleBreakPoint(I)V
    .locals 1
    .param p1, "line"    # I

    .line 2254
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->isBreakPoint(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2255
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setBreakPoint(I)V

    goto :goto_0

    .line 2257
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->clearBreakPoint(I)V

    .line 2259
    :goto_0
    return-void
.end method

.method public updateText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
    .locals 4
    .param p1, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 2338
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 2339
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->source()Ljava/lang/String;

    move-result-object v0

    .line 2340
    .local v0, "newText":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2341
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->setText(Ljava/lang/String;)V

    .line 2342
    const/4 v1, 0x0

    .line 2343
    .local v1, "pos":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->currentPos:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 2344
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->currentPos:I

    .line 2346
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(I)V

    .line 2348
    .end local v1    # "pos":I
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->update()V

    .line 2349
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->fileHeader:Lcom/trendmicro/hippo/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->repaint()V

    .line 2350
    return-void
.end method
