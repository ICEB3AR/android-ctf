.class public Lcom/trendmicro/keybox/KeyboxMainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "KeyboxMainActivity.java"


# instance fields
.field context:Landroid/content/Context;

.field decrypter:Lcom/trendmicro/keybox/HippoLoader;

.field factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

.field flag_image:Landroid/widget/ImageView;

.field flag_text:Landroid/widget/TextView;

.field flagloader:Lcom/trendmicro/keybox/HippoLoader;

.field handler:Landroid/os/Handler;

.field hints:[Lcom/trendmicro/keybox/HippoLoader;

.field key0_image:Landroid/widget/ImageView;

.field key0_text:Landroid/widget/TextView;

.field key1_image:Landroid/widget/ImageView;

.field key1_text:Landroid/widget/TextView;

.field key2_image:Landroid/widget/ImageView;

.field key2_text:Landroid/widget/TextView;

.field key3_image:Landroid/widget/ImageView;

.field key3_text:Landroid/widget/TextView;

.field key4_image:Landroid/widget/ImageView;

.field key4_text:Landroid/widget/TextView;

.field mainloader:Lcom/trendmicro/keybox/HippoLoader;

.field observer:Lcom/trendmicro/keybox/Observer;

.field singleton:Lcom/trendmicro/keybox/Singleton;

.field toast:Landroid/widget/Toast;

.field uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private ShowLockedToast(Ljava/lang/String;)V
    .locals 9
    .param p1, "custom"    # Ljava/lang/String;

    .line 341
    const/4 v0, 0x1

    new-array v1, v0, [C

    .line 342
    .local v1, "pad":[C
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 343
    .local v2, "padstr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    rsub-int/lit8 v3, v3, 0xa

    if-lez v3, :cond_0

    .line 344
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    rsub-int/lit8 v3, v3, 0xa

    new-array v1, v3, [C

    .line 345
    const/16 v3, 0x20

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([CC)V

    .line 346
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([C)V

    move-object v2, v3

    .line 349
    :cond_0
    new-instance v3, Landroid/widget/Toast;

    invoke-virtual {p0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 350
    .local v3, "toast":Landroid/widget/Toast;
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    .line 351
    .local v4, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f0b0037

    const v6, 0x7f08006c

    invoke-virtual {p0, v6}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 352
    .local v5, "layout":Landroid/view/View;
    const v6, 0x7f0800cc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 353
    .local v6, "toastText":Landroid/widget/TextView;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    aput-object v2, v7, v0

    const-string v0, "%s locked%s"

    invoke-static {v0, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    const/16 v0, 0x10

    invoke-virtual {v3, v0, v8, v8}, Landroid/widget/Toast;->setGravity(III)V

    .line 355
    invoke-virtual {v3, v8}, Landroid/widget/Toast;->setDuration(I)V

    .line 356
    invoke-virtual {v3, v5}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 357
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 358
    return-void
.end method


# virtual methods
.method public FireKey0Hints(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 291
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/keybox/HippoLoader;->verify_unlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 292
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KEY0HintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 293
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 294
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 295
    :cond_0
    const-string v0, "Key Zero hints"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 297
    :goto_0
    return-void
.end method

.method public FireKey1Hints(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 300
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/keybox/HippoLoader;->verify_unlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KEY1HintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 302
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 303
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 304
    :cond_0
    const-string v0, "Key One hints"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 307
    :goto_0
    return-void
.end method

.method public FireKey2Hints(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 310
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/keybox/HippoLoader;->verify_unlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 311
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KEY2HintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 312
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 313
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 314
    :cond_0
    const-string v0, "Key Two hints"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 316
    :goto_0
    return-void
.end method

.method public FireKey3Hints(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 319
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/keybox/HippoLoader;->verify_unlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KEY3HintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 321
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 322
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 323
    :cond_0
    const-string v0, "Key Three hints"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 325
    :goto_0
    return-void
.end method

.method public FireKey4Hints(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 328
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/keybox/HippoLoader;->verify_unlocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/trendmicro/keybox/KEY4HintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 330
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 331
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 332
    :cond_0
    const-string v0, "Key Four hints"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 334
    :goto_0
    return-void
.end method

.method public GetFlag(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 337
    const-string v0, "Flag"

    invoke-direct {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->ShowLockedToast(Ljava/lang/String;)V

    .line 338
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 159
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 160
    const v0, 0x7f0b0022

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->setContentView(I)V

    .line 161
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 162
    new-instance v0, Lcom/trendmicro/keybox/HippoLoader;

    invoke-direct {v0}, Lcom/trendmicro/keybox/HippoLoader;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    .line 163
    invoke-virtual {v0, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 165
    const v0, 0x7f080060

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_image:Landroid/widget/ImageView;

    .line 166
    const v0, 0x7f080061

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_image:Landroid/widget/ImageView;

    .line 167
    const v0, 0x7f080062

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_image:Landroid/widget/ImageView;

    .line 168
    const v0, 0x7f080063

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_image:Landroid/widget/ImageView;

    .line 169
    const v0, 0x7f080064

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_image:Landroid/widget/ImageView;

    .line 170
    const v0, 0x7f08004a

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_image:Landroid/widget/ImageView;

    .line 172
    const v0, 0x7f0800be

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_text:Landroid/widget/TextView;

    .line 173
    const v0, 0x7f0800bf

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_text:Landroid/widget/TextView;

    .line 174
    const v0, 0x7f0800c0

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_text:Landroid/widget/TextView;

    .line 175
    const v0, 0x7f0800c1

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_text:Landroid/widget/TextView;

    .line 176
    const v0, 0x7f0800c2

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_text:Landroid/widget/TextView;

    .line 177
    const v0, 0x7f0800bc

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_text:Landroid/widget/TextView;

    .line 179
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "key0_plaintext":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "key1_plaintext":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "key2_plaintext":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v4

    .line 183
    .local v4, "key3_plaintext":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "key4_plaintext":Ljava/lang/String;
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    const/high16 v8, -0x340000

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 186
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 187
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 188
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 189
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 190
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_image:Landroid/widget/ImageView;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v6, v8, v7}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 192
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$1;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$1;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$2;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$2;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$3;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$3;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$4;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$4;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$5;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$5;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_image:Landroid/widget/ImageView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$6;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$6;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$7;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$7;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$8;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$8;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$9;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$9;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$10;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$10;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 243
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$11;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$11;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_text:Landroid/widget/TextView;

    new-instance v7, Lcom/trendmicro/keybox/KeyboxMainActivity$12;

    invoke-direct {v7, p0}, Lcom/trendmicro/keybox/KeyboxMainActivity$12;-><init>(Lcom/trendmicro/keybox/KeyboxMainActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    invoke-virtual {p0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    .line 259
    .local v6, "context":Landroid/content/Context;
    new-instance v7, Landroid/os/Handler;

    invoke-direct {v7}, Landroid/os/Handler;-><init>()V

    iput-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->handler:Landroid/os/Handler;

    .line 260
    new-instance v7, Lcom/trendmicro/keybox/Observer;

    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->handler:Landroid/os/Handler;

    invoke-direct {v7, v8}, Lcom/trendmicro/keybox/Observer;-><init>(Landroid/os/Handler;)V

    iput-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->observer:Lcom/trendmicro/keybox/Observer;

    .line 261
    invoke-virtual {v7, v6}, Lcom/trendmicro/keybox/Observer;->setContext(Landroid/content/Context;)V

    .line 265
    :try_start_0
    new-instance v7, Lcom/trendmicro/hippo/ContextFactoryFactory;

    invoke-direct {v7}, Lcom/trendmicro/hippo/ContextFactoryFactory;-><init>()V

    iput-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->factory:Lcom/trendmicro/hippo/ContextFactoryFactory;

    .line 266
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ContextFactoryFactory;->resolverFactory()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    iput-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->uri:Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    goto :goto_0

    .line 267
    :catch_0
    move-exception v7

    .line 270
    :goto_0
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 271
    .local v7, "contentResolver":Landroid/content/ContentResolver;
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->uri:Landroid/net/Uri;

    iget-object v9, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->observer:Lcom/trendmicro/keybox/Observer;

    invoke-virtual {v7, v8, v2, v9}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 278
    new-instance v2, Lcom/trendmicro/keybox/HippoLoader;

    const-string v8, "main"

    invoke-direct {v2, v8}, Lcom/trendmicro/keybox/HippoLoader;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->mainloader:Lcom/trendmicro/keybox/HippoLoader;

    .line 279
    invoke-virtual {v2, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 281
    iget-object v2, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->mainloader:Lcom/trendmicro/keybox/HippoLoader;

    invoke-virtual {v2}, Lcom/trendmicro/keybox/HippoLoader;->entrypoint()Z

    .line 283
    const/4 v2, 0x5

    new-array v2, v2, [Lcom/trendmicro/keybox/HippoLoader;

    iput-object v2, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    .line 284
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    array-length v9, v8

    if-ge v2, v9, :cond_0

    .line 285
    new-instance v9, Lcom/trendmicro/keybox/HippoLoader;

    invoke-direct {v9, v2}, Lcom/trendmicro/keybox/HippoLoader;-><init>(I)V

    aput-object v9, v8, v2

    .line 286
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->hints:[Lcom/trendmicro/keybox/HippoLoader;

    aget-object v8, v8, v2

    invoke-virtual {v8, p0}, Lcom/trendmicro/keybox/HippoLoader;->setAndroidContext(Landroid/content/Context;)V

    .line 284
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 288
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 66
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 69
    return-void
.end method

.method protected onResume()V
    .locals 13

    .line 74
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 76
    const v0, 0x7f080060

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_image:Landroid/widget/ImageView;

    .line 77
    const v0, 0x7f080061

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_image:Landroid/widget/ImageView;

    .line 78
    const v0, 0x7f080062

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_image:Landroid/widget/ImageView;

    .line 79
    const v0, 0x7f080063

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_image:Landroid/widget/ImageView;

    .line 80
    const v0, 0x7f080064

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_image:Landroid/widget/ImageView;

    .line 81
    const v0, 0x7f08004a

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_image:Landroid/widget/ImageView;

    .line 83
    const v0, 0x7f0800be

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_text:Landroid/widget/TextView;

    .line 84
    const v0, 0x7f0800bf

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_text:Landroid/widget/TextView;

    .line 85
    const v0, 0x7f0800c0

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_text:Landroid/widget/TextView;

    .line 86
    const v0, 0x7f0800c1

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_text:Landroid/widget/TextView;

    .line 87
    const v0, 0x7f0800c2

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_text:Landroid/widget/TextView;

    .line 88
    const v0, 0x7f0800bc

    invoke-virtual {p0, v0}, Lcom/trendmicro/keybox/KeyboxMainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->flag_text:Landroid/widget/TextView;

    .line 90
    iget-object v0, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "key0_plaintext":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "key1_plaintext":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "key2_plaintext":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, "key3_plaintext":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->decrypter:Lcom/trendmicro/keybox/HippoLoader;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lcom/trendmicro/keybox/HippoLoader;->decrypt_key(I)Ljava/lang/String;

    move-result-object v4

    .line 97
    .local v4, "key4_plaintext":Ljava/lang/String;
    const-string v5, "KEY0-.*"

    const v6, -0xff3400

    if-eqz v0, :cond_0

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 98
    iget-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_image:Landroid/widget/ImageView;

    sget-object v8, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v6, v8}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 99
    iget-object v7, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key0_text:Landroid/widget/TextView;

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    :cond_0
    const-string v7, "KEY1-.*"

    if-eqz v1, :cond_1

    invoke-virtual {v1, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 103
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_image:Landroid/widget/ImageView;

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v6, v9}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 104
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key1_text:Landroid/widget/TextView;

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v8, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v9, v8, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    iput-object v9, v8, Lcom/trendmicro/keybox/Singleton;->hintkey1:Ljava/lang/String;

    .line 108
    :cond_1
    const-string v8, "KEY2-.*"

    if-eqz v2, :cond_2

    invoke-virtual {v2, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 109
    iget-object v9, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_image:Landroid/widget/ImageView;

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v9, v6, v10}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 110
    iget-object v9, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key2_text:Landroid/widget/TextView;

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v9, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v10, v9, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    iput-object v10, v9, Lcom/trendmicro/keybox/Singleton;->hintkey2:Ljava/lang/String;

    .line 114
    :cond_2
    const-string v9, "KEY3-.*"

    if-eqz v3, :cond_3

    invoke-virtual {v3, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 115
    iget-object v10, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_image:Landroid/widget/ImageView;

    sget-object v11, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v10, v6, v11}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 116
    iget-object v10, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key3_text:Landroid/widget/TextView;

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v10, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v11, v10, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    iput-object v11, v10, Lcom/trendmicro/keybox/Singleton;->hintkey3:Ljava/lang/String;

    .line 120
    :cond_3
    const-string v10, "KEY4-.*"

    if-eqz v4, :cond_4

    invoke-virtual {v4, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 121
    iget-object v11, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_image:Landroid/widget/ImageView;

    sget-object v12, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v11, v6, v12}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 122
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->key4_text:Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v6, p0, Lcom/trendmicro/keybox/KeyboxMainActivity;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v11, v6, Lcom/trendmicro/keybox/Singleton;->hintkey0:Ljava/lang/String;

    iput-object v11, v6, Lcom/trendmicro/keybox/Singleton;->hintkey4:Ljava/lang/String;

    .line 127
    :cond_4
    if-eqz v0, :cond_5

    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    if-eqz v3, :cond_5

    if-eqz v4, :cond_5

    .line 133
    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 134
    invoke-virtual {v1, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 135
    invoke-virtual {v2, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 136
    invoke-virtual {v3, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 137
    invoke-virtual {v4, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 139
    const-string v5, "TMCTF"

    const-string v6, "TIME TO UNLOCK THE FLAG!"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 142
    .local v5, "newintent":Landroid/content/Intent;
    const-string v6, "com.trendmicro.keybox"

    const-string v7, "com.trendmicro.keybox.FlagActivity"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    const/high16 v6, 0x10000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 144
    const-string v6, "key0"

    invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    const-string v6, "key1"

    invoke-virtual {v5, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 146
    const-string v6, "key2"

    invoke-virtual {v5, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    const-string v6, "key3"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 148
    const-string v6, "key4"

    invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    invoke-virtual {p0, v5}, Lcom/trendmicro/keybox/KeyboxMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 155
    .end local v5    # "newintent":Landroid/content/Intent;
    :cond_5
    return-void
.end method
