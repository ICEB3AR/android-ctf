.class Lcom/trendmicro/hippo/xmlimpl/XMLCtor;
.super Lcom/trendmicro/hippo/IdFunctionObject;
.source "XMLCtor.java"


# static fields
.field private static final Id_defaultSettings:I = 0x1

.field private static final Id_ignoreComments:I = 0x1

.field private static final Id_ignoreProcessingInstructions:I = 0x2

.field private static final Id_ignoreWhitespace:I = 0x3

.field private static final Id_prettyIndent:I = 0x4

.field private static final Id_prettyPrinting:I = 0x5

.field private static final Id_setSettings:I = 0x3

.field private static final Id_settings:I = 0x2

.field private static final MAX_FUNCTION_ID:I = 0x3

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final XMLCTOR_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x78d9b94928711c7dL


# instance fields
.field private options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    const-string v0, "XMLCtor"

    sput-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/xmlimpl/XML;Ljava/lang/Object;II)V
    .locals 1
    .param p1, "xml"    # Lcom/trendmicro/hippo/xmlimpl/XML;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "arity"    # I

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;II)V

    .line 29
    invoke-virtual {p1}, Lcom/trendmicro/hippo/xmlimpl/XML;->getProcessor()Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    .line 30
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->activatePrototypeMap(I)V

    .line 31
    return-void
.end method

.method private readSettings(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 6
    .param p1, "source"    # Lcom/trendmicro/hippo/Scriptable;

    .line 45
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x5

    if-gt v0, v1, :cond_5

    .line 46
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v2

    add-int/2addr v2, v0

    .line 47
    .local v2, "id":I
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v3

    .line 48
    .local v3, "name":Ljava/lang/String;
    invoke-static {p1, v3}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 49
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v4, v5, :cond_0

    .line 50
    goto :goto_2

    .line 52
    :cond_0
    const/4 v5, 0x1

    if-eq v0, v5, :cond_3

    const/4 v5, 0x2

    if-eq v0, v5, :cond_3

    const/4 v5, 0x3

    if-eq v0, v5, :cond_3

    const/4 v5, 0x4

    if-eq v0, v5, :cond_2

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 67
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 62
    :cond_2
    instance-of v1, v4, Ljava/lang/Number;

    if-nez v1, :cond_4

    .line 63
    goto :goto_2

    .line 57
    :cond_3
    :goto_1
    instance-of v1, v4, Ljava/lang/Boolean;

    if-nez v1, :cond_4

    .line 58
    goto :goto_2

    .line 69
    :cond_4
    invoke-virtual {p0, v2, v4}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 45
    .end local v2    # "id":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 71
    .end local v0    # "i":I
    :cond_5
    return-void
.end method

.method private writeSetting(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 4
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;

    .line 35
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x5

    if-gt v0, v1, :cond_0

    .line 36
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v1

    add-int/2addr v1, v0

    .line 37
    .local v1, "id":I
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v2

    .line 38
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v3

    .line 39
    .local v3, "value":Ljava/lang/Object;
    invoke-static {p1, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    .end local v1    # "id":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    .end local v0    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 223
    sget-object v0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdFunctionObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 226
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 227
    .local v0, "id":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    const/4 v1, 0x2

    if-eq v0, v1, :cond_5

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 240
    array-length v1, p5

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    aget-object v2, p5, v1

    if-eqz v2, :cond_2

    aget-object v2, p5, v1

    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v2, v3, :cond_1

    goto :goto_0

    .line 245
    :cond_1
    aget-object v2, p5, v1

    instance-of v2, v2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_3

    .line 246
    aget-object v1, p5, v1

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->readSettings(Lcom/trendmicro/hippo/Scriptable;)V

    goto :goto_1

    .line 244
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setDefault()V

    .line 248
    :cond_3
    :goto_1
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 251
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 235
    :cond_5
    invoke-virtual {p2, p3}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 236
    .local v1, "obj":Lcom/trendmicro/hippo/Scriptable;
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->writeSetting(Lcom/trendmicro/hippo/Scriptable;)V

    .line 237
    return-object v1

    .line 229
    .end local v1    # "obj":Lcom/trendmicro/hippo/Scriptable;
    :cond_6
    iget-object v1, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setDefault()V

    .line 230
    invoke-virtual {p2, p3}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 231
    .restart local v1    # "obj":Lcom/trendmicro/hippo/Scriptable;
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->writeSetting(Lcom/trendmicro/hippo/Scriptable;)V

    .line 232
    return-object v1
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 94
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 95
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_4

    const/16 v3, 0xe

    if-eq v2, v3, :cond_2

    const/16 v3, 0x10

    if-eq v2, v3, :cond_1

    const/16 v3, 0x1c

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    const-string v1, "ignoreProcessingInstructions"

    const/4 v0, 0x2

    goto :goto_0

    .line 101
    :cond_1
    const-string v1, "ignoreWhitespace"

    const/4 v0, 0x3

    goto :goto_0

    .line 97
    :cond_2
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 98
    .local v2, "c":I
    const/16 v3, 0x69

    if-ne v2, v3, :cond_3

    const-string v1, "ignoreComments"

    const/4 v0, 0x1

    goto :goto_0

    .line 99
    :cond_3
    const/16 v3, 0x70

    if-ne v2, v3, :cond_5

    const-string v1, "prettyPrinting"

    const/4 v0, 0x5

    goto :goto_0

    .line 96
    .end local v2    # "c":I
    :cond_4
    const-string v1, "prettyIndent"

    const/4 v0, 0x4

    .line 104
    :cond_5
    :goto_0
    if-eqz v1, :cond_6

    if-eq v1, p1, :cond_6

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    const/4 v0, 0x0

    .line 109
    .end local v1    # "X":Ljava/lang/String;
    :cond_6
    if-nez v0, :cond_7

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 112
    :cond_7
    const/4 v1, 0x1

    if-eq v0, v1, :cond_9

    const/4 v1, 0x2

    if-eq v0, v1, :cond_9

    const/4 v1, 0x3

    if-eq v0, v1, :cond_9

    const/4 v1, 0x4

    if-eq v0, v1, :cond_9

    const/4 v1, 0x5

    if-ne v0, v1, :cond_8

    goto :goto_1

    .line 120
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 118
    :cond_9
    :goto_1
    const/4 v1, 0x6

    .line 119
    .local v1, "attr":I
    nop

    .line 122
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->instanceIdInfo(II)I

    move-result v2

    return v2
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 192
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 193
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 194
    .local v2, "s_length":I
    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    const-string v1, "settings"

    const/4 v0, 0x2

    goto :goto_0

    .line 195
    :cond_0
    const/16 v3, 0xb

    if-ne v2, v3, :cond_1

    const-string v1, "setSettings"

    const/4 v0, 0x3

    goto :goto_0

    .line 196
    :cond_1
    const/16 v3, 0xf

    if-ne v2, v3, :cond_2

    const-string v1, "defaultSettings"

    const/4 v0, 0x1

    .line 197
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 201
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    return v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .line 130
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 137
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 135
    :cond_0
    const-string v0, "prettyPrinting"

    return-object v0

    .line 134
    :cond_1
    const-string v0, "prettyIndent"

    return-object v0

    .line 133
    :cond_2
    const-string v0, "ignoreWhitespace"

    return-object v0

    .line 132
    :cond_3
    const-string v0, "ignoreProcessingInstructions"

    return-object v0

    .line 131
    :cond_4
    const-string v0, "ignoreComments"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 143
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 155
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 151
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->getPrettyIndent()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 149
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreWhitespace()Z

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 147
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreProcessingInstructions()Z

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 145
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->isIgnoreComments()Z

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 87
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 259
    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XML;

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/trendmicro/hippo/xmlimpl/XMLList;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 210
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 213
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "setSettings"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 214
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "settings"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 211
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "defaultSettings"

    .line 216
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 217
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 160
    invoke-super {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 177
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdFunctionObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 178
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 175
    return-void

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setPrettyIndent(I)V

    .line 172
    return-void

    .line 168
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 169
    return-void

    .line 165
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 166
    return-void

    .line 162
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/xmlimpl/XMLCtor;->options:Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 163
    return-void
.end method
