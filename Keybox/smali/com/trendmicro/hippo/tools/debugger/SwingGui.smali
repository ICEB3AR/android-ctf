.class public Lcom/trendmicro/hippo/tools/debugger/SwingGui;
.super Ljavax/swing/JFrame;
.source "SwingGui.java"

# interfaces
.implements Lcom/trendmicro/hippo/tools/debugger/GuiCallback;


# static fields
.field private static final serialVersionUID:J = -0x7208c10b13b21fc5L


# instance fields
.field private awtEventQueue:Ljava/awt/EventQueue;

.field private console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

.field private context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

.field private currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

.field private desk:Ljavax/swing/JDesktopPane;

.field dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

.field dlg:Ljavax/swing/JFileChooser;

.field private exitAction:Ljava/lang/Runnable;

.field private final fileWindows:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/tools/debugger/FileWindow;",
            ">;"
        }
    .end annotation
.end field

.field private menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

.field private split1:Ljavax/swing/JSplitPane;

.field private statusBar:Ljavax/swing/JLabel;

.field private toolBar:Ljavax/swing/JToolBar;

.field private final toplevels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljavax/swing/JFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim;Ljava/lang/String;)V
    .locals 1
    .param p1, "dim"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p2, "title"    # Ljava/lang/String;

    .line 210
    invoke-direct {p0, p2}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 181
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toplevels:Ljava/util/Map;

    .line 186
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 187
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    .line 211
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 212
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->init()V

    .line 213
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setGuiCallback(Lcom/trendmicro/hippo/tools/debugger/GuiCallback;)V

    .line 214
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 123
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->exit()V

    return-void
.end method

.method private chooseFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "title"    # Ljava/lang/String;

    .line 713
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v0, p1}, Ljavax/swing/JFileChooser;->setDialogTitle(Ljava/lang/String;)V

    .line 714
    const/4 v0, 0x0

    .line 715
    .local v0, "CWD":Ljava/io/File;
    const-string v1, "user.dir"

    invoke-static {v1}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 716
    .local v2, "dir":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 717
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, v3

    .line 719
    :cond_0
    if-eqz v0, :cond_1

    .line 720
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v3, v0}, Ljavax/swing/JFileChooser;->setCurrentDirectory(Ljava/io/File;)V

    .line 722
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v3, p0}, Ljavax/swing/JFileChooser;->showOpenDialog(Ljava/awt/Component;)I

    move-result v3

    .line 723
    .local v3, "returnVal":I
    if-nez v3, :cond_2

    .line 725
    :try_start_0
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v4}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v4

    .line 726
    .local v4, "result":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v5}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    move-object v0, v5

    .line 727
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v5

    .line 728
    .local v5, "props":Ljava/util/Properties;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 729
    invoke-static {v5}, Ljava/lang/System;->setProperties(Ljava/util/Properties;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 730
    return-object v4

    .line 732
    .end local v4    # "result":Ljava/lang/String;
    .end local v5    # "props":Ljava/util/Properties;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 731
    :catch_1
    move-exception v1

    .line 735
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private exit()V
    .locals 2

    .line 399
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->exitAction:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 400
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 402
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setReturnValue(I)V

    .line 403
    return-void
.end method

.method private getSelectedFrame()Ljavax/swing/JInternalFrame;
    .locals 3

    .line 742
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v0

    .line 743
    .local v0, "frames":[Ljavax/swing/JInternalFrame;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 744
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljavax/swing/JInternalFrame;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 745
    aget-object v2, v0, v1

    return-object v2

    .line 743
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 748
    .end local v1    # "i":I
    :cond_1
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    return-object v1
.end method

.method static getShortName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .line 419
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 420
    .local v0, "lastSlash":I
    if-gez v0, :cond_0

    .line 421
    const/16 v1, 0x5c

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 423
    :cond_0
    move-object v1, p0

    .line 424
    .local v1, "shortName":Ljava/lang/String;
    if-ltz v0, :cond_1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 425
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 427
    :cond_1
    return-object v1
.end method

.method private getWindowMenu()Ljavax/swing/JMenu;
    .locals 2

    .line 706
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->getMenu(I)Ljavax/swing/JMenu;

    move-result-object v0

    return-object v0
.end method

.method private init()V
    .locals 16

    .line 271
    move-object/from16 v0, p0

    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/Menubar;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    .line 272
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 273
    new-instance v1, Ljavax/swing/JToolBar;

    invoke-direct {v1}, Ljavax/swing/JToolBar;-><init>()V

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    .line 277
    const-string v1, "Break (Pause)"

    const-string v2, "Go (F5)"

    const-string v3, "Step Into (F11)"

    const-string v4, "Step Over (F7)"

    const-string v5, "Step Out (F8)"

    filled-new-array {v1, v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v1

    .line 282
    .local v1, "toolTips":[Ljava/lang/String;
    const/4 v2, 0x0

    .line 283
    .local v2, "count":I
    new-instance v3, Ljavax/swing/JButton;

    const-string v4, "Break"

    invoke-direct {v3, v4}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    move-object v5, v3

    .line 284
    .local v3, "button":Ljavax/swing/JButton;
    .local v5, "breakButton":Ljavax/swing/JButton;
    invoke-virtual {v3, v4}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v3, v4}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 286
    iget-object v4, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v3, v4}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 287
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 288
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "count":I
    .local v6, "count":I
    aget-object v2, v1, v2

    invoke-virtual {v3, v2}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 290
    new-instance v2, Ljavax/swing/JButton;

    const-string v7, "Go"

    invoke-direct {v2, v7}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    move-object v8, v2

    .line 291
    .end local v3    # "button":Ljavax/swing/JButton;
    .local v2, "button":Ljavax/swing/JButton;
    .local v8, "goButton":Ljavax/swing/JButton;
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 292
    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 293
    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 294
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 295
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "count":I
    .local v7, "count":I
    aget-object v6, v1, v6

    invoke-virtual {v2, v6}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 297
    new-instance v6, Ljavax/swing/JButton;

    const-string v9, "Step Into"

    invoke-direct {v6, v9}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    move-object v10, v6

    .local v10, "stepIntoButton":Ljavax/swing/JButton;
    move-object v2, v6

    .line 298
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 300
    iget-object v6, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v2, v6}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 301
    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 302
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "count":I
    .restart local v6    # "count":I
    aget-object v7, v1, v7

    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 304
    new-instance v7, Ljavax/swing/JButton;

    const-string v9, "Step Over"

    invoke-direct {v7, v9}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    move-object v11, v7

    .local v11, "stepOverButton":Ljavax/swing/JButton;
    move-object v2, v7

    .line 305
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 306
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 307
    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 308
    iget-object v7, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 309
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "count":I
    .restart local v7    # "count":I
    aget-object v6, v1, v6

    invoke-virtual {v2, v6}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 311
    new-instance v6, Ljavax/swing/JButton;

    const-string v9, "Step Out"

    invoke-direct {v6, v9}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    move-object v12, v6

    .local v12, "stepOutButton":Ljavax/swing/JButton;
    move-object v2, v6

    .line 312
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 313
    invoke-virtual {v2, v9}, Ljavax/swing/JButton;->setActionCommand(Ljava/lang/String;)V

    .line 314
    invoke-virtual {v2, v3}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 315
    iget-object v6, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v2, v6}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 316
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "count":I
    .restart local v6    # "count":I
    aget-object v7, v1, v7

    invoke-virtual {v2, v7}, Ljavax/swing/JButton;->setToolTipText(Ljava/lang/String;)V

    .line 318
    invoke-virtual {v11}, Ljavax/swing/JButton;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v7

    .line 319
    .local v7, "dim":Ljava/awt/Dimension;
    invoke-virtual {v5, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 320
    invoke-virtual {v5, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 321
    invoke-virtual {v5, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 322
    invoke-virtual {v5, v7}, Ljavax/swing/JButton;->setSize(Ljava/awt/Dimension;)V

    .line 323
    invoke-virtual {v8, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 324
    invoke-virtual {v8, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 325
    invoke-virtual {v8, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 326
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 327
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 328
    invoke-virtual {v10, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 329
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 330
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 331
    invoke-virtual {v11, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 332
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 333
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 334
    invoke-virtual {v12, v7}, Ljavax/swing/JButton;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 335
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v9, v5}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 336
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v9, v8}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 337
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v9, v10}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 338
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v9, v11}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 339
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v9, v12}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 341
    new-instance v9, Ljavax/swing/JPanel;

    invoke-direct {v9}, Ljavax/swing/JPanel;-><init>()V

    .line 342
    .local v9, "contentPane":Ljavax/swing/JPanel;
    new-instance v13, Ljava/awt/BorderLayout;

    invoke-direct {v13}, Ljava/awt/BorderLayout;-><init>()V

    invoke-virtual {v9, v13}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 343
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getContentPane()Ljava/awt/Container;

    move-result-object v13

    iget-object v14, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    const-string v15, "North"

    invoke-virtual {v13, v14, v15}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 344
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getContentPane()Ljava/awt/Container;

    move-result-object v13

    const-string v14, "Center"

    invoke-virtual {v13, v9, v14}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 345
    new-instance v13, Ljavax/swing/JDesktopPane;

    invoke-direct {v13}, Ljavax/swing/JDesktopPane;-><init>()V

    iput-object v13, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    .line 346
    new-instance v15, Ljava/awt/Dimension;

    const/16 v4, 0x258

    const/16 v3, 0x12c

    invoke-direct {v15, v4, v3}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v13, v15}, Ljavax/swing/JDesktopPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 347
    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    new-instance v13, Ljava/awt/Dimension;

    const/16 v15, 0x96

    const/16 v4, 0x32

    invoke-direct {v13, v15, v4}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v13}, Ljavax/swing/JDesktopPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 348
    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    new-instance v13, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    const-string v15, "JavaScript Console"

    invoke-direct {v13, v15}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;-><init>(Ljava/lang/String;)V

    iput-object v13, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v3, v13}, Ljavax/swing/JDesktopPane;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 349
    new-instance v3, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    invoke-direct {v3, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    iput-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    .line 350
    new-instance v13, Ljava/awt/Dimension;

    const/16 v15, 0x78

    const/16 v4, 0x258

    invoke-direct {v13, v4, v15}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v13}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 351
    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    new-instance v4, Ljava/awt/Dimension;

    const/16 v13, 0x32

    invoke-direct {v4, v13, v13}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 353
    new-instance v3, Ljavax/swing/JSplitPane;

    iget-object v4, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    iget-object v13, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    const/4 v15, 0x0

    invoke-direct {v3, v15, v4, v13}, Ljavax/swing/JSplitPane;-><init>(ILjava/awt/Component;Ljava/awt/Component;)V

    iput-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    .line 355
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 356
    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    move-object v4, v1

    move-object v13, v2

    .end local v1    # "toolTips":[Ljava/lang/String;
    .end local v2    # "button":Ljavax/swing/JButton;
    .local v4, "toolTips":[Ljava/lang/String;
    .local v13, "button":Ljavax/swing/JButton;
    const-wide v1, 0x3fe51eb851eb851fL    # 0.66

    invoke-static {v3, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setResizeWeight(Ljavax/swing/JSplitPane;D)V

    .line 357
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->split1:Ljavax/swing/JSplitPane;

    invoke-virtual {v9, v1, v14}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 358
    new-instance v1, Ljavax/swing/JLabel;

    invoke-direct {v1}, Ljavax/swing/JLabel;-><init>()V

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    .line 359
    const-string v2, "Thread: "

    invoke-virtual {v1, v2}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 360
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    const-string v2, "South"

    invoke-virtual {v9, v1, v2}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 361
    new-instance v1, Ljavax/swing/JFileChooser;

    invoke-direct {v1}, Ljavax/swing/JFileChooser;-><init>()V

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    .line 363
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/SwingGui$1;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    .line 386
    .local v1, "filter":Ljavax/swing/filechooser/FileFilter;
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v2, v1}, Ljavax/swing/JFileChooser;->addChoosableFileFilter(Ljavax/swing/filechooser/FileFilter;)V

    .line 387
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/SwingGui$2;

    invoke-direct {v2, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui$2;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 393
    return-void
.end method

.method private readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "fileName"    # Ljava/lang/String;

    .line 803
    :try_start_0
    new-instance v0, Ljava/io/FileReader;

    invoke-direct {v0, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 804
    .local v0, "r":Ljava/io/Reader;
    :try_start_1
    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->readReader(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 805
    .local v1, "text":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 812
    .end local v0    # "r":Ljava/io/Reader;
    goto :goto_1

    .line 803
    .end local v1    # "text":Ljava/lang/String;
    .restart local v0    # "r":Ljava/io/Reader;
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "fileName":Ljava/lang/String;
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 806
    .end local v0    # "r":Ljava/io/Reader;
    .restart local p1    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 807
    .local v0, "ex":Ljava/io/IOException;
    nop

    .line 808
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 807
    invoke-static {p0, v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 811
    const/4 v1, 0x0

    .line 813
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "text":Ljava/lang/String;
    :goto_1
    return-object v1
.end method

.method private setFilePosition(Lcom/trendmicro/hippo/tools/debugger/FileWindow;I)V
    .locals 5
    .param p1, "w"    # Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    .param p2, "line"    # I

    .line 622
    const/4 v0, 0x1

    .line 623
    .local v0, "activate":Z
    iget-object v1, p1, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    .line 625
    .local v1, "ta":Ljavax/swing/JTextArea;
    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 626
    :try_start_0
    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 627
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-ne v2, p1, :cond_2

    .line 628
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    goto :goto_0

    .line 631
    :cond_0
    add-int/lit8 v3, p2, -0x1

    invoke-virtual {v1, v3}, Ljavax/swing/JTextArea;->getLineStartOffset(I)I

    move-result v3

    .line 632
    .local v3, "loc":I
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-eq v4, p1, :cond_1

    .line 633
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 635
    :cond_1
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 636
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    .end local v3    # "loc":I
    :cond_2
    :goto_0
    goto :goto_1

    .line 638
    :catch_0
    move-exception v2

    .line 641
    :goto_1
    if-eqz v0, :cond_4

    .line 642
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->isIcon()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 643
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v2}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v2

    invoke-interface {v2, p1}, Ljavax/swing/DesktopManager;->deiconifyFrame(Ljavax/swing/JInternalFrame;)V

    .line 645
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v2}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v2

    invoke-interface {v2, p1}, Ljavax/swing/DesktopManager;->activateFrame(Ljavax/swing/JInternalFrame;)V

    .line 647
    :try_start_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->show()V

    .line 648
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->toFront()V

    .line 649
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setSelected(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 651
    goto :goto_2

    .line 650
    :catch_1
    move-exception v2

    .line 653
    :cond_4
    :goto_2
    return-void
.end method

.method static setResizeWeight(Ljavax/swing/JSplitPane;D)V
    .locals 6
    .param p0, "pane"    # Ljavax/swing/JSplitPane;
    .param p1, "weight"    # D

    .line 788
    :try_start_0
    const-class v0, Ljavax/swing/JSplitPane;

    const-string v1, "setResizeWeight"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 790
    .local v0, "m":Ljava/lang/reflect/Method;
    new-array v1, v2, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/Double;

    invoke-direct {v2, p1, p2}, Ljava/lang/Double;-><init>(D)V

    aput-object v2, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 794
    nop

    .end local v0    # "m":Ljava/lang/reflect/Method;
    goto :goto_1

    .line 793
    :catch_0
    move-exception v0

    goto :goto_1

    .line 792
    :catch_1
    move-exception v0

    goto :goto_0

    .line 791
    :catch_2
    move-exception v0

    .line 794
    :goto_0
    nop

    .line 795
    :goto_1
    return-void
.end method

.method private updateEnabled(Z)V
    .locals 4
    .param p1, "interrupted"    # Z

    .line 756
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getJMenuBar()Ljavax/swing/JMenuBar;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->updateEnabled(Z)V

    .line 757
    const/4 v0, 0x0

    .local v0, "ci":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v1}, Ljavax/swing/JToolBar;->getComponentCount()I

    move-result v1

    .local v1, "cc":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 759
    if-nez v0, :cond_0

    .line 761
    xor-int/lit8 v2, p1, 0x1

    .local v2, "enableButton":Z
    goto :goto_1

    .line 763
    .end local v2    # "enableButton":Z
    :cond_0
    move v2, p1

    .line 765
    .restart local v2    # "enableButton":Z
    :goto_1
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    invoke-virtual {v3, v0}, Ljavax/swing/JToolBar;->getComponent(I)Ljava/awt/Component;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/awt/Component;->setEnabled(Z)V

    .line 757
    .end local v2    # "enableButton":Z
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 767
    .end local v0    # "ci":I
    .end local v1    # "cc":I
    :cond_1
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 768
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toolBar:Ljavax/swing/JToolBar;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljavax/swing/JToolBar;->setEnabled(Z)V

    .line 770
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getExtendedState()I

    move-result v1

    .line 771
    .local v1, "state":I
    if-ne v1, v2, :cond_2

    .line 772
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setExtendedState(I)V

    .line 774
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toFront()V

    .line 775
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setEnabled(Z)V

    .line 776
    .end local v1    # "state":I
    goto :goto_2

    .line 777
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-eqz v1, :cond_4

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 778
    :cond_4
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setEnabled(Z)V

    .line 780
    :goto_2
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 24
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 884
    move-object/from16 v8, p0

    invoke-virtual/range {p1 .. p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v9

    .line 885
    .local v9, "cmd":Ljava/lang/String;
    const/4 v10, -0x1

    .line 886
    .local v10, "returnValue":I
    const-string v0, "Cut"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v11, 0x0

    if-nez v1, :cond_20

    const-string v1, "Copy"

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    const-string v2, "Paste"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_9

    .line 891
    :cond_0
    const-string v3, "Step Over"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 892
    const/4 v10, 0x0

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 893
    :cond_1
    const-string v3, "Step Into"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 894
    const/4 v10, 0x1

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 895
    :cond_2
    const-string v3, "Step Out"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 896
    const/4 v10, 0x2

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 897
    :cond_3
    const-string v3, "Go"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 898
    const/4 v10, 0x3

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 899
    :cond_4
    const-string v3, "Break"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 900
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreak()V

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 901
    :cond_5
    const-string v3, "Exit"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 902
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->exit()V

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 903
    :cond_6
    const-string v3, "Open"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_8

    .line 904
    const-string v0, "Select a file to compile"

    invoke-direct {v8, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->chooseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 905
    .local v0, "fileName":Ljava/lang/String;
    if-eqz v0, :cond_7

    .line 906
    invoke-direct {v8, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 907
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_7

    .line 908
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;

    invoke-direct {v2, v8, v4}, Lcom/trendmicro/hippo/tools/debugger/RunProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V

    .line 909
    .local v2, "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    iput-object v0, v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 910
    iput-object v1, v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 911
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 914
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    :cond_7
    move-object/from16 v2, p1

    goto/16 :goto_b

    :cond_8
    const-string v3, "Load"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 915
    const-string v0, "Select a file to execute"

    invoke-direct {v8, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->chooseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 916
    .restart local v0    # "fileName":Ljava/lang/String;
    if-eqz v0, :cond_9

    .line 917
    invoke-direct {v8, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 918
    .restart local v1    # "text":Ljava/lang/String;
    if-eqz v1, :cond_9

    .line 919
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;

    const/4 v3, 0x2

    invoke-direct {v2, v8, v3}, Lcom/trendmicro/hippo/tools/debugger/RunProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V

    .line 920
    .restart local v2    # "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    iput-object v0, v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 921
    iput-object v1, v2, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 922
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 925
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    :cond_9
    move-object/from16 v2, p1

    goto/16 :goto_b

    :cond_a
    const-string v3, "More Windows..."

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 926
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;

    iget-object v1, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    const-string v2, "Window"

    const-string v3, "Files"

    invoke-direct {v0, v8, v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 928
    .local v0, "dlg":Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->showDialog(Ljava/awt/Component;)Ljava/lang/String;

    .line 929
    .end local v0    # "dlg":Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
    move-object/from16 v2, p1

    goto/16 :goto_b

    :cond_b
    const-string v3, "Console"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 930
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->isIcon()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 931
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v0

    iget-object v1, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-interface {v0, v1}, Ljavax/swing/DesktopManager;->deiconifyFrame(Ljavax/swing/JInternalFrame;)V

    .line 933
    :cond_c
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->show()V

    .line 934
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v0

    iget-object v1, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-interface {v0, v1}, Ljavax/swing/DesktopManager;->activateFrame(Ljavax/swing/JInternalFrame;)V

    .line 935
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->requestFocus()V

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 936
    :cond_d
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 937
    :cond_e
    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 938
    :cond_f
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 939
    :cond_10
    const-string v0, "Go to function..."

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 940
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    const-string v1, "Go to function"

    const-string v2, "Function"

    invoke-direct {v0, v8, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    .local v0, "dlg":Lcom/trendmicro/hippo/tools/debugger/FindFunction;
    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->showDialog(Ljava/awt/Component;)Ljava/lang/String;

    .line 943
    .end local v0    # "dlg":Lcom/trendmicro/hippo/tools/debugger/FindFunction;
    move-object/from16 v2, p1

    goto/16 :goto_b

    :cond_11
    const-string v0, "Go to line..."

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 944
    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v2, "Line number"

    const-string v3, "Go to line..."

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v7}, Ljavax/swing/JOptionPane;->showInputDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;ILjavax/swing/Icon;[Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    .line 952
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_13

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_12

    goto :goto_1

    .line 956
    :cond_12
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 957
    .local v0, "line":I
    const/4 v2, 0x0

    invoke-virtual {v8, v2, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 961
    .end local v0    # "line":I
    goto :goto_0

    .line 959
    :catch_0
    move-exception v0

    .line 962
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    move-object/from16 v2, p1

    goto/16 :goto_b

    .line 953
    .restart local v1    # "s":Ljava/lang/String;
    :cond_13
    :goto_1
    return-void

    .line 962
    .end local v1    # "s":Ljava/lang/String;
    :cond_14
    const-string v0, "Tile"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 963
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v1

    .line 964
    .local v1, "frames":[Ljavax/swing/JInternalFrame;
    array-length v2, v1

    .line 966
    .local v2, "count":I
    int-to-double v3, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-int v0, v3

    move v3, v0

    .line 967
    .local v0, "rows":I
    .local v3, "cols":I
    mul-int v4, v0, v3

    if-ge v4, v2, :cond_16

    .line 968
    add-int/lit8 v3, v3, 0x1

    .line 969
    mul-int v4, v0, v3

    if-ge v4, v2, :cond_15

    .line 970
    add-int/lit8 v0, v0, 0x1

    move v4, v3

    move v3, v0

    goto :goto_2

    .line 969
    :cond_15
    move v4, v3

    move v3, v0

    goto :goto_2

    .line 967
    :cond_16
    move v4, v3

    move v3, v0

    .line 973
    .end local v0    # "rows":I
    .local v3, "rows":I
    .local v4, "cols":I
    :goto_2
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getSize()Ljava/awt/Dimension;

    move-result-object v5

    .line 974
    .local v5, "size":Ljava/awt/Dimension;
    iget v0, v5, Ljava/awt/Dimension;->width:I

    div-int v6, v0, v4

    .line 975
    .local v6, "w":I
    iget v0, v5, Ljava/awt/Dimension;->height:I

    div-int v7, v0, v3

    .line 976
    .local v7, "h":I
    const/4 v0, 0x0

    .line 977
    .local v0, "x":I
    const/4 v12, 0x0

    .line 978
    .local v12, "y":I
    const/4 v13, 0x0

    move/from16 v18, v12

    move v15, v13

    .end local v12    # "y":I
    .local v15, "i":I
    .local v18, "y":I
    :goto_3
    if-ge v15, v3, :cond_19

    .line 979
    const/4 v12, 0x0

    move/from16 v19, v0

    move v14, v12

    .end local v0    # "x":I
    .local v14, "j":I
    .local v19, "x":I
    :goto_4
    if-ge v14, v4, :cond_18

    .line 980
    mul-int v0, v15, v4

    add-int v13, v0, v14

    .line 981
    .local v13, "index":I
    array-length v0, v1

    if-lt v13, v0, :cond_17

    .line 982
    move/from16 v23, v15

    goto :goto_6

    .line 984
    :cond_17
    aget-object v12, v1, v13

    .line 986
    .local v12, "f":Ljavax/swing/JInternalFrame;
    :try_start_1
    invoke-virtual {v12, v11}, Ljavax/swing/JInternalFrame;->setIcon(Z)V

    .line 987
    invoke-virtual {v12, v11}, Ljavax/swing/JInternalFrame;->setMaximum(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 989
    goto :goto_5

    .line 988
    :catch_1
    move-exception v0

    .line 990
    :goto_5
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v0

    move-object/from16 v20, v12

    .end local v12    # "f":Ljavax/swing/JInternalFrame;
    .local v20, "f":Ljavax/swing/JInternalFrame;
    move-object v12, v0

    move/from16 v21, v13

    .end local v13    # "index":I
    .local v21, "index":I
    move-object/from16 v13, v20

    move/from16 v22, v14

    .end local v14    # "j":I
    .local v22, "j":I
    move/from16 v14, v19

    move/from16 v23, v15

    .end local v15    # "i":I
    .local v23, "i":I
    move/from16 v15, v18

    move/from16 v16, v6

    move/from16 v17, v7

    invoke-interface/range {v12 .. v17}, Ljavax/swing/DesktopManager;->setBoundsForFrame(Ljavax/swing/JComponent;IIII)V

    .line 992
    add-int v19, v19, v6

    .line 979
    .end local v20    # "f":Ljavax/swing/JInternalFrame;
    .end local v21    # "index":I
    add-int/lit8 v14, v22, 0x1

    move/from16 v15, v23

    .end local v22    # "j":I
    .restart local v14    # "j":I
    goto :goto_4

    .end local v23    # "i":I
    .restart local v15    # "i":I
    :cond_18
    move/from16 v22, v14

    move/from16 v23, v15

    .line 994
    .end local v14    # "j":I
    .end local v15    # "i":I
    .restart local v23    # "i":I
    :goto_6
    add-int v18, v18, v7

    .line 995
    const/4 v0, 0x0

    .line 978
    .end local v19    # "x":I
    .restart local v0    # "x":I
    add-int/lit8 v15, v23, 0x1

    .end local v23    # "i":I
    .restart local v15    # "i":I
    goto :goto_3

    :cond_19
    move/from16 v23, v15

    .line 997
    .end local v0    # "x":I
    .end local v1    # "frames":[Ljavax/swing/JInternalFrame;
    .end local v2    # "count":I
    .end local v3    # "rows":I
    .end local v4    # "cols":I
    .end local v5    # "size":Ljava/awt/Dimension;
    .end local v6    # "w":I
    .end local v7    # "h":I
    .end local v15    # "i":I
    .end local v18    # "y":I
    move-object/from16 v2, p1

    goto/16 :goto_b

    :cond_1a
    const-string v0, "Cascade"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 998
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v0}, Ljavax/swing/JDesktopPane;->getAllFrames()[Ljavax/swing/JInternalFrame;

    move-result-object v1

    .line 999
    .restart local v1    # "frames":[Ljavax/swing/JInternalFrame;
    array-length v2, v1

    .line 1001
    .restart local v2    # "count":I
    move v0, v11

    .local v0, "y":I
    move v3, v11

    .line 1002
    .local v3, "x":I
    iget-object v4, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4}, Ljavax/swing/JDesktopPane;->getHeight()I

    move-result v4

    .line 1003
    .local v4, "h":I
    div-int v5, v4, v2

    .line 1004
    .local v5, "d":I
    const/16 v6, 0x1e

    if-le v5, v6, :cond_1b

    const/16 v5, 0x1e

    .line 1005
    :cond_1b
    add-int/lit8 v6, v2, -0x1

    move v7, v6

    move v6, v4

    move v4, v3

    move v3, v0

    .end local v0    # "y":I
    .local v3, "y":I
    .local v4, "x":I
    .local v6, "h":I
    .local v7, "i":I
    :goto_7
    if-ltz v7, :cond_1c

    .line 1006
    aget-object v15, v1, v7

    .line 1008
    .local v15, "f":Ljavax/swing/JInternalFrame;
    :try_start_2
    invoke-virtual {v15, v11}, Ljavax/swing/JInternalFrame;->setIcon(Z)V

    .line 1009
    invoke-virtual {v15, v11}, Ljavax/swing/JInternalFrame;->setMaximum(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1011
    goto :goto_8

    .line 1010
    :catch_2
    move-exception v0

    .line 1012
    :goto_8
    invoke-virtual {v15}, Ljavax/swing/JInternalFrame;->getPreferredSize()Ljava/awt/Dimension;

    move-result-object v0

    .line 1013
    .local v0, "dimen":Ljava/awt/Dimension;
    iget v14, v0, Ljava/awt/Dimension;->width:I

    .line 1014
    .local v14, "w":I
    iget v6, v0, Ljava/awt/Dimension;->height:I

    .line 1015
    iget-object v12, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v12}, Ljavax/swing/JDesktopPane;->getDesktopManager()Ljavax/swing/DesktopManager;

    move-result-object v12

    move-object v13, v15

    move/from16 v18, v14

    .end local v14    # "w":I
    .local v18, "w":I
    move v14, v4

    move-object/from16 v19, v15

    .end local v15    # "f":Ljavax/swing/JInternalFrame;
    .local v19, "f":Ljavax/swing/JInternalFrame;
    move v15, v3

    move/from16 v16, v18

    move/from16 v17, v6

    invoke-interface/range {v12 .. v17}, Ljavax/swing/DesktopManager;->setBoundsForFrame(Ljavax/swing/JComponent;IIII)V

    .line 1005
    .end local v0    # "dimen":Ljava/awt/Dimension;
    .end local v19    # "f":Ljavax/swing/JInternalFrame;
    add-int/lit8 v7, v7, -0x1

    add-int/2addr v4, v5

    add-int/2addr v3, v5

    goto :goto_7

    .line 1017
    .end local v1    # "frames":[Ljavax/swing/JInternalFrame;
    .end local v2    # "count":I
    .end local v3    # "y":I
    .end local v4    # "x":I
    .end local v5    # "d":I
    .end local v6    # "h":I
    .end local v7    # "i":I
    .end local v18    # "w":I
    :cond_1c
    move-object/from16 v2, p1

    goto :goto_b

    .line 1018
    :cond_1d
    invoke-virtual {v8, v9}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-result-object v1

    .line 1019
    .local v1, "obj":Ljava/lang/Object;
    if-eqz v1, :cond_1f

    .line 1020
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 1022
    .local v2, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :try_start_3
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->isIcon()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 1023
    invoke-virtual {v2, v11}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setIcon(Z)V

    .line 1025
    :cond_1e
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setVisible(Z)V

    .line 1026
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->moveToFront()V

    .line 1027
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setSelected(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 1029
    move-object/from16 v2, p1

    goto :goto_b

    .line 1028
    :catch_3
    move-exception v0

    move-object/from16 v2, p1

    goto :goto_b

    .line 1019
    .end local v2    # "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :cond_1f
    move-object/from16 v2, p1

    goto :goto_b

    .line 887
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_20
    :goto_9
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getSelectedFrame()Ljavax/swing/JInternalFrame;

    move-result-object v0

    .line 888
    .local v0, "f":Ljavax/swing/JInternalFrame;
    if-eqz v0, :cond_21

    instance-of v1, v0, Ljava/awt/event/ActionListener;

    if-eqz v1, :cond_21

    .line 889
    move-object v1, v0

    check-cast v1, Ljava/awt/event/ActionListener;

    move-object/from16 v2, p1

    invoke-interface {v1, v2}, Ljava/awt/event/ActionListener;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    goto :goto_a

    .line 888
    :cond_21
    move-object/from16 v2, p1

    .line 891
    .end local v0    # "f":Ljavax/swing/JInternalFrame;
    :goto_a
    nop

    .line 1032
    :goto_b
    const/4 v0, -0x1

    if-eq v10, v0, :cond_22

    .line 1033
    invoke-direct {v8, v11}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->updateEnabled(Z)V

    .line 1034
    iget-object v0, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0, v10}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setReturnValue(I)V

    .line 1036
    :cond_22
    return-void
.end method

.method addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "frame"    # Ljavax/swing/JFrame;

    .line 262
    if-eq p2, p0, :cond_0

    .line 263
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->toplevels:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    :cond_0
    return-void
.end method

.method protected createFileWindow(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;I)V
    .locals 7
    .param p1, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .param p2, "line"    # I

    .line 562
    const/4 v0, 0x1

    .line 564
    .local v0, "activate":Z
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v1

    .line 565
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    invoke-direct {v2, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    .line 566
    .local v2, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    const/4 v3, -0x1

    if-eq p2, v3, :cond_1

    .line 568
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-eqz v4, :cond_0

    .line 569
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 572
    :cond_0
    :try_start_0
    iget-object v4, v2, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    add-int/lit8 v5, p2, -0x1

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 579
    goto :goto_0

    .line 573
    :catch_0
    move-exception v4

    .line 575
    .local v4, "exc":Ljavax/swing/text/BadLocationException;
    :try_start_1
    iget-object v5, v2, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V
    :try_end_1
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 578
    goto :goto_0

    .line 576
    :catch_1
    move-exception v5

    .line 577
    .local v5, "ee":Ljavax/swing/text/BadLocationException;
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setPosition(I)V

    .line 581
    .end local v4    # "exc":Ljavax/swing/text/BadLocationException;
    .end local v5    # "ee":Ljavax/swing/text/BadLocationException;
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->desk:Ljavax/swing/JDesktopPane;

    invoke-virtual {v4, v2}, Ljavax/swing/JDesktopPane;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 582
    if-eq p2, v3, :cond_2

    .line 583
    iput-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 585
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->addFile(Ljava/lang/String;)V

    .line 586
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setVisible(Z)V

    .line 588
    if-eqz v0, :cond_3

    .line 590
    :try_start_2
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setMaximum(Z)V

    .line 591
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setSelected(Z)V

    .line 592
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->moveToFront()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 594
    goto :goto_1

    .line 593
    :catch_2
    move-exception v3

    .line 596
    :cond_3
    :goto_1
    return-void
.end method

.method public dispatchNextGuiEvent()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 859
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->awtEventQueue:Ljava/awt/EventQueue;

    .line 860
    .local v0, "queue":Ljava/awt/EventQueue;
    if-nez v0, :cond_0

    .line 861
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v1

    invoke-virtual {v1}, Ljava/awt/Toolkit;->getSystemEventQueue()Ljava/awt/EventQueue;

    move-result-object v0

    .line 862
    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->awtEventQueue:Ljava/awt/EventQueue;

    .line 864
    :cond_0
    invoke-virtual {v0}, Ljava/awt/EventQueue;->getNextEvent()Ljava/awt/AWTEvent;

    move-result-object v1

    .line 865
    .local v1, "event":Ljava/awt/AWTEvent;
    instance-of v2, v1, Ljava/awt/ActiveEvent;

    if-eqz v2, :cond_1

    .line 866
    move-object v2, v1

    check-cast v2, Ljava/awt/ActiveEvent;

    invoke-interface {v2}, Ljava/awt/ActiveEvent;->dispatch()V

    goto :goto_1

    .line 868
    :cond_1
    invoke-virtual {v1}, Ljava/awt/AWTEvent;->getSource()Ljava/lang/Object;

    move-result-object v2

    .line 869
    .local v2, "source":Ljava/lang/Object;
    instance-of v3, v2, Ljava/awt/Component;

    if-eqz v3, :cond_2

    .line 870
    move-object v3, v2

    check-cast v3, Ljava/awt/Component;

    .line 871
    .local v3, "comp":Ljava/awt/Component;
    invoke-virtual {v3, v1}, Ljava/awt/Component;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .end local v3    # "comp":Ljava/awt/Component;
    goto :goto_0

    .line 872
    :cond_2
    instance-of v3, v2, Ljava/awt/MenuComponent;

    if-eqz v3, :cond_3

    .line 873
    move-object v3, v2

    check-cast v3, Ljava/awt/MenuComponent;

    invoke-virtual {v3, v1}, Ljava/awt/MenuComponent;->dispatchEvent(Ljava/awt/AWTEvent;)V

    goto :goto_1

    .line 872
    :cond_3
    :goto_0
    nop

    .line 876
    .end local v2    # "source":Ljava/lang/Object;
    :goto_1
    return-void
.end method

.method public enterInterrupt(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "lastFrame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p2, "threadTitle"    # Ljava/lang/String;
    .param p3, "alertMessage"    # Ljava/lang/String;

    .line 835
    invoke-static {}, Ljavax/swing/SwingUtilities;->isEventDispatchThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 836
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->enterInterruptImpl(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 838
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/tools/debugger/RunProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V

    .line 839
    .local v0, "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    iput-object p1, v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->lastFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 840
    iput-object p2, v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->threadTitle:Ljava/lang/String;

    .line 841
    iput-object p3, v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->alertMessage:Ljava/lang/String;

    .line 842
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 844
    .end local v0    # "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    :goto_0
    return-void
.end method

.method enterInterruptImpl(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "lastFrame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .param p2, "threadTitle"    # Ljava/lang/String;
    .param p3, "alertMessage"    # Ljava/lang/String;

    .line 660
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->statusBar:Ljavax/swing/JLabel;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thread: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/swing/JLabel;->setText(Ljava/lang/String;)V

    .line 662
    invoke-virtual/range {p0 .. p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showStopLine(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    .line 664
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 665
    const-string v3, "Exception in Script"

    invoke-static {v0, v1, v3, v2}, Lcom/trendmicro/hippo/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 671
    :cond_0
    const/4 v3, 0x1

    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->updateEnabled(Z)V

    .line 673
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->contextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v3

    .line 675
    .local v3, "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    iget-object v5, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iget-object v5, v5, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    .line 676
    .local v5, "ctx":Ljavax/swing/JComboBox;, "Ljavax/swing/JComboBox<Ljava/lang/String;>;"
    iget-object v6, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iget-object v6, v6, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    .line 677
    .local v6, "toolTips":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v7, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->disableUpdate()V

    .line 678
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v7

    .line 679
    .local v7, "frameCount":I
    invoke-virtual {v5}, Ljavax/swing/JComboBox;->removeAllItems()V

    .line 682
    const/4 v8, 0x0

    invoke-virtual {v5, v8}, Ljavax/swing/JComboBox;->setSelectedItem(Ljava/lang/Object;)V

    .line 683
    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 684
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v7, :cond_2

    .line 685
    invoke-virtual {v3, v8}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->getFrame(I)Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    move-result-object v9

    .line 686
    .local v9, "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->getUrl()Ljava/lang/String;

    move-result-object v10

    .line 687
    .local v10, "url":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->getLineNumber()I

    move-result v11

    .line 688
    .local v11, "lineNumber":I
    move-object v12, v10

    .line 689
    .local v12, "shortName":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0x14

    if-le v13, v14, :cond_1

    .line 690
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "..."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x11

    invoke-virtual {v10, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 692
    :cond_1
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "\", line "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 693
    .local v13, "location":Ljava/lang/String;
    invoke-virtual {v5, v13, v8}, Ljavax/swing/JComboBox;->insertItemAt(Ljava/lang/Object;I)V

    .line 694
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 695
    .end local v13    # "location":Ljava/lang/String;
    .local v2, "location":Ljava/lang/String;
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 684
    .end local v2    # "location":Ljava/lang/String;
    .end local v9    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .end local v10    # "url":Ljava/lang/String;
    .end local v11    # "lineNumber":I
    .end local v12    # "shortName":Ljava/lang/String;
    add-int/lit8 v8, v8, 0x1

    const/4 v2, 0x0

    goto :goto_0

    .line 697
    .end local v8    # "i":I
    :cond_2
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->enableUpdate()V

    .line 698
    const/4 v2, 0x0

    invoke-virtual {v5, v2}, Ljavax/swing/JComboBox;->setSelectedIndex(I)V

    .line 699
    new-instance v2, Ljava/awt/Dimension;

    const/16 v8, 0x32

    invoke-virtual {v5}, Ljavax/swing/JComboBox;->getMinimumSize()Ljava/awt/Dimension;

    move-result-object v9

    iget v9, v9, Ljava/awt/Dimension;->height:I

    invoke-direct {v2, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v5, v2}, Ljavax/swing/JComboBox;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 700
    return-void
.end method

.method public getConsole()Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    return-object v0
.end method

.method getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .line 409
    if-eqz p1, :cond_1

    const-string v0, "<stdin>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    return-object v0

    .line 410
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMenubar()Lcom/trendmicro/hippo/tools/debugger/Menubar;
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->menubar:Lcom/trendmicro/hippo/tools/debugger/Menubar;

    return-object v0
.end method

.method public isGuiEventThread()Z
    .locals 1

    .line 851
    invoke-static {}, Ljavax/swing/SwingUtilities;->isEventDispatchThread()Z

    move-result v0

    return v0
.end method

.method removeWindow(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V
    .locals 13
    .param p1, "w"    # Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 434
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->fileWindows:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getWindowMenu()Ljavax/swing/JMenu;

    move-result-object v0

    .line 436
    .local v0, "windowMenu":Ljavax/swing/JMenu;
    invoke-virtual {v0}, Ljavax/swing/JMenu;->getItemCount()I

    move-result v1

    .line 437
    .local v1, "count":I
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v2

    .line 438
    .local v2, "lastItem":Ljavax/swing/JMenuItem;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 439
    .local v3, "name":Ljava/lang/String;
    const/4 v4, 0x5

    .local v4, "i":I
    :goto_0
    if-ge v4, v1, :cond_7

    .line 440
    invoke-virtual {v0, v4}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v5

    .line 441
    .local v5, "item":Ljavax/swing/JMenuItem;
    if-nez v5, :cond_0

    goto/16 :goto_3

    .line 442
    :cond_0
    invoke-virtual {v5}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v6

    .line 445
    .local v6, "text":Ljava/lang/String;
    const/16 v7, 0x20

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 446
    .local v8, "pos":I
    add-int/lit8 v9, v8, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 447
    invoke-virtual {v0, v5}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    .line 453
    const/4 v9, 0x6

    if-ne v1, v9, :cond_1

    .line 455
    const/4 v7, 0x4

    invoke-virtual {v0, v7}, Ljavax/swing/JMenu;->remove(I)V

    goto :goto_4

    .line 457
    :cond_1
    add-int/lit8 v9, v4, -0x4

    .line 458
    .local v9, "j":I
    :goto_1
    add-int/lit8 v10, v1, -0x1

    const-string v11, "More Windows..."

    if-ge v4, v10, :cond_4

    .line 459
    invoke-virtual {v0, v4}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v10

    .line 460
    .local v10, "thisItem":Ljavax/swing/JMenuItem;
    if-eqz v10, :cond_3

    .line 463
    invoke-virtual {v10}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v6

    .line 464
    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 465
    goto :goto_2

    .line 467
    :cond_2
    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 468
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v12, v9, 0x30

    int-to-char v12, v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v12, v8, 0x1

    .line 469
    invoke-virtual {v6, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 468
    invoke-virtual {v10, v11}, Ljavax/swing/JMenuItem;->setText(Ljava/lang/String;)V

    .line 470
    add-int/lit8 v11, v9, 0x30

    invoke-virtual {v10, v11}, Ljavax/swing/JMenuItem;->setMnemonic(I)V

    .line 471
    add-int/lit8 v9, v9, 0x1

    .line 458
    .end local v10    # "thisItem":Ljavax/swing/JMenuItem;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 474
    :cond_4
    :goto_2
    add-int/lit8 v7, v1, -0x6

    if-nez v7, :cond_5

    if-eq v2, v5, :cond_5

    .line 475
    invoke-virtual {v2}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 476
    invoke-virtual {v0, v2}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    .line 480
    .end local v9    # "j":I
    :cond_5
    goto :goto_4

    .line 439
    .end local v5    # "item":Ljavax/swing/JMenuItem;
    .end local v6    # "text":Ljava/lang/String;
    .end local v8    # "pos":I
    :cond_6
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 483
    .end local v4    # "i":I
    :cond_7
    :goto_4
    invoke-virtual {v0}, Ljavax/swing/JMenu;->revalidate()V

    .line 484
    return-void
.end method

.method public setExitAction(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 228
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->exitAction:Ljava/lang/Runnable;

    .line 229
    return-void
.end method

.method public setVisible(Z)V
    .locals 3
    .param p1, "b"    # Z

    .line 243
    invoke-super {p0, p1}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 244
    if-eqz p1, :cond_0

    .line 246
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 247
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->context:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v0, v1, v2}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 249
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->setMaximum(Z)V

    .line 250
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->setSelected(Z)V

    .line 251
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->show()V

    .line 252
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->requestFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    goto :goto_0

    .line 253
    :catch_0
    move-exception v0

    .line 256
    :cond_0
    :goto_0
    return-void
.end method

.method protected showFileWindow(Ljava/lang/String;I)V
    .locals 5
    .param p1, "sourceUrl"    # Ljava/lang/String;
    .param p2, "lineNumber"    # I

    .line 514
    if-eqz p1, :cond_0

    .line 515
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-result-object v0

    .local v0, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    goto :goto_0

    .line 518
    .end local v0    # "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getSelectedFrame()Ljavax/swing/JInternalFrame;

    move-result-object v0

    .line 519
    .local v0, "f":Ljavax/swing/JInternalFrame;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    if-eqz v1, :cond_1

    .line 520
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-object v0, v1

    .local v1, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    goto :goto_0

    .line 523
    .end local v1    # "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->currentWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-object v0, v1

    .line 526
    .local v0, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :goto_0
    const/4 v1, -0x1

    if-nez v0, :cond_2

    if-eqz p1, :cond_2

    .line 527
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->sourceInfo(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v2

    .line 528
    .local v2, "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    invoke-virtual {p0, v2, v1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->createFileWindow(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;I)V

    .line 529
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-result-object v0

    .line 531
    .end local v2    # "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    :cond_2
    if-nez v0, :cond_3

    .line 532
    return-void

    .line 534
    :cond_3
    const/4 v2, 0x1

    if-le p2, v1, :cond_5

    .line 535
    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getPosition(I)I

    move-result v1

    .line 536
    .local v1, "start":I
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->getPosition(I)I

    move-result v3

    sub-int/2addr v3, v2

    .line 537
    .local v3, "end":I
    if-gtz v1, :cond_4

    .line 538
    return-void

    .line 540
    :cond_4
    iget-object v4, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(I)V

    .line 541
    iget-object v4, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v4, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->setCaretPosition(I)V

    .line 542
    iget-object v4, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->moveCaretPosition(I)V

    .line 545
    .end local v1    # "start":I
    .end local v3    # "end":I
    :cond_5
    :try_start_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->isIcon()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 546
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setIcon(Z)V

    .line 548
    :cond_6
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setVisible(Z)V

    .line 549
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->moveToFront()V

    .line 550
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setSelected(Z)V

    .line 551
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->requestFocus()V

    .line 552
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->requestFocus()V

    .line 553
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->requestFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 555
    goto :goto_1

    .line 554
    :catch_0
    move-exception v1

    .line 556
    :goto_1
    return-void
.end method

.method showStopLine(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V
    .locals 3
    .param p1, "frame"    # Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    .line 490
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 491
    .local v0, "sourceName":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v1, "<stdin>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 496
    :cond_0
    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    .line 497
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->getLineNumber()I

    move-result v1

    .line 498
    .local v1, "lineNumber":I
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-result-object v2

    .line 499
    .local v2, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    if-eqz v2, :cond_2

    .line 500
    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setFilePosition(Lcom/trendmicro/hippo/tools/debugger/FileWindow;I)V

    goto :goto_1

    .line 492
    .end local v1    # "lineNumber":I
    .end local v2    # "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 493
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->console:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->show()V

    .line 503
    :cond_2
    :goto_1
    return-void
.end method

.method protected updateFileWindow(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)Z
    .locals 3
    .param p1, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 607
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    .line 608
    .local v0, "fileName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getFileWindow(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-result-object v1

    .line 609
    .local v1, "w":Lcom/trendmicro/hippo/tools/debugger/FileWindow;
    if-eqz v1, :cond_0

    .line 610
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->updateText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V

    .line 611
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->show()V

    .line 612
    const/4 v2, 0x1

    return v2

    .line 614
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public updateSourceText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
    .locals 2
    .param p1, "sourceInfo"    # Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 823
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/tools/debugger/RunProxy;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V

    .line 824
    .local v0, "proxy":Lcom/trendmicro/hippo/tools/debugger/RunProxy;
    iput-object p1, v0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    .line 825
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 826
    return-void
.end method
