.class public Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
.super Ljavax/swing/JTextArea;
.source "ConsoleTextArea.java"

# interfaces
.implements Ljava/awt/event/KeyListener;
.implements Ljavax/swing/event/DocumentListener;


# static fields
.field static final serialVersionUID:J = 0x76c0dddfb1975581L


# instance fields
.field private console1:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

.field private console2:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

.field private err:Ljava/io/PrintStream;

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

.field private in:Ljava/io/PipedInputStream;

.field private inPipe:Ljava/io/PrintWriter;

.field private out:Ljava/io/PrintStream;

.field private outputMark:I


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .locals 5
    .param p1, "argv"    # [Ljava/lang/String;

    .line 107
    invoke-direct {p0}, Ljavax/swing/JTextArea;-><init>()V

    .line 97
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 98
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    .line 108
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    .line 109
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    invoke-direct {v1, p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;-><init>(Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console1:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    .line 110
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    invoke-direct {v1, p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;-><init>(Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console2:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    .line 111
    new-instance v1, Ljava/io/PrintStream;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console1:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->out:Ljava/io/PrintStream;

    .line 112
    new-instance v1, Ljava/io/PrintStream;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console2:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    invoke-direct {v1, v2, v3}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->err:Ljava/io/PrintStream;

    .line 113
    new-instance v1, Ljava/io/PipedOutputStream;

    invoke-direct {v1}, Ljava/io/PipedOutputStream;-><init>()V

    .line 114
    .local v1, "outPipe":Ljava/io/PipedOutputStream;
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    .line 115
    new-instance v2, Ljava/io/PipedInputStream;

    invoke-direct {v2}, Ljava/io/PipedInputStream;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->in:Ljava/io/PipedInputStream;

    .line 117
    :try_start_0
    invoke-virtual {v1, v2}, Ljava/io/PipedOutputStream;->connect(Ljava/io/PipedInputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    goto :goto_0

    .line 118
    :catch_0
    move-exception v2

    .line 119
    .local v2, "exc":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 121
    .end local v2    # "exc":Ljava/io/IOException;
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2, p0}, Ljavax/swing/text/Document;->addDocumentListener(Ljavax/swing/event/DocumentListener;)V

    .line 122
    invoke-virtual {p0, p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 123
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setLineWrap(Z)V

    .line 124
    new-instance v2, Ljava/awt/Font;

    const/16 v3, 0xc

    const-string v4, "Monospaced"

    invoke-direct {v2, v4, v0, v3}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setFont(Ljava/awt/Font;)V

    .line 125
    return-void
.end method


# virtual methods
.method public declared-synchronized changedUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 267
    monitor-exit p0

    return-void
.end method

.method public eval(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 150
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 152
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 153
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console1:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flush()V

    .line 154
    return-void
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->err:Ljava/io/PrintStream;

    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 271
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->in:Ljava/io/PipedInputStream;

    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->out:Ljava/io/PrintStream;

    return-object v0
.end method

.method public declared-synchronized insertUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 3
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 240
    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 241
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 242
    .local v1, "off":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    if-le v2, v1, :cond_0

    .line 243
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    :cond_0
    monitor-exit p0

    return-void

    .line 239
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

    .line 157
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    .line 158
    .local v0, "code":I
    const/16 v1, 0x8

    if-eq v0, v1, :cond_d

    const/16 v1, 0x25

    if-ne v0, v1, :cond_0

    goto/16 :goto_4

    .line 162
    :cond_0
    const/16 v1, 0x24

    if-ne v0, v1, :cond_4

    .line 163
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v1

    .line 164
    .local v1, "caretPos":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    if-ne v1, v2, :cond_1

    .line 165
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_1

    .line 166
    :cond_1
    if-le v1, v2, :cond_3

    .line 167
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isControlDown()Z

    move-result v2

    if-nez v2, :cond_3

    .line 168
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->isShiftDown()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 169
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->moveCaretPosition(I)V

    goto :goto_0

    .line 171
    :cond_2
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setCaretPosition(I)V

    .line 173
    :goto_0
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 176
    .end local v1    # "caretPos":I
    :cond_3
    :goto_1
    goto/16 :goto_5

    :cond_4
    const/16 v1, 0xa

    if-ne v0, v1, :cond_5

    .line 177
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->returnPressed()V

    .line 178
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto/16 :goto_5

    .line 179
    :cond_5
    const/16 v1, 0x26

    if-ne v0, v1, :cond_9

    .line 180
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 181
    if-ltz v1, :cond_8

    .line 182
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_6

    .line 183
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 185
    :cond_6
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    if-ltz v1, :cond_7

    .line 186
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 187
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 188
    .local v2, "len":I
    iget v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v1, v3, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 189
    iget v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    .line 190
    .local v3, "caretPos":I
    invoke-virtual {p0, v3, v3}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->select(II)V

    .line 191
    .end local v1    # "str":Ljava/lang/String;
    .end local v2    # "len":I
    .end local v3    # "caretPos":I
    goto :goto_2

    .line 192
    :cond_7
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    goto :goto_2

    .line 195
    :cond_8
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 197
    :goto_2
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_5

    .line 198
    :cond_9
    const/16 v1, 0x28

    if-ne v0, v1, :cond_e

    .line 199
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    .line 200
    .local v1, "caretPos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_c

    .line 201
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 202
    if-gez v2, :cond_a

    const/4 v2, 0x0

    iput v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 203
    :cond_a
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v2

    invoke-interface {v2}, Ljavax/swing/text/Document;->getLength()I

    move-result v2

    .line 204
    .restart local v2    # "len":I
    iget v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_b

    .line 205
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    iget v4, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 206
    .local v3, "str":Ljava/lang/String;
    iget v4, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v3, v4, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 207
    iget v4, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    .line 208
    .end local v3    # "str":Ljava/lang/String;
    goto :goto_3

    .line 209
    :cond_b
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 210
    iget v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    const-string v4, ""

    invoke-virtual {p0, v4, v3, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->replaceRange(Ljava/lang/String;II)V

    .line 213
    .end local v2    # "len":I
    :cond_c
    :goto_3
    invoke-virtual {p0, v1, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->select(II)V

    .line 214
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_5

    .line 159
    .end local v1    # "caretPos":I
    :cond_d
    :goto_4
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v2

    if-ne v1, v2, :cond_e

    .line 160
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 216
    :cond_e
    :goto_5
    return-void
.end method

.method public declared-synchronized keyReleased(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    monitor-enter p0

    .line 230
    monitor-exit p0

    return-void
.end method

.method public keyTyped(Ljava/awt/event/KeyEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 219
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyChar()C

    move-result v0

    .line 220
    .local v0, "keyChar":I
    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 221
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 222
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    goto :goto_0

    .line 224
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaretPosition()I

    move-result v1

    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    if-ge v1, v2, :cond_1

    .line 225
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setCaretPosition(I)V

    .line 227
    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized postUpdateUI()V
    .locals 2

    monitor-enter p0

    .line 261
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 262
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setCaret(Ljavax/swing/text/Caret;)V

    .line 263
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    monitor-exit p0

    return-void

    .line 260
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeUpdate(Ljavax/swing/event/DocumentEvent;)V
    .locals 4
    .param p1, "e"    # Ljavax/swing/event/DocumentEvent;

    monitor-enter p0

    .line 248
    :try_start_0
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getLength()I

    move-result v0

    .line 249
    .local v0, "len":I
    invoke-interface {p1}, Ljavax/swing/event/DocumentEvent;->getOffset()I

    move-result v1

    .line 250
    .local v1, "off":I
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    if-le v2, v1, :cond_1

    .line 251
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    add-int v3, v1, v0

    if-lt v2, v3, :cond_0

    .line 252
    iget v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    goto :goto_0

    .line 254
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    :cond_0
    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 247
    .end local v0    # "len":I
    .end local v1    # "off":I
    .end local p1    # "e":Ljavax/swing/event/DocumentEvent;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized returnPressed()V
    .locals 7

    monitor-enter p0

    .line 129
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v0

    .line 130
    .local v0, "doc":Ljavax/swing/text/Document;
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v1

    .line 131
    .local v1, "len":I
    new-instance v2, Ljavax/swing/text/Segment;

    invoke-direct {v2}, Ljavax/swing/text/Segment;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    .local v2, "segment":Ljavax/swing/text/Segment;
    :try_start_1
    iget v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    iget v4, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    sub-int v4, v1, v4

    invoke-interface {v0, v3, v4, v2}, Ljavax/swing/text/Document;->getText(IILjavax/swing/text/Segment;)V
    :try_end_1
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    goto :goto_0

    .line 134
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    :catch_0
    move-exception v3

    .line 135
    .local v3, "ignored":Ljavax/swing/text/BadLocationException;
    :try_start_2
    invoke-virtual {v3}, Ljavax/swing/text/BadLocationException;->printStackTrace()V

    .line 137
    .end local v3    # "ignored":Ljavax/swing/text/BadLocationException;
    :goto_0
    iget v3, v2, Ljavax/swing/text/Segment;->count:I

    if-lez v3, :cond_0

    .line 138
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-virtual {v2}, Ljavax/swing/text/Segment;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->history:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->historyIndex:I

    .line 141
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    iget-object v4, v2, Ljavax/swing/text/Segment;->array:[C

    iget v5, v2, Ljavax/swing/text/Segment;->offset:I

    iget v6, v2, Ljavax/swing/text/Segment;->count:I

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/PrintWriter;->write([CII)V

    .line 142
    const-string v3, "\n"

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->append(Ljava/lang/String;)V

    .line 143
    invoke-interface {v0}, Ljavax/swing/text/Document;->getLength()I

    move-result v3

    iput v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    .line 144
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 145
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->inPipe:Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    .line 146
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->console1:Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    monitor-exit p0

    return-void

    .line 128
    .end local v0    # "doc":Ljavax/swing/text/Document;
    .end local v1    # "len":I
    .end local v2    # "segment":Ljavax/swing/text/Segment;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public select(II)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 102
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->requestFocus()V

    .line 103
    invoke-super {p0, p1, p2}, Ljavax/swing/JTextArea;->select(II)V

    .line 104
    return-void
.end method

.method public declared-synchronized write(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    monitor-enter p0

    .line 233
    :try_start_0
    iget v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->insert(Ljava/lang/String;I)V

    .line 234
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 235
    .local v0, "len":I
    iget v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->outputMark:I

    .line 236
    invoke-virtual {p0, v1, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->select(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    monitor-exit p0

    return-void

    .line 232
    .end local v0    # "len":I
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    .end local p1    # "str":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
