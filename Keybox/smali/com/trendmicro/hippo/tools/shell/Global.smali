.class public Lcom/trendmicro/hippo/tools/shell/Global;
.super Lcom/trendmicro/hippo/ImporterTopLevel;
.source "Global.java"


# static fields
.field static final serialVersionUID:J = 0x37ea591919c223d5L


# instance fields
.field attemptedJLineLoad:Z

.field private console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

.field private doctestCanonicalizations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private errStream:Ljava/io/PrintStream;

.field history:Lcom/trendmicro/hippo/NativeArray;

.field private inStream:Ljava/io/InputStream;

.field initialized:Z

.field private outStream:Ljava/io/PrintStream;

.field private prompts:[Ljava/lang/String;

.field private quitAction:Lcom/trendmicro/hippo/tools/shell/QuitAction;

.field private sealedStdLib:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 81
    invoke-direct {p0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->sealedStdLib:Z

    .line 77
    const-string v0, "js> "

    const-string v1, "  > "

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    .line 82
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Context;)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 85
    invoke-direct {p0}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->sealedStdLib:Z

    .line 77
    const-string v0, "js> "

    const-string v1, "  > "

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    .line 86
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/shell/Global;->init(Lcom/trendmicro/hippo/Context;)V

    .line 87
    return-void
.end method

.method public static defineClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 328
    invoke-static {p2}, Lcom/trendmicro/hippo/tools/shell/Global;->getClass([Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 329
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 332
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V

    .line 333
    return-void

    .line 330
    :cond_0
    const-string v1, "msg.must.implement.Scriptable"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static deserialize(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 402
    array-length v0, p2

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 406
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 407
    .local v0, "filename":Ljava/lang/String;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 408
    .local v1, "fis":Ljava/io/FileInputStream;
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 409
    .local v2, "scope":Lcom/trendmicro/hippo/Scriptable;
    new-instance v3, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;

    invoke-direct {v3, v1, v2}, Lcom/trendmicro/hippo/serialize/ScriptableInputStream;-><init>(Ljava/io/InputStream;Lcom/trendmicro/hippo/Scriptable;)V

    .line 410
    .local v3, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    .line 411
    .local v4, "deserialized":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V

    .line 412
    invoke-static {v4, v2}, Lcom/trendmicro/hippo/Context;->toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    return-object v5

    .line 403
    .end local v0    # "filename":Ljava/lang/String;
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .end local v2    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "in":Ljava/io/ObjectInputStream;
    .end local v4    # "deserialized":Ljava/lang/Object;
    :cond_0
    const-string v0, "Expected a filename to read the serialization from"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method private static doPrint([Ljava/lang/Object;Lcom/trendmicro/hippo/Function;Z)Ljava/lang/Object;
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "funObj"    # Lcom/trendmicro/hippo/Function;
    .param p2, "newline"    # Z

    .line 234
    invoke-static {p1}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    .line 235
    .local v0, "out":Ljava/io/PrintStream;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 236
    if-lez v1, :cond_0

    .line 237
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 240
    :cond_0
    aget-object v2, p0, v1

    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 242
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 235
    .end local v2    # "s":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 244
    .end local v1    # "i":I
    :cond_1
    if-eqz p2, :cond_2

    .line 245
    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 247
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static doctest(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 9
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 448
    array-length v0, p2

    if-nez v0, :cond_0

    .line 449
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 451
    :cond_0
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 452
    .local v0, "session":Ljava/lang/String;
    invoke-static {p3}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v7

    .line 453
    .local v7, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    new-instance v8, Ljava/lang/Integer;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    move-object v2, p0

    move-object v3, v7

    move-object v4, v0

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/tools/shell/Global;->runDoctest(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    invoke-direct {v8, v1}, Ljava/lang/Integer;-><init>(I)V

    return-object v8
.end method

.method private doctestOutputMatches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "expected"    # Ljava/lang/String;
    .param p2, "actual"    # Ljava/lang/String;

    .line 536
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 537
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 538
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 539
    return v1

    .line 540
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 541
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 542
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_0

    .line 543
    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 544
    return v1

    .line 551
    :cond_2
    const-string v0, "@[0-9a-fA-F]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 552
    .local v0, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 553
    .local v2, "expectedMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 555
    .local v3, "actualMatcher":Ljava/util/regex/Matcher;
    :goto_1
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_3

    .line 556
    return v5

    .line 557
    :cond_3
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-nez v4, :cond_4

    .line 558
    return v5

    .line 559
    :cond_4
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    if-eq v4, v6, :cond_5

    .line 560
    return v5

    .line 561
    :cond_5
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    .line 562
    .local v4, "start":I
    invoke-virtual {p1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 563
    return v5

    .line 564
    :cond_6
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v6

    .line 565
    .local v6, "expectedGroup":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v7

    .line 566
    .local v7, "actualGroup":Ljava/lang/String;
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 567
    .local v8, "mapping":Ljava/lang/String;
    if-nez v8, :cond_7

    .line 568
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 570
    :cond_7
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 571
    return v5

    .line 573
    :cond_8
    :goto_2
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 574
    return v1

    .line 575
    .end local v4    # "start":I
    .end local v6    # "expectedGroup":Ljava/lang/String;
    .end local v7    # "actualGroup":Ljava/lang/String;
    .end local v8    # "mapping":Ljava/lang/String;
    :cond_9
    goto :goto_1
.end method

.method public static gc(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 0
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 204
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 205
    return-void
.end method

.method private static getCharCodingFromType(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "type"    # Ljava/lang/String;

    .line 1178
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 1179
    .local v0, "i":I
    if-ltz v0, :cond_4

    .line 1180
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1181
    .local v1, "end":I
    add-int/lit8 v0, v0, 0x1

    .line 1182
    :goto_0
    const/16 v8, 0x20

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v2, v8, :cond_0

    .line 1183
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1185
    :cond_0
    const-string v9, "charset"

    .line 1186
    .local v9, "charset":Ljava/lang/String;
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v7

    move-object v2, v9

    move-object v5, p0

    move v6, v0

    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1188
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v0, v2

    .line 1189
    :goto_1
    if-eq v0, v1, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v2, v8, :cond_1

    .line 1190
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1192
    :cond_1
    if-eq v0, v1, :cond_4

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3d

    if-ne v2, v3, :cond_4

    .line 1193
    add-int/lit8 v0, v0, 0x1

    .line 1194
    :goto_2
    if-eq v0, v1, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v2, v8, :cond_2

    .line 1195
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1197
    :cond_2
    if-eq v0, v1, :cond_4

    .line 1200
    :goto_3
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-gt v2, v8, :cond_3

    .line 1201
    add-int/lit8 v1, v1, -0x1

    goto :goto_3

    .line 1203
    :cond_3
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1208
    .end local v1    # "end":I
    .end local v9    # "charset":Ljava/lang/String;
    :cond_4
    const/4 v1, 0x0

    return-object v1
.end method

.method private static getClass([Ljava/lang/Object;)Ljava/lang/Class;
    .locals 4
    .param p0, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 362
    array-length v0, p0

    if-eqz v0, :cond_1

    .line 365
    const/4 v0, 0x0

    aget-object v1, p0, v0

    .line 366
    .local v1, "arg0":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_0

    .line 367
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 368
    .local v2, "wrapped":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/Class;

    if-eqz v3, :cond_0

    .line 369
    move-object v0, v2

    check-cast v0, Ljava/lang/Class;

    return-object v0

    .line 371
    .end local v2    # "wrapped":Ljava/lang/Object;
    :cond_0
    aget-object v0, p0, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 373
    .local v0, "className":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 375
    :catch_0
    move-exception v2

    .line 376
    .local v2, "cnfe":Ljava/lang/ClassNotFoundException;
    const-string v3, "msg.class.not.found"

    invoke-static {v3, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 363
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "arg0":Ljava/lang/Object;
    .end local v2    # "cnfe":Ljava/lang/ClassNotFoundException;
    :cond_1
    const-string v0, "msg.expected.string.arg"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;
    .locals 3
    .param p0, "function"    # Lcom/trendmicro/hippo/Function;

    .line 948
    invoke-interface {p0}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 949
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/tools/shell/Global;

    if-eqz v1, :cond_0

    .line 952
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/tools/shell/Global;

    return-object v1

    .line 950
    :cond_0
    nop

    .line 951
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 950
    const-string v2, "msg.bad.shell.function.scope"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static help(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 197
    invoke-static {p3}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    .line 198
    .local v0, "out":Ljava/io/PrintStream;
    const-string v1, "msg.help"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method private synthetic lambda$init$0(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 109
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/shell/Global;->init(Lcom/trendmicro/hippo/Context;)V

    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public static load(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 291
    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p2, v1

    .line 292
    .local v2, "arg":Ljava/lang/Object;
    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 294
    .local v3, "file":Ljava/lang/String;
    :try_start_0
    invoke-static {p0, p1, v3}, Lcom/trendmicro/hippo/tools/shell/Main;->processFile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/VirtualMachineError; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    nop

    .line 291
    .end local v2    # "arg":Ljava/lang/Object;
    .end local v3    # "file":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 299
    .restart local v2    # "arg":Ljava/lang/Object;
    .restart local v3    # "file":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 301
    .local v0, "ex":Ljava/lang/VirtualMachineError;
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->printStackTrace()V

    .line 302
    nop

    .line 303
    invoke-virtual {v0}, Ljava/lang/VirtualMachineError;->toString()Ljava/lang/String;

    move-result-object v1

    .line 302
    const-string v4, "msg.uncaughtJSException"

    invoke-static {v4, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "msg":Ljava/lang/String;
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 295
    .end local v0    # "ex":Ljava/lang/VirtualMachineError;
    .end local v1    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 296
    .local v0, "ioex":Ljava/io/IOException;
    nop

    .line 297
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 296
    const-string v4, "msg.couldnt.read.source"

    invoke-static {v4, v3, v1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 298
    .restart local v1    # "msg":Ljava/lang/String;
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v4

    throw v4

    .line 307
    .end local v0    # "ioex":Ljava/io/IOException;
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "arg":Ljava/lang/Object;
    .end local v3    # "file":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static loadClass(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .line 353
    invoke-static {p2}, Lcom/trendmicro/hippo/tools/shell/Global;->getClass([Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 354
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/trendmicro/hippo/Script;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 357
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Script;

    .line 358
    .local v1, "script":Lcom/trendmicro/hippo/Script;
    invoke-interface {v1, p0, p1}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 359
    return-void

    .line 355
    .end local v1    # "script":Lcom/trendmicro/hippo/Script;
    :cond_0
    const-string v1, "msg.must.implement.Script"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private loadJLine(Ljava/nio/charset/Charset;)Z
    .locals 2
    .param p1, "cs"    # Ljava/nio/charset/Charset;

    .line 897
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->attemptedJLineLoad:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 899
    iput-boolean v1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->attemptedJLineLoad:Z

    .line 900
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getConsole(Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    .line 902
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method static pipe(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .param p0, "fromProcess"    # Z
    .param p1, "from"    # Ljava/io/InputStream;
    .param p2, "to"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1029
    const/16 v0, 0x1000

    .line 1030
    .local v0, "SIZE":I
    const/16 v1, 0x1000

    :try_start_0
    new-array v2, v1, [B

    .line 1033
    .local v2, "buffer":[B
    :goto_0
    const/4 v3, 0x0

    if-nez p0, :cond_0

    .line 1034
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v4, "n":I
    goto :goto_1

    .line 1037
    .end local v4    # "n":I
    :cond_0
    :try_start_1
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1041
    .restart local v4    # "n":I
    nop

    .line 1043
    :goto_1
    if-gez v4, :cond_1

    goto :goto_3

    .line 1044
    :cond_1
    if-eqz p0, :cond_2

    .line 1045
    :try_start_2
    invoke-virtual {p2, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 1046
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 1049
    :cond_2
    :try_start_3
    invoke-virtual {p2, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 1050
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1054
    nop

    .line 1056
    .end local v4    # "n":I
    :goto_2
    goto :goto_0

    .line 1051
    .restart local v4    # "n":I
    :catch_0
    move-exception v1

    .line 1053
    .local v1, "ex":Ljava/io/IOException;
    goto :goto_3

    .line 1038
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v4    # "n":I
    :catch_1
    move-exception v1

    .line 1040
    .restart local v1    # "ex":Ljava/io/IOException;
    nop

    .line 1059
    .end local v0    # "SIZE":I
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v2    # "buffer":[B
    :goto_3
    if-eqz p0, :cond_3

    .line 1060
    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_4

    .line 1062
    :cond_3
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 1067
    :goto_4
    goto :goto_5

    .line 1064
    :catch_2
    move-exception v0

    .line 1068
    nop

    .line 1069
    :goto_5
    return-void

    .line 1058
    :catchall_0
    move-exception v0

    .line 1059
    if-eqz p0, :cond_4

    .line 1060
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_6

    .line 1062
    :cond_4
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 1067
    :goto_6
    goto :goto_7

    .line 1064
    :catch_3
    move-exception v1

    .line 1068
    :goto_7
    throw v0
.end method

.method public static print(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 220
    const/4 v0, 0x1

    invoke-static {p2, p3, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->doPrint([Ljava/lang/Object;Lcom/trendmicro/hippo/Function;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static quit(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 259
    invoke-static {p3}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    .line 260
    .local v0, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/shell/Global;->quitAction:Lcom/trendmicro/hippo/tools/shell/QuitAction;

    if-eqz v1, :cond_1

    .line 261
    array-length v1, p2

    const/4 v2, 0x0

    if-nez v1, :cond_0

    goto :goto_0

    .line 262
    :cond_0
    aget-object v1, p2, v2

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    :goto_0
    move v1, v2

    .line 263
    .local v1, "exitCode":I
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/shell/Global;->quitAction:Lcom/trendmicro/hippo/tools/shell/QuitAction;

    invoke-interface {v2, p0, v1}, Lcom/trendmicro/hippo/tools/shell/QuitAction;->quit(Lcom/trendmicro/hippo/Context;I)V

    .line 265
    .end local v1    # "exitCode":I
    :cond_1
    return-void
.end method

.method public static readFile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 842
    array-length v0, p2

    if-eqz v0, :cond_1

    .line 845
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 846
    .local v0, "path":Ljava/lang/String;
    const/4 v1, 0x0

    .line 847
    .local v1, "charCoding":Ljava/lang/String;
    array-length v2, p2

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-lt v2, v3, :cond_0

    .line 848
    aget-object v2, p2, v4

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 851
    :cond_0
    invoke-static {v0, v1, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 843
    .end local v0    # "path":Ljava/lang/String;
    .end local v1    # "charCoding":Ljava/lang/String;
    :cond_1
    const-string v0, "msg.shell.readFile.bad.args"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static readReader(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1214
    const/16 v0, 0x1000

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->readReader(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readReader(Ljava/io/Reader;I)Ljava/lang/String;
    .locals 5
    .param p0, "reader"    # Ljava/io/Reader;
    .param p1, "initialBufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1220
    new-array v0, p1, [C

    .line 1221
    .local v0, "buffer":[C
    const/4 v1, 0x0

    .line 1223
    .local v1, "offset":I
    :goto_0
    array-length v2, v0

    sub-int/2addr v2, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 1224
    .local v2, "n":I
    const/4 v3, 0x0

    if-gez v2, :cond_0

    .line 1232
    .end local v2    # "n":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([CII)V

    return-object v2

    .line 1225
    .restart local v2    # "n":I
    :cond_0
    add-int/2addr v1, v2

    .line 1226
    array-length v4, v0

    if-ne v1, v4, :cond_1

    .line 1227
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v4, v4, [C

    .line 1228
    .local v4, "tmp":[C
    invoke-static {v0, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1229
    move-object v0, v4

    .line 1231
    .end local v2    # "n":I
    .end local v4    # "tmp":[C
    :cond_1
    goto :goto_0
.end method

.method public static readUrl(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 872
    array-length v0, p2

    if-eqz v0, :cond_1

    .line 875
    const/4 v0, 0x0

    aget-object v1, p2, v0

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 876
    .local v1, "url":Ljava/lang/String;
    const/4 v2, 0x0

    .line 877
    .local v2, "charCoding":Ljava/lang/String;
    array-length v3, p2

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    .line 878
    const/4 v3, 0x1

    aget-object v3, p2, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 881
    :cond_0
    invoke-static {v1, v2, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 873
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "charCoding":Ljava/lang/String;
    :cond_1
    const-string v0, "msg.shell.readUrl.bad.args"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static readUrl(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 8
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "charCoding"    # Ljava/lang/String;
    .param p2, "urlIsFile"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1111
    const/4 v0, 0x0

    .line 1113
    .local v0, "is":Ljava/io/InputStream;
    if-nez p2, :cond_2

    .line 1114
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1115
    .local v1, "urlObj":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    .line 1116
    .local v2, "uc":Ljava/net/URLConnection;
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    move-object v0, v3

    .line 1117
    invoke-virtual {v2}, Ljava/net/URLConnection;->getContentLength()I

    move-result v3

    .line 1118
    .local v3, "chunkLength":I
    if-gtz v3, :cond_0

    .line 1119
    const/16 v3, 0x400

    .line 1120
    :cond_0
    if-nez p1, :cond_1

    .line 1121
    invoke-virtual {v2}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v4

    .line 1122
    .local v4, "type":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 1123
    invoke-static {v4}, Lcom/trendmicro/hippo/tools/shell/Global;->getCharCodingFromType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object p1, v5

    .line 1126
    .end local v1    # "urlObj":Ljava/net/URL;
    .end local v2    # "uc":Ljava/net/URLConnection;
    .end local v4    # "type":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 1127
    .end local v3    # "chunkLength":I
    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1128
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1130
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1133
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 1134
    .local v2, "length":J
    long-to-int v4, v2

    .line 1135
    .local v4, "chunkLength":I
    int-to-long v5, v4

    cmp-long v5, v5, v2

    if-nez v5, :cond_7

    .line 1138
    if-nez v4, :cond_4

    const-string v5, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1152
    if-eqz v0, :cond_3

    .line 1153
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1138
    :cond_3
    return-object v5

    .line 1140
    :cond_4
    :try_start_1
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v0, v5

    move v3, v4

    .line 1144
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "length":J
    .end local v4    # "chunkLength":I
    .restart local v3    # "chunkLength":I
    :goto_0
    if-nez p1, :cond_5

    .line 1145
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .local v1, "r":Ljava/io/Reader;
    goto :goto_1

    .line 1147
    .end local v1    # "r":Ljava/io/Reader;
    :cond_5
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 1149
    .restart local v1    # "r":Ljava/io/Reader;
    :goto_1
    invoke-static {v1, v3}, Lcom/trendmicro/hippo/tools/shell/Global;->readReader(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1152
    if-eqz v0, :cond_6

    .line 1153
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1149
    :cond_6
    return-object v2

    .line 1136
    .end local v3    # "chunkLength":I
    .local v1, "f":Ljava/io/File;
    .restart local v2    # "length":J
    .restart local v4    # "chunkLength":I
    :cond_7
    :try_start_2
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too big file size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .end local p0    # "filePath":Ljava/lang/String;
    .end local p1    # "charCoding":Ljava/lang/String;
    .end local p2    # "urlIsFile":Z
    throw v5

    .line 1131
    .end local v2    # "length":J
    .end local v4    # "chunkLength":I
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local p0    # "filePath":Ljava/lang/String;
    .restart local p1    # "charCoding":Ljava/lang/String;
    .restart local p2    # "urlIsFile":Z
    :cond_8
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot read file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .end local p0    # "filePath":Ljava/lang/String;
    .end local p1    # "charCoding":Ljava/lang/String;
    .end local p2    # "urlIsFile":Z
    throw v2

    .line 1129
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local p0    # "filePath":Ljava/lang/String;
    .restart local p1    # "charCoding":Ljava/lang/String;
    .restart local p2    # "urlIsFile":Z
    :cond_9
    new-instance v2, Ljava/io/FileNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File not found: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .end local v0    # "is":Ljava/io/InputStream;
    .end local p0    # "filePath":Ljava/lang/String;
    .end local p1    # "charCoding":Ljava/lang/String;
    .end local p2    # "urlIsFile":Z
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1152
    .end local v1    # "f":Ljava/io/File;
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local p0    # "filePath":Ljava/lang/String;
    .restart local p1    # "charCoding":Ljava/lang/String;
    .restart local p2    # "urlIsFile":Z
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_a

    .line 1153
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1154
    :cond_a
    throw v1
.end method

.method public static readline(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1168
    invoke-static {p3}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v0

    .line 1170
    .local v0, "self":Lcom/trendmicro/hippo/tools/shell/Global;
    array-length v1, p2

    if-lez v1, :cond_0

    .line 1171
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    const/4 v2, 0x0

    aget-object v2, p2, v2

    invoke-static {v2}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1173
    :cond_0
    iget-object v1, v0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->readLine()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "msgId"    # Ljava/lang/String;

    .line 1236
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1237
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method static reportRuntimeError(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "msgId"    # Ljava/lang/String;
    .param p1, "msgArg"    # Ljava/lang/String;

    .line 1242
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1243
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    return-object v1
.end method

.method public static runCommand(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 25
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 689
    move-object/from16 v0, p2

    array-length v1, v0

    .line 690
    .local v1, "L":I
    if-eqz v1, :cond_19

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_1

    aget-object v3, v0, v2

    instance-of v3, v3, Lcom/trendmicro/hippo/Scriptable;

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v1

    move-object/from16 v1, p0

    goto/16 :goto_f

    .line 693
    :cond_1
    :goto_0
    const/4 v3, 0x0

    .line 694
    .local v3, "wd":Ljava/io/File;
    const/4 v4, 0x0

    .line 695
    .local v4, "in":Ljava/io/InputStream;
    const/4 v5, 0x0

    .local v5, "out":Ljava/io/OutputStream;
    const/4 v6, 0x0

    .line 696
    .local v6, "err":Ljava/io/OutputStream;
    const/4 v7, 0x0

    .local v7, "outBytes":Ljava/io/ByteArrayOutputStream;
    const/4 v8, 0x0

    .line 697
    .local v8, "errBytes":Ljava/io/ByteArrayOutputStream;
    const/4 v9, 0x0

    .local v9, "outObj":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 698
    .local v10, "errObj":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 699
    .local v11, "environment":[Ljava/lang/String;
    const/4 v12, 0x0

    .line 700
    .local v12, "params":Lcom/trendmicro/hippo/Scriptable;
    const/4 v13, 0x0

    .line 701
    .local v13, "addArgs":[Ljava/lang/Object;
    add-int/lit8 v14, v1, -0x1

    aget-object v14, v0, v14

    instance-of v14, v14, Lcom/trendmicro/hippo/Scriptable;

    const-string v15, "err"

    const-string v2, "output"

    if-eqz v14, :cond_f

    .line 702
    add-int/lit8 v14, v1, -0x1

    aget-object v14, v0, v14

    move-object v12, v14

    check-cast v12, Lcom/trendmicro/hippo/Scriptable;

    .line 703
    add-int/lit8 v1, v1, -0x1

    .line 704
    const-string v14, "env"

    invoke-static {v12, v14}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 705
    .local v14, "envObj":Ljava/lang/Object;
    move/from16 v17, v1

    .end local v1    # "L":I
    .local v17, "L":I
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v14, v1, :cond_7

    .line 706
    if-nez v14, :cond_2

    .line 707
    const/4 v1, 0x0

    new-array v11, v1, [Ljava/lang/String;

    move-object/from16 v16, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    goto/16 :goto_3

    .line 709
    :cond_2
    instance-of v1, v14, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_6

    .line 712
    move-object v1, v14

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 713
    .local v1, "envHash":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v16, v3

    .end local v3    # "wd":Ljava/io/File;
    .local v16, "wd":Ljava/io/File;
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getPropertyIds(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v3

    .line 714
    .local v3, "ids":[Ljava/lang/Object;
    move-object/from16 v18, v4

    .end local v4    # "in":Ljava/io/InputStream;
    .local v18, "in":Ljava/io/InputStream;
    array-length v4, v3

    new-array v11, v4, [Ljava/lang/String;

    .line 715
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    move-object/from16 v19, v5

    .end local v5    # "out":Ljava/io/OutputStream;
    .local v19, "out":Ljava/io/OutputStream;
    array-length v5, v3

    if-eq v4, v5, :cond_5

    .line 716
    aget-object v5, v3, v4

    .line 718
    .local v5, "keyObj":Ljava/lang/Object;
    move-object/from16 v20, v3

    .end local v3    # "ids":[Ljava/lang/Object;
    .local v20, "ids":[Ljava/lang/Object;
    instance-of v3, v5, Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 719
    move-object v3, v5

    check-cast v3, Ljava/lang/String;

    .line 720
    .local v3, "key":Ljava/lang/String;
    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v24, v21

    move-object/from16 v21, v1

    move-object/from16 v1, v24

    .local v21, "val":Ljava/lang/Object;
    goto :goto_2

    .line 722
    .end local v3    # "key":Ljava/lang/String;
    .end local v21    # "val":Ljava/lang/Object;
    :cond_3
    move-object v3, v5

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 723
    .local v3, "ikey":I
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v21

    .line 724
    .local v21, "key":Ljava/lang/String;
    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v3, v21

    move-object/from16 v21, v1

    move-object/from16 v1, v22

    .line 726
    .local v1, "val":Ljava/lang/Object;
    .local v3, "key":Ljava/lang/String;
    .local v21, "envHash":Lcom/trendmicro/hippo/Scriptable;
    :goto_2
    move-object/from16 v22, v5

    .end local v5    # "keyObj":Ljava/lang/Object;
    .local v22, "keyObj":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/ScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-ne v1, v5, :cond_4

    .line 727
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 729
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v23, v3

    .end local v3    # "key":Ljava/lang/String;
    .local v23, "key":Ljava/lang/String;
    const/16 v3, 0x3d

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v11, v4

    .line 715
    .end local v1    # "val":Ljava/lang/Object;
    .end local v22    # "keyObj":Ljava/lang/Object;
    .end local v23    # "key":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v5, v19

    move-object/from16 v3, v20

    move-object/from16 v1, v21

    goto :goto_1

    .end local v20    # "ids":[Ljava/lang/Object;
    .end local v21    # "envHash":Lcom/trendmicro/hippo/Scriptable;
    .local v1, "envHash":Lcom/trendmicro/hippo/Scriptable;
    .local v3, "ids":[Ljava/lang/Object;
    :cond_5
    move-object/from16 v21, v1

    move-object/from16 v20, v3

    .end local v1    # "envHash":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "ids":[Ljava/lang/Object;
    .restart local v20    # "ids":[Ljava/lang/Object;
    .restart local v21    # "envHash":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_3

    .line 710
    .end local v16    # "wd":Ljava/io/File;
    .end local v18    # "in":Ljava/io/InputStream;
    .end local v19    # "out":Ljava/io/OutputStream;
    .end local v20    # "ids":[Ljava/lang/Object;
    .end local v21    # "envHash":Lcom/trendmicro/hippo/Scriptable;
    .local v3, "wd":Ljava/io/File;
    .local v4, "in":Ljava/io/InputStream;
    .local v5, "out":Ljava/io/OutputStream;
    :cond_6
    const-string v1, "msg.runCommand.bad.env"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 705
    :cond_7
    move-object/from16 v16, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    .line 733
    .end local v3    # "wd":Ljava/io/File;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v16    # "wd":Ljava/io/File;
    .restart local v18    # "in":Ljava/io/InputStream;
    .restart local v19    # "out":Ljava/io/OutputStream;
    :goto_3
    const-string v1, "dir"

    invoke-static {v12, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 734
    .local v1, "wdObj":Ljava/lang/Object;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v3, :cond_8

    .line 735
    new-instance v3, Ljava/io/File;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .end local v16    # "wd":Ljava/io/File;
    .restart local v3    # "wd":Ljava/io/File;
    goto :goto_4

    .line 734
    .end local v3    # "wd":Ljava/io/File;
    .restart local v16    # "wd":Ljava/io/File;
    :cond_8
    move-object/from16 v3, v16

    .line 738
    .end local v16    # "wd":Ljava/io/File;
    .restart local v3    # "wd":Ljava/io/File;
    :goto_4
    const-string v4, "input"

    invoke-static {v12, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 739
    .local v4, "inObj":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v5, :cond_9

    .line 740
    invoke-static {v4}, Lcom/trendmicro/hippo/tools/shell/Global;->toInputStream(Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v5

    move-object/from16 v18, v5

    .line 742
    :cond_9
    invoke-static {v12, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 743
    sget-object v5, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v5, :cond_a

    .line 744
    invoke-static {v9}, Lcom/trendmicro/hippo/tools/shell/Global;->toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;

    move-result-object v5

    .line 745
    .end local v19    # "out":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    if-nez v5, :cond_b

    .line 746
    new-instance v16, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object/from16 v7, v16

    .line 747
    move-object v5, v7

    goto :goto_5

    .line 743
    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v19    # "out":Ljava/io/OutputStream;
    :cond_a
    move-object/from16 v5, v19

    .line 750
    .end local v19    # "out":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    :cond_b
    :goto_5
    invoke-static {v12, v15}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 751
    move-object/from16 v20, v1

    .end local v1    # "wdObj":Ljava/lang/Object;
    .local v20, "wdObj":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v10, v1, :cond_d

    .line 752
    invoke-static {v10}, Lcom/trendmicro/hippo/tools/shell/Global;->toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;

    move-result-object v1

    .line 753
    .end local v6    # "err":Ljava/io/OutputStream;
    .local v1, "err":Ljava/io/OutputStream;
    if-nez v1, :cond_c

    .line 754
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v8, v6

    .line 755
    move-object v1, v8

    move-object v6, v1

    goto :goto_6

    .line 753
    :cond_c
    move-object v6, v1

    .line 758
    .end local v1    # "err":Ljava/io/OutputStream;
    .restart local v6    # "err":Ljava/io/OutputStream;
    :cond_d
    :goto_6
    const-string v1, "args"

    invoke-static {v12, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 759
    .local v1, "addArgsObj":Ljava/lang/Object;
    move-object/from16 v16, v3

    .end local v3    # "wd":Ljava/io/File;
    .restart local v16    # "wd":Ljava/io/File;
    sget-object v3, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v3, :cond_e

    .line 760
    nop

    .line 761
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/tools/shell/Global;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 760
    invoke-static {v1, v3}, Lcom/trendmicro/hippo/Context;->toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 762
    .local v3, "s":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v19, v1

    move-object/from16 v1, p0

    .end local v1    # "addArgsObj":Ljava/lang/Object;
    .local v19, "addArgsObj":Ljava/lang/Object;
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Context;->getElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v13

    move-object v14, v11

    move/from16 v3, v17

    move-object v11, v8

    move-object v8, v13

    move-object v13, v10

    move-object v10, v7

    move-object/from16 v24, v12

    move-object v12, v9

    move-object/from16 v9, v24

    goto :goto_7

    .line 759
    .end local v3    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v19    # "addArgsObj":Ljava/lang/Object;
    .restart local v1    # "addArgsObj":Ljava/lang/Object;
    :cond_e
    move-object/from16 v19, v1

    move-object/from16 v1, p0

    .end local v1    # "addArgsObj":Ljava/lang/Object;
    .restart local v19    # "addArgsObj":Ljava/lang/Object;
    move-object v14, v11

    move/from16 v3, v17

    move-object v11, v8

    move-object v8, v13

    move-object v13, v10

    move-object v10, v7

    move-object/from16 v24, v12

    move-object v12, v9

    move-object/from16 v9, v24

    goto :goto_7

    .line 701
    .end local v14    # "envObj":Ljava/lang/Object;
    .end local v16    # "wd":Ljava/io/File;
    .end local v17    # "L":I
    .end local v18    # "in":Ljava/io/InputStream;
    .end local v19    # "addArgsObj":Ljava/lang/Object;
    .end local v20    # "wdObj":Ljava/lang/Object;
    .local v1, "L":I
    .local v3, "wd":Ljava/io/File;
    .local v4, "in":Ljava/io/InputStream;
    :cond_f
    move-object/from16 v16, v3

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    move v3, v1

    move-object/from16 v1, p0

    .end local v1    # "L":I
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "out":Ljava/io/OutputStream;
    .local v3, "L":I
    .restart local v16    # "wd":Ljava/io/File;
    .restart local v18    # "in":Ljava/io/InputStream;
    .local v19, "out":Ljava/io/OutputStream;
    move-object v14, v11

    move-object v11, v8

    move-object v8, v13

    move-object v13, v10

    move-object v10, v7

    move-object/from16 v24, v12

    move-object v12, v9

    move-object/from16 v9, v24

    .line 765
    .end local v7    # "outBytes":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "out":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    .local v8, "addArgs":[Ljava/lang/Object;
    .local v9, "params":Lcom/trendmicro/hippo/Scriptable;
    .local v10, "outBytes":Ljava/io/ByteArrayOutputStream;
    .local v11, "errBytes":Ljava/io/ByteArrayOutputStream;
    .local v12, "outObj":Ljava/lang/Object;
    .local v13, "errObj":Ljava/lang/Object;
    .local v14, "environment":[Ljava/lang/String;
    :goto_7
    invoke-static/range {p3 .. p3}, Lcom/trendmicro/hippo/tools/shell/Global;->getInstance(Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/tools/shell/Global;

    move-result-object v17

    .line 766
    .local v17, "global":Lcom/trendmicro/hippo/tools/shell/Global;
    if-nez v5, :cond_11

    .line 767
    if-eqz v17, :cond_10

    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v4

    goto :goto_8

    :cond_10
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    :goto_8
    move-object v5, v4

    move-object/from16 v19, v5

    goto :goto_9

    .line 766
    :cond_11
    move-object/from16 v19, v5

    .line 769
    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v19    # "out":Ljava/io/OutputStream;
    :goto_9
    if-nez v6, :cond_13

    .line 770
    if-eqz v17, :cond_12

    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v4

    goto :goto_a

    :cond_12
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    :goto_a
    move-object v6, v4

    move-object/from16 v20, v6

    goto :goto_b

    .line 769
    :cond_13
    move-object/from16 v20, v6

    .line 777
    .end local v6    # "err":Ljava/io/OutputStream;
    .local v20, "err":Ljava/io/OutputStream;
    :goto_b
    if-nez v8, :cond_14

    move v4, v3

    goto :goto_c

    :cond_14
    array-length v4, v8

    add-int/2addr v4, v3

    :goto_c
    new-array v7, v4, [Ljava/lang/String;

    .line 778
    .local v7, "cmd":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d
    if-eq v4, v3, :cond_15

    .line 779
    aget-object v5, v0, v4

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v7, v4

    .line 778
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 781
    .end local v4    # "i":I
    :cond_15
    if-eqz v8, :cond_16

    .line 782
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_e
    array-length v5, v8

    if-eq v4, v5, :cond_16

    .line 783
    add-int v5, v3, v4

    aget-object v6, v8, v4

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v7, v5

    .line 782
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 787
    .end local v4    # "i":I
    :cond_16
    move-object v4, v7

    move-object v5, v14

    move-object/from16 v6, v16

    move-object/from16 v21, v7

    .end local v7    # "cmd":[Ljava/lang/String;
    .local v21, "cmd":[Ljava/lang/String;
    move-object/from16 v7, v18

    move-object/from16 v22, v8

    .end local v8    # "addArgs":[Ljava/lang/Object;
    .local v22, "addArgs":[Ljava/lang/Object;
    move-object/from16 v8, v19

    move-object v0, v9

    .end local v9    # "params":Lcom/trendmicro/hippo/Scriptable;
    .local v0, "params":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v9, v20

    invoke-static/range {v4 .. v9}, Lcom/trendmicro/hippo/tools/shell/Global;->runProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)I

    move-result v4

    .line 788
    .local v4, "exitCode":I
    if-eqz v10, :cond_17

    .line 789
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 790
    .local v5, "s":Ljava/lang/String;
    invoke-static {v0, v2, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 792
    .end local v5    # "s":Ljava/lang/String;
    :cond_17
    if-eqz v11, :cond_18

    .line 793
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v13}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 794
    .local v2, "s":Ljava/lang/String;
    invoke-static {v0, v15, v2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 797
    .end local v2    # "s":Ljava/lang/String;
    :cond_18
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v4}, Ljava/lang/Integer;-><init>(I)V

    return-object v2

    .line 690
    .end local v0    # "params":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "L":I
    .end local v4    # "exitCode":I
    .end local v10    # "outBytes":Ljava/io/ByteArrayOutputStream;
    .end local v11    # "errBytes":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "outObj":Ljava/lang/Object;
    .end local v13    # "errObj":Ljava/lang/Object;
    .end local v14    # "environment":[Ljava/lang/String;
    .end local v16    # "wd":Ljava/io/File;
    .end local v17    # "global":Lcom/trendmicro/hippo/tools/shell/Global;
    .end local v18    # "in":Ljava/io/InputStream;
    .end local v19    # "out":Ljava/io/OutputStream;
    .end local v20    # "err":Ljava/io/OutputStream;
    .end local v21    # "cmd":[Ljava/lang/String;
    .end local v22    # "addArgs":[Ljava/lang/Object;
    .restart local v1    # "L":I
    :cond_19
    move v3, v1

    move-object/from16 v1, p0

    .line 691
    .end local v1    # "L":I
    .restart local v3    # "L":I
    :goto_f
    const-string v0, "msg.runCommand.bad.args"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static runProcess([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)I
    .locals 7
    .param p0, "cmd"    # [Ljava/lang/String;
    .param p1, "environment"    # [Ljava/lang/String;
    .param p2, "wd"    # Ljava/io/File;
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "out"    # Ljava/io/OutputStream;
    .param p5, "err"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 970
    if-nez p1, :cond_0

    .line 971
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v0

    .local v0, "p":Ljava/lang/Process;
    goto :goto_0

    .line 973
    .end local v0    # "p":Ljava/lang/Process;
    :cond_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v0

    .line 977
    .restart local v0    # "p":Ljava/lang/Process;
    :goto_0
    const/4 v1, 0x0

    .line 978
    .local v1, "inThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    if-eqz p3, :cond_1

    .line 979
    :try_start_0
    new-instance v2, Lcom/trendmicro/hippo/tools/shell/PipeThread;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v2, v3, p3, v4}, Lcom/trendmicro/hippo/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 980
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->start()V

    goto :goto_1

    .line 982
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 985
    :goto_1
    const/4 v2, 0x0

    .line 986
    .local v2, "outThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    const/4 v3, 0x1

    if-eqz p4, :cond_2

    .line 987
    new-instance v4, Lcom/trendmicro/hippo/tools/shell/PipeThread;

    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v3, v5, p4}, Lcom/trendmicro/hippo/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    move-object v2, v4

    .line 988
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->start()V

    goto :goto_2

    .line 990
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 993
    :goto_2
    const/4 v4, 0x0

    .line 994
    .local v4, "errThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    if-eqz p5, :cond_3

    .line 995
    new-instance v5, Lcom/trendmicro/hippo/tools/shell/PipeThread;

    invoke-virtual {v0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v3, v6, p5}, Lcom/trendmicro/hippo/tools/shell/PipeThread;-><init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    move-object v4, v5

    .line 996
    invoke-virtual {v4}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->start()V

    goto :goto_3

    .line 998
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1004
    :goto_3
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I

    .line 1005
    if-eqz v2, :cond_4

    .line 1006
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->join()V

    .line 1008
    :cond_4
    if-eqz v1, :cond_5

    .line 1009
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->join()V

    .line 1011
    :cond_5
    if-eqz v4, :cond_6

    .line 1012
    invoke-virtual {v4}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1014
    :cond_6
    nop

    .line 1019
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Process;->exitValue()I

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1021
    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 1019
    return v3

    .line 1015
    :catch_0
    move-exception v3

    .line 1016
    goto :goto_3

    .line 1021
    .end local v1    # "inThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    .end local v2    # "outThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    .end local v4    # "errThread":Lcom/trendmicro/hippo/tools/shell/PipeThread;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 1022
    throw v1
.end method

.method public static seal(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 806
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-eq v0, v1, :cond_4

    .line 807
    aget-object v1, p2, v0

    .line 808
    .local v1, "arg":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v2, :cond_1

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    goto :goto_1

    .line 806
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 810
    .restart local v1    # "arg":Ljava/lang/Object;
    :cond_1
    :goto_1
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_3

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_2

    goto :goto_2

    .line 814
    :cond_2
    const-string v2, "msg.shell.seal.not.scriptable"

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 812
    :cond_3
    :goto_2
    const-string v2, "msg.shell.seal.not.object"

    invoke-static {v2}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 819
    .end local v0    # "i":I
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    array-length v1, p2

    if-eq v0, v1, :cond_5

    .line 820
    aget-object v1, p2, v0

    .line 821
    .restart local v1    # "arg":Ljava/lang/Object;
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ScriptableObject;->sealObject()V

    .line 819
    .end local v1    # "arg":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 823
    .end local v0    # "i":I
    :cond_5
    return-void
.end method

.method public static serialize(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)V
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 384
    array-length v0, p2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 389
    const/4 v0, 0x0

    aget-object v0, p2, v0

    .line 390
    .local v0, "obj":Ljava/lang/Object;
    const/4 v1, 0x1

    aget-object v1, p2, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 391
    .local v1, "filename":Ljava/lang/String;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 392
    .local v2, "fos":Ljava/io/FileOutputStream;
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    .line 393
    .local v3, "scope":Lcom/trendmicro/hippo/Scriptable;
    new-instance v4, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;

    invoke-direct {v4, v2, v3}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;-><init>(Ljava/io/OutputStream;Lcom/trendmicro/hippo/Scriptable;)V

    .line 394
    .local v4, "out":Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;
    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 395
    invoke-virtual {v4}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->close()V

    .line 396
    return-void

    .line 385
    .end local v0    # "obj":Ljava/lang/Object;
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "scope":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "out":Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;
    :cond_0
    const-string v0, "Expected an object to serialize and a filename to write the serialization to"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public static spawn(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 593
    invoke-interface {p3}, Lcom/trendmicro/hippo/Function;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 595
    .local v0, "scope":Lcom/trendmicro/hippo/Scriptable;
    array-length v1, p2

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    aget-object v1, p2, v2

    instance-of v1, v1, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_2

    .line 596
    const/4 v1, 0x0

    .line 597
    .local v1, "newArgs":[Ljava/lang/Object;
    array-length v3, p2

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    aget-object v3, p2, v4

    instance-of v3, v3, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_0

    .line 598
    aget-object v3, p2, v4

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/Context;->getElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v1

    .line 600
    :cond_0
    if-nez v1, :cond_1

    sget-object v1, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 601
    :cond_1
    new-instance v3, Lcom/trendmicro/hippo/tools/shell/Runner;

    aget-object v2, p2, v2

    check-cast v2, Lcom/trendmicro/hippo/Function;

    invoke-direct {v3, v0, v2, v1}, Lcom/trendmicro/hippo/tools/shell/Runner;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;)V

    move-object v1, v3

    .line 602
    .local v1, "runner":Lcom/trendmicro/hippo/tools/shell/Runner;
    goto :goto_0

    .end local v1    # "runner":Lcom/trendmicro/hippo/tools/shell/Runner;
    :cond_2
    array-length v1, p2

    if-eqz v1, :cond_3

    aget-object v1, p2, v2

    instance-of v1, v1, Lcom/trendmicro/hippo/Script;

    if-eqz v1, :cond_3

    .line 603
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/Runner;

    aget-object v2, p2, v2

    check-cast v2, Lcom/trendmicro/hippo/Script;

    invoke-direct {v1, v0, v2}, Lcom/trendmicro/hippo/tools/shell/Runner;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Script;)V

    .line 607
    .restart local v1    # "runner":Lcom/trendmicro/hippo/tools/shell/Runner;
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getFactory()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v2

    iput-object v2, v1, Lcom/trendmicro/hippo/tools/shell/Runner;->factory:Lcom/trendmicro/hippo/ContextFactory;

    .line 608
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 609
    .local v2, "thread":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 610
    return-object v2

    .line 605
    .end local v1    # "runner":Lcom/trendmicro/hippo/tools/shell/Runner;
    .end local v2    # "thread":Ljava/lang/Thread;
    :cond_3
    const-string v1, "msg.spawn.args"

    invoke-static {v1}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public static sync(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 637
    array-length v0, p2

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    array-length v0, p2

    const/4 v2, 0x2

    if-gt v0, v2, :cond_1

    const/4 v0, 0x0

    aget-object v3, p2, v0

    instance-of v3, v3, Lcom/trendmicro/hippo/Function;

    if-eqz v3, :cond_1

    .line 638
    const/4 v3, 0x0

    .line 639
    .local v3, "syncObject":Ljava/lang/Object;
    array-length v4, p2

    if-ne v4, v2, :cond_0

    aget-object v2, p2, v1

    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v2, v4, :cond_0

    .line 640
    aget-object v3, p2, v1

    .line 642
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/Synchronizer;

    aget-object v0, p2, v0

    check-cast v0, Lcom/trendmicro/hippo/Function;

    invoke-direct {v1, v0, v3}, Lcom/trendmicro/hippo/Synchronizer;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    return-object v1

    .line 645
    .end local v3    # "syncObject":Ljava/lang/Object;
    :cond_1
    const-string v0, "msg.sync.args"

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/shell/Global;->reportRuntimeError(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static toInputStream(Ljava/lang/Object;)Ljava/io/InputStream;
    .locals 5
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1074
    const/4 v0, 0x0

    .line 1075
    .local v0, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 1076
    .local v1, "s":Ljava/lang/String;
    instance-of v2, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v2, :cond_3

    .line 1077
    move-object v2, p0

    check-cast v2, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v2}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 1078
    .local v2, "unwrapped":Ljava/lang/Object;
    instance-of v3, v2, Ljava/io/InputStream;

    if-eqz v3, :cond_0

    .line 1079
    move-object v0, v2

    check-cast v0, Ljava/io/InputStream;

    goto :goto_0

    .line 1080
    :cond_0
    instance-of v3, v2, [B

    if-eqz v3, :cond_1

    .line 1081
    new-instance v3, Ljava/io/ByteArrayInputStream;

    move-object v4, v2

    check-cast v4, [B

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v0, v3

    goto :goto_0

    .line 1082
    :cond_1
    instance-of v3, v2, Ljava/io/Reader;

    if-eqz v3, :cond_2

    .line 1083
    move-object v3, v2

    check-cast v3, Ljava/io/Reader;

    invoke-static {v3}, Lcom/trendmicro/hippo/tools/shell/Global;->readReader(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1084
    :cond_2
    instance-of v3, v2, [C

    if-eqz v3, :cond_3

    .line 1085
    new-instance v3, Ljava/lang/String;

    move-object v4, v2

    check-cast v4, [C

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([C)V

    move-object v1, v3

    .line 1088
    .end local v2    # "unwrapped":Ljava/lang/Object;
    :cond_3
    :goto_0
    if-nez v0, :cond_5

    .line 1089
    if-nez v1, :cond_4

    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1090
    :cond_4
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v0, v2

    .line 1092
    :cond_5
    return-object v0
.end method

.method private static toOutputStream(Ljava/lang/Object;)Ljava/io/OutputStream;
    .locals 3
    .param p0, "value"    # Ljava/lang/Object;

    .line 1096
    const/4 v0, 0x0

    .line 1097
    .local v0, "os":Ljava/io/OutputStream;
    instance-of v1, p0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v1, :cond_0

    .line 1098
    move-object v1, p0

    check-cast v1, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 1099
    .local v1, "unwrapped":Ljava/lang/Object;
    instance-of v2, v1, Ljava/io/OutputStream;

    if-eqz v2, :cond_0

    .line 1100
    move-object v0, v1

    check-cast v0, Ljava/io/OutputStream;

    .line 1103
    .end local v1    # "unwrapped":Ljava/lang/Object;
    :cond_0
    return-object v0
.end method

.method public static toint32(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 890
    array-length v0, p2

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    aget-object v0, p2, v0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 891
    .local v0, "arg":Ljava/lang/Object;
    :goto_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 892
    return-object v0

    .line 893
    :cond_1
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1
.end method

.method public static version(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)D
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 275
    array-length v0, p2

    if-lez v0, :cond_0

    .line 276
    const/4 v0, 0x0

    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 277
    .local v0, "d":D
    double-to-int v2, v0

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Context;->setLanguageVersion(I)V

    .line 279
    .end local v0    # "d":D
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    int-to-double v0, v0

    return-wide v0
.end method

.method public static write(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/Function;)Ljava/lang/Object;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "funObj"    # Lcom/trendmicro/hippo/Function;

    .line 229
    const/4 v0, 0x0

    invoke-static {p2, p3, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->doPrint([Ljava/lang/Object;Lcom/trendmicro/hippo/Function;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getConsole(Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    .locals 2
    .param p1, "cs"    # Ljava/nio/charset/Charset;

    .line 906
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/shell/Global;->loadJLine(Ljava/nio/charset/Charset;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 907
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/Global;->getIn()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getConsole(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    .line 909
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    return-object v0
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .line 934
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->errStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    :cond_0
    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 913
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->attemptedJLineLoad:Z

    if-nez v0, :cond_0

    .line 914
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->loadJLine(Ljava/nio/charset/Charset;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 915
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->console:Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getIn()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->inStream:Ljava/io/InputStream;

    .line 918
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->inStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    sget-object v0, Ljava/lang/System;->in:Ljava/io/InputStream;

    :cond_1
    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .line 926
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->outStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    :cond_0
    return-object v0
.end method

.method public getPrompts(Lcom/trendmicro/hippo/Context;)[Ljava/lang/String;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 416
    const-string v0, "prompts"

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 417
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 419
    .local v0, "promptsJS":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_2

    .line 420
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 421
    .local v1, "s":Lcom/trendmicro/hippo/Scriptable;
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 422
    const/4 v3, 0x1

    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->hasProperty(Lcom/trendmicro/hippo/Scriptable;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 424
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v4

    .line 425
    .local v4, "elem0":Ljava/lang/Object;
    instance-of v5, v4, Lcom/trendmicro/hippo/Function;

    if-eqz v5, :cond_0

    .line 426
    move-object v5, v4

    check-cast v5, Lcom/trendmicro/hippo/Function;

    new-array v6, v2, [Ljava/lang/Object;

    invoke-interface {v5, p1, p0, v1, v6}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 429
    :cond_0
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    .line 430
    invoke-static {v1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    .line 431
    .local v5, "elem1":Ljava/lang/Object;
    instance-of v6, v5, Lcom/trendmicro/hippo/Function;

    if-eqz v6, :cond_1

    .line 432
    move-object v6, v5

    check-cast v6, Lcom/trendmicro/hippo/Function;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v6, p1, p0, v1, v2}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 435
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    .line 439
    .end local v0    # "promptsJS":Ljava/lang/Object;
    .end local v1    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "elem0":Ljava/lang/Object;
    .end local v5    # "elem1":Ljava/lang/Object;
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    return-object v0
.end method

.method public init(Lcom/trendmicro/hippo/Context;)V
    .locals 23
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 118
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lcom/trendmicro/hippo/tools/shell/Global;->sealedStdLib:Z

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->initStandardObjects(Lcom/trendmicro/hippo/Context;Z)V

    .line 119
    const-string v3, "defineClass"

    const-string v4, "deserialize"

    const-string v5, "doctest"

    const-string v6, "gc"

    const-string v7, "help"

    const-string v8, "load"

    const-string v9, "loadClass"

    const-string v10, "print"

    const-string v11, "quit"

    const-string v12, "readline"

    const-string v13, "readFile"

    const-string v14, "readUrl"

    const-string v15, "runCommand"

    const-string v16, "seal"

    const-string v17, "serialize"

    const-string v18, "spawn"

    const-string v19, "sync"

    const-string v20, "toint32"

    const-string v21, "version"

    const-string v22, "write"

    filled-new-array/range {v3 .. v22}, [Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "names":[Ljava/lang/String;
    const-class v3, Lcom/trendmicro/hippo/tools/shell/Global;

    const/4 v4, 0x2

    invoke-virtual {v0, v2, v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->defineFunctionProperties([Ljava/lang/String;Ljava/lang/Class;I)V

    .line 146
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/Environment;->defineClass(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 147
    new-instance v3, Lcom/trendmicro/hippo/tools/shell/Environment;

    invoke-direct {v3, v0}, Lcom/trendmicro/hippo/tools/shell/Environment;-><init>(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 148
    .local v3, "environment":Lcom/trendmicro/hippo/tools/shell/Environment;
    const-string v5, "environment"

    invoke-virtual {v0, v5, v3, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 151
    const/4 v5, 0x0

    invoke-virtual {v1, v0, v5}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/NativeArray;

    iput-object v5, v0, Lcom/trendmicro/hippo/tools/shell/Global;->history:Lcom/trendmicro/hippo/NativeArray;

    .line 152
    const-string v6, "history"

    invoke-virtual {v0, v6, v5, v4}, Lcom/trendmicro/hippo/tools/shell/Global;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 154
    const/4 v4, 0x1

    iput-boolean v4, v0, Lcom/trendmicro/hippo/tools/shell/Global;->initialized:Z

    .line 155
    return-void
.end method

.method public init(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 108
    #disallowed odex opcode
    #iput-object-volatile v0, p0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;
    nop

    move v0, v0

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 112
    return-void
.end method

.method public initQuitAction(Lcom/trendmicro/hippo/tools/shell/QuitAction;)V
    .locals 2
    .param p1, "quitAction"    # Lcom/trendmicro/hippo/tools/shell/QuitAction;

    .line 98
    if-eqz p1, :cond_1

    .line 100
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->quitAction:Lcom/trendmicro/hippo/tools/shell/QuitAction;

    if-nez v0, :cond_0

    .line 103
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->quitAction:Lcom/trendmicro/hippo/tools/shell/QuitAction;

    .line 104
    return-void

    .line 101
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The method is once-call."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "quitAction is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public installRequire(Lcom/trendmicro/hippo/Context;Ljava/util/List;Z)Lcom/trendmicro/hippo/commonjs/module/Require;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "sandboxed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/trendmicro/hippo/commonjs/module/Require;"
        }
    .end annotation

    .line 159
    .local p2, "modulePath":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "/"

    new-instance v1, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;

    invoke-direct {v1}, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;-><init>()V

    .line 160
    .local v1, "rb":Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;
    invoke-virtual {v1, p3}, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->setSandboxed(Z)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;

    .line 161
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v2, "uris":Ljava/util/List;, "Ljava/util/List<Ljava/net/URI;>;"
    if-eqz p2, :cond_2

    .line 163
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 165
    .local v4, "path":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 166
    .local v5, "uri":Ljava/net/URI;
    invoke-virtual {v5}, Ljava/net/URI;->isAbsolute()Z

    move-result v6

    if-nez v6, :cond_0

    .line 168
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    move-object v5, v6

    .line 170
    :cond_0
    invoke-virtual {v5}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 173
    new-instance v6, Ljava/net/URI;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object v5, v6

    .line 175
    :cond_1
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    nop

    .line 179
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "uri":Ljava/net/URI;
    goto :goto_0

    .line 176
    .restart local v4    # "path":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 177
    .local v0, "usx":Ljava/net/URISyntaxException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 181
    .end local v0    # "usx":Ljava/net/URISyntaxException;
    .end local v4    # "path":Ljava/lang/String;
    :cond_2
    new-instance v0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;

    new-instance v3, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V

    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;-><init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->setModuleScriptProvider(Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;)Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;

    .line 184
    invoke-virtual {v1, p1, p0}, Lcom/trendmicro/hippo/commonjs/module/RequireBuilder;->createRequire(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/Require;

    move-result-object v0

    .line 185
    .local v0, "require":Lcom/trendmicro/hippo/commonjs/module/Require;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/commonjs/module/Require;->install(Lcom/trendmicro/hippo/Scriptable;)V

    .line 186
    return-object v0
.end method

.method public isInitialized()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/Global;->initialized:Z

    return v0
.end method

.method public runDoctest(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 29
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "session"    # Ljava/lang/String;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I

    .line 458
    move-object/from16 v1, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lcom/trendmicro/hippo/tools/shell/Global;->doctestCanonicalizations:Ljava/util/HashMap;

    .line 459
    const-string v0, "\r\n?|\n"

    move-object/from16 v10, p3

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 460
    .local v11, "lines":[Ljava/lang/String;
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    const/4 v12, 0x0

    aget-object v0, v0, v12

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 461
    .local v13, "prompt0":Ljava/lang/String;
    iget-object v0, v1, Lcom/trendmicro/hippo/tools/shell/Global;->prompts:[Ljava/lang/String;

    const/4 v14, 0x1

    aget-object v0, v0, v14

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    .line 462
    .local v15, "prompt1":Ljava/lang/String;
    const/4 v0, 0x0

    .line 463
    .local v0, "testCount":I
    const/4 v2, 0x0

    .line 464
    .local v2, "i":I
    :goto_0
    array-length v3, v11

    if-ge v2, v3, :cond_0

    aget-object v3, v11, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 465
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 467
    :cond_0
    :goto_1
    array-length v3, v11

    if-ge v2, v3, :cond_7

    .line 468
    aget-object v3, v11, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 469
    .local v3, "inputString":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\n"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 470
    add-int/lit8 v2, v2, 0x1

    move-object v6, v3

    .line 471
    .end local v3    # "inputString":Ljava/lang/String;
    .local v6, "inputString":Ljava/lang/String;
    :goto_2
    array-length v3, v11

    if-ge v2, v3, :cond_1

    aget-object v3, v11, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 472
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v11, v2

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 473
    .end local v6    # "inputString":Ljava/lang/String;
    .restart local v3    # "inputString":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 474
    .end local v3    # "inputString":Ljava/lang/String;
    .restart local v6    # "inputString":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 476
    :cond_1
    const-string v3, ""

    move v5, v2

    move-object v4, v3

    .line 477
    .end local v2    # "i":I
    .local v4, "expectedString":Ljava/lang/String;
    .local v5, "i":I
    :goto_3
    array-length v2, v11

    if-ge v5, v2, :cond_2

    aget-object v2, v11, v5

    .line 478
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 479
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v11, v5

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 480
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 482
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/Global;->getOut()Ljava/io/PrintStream;

    move-result-object v3

    .line 483
    .local v3, "savedOut":Ljava/io/PrintStream;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v2

    .line 484
    .local v2, "savedErr":Ljava/io/PrintStream;
    new-instance v16, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object/from16 v17, v16

    .line 485
    .local v17, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v16, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object/from16 v18, v16

    .line 486
    .local v18, "err":Ljava/io/ByteArrayOutputStream;
    new-instance v14, Ljava/io/PrintStream;

    move-object/from16 v19, v7

    move-object/from16 v7, v17

    .end local v17    # "out":Ljava/io/ByteArrayOutputStream;
    .local v7, "out":Ljava/io/ByteArrayOutputStream;
    invoke-direct {v14, v7}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, v14}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 487
    new-instance v14, Ljava/io/PrintStream;

    move-object/from16 v7, v18

    .end local v18    # "err":Ljava/io/ByteArrayOutputStream;
    .local v7, "err":Ljava/io/ByteArrayOutputStream;
    .restart local v17    # "out":Ljava/io/ByteArrayOutputStream;
    invoke-direct {v14, v7}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, v14}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 488
    const-string v14, ""

    .line 489
    .local v14, "resultString":Ljava/lang/String;
    nop

    .end local v7    # "err":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "err":Ljava/io/ByteArrayOutputStream;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v7

    .line 490
    .local v7, "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    move-object/from16 v20, v2

    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .local v20, "savedErr":Ljava/io/PrintStream;
    new-instance v2, Lcom/trendmicro/hippo/tools/ToolErrorReporter;

    move-object/from16 v21, v3

    .end local v3    # "savedOut":Ljava/io/PrintStream;
    .local v21, "savedOut":Ljava/io/PrintStream;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/shell/Global;->getErr()Ljava/io/PrintStream;

    move-result-object v3

    invoke-direct {v2, v12, v3}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;-><init>(ZLjava/io/PrintStream;)V

    invoke-virtual {v8, v2}, Lcom/trendmicro/hippo/Context;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    .line 492
    add-int/lit8 v22, v0, 0x1

    .line 493
    .end local v0    # "testCount":I
    .local v22, "testCount":I
    :try_start_0
    const-string v0, "doctest input"
    :try_end_0
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v23, 0x1

    const/16 v24, 0x0

    move-object/from16 v3, v20

    .end local v20    # "savedErr":Ljava/io/PrintStream;
    .local v3, "savedErr":Ljava/io/PrintStream;
    move-object/from16 v2, p1

    move-object/from16 v25, v3

    move-object/from16 v12, v21

    .end local v3    # "savedErr":Ljava/io/PrintStream;
    .end local v21    # "savedOut":Ljava/io/PrintStream;
    .local v12, "savedOut":Ljava/io/PrintStream;
    .local v25, "savedErr":Ljava/io/PrintStream;
    move-object/from16 v3, p2

    move-object/from16 v26, v4

    .end local v4    # "expectedString":Ljava/lang/String;
    .local v26, "expectedString":Ljava/lang/String;
    move-object v4, v6

    move/from16 v21, v5

    .end local v5    # "i":I
    .local v21, "i":I
    move-object v5, v0

    move-object/from16 v27, v6

    .end local v6    # "inputString":Ljava/lang/String;
    .local v27, "inputString":Ljava/lang/String;
    move/from16 v6, v23

    move-object v10, v7

    move-object/from16 v28, v19

    move-object/from16 v19, v11

    move-object/from16 v11, v28

    .end local v7    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v11    # "lines":[Ljava/lang/String;
    .local v10, "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .local v19, "lines":[Ljava/lang/String;
    move-object/from16 v7, v24

    :try_start_1
    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 495
    .local v0, "result":Ljava/lang/Object;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getUndefinedValue()Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eq v0, v2, :cond_4

    :try_start_2
    instance-of v2, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v2, :cond_3

    .line 497
    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "function"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 498
    :cond_3
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catch Lcom/trendmicro/hippo/HippoException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v14, v2

    goto :goto_4

    .line 503
    .end local v0    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    move-object/from16 v6, v27

    goto/16 :goto_7

    .line 500
    :catch_0
    move-exception v0

    move-object/from16 v2, v25

    goto :goto_5

    .line 503
    :cond_4
    :goto_4
    invoke-virtual {v1, v12}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 504
    move-object/from16 v2, v25

    .end local v25    # "savedErr":Ljava/io/PrintStream;
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 505
    invoke-virtual {v8, v10}, Lcom/trendmicro/hippo/Context;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_6

    .line 503
    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .restart local v25    # "savedErr":Ljava/io/PrintStream;
    :catchall_1
    move-exception v0

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    move-object/from16 v6, v27

    .end local v25    # "savedErr":Ljava/io/PrintStream;
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    goto/16 :goto_7

    .line 500
    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .restart local v25    # "savedErr":Ljava/io/PrintStream;
    :catch_1
    move-exception v0

    move-object/from16 v2, v25

    .end local v25    # "savedErr":Ljava/io/PrintStream;
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    goto :goto_5

    .line 503
    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .end local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v12    # "savedOut":Ljava/io/PrintStream;
    .end local v19    # "lines":[Ljava/lang/String;
    .end local v26    # "expectedString":Ljava/lang/String;
    .end local v27    # "inputString":Ljava/lang/String;
    .restart local v4    # "expectedString":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "inputString":Ljava/lang/String;
    .restart local v7    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local v11    # "lines":[Ljava/lang/String;
    .restart local v20    # "savedErr":Ljava/io/PrintStream;
    .local v21, "savedOut":Ljava/io/PrintStream;
    :catchall_2
    move-exception v0

    move-object v10, v7

    move-object/from16 v19, v11

    move-object/from16 v2, v20

    move-object/from16 v12, v21

    move/from16 v21, v5

    move-object v3, v4

    .end local v4    # "expectedString":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "inputString":Ljava/lang/String;
    .end local v7    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v11    # "lines":[Ljava/lang/String;
    .end local v20    # "savedErr":Ljava/io/PrintStream;
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    .restart local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local v12    # "savedOut":Ljava/io/PrintStream;
    .restart local v19    # "lines":[Ljava/lang/String;
    .local v21, "i":I
    .restart local v26    # "expectedString":Ljava/lang/String;
    .restart local v27    # "inputString":Ljava/lang/String;
    goto/16 :goto_7

    .line 500
    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .end local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v12    # "savedOut":Ljava/io/PrintStream;
    .end local v19    # "lines":[Ljava/lang/String;
    .end local v26    # "expectedString":Ljava/lang/String;
    .end local v27    # "inputString":Ljava/lang/String;
    .restart local v4    # "expectedString":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "inputString":Ljava/lang/String;
    .restart local v7    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local v11    # "lines":[Ljava/lang/String;
    .restart local v20    # "savedErr":Ljava/io/PrintStream;
    .local v21, "savedOut":Ljava/io/PrintStream;
    :catch_2
    move-exception v0

    move-object/from16 v26, v4

    move-object/from16 v27, v6

    move-object v10, v7

    move-object/from16 v2, v20

    move-object/from16 v12, v21

    move/from16 v21, v5

    move-object/from16 v28, v19

    move-object/from16 v19, v11

    move-object/from16 v11, v28

    .line 501
    .end local v4    # "expectedString":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "inputString":Ljava/lang/String;
    .end local v7    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v11    # "lines":[Ljava/lang/String;
    .end local v20    # "savedErr":Ljava/io/PrintStream;
    .local v0, "e":Lcom/trendmicro/hippo/HippoException;
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    .restart local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local v12    # "savedOut":Ljava/io/PrintStream;
    .restart local v19    # "lines":[Ljava/lang/String;
    .local v21, "i":I
    .restart local v26    # "expectedString":Ljava/lang/String;
    .restart local v27    # "inputString":Ljava/lang/String;
    :goto_5
    :try_start_3
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/trendmicro/hippo/tools/ToolErrorReporter;->reportException(Lcom/trendmicro/hippo/ErrorReporter;Lcom/trendmicro/hippo/HippoException;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 503
    .end local v0    # "e":Lcom/trendmicro/hippo/HippoException;
    invoke-virtual {v1, v12}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 504
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 505
    invoke-virtual {v8, v10}, Lcom/trendmicro/hippo/Context;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    :goto_6
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v18 .. v18}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 507
    .end local v14    # "resultString":Ljava/lang/String;
    .local v0, "resultString":Ljava/lang/String;
    nop

    .line 508
    move-object/from16 v3, v26

    .end local v26    # "expectedString":Ljava/lang/String;
    .local v3, "expectedString":Ljava/lang/String;
    invoke-direct {v1, v3, v0}, Lcom/trendmicro/hippo/tools/shell/Global;->doctestOutputMatches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 509
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "doctest failure running:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v6, v27

    .end local v27    # "inputString":Ljava/lang/String;
    .restart local v6    # "inputString":Ljava/lang/String;
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "expected: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "actual: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 513
    .local v4, "message":Ljava/lang/String;
    if-eqz v9, :cond_5

    .line 514
    add-int v5, p5, v21

    const/4 v7, 0x1

    sub-int/2addr v5, v7

    const/4 v7, 0x0

    const/4 v11, 0x0

    invoke-static {v4, v9, v5, v7, v11}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 517
    :cond_5
    invoke-static {v4}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 508
    .end local v4    # "message":Ljava/lang/String;
    .end local v6    # "inputString":Ljava/lang/String;
    .restart local v27    # "inputString":Ljava/lang/String;
    :cond_6
    move-object/from16 v6, v27

    const/4 v7, 0x1

    const/4 v11, 0x0

    .line 520
    .end local v0    # "resultString":Ljava/lang/String;
    .end local v2    # "savedErr":Ljava/io/PrintStream;
    .end local v3    # "expectedString":Ljava/lang/String;
    .end local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v12    # "savedOut":Ljava/io/PrintStream;
    .end local v17    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "err":Ljava/io/ByteArrayOutputStream;
    .end local v27    # "inputString":Ljava/lang/String;
    move-object/from16 v10, p3

    move v14, v7

    move v12, v11

    move-object/from16 v11, v19

    move/from16 v2, v21

    move/from16 v0, v22

    goto/16 :goto_1

    .line 503
    .restart local v2    # "savedErr":Ljava/io/PrintStream;
    .restart local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .restart local v12    # "savedOut":Ljava/io/PrintStream;
    .restart local v14    # "resultString":Ljava/lang/String;
    .restart local v17    # "out":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "err":Ljava/io/ByteArrayOutputStream;
    .restart local v26    # "expectedString":Ljava/lang/String;
    .restart local v27    # "inputString":Ljava/lang/String;
    :catchall_3
    move-exception v0

    move-object/from16 v3, v26

    move-object/from16 v6, v27

    .end local v26    # "expectedString":Ljava/lang/String;
    .end local v27    # "inputString":Ljava/lang/String;
    .restart local v3    # "expectedString":Ljava/lang/String;
    .restart local v6    # "inputString":Ljava/lang/String;
    :goto_7
    invoke-virtual {v1, v12}, Lcom/trendmicro/hippo/tools/shell/Global;->setOut(Ljava/io/PrintStream;)V

    .line 504
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->setErr(Ljava/io/PrintStream;)V

    .line 505
    invoke-virtual {v8, v10}, Lcom/trendmicro/hippo/Context;->setErrorReporter(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    .line 506
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v18 .. v18}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 507
    .end local v14    # "resultString":Ljava/lang/String;
    .local v4, "resultString":Ljava/lang/String;
    throw v0

    .line 521
    .end local v3    # "expectedString":Ljava/lang/String;
    .end local v4    # "resultString":Ljava/lang/String;
    .end local v6    # "inputString":Ljava/lang/String;
    .end local v10    # "savedErrorReporter":Lcom/trendmicro/hippo/ErrorReporter;
    .end local v12    # "savedOut":Ljava/io/PrintStream;
    .end local v17    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "err":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "lines":[Ljava/lang/String;
    .end local v21    # "i":I
    .end local v22    # "testCount":I
    .local v0, "testCount":I
    .local v2, "i":I
    .restart local v11    # "lines":[Ljava/lang/String;
    :cond_7
    return v0
.end method

.method public setErr(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "err"    # Ljava/io/PrintStream;

    .line 938
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->errStream:Ljava/io/PrintStream;

    .line 939
    return-void
.end method

.method public setIn(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .line 922
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->inStream:Ljava/io/InputStream;

    .line 923
    return-void
.end method

.method public setOut(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/PrintStream;

    .line 930
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->outStream:Ljava/io/PrintStream;

    .line 931
    return-void
.end method

.method public setSealedStdLib(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 943
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/Global;->sealedStdLib:Z

    .line 944
    return-void
.end method
