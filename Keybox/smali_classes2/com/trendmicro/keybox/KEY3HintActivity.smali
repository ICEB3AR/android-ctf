.class public Lcom/trendmicro/keybox/KEY3HintActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "KEY3HintActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 25
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const v0, 0x7f0b0020

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY3HintActivity;->setContentView(I)V

    .line 27
    const v0, 0x7f0800cd

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY3HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 28
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY3HintActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 30
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY3HintActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 31
    const v1, 0x7f080050

    invoke-virtual {p0, v1}, Lcom/trendmicro/keybox/KEY3HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 32
    .local v1, "textView":Landroid/widget/TextView;
    const v3, 0x7f080051

    invoke-virtual {p0, v3}, Lcom/trendmicro/keybox/KEY3HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 34
    .local v3, "titleView":Landroid/widget/TextView;
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v4

    .line 37
    .local v4, "singleton":Lcom/trendmicro/keybox/Singleton;
    const-string v5, "location"

    invoke-virtual {p0, v5}, Lcom/trendmicro/keybox/KEY3HintActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/location/LocationManager;

    .line 38
    .local v5, "locationManager":Landroid/location/LocationManager;
    const-string v6, "gps"

    invoke-virtual {v5, v6}, Landroid/location/LocationManager;->getProvider(Ljava/lang/String;)Landroid/location/LocationProvider;

    move-result-object v7

    .line 40
    .local v7, "provider":Landroid/location/LocationProvider;
    new-instance v8, Lcom/trendmicro/keybox/Listener;

    invoke-direct {v8}, Lcom/trendmicro/keybox/Listener;-><init>()V

    .line 41
    .local v8, "listener":Lcom/trendmicro/keybox/Listener;
    invoke-virtual {v5, v6}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v6

    .line 43
    .local v6, "locationGPS":Landroid/location/Location;
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY3HintActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    .line 44
    .local v9, "intent":Landroid/content/Intent;
    const-string v10, "hintkey3"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 47
    .local v10, "key":Ljava/lang/String;
    if-eqz v10, :cond_0

    .line 48
    iput-object v10, v4, Lcom/trendmicro/keybox/Singleton;->hintkey3:Ljava/lang/String;

    .line 51
    :cond_0
    new-instance v11, Lcom/trendmicro/keybox/HippoLoader;

    const/4 v12, 0x3

    invoke-direct {v11, v12}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    .line 52
    .local v11, "loader":Lcom/trendmicro/keybox/HippoLoader;
    invoke-virtual {v11, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 53
    invoke-virtual {v11, v1}, Lcom/trendmicro/keybox/HippoLoader;->setTextView(Landroid/view/View;)V

    .line 54
    invoke-virtual {v11, v3}, Lcom/trendmicro/keybox/HippoLoader;->setTitleView(Landroid/view/View;)V

    .line 56
    invoke-virtual {v11}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    move-result v12

    if-nez v12, :cond_1

    .line 57
    const-string v12, "log_ciphertext_js"

    invoke-virtual {v11, v12, v2}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    .line 59
    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 72
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 74
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 63
    const-string v0, "TMCTF"

    const-string v1, "onResume()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 67
    return-void
.end method
