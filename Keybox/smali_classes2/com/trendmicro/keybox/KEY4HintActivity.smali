.class public Lcom/trendmicro/keybox/KEY4HintActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "KEY4HintActivity.java"


# instance fields
.field listener:Lcom/trendmicro/keybox/Listener;

.field locationManager:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 19
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 27
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v1, 0x7f0b0021

    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/KEY4HintActivity;->setContentView(I)V

    .line 29
    const v1, 0x7f0800cd

    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/KEY4HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/Toolbar;

    .line 30
    .local v1, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/KEY4HintActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 31
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/KEY4HintActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 32
    const v2, 0x7f080050

    invoke-virtual {v0, v2}, Lcom/trendmicro/keybox/KEY4HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 33
    .local v2, "textView":Landroid/widget/TextView;
    const v4, 0x7f080051

    invoke-virtual {v0, v4}, Lcom/trendmicro/keybox/KEY4HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 35
    .local v4, "titleView":Landroid/widget/TextView;
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v5

    .line 36
    .local v5, "singleton":Lcom/trendmicro/keybox/Singleton;
    invoke-virtual {v5, v0}, Lcom/trendmicro/keybox/Singleton;->setAndroidContext(Landroid/content/Context;)V

    .line 38
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/KEY4HintActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 39
    .local v6, "intent":Landroid/content/Intent;
    const-string v7, "hintkey4"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 42
    .local v7, "key":Ljava/lang/String;
    const-string v8, "latitude"

    const-wide v9, 0x4066a00000000000L    # 181.0

    invoke-virtual {v6, v8, v9, v10}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v11

    .line 44
    .local v11, "latitude":D
    const-string v8, "longitude"

    invoke-virtual {v6, v8, v9, v10}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v8

    .line 46
    .local v8, "longitude":D
    if-eqz v7, :cond_0

    .line 47
    iput-object v7, v5, Lcom/trendmicro/keybox/Singleton;->hintkey4:Ljava/lang/String;

    .line 50
    :cond_0
    new-instance v10, Lcom/trendmicro/keybox/Listener;

    invoke-direct {v10}, Lcom/trendmicro/keybox/Listener;-><init>()V

    iput-object v10, v0, Lcom/trendmicro/keybox/KEY4HintActivity;->listener:Lcom/trendmicro/keybox/Listener;

    .line 51
    invoke-virtual {v10, v0}, Lcom/trendmicro/keybox/Listener;->setDelegate(Lcom/trendmicro/keybox/KEY4HintActivity;)V

    .line 52
    const-string v10, "location"

    invoke-virtual {v0, v10}, Lcom/trendmicro/keybox/KEY4HintActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    move-object v13, v10

    check-cast v13, Landroid/location/LocationManager;

    iput-object v13, v0, Lcom/trendmicro/keybox/KEY4HintActivity;->locationManager:Landroid/location/LocationManager;

    .line 53
    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    iget-object v10, v0, Lcom/trendmicro/keybox/KEY4HintActivity;->listener:Lcom/trendmicro/keybox/Listener;

    const-string v14, "gps"

    move-object/from16 v18, v10

    invoke-virtual/range {v13 .. v18}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 55
    new-instance v10, Lcom/trendmicro/keybox/HippoLoader;

    const/4 v13, 0x4

    invoke-direct {v10, v13}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    .line 56
    .local v10, "loader":Lcom/trendmicro/keybox/HippoLoader;
    invoke-virtual {v10, v0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 57
    invoke-virtual {v10, v2}, Lcom/trendmicro/keybox/HippoLoader;->setTextView(Landroid/view/View;)V

    .line 58
    invoke-virtual {v10, v4}, Lcom/trendmicro/keybox/HippoLoader;->setTitleView(Landroid/view/View;)V

    .line 59
    invoke-virtual {v10}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    move-result v13

    if-nez v13, :cond_1

    .line 60
    const-string v13, "log_ciphertext_js"

    invoke-virtual {v10, v13, v3}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    .line 62
    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 67
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 68
    iget-object v0, p0, Lcom/trendmicro/keybox/KEY4HintActivity;->locationManager:Landroid/location/LocationManager;

    iget-object v1, p0, Lcom/trendmicro/keybox/KEY4HintActivity;->listener:Lcom/trendmicro/keybox/Listener;

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 69
    return-void
.end method

.method protected onResume()V
    .locals 18

    .line 74
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 76
    const v1, 0x7f080050

    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/KEY4HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 77
    .local v1, "textView":Landroid/widget/TextView;
    const v2, 0x7f080051

    invoke-virtual {v0, v2}, Lcom/trendmicro/keybox/KEY4HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 79
    .local v2, "titleView":Landroid/widget/TextView;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/keybox/KEY4HintActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 80
    .local v3, "intent":Landroid/content/Intent;
    const-string v4, "hintkey4"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "key":Ljava/lang/String;
    const-string v5, "latitude"

    const-wide v6, 0x4066a00000000000L    # 181.0

    invoke-virtual {v3, v5, v6, v7}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v8

    .line 85
    .local v8, "latitude":D
    const-string v5, "longitude"

    invoke-virtual {v3, v5, v6, v7}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v5

    .line 87
    .local v5, "longitude":D
    new-instance v7, Lcom/trendmicro/keybox/HippoLoader;

    const/4 v10, 0x4

    invoke-direct {v7, v10}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    .line 88
    .local v7, "loader":Lcom/trendmicro/keybox/HippoLoader;
    invoke-virtual {v7, v0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 89
    invoke-virtual {v7, v1}, Lcom/trendmicro/keybox/HippoLoader;->setTextView(Landroid/view/View;)V

    .line 90
    invoke-virtual {v7, v2}, Lcom/trendmicro/keybox/HippoLoader;->setTitleView(Landroid/view/View;)V

    .line 91
    invoke-virtual {v7}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    move-result v10

    if-nez v10, :cond_0

    .line 92
    const/4 v10, 0x1

    const-string v11, "log_ciphertext_js"

    invoke-virtual {v7, v11, v10}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    .line 94
    :cond_0
    iget-object v12, v0, Lcom/trendmicro/keybox/KEY4HintActivity;->locationManager:Landroid/location/LocationManager;

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    iget-object v10, v0, Lcom/trendmicro/keybox/KEY4HintActivity;->listener:Lcom/trendmicro/keybox/Listener;

    const-string v13, "gps"

    move-object/from16 v17, v10

    invoke-virtual/range {v12 .. v17}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 95
    return-void
.end method
