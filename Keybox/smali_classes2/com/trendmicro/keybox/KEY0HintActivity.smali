.class public Lcom/trendmicro/keybox/KEY0HintActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "KEY0HintActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 18
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const v0, 0x7f0b001d

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY0HintActivity;->setContentView(I)V

    .line 20
    const v0, 0x7f0800cd

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY0HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 21
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY0HintActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 22
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY0HintActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 24
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v1

    .line 25
    .local v1, "singleton":Lcom/trendmicro/keybox/Singleton;
    const v3, 0x7f080050

    invoke-virtual {p0, v3}, Lcom/trendmicro/keybox/KEY0HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 26
    .local v3, "textView":Landroid/widget/TextView;
    const v4, 0x7f080051

    invoke-virtual {p0, v4}, Lcom/trendmicro/keybox/KEY0HintActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 28
    .local v4, "titleView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KEY0HintActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 29
    .local v5, "intent":Landroid/content/Intent;
    const-string v6, "hintkey0"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 31
    .local v6, "key":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 32
    iput-object v6, v1, Lcom/trendmicro/keybox/Singleton;->hintkey1:Ljava/lang/String;

    .line 35
    :cond_0
    new-instance v7, Lcom/trendmicro/keybox/HippoLoader;

    const/4 v8, 0x0

    invoke-direct {v7, v8}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    .line 36
    .local v7, "loader":Lcom/trendmicro/keybox/HippoLoader;
    invoke-virtual {v7, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 37
    invoke-virtual {v7, v3}, Lcom/trendmicro/keybox/HippoLoader;->setTextView(Landroid/view/View;)V

    .line 38
    invoke-virtual {v7, v4}, Lcom/trendmicro/keybox/HippoLoader;->setTitleView(Landroid/view/View;)V

    .line 39
    invoke-virtual {v7}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    move-result v8

    if-nez v8, :cond_1

    .line 40
    const-string v8, "log_ciphertext_js"

    invoke-virtual {v7, v8, v2}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    .line 44
    :cond_1
    iget-object v2, v1, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    iput-object v2, v1, Lcom/trendmicro/keybox/Singleton;->flagkey0_key:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 49
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    .line 56
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    .line 52
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KeyboxMainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KEY0HintActivity;->startActivity(Landroid/content/Intent;)V

    .line 54
    const/4 v1, 0x1

    return v1
.end method
