.class Lcom/trendmicro/hippo/ScriptRuntime$DefaultMessageProvider;
.super Ljava/lang/Object;
.source "ScriptRuntime.java"

# interfaces
.implements Lcom/trendmicro/hippo/ScriptRuntime$MessageProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptRuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultMessageProvider"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 4200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/ScriptRuntime$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/ScriptRuntime$1;

    .line 4200
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptRuntime$DefaultMessageProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 8
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/Object;

    .line 4203
    const-string v0, "com.trendmicro.hippo.resources.Messages"

    .line 4206
    .local v0, "defaultResource":Ljava/lang/String;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 4207
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Context;->getLocale()Ljava/util/Locale;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    .line 4210
    .local v2, "locale":Ljava/util/Locale;
    :goto_0
    const-string v3, "com.trendmicro.hippo.resources.Messages"

    invoke-static {v3, v2}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v3

    .line 4214
    .local v3, "rb":Ljava/util/ResourceBundle;
    :try_start_0
    invoke-virtual {v3, p1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4218
    .local v4, "formatString":Ljava/lang/String;
    nop

    .line 4225
    new-instance v5, Ljava/text/MessageFormat;

    invoke-direct {v5, v4}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 4226
    .local v5, "formatter":Ljava/text/MessageFormat;
    invoke-virtual {v5, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 4215
    .end local v4    # "formatString":Ljava/lang/String;
    .end local v5    # "formatter":Ljava/text/MessageFormat;
    :catch_0
    move-exception v4

    .line 4216
    .local v4, "mre":Ljava/util/MissingResourceException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "no message resource found for message property "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method
