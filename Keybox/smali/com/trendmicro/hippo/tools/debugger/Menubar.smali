.class Lcom/trendmicro/hippo/tools/debugger/Menubar;
.super Ljavax/swing/JMenuBar;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = 0x2ca5af859e3599a5L


# instance fields
.field private breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

.field private breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

.field private breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private interruptOnlyItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljavax/swing/JMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private runOnlyItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljavax/swing/JMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private windowMenu:Ljavax/swing/JMenu;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 23
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3369
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljavax/swing/JMenuBar;-><init>()V

    .line 3331
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3332
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    .line 3337
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3338
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    .line 3370
    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3371
    const-string v2, "Open..."

    const-string v3, "Run..."

    const-string v4, ""

    const-string v5, "Exit"

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    .line 3372
    .local v2, "fileItems":[Ljava/lang/String;
    const-string v3, "Open"

    const-string v6, "Load"

    filled-new-array {v3, v6, v4, v5}, [Ljava/lang/String;

    move-result-object v3

    .line 3373
    .local v3, "fileCmds":[Ljava/lang/String;
    const/4 v4, 0x4

    new-array v5, v4, [C

    fill-array-data v5, :array_0

    .line 3374
    .local v5, "fileShortCuts":[C
    new-array v4, v4, [I

    fill-array-data v4, :array_1

    .line 3378
    .local v4, "fileAccelerators":[I
    const-string v6, "Cut"

    const-string v7, "Copy"

    const-string v8, "Paste"

    const-string v9, "Go to function..."

    const-string v10, "Go to line..."

    filled-new-array {v6, v7, v8, v9, v10}, [Ljava/lang/String;

    move-result-object v6

    .line 3379
    .local v6, "editItems":[Ljava/lang/String;
    const/4 v7, 0x5

    new-array v8, v7, [C

    fill-array-data v8, :array_2

    .line 3380
    .local v8, "editShortCuts":[C
    new-array v9, v7, [I

    fill-array-data v9, :array_3

    .line 3381
    .local v9, "editAccelerators":[I
    const-string v10, "Break"

    const-string v11, "Go"

    const-string v12, "Step Into"

    const-string v13, "Step Over"

    const-string v14, "Step Out"

    filled-new-array {v10, v11, v12, v13, v14}, [Ljava/lang/String;

    move-result-object v10

    .line 3382
    .local v10, "debugItems":[Ljava/lang/String;
    new-array v7, v7, [C

    fill-array-data v7, :array_4

    .line 3383
    .local v7, "debugShortCuts":[C
    const-string v11, "Metal"

    const-string v12, "Windows"

    const-string v13, "Motif"

    filled-new-array {v11, v12, v13}, [Ljava/lang/String;

    move-result-object v11

    .line 3384
    .local v11, "plafItems":[Ljava/lang/String;
    const/4 v12, 0x3

    new-array v12, v12, [C

    fill-array-data v12, :array_5

    .line 3385
    .local v12, "plafShortCuts":[C
    const/4 v13, 0x7

    new-array v13, v13, [I

    fill-array-data v13, :array_6

    .line 3392
    .local v13, "debugAccelerators":[I
    new-instance v14, Ljavax/swing/JMenu;

    const-string v15, "File"

    invoke-direct {v14, v15}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 3393
    .local v14, "fileMenu":Ljavax/swing/JMenu;
    const/16 v15, 0x46

    invoke-virtual {v14, v15}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3394
    new-instance v15, Ljavax/swing/JMenu;

    const-string v1, "Edit"

    invoke-direct {v15, v1}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    move-object v1, v15

    .line 3395
    .local v1, "editMenu":Ljavax/swing/JMenu;
    const/16 v15, 0x45

    invoke-virtual {v1, v15}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3396
    new-instance v15, Ljavax/swing/JMenu;

    move-object/from16 v17, v13

    .end local v13    # "debugAccelerators":[I
    .local v17, "debugAccelerators":[I
    const-string v13, "Platform"

    invoke-direct {v15, v13}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    move-object v13, v15

    .line 3397
    .local v13, "plafMenu":Ljavax/swing/JMenu;
    const/16 v15, 0x50

    invoke-virtual {v13, v15}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3398
    new-instance v15, Ljavax/swing/JMenu;

    move-object/from16 v18, v7

    .end local v7    # "debugShortCuts":[C
    .local v18, "debugShortCuts":[C
    const-string v7, "Debug"

    invoke-direct {v15, v7}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    move-object v7, v15

    .line 3399
    .local v7, "debugMenu":Ljavax/swing/JMenu;
    const/16 v15, 0x44

    invoke-virtual {v7, v15}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3400
    new-instance v15, Ljavax/swing/JMenu;

    move-object/from16 v19, v7

    .end local v7    # "debugMenu":Ljavax/swing/JMenu;
    .local v19, "debugMenu":Ljavax/swing/JMenu;
    const-string v7, "Window"

    invoke-direct {v15, v7}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    iput-object v15, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    .line 3401
    const/16 v7, 0x57

    invoke-virtual {v15, v7}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 3402
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    array-length v15, v2

    move-object/from16 v20, v10

    .end local v10    # "debugItems":[Ljava/lang/String;
    .local v20, "debugItems":[Ljava/lang/String;
    if-ge v7, v15, :cond_2

    .line 3403
    aget-object v15, v2, v7

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    if-nez v15, :cond_0

    .line 3404
    invoke-virtual {v14}, Ljavax/swing/JMenu;->addSeparator()V

    move-object/from16 v22, v2

    goto :goto_1

    .line 3406
    :cond_0
    new-instance v15, Ljavax/swing/JMenuItem;

    aget-object v10, v2, v7

    move-object/from16 v22, v2

    .end local v2    # "fileItems":[Ljava/lang/String;
    .local v22, "fileItems":[Ljava/lang/String;
    aget-char v2, v5, v7

    invoke-direct {v15, v10, v2}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v2, v15

    .line 3408
    .local v2, "item":Ljavax/swing/JMenuItem;
    aget-object v10, v3, v7

    invoke-virtual {v2, v10}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3409
    invoke-virtual {v2, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3410
    invoke-virtual {v14, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3411
    aget v10, v4, v7

    if-eqz v10, :cond_1

    .line 3412
    aget v10, v4, v7

    const/4 v15, 0x2

    invoke-static {v10, v15}, Ljavax/swing/KeyStroke;->getKeyStroke(II)Ljavax/swing/KeyStroke;

    move-result-object v10

    .line 3413
    .local v10, "k":Ljavax/swing/KeyStroke;
    invoke-virtual {v2, v10}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 3402
    .end local v2    # "item":Ljavax/swing/JMenuItem;
    .end local v10    # "k":Ljavax/swing/KeyStroke;
    :cond_1
    :goto_1
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v10, v20

    move-object/from16 v2, v22

    goto :goto_0

    .end local v22    # "fileItems":[Ljava/lang/String;
    .local v2, "fileItems":[Ljava/lang/String;
    :cond_2
    move-object/from16 v22, v2

    .line 3417
    .end local v2    # "fileItems":[Ljava/lang/String;
    .end local v7    # "i":I
    .restart local v22    # "fileItems":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v7, v6

    if-ge v2, v7, :cond_4

    .line 3418
    new-instance v7, Ljavax/swing/JMenuItem;

    aget-object v10, v6, v2

    aget-char v15, v8, v2

    invoke-direct {v7, v10, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3420
    .local v7, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v7, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3421
    invoke-virtual {v1, v7}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3422
    aget v10, v9, v2

    if-eqz v10, :cond_3

    .line 3423
    aget v10, v9, v2

    const/4 v15, 0x2

    invoke-static {v10, v15}, Ljavax/swing/KeyStroke;->getKeyStroke(II)Ljavax/swing/KeyStroke;

    move-result-object v10

    .line 3424
    .restart local v10    # "k":Ljavax/swing/KeyStroke;
    invoke-virtual {v7, v10}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    goto :goto_3

    .line 3422
    .end local v10    # "k":Ljavax/swing/KeyStroke;
    :cond_3
    const/4 v15, 0x2

    .line 3417
    .end local v7    # "item":Ljavax/swing/JMenuItem;
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3427
    .end local v2    # "i":I
    :cond_4
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_4
    array-length v7, v11

    if-ge v2, v7, :cond_5

    .line 3428
    new-instance v7, Ljavax/swing/JMenuItem;

    aget-object v10, v11, v2

    aget-char v15, v12, v2

    invoke-direct {v7, v10, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 3430
    .restart local v7    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v7, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3431
    invoke-virtual {v13, v7}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3427
    .end local v7    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 3433
    .end local v2    # "i":I
    :cond_5
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_5
    move-object/from16 v7, v20

    .end local v20    # "debugItems":[Ljava/lang/String;
    .local v7, "debugItems":[Ljava/lang/String;
    array-length v10, v7

    if-ge v2, v10, :cond_8

    .line 3434
    new-instance v10, Ljavax/swing/JMenuItem;

    aget-object v15, v7, v2

    move-object/from16 v21, v3

    .end local v3    # "fileCmds":[Ljava/lang/String;
    .local v21, "fileCmds":[Ljava/lang/String;
    aget-char v3, v18, v2

    invoke-direct {v10, v15, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v3, v10

    .line 3436
    .local v3, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v3, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3437
    aget v10, v17, v2

    if-eqz v10, :cond_6

    .line 3438
    aget v10, v17, v2

    const/4 v15, 0x0

    invoke-static {v10, v15}, Ljavax/swing/KeyStroke;->getKeyStroke(II)Ljavax/swing/KeyStroke;

    move-result-object v10

    .line 3439
    .restart local v10    # "k":Ljavax/swing/KeyStroke;
    invoke-virtual {v3, v10}, Ljavax/swing/JMenuItem;->setAccelerator(Ljavax/swing/KeyStroke;)V

    .line 3441
    .end local v10    # "k":Ljavax/swing/KeyStroke;
    :cond_6
    if-eqz v2, :cond_7

    .line 3442
    iget-object v10, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 3444
    :cond_7
    iget-object v10, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3446
    :goto_6
    move-object/from16 v10, v19

    .end local v19    # "debugMenu":Ljavax/swing/JMenu;
    .local v10, "debugMenu":Ljavax/swing/JMenu;
    invoke-virtual {v10, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3433
    .end local v3    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v20, v7

    move-object/from16 v3, v21

    goto :goto_5

    .end local v10    # "debugMenu":Ljavax/swing/JMenu;
    .end local v21    # "fileCmds":[Ljava/lang/String;
    .local v3, "fileCmds":[Ljava/lang/String;
    .restart local v19    # "debugMenu":Ljavax/swing/JMenu;
    :cond_8
    move-object/from16 v21, v3

    move-object/from16 v10, v19

    .line 3448
    .end local v2    # "i":I
    .end local v3    # "fileCmds":[Ljava/lang/String;
    .end local v19    # "debugMenu":Ljavax/swing/JMenu;
    .restart local v10    # "debugMenu":Ljavax/swing/JMenu;
    .restart local v21    # "fileCmds":[Ljava/lang/String;
    new-instance v2, Ljavax/swing/JCheckBoxMenuItem;

    const-string v3, "Break on Exceptions"

    invoke-direct {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    .line 3449
    const/16 v3, 0x58

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3450
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v2, v0}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3451
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3452
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v10, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3454
    new-instance v2, Ljavax/swing/JCheckBoxMenuItem;

    const-string v3, "Break on Function Enter"

    invoke-direct {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    .line 3455
    const/16 v3, 0x45

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3456
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v2, v0}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3457
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3458
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v10, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3460
    new-instance v2, Ljavax/swing/JCheckBoxMenuItem;

    const-string v3, "Break on Function Return"

    invoke-direct {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    .line 3461
    const/16 v3, 0x52

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setMnemonic(C)V

    .line 3462
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v2, v0}, Ljavax/swing/JCheckBoxMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3463
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/swing/JCheckBoxMenuItem;->setSelected(Z)V

    .line 3464
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v10, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3466
    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3467
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3469
    invoke-virtual {v0, v10}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3471
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v3, Ljavax/swing/JMenuItem;

    const/16 v15, 0x41

    move-object/from16 v16, v1

    .end local v1    # "editMenu":Ljavax/swing/JMenu;
    .local v16, "editMenu":Ljavax/swing/JMenu;
    const-string v1, "Cascade"

    invoke-direct {v3, v1, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v1, v3

    .local v1, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v2, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3472
    invoke-virtual {v1, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3473
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v3, Ljavax/swing/JMenuItem;

    const/16 v15, 0x54

    move-object/from16 v19, v1

    .end local v1    # "item":Ljavax/swing/JMenuItem;
    .local v19, "item":Ljavax/swing/JMenuItem;
    const-string v1, "Tile"

    invoke-direct {v3, v1, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v1, v3

    .end local v19    # "item":Ljavax/swing/JMenuItem;
    .restart local v1    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v2, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3474
    invoke-virtual {v1, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3475
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v2}, Ljavax/swing/JMenu;->addSeparator()V

    .line 3476
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v3, Ljavax/swing/JMenuItem;

    const/16 v15, 0x43

    move-object/from16 v19, v1

    .end local v1    # "item":Ljavax/swing/JMenuItem;
    .restart local v19    # "item":Ljavax/swing/JMenuItem;
    const-string v1, "Console"

    invoke-direct {v3, v1, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v1, v3

    .end local v19    # "item":Ljavax/swing/JMenuItem;
    .restart local v1    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v2, v3}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3477
    invoke-virtual {v1, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3478
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 3480
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->updateEnabled(Z)V

    .line 3481
    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x4es
        0x0s
        0x58s
    .end array-data

    :array_1
    .array-data 4
        0x4f
        0x4e
        0x0
        0x51
    .end array-data

    :array_2
    .array-data 2
        0x54s
        0x43s
        0x50s
        0x46s
        0x4cs
    .end array-data

    nop

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x4c
    .end array-data

    :array_4
    .array-data 2
        0x42s
        0x47s
        0x49s
        0x4fs
        0x54s
    .end array-data

    nop

    :array_5
    .array-data 2
        0x4ds
        0x57s
        0x46s
    .end array-data

    nop

    :array_6
    .array-data 4
        0x13
        0x74
        0x7a
        0x76
        0x77
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 3518
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 3519
    .local v0, "cmd":Ljava/lang/String;
    const/4 v1, 0x0

    .line 3520
    .local v1, "plaf_name":Ljava/lang/String;
    const-string v2, "Metal"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3521
    const-string v1, "javax.swing.plaf.metal.MetalLookAndFeel"

    goto :goto_0

    .line 3522
    :cond_0
    const-string v2, "Windows"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3523
    const-string v1, "com.sun.java.swing.plaf.windows.WindowsLookAndFeel"

    goto :goto_0

    .line 3524
    :cond_1
    const-string v2, "Motif"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3525
    const-string v1, "com.sun.java.swing.plaf.motif.MotifLookAndFeel"

    .line 3540
    :goto_0
    :try_start_0
    invoke-static {v1}, Ljavax/swing/UIManager;->setLookAndFeel(Ljava/lang/String;)V

    .line 3541
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-static {v2}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V

    .line 3542
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v2, v2, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dlg:Ljavax/swing/JFileChooser;

    invoke-static {v2}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3545
    goto :goto_1

    .line 3543
    :catch_0
    move-exception v2

    .line 3546
    :goto_1
    return-void

    .line 3527
    :cond_2
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getSource()Ljava/lang/Object;

    move-result-object v2

    .line 3528
    .local v2, "source":Ljava/lang/Object;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_3

    .line 3529
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v3, v3, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnExceptions(Z)V

    goto :goto_2

    .line 3530
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_4

    .line 3531
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v3, v3, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnEnter(Z)V

    goto :goto_2

    .line 3532
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    if-ne v2, v3, :cond_5

    .line 3533
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v3, v3, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    invoke-virtual {v4}, Ljavax/swing/JCheckBoxMenuItem;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/Dim;->setBreakOnReturn(Z)V

    goto :goto_2

    .line 3535
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->actionPerformed(Ljava/awt/event/ActionEvent;)V

    .line 3537
    :goto_2
    return-void
.end method

.method public addFile(Ljava/lang/String;)V
    .locals 9
    .param p1, "url"    # Ljava/lang/String;

    .line 3552
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v0}, Ljavax/swing/JMenu;->getItemCount()I

    move-result v0

    .line 3554
    .local v0, "count":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 3555
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v1}, Ljavax/swing/JMenu;->addSeparator()V

    .line 3556
    add-int/lit8 v0, v0, 0x1

    .line 3558
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljavax/swing/JMenu;->getItem(I)Ljavax/swing/JMenuItem;

    move-result-object v1

    .line 3559
    .local v1, "lastItem":Ljavax/swing/JMenuItem;
    const/4 v2, 0x0

    .line 3560
    .local v2, "hasMoreWin":Z
    const/4 v3, 0x5

    .line 3561
    .local v3, "maxWin":I
    const-string v4, "More Windows..."

    if-eqz v1, :cond_1

    .line 3562
    invoke-virtual {v1}, Ljavax/swing/JMenuItem;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3563
    const/4 v2, 0x1

    .line 3564
    add-int/lit8 v3, v3, 0x1

    .line 3566
    :cond_1
    if-nez v2, :cond_2

    add-int/lit8 v5, v0, -0x4

    const/4 v6, 0x5

    if-ne v5, v6, :cond_2

    .line 3567
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v6, Ljavax/swing/JMenuItem;

    const/16 v7, 0x4d

    invoke-direct {v6, v4, v7}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v7, v6

    .local v7, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v5, v6}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3568
    invoke-virtual {v7, v4}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3569
    invoke-virtual {v7, p0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3570
    return-void

    .line 3571
    .end local v7    # "item":Ljavax/swing/JMenuItem;
    :cond_2
    add-int/lit8 v4, v0, -0x4

    if-gt v4, v3, :cond_5

    .line 3572
    if-eqz v2, :cond_3

    .line 3573
    add-int/lit8 v0, v0, -0x1

    .line 3574
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v4, v1}, Ljavax/swing/JMenu;->remove(Ljavax/swing/JMenuItem;)V

    .line 3576
    :cond_3
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3578
    .local v4, "shortName":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    new-instance v6, Ljavax/swing/JMenuItem;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v8, v0, -0x4

    add-int/lit8 v8, v8, 0x30

    int-to-char v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v0, -0x4

    add-int/lit8 v8, v8, 0x30

    invoke-direct {v6, v7, v8}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v7, v6

    .restart local v7    # "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v5, v6}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3579
    if-eqz v2, :cond_4

    .line 3580
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->windowMenu:Ljavax/swing/JMenu;

    invoke-virtual {v5, v1}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 3582
    .end local v4    # "shortName":Ljava/lang/String;
    :cond_4
    nop

    .line 3585
    invoke-virtual {v7, p1}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 3586
    invoke-virtual {v7, p0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3587
    return-void

    .line 3583
    .end local v7    # "item":Ljavax/swing/JMenuItem;
    :cond_5
    return-void
.end method

.method public getBreakOnEnter()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .line 3494
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnEnter:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getBreakOnExceptions()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .line 3487
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnExceptions:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getBreakOnReturn()Ljavax/swing/JCheckBoxMenuItem;
    .locals 1

    .line 3501
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->breakOnReturn:Ljavax/swing/JCheckBoxMenuItem;

    return-object v0
.end method

.method public getDebugMenu()Ljavax/swing/JMenu;
    .locals 1

    .line 3508
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/Menubar;->getMenu(I)Ljavax/swing/JMenu;

    move-result-object v0

    return-object v0
.end method

.method public updateEnabled(Z)V
    .locals 3
    .param p1, "interrupted"    # Z

    .line 3593
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 3594
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->interruptOnlyItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/swing/JMenuItem;

    .line 3595
    .local v1, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v1, p1}, Ljavax/swing/JMenuItem;->setEnabled(Z)V

    .line 3593
    .end local v1    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3598
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 3599
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/Menubar;->runOnlyItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/swing/JMenuItem;

    .line 3600
    .restart local v1    # "item":Ljavax/swing/JMenuItem;
    xor-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljavax/swing/JMenuItem;->setEnabled(Z)V

    .line 3598
    .end local v1    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3602
    .end local v0    # "i":I
    :cond_1
    return-void
.end method
