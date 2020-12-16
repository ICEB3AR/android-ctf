.class Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;
.super Ljavax/swing/JPopupMenu;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x31d08dfa625eeb7dL


# instance fields
.field x:I

.field y:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/FileTextArea;)V
    .locals 3
    .param p1, "w"    # Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    .line 1471
    invoke-direct {p0}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 1473
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v1, "Set Breakpoint"

    invoke-direct {v0, v1}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    move-object v1, v0

    .local v1, "item":Ljavax/swing/JMenuItem;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1474
    invoke-virtual {v1, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1475
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v2, "Clear Breakpoint"

    invoke-direct {v0, v2}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    move-object v1, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1476
    invoke-virtual {v1, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1477
    new-instance v0, Ljavax/swing/JMenuItem;

    const-string v2, "Run"

    invoke-direct {v0, v2}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    move-object v1, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 1478
    invoke-virtual {v1, p1}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1479
    return-void
.end method


# virtual methods
.method public show(Ljavax/swing/JComponent;II)V
    .locals 0
    .param p1, "comp"    # Ljavax/swing/JComponent;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .line 1485
    iput p2, p0, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->x:I

    .line 1486
    iput p3, p0, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->y:I

    .line 1487
    invoke-super {p0, p1, p2, p3}, Ljavax/swing/JPopupMenu;->show(Ljava/awt/Component;II)V

    .line 1488
    return-void
.end method
