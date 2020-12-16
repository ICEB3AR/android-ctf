.class public Lcom/trendmicro/hippo/tools/idswitch/Main;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field private static final GENERATED_TAG:I = 0x2

.field private static final GENERATED_TAG_STR:Ljava/lang/String; = "generated"

.field private static final NORMAL_LINE:I = 0x0

.field private static final STRING_TAG:I = 0x3

.field private static final STRING_TAG_STR:Ljava/lang/String; = "string"

.field private static final SWITCH_TAG:I = 0x1

.field private static final SWITCH_TAG_STR:Ljava/lang/String; = "string_id_map"


# instance fields
.field private P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

.field private R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

.field private final all_pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

.field private source_file:Ljava/lang/String;

.field private tag_definition_end:I

.field private tag_value_end:I

.field private tag_value_start:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    return-void
.end method

.method private add_id([CIIII)V
    .locals 4
    .param p1, "array"    # [C
    .param p2, "id_start"    # I
    .param p3, "id_end"    # I
    .param p4, "name_start"    # I
    .param p5, "name_end"    # I

    .line 386
    new-instance v0, Ljava/lang/String;

    sub-int v1, p5, p4

    invoke-direct {v0, p1, p4, v1}, Ljava/lang/String;-><init>([CII)V

    .line 387
    .local v0, "name":Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    sub-int v2, p3, p2

    invoke-direct {v1, p1, p2, v2}, Ljava/lang/String;-><init>([CII)V

    .line 389
    .local v1, "value":Ljava/lang/String;
    new-instance v2, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    invoke-direct {v2, v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .local v2, "pair":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->setLineNumber(I)V

    .line 393
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    return-void
.end method

.method private static equals(Ljava/lang/String;[CII)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .line 427
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v1, p3, p2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 428
    move v0, p2

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-eq v0, p3, :cond_1

    .line 429
    aget-char v3, p1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_0

    return v2

    .line 428
    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 431
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_1
    const/4 v0, 0x1

    return v0

    .line 433
    :cond_2
    return v2
.end method

.method private exec([Ljava/lang/String;)I
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;

    .line 458
    new-instance v0, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    .line 460
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/idswitch/Main;->process_options([Ljava/lang/String;)I

    move-result v0

    .line 462
    .local v0, "arg_count":I
    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 463
    const-string v2, "msg.idswitch.no_file_argument"

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 465
    return v1

    .line 467
    :cond_0
    if-le v0, v2, :cond_1

    .line 468
    const-string v2, "msg.idswitch.too_many_arguments"

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 470
    return v1

    .line 473
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-direct {v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    .line 474
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->setIndentStep(I)V

    .line 475
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->setIndentTabSize(I)V

    .line 478
    :try_start_0
    aget-object v2, p1, v3

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->process_file(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/trendmicro/hippo/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_0

    .line 487
    nop

    .line 488
    return v3

    .line 485
    :catch_0
    move-exception v2

    .line 486
    .local v2, "ex":Lcom/trendmicro/hippo/EvaluatorException;
    return v1

    .line 480
    .end local v2    # "ex":Lcom/trendmicro/hippo/EvaluatorException;
    :catch_1
    move-exception v2

    .line 481
    .local v2, "ex":Ljava/io/IOException;
    nop

    .line 482
    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    .line 481
    const-string v4, "msg.idswitch.io_error"

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->print_error(Ljava/lang/String;)V

    .line 483
    return v1
.end method

.method private extract_line_tag_id([CII)I
    .locals 19
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I

    .line 214
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const/4 v3, 0x0

    .line 215
    .local v3, "id":I
    invoke-static/range {p1 .. p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v4

    .line 216
    .end local p2    # "cursor":I
    .local v4, "cursor":I
    move v5, v4

    .line 217
    .local v5, "after_leading_white_space":I
    invoke-direct {v0, v1, v4, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->look_for_slash_slash([CII)I

    move-result v4

    .line 218
    if-eq v4, v2, :cond_a

    .line 219
    add-int/lit8 v6, v5, 0x2

    if-ne v6, v4, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    .line 220
    .local v6, "at_line_start":Z
    :goto_0
    invoke-static {v1, v4, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v4

    .line 221
    if-eq v4, v2, :cond_a

    aget-char v7, v1, v4

    const/16 v8, 0x23

    if-ne v7, v8, :cond_a

    .line 222
    add-int/lit8 v4, v4, 0x1

    .line 224
    const/4 v7, 0x0

    .line 225
    .local v7, "end_tag":Z
    if-eq v4, v2, :cond_1

    aget-char v9, v1, v4

    const/16 v10, 0x2f

    if-ne v9, v10, :cond_1

    .line 226
    add-int/lit8 v4, v4, 0x1

    const/4 v7, 0x1

    .line 229
    :cond_1
    move v9, v4

    .line 231
    .local v9, "tag_start":I
    :goto_1
    const/16 v10, 0x3d

    if-eq v4, v2, :cond_3

    .line 232
    aget-char v11, v1, v4

    .line 233
    .local v11, "c":I
    if-eq v11, v8, :cond_3

    if-eq v11, v10, :cond_3

    invoke-static {v11}, Lcom/trendmicro/hippo/tools/idswitch/Main;->is_white_space(I)Z

    move-result v12

    if-eqz v12, :cond_2

    goto :goto_2

    .line 231
    .end local v11    # "c":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 236
    :cond_3
    :goto_2
    if-eq v4, v2, :cond_a

    .line 237
    move v11, v4

    .line 238
    .local v11, "tag_end":I
    invoke-static {v1, v4, v2}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v4

    .line 239
    if-eq v4, v2, :cond_a

    .line 240
    aget-char v12, v1, v4

    .line 241
    .local v12, "c":I
    if-eq v12, v10, :cond_4

    if-ne v12, v8, :cond_a

    .line 242
    :cond_4
    nop

    .line 243
    invoke-direct {v0, v1, v9, v11, v6}, Lcom/trendmicro/hippo/tools/idswitch/Main;->get_tag_id([CIIZ)I

    move-result v3

    .line 244
    if-eqz v3, :cond_a

    .line 245
    const/4 v10, 0x0

    .line 246
    .local v10, "bad":Ljava/lang/String;
    if-ne v12, v8, :cond_6

    .line 247
    if-eqz v7, :cond_5

    .line 248
    neg-int v3, v3

    .line 249
    invoke-static {v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->is_value_type(I)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 250
    const-string v10, "msg.idswitch.no_end_usage"

    .line 253
    :cond_5
    add-int/lit8 v8, v4, 0x1

    iput v8, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_definition_end:I

    goto :goto_4

    .line 256
    :cond_6
    if-eqz v7, :cond_7

    .line 257
    const-string v10, "msg.idswitch.no_end_with_value"

    goto :goto_3

    .line 259
    :cond_7
    invoke-static {v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->is_value_type(I)Z

    move-result v8

    if-nez v8, :cond_8

    .line 260
    const-string v10, "msg.idswitch.no_value_allowed"

    .line 262
    :cond_8
    :goto_3
    add-int/lit8 v8, v4, 0x1

    .line 263
    invoke-direct {v0, v1, v8, v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->extract_tag_value([CIII)I

    move-result v3

    .line 265
    :goto_4
    if-nez v10, :cond_9

    goto :goto_5

    .line 266
    :cond_9
    nop

    .line 267
    invoke-static {v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v8

    .line 266
    invoke-static {v10, v8}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 268
    .local v8, "s":Ljava/lang/String;
    iget-object v13, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    iget-object v15, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->source_file:Ljava/lang/String;

    iget-object v14, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 269
    invoke-virtual {v14}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineNumber()I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object v14, v8

    invoke-virtual/range {v13 .. v18}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v13

    throw v13

    .line 278
    .end local v6    # "at_line_start":Z
    .end local v7    # "end_tag":Z
    .end local v8    # "s":Ljava/lang/String;
    .end local v9    # "tag_start":I
    .end local v10    # "bad":Ljava/lang/String;
    .end local v11    # "tag_end":I
    .end local v12    # "c":I
    :cond_a
    :goto_5
    return v3
.end method

.method private extract_tag_value([CIII)I
    .locals 7
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I
    .param p4, "id"    # I

    .line 298
    const/4 v0, 0x0

    .line 299
    .local v0, "found":Z
    invoke-static {p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result p2

    .line 300
    if-eq p2, p3, :cond_4

    .line 301
    move v1, p2

    .line 302
    .local v1, "value_start":I
    move v2, p2

    .line 303
    .local v2, "value_end":I
    :goto_0
    if-eq p2, p3, :cond_3

    .line 304
    aget-char v3, p1, p2

    .line 305
    .local v3, "c":I
    invoke-static {v3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->is_white_space(I)Z

    move-result v4

    const/16 v5, 0x23

    if-eqz v4, :cond_1

    .line 306
    add-int/lit8 v4, p2, 0x1

    invoke-static {p1, v4, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v4

    .line 307
    .local v4, "after_space":I
    if-eq v4, p3, :cond_0

    aget-char v6, p1, v4

    if-ne v6, v5, :cond_0

    .line 308
    move v2, p2

    .line 309
    move p2, v4

    .line 310
    goto :goto_2

    .line 312
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 313
    .end local p2    # "cursor":I
    .local v4, "cursor":I
    move p2, v4

    goto :goto_1

    .line 314
    .end local v4    # "cursor":I
    .restart local p2    # "cursor":I
    :cond_1
    if-ne v3, v5, :cond_2

    .line 315
    move v2, p2

    .line 316
    goto :goto_2

    .line 319
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 321
    .end local v3    # "c":I
    :goto_1
    goto :goto_0

    .line 322
    :cond_3
    :goto_2
    if-eq p2, p3, :cond_4

    .line 324
    const/4 v0, 0x1

    .line 325
    iput v1, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_value_start:I

    .line 326
    iput v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_value_end:I

    .line 327
    add-int/lit8 v3, p2, 0x1

    iput v3, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_definition_end:I

    .line 330
    .end local v1    # "value_start":I
    .end local v2    # "value_end":I
    :cond_4
    if-eqz v0, :cond_5

    move v1, p4

    goto :goto_3

    :cond_5
    const/4 v1, 0x0

    :goto_3
    return v1
.end method

.method private generate_java_code()V
    .locals 3

    .line 200
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->clear()V

    .line 202
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    .line 203
    .local v0, "pairs":[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 205
    new-instance v1, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;

    invoke-direct {v1}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;-><init>()V

    .line 206
    .local v1, "g":Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;
    const/4 v2, 0x2

    iput v2, v1, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    .line 207
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->setReporter(Lcom/trendmicro/hippo/tools/ToolErrorReporter;)V

    .line 208
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->setCodePrinter(Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;)V

    .line 210
    const-string v2, "0"

    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generateSwitch([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method private get_tag_id([CIIZ)I
    .locals 1
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "at_line_start"    # Z

    .line 336
    if-eqz p4, :cond_1

    .line 337
    const-string v0, "string_id_map"

    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    const/4 v0, 0x1

    return v0

    .line 340
    :cond_0
    const-string v0, "generated"

    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 341
    const/4 v0, 0x2

    return v0

    .line 344
    :cond_1
    const-string v0, "string"

    invoke-static {v0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->equals(Ljava/lang/String;[CII)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 345
    const/4 v0, 0x3

    return v0

    .line 347
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private get_time_stamp()Ljava/lang/String;
    .locals 2

    .line 193
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, " \'Last update:\' yyyy-MM-dd HH:mm:ss z"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 195
    .local v0, "f":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static is_value_type(I)Z
    .locals 1
    .param p0, "id"    # I

    .line 50
    const/4 v0, 0x3

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 51
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static is_white_space(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 397
    const/16 v0, 0x20

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private look_for_id_definitions([CIIZ)V
    .locals 9
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "use_tag_value_as_string"    # Z

    .line 356
    move v0, p2

    .line 358
    .local v0, "cursor":I
    invoke-static {p1, v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v0

    .line 359
    move v3, v0

    .line 360
    .local v3, "id_start":I
    const-string v1, "Id_"

    invoke-static {v1, p1, v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_matched_prefix(Ljava/lang/String;[CII)I

    move-result v1

    .line 361
    .local v1, "name_start":I
    if-ltz v1, :cond_1

    .line 363
    move v0, v1

    .line 364
    invoke-static {p1, v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_name_char([CII)I

    move-result v0

    .line 365
    move v2, v0

    .line 366
    .local v2, "name_end":I
    if-eq v1, v2, :cond_1

    .line 367
    invoke-static {p1, v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/Main;->skip_white_space([CII)I

    move-result v0

    .line 368
    if-eq v0, p3, :cond_1

    .line 369
    aget-char v4, p1, v0

    const/16 v5, 0x3d

    if-ne v4, v5, :cond_1

    .line 370
    move v4, v2

    .line 371
    .local v4, "id_end":I
    if-eqz p4, :cond_0

    .line 372
    iget v1, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_value_start:I

    .line 373
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_value_end:I

    move v7, v1

    move v8, v2

    goto :goto_0

    .line 371
    :cond_0
    move v7, v1

    move v8, v2

    .line 376
    .end local v1    # "name_start":I
    .end local v2    # "name_end":I
    .local v7, "name_start":I
    .local v8, "name_end":I
    :goto_0
    move-object v1, p0

    move-object v2, p1

    move v5, v7

    move v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/tools/idswitch/Main;->add_id([CIIII)V

    move v1, v7

    .line 381
    .end local v4    # "id_end":I
    .end local v7    # "name_start":I
    .end local v8    # "name_end":I
    .restart local v1    # "name_start":I
    :cond_1
    return-void
.end method

.method private look_for_slash_slash([CII)I
    .locals 3
    .param p1, "array"    # [C
    .param p2, "cursor"    # I
    .param p3, "end"    # I

    .line 283
    :goto_0
    add-int/lit8 v0, p2, 0x2

    if-gt v0, p3, :cond_2

    .line 284
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "cursor":I
    .local v0, "cursor":I
    aget-char p2, p1, p2

    .line 285
    .local p2, "c":I
    const/16 v1, 0x2f

    if-ne p2, v1, :cond_1

    .line 286
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "cursor":I
    .local v2, "cursor":I
    aget-char p2, p1, v0

    .line 287
    if-ne p2, v1, :cond_0

    .line 288
    return v2

    .line 287
    :cond_0
    move p2, v2

    goto :goto_1

    .line 285
    .end local v2    # "cursor":I
    .restart local v0    # "cursor":I
    :cond_1
    move p2, v0

    .line 291
    .end local v0    # "cursor":I
    .local p2, "cursor":I
    :goto_1
    goto :goto_0

    .line 292
    :cond_2
    return p3
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .param p0, "args"    # [Ljava/lang/String;

    .line 452
    new-instance v0, Lcom/trendmicro/hippo/tools/idswitch/Main;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/idswitch/Main;-><init>()V

    .line 453
    .local v0, "self":Lcom/trendmicro/hippo/tools/idswitch/Main;
    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->exec([Ljava/lang/String;)I

    move-result v1

    .line 454
    .local v1, "status":I
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 455
    return-void
.end method

.method private option_error(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 563
    nop

    .line 564
    const-string v0, "msg.idswitch.bad_invocation"

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 563
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->print_error(Ljava/lang/String;)V

    .line 565
    return-void
.end method

.method private print_error(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 568
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 569
    return-void
.end method

.method private process_file()V
    .locals 19

    .line 103
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 104
    .local v1, "cur_state":I
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getBuffer()[C

    move-result-object v2

    .line 106
    .local v2, "buffer":[C
    const/4 v3, -0x1

    .local v3, "generated_begin":I
    const/4 v4, -0x1

    .line 107
    .local v4, "generated_end":I
    const/4 v5, -0x1

    .local v5, "time_stamp_begin":I
    const/4 v6, -0x1

    .line 109
    .local v6, "time_stamp_end":I
    iget-object v7, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->startLineLoop()V

    .line 110
    :goto_0
    iget-object v7, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->nextLine()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 111
    iget-object v7, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineBegin()I

    move-result v7

    .line 112
    .local v7, "begin":I
    iget-object v8, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v8}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineEnd()I

    move-result v8

    .line 114
    .local v8, "end":I
    invoke-direct {v0, v2, v7, v8}, Lcom/trendmicro/hippo/tools/idswitch/Main;->extract_line_tag_id([CII)I

    move-result v9

    .line 115
    .local v9, "tag_id":I
    const/4 v10, 0x0

    .line 116
    .local v10, "bad_tag":Z
    const/4 v11, -0x1

    const/4 v12, 0x1

    if-eqz v1, :cond_b

    const/4 v13, 0x2

    if-eq v1, v12, :cond_4

    if-eq v1, v13, :cond_0

    goto/16 :goto_1

    .line 163
    :cond_0
    if-nez v9, :cond_1

    .line 164
    if-gez v3, :cond_d

    move v3, v7

    goto/16 :goto_1

    .line 166
    :cond_1
    const/4 v11, -0x2

    if-ne v9, v11, :cond_3

    .line 167
    if-gez v3, :cond_2

    move v3, v7

    .line 168
    :cond_2
    const/4 v1, 0x1

    .line 169
    move v4, v7

    goto :goto_1

    .line 172
    :cond_3
    const/4 v10, 0x1

    goto :goto_1

    .line 128
    :cond_4
    if-nez v9, :cond_5

    .line 129
    const/4 v11, 0x0

    invoke-direct {v0, v2, v7, v8, v11}, Lcom/trendmicro/hippo/tools/idswitch/Main;->look_for_id_definitions([CIIZ)V

    goto :goto_1

    .line 131
    :cond_5
    const/4 v14, 0x3

    if-ne v9, v14, :cond_6

    .line 132
    invoke-direct {v0, v2, v7, v8, v12}, Lcom/trendmicro/hippo/tools/idswitch/Main;->look_for_id_definitions([CIIZ)V

    goto :goto_1

    .line 134
    :cond_6
    if-ne v9, v13, :cond_8

    .line 135
    if-ltz v3, :cond_7

    const/4 v10, 0x1

    goto :goto_1

    .line 137
    :cond_7
    const/4 v1, 0x2

    .line 138
    iget v5, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_definition_end:I

    .line 139
    move v6, v8

    goto :goto_1

    .line 142
    :cond_8
    if-ne v9, v11, :cond_a

    .line 143
    const/4 v1, 0x0

    .line 144
    if-ltz v3, :cond_d

    iget-object v11, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_d

    .line 145
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->generate_java_code()V

    .line 146
    iget-object v11, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->toString()Ljava/lang/String;

    move-result-object v11

    .line 147
    .local v11, "code":Ljava/lang/String;
    iget-object v12, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 148
    invoke-virtual {v12, v3, v4, v11}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->setReplacement(IILjava/lang/String;)Z

    move-result v12

    .line 149
    .local v12, "different":Z
    if-eqz v12, :cond_9

    .line 150
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->get_time_stamp()Ljava/lang/String;

    move-result-object v13

    .line 151
    .local v13, "stamp":Ljava/lang/String;
    iget-object v14, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 152
    invoke-virtual {v14, v5, v6, v13}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->setReplacement(IILjava/lang/String;)Z

    .line 154
    .end local v11    # "code":Ljava/lang/String;
    .end local v12    # "different":Z
    .end local v13    # "stamp":Ljava/lang/String;
    :cond_9
    goto :goto_1

    .line 159
    :cond_a
    const/4 v10, 0x1

    .line 161
    goto :goto_1

    .line 118
    :cond_b
    if-ne v9, v12, :cond_c

    .line 119
    const/4 v1, 0x1

    .line 120
    iget-object v11, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->all_pairs:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->clear()V

    .line 121
    const/4 v3, -0x1

    goto :goto_1

    .line 123
    :cond_c
    if-ne v9, v11, :cond_d

    .line 124
    const/4 v10, 0x1

    .line 176
    :cond_d
    :goto_1
    if-nez v10, :cond_e

    .line 182
    .end local v7    # "begin":I
    .end local v8    # "end":I
    .end local v9    # "tag_id":I
    .end local v10    # "bad_tag":Z
    goto/16 :goto_0

    .line 177
    .restart local v7    # "begin":I
    .restart local v8    # "end":I
    .restart local v9    # "tag_id":I
    .restart local v10    # "bad_tag":Z
    :cond_e
    nop

    .line 178
    invoke-static {v9}, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v11

    .line 177
    const-string v12, "msg.idswitch.bad_tag_order"

    invoke-static {v12, v11}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 179
    .local v11, "text":Ljava/lang/String;
    iget-object v13, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    iget-object v15, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->source_file:Ljava/lang/String;

    iget-object v12, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 180
    invoke-virtual {v12}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineNumber()I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object v14, v11

    invoke-virtual/range {v13 .. v18}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v12

    throw v12

    .line 184
    .end local v7    # "begin":I
    .end local v8    # "end":I
    .end local v9    # "tag_id":I
    .end local v10    # "bad_tag":Z
    .end local v11    # "text":Ljava/lang/String;
    :cond_f
    if-nez v1, :cond_10

    .line 190
    return-void

    .line 185
    :cond_10
    nop

    .line 186
    invoke-static {v1}, Lcom/trendmicro/hippo/tools/idswitch/Main;->tag_name(I)Ljava/lang/String;

    move-result-object v7

    .line 185
    const-string v8, "msg.idswitch.file_end_in_switch"

    invoke-static {v8, v7}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 187
    .local v7, "text":Ljava/lang/String;
    iget-object v9, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    iget-object v11, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->source_file:Ljava/lang/String;

    iget-object v8, v0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 188
    invoke-virtual {v8}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->getLineNumber()I

    move-result v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v10, v7

    invoke-virtual/range {v9 .. v14}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v8

    throw v8
.end method

.method private process_options([Ljava/lang/String;)I
    .locals 12
    .param p1, "args"    # [Ljava/lang/String;

    .line 493
    const/4 v0, 0x1

    .line 495
    .local v0, "status":I
    const/4 v1, 0x0

    .line 496
    .local v1, "show_usage":Z
    const/4 v2, 0x0

    .line 498
    .local v2, "show_version":Z
    array-length v3, p1

    .line 499
    .local v3, "N":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    const/4 v5, 0x1

    if-eq v4, v3, :cond_7

    .line 500
    aget-object v6, p1, v4

    .line 501
    .local v6, "arg":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    .line 502
    .local v7, "arg_length":I
    const/4 v8, 0x2

    if-lt v7, v8, :cond_6

    .line 503
    const/4 v9, 0x0

    invoke-virtual {v6, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-ne v9, v10, :cond_6

    .line 504
    invoke-virtual {v6, v5}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/4 v11, 0x0

    if-ne v9, v10, :cond_3

    .line 505
    if-ne v7, v8, :cond_0

    .line 506
    aput-object v11, p1, v4

    goto :goto_3

    .line 508
    :cond_0
    const-string v8, "--help"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 509
    const/4 v1, 0x1

    goto :goto_2

    .line 511
    :cond_1
    const-string v8, "--version"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 512
    const/4 v2, 0x1

    goto :goto_2

    .line 515
    :cond_2
    const-string v8, "msg.idswitch.bad_option"

    invoke-static {v8, v6}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 517
    const/4 v0, -0x1

    goto :goto_3

    .line 521
    :cond_3
    const/4 v8, 0x1

    .local v8, "j":I
    :goto_1
    if-eq v8, v7, :cond_5

    .line 522
    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 523
    .local v9, "c":C
    const/16 v10, 0x68

    if-eq v9, v10, :cond_4

    .line 526
    nop

    .line 529
    invoke-static {v9}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v10

    .line 527
    const-string v11, "msg.idswitch.bad_option_char"

    invoke-static {v11, v10}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 526
    invoke-direct {p0, v10}, Lcom/trendmicro/hippo/tools/idswitch/Main;->option_error(Ljava/lang/String;)V

    .line 530
    const/4 v0, -0x1

    .line 531
    goto :goto_3

    .line 524
    :cond_4
    const/4 v1, 0x1

    .line 521
    .end local v9    # "c":C
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 536
    .end local v8    # "j":I
    :cond_5
    :goto_2
    aput-object v11, p1, v4

    .line 499
    .end local v6    # "arg":Ljava/lang/String;
    .end local v7    # "arg_length":I
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 541
    .end local v4    # "i":I
    :cond_7
    :goto_3
    if-ne v0, v5, :cond_9

    .line 542
    if-eqz v1, :cond_8

    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->show_usage()V

    const/4 v0, 0x0

    .line 543
    :cond_8
    if-eqz v2, :cond_9

    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->show_version()V

    const/4 v0, 0x0

    .line 546
    :cond_9
    if-eq v0, v5, :cond_a

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 548
    :cond_a
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/idswitch/Main;->remove_nulls([Ljava/lang/String;)I

    move-result v4

    return v4
.end method

.method private remove_nulls([Ljava/lang/String;)I
    .locals 4
    .param p1, "array"    # [Ljava/lang/String;

    .line 572
    array-length v0, p1

    .line 573
    .local v0, "N":I
    const/4 v1, 0x0

    .line 574
    .local v1, "cursor":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 575
    aget-object v2, p1, v1

    if-nez v2, :cond_0

    goto :goto_1

    .line 574
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 577
    :cond_1
    :goto_1
    move v2, v1

    .line 578
    .local v2, "destination":I
    if-eq v1, v0, :cond_3

    .line 579
    add-int/lit8 v1, v1, 0x1

    .line 580
    :goto_2
    if-eq v1, v0, :cond_3

    .line 581
    aget-object v3, p1, v1

    .line 582
    .local v3, "elem":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 583
    aput-object v3, p1, v2

    add-int/lit8 v2, v2, 0x1

    .line 580
    .end local v3    # "elem":Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 587
    :cond_3
    return v2
.end method

.method private show_usage()V
    .locals 2

    .line 552
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 553
    const-string v1, "msg.idswitch.usage"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 552
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 554
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 555
    return-void
.end method

.method private show_version()V
    .locals 2

    .line 558
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 559
    const-string v1, "msg.idswitch.version"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 558
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 560
    return-void
.end method

.method private static skip_matched_prefix(Ljava/lang/String;[CII)I
    .locals 5
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "array"    # [C
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .line 412
    const/4 v0, -0x1

    .line 413
    .local v0, "cursor":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 414
    .local v1, "prefix_length":I
    sub-int v2, p3, p2

    if-gt v1, v2, :cond_1

    .line 415
    move v0, p2

    .line 416
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_1

    .line 417
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    aget-char v4, p1, v0

    if-eq v3, v4, :cond_0

    .line 418
    const/4 v0, -0x1

    goto :goto_1

    .line 416
    :cond_0
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 422
    .end local v2    # "i":I
    :cond_1
    :goto_1
    return v0
.end method

.method private static skip_name_char([CII)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .line 437
    move v0, p1

    .line 438
    .local v0, "cursor":I
    :goto_0
    if-eq v0, p2, :cond_4

    .line 439
    aget-char v1, p0, v0

    .line 440
    .local v1, "c":I
    const/16 v2, 0x61

    if-gt v2, v1, :cond_0

    const/16 v2, 0x7a

    if-le v1, v2, :cond_3

    :cond_0
    const/16 v2, 0x41

    if-gt v2, v1, :cond_1

    const/16 v2, 0x5a

    if-le v1, v2, :cond_3

    .line 441
    :cond_1
    const/16 v2, 0x30

    if-gt v2, v1, :cond_2

    const/16 v2, 0x39

    if-le v1, v2, :cond_3

    .line 442
    :cond_2
    const/16 v2, 0x5f

    if-eq v1, v2, :cond_3

    .line 443
    goto :goto_1

    .line 438
    .end local v1    # "c":I
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 448
    :cond_4
    :goto_1
    return v0
.end method

.method private static skip_white_space([CII)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .line 401
    move v0, p1

    .line 402
    .local v0, "cursor":I
    :goto_0
    if-eq v0, p2, :cond_1

    .line 403
    aget-char v1, p0, v0

    .line 404
    .local v1, "c":I
    invoke-static {v1}, Lcom/trendmicro/hippo/tools/idswitch/Main;->is_white_space(I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 402
    .end local v1    # "c":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 406
    :cond_1
    :goto_1
    return v0
.end method

.method private static tag_name(I)Ljava/lang/String;
    .locals 1
    .param p0, "id"    # I

    .line 55
    const/4 v0, -0x2

    if-eq p0, v0, :cond_3

    const/4 v0, -0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    .line 61
    const-string v0, ""

    return-object v0

    .line 58
    :cond_0
    const-string v0, "generated"

    return-object v0

    .line 56
    :cond_1
    const-string v0, "string_id_map"

    return-object v0

    .line 57
    :cond_2
    const-string v0, "/string_id_map"

    return-object v0

    .line 59
    :cond_3
    const-string v0, "/generated"

    return-object v0
.end method


# virtual methods
.method process_file(Ljava/lang/String;)V
    .locals 4
    .param p1, "file_path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->source_file:Ljava/lang/String;

    .line 67
    new-instance v0, Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-direct {v0}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    .line 70
    const-string v0, "-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    .local v1, "is":Ljava/io/InputStream;
    goto :goto_0

    .line 74
    .end local v1    # "is":Ljava/io/InputStream;
    :cond_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 77
    .restart local v1    # "is":Ljava/io/InputStream;
    :goto_0
    :try_start_0
    new-instance v2, Ljava/io/InputStreamReader;

    const-string v3, "ASCII"

    invoke-direct {v2, v1, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 78
    .local v2, "r":Ljava/io/Reader;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->readData(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 80
    .end local v2    # "r":Ljava/io/Reader;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 82
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/idswitch/Main;->process_file()V

    .line 84
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->wasModified()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 87
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .local v0, "os":Ljava/io/OutputStream;
    goto :goto_1

    .line 90
    .end local v0    # "os":Ljava/io/OutputStream;
    :cond_1
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 94
    .restart local v0    # "os":Ljava/io/OutputStream;
    :goto_1
    :try_start_1
    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-direct {v2, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 95
    .local v2, "w":Ljava/io/Writer;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/Main;->body:Lcom/trendmicro/hippo/tools/idswitch/FileBody;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/tools/idswitch/FileBody;->writeData(Ljava/io/Writer;)V

    .line 96
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .end local v2    # "w":Ljava/io/Writer;
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    goto :goto_2

    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    throw v2

    .line 100
    .end local v0    # "os":Ljava/io/OutputStream;
    :cond_2
    :goto_2
    return-void

    .line 80
    :catchall_1
    move-exception v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
.end method
