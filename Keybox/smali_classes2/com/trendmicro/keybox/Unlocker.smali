.class public Lcom/trendmicro/keybox/Unlocker;
.super Landroid/content/BroadcastReceiver;
.source "Unlocker.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 23
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v0

    .line 24
    .local v0, "singleton":Lcom/trendmicro/keybox/Singleton;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 26
    .local v1, "action":Ljava/lang/String;
    const/4 v2, 0x0

    .line 29
    .local v2, "data":Ljava/lang/String;
    const-string v3, "android.provider.Telephony.SECRET_CODE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/high16 v4, 0x10000000

    const-string v5, "com.trendmicro.keybox.KeyboxMainActivity"

    const-string v6, "com.trendmicro.keybox"

    if-eqz v3, :cond_1

    .line 30
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 31
    const-string v3, "8736364276"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 32
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/keybox/Singleton;->getInstance(Ljava/lang/Boolean;)Lcom/trendmicro/keybox/Singleton;

    goto :goto_0

    .line 34
    :cond_0
    iput-object v2, v0, Lcom/trendmicro/keybox/Singleton;->flagkey2_key:Ljava/lang/String;

    .line 37
    :goto_0
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 38
    .local v3, "newintent":Landroid/content/Intent;
    invoke-virtual {v3, v6, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 40
    invoke-virtual {p1, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .end local v3    # "newintent":Landroid/content/Intent;
    goto :goto_2

    .line 42
    :cond_1
    const-string v3, "android.intent.action.PHONE_STATE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 43
    const-string v3, "incoming_number"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    const-string v3, "[^\\d.]"

    const-string v7, ""

    invoke-virtual {v2, v3, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 48
    iput-object v2, v0, Lcom/trendmicro/keybox/Singleton;->flagkey1_key:Ljava/lang/String;

    .line 51
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 52
    .local v3, "bundle":Landroid/os/Bundle;
    if-eqz v3, :cond_5

    .line 53
    invoke-virtual {v3}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 54
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {v3, v8}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 55
    .local v9, "value":Ljava/lang/Object;
    const-string v10, "state"

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "IDLE"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 56
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10}, Landroid/content/Intent;-><init>()V

    .line 57
    .local v10, "newintent":Landroid/content/Intent;
    invoke-virtual {v10, v6, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    invoke-virtual {v10, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 59
    invoke-virtual {p1, v10}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .end local v8    # "key":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/Object;
    .end local v10    # "newintent":Landroid/content/Intent;
    :cond_3
    goto :goto_1

    .line 42
    .end local v3    # "bundle":Landroid/os/Bundle;
    :cond_4
    :goto_2
    nop

    .line 83
    :cond_5
    return-void
.end method
