.class public Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;
.super Ljava/lang/Object;
.source "SwitchGenerator.java"


# instance fields
.field private P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

.field private R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

.field private c_was_defined:Z

.field char_tail_test_threshold:I

.field private columns:[I

.field private default_value:Ljava/lang/String;

.field private pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

.field private source_file:Ljava/lang/String;

.field use_if_threshold:I

.field v_c:Ljava/lang/String;

.field v_guess:Ljava/lang/String;

.field v_id:Ljava/lang/String;

.field v_label:Ljava/lang/String;

.field v_length_suffix:Ljava/lang/String;

.field v_s:Ljava/lang/String;

.field v_switch_label:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-string v0, "L0"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    .line 14
    const-string v0, "L"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    .line 15
    const-string v0, "s"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    .line 16
    const-string v0, "c"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    .line 17
    const-string v0, "X"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    .line 18
    const-string v0, "id"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    .line 19
    const-string v0, "_length"

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    .line 21
    const/4 v0, 0x3

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    .line 22
    const/4 v0, 0x2

    iput v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    return-void
.end method

.method private static bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z
    .locals 5
    .param p0, "a"    # Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p1, "b"    # Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p2, "comparator"    # I

    .line 372
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-gez p2, :cond_3

    .line 376
    iget v2, p0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    iget v3, p1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    sub-int/2addr v2, v3

    .line 377
    .local v2, "diff":I
    if-eqz v2, :cond_1

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    return v0

    .line 378
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    iget-object v4, p1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v1

    :goto_1
    return v0

    .line 381
    .end local v2    # "diff":I
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iget-object v3, p1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v3, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-le v2, v3, :cond_4

    goto :goto_2

    :cond_4
    move v0, v1

    :goto_2
    return v0
.end method

.method private check_all_is_different(II)V
    .locals 4
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .line 345
    if-eq p1, p2, :cond_1

    .line 346
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v0, v0, p1

    .line 347
    .local v0, "prev":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :goto_0
    add-int/lit8 p1, p1, 0x1

    if-eq p1, p2, :cond_1

    .line 348
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v1, v1, p1

    .line 349
    .local v1, "current":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    iget-object v3, v1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 352
    move-object v0, v1

    .line 353
    .end local v1    # "current":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    goto :goto_0

    .line 350
    .restart local v1    # "current":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->on_same_pair_fail(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2

    .line 355
    .end local v0    # "prev":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v1    # "current":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :cond_1
    return-void
.end method

.method private count_different_chars(III)I
    .locals 3
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "column"    # I

    .line 333
    const/4 v0, 0x0

    .line 334
    .local v0, "chars_count":I
    const/4 v1, -0x1

    .line 335
    .local v1, "cur_ch":I
    :goto_0
    if-eq p1, p2, :cond_1

    .line 336
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v2, v2, p1

    iget-object v2, v2, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v2, p3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 337
    .local v2, "ch":I
    if-eq v2, v1, :cond_0

    .line 338
    add-int/lit8 v0, v0, 0x1

    move v1, v2

    .line 335
    .end local v2    # "ch":I
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 341
    :cond_1
    return v0
.end method

.method private count_different_lengths(II)I
    .locals 3
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .line 299
    const/4 v0, 0x0

    .line 300
    .local v0, "lengths_count":I
    const/4 v1, -0x1

    .line 301
    .local v1, "cur_l":I
    :goto_0
    if-eq p1, p2, :cond_1

    .line 302
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v2, v2, p1

    iget v2, v2, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    .line 303
    .local v2, "l":I
    if-eq v1, v2, :cond_0

    .line 304
    add-int/lit8 v0, v0, 0x1

    move v1, v2

    .line 301
    .end local v2    # "l":I
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 307
    :cond_1
    return v0
.end method

.method private find_max_different_column(III)I
    .locals 6
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "L"    # I

    .line 311
    const/4 v0, 0x0

    .line 312
    .local v0, "max_count":I
    const/4 v1, 0x0

    .line 314
    .local v1, "max_index":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, p3, :cond_2

    .line 315
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aget v3, v3, v2

    .line 316
    .local v3, "column":I
    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    .line 317
    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->count_different_chars(III)I

    move-result v4

    .line 318
    .local v4, "count":I
    sub-int v5, p2, p1

    if-ne v4, v5, :cond_0

    return v2

    .line 319
    :cond_0
    if-ge v0, v4, :cond_1

    .line 320
    move v0, v4

    .line 321
    move v1, v2

    .line 314
    .end local v3    # "column":I
    .end local v4    # "count":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 325
    .end local v2    # "i":I
    :cond_2
    add-int/lit8 v2, p3, -0x1

    if-eq v1, v2, :cond_3

    .line 326
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aget v2, v2, v1

    invoke-direct {p0, p1, p2, v2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    .line 329
    :cond_3
    return v1
.end method

.method private generate_body(III)V
    .locals 5
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, ": { "

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, " = "

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "; String "

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, " = null;"

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    .line 69
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->getOffset()I

    move-result v0

    .line 70
    .local v0, "c_def_begin":I
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v3, " int "

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const/16 v3, 0x3b

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(C)V

    .line 71
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->getOffset()I

    move-result v2

    .line 72
    .local v2, "c_def_end":I
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 74
    add-int/lit8 v3, p3, 0x1

    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generate_length_switch(III)V

    .line 76
    iget-boolean v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    if-nez v3, :cond_0

    .line 77
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->erase(II)V

    .line 80
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    add-int/lit8 v4, p3, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 81
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, "if ("

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, "!=null && "

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 82
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, "!="

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 83
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, " && !"

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, ".equals("

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, ")) "

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 84
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v3, ";"

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 87
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    add-int/lit8 v4, p3, 0x1

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 88
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, "break "

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 90
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v3, "}"

    invoke-virtual {v1, p3, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->line(ILjava/lang/String;)V

    .line 91
    return-void
.end method

.method private generate_length_switch(III)V
    .locals 18
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I

    .line 95
    move-object/from16 v6, p0

    move/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    const/4 v0, -0x1

    invoke-direct {v6, v7, v8, v0}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->sort_pairs(III)V

    .line 97
    invoke-direct/range {p0 .. p2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->check_all_is_different(II)V

    .line 99
    invoke-direct/range {p0 .. p2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->count_different_lengths(II)I

    move-result v10

    .line 101
    .local v10, "lengths_count":I
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    add-int/lit8 v1, v8, -0x1

    aget-object v0, v0, v1

    iget v0, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    new-array v0, v0, [I

    iput-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    .line 104
    iget v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    const/4 v11, 0x1

    if-gt v10, v0, :cond_1

    .line 105
    const/4 v0, 0x1

    .line 106
    .local v0, "use_if":Z
    if-eq v10, v11, :cond_0

    .line 107
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 108
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "int "

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 109
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, " = "

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ".length();"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 110
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 121
    :cond_0
    move v12, v0

    goto :goto_0

    .line 114
    .end local v0    # "use_if":Z
    :cond_1
    const/4 v0, 0x0

    .line 115
    .restart local v0    # "use_if":Z
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 116
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ": switch ("

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 117
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ".length()) {"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 118
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    move v12, v0

    .line 121
    .end local v0    # "use_if":Z
    .local v12, "use_if":Z
    :goto_0
    move/from16 v0, p1

    .line 122
    .local v0, "same_length_begin":I
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v1, v1, v7

    iget v1, v1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    .local v1, "cur_l":I
    const/4 v2, 0x0

    .line 123
    .local v2, "l":I
    move/from16 v3, p1

    move v13, v0

    move v14, v1

    .line 124
    .end local v0    # "same_length_begin":I
    .end local v1    # "cur_l":I
    .local v3, "i":I
    .local v13, "same_length_begin":I
    .local v14, "cur_l":I
    :goto_1
    add-int/lit8 v15, v3, 0x1

    .line 125
    .end local v3    # "i":I
    .local v15, "i":I
    if-eq v15, v8, :cond_3

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v0, v0, v15

    iget v0, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    move v2, v0

    if-eq v0, v14, :cond_2

    goto :goto_2

    :cond_2
    move v3, v15

    goto :goto_1

    :cond_3
    :goto_2
    move/from16 v16, v2

    .line 127
    .end local v2    # "l":I
    .local v16, "l":I
    if-eqz v12, :cond_6

    .line 128
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v9}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 129
    if-eq v13, v7, :cond_4

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, "else "

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 130
    :cond_4
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, "if ("

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 131
    if-ne v10, v11, :cond_5

    .line 132
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, ".length()=="

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto :goto_3

    .line 135
    :cond_5
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_length_suffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, "=="

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 137
    :goto_3
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    .line 138
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, ") {"

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 139
    add-int/lit8 v0, v9, 0x1

    move/from16 v17, v0

    .local v0, "next_indent":I
    goto :goto_4

    .line 142
    .end local v0    # "next_indent":I
    :cond_6
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v9}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 143
    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, "case "

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 144
    add-int/lit8 v0, v9, 0x1

    move/from16 v17, v0

    .line 146
    .local v17, "next_indent":I
    :goto_4
    nop

    .line 147
    xor-int/lit8 v4, v12, 0x1

    move-object/from16 v0, p0

    move v1, v13

    move v2, v15

    move/from16 v3, v17

    move v5, v12

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generate_letter_switch(IIIZZ)V

    .line 148
    const-string v0, "}"

    if-eqz v12, :cond_7

    .line 149
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    goto :goto_5

    .line 152
    :cond_7
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "break "

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ";"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 155
    :goto_5
    if-ne v15, v8, :cond_9

    .line 161
    .end local v15    # "i":I
    .end local v17    # "next_indent":I
    if-nez v12, :cond_8

    .line 162
    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v9}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    iget-object v1, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v6, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 165
    :cond_8
    return-void

    .line 156
    .restart local v15    # "i":I
    .restart local v17    # "next_indent":I
    :cond_9
    move v13, v15

    .line 157
    move/from16 v14, v16

    .line 158
    .end local v17    # "next_indent":I
    move v3, v15

    move/from16 v2, v16

    goto/16 :goto_1
.end method

.method private generate_letter_switch(IIIZZ)V
    .locals 8
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "indent_level"    # I
    .param p4, "label_was_defined"    # Z
    .param p5, "inside_if"    # Z

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v0, v0, p1

    iget v0, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->idLength:I

    .line 173
    .local v0, "L":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 174
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aput v1, v2, v1

    .line 173
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 177
    .end local v1    # "i":I
    :cond_0
    nop

    .line 178
    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, v0

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generate_letter_switch_r(IIIIZZ)Z

    .line 179
    return-void
.end method

.method private generate_letter_switch_r(IIIIZZ)Z
    .locals 26
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "L"    # I
    .param p4, "indent_level"    # I
    .param p5, "label_was_defined"    # Z
    .param p6, "inside_if"    # Z

    .line 186
    move-object/from16 v7, p0

    move/from16 v8, p1

    move/from16 v9, p2

    move/from16 v10, p3

    move/from16 v11, p4

    const/4 v12, 0x0

    .line 187
    .local v12, "next_is_unreachable":Z
    add-int/lit8 v0, v8, 0x1

    const-string v13, ") {"

    const-string v14, "if ("

    const-string v1, ".charAt("

    const-string v15, ";"

    const/16 v6, 0x20

    const-string v2, "="

    if-ne v0, v9, :cond_3

    .line 188
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v6}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(C)V

    .line 189
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v0, v0, v8

    .line 190
    .local v0, "pair":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    iget v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->char_tail_test_threshold:I

    if-le v10, v3, :cond_0

    .line 191
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_guess:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->qstring(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 192
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 195
    :cond_0
    const-string v3, "; break "

    if-nez v10, :cond_1

    .line 196
    const/4 v12, 0x1

    .line 197
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 198
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 201
    :cond_1
    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v4, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 202
    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    .line 203
    .local v4, "column":I
    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v14, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v5, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v14, ")=="

    invoke-virtual {v5, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 204
    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v15, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v15, v4}, Ljava/lang/String;->charAt(I)C

    move-result v15

    invoke-virtual {v5, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->qchar(I)V

    .line 205
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-eq v5, v10, :cond_2

    .line 206
    iget-object v15, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v6, " && "

    invoke-virtual {v15, v6}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 207
    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aget v4, v6, v5

    .line 208
    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v15, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v6, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v6, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 209
    iget-object v6, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v15, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v15, v4}, Ljava/lang/String;->charAt(I)C

    move-result v15

    invoke-virtual {v6, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->qchar(I)V

    .line 205
    add-int/lit8 v5, v5, 0x1

    const/16 v6, 0x20

    goto :goto_0

    .line 211
    .end local v5    # "i":I
    :cond_2
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v13}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 212
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v5, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_id:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 213
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_switch_label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ";}"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 216
    .end local v4    # "column":I
    :goto_1
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(C)V

    .line 217
    return v12

    .line 220
    .end local v0    # "pair":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :cond_3
    invoke-direct/range {p0 .. p3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->find_max_different_column(III)I

    move-result v17

    .line 221
    .local v17, "max_column_index":I
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aget v6, v0, v17

    .line 222
    .local v6, "max_column":I
    invoke-direct {v7, v8, v9, v6}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->count_different_chars(III)I

    move-result v5

    .line 224
    .local v5, "count":I
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    add-int/lit8 v3, v10, -0x1

    aget v3, v0, v3

    aput v3, v0, v17

    .line 226
    if-eqz p6, :cond_4

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    const/16 v4, 0x20

    goto :goto_2

    .line 227
    :cond_4
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(C)V

    .line 230
    :goto_2
    iget v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->use_if_threshold:I

    const/4 v3, 0x1

    if-gt v5, v0, :cond_5

    .line 231
    const/4 v0, 0x1

    .line 232
    .local v0, "use_if":Z
    iput-boolean v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->c_was_defined:Z

    .line 233
    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 234
    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ");"

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move/from16 v19, p5

    move/from16 v20, v0

    goto :goto_4

    .line 237
    .end local v0    # "use_if":Z
    :cond_5
    const/4 v0, 0x0

    .line 238
    .restart local v0    # "use_if":Z
    if-nez p5, :cond_6

    .line 239
    const/4 v2, 0x1

    .line 240
    .end local p5    # "label_was_defined":Z
    .local v2, "label_was_defined":Z
    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto :goto_3

    .line 238
    .end local v2    # "label_was_defined":Z
    .restart local p5    # "label_was_defined":Z
    :cond_6
    move/from16 v2, p5

    .line 242
    .end local p5    # "label_was_defined":Z
    .restart local v2    # "label_was_defined":Z
    :goto_3
    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v4, "switch ("

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v4, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_s:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 243
    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(I)V

    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v3, ")) {"

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    move/from16 v20, v0

    move/from16 v19, v2

    .line 246
    .end local v0    # "use_if":Z
    .end local v2    # "label_was_defined":Z
    .local v19, "label_was_defined":Z
    .local v20, "use_if":Z
    :goto_4
    move/from16 v0, p1

    .line 247
    .local v0, "same_char_begin":I
    iget-object v1, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v1, v1, v8

    iget-object v1, v1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .local v1, "cur_ch":I
    const/4 v2, 0x0

    .line 248
    .local v2, "ch":I
    move/from16 v3, p1

    move v4, v0

    move v0, v3

    move v3, v1

    .line 249
    .end local v1    # "cur_ch":I
    .local v0, "i":I
    .local v3, "cur_ch":I
    .local v4, "same_char_begin":I
    :goto_5
    const/16 v18, 0x1

    add-int/lit8 v1, v0, 0x1

    .line 250
    .end local v0    # "i":I
    .local v1, "i":I
    if-eq v1, v9, :cond_8

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    move v2, v0

    if-eq v0, v3, :cond_7

    goto :goto_6

    :cond_7
    move v0, v1

    goto :goto_5

    :cond_8
    :goto_6
    move/from16 v21, v2

    .line 252
    .end local v2    # "ch":I
    .local v21, "ch":I
    if-eqz v20, :cond_a

    .line 253
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 254
    if-eq v4, v8, :cond_9

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "else "

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 255
    :cond_9
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "=="

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 256
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->qchar(I)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v13}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 257
    add-int/lit8 v0, v11, 0x1

    move/from16 v22, v0

    .local v0, "next_indent":I
    goto :goto_7

    .line 260
    .end local v0    # "next_indent":I
    :cond_a
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    .line 261
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, "case "

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->qchar(I)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v2, ":"

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 262
    add-int/lit8 v0, v11, 0x1

    move/from16 v22, v0

    .line 264
    .local v22, "next_indent":I
    :goto_7
    add-int/lit8 v23, v10, -0x1

    .line 265
    move-object/from16 v0, p0

    move v2, v1

    .end local v1    # "i":I
    .local v2, "i":I
    move v1, v4

    move/from16 p5, v2

    .end local v2    # "i":I
    .local p5, "i":I
    move/from16 v24, v18

    move/from16 v18, v3

    .end local v3    # "cur_ch":I
    .local v18, "cur_ch":I
    move/from16 v3, v23

    move/from16 v16, v4

    const/16 v23, 0x20

    .end local v4    # "same_char_begin":I
    .local v16, "same_char_begin":I
    move/from16 v4, v22

    move/from16 v25, v5

    .end local v5    # "count":I
    .local v25, "count":I
    move/from16 v5, v19

    move/from16 v8, v23

    move/from16 v23, v6

    .end local v6    # "max_column":I
    .local v23, "max_column":I
    move/from16 v6, v20

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generate_letter_switch_r(IIIIZZ)Z

    move-result v0

    .line 267
    .local v0, "after_unreachable":Z
    const-string v1, "}"

    if-eqz v20, :cond_b

    .line 268
    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    goto :goto_8

    .line 271
    :cond_b
    if-nez v0, :cond_c

    .line 272
    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    const-string v3, "break "

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    iget-object v3, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->v_label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    iget-object v2, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v2, v15}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 275
    :cond_c
    :goto_8
    move/from16 v2, p5

    .end local p5    # "i":I
    .restart local v2    # "i":I
    if-ne v2, v9, :cond_10

    .line 281
    .end local v0    # "after_unreachable":Z
    .end local v2    # "i":I
    .end local v22    # "next_indent":I
    if-eqz v20, :cond_e

    .line 282
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    .line 283
    if-eqz p6, :cond_d

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    add-int/lit8 v1, v11, -0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    goto :goto_9

    .line 284
    :cond_d
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    goto :goto_9

    .line 287
    :cond_e
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(Ljava/lang/String;)V

    .line 288
    if-eqz p6, :cond_f

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->nl()V

    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    add-int/lit8 v1, v11, -0x1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->indent(I)V

    goto :goto_9

    .line 289
    :cond_f
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;->p(C)V

    .line 292
    :goto_9
    iget-object v0, v7, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->columns:[I

    aput v23, v0, v17

    .line 294
    return v12

    .line 276
    .restart local v0    # "after_unreachable":Z
    .restart local v2    # "i":I
    .restart local v22    # "next_indent":I
    :cond_10
    move v4, v2

    .line 277
    .end local v16    # "same_char_begin":I
    .restart local v4    # "same_char_begin":I
    move/from16 v3, v21

    .line 278
    .end local v0    # "after_unreachable":Z
    .end local v18    # "cur_ch":I
    .end local v22    # "next_indent":I
    .restart local v3    # "cur_ch":I
    move/from16 v8, p1

    move v0, v2

    move/from16 v2, v21

    move/from16 v6, v23

    move/from16 v5, v25

    goto/16 :goto_5
.end method

.method private static heap4Sort([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;III)V
    .locals 4
    .param p0, "array"    # [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "comparator"    # I

    .line 388
    const/4 v0, 0x1

    if-gt p2, v0, :cond_0

    return-void

    .line 389
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->makeHeap4([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;III)V

    .line 390
    :goto_0
    if-le p2, v0, :cond_1

    .line 391
    add-int/lit8 p2, p2, -0x1

    .line 392
    add-int v1, p1, p2

    aget-object v1, p0, v1

    .line 393
    .local v1, "v1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    add-int/lit8 v2, p1, 0x0

    aget-object v2, p0, v2

    .line 394
    .local v2, "v2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    add-int v3, p1, p2

    aput-object v2, p0, v3

    .line 395
    add-int/lit8 v3, p1, 0x0

    aput-object v1, p0, v3

    .line 396
    const/4 v3, 0x0

    invoke-static {p0, p1, p2, v3, p3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->heapify4([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;IIII)V

    .line 397
    .end local v1    # "v1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v2    # "v2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    goto :goto_0

    .line 398
    :cond_1
    return-void
.end method

.method private static heapify4([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;IIII)V
    .locals 11
    .param p0, "array"    # [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "i"    # I
    .param p4, "comparator"    # I

    .line 413
    add-int v0, p1, p3

    aget-object v0, p0, v0

    .line 415
    .local v0, "i_val":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :goto_0
    shl-int/lit8 v1, p3, 0x2

    .line 416
    .local v1, "base":I
    or-int/lit8 v2, v1, 0x1

    .line 417
    .local v2, "new_i1":I
    or-int/lit8 v3, v1, 0x2

    .line 418
    .local v3, "new_i2":I
    or-int/lit8 v4, v1, 0x3

    .line 419
    .local v4, "new_i3":I
    add-int/lit8 v5, v1, 0x4

    .line 420
    .local v5, "new_i4":I
    if-lt v5, p2, :cond_3

    .line 439
    .end local v1    # "base":I
    .end local v5    # "new_i4":I
    if-ge v2, p2, :cond_2

    .line 440
    add-int v1, p1, v2

    aget-object v1, p0, v1

    .line 441
    .local v1, "val1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    if-eq v3, p2, :cond_1

    .line 442
    add-int v5, p1, v3

    aget-object v5, p0, v5

    .line 443
    .local v5, "val2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    invoke-static {v5, v1, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 444
    move-object v1, v5

    move v2, v3

    .line 446
    :cond_0
    if-eq v4, p2, :cond_1

    .line 447
    add-int v6, p1, v4

    aget-object v6, p0, v6

    .line 448
    .local v6, "val3":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    invoke-static {v6, v1, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 449
    move-object v1, v6

    move v2, v4

    .line 453
    .end local v5    # "val2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v6    # "val3":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :cond_1
    invoke-static {v1, v0, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 454
    add-int v5, p1, p3

    aput-object v1, p0, v5

    .line 455
    add-int v5, p1, v2

    aput-object v0, p0, v5

    .line 458
    .end local v1    # "val1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    :cond_2
    return-void

    .line 421
    .local v1, "base":I
    .local v5, "new_i4":I
    :cond_3
    add-int v6, p1, v2

    aget-object v6, p0, v6

    .line 422
    .local v6, "val1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    add-int v7, p1, v3

    aget-object v7, p0, v7

    .line 423
    .local v7, "val2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    add-int v8, p1, v4

    aget-object v8, p0, v8

    .line 424
    .local v8, "val3":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    add-int v9, p1, v5

    aget-object v9, p0, v9

    .line 425
    .local v9, "val4":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    invoke-static {v7, v6, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 426
    move-object v6, v7

    move v2, v3

    .line 428
    :cond_4
    invoke-static {v9, v8, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 429
    move-object v8, v9

    move v4, v5

    .line 431
    :cond_5
    invoke-static {v8, v6, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 432
    move-object v6, v8

    move v2, v4

    .line 434
    :cond_6
    invoke-static {v0, v6, p4}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->bigger(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;I)Z

    move-result v10

    if-eqz v10, :cond_7

    return-void

    .line 435
    :cond_7
    add-int v10, p1, p3

    aput-object v6, p0, v10

    .line 436
    add-int v10, p1, v2

    aput-object v0, p0, v10

    .line 437
    move p3, v2

    .line 438
    .end local v1    # "base":I
    .end local v5    # "new_i4":I
    .end local v6    # "val1":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v7    # "val2":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v8    # "val3":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .end local v9    # "val4":Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    goto :goto_0
.end method

.method private static makeHeap4([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;III)V
    .locals 1
    .param p0, "array"    # [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p1, "offset"    # I
    .param p2, "size"    # I
    .param p3, "comparator"    # I

    .line 403
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v0, v0, 0x2

    .local v0, "i":I
    :goto_0
    if-eqz v0, :cond_0

    .line 404
    add-int/lit8 v0, v0, -0x1

    .line 405
    invoke-static {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->heapify4([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;IIII)V

    goto :goto_0

    .line 407
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private on_same_pair_fail(Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 9
    .param p1, "a"    # Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p2, "b"    # Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    .line 358
    invoke-virtual {p1}, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->getLineNumber()I

    move-result v0

    .local v0, "line1":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->getLineNumber()I

    move-result v1

    .line 359
    .local v1, "line2":I
    if-le v1, v0, :cond_0

    move v2, v0

    .local v2, "tmp":I
    move v0, v1

    move v1, v2

    .line 360
    .end local v2    # "tmp":I
    :cond_0
    iget-object v2, p1, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;->id:Ljava/lang/String;

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v1}, Ljava/lang/Integer;-><init>(I)V

    const-string v4, "msg.idswitch.same_string"

    invoke-static {v4, v2, v3}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 362
    .local v2, "error_text":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    iget-object v5, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v4, v2

    move v6, v0

    invoke-virtual/range {v3 .. v8}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    return-object v3
.end method

.method private sort_pairs(III)V
    .locals 2
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .param p3, "comparator"    # I

    .line 366
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    sub-int v1, p2, p1

    invoke-static {v0, p1, v1, p3}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->heap4Sort([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;III)V

    .line 367
    return-void
.end method


# virtual methods
.method public generateSwitch([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Ljava/lang/String;)V
    .locals 3
    .param p1, "pairs"    # [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    .param p2, "default_value"    # Ljava/lang/String;

    .line 53
    const/4 v0, 0x0

    .line 54
    .local v0, "begin":I
    array-length v1, p1

    .line 55
    .local v1, "end":I
    if-ne v0, v1, :cond_0

    return-void

    .line 56
    :cond_0
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->pairs:[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    .line 57
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->default_value:Ljava/lang/String;

    .line 59
    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generate_body(III)V

    .line 60
    return-void
.end method

.method public generateSwitch([Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "pairs"    # [Ljava/lang/String;
    .param p2, "default_value"    # Ljava/lang/String;

    .line 43
    array-length v0, p1

    div-int/lit8 v0, v0, 0x2

    .line 44
    .local v0, "N":I
    new-array v1, v0, [Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    .line 45
    .local v1, "id_pairs":[Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_0

    .line 46
    new-instance v3, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;

    mul-int/lit8 v4, v2, 0x2

    aget-object v4, p1, v4

    mul-int/lit8 v5, v2, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-object v5, p1, v5

    invoke-direct {v3, v4, v5}, Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v1, v2

    .line 45
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 48
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {p0, v1, p2}, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->generateSwitch([Lcom/trendmicro/hippo/tools/idswitch/IdValuePair;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public getCodePrinter()Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    return-object v0
.end method

.method public getReporter()Lcom/trendmicro/hippo/tools/ToolErrorReporter;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    return-object v0
.end method

.method public getSourceFileName()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    return-object v0
.end method

.method public setCodePrinter(Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;)V
    .locals 0
    .param p1, "value"    # Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    .line 34
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->P:Lcom/trendmicro/hippo/tools/idswitch/CodePrinter;

    return-void
.end method

.method public setReporter(Lcom/trendmicro/hippo/tools/ToolErrorReporter;)V
    .locals 0
    .param p1, "value"    # Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    .line 37
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->R:Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    return-void
.end method

.method public setSourceFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/idswitch/SwitchGenerator;->source_file:Ljava/lang/String;

    return-void
.end method
