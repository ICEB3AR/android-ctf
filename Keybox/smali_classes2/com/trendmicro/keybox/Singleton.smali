.class public Lcom/trendmicro/keybox/Singleton;
.super Ljava/lang/Object;
.source "Singleton.java"


# static fields
.field private static volatile singleton:Lcom/trendmicro/keybox/Singleton;


# instance fields
.field androidContextObject:Landroid/content/Context;

.field box_index:I

.field factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

.field public flagkey0:Ljava/lang/String;

.field public flagkey0_key:Ljava/lang/String;

.field public flagkey1:Ljava/lang/String;

.field public flagkey1_key:Ljava/lang/String;

.field public flagkey2:Ljava/lang/String;

.field public flagkey2_key:Ljava/lang/String;

.field public flagkey3:Ljava/lang/String;

.field public flagkey3_key:Ljava/lang/String;

.field public flagkey4:Ljava/lang/String;

.field public flagkey4_key:Ljava/lang/String;

.field public hintkey0:Ljava/lang/String;

.field public hintkey1:Ljava/lang/String;

.field public hintkey2:Ljava/lang/String;

.field public hintkey3:Ljava/lang/String;

.field public hintkey4:Ljava/lang/String;

.field public hintkeyflag:Ljava/lang/String;

.field public hintkeymain:Ljava/lang/String;

.field key4_box:[Ljava/lang/String;

.field public latitude:D

.field public longitude:D


# direct methods
.method private constructor <init>()V
    .locals 4

    .line 44
    const-string v0, ""

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    :try_start_0
    new-instance v1, Lcom/trendmicro/hippo/ContextFactoryFactory;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ContextFactoryFactory;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/keybox/Singleton;->factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

    .line 47
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ContextFactoryFactory;->CreateKey(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    .line 48
    iget-object v1, p0, Lcom/trendmicro/keybox/Singleton;->factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ContextFactoryFactory;->CreateKey(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/Singleton;->hintkeymain:Ljava/lang/String;

    .line 49
    filled-new-array {v0, v0, v0}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/Singleton;->key4_box:[Ljava/lang/String;

    .line 50
    iput v2, p0, Lcom/trendmicro/keybox/Singleton;->box_index:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 54
    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/trendmicro/keybox/Singleton;
    .locals 1

    .line 57
    sget-object v0, Lcom/trendmicro/keybox/Singleton;->singleton:Lcom/trendmicro/keybox/Singleton;

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Lcom/trendmicro/keybox/Singleton;

    invoke-direct {v0}, Lcom/trendmicro/keybox/Singleton;-><init>()V

    sput-object v0, Lcom/trendmicro/keybox/Singleton;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 61
    :cond_0
    sget-object v0, Lcom/trendmicro/keybox/Singleton;->singleton:Lcom/trendmicro/keybox/Singleton;

    return-object v0
.end method

.method public static getInstance(Ljava/lang/Boolean;)Lcom/trendmicro/keybox/Singleton;
    .locals 1
    .param p0, "areyousure"    # Ljava/lang/Boolean;

    .line 66
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    new-instance v0, Lcom/trendmicro/keybox/Singleton;

    invoke-direct {v0}, Lcom/trendmicro/keybox/Singleton;-><init>()V

    sput-object v0, Lcom/trendmicro/keybox/Singleton;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 69
    :cond_0
    sget-object v0, Lcom/trendmicro/keybox/Singleton;->singleton:Lcom/trendmicro/keybox/Singleton;

    return-object v0
.end method


# virtual methods
.method public hintkey(I)Ljava/lang/String;
    .locals 2
    .param p1, "level"    # I

    .line 73
    const/4 v0, 0x0

    .line 74
    .local v0, "ret":Ljava/lang/String;
    if-eqz p1, :cond_4

    const/4 v1, 0x1

    if-eq p1, v1, :cond_3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkey4:Ljava/lang/String;

    goto :goto_0

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkey3:Ljava/lang/String;

    goto :goto_0

    .line 77
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkey2:Ljava/lang/String;

    goto :goto_0

    .line 76
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkey1:Ljava/lang/String;

    goto :goto_0

    .line 75
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    .line 81
    :goto_0
    return-object v0
.end method

.method public hintkey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "level"    # Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "ret":Ljava/lang/String;
    const-string v1, "main"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkeymain:Ljava/lang/String;

    goto :goto_0

    .line 88
    :cond_0
    const-string v1, "flag"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->hintkeyflag:Ljava/lang/String;

    .line 91
    :cond_1
    :goto_0
    return-object v0
.end method

.method public keykey(I)Ljava/lang/String;
    .locals 2
    .param p1, "keynum"    # I

    .line 95
    const/4 v0, 0x0

    .line 97
    .local v0, "ret":Ljava/lang/String;
    if-eqz p1, :cond_4

    const/4 v1, 0x1

    if-eq p1, v1, :cond_3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey4_key:Ljava/lang/String;

    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey3_key:Ljava/lang/String;

    goto :goto_0

    .line 100
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey2_key:Ljava/lang/String;

    goto :goto_0

    .line 99
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey1_key:Ljava/lang/String;

    goto :goto_0

    .line 98
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey0_key:Ljava/lang/String;

    .line 105
    :goto_0
    return-object v0
.end method

.method public push(Ljava/lang/String;)V
    .locals 10
    .param p1, "value"    # Ljava/lang/String;

    .line 113
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->key4_box:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/trendmicro/keybox/Singleton;->key4_box:[Ljava/lang/String;

    aget-object v4, v0, v3

    aput-object v4, v0, v2

    .line 115
    aget-object v4, v0, v1

    aput-object v4, v0, v3

    .line 116
    aput-object p1, v0, v1

    .line 117
    const-string v4, ""

    invoke-static {v4, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/Singleton;->flagkey4_key:Ljava/lang/String;

    .line 122
    :cond_0
    :try_start_0
    const-string v0, "key_%d/key_%d.enc"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "key_ciphertext_path":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/keybox/Singleton;->androidContextObject:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 127
    .local v1, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 128
    .local v2, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v3

    new-array v3, v3, [B

    .line 129
    .local v3, "ciphertext_bytes":[B
    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 131
    .local v4, "ciphertext_length":I
    new-instance v5, Lcom/trendmicro/keybox/Oracle;

    iget-object v6, p0, Lcom/trendmicro/keybox/Singleton;->flagkey4_key:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/trendmicro/keybox/Oracle;-><init>([B)V

    .line 132
    .local v5, "oracle":Lcom/trendmicro/keybox/Oracle;
    new-instance v6, Ljava/lang/String;

    invoke-virtual {v5, v3}, Lcom/trendmicro/keybox/Oracle;->process([B)[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/String;-><init>([B)V

    .line 135
    .local v6, "_tmp_key4":Ljava/lang/String;
    const-string v7, "KEY4-.*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 136
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 137
    .local v7, "newintent":Landroid/content/Intent;
    const-string v8, "com.trendmicro.keybox"

    const-string v9, "com.trendmicro.keybox.KeyboxMainActivity"

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    const/high16 v8, 0x10000000

    invoke-virtual {v7, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 139
    iget-object v8, p0, Lcom/trendmicro/keybox/Singleton;->androidContextObject:Landroid/content/Context;

    invoke-virtual {v8, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "key_ciphertext_path":Ljava/lang/String;
    .end local v1    # "assetManager":Landroid/content/res/AssetManager;
    .end local v2    # "inputStream":Ljava/io/InputStream;
    .end local v3    # "ciphertext_bytes":[B
    .end local v4    # "ciphertext_length":I
    .end local v5    # "oracle":Lcom/trendmicro/keybox/Oracle;
    .end local v6    # "_tmp_key4":Ljava/lang/String;
    .end local v7    # "newintent":Landroid/content/Intent;
    :cond_1
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 143
    :goto_0
    return-void
.end method

.method public setAndroidContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "androidContextObject"    # Landroid/content/Context;

    .line 109
    iput-object p1, p0, Lcom/trendmicro/keybox/Singleton;->androidContextObject:Landroid/content/Context;

    .line 110
    return-void
.end method
