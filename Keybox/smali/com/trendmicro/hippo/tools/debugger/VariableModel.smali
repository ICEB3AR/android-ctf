.class Lcom/trendmicro/hippo/tools/debugger/VariableModel;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    }
.end annotation


# static fields
.field private static final CHILDLESS:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

.field private static final cNames:[Ljava/lang/String;

.field private static final cTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field private debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

.field private root:Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 2565
    const-string v0, " Name"

    const-string v1, " Value"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    .line 2570
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v1

    sput-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->cTypes:[Ljava/lang/Class;

    .line 2576
    new-array v0, v2, [Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    sput-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->CHILDLESS:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2592
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/Dim;Ljava/lang/Object;)V
    .locals 2
    .param p1, "debugger"    # Lcom/trendmicro/hippo/tools/debugger/Dim;
    .param p2, "scope"    # Ljava/lang/Object;

    .line 2597
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2598
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    .line 2599
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    const-string v1, "this"

    invoke-direct {v0, p2, v1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->root:Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2600
    return-void
.end method

.method private children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2760
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->access$000(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2761
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->access$000(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v0

    return-object v0

    .line 2766
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->getValue(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v0

    .line 2767
    .local v0, "value":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getObjectIds(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 2768
    .local v1, "ids":[Ljava/lang/Object;
    if-eqz v1, :cond_2

    array-length v2, v1

    if-nez v2, :cond_1

    goto :goto_1

    .line 2771
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/VariableModel$1;

    invoke-direct {v2, p0}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/VariableModel;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 2789
    array-length v2, v1

    new-array v2, v2, [Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2790
    .local v2, "children":[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-eq v3, v4, :cond_3

    .line 2791
    new-instance v4, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    aget-object v5, v1, v3

    invoke-direct {v4, v0, v5}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    aput-object v4, v2, v3

    .line 2790
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2769
    .end local v2    # "children":[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    .end local v3    # "i":I
    :cond_2
    :goto_1
    sget-object v2, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->CHILDLESS:[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2794
    .restart local v2    # "children":[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    :cond_3
    invoke-static {p1, v2}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->access$002(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2795
    return-object v2
.end method


# virtual methods
.method public addTreeModelListener(Ljavax/swing/event/TreeModelListener;)V
    .locals 0
    .param p1, "l"    # Ljavax/swing/event/TreeModelListener;

    .line 2688
    return-void
.end method

.method public getChild(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 2
    .param p1, "nodeObj"    # Ljava/lang/Object;
    .param p2, "i"    # I

    .line 2632
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    if-nez v0, :cond_0

    .line 2633
    const/4 v0, 0x0

    return-object v0

    .line 2635
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2636
    .local v0, "node":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v1

    aget-object v1, v1, p2

    return-object v1
.end method

.method public getChildCount(Ljava/lang/Object;)I
    .locals 2
    .param p1, "nodeObj"    # Ljava/lang/Object;

    .line 2620
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    if-nez v0, :cond_0

    .line 2621
    const/4 v0, 0x0

    return v0

    .line 2623
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2624
    .local v0, "node":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v1

    array-length v1, v1

    return v1
.end method

.method public getColumnClass(I)Ljava/lang/Class;
    .locals 1
    .param p1, "column"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 2722
    sget-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->cTypes:[Ljava/lang/Class;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getColumnCount()I
    .locals 1

    .line 2706
    sget-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .param p1, "column"    # I

    .line 2714
    sget-object v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->cNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getIndexOfChild(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 6
    .param p1, "parentObj"    # Ljava/lang/Object;
    .param p2, "childObj"    # Ljava/lang/Object;

    .line 2656
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 2657
    return v1

    .line 2659
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2660
    .local v0, "parent":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    move-object v2, p2

    check-cast v2, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2661
    .local v2, "child":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v3

    .line 2662
    .local v3, "children":[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    if-eq v4, v5, :cond_2

    .line 2663
    aget-object v5, v3, v4

    if-ne v5, v2, :cond_1

    .line 2664
    return v4

    .line 2662
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2667
    .end local v4    # "i":I
    :cond_2
    return v1
.end method

.method public getRoot()Ljava/lang/Object;
    .locals 1

    .line 2609
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    if-nez v0, :cond_0

    .line 2610
    const/4 v0, 0x0

    return-object v0

    .line 2612
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->root:Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    return-object v0
.end method

.method public getValue(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2803
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->access$100(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->access$200(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->getObjectProperty(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 2804
    :catch_0
    move-exception v0

    .line 2805
    .local v0, "exc":Ljava/lang/Exception;
    const-string v1, "undefined"

    return-object v1
.end method

.method public getValueAt(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 7
    .param p1, "nodeObj"    # Ljava/lang/Object;
    .param p2, "column"    # I

    .line 2730
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 2731
    :cond_0
    move-object v2, p1

    check-cast v2, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2732
    .local v2, "node":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    if-eqz p2, :cond_4

    const/4 v3, 0x1

    if-eq p2, v3, :cond_1

    .line 2753
    return-object v1

    .line 2738
    :cond_1
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->getValue(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->objectToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2741
    .local v0, "result":Ljava/lang/String;
    goto :goto_0

    .line 2739
    .end local v0    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 2740
    .local v0, "exc":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    move-object v0, v1

    .line 2742
    .local v0, "result":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2743
    .local v1, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    .line 2744
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v3, :cond_3

    .line 2745
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 2746
    .local v5, "ch":C
    invoke-static {v5}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2747
    const/16 v5, 0x20

    .line 2749
    :cond_2
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2744
    .end local v5    # "ch":C
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 2751
    .end local v4    # "i":I
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 2734
    .end local v0    # "result":Ljava/lang/String;
    .end local v1    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "len":I
    :cond_4
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isCellEditable(Ljava/lang/Object;I)Z
    .locals 1
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "column"    # I

    .line 2675
    if-nez p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLeaf(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "nodeObj"    # Ljava/lang/Object;

    .line 2644
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->debugger:Lcom/trendmicro/hippo/tools/debugger/Dim;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2645
    return v1

    .line 2647
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    .line 2648
    .local v0, "node":Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;->children(Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;)[Lcom/trendmicro/hippo/tools/debugger/VariableModel$VariableNode;

    move-result-object v2

    array-length v2, v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public removeTreeModelListener(Ljavax/swing/event/TreeModelListener;)V
    .locals 0
    .param p1, "l"    # Ljavax/swing/event/TreeModelListener;

    .line 2694
    return-void
.end method

.method public setValueAt(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "node"    # Ljava/lang/Object;
    .param p3, "column"    # I

    .line 2682
    return-void
.end method

.method public valueForPathChanged(Ljavax/swing/tree/TreePath;Ljava/lang/Object;)V
    .locals 0
    .param p1, "path"    # Ljavax/swing/tree/TreePath;
    .param p2, "newValue"    # Ljava/lang/Object;

    .line 2697
    return-void
.end method
