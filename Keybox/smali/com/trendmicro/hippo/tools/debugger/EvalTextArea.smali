.class Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
.super Ljavax/swing/JTextArea;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/KeyListener;
.implements Ljavax/swing/event/DocumentListener;


# static fields
.field private static final serialVersionUID:J = -0x365fa6d87e7fad02L


# instance fields
.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private history:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private historyIndex:I

.field private outputMark:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 5
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 1115
    invoke-direct {p0}, Ljavax/swing/JTextArea;-><init>()V

    .line 1105
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1116
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 1117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    .line 1118
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v0

    .line 1119
    .local v0, "doc":Ljavax/swing/text/Document;
    invoke-interface {v0, p0}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 1120
    invoke-virtual {p0, p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1121
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setLineWrap(Z)V

    .line 1122
    new-instance v1, Ljava/awt/Font;

    const-string v2, "Monospaced"

    const/4 v3, 0x0

    const/16 v4, 0xc

    invoke-direct {v1, v2, v3, v4}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setFont(Ljava/awt/Font;)V

    .line 1123
    const-string v1, "% "

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V

    .line 1124
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v1

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    .line 1125
    return-void
.end method

.method private declared-synchronized returnPressed()V
    .locals 6

    monitor-enter p0

    .line 1140
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v0

    .line 1141
    .local v0, "doc":Ljavax/swing/text/Document;
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v1

    .line 1142
    .local v1, "len":I
    new-instance v2, Ljavax/swing/text/Segment;

    invoke-direct {v2}, Ljavax/swing/text/Segment;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1144
    .local v2, "segment":Ljavax/swing/text/Segment;
    :try_start_1
    iget v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    iget v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    sub-int v4, v1, v4

    invoke-interface {v0, v3, v4, v2}, Ljavax/swing/text/Document;->getText(IILjavax/swing/text/Segment;)V
    :try_end_1
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1147
    goto :goto_0

    .line 1145
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
    :catch_0
    move-exception v3

    .line 1146
    .local v3, "ignored":Ljavax/swing/text/BadLocationException;
    :try_start_2
    invoke-virtual {v3}, Ljavax/swing/text/BadLocationException;->printStackTrace()V

    .line 1148
    .end local v3    # "ignored":Ljavax/swing/text/BadLocationException;
    :goto_0
    invoke-virtual {v2}, Ljavax/swing/text/Segment;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1149
    .local v3, "text":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v4, v4, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->stringIsCompilableUnit(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1150
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 1151
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1152
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iput v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1154
    :cond_0
    const-string v4, "\n"

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V

    .line 1155
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v4, v4, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->eval(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1156
    .local v4, "result":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 1157
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V

    .line 1158
    const-string v5, "\n"

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V

    .line 1160
    :cond_1
    const-string v5, "% "

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V

    .line 1161
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v5

    iput v5, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    .line 1162
    .end local v4    # "result":Ljava/lang/String;
    goto :goto_1

    .line 1163
    :cond_2
    const-string v4, "\n"

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->append(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1165
    :goto_1
    monitor-exit p0

    return-void

    .line 1139
    .end local v0    # "doc":Ljavax/swing/text/Document;
    .end local v1    # "len":I
    .end local v2    # "segment":Ljavax/swing/text/Segment;
    .end local v3    # "text":Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized changedUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 1311
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized insertUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 3
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 1274
    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 1275
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 1276
    .local v1, "off":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    if-le v2, v1, :cond_0

    .line 1277
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1279
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
    :cond_0
    monitor-exit p0

    return-void

    .line 1273
    .end local v0    # "len":I
    .end local v1    # "off":I
    .end local p1    # "e":Ljavax/swing/event/DocumentEvent;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 6
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 1184
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    .line 1185
    .local v0, "code":I
    const/16 v1, 0x8

    if-eq v0, v1, :cond_d

    const/16 v1, 0x25

    if-ne v0, v1, :cond_0

    goto/16 :goto_4

    .line 1189
    :cond_0
    const/16 v1, 0x24

    if-ne v0, v1, :cond_4

    .line 1190
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getCaretPosition()I

    move-result v1

    .line 1191
    .local v1, "caretPos":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    if-ne v1, v2, :cond_1

    .line 1192
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_1

    .line 1193
    :cond_1
    if-le v1, v2, :cond_3

    .line 1194
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isControlDown()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1195
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isShiftDown()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1196
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->moveCaretPosition(I)V

    goto :goto_0

    .line 1198
    :cond_2
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setCaretPosition(I)V

    .line 1200
    :goto_0
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1203
    .end local v1    # "caretPos":I
    :cond_3
    :goto_1
    goto/16 :goto_5

    :cond_4
    const/16 v1, 0xa

    if-ne v0, v1, :cond_5

    .line 1204
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->returnPressed()V

    .line 1205
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto/16 :goto_5

    .line 1206
    :cond_5
    const/16 v1, 0x26

    if-ne v0, v1, :cond_9

    .line 1207
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1208
    if-ltz v1, :cond_8

    .line 1209
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_6

    .line 1210
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1212
    :cond_6
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    if-ltz v1, :cond_7

    .line 1213
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1214
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 1215
    .local v2, "len":I
    iget v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, v1, v3, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 1216
    iget v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    .line 1217
    .local v3, "caretPos":I
    invoke-virtual {p0, v3, v3}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->select(II)V

    .line 1218
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "len":I
    .end local v3    # "caretPos":I
    goto :goto_2

    .line 1219
    :cond_7
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    goto :goto_2

    .line 1222
    :cond_8
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1224
    :goto_2
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_5

    .line 1225
    :cond_9
    const/16 v1, 0x28

    if-ne v0, v1, :cond_e

    .line 1226
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    .line 1227
    .local v1, "caretPos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_c

    .line 1228
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1229
    if-gez v2, :cond_a

    const/4 v2, 0x0

    iput v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1230
    :cond_a
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 1231
    .restart local v2    # "len":I
    iget v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_b

    .line 1232
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    iget v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1233
    .local v3, "str":Ljava/lang/String;
    iget v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, v3, v4, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 1234
    iget v4, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    .line 1235
    .end local v3    # "str":Ljava/lang/String;
    goto :goto_3

    .line 1236
    :cond_b
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->history:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->historyIndex:I

    .line 1237
    iget v3, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    const-string v4, ""

    invoke-virtual {p0, v4, v3, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 1240
    .end local v2    # "len":I
    :cond_c
    :goto_3
    invoke-virtual {p0, v1, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->select(II)V

    .line 1241
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_5

    .line 1186
    .end local v1    # "caretPos":I
    :cond_d
    :goto_4
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getCaretPosition()I

    move-result v2

    if-ne v1, v2, :cond_e

    .line 1187
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1243
    :cond_e
    :goto_5
    return-void
.end method

.method public declared-synchronized keyReleased(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    monitor-enter p0

    .line 1265
    monitor-exit p0

    return-void
.end method

.method public keyTyped(Ljava/awt/event/KeyEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 1250
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyChar()C

    move-result v0

    .line 1251
    .local v0, "keyChar":I
    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 1252
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getCaretPosition()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 1253
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 1255
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getCaretPosition()I

    move-result v1

    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    if-ge v1, v2, :cond_1

    .line 1256
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setCaretPosition(I)V

    .line 1258
    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized postUpdateUI()V
    .locals 2

    monitor-enter p0

    .line 1302
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setCaret(Ljavax/swing/text/Caret;)V

    .line 1303
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1304
    monitor-exit p0

    return-void

    .line 1301
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 4
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 1286
    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 1287
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 1288
    .local v1, "off":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    if-le v2, v1, :cond_1

    .line 1289
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    add-int v3, v1, v0

    if-lt v2, v3, :cond_0

    .line 1290
    iget v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    goto :goto_0

    .line 1292
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
    :cond_0
    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1295
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 1285
    .end local v0    # "len":I
    .end local v1    # "off":I
    .end local p1    # "e":Ljavax/swing/event/DocumentEvent;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public select(II)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 1133
    invoke-super {p0, p1, p2}, Ljavax/swing/JTextArea;->select(II)V

    .line 1134
    return-void
.end method

.method public declared-synchronized write(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    monitor-enter p0

    .line 1171
    :try_start_0
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->insert(Ljava/lang/String;I)V

    .line 1172
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1173
    .local v0, "len":I
    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->outputMark:I

    .line 1174
    invoke-virtual {p0, v1, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1175
    monitor-exit p0

    return-void

    .line 1170
    .end local v0    # "len":I
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;
    .end local p1    # "str":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
