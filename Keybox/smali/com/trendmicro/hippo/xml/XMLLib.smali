.class public abstract Lcom/trendmicro/hippo/xml/XMLLib;
.super Ljava/lang/Object;
.source "XMLLib.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/xml/XMLLib$Factory;
    }
.end annotation


# static fields
.field private static final XML_LIB_KEY:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static extractFromScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 59
    invoke-static {p0}, Lcom/trendmicro/hippo/xml/XMLLib;->extractFromScopeOrNull(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v0

    .line 60
    .local v0, "lib":Lcom/trendmicro/hippo/xml/XMLLib;
    if-eqz v0, :cond_0

    .line 61
    return-object v0

    .line 63
    :cond_0
    const-string v1, "msg.XML.not.available"

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "msg":Ljava/lang/String;
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v2

    throw v2
.end method

.method public static extractFromScopeOrNull(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 44
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getLibraryScopeOrNull(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 45
    .local v0, "so":Lcom/trendmicro/hippo/ScriptableObject;
    if-nez v0, :cond_0

    .line 47
    const/4 v1, 0x0

    return-object v1

    .line 52
    :cond_0
    const-string v1, "XML"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    .line 54
    sget-object v1, Lcom/trendmicro/hippo/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLLib;

    return-object v1
.end method


# virtual methods
.method protected final bindToScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 69
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getLibraryScopeOrNull(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 70
    .local v0, "so":Lcom/trendmicro/hippo/ScriptableObject;
    if-eqz v0, :cond_0

    .line 74
    sget-object v1, Lcom/trendmicro/hippo/xml/XMLLib;->XML_LIB_KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/xml/XMLLib;

    return-object v1

    .line 72
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method public abstract escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public getPrettyIndent()I
    .locals 1

    .line 144
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreComments()Z
    .locals 1

    .line 128
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreProcessingInstructions()Z
    .locals 1

    .line 132
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreWhitespace()Z
    .locals 1

    .line 136
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isPrettyPrinting()Z
    .locals 1

    .line 140
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract isXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z
.end method

.method public abstract nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
.end method

.method public abstract nameRef(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Ref;
.end method

.method public setIgnoreComments(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 108
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setIgnoreProcessingInstructions(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 116
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setIgnoreWhitespace(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 112
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setPrettyIndent(I)V
    .locals 1
    .param p1, "i"    # I

    .line 124
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setPrettyPrinting(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 120
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public abstract toDefaultXmlNamespace(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
.end method
