.class public Lcom/trendmicro/keybox/KEY2HintActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "KEY2HintActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 20
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    const v0, 0x7f0b001f

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY2HintActivity;->setContentView(I)V

    .line 22
    const v0, 0x7f0800cd

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY2HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 23
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY2HintActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 25
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY2HintActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 27
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v1

    .line 28
    .local v1, "singleton":Lcom/trendmicro/keybox/Singleton;
    const v3, 0x7f080050

    invoke-virtual {p0, v3}, Lcom/trendmicro/keybox/KEY2HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 29
    .local v3, "textView":Landroid/widget/TextView;
    const v4, 0x7f080051

    invoke-virtual {p0, v4}, Lcom/trendmicro/keybox/KEY2HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 31
    .local v4, "titleView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY2HintActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 32
    .local v5, "intent":Landroid/content/Intent;
    const-string v6, "hintkey2"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 34
    .local v6, "key":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 35
    iput-object v6, v1, Lcom/trendmicro/keybox/Singleton;->hintkey2:Ljava/lang/String;

    .line 38
    :cond_0
    new-instance v7, Lcom/trendmicro/keybox/HippoLoader;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    .line 39
    .local v7, "loader":Lcom/trendmicro/keybox/HippoLoader;
    invoke-virtual {v7, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 40
    invoke-virtual {v7, v3}, Lcom/trendmicro/keybox/HippoLoader;->setTextView(Landroid/view/View;)V

    .line 41
    invoke-virtual {v7, v4}, Lcom/trendmicro/keybox/HippoLoader;->setTitleView(Landroid/view/View;)V

    .line 42
    invoke-virtual {v7}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    move-result v8

    if-nez v8, :cond_1

    .line 43
    const-string v8, "log_ciphertext_js"

    invoke-virtual {v7, v8, v2}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    .line 45
    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 50
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 52
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 56
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 57
    return-void
.end method
