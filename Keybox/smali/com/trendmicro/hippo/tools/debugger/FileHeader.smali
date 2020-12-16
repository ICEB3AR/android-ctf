.class Lcom/trendmicro/hippo/tools/debugger/FileHeader;
.super Ljavax/swing/JPanel;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/MouseListener;


# static fields
.field private static final serialVersionUID:J = -0x27acdf518a40a2b7L


# instance fields
.field private fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

.field private pressLine:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V
    .locals 1
    .param p1, "fileWindow"    # Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 2029
    invoke-direct {p0}, Ljavax/swing/JPanel;-><init>()V

    .line 2019
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->pressLine:I

    .line 2030
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 2031
    invoke-virtual {p0, p0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 2032
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->update()V

    .line 2033
    return-void
.end method


# virtual methods
.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 2148
    return-void
.end method

.method public mouseEntered(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 2130
    return-void
.end method

.method public mouseExited(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 2155
    return-void
.end method

.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 2137
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v0

    .line 2138
    .local v0, "font":Ljava/awt/Font;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v1

    .line 2139
    .local v1, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v1}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v2

    .line 2140
    .local v2, "h":I
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v3

    div-int/2addr v3, v2

    iput v3, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->pressLine:I

    .line 2141
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 7
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 2162
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    if-ne v0, p0, :cond_1

    .line 2163
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_1

    .line 2164
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v0

    .line 2165
    .local v0, "y":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    iget-object v1, v1, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v1

    .line 2166
    .local v1, "font":Ljava/awt/Font;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v2

    .line 2167
    .local v2, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v2}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v3

    .line 2168
    .local v3, "h":I
    div-int v4, v0, v3

    .line 2169
    .local v4, "line":I
    iget v5, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->pressLine:I

    if-ne v4, v5, :cond_0

    .line 2170
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->toggleBreakPoint(I)V

    goto :goto_0

    .line 2172
    :cond_0
    const/4 v5, -0x1

    iput v5, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->pressLine:I

    .line 2175
    .end local v0    # "y":I
    .end local v1    # "font":Ljava/awt/Font;
    .end local v2    # "metrics":Ljava/awt/FontMetrics;
    .end local v3    # "h":I
    .end local v4    # "line":I
    :cond_1
    :goto_0
    return-void
.end method

.method public paint(Ljava/awt/Graphics;)V
    .locals 23
    .param p1, "g"    # Ljava/awt/Graphics;

    .line 2061
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-super/range {p0 .. p1}, Ljavax/swing/JPanel;->paint(Ljava/awt/Graphics;)V

    .line 2062
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    iget-object v3, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    .line 2063
    .local v3, "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v4

    .line 2064
    .local v4, "font":Ljava/awt/Font;
    invoke-virtual {v2, v4}, Ljava/awt/Graphics;->setFont(Ljava/awt/Font;)V

    .line 2065
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v5

    .line 2066
    .local v5, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Graphics;->getClipBounds()Ljava/awt/Rectangle;

    move-result-object v6

    .line 2067
    .local v6, "clip":Ljava/awt/Rectangle;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getBackground()Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 2068
    iget v0, v6, Ljava/awt/Rectangle;->x:I

    iget v7, v6, Ljava/awt/Rectangle;->y:I

    iget v8, v6, Ljava/awt/Rectangle;->width:I

    iget v9, v6, Ljava/awt/Rectangle;->height:I

    invoke-virtual {v2, v0, v7, v8, v9}, Ljava/awt/Graphics;->fillRect(IIII)V

    .line 2069
    invoke-virtual {v5}, Ljava/awt/FontMetrics;->getMaxAscent()I

    move-result v7

    .line 2070
    .local v7, "ascent":I
    invoke-virtual {v5}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v8

    .line 2071
    .local v8, "h":I
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineCount()I

    move-result v0

    add-int/lit8 v9, v0, 0x1

    .line 2072
    .local v9, "lineCount":I
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 2073
    .local v0, "dummy":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x2

    if-ge v10, v11, :cond_0

    .line 2074
    const-string v0, "99"

    move-object v10, v0

    goto :goto_0

    .line 2073
    :cond_0
    move-object v10, v0

    .line 2076
    .end local v0    # "dummy":Ljava/lang/String;
    .local v10, "dummy":Ljava/lang/String;
    :goto_0
    iget v0, v6, Ljava/awt/Rectangle;->y:I

    div-int v11, v0, v8

    .line 2077
    .local v11, "startLine":I
    iget v0, v6, Ljava/awt/Rectangle;->y:I

    iget v12, v6, Ljava/awt/Rectangle;->height:I

    add-int/2addr v0, v12

    div-int/2addr v0, v8

    add-int/lit8 v0, v0, 0x1

    .line 2078
    .local v0, "endLine":I
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getWidth()I

    move-result v12

    .line 2079
    .local v12, "width":I
    if-le v0, v9, :cond_1

    move v0, v9

    :cond_1
    move v13, v0

    .line 2080
    .end local v0    # "endLine":I
    .local v13, "endLine":I
    move v0, v11

    move v14, v0

    .local v14, "i":I
    :goto_1
    if-ge v14, v13, :cond_6

    .line 2082
    const/4 v15, -0x2

    .line 2084
    .local v15, "pos":I
    :try_start_0
    invoke-virtual {v3, v14}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v0
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    move v15, v0

    .line 2086
    goto :goto_2

    .line 2085
    :catch_0
    move-exception v0

    .line 2087
    :goto_2
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    move-object/from16 v16, v3

    .end local v3    # "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    .local v16, "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    add-int/lit8 v3, v14, 0x1

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->isBreakPoint(I)Z

    move-result v0

    .line 2088
    .local v0, "isBreakPoint":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v17, v14, 0x1

    move-object/from16 v18, v4

    .end local v4    # "font":Ljava/awt/Font;
    .local v18, "font":Ljava/awt/Font;
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2089
    .local v3, "text":Ljava/lang/String;
    mul-int v4, v14, v8

    .line 2090
    .local v4, "y":I
    move-object/from16 v17, v5

    .end local v5    # "metrics":Ljava/awt/FontMetrics;
    .local v17, "metrics":Ljava/awt/FontMetrics;
    sget-object v5, Ljava/awt/Color;->blue:Ljava/awt/Color;

    invoke-virtual {v2, v5}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 2091
    add-int v5, v4, v7

    move-object/from16 v19, v6

    .end local v6    # "clip":Ljava/awt/Rectangle;
    .local v19, "clip":Ljava/awt/Rectangle;
    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6, v5}, Ljava/awt/Graphics;->drawString(Ljava/lang/String;II)V

    .line 2092
    sub-int v5, v12, v7

    .line 2093
    .local v5, "x":I
    if-eqz v0, :cond_2

    .line 2094
    move/from16 v20, v0

    .end local v0    # "isBreakPoint":Z
    .local v20, "isBreakPoint":Z
    new-instance v0, Ljava/awt/Color;

    move-object/from16 v21, v3

    .end local v3    # "text":Ljava/lang/String;
    .local v21, "text":Ljava/lang/String;
    const/16 v3, 0x80

    invoke-direct {v0, v3, v6, v6}, Ljava/awt/Color;-><init>(III)V

    invoke-virtual {v2, v0}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 2095
    add-int v0, v4, v7

    const/16 v3, 0x9

    sub-int/2addr v0, v3

    .line 2096
    .local v0, "dy":I
    invoke-virtual {v2, v5, v0, v3, v3}, Ljava/awt/Graphics;->fillOval(IIII)V

    .line 2097
    const/16 v6, 0x8

    invoke-virtual {v2, v5, v0, v6, v6}, Ljava/awt/Graphics;->drawOval(IIII)V

    .line 2098
    invoke-virtual {v2, v5, v0, v3, v3}, Ljava/awt/Graphics;->drawOval(IIII)V

    goto :goto_3

    .line 2093
    .end local v20    # "isBreakPoint":Z
    .end local v21    # "text":Ljava/lang/String;
    .local v0, "isBreakPoint":Z
    .restart local v3    # "text":Ljava/lang/String;
    :cond_2
    move/from16 v20, v0

    move-object/from16 v21, v3

    .line 2100
    .end local v0    # "isBreakPoint":Z
    .end local v3    # "text":Ljava/lang/String;
    .restart local v20    # "isBreakPoint":Z
    .restart local v21    # "text":Ljava/lang/String;
    :goto_3
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    iget v0, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->currentPos:I

    if-ne v15, v0, :cond_5

    .line 2101
    new-instance v0, Ljava/awt/Polygon;

    invoke-direct {v0}, Ljava/awt/Polygon;-><init>()V

    .line 2102
    .local v0, "arrow":Ljava/awt/Polygon;
    move v3, v5

    .line 2103
    .local v3, "dx":I
    add-int/lit8 v6, v7, -0xa

    add-int/2addr v4, v6

    .line 2104
    move v6, v4

    .line 2105
    .local v6, "dy":I
    add-int/lit8 v1, v6, 0x3

    invoke-virtual {v0, v3, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2106
    add-int/lit8 v1, v3, 0x5

    move/from16 v22, v4

    .end local v4    # "y":I
    .local v22, "y":I
    add-int/lit8 v4, v6, 0x3

    invoke-virtual {v0, v1, v4}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2107
    add-int/lit8 v1, v3, 0x5

    move/from16 v4, v22

    .end local v5    # "x":I
    .end local v22    # "y":I
    .local v1, "x":I
    .restart local v4    # "y":I
    :goto_4
    add-int/lit8 v5, v3, 0xa

    if-gt v1, v5, :cond_3

    .line 2108
    invoke-virtual {v0, v1, v4}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2107
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 2110
    :cond_3
    add-int/lit8 v1, v3, 0x9

    :goto_5
    add-int/lit8 v5, v3, 0x5

    if-lt v1, v5, :cond_4

    .line 2111
    invoke-virtual {v0, v1, v4}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2110
    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 2113
    :cond_4
    add-int/lit8 v5, v3, 0x5

    move/from16 v22, v1

    .end local v1    # "x":I
    .local v22, "x":I
    add-int/lit8 v1, v6, 0x7

    invoke-virtual {v0, v5, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2114
    add-int/lit8 v1, v6, 0x7

    invoke-virtual {v0, v3, v1}, Ljava/awt/Polygon;->addPoint(II)V

    .line 2115
    sget-object v1, Ljava/awt/Color;->yellow:Ljava/awt/Color;

    invoke-virtual {v2, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 2116
    invoke-virtual {v2, v0}, Ljava/awt/Graphics;->fillPolygon(Ljava/awt/Polygon;)V

    .line 2117
    sget-object v1, Ljava/awt/Color;->black:Ljava/awt/Color;

    invoke-virtual {v2, v1}, Ljava/awt/Graphics;->setColor(Ljava/awt/Color;)V

    .line 2118
    invoke-virtual {v2, v0}, Ljava/awt/Graphics;->drawPolygon(Ljava/awt/Polygon;)V

    .line 2080
    .end local v0    # "arrow":Ljava/awt/Polygon;
    .end local v3    # "dx":I
    .end local v4    # "y":I
    .end local v6    # "dy":I
    .end local v15    # "pos":I
    .end local v20    # "isBreakPoint":Z
    .end local v21    # "text":Ljava/lang/String;
    .end local v22    # "x":I
    :cond_5
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v1, p0

    move-object/from16 v3, v16

    move-object/from16 v5, v17

    move-object/from16 v4, v18

    move-object/from16 v6, v19

    goto/16 :goto_1

    .line 2121
    .end local v14    # "i":I
    .end local v16    # "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    .end local v17    # "metrics":Ljava/awt/FontMetrics;
    .end local v18    # "font":Ljava/awt/Font;
    .end local v19    # "clip":Ljava/awt/Rectangle;
    .local v3, "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    .local v4, "font":Ljava/awt/Font;
    .local v5, "metrics":Ljava/awt/FontMetrics;
    .local v6, "clip":Ljava/awt/Rectangle;
    :cond_6
    return-void
.end method

.method public update()V
    .locals 8

    .line 2039
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->fileWindow:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->textArea:Lcom/trendmicro/hippo/tools/debugger/FileTextArea;

    .line 2040
    .local v0, "textArea":Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getFont()Ljava/awt/Font;

    move-result-object v1

    .line 2041
    .local v1, "font":Ljava/awt/Font;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->setFont(Ljava/awt/Font;)V

    .line 2042
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->getFontMetrics(Ljava/awt/Font;)Ljava/awt/FontMetrics;

    move-result-object v2

    .line 2043
    .local v2, "metrics":Ljava/awt/FontMetrics;
    invoke-virtual {v2}, Ljava/awt/FontMetrics;->getHeight()I

    move-result v3

    .line 2044
    .local v3, "h":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineCount()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    .line 2045
    .local v4, "lineCount":I
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    .line 2046
    .local v5, "dummy":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x2

    if-ge v6, v7, :cond_0

    .line 2047
    const-string v5, "99"

    .line 2049
    :cond_0
    new-instance v6, Ljava/awt/Dimension;

    invoke-direct {v6}, Ljava/awt/Dimension;-><init>()V

    .line 2050
    .local v6, "d":Ljava/awt/Dimension;
    invoke-virtual {v2, v5}, Ljava/awt/FontMetrics;->stringWidth(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x10

    iput v7, v6, Ljava/awt/Dimension;->width:I

    .line 2051
    mul-int v7, v4, v3

    add-int/lit8 v7, v7, 0x64

    iput v7, v6, Ljava/awt/Dimension;->height:I

    .line 2052
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 2053
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/tools/debugger/FileHeader;->setSize(Ljava/awt/Dimension;)V

    .line 2054
    return-void
.end method
