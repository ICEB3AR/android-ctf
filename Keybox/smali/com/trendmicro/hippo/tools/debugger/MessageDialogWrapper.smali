.class Lcom/trendmicro/hippo/tools/debugger/MessageDialogWrapper;
.super Ljava/lang/Object;
.source "SwingGui.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1042
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 9
    .param p0, "parent"    # Ljava/awt/Component;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "flags"    # I

    .line 1050
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3c

    if-le v0, v1, :cond_4

    .line 1051
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1052
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 1053
    .local v2, "len":I
    const/4 v3, 0x0

    .line 1055
    .local v3, "j":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_3

    .line 1056
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1057
    .local v5, "c":C
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1058
    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1060
    add-int/lit8 v6, v4, 0x1

    .local v6, "k":I
    :goto_1
    if-ge v6, v2, :cond_1

    .line 1061
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1062
    goto :goto_2

    .line 1060
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1065
    :cond_1
    :goto_2
    if-ge v6, v2, :cond_2

    .line 1066
    sub-int v7, v6, v4

    .line 1067
    .local v7, "nextWordLen":I
    add-int v8, v3, v7

    if-le v8, v1, :cond_2

    .line 1068
    const/16 v8, 0xa

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1069
    const/4 v3, 0x0

    .line 1055
    .end local v5    # "c":C
    .end local v6    # "k":I
    .end local v7    # "nextWordLen":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1074
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1076
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "len":I
    .end local v3    # "j":I
    .end local v4    # "i":I
    :cond_4
    invoke-static {p0, p1, p2, p3}, Ljavax/swing/JOptionPane;->showMessageDialog(Ljava/awt/Component;Ljava/lang/Object;Ljava/lang/String;I)V

    .line 1077
    return-void
.end method
