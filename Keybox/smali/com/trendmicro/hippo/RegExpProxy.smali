.class public interface abstract Lcom/trendmicro/hippo/RegExpProxy;
.super Ljava/lang/Object;
.source "RegExpProxy.java"


# static fields
.field public static final RA_MATCH:I = 0x1

.field public static final RA_REPLACE:I = 0x2

.field public static final RA_SEARCH:I = 0x3


# virtual methods
.method public abstract action(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;
.end method

.method public abstract compileRegExp(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract find_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;[I[I[Z[[Ljava/lang/String;)I
.end method

.method public abstract isRegExp(Lcom/trendmicro/hippo/Scriptable;)Z
.end method

.method public abstract js_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract wrapRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
.end method
