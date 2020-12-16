.class public Lcom/trendmicro/keybox/Observer;
.super Landroid/database/ContentObserver;
.source "Observer.java"


# instance fields
.field context:Landroid/content/Context;

.field cursor:Landroid/database/Cursor;

.field factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

.field message:Ljava/lang/String;

.field singleton:Lcom/trendmicro/keybox/Singleton;

.field uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .line 24
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 25
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/Observer;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 26
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 9
    .param p1, "selfchange"    # Z

    .line 31
    iget-object v0, p0, Lcom/trendmicro/keybox/Observer;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 32
    return-void

    .line 37
    :cond_0
    :try_start_0
    new-instance v0, Lcom/trendmicro/hippo/ContextFactoryFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ContextFactoryFactory;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/keybox/Observer;->factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

    .line 38
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ContextFactoryFactory;->resolverFactory()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/Observer;->uri:Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    goto :goto_0

    .line 39
    :catch_0
    move-exception v0

    .line 43
    :goto_0
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 50
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_1
    iget-object v2, p0, Lcom/trendmicro/keybox/Observer;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->uri:Landroid/net/Uri;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    .line 51
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 53
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->getColumnCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 55
    const-string v3, "%s == %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v5, v2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v5, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "logstring":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v5, v2}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    const-string v6, "type"

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-ne v4, v1, :cond_1

    .line 63
    iget-object v4, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v4, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/trendmicro/keybox/Observer;->message:Ljava/lang/String;

    .line 66
    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->singleton:Lcom/trendmicro/keybox/Singleton;

    iput-object v4, v5, Lcom/trendmicro/keybox/Singleton;->flagkey3_key:Ljava/lang/String;

    .line 67
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 68
    .local v4, "newintent":Landroid/content/Intent;
    const-string v5, "com.trendmicro.keybox"

    const-string v6, "com.trendmicro.keybox.KeyboxMainActivity"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const/high16 v5, 0x10000000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 70
    iget-object v5, p0, Lcom/trendmicro/keybox/Observer;->context:Landroid/content/Context;

    invoke-virtual {v5, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 73
    .end local v4    # "newintent":Landroid/content/Intent;
    :cond_1
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4}, Ljava/lang/String;-><init>()V

    iput-object v4, p0, Lcom/trendmicro/keybox/Observer;->message:Ljava/lang/String;

    .line 53
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 76
    .end local v2    # "i":I
    .end local v3    # "logstring":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/keybox/Observer;->cursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    goto :goto_2

    .line 77
    :catch_1
    move-exception v2

    .line 78
    .local v2, "e":Ljava/lang/Exception;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    const-string v0, "SMS observer error: %s"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "errormessage":Ljava/lang/String;
    const-string v1, "TMCTF"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .end local v0    # "errormessage":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "_context"    # Landroid/content/Context;

    .line 84
    iput-object p1, p0, Lcom/trendmicro/keybox/Observer;->context:Landroid/content/Context;

    .line 85
    return-void
.end method
