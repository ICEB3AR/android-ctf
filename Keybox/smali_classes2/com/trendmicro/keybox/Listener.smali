.class public Lcom/trendmicro/keybox/Listener;
.super Ljava/lang/Object;
.source "Listener.java"

# interfaces
.implements Landroid/location/LocationListener;


# instance fields
.field delegate:Lcom/trendmicro/keybox/KEY4HintActivity;

.field did_change:Ljava/lang/Boolean;

.field latitude:D

.field latitude_last:D

.field longitude:D

.field longitude_last:D

.field singleton:Lcom/trendmicro/keybox/Singleton;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/trendmicro/keybox/Listener;->latitude_last:D

    .line 14
    iput-wide v0, p0, Lcom/trendmicro/keybox/Listener;->longitude_last:D

    .line 15
    iput-wide v0, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    .line 16
    iput-wide v0, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    .line 20
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/trendmicro/keybox/Listener;->did_change:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 5
    .param p1, "location"    # Landroid/location/Location;

    .line 24
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 25
    invoke-virtual {p1}, Landroid/location/Location;->toString()Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "locationString":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    .line 27
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    .line 28
    iget-wide v1, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    iget-object v3, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-wide v3, v3, Lcom/trendmicro/keybox/Singleton;->latitude:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_1

    iget-wide v1, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    iget-object v3, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-wide v3, v3, Lcom/trendmicro/keybox/Singleton;->longitude:D

    cmpl-double v1, v1, v3

    if-eqz v1, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/trendmicro/keybox/Listener;->did_change:Ljava/lang/Boolean;

    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-wide v2, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    iput-wide v2, v1, Lcom/trendmicro/keybox/Singleton;->latitude:D

    .line 30
    iget-object v1, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-wide v2, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    iput-wide v2, v1, Lcom/trendmicro/keybox/Singleton;->longitude:D

    .line 31
    iget-wide v1, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    iput-wide v1, p0, Lcom/trendmicro/keybox/Listener;->latitude_last:D

    .line 32
    iget-wide v1, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    iput-wide v1, p0, Lcom/trendmicro/keybox/Listener;->longitude_last:D

    .line 35
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, p0, Lcom/trendmicro/keybox/Listener;->did_change:Ljava/lang/Boolean;

    .line 37
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 38
    .local v1, "newintent":Landroid/content/Intent;
    const-string v2, "com.trendmicro.keybox"

    const-string v3, "com.trendmicro.keybox.KEY4HintActivity"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 40
    iget-wide v2, p0, Lcom/trendmicro/keybox/Listener;->latitude:D

    const-string v4, "latitude"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 41
    iget-wide v2, p0, Lcom/trendmicro/keybox/Listener;->longitude:D

    const-string v4, "longitude"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 42
    iget-object v2, p0, Lcom/trendmicro/keybox/Listener;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v2, v2, Lcom/trendmicro/keybox/Singleton;->hintkey4:Ljava/lang/String;

    const-string v3, "key"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    iget-object v2, p0, Lcom/trendmicro/keybox/Listener;->delegate:Lcom/trendmicro/keybox/KEY4HintActivity;

    invoke-virtual {v2, v1}, Lcom/trendmicro/keybox/KEY4HintActivity;->startActivity(Landroid/content/Intent;)V

    .line 45
    .end local v1    # "newintent":Landroid/content/Intent;
    nop

    .line 48
    :goto_1
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 60
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .line 56
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .line 52
    return-void
.end method

.method public setDelegate(Lcom/trendmicro/keybox/KEY4HintActivity;)V
    .locals 0
    .param p1, "delegate"    # Lcom/trendmicro/keybox/KEY4HintActivity;

    .line 63
    iput-object p1, p0, Lcom/trendmicro/keybox/Listener;->delegate:Lcom/trendmicro/keybox/KEY4HintActivity;

    .line 64
    return-void
.end method
