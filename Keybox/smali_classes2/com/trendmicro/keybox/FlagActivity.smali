.class public Lcom/trendmicro/keybox/FlagActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "FlagActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 25
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 21
    move-object/from16 v1, p0

    const-string v2, "TMCTF"

    invoke-super/range {p0 .. p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    const v0, 0x7f0b001c

    invoke-virtual {v1, v0}, Lcom/trendmicro/keybox/FlagActivity;->setContentView(I)V

    .line 23
    const v0, 0x7f0800cd

    invoke-virtual {v1, v0}, Lcom/trendmicro/keybox/FlagActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/support/v7/widget/Toolbar;

    .line 24
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v1, v3}, Lcom/trendmicro/keybox/FlagActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 26
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v4

    .line 29
    .local v4, "singleton":Lcom/trendmicro/keybox/Singleton;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/FlagActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 31
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/FlagActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 32
    .local v6, "intent":Landroid/content/Intent;
    const-string v0, "key0"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 33
    .local v7, "key0":Ljava/lang/String;
    const-string v0, "key1"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 34
    .local v8, "key1":Ljava/lang/String;
    const-string v0, "key2"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 35
    .local v9, "key2":Ljava/lang/String;
    const-string v0, "key3"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 36
    .local v10, "key3":Ljava/lang/String;
    const-string v0, "key4"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 38
    .local v11, "key4":Ljava/lang/String;
    const v0, 0x7f080050

    invoke-virtual {v1, v0}, Lcom/trendmicro/keybox/FlagActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Landroid/widget/TextView;

    .line 39
    .local v12, "textView":Landroid/widget/TextView;
    const v0, 0x7f080051

    invoke-virtual {v1, v0}, Lcom/trendmicro/keybox/FlagActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroid/widget/TextView;

    .line 57
    .local v13, "titleView":Landroid/widget/TextView;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/FlagActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 59
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v14, "flag/flag.enc"

    invoke-virtual {v0, v14}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    .line 60
    .local v14, "inputStreamFlag":Ljava/io/InputStream;
    invoke-virtual {v14}, Ljava/io/InputStream;->available()I

    move-result v15

    new-array v15, v15, [B

    .line 61
    .local v15, "flag_ciphertext":[B
    invoke-virtual {v14}, Ljava/io/InputStream;->available()I

    move-result v5

    new-array v5, v5, [B

    .line 62
    .local v5, "flag_intermediate":[B
    move-object/from16 v17, v0

    .end local v0    # "assetManager":Landroid/content/res/AssetManager;
    .local v17, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v14}, Ljava/io/InputStream;->available()I

    move-result v0

    new-array v0, v0, [B

    .line 63
    .local v0, "flag_plaintext":[B
    invoke-virtual {v14, v15}, Ljava/io/InputStream;->read([B)I

    .line 64
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V

    .line 66
    move-object/from16 v18, v0

    .end local v0    # "flag_plaintext":[B
    .local v18, "flag_plaintext":[B
    new-instance v0, Lcom/trendmicro/keybox/Oracle;

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 67
    .local v0, "oracle0":Lcom/trendmicro/keybox/Oracle;
    new-instance v1, Lcom/trendmicro/keybox/Oracle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-object/from16 v19, v3

    .end local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    .local v19, "toolbar":Landroid/support/v7/widget/Toolbar;
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 68
    .local v1, "oracle1":Lcom/trendmicro/keybox/Oracle;
    new-instance v3, Lcom/trendmicro/keybox/Oracle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v20, v4

    .end local v4    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .local v20, "singleton":Lcom/trendmicro/keybox/Singleton;
    :try_start_2
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 69
    .local v3, "oracle2":Lcom/trendmicro/keybox/Oracle;
    new-instance v4, Lcom/trendmicro/keybox/Oracle;

    move-object/from16 v21, v5

    .end local v5    # "flag_intermediate":[B
    .local v21, "flag_intermediate":[B
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 70
    .local v4, "oracle3":Lcom/trendmicro/keybox/Oracle;
    new-instance v5, Lcom/trendmicro/keybox/Oracle;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 v22, v6

    .end local v6    # "intent":Landroid/content/Intent;
    .local v22, "intent":Landroid/content/Intent;
    :try_start_3
    invoke-virtual {v11}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 72
    .local v5, "oracle4":Lcom/trendmicro/keybox/Oracle;
    invoke-virtual {v0, v15}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v6

    .line 73
    .end local v21    # "flag_intermediate":[B
    .local v6, "flag_intermediate":[B
    invoke-virtual {v1, v6}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v21

    move-object/from16 v6, v21

    .line 74
    invoke-virtual {v3, v6}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v21

    move-object/from16 v6, v21

    .line 75
    invoke-virtual {v4, v6}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v21

    move-object/from16 v6, v21

    .line 76
    invoke-virtual {v5, v6}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v21

    move-object/from16 v23, v21

    .line 77
    .end local v18    # "flag_plaintext":[B
    .local v23, "flag_plaintext":[B
    move-object/from16 v18, v0

    .end local v0    # "oracle0":Lcom/trendmicro/keybox/Oracle;
    .local v18, "oracle0":Lcom/trendmicro/keybox/Oracle;
    new-instance v0, Ljava/lang/String;

    move-object/from16 v21, v1

    move-object/from16 v1, v23

    .end local v23    # "flag_plaintext":[B
    .local v1, "flag_plaintext":[B
    .local v21, "oracle1":Lcom/trendmicro/keybox/Oracle;
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 79
    .local v0, "flag":Ljava/lang/String;
    move-object/from16 v23, v1

    .end local v1    # "flag_plaintext":[B
    .restart local v23    # "flag_plaintext":[B
    const-string v1, "PLAINTEXT FLAG: %s"

    move-object/from16 v24, v3

    const/4 v3, 0x1

    .end local v3    # "oracle2":Lcom/trendmicro/keybox/Oracle;
    .local v24, "oracle2":Lcom/trendmicro/keybox/Oracle;
    new-array v3, v3, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v0, v3, v16

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const-string v1, "TMCTF\\{.*\\}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    const-string v1, "Keybox Complete!"

    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 89
    .end local v0    # "flag":Ljava/lang/String;
    .end local v4    # "oracle3":Lcom/trendmicro/keybox/Oracle;
    .end local v5    # "oracle4":Lcom/trendmicro/keybox/Oracle;
    .end local v6    # "flag_intermediate":[B
    .end local v14    # "inputStreamFlag":Ljava/io/InputStream;
    .end local v15    # "flag_ciphertext":[B
    .end local v17    # "assetManager":Landroid/content/res/AssetManager;
    .end local v18    # "oracle0":Lcom/trendmicro/keybox/Oracle;
    .end local v21    # "oracle1":Lcom/trendmicro/keybox/Oracle;
    .end local v23    # "flag_plaintext":[B
    .end local v24    # "oracle2":Lcom/trendmicro/keybox/Oracle;
    :cond_0
    goto :goto_1

    .line 86
    :catch_0
    move-exception v0

    goto :goto_0

    .end local v22    # "intent":Landroid/content/Intent;
    .local v6, "intent":Landroid/content/Intent;
    :catch_1
    move-exception v0

    move-object/from16 v22, v6

    .end local v6    # "intent":Landroid/content/Intent;
    .restart local v22    # "intent":Landroid/content/Intent;
    goto :goto_0

    .end local v20    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .end local v22    # "intent":Landroid/content/Intent;
    .local v4, "singleton":Lcom/trendmicro/keybox/Singleton;
    .restart local v6    # "intent":Landroid/content/Intent;
    :catch_2
    move-exception v0

    move-object/from16 v20, v4

    move-object/from16 v22, v6

    .end local v4    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .end local v6    # "intent":Landroid/content/Intent;
    .restart local v20    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .restart local v22    # "intent":Landroid/content/Intent;
    goto :goto_0

    .end local v19    # "toolbar":Landroid/support/v7/widget/Toolbar;
    .end local v20    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .end local v22    # "intent":Landroid/content/Intent;
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    .restart local v4    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .restart local v6    # "intent":Landroid/content/Intent;
    :catch_3
    move-exception v0

    move-object/from16 v19, v3

    move-object/from16 v20, v4

    move-object/from16 v22, v6

    .line 87
    .end local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    .end local v4    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .end local v6    # "intent":Landroid/content/Intent;
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v19    # "toolbar":Landroid/support/v7/widget/Toolbar;
    .restart local v20    # "singleton":Lcom/trendmicro/keybox/Singleton;
    .restart local v22    # "intent":Landroid/content/Intent;
    :goto_0
    const-string v1, "Oracle exception"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 91
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
