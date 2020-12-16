.class public Lcom/trendmicro/hippo/tools/shell/JSConsole;
.super Ljavax/swing/JFrame;
.source "JSConsole.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field static final serialVersionUID:J = 0x2367c621635c1accL


# instance fields
.field private CWD:Ljava/io/File;

.field private consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

.field private dlg:Ljavax/swing/JFileChooser;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .locals 17
    .param p1, "args"    # [Ljava/lang/String;

    .line 89
    move-object/from16 v0, p0

    const-string v1, "Console"

    invoke-direct {v0, v1}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    .line 90
    new-instance v1, Ljavax/swing/JMenuBar;

    invoke-direct {v1}, Ljavax/swing/JMenuBar;-><init>()V

    .line 91
    .local v1, "menubar":Ljavax/swing/JMenuBar;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->createFileChooser()V

    .line 92
    const-string v2, "Load..."

    const-string v3, "Exit"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "fileItems":[Ljava/lang/String;
    const-string v4, "Load"

    filled-new-array {v4, v3}, [Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, "fileCmds":[Ljava/lang/String;
    const/4 v4, 0x2

    new-array v4, v4, [C

    fill-array-data v4, :array_0

    .line 95
    .local v4, "fileShortCuts":[C
    const-string v5, "Cut"

    const-string v6, "Copy"

    const-string v7, "Paste"

    filled-new-array {v5, v6, v7}, [Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, "editItems":[Ljava/lang/String;
    const/4 v6, 0x3

    new-array v7, v6, [C

    fill-array-data v7, :array_1

    .line 97
    .local v7, "editShortCuts":[C
    const-string v8, "Metal"

    const-string v9, "Windows"

    const-string v10, "Motif"

    filled-new-array {v8, v9, v10}, [Ljava/lang/String;

    move-result-object v8

    .line 98
    .local v8, "plafItems":[Ljava/lang/String;
    new-array v6, v6, [Z

    fill-array-data v6, :array_2

    .line 99
    .local v6, "plafState":[Z
    new-instance v9, Ljavax/swing/JMenu;

    const-string v10, "File"

    invoke-direct {v9, v10}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 100
    .local v9, "fileMenu":Ljavax/swing/JMenu;
    const/16 v10, 0x46

    invoke-virtual {v9, v10}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 101
    new-instance v10, Ljavax/swing/JMenu;

    const-string v11, "Edit"

    invoke-direct {v10, v11}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 102
    .local v10, "editMenu":Ljavax/swing/JMenu;
    const/16 v11, 0x45

    invoke-virtual {v10, v11}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 103
    new-instance v11, Ljavax/swing/JMenu;

    const-string v12, "Platform"

    invoke-direct {v11, v12}, Ljavax/swing/JMenu;-><init>(Ljava/lang/String;)V

    .line 104
    .local v11, "plafMenu":Ljavax/swing/JMenu;
    const/16 v12, 0x50

    invoke-virtual {v11, v12}, Ljavax/swing/JMenu;->setMnemonic(C)V

    .line 105
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    array-length v14, v2

    if-ge v13, v14, :cond_0

    .line 106
    new-instance v14, Ljavax/swing/JMenuItem;

    aget-object v15, v2, v13

    aget-char v12, v4, v13

    invoke-direct {v14, v15, v12}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    move-object v12, v14

    .line 108
    .local v12, "item":Ljavax/swing/JMenuItem;
    aget-object v14, v3, v13

    invoke-virtual {v12, v14}, Ljavax/swing/JMenuItem;->setActionCommand(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v12, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 110
    invoke-virtual {v9, v12}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 105
    .end local v12    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v13, v13, 0x1

    const/16 v12, 0x50

    goto :goto_0

    .line 112
    .end local v13    # "i":I
    :cond_0
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    array-length v13, v5

    if-ge v12, v13, :cond_1

    .line 113
    new-instance v13, Ljavax/swing/JMenuItem;

    aget-object v14, v5, v12

    aget-char v15, v7, v12

    invoke-direct {v13, v14, v15}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;I)V

    .line 115
    .local v13, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {v13, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 116
    invoke-virtual {v10, v13}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 112
    .end local v13    # "item":Ljavax/swing/JMenuItem;
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 118
    .end local v12    # "i":I
    :cond_1
    new-instance v12, Ljavax/swing/ButtonGroup;

    invoke-direct {v12}, Ljavax/swing/ButtonGroup;-><init>()V

    .line 119
    .local v12, "group":Ljavax/swing/ButtonGroup;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_2
    array-length v14, v8

    if-ge v13, v14, :cond_2

    .line 120
    new-instance v14, Ljavax/swing/JRadioButtonMenuItem;

    aget-object v15, v8, v13

    move-object/from16 v16, v2

    .end local v2    # "fileItems":[Ljava/lang/String;
    .local v16, "fileItems":[Ljava/lang/String;
    aget-boolean v2, v6, v13

    invoke-direct {v14, v15, v2}, Ljavax/swing/JRadioButtonMenuItem;-><init>(Ljava/lang/String;Z)V

    move-object v2, v14

    .line 122
    .local v2, "item":Ljavax/swing/JRadioButtonMenuItem;
    invoke-virtual {v12, v2}, Ljavax/swing/ButtonGroup;->add(Ljavax/swing/AbstractButton;)V

    .line 123
    invoke-virtual {v2, v0}, Ljavax/swing/JRadioButtonMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 124
    invoke-virtual {v11, v2}, Ljavax/swing/JMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 119
    .end local v2    # "item":Ljavax/swing/JRadioButtonMenuItem;
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v2, v16

    goto :goto_2

    .end local v16    # "fileItems":[Ljava/lang/String;
    .local v2, "fileItems":[Ljava/lang/String;
    :cond_2
    move-object/from16 v16, v2

    .line 126
    .end local v2    # "fileItems":[Ljava/lang/String;
    .end local v13    # "i":I
    .restart local v16    # "fileItems":[Ljava/lang/String;
    invoke-virtual {v1, v9}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 127
    invoke-virtual {v1, v10}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 128
    invoke-virtual {v1, v11}, Ljavax/swing/JMenuBar;->add(Ljavax/swing/JMenu;)Ljavax/swing/JMenu;

    .line 129
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->setJMenuBar(Ljavax/swing/JMenuBar;)V

    .line 130
    new-instance v2, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    move-object/from16 v13, p1

    invoke-direct {v2, v13}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;-><init>([Ljava/lang/String;)V

    iput-object v2, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    .line 131
    new-instance v2, Ljavax/swing/JScrollPane;

    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-direct {v2, v14}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 132
    .local v2, "scroller":Ljavax/swing/JScrollPane;
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->setContentPane(Ljava/awt/Container;)V

    .line 133
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    const/16 v15, 0x18

    invoke-virtual {v14, v15}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setRows(I)V

    .line 134
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    const/16 v15, 0x50

    invoke-virtual {v14, v15}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setColumns(I)V

    .line 135
    new-instance v14, Lcom/trendmicro/hippo/tools/shell/JSConsole$2;

    invoke-direct {v14, v0}, Lcom/trendmicro/hippo/tools/shell/JSConsole$2;-><init>(Lcom/trendmicro/hippo/tools/shell/JSConsole;)V

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->pack()V

    .line 142
    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->setVisible(Z)V

    .line 146
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v14}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getIn()Ljava/io/InputStream;

    move-result-object v14

    invoke-static {v14}, Lcom/trendmicro/hippo/tools/shell/Main;->setIn(Ljava/io/InputStream;)V

    .line 147
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v14}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getOut()Ljava/io/PrintStream;

    move-result-object v14

    invoke-static {v14}, Lcom/trendmicro/hippo/tools/shell/Main;->setOut(Ljava/io/PrintStream;)V

    .line 148
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v14}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getErr()Ljava/io/PrintStream;

    move-result-object v14

    invoke-static {v14}, Lcom/trendmicro/hippo/tools/shell/Main;->setErr(Ljava/io/PrintStream;)V

    .line 149
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/tools/shell/Main;->main([Ljava/lang/String;)V

    .line 150
    return-void

    :array_0
    .array-data 2
        0x4cs
        0x58s
    .end array-data

    :array_1
    .array-data 2
        0x54s
        0x43s
        0x50s
    .end array-data

    nop

    :array_2
    .array-data 1
        0x1t
        0x0t
        0x0t
    .end array-data
.end method

.method public static main([Ljava/lang/String;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .line 56
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JSConsole;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole;-><init>([Ljava/lang/String;)V

    .line 57
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 6
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 153
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "cmd":Ljava/lang/String;
    const/4 v1, 0x0

    .line 155
    .local v1, "plaf_name":Ljava/lang/String;
    const-string v2, "Load"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 156
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->chooseFile()Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "f":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 158
    const/16 v3, 0x5c

    const/16 v4, 0x2f

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 159
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "load(\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\");"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->eval(Ljava/lang/String;)V

    .line 161
    .end local v2    # "f":Ljava/lang/String;
    :cond_0
    goto/16 :goto_1

    :cond_1
    const-string v2, "Exit"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 162
    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    goto :goto_1

    .line 163
    :cond_2
    const-string v2, "Cut"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 164
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->cut()V

    goto :goto_1

    .line 165
    :cond_3
    const-string v2, "Copy"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 166
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->copy()V

    goto :goto_1

    .line 167
    :cond_4
    const-string v2, "Paste"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 168
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->paste()V

    goto :goto_1

    .line 170
    :cond_5
    const-string v2, "Metal"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 171
    const-string v1, "javax.swing.plaf.metal.MetalLookAndFeel"

    goto :goto_0

    .line 172
    :cond_6
    const-string v2, "Windows"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 173
    const-string v1, "com.sun.java.swing.plaf.windows.WindowsLookAndFeel"

    goto :goto_0

    .line 174
    :cond_7
    const-string v2, "Motif"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 175
    const-string v1, "com.sun.java.swing.plaf.motif.MotifLookAndFeel"

    .line 177
    :cond_8
    :goto_0
    if-eqz v1, :cond_9

    .line 179
    :try_start_0
    invoke-static {v1}, Ljavax/swing/UIManager;->setLookAndFeel(Ljava/lang/String;)V

    .line 180
    invoke-static {p0}, Ljavax/swing/SwingUtilities;->updateComponentTreeUI(Ljava/awt/Component;)V

    .line 181
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->postUpdateUI()V

    .line 184
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole;->createFileChooser()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    goto :goto_1

    .line 185
    :catch_0
    move-exception v2

    .line 186
    .local v2, "exc":Ljava/lang/Exception;
    nop

    .line 187
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 186
    const-string v5, "Platform"

    invoke-static {p0, v4, v5, v3}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 194
    .end local v2    # "exc":Ljava/lang/Exception;
    :cond_9
    :goto_1
    return-void
.end method

.method public chooseFile()Ljava/lang/String;
    .locals 4

    .line 36
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->CWD:Ljava/io/File;

    if-nez v0, :cond_0

    .line 37
    const-string v0, "user.dir"

    invoke-static {v0}, Lcom/trendmicro/hippo/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "dir":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 39
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->CWD:Ljava/io/File;

    .line 42
    .end local v0    # "dir":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->CWD:Ljava/io/File;

    if-eqz v0, :cond_1

    .line 43
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v1, v0}, Ljavax/swing/JFileChooser;->setCurrentDirectory(Ljava/io/File;)V

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    const-string v1, "Select a file to load"

    invoke-virtual {v0, v1}, Ljavax/swing/JFileChooser;->setDialogTitle(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v0, p0}, Ljavax/swing/JFileChooser;->showOpenDialog(Ljava/awt/Component;)I

    move-result v0

    .line 47
    .local v0, "returnVal":I
    if-nez v0, :cond_2

    .line 48
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v1}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "result":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v3}, Ljavax/swing/JFileChooser;->getSelectedFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->CWD:Ljava/io/File;

    .line 50
    return-object v1

    .line 52
    .end local v1    # "result":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method public createFileChooser()V
    .locals 2

    .line 60
    new-instance v0, Ljavax/swing/JFileChooser;

    invoke-direct {v0}, Ljavax/swing/JFileChooser;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    .line 61
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/JSConsole$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/shell/JSConsole$1;-><init>(Lcom/trendmicro/hippo/tools/shell/JSConsole;)V

    .line 84
    .local v0, "filter":Ljavax/swing/filechooser/FileFilter;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/JSConsole;->dlg:Ljavax/swing/JFileChooser;

    invoke-virtual {v1, v0}, Ljavax/swing/JFileChooser;->addChoosableFileFilter(Ljavax/swing/filechooser/FileFilter;)V

    .line 86
    return-void
.end method
