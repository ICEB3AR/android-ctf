.class public Lcom/trendmicro/hippo/TopLevel;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "TopLevel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/TopLevel$Builtins;,
        Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final serialVersionUID:J = -0x40812d88f46a4e44L


# instance fields
.field private ctors:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap<",
            "Lcom/trendmicro/hippo/TopLevel$Builtins;",
            "Lcom/trendmicro/hippo/BaseFunction;",
            ">;"
        }
    .end annotation
.end field

.field private errors:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap<",
            "Lcom/trendmicro/hippo/TopLevel$NativeErrors;",
            "Lcom/trendmicro/hippo/BaseFunction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 38
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    return-void
.end method

.method public static getBuiltinCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Function;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 138
    nop

    .line 139
    instance-of v0, p1, Lcom/trendmicro/hippo/TopLevel;

    if-eqz v0, :cond_0

    .line 140
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/TopLevel;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinCtor(Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 141
    .local v0, "result":Lcom/trendmicro/hippo/Function;
    if-eqz v0, :cond_0

    .line 142
    return-object v0

    .line 146
    .end local v0    # "result":Lcom/trendmicro/hippo/Function;
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getExistingCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    return-object v0
.end method

.method public static getBuiltinPrototype(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 187
    nop

    .line 188
    instance-of v0, p0, Lcom/trendmicro/hippo/TopLevel;

    if-eqz v0, :cond_0

    .line 189
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/TopLevel;

    .line 190
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinPrototype(Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 191
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_0

    .line 192
    return-object v0

    .line 196
    .end local v0    # "result":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getClassPrototype(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method static getNativeErrorCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$NativeErrors;)Lcom/trendmicro/hippo/Function;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 163
    nop

    .line 164
    instance-of v0, p1, Lcom/trendmicro/hippo/TopLevel;

    if-eqz v0, :cond_0

    .line 165
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/TopLevel;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/TopLevel;->getNativeErrorCtor(Lcom/trendmicro/hippo/TopLevel$NativeErrors;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 166
    .local v0, "result":Lcom/trendmicro/hippo/Function;
    if-eqz v0, :cond_0

    .line 167
    return-object v0

    .line 171
    .end local v0    # "result":Lcom/trendmicro/hippo/Function;
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getExistingCtor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/Function;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public cacheBuiltins()V
    .locals 8

    .line 107
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/TopLevel;->ctors:Ljava/util/EnumMap;

    .line 108
    invoke-static {}, Lcom/trendmicro/hippo/TopLevel$Builtins;->values()[Lcom/trendmicro/hippo/TopLevel$Builtins;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 109
    .local v4, "builtin":Lcom/trendmicro/hippo/TopLevel$Builtins;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/TopLevel$Builtins;->name()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 110
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v6, :cond_0

    .line 111
    iget-object v6, p0, Lcom/trendmicro/hippo/TopLevel;->ctors:Ljava/util/EnumMap;

    move-object v7, v5

    check-cast v7, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v6, v4, v7}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .end local v4    # "builtin":Lcom/trendmicro/hippo/TopLevel$Builtins;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 114
    :cond_1
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/TopLevel;->errors:Ljava/util/EnumMap;

    .line 115
    invoke-static {}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->values()[Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    move-result-object v0

    array-length v1, v0

    :goto_1
    if-ge v2, v1, :cond_3

    aget-object v3, v0, v2

    .line 116
    .local v3, "error":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 117
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v5, :cond_2

    .line 118
    iget-object v5, p0, Lcom/trendmicro/hippo/TopLevel;->errors:Ljava/util/EnumMap;

    move-object v6, v4

    check-cast v6, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v5, v3, v6}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v3    # "error":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 121
    :cond_3
    return-void
.end method

.method public getBuiltinCtor(Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/BaseFunction;
    .locals 1
    .param p1, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 207
    iget-object v0, p0, Lcom/trendmicro/hippo/TopLevel;->ctors:Ljava/util/EnumMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getBuiltinPrototype(Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/Scriptable;
    .locals 4
    .param p1, "type"    # Lcom/trendmicro/hippo/TopLevel$Builtins;

    .line 229
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/TopLevel;->getBuiltinCtor(Lcom/trendmicro/hippo/TopLevel$Builtins;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 230
    .local v0, "func":Lcom/trendmicro/hippo/BaseFunction;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    .line 231
    .local v2, "proto":Ljava/lang/Object;
    :goto_0
    instance-of v3, v2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_1

    move-object v1, v2

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    :cond_1
    return-object v1
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 95
    const-string v0, "global"

    return-object v0
.end method

.method getNativeErrorCtor(Lcom/trendmicro/hippo/TopLevel$NativeErrors;)Lcom/trendmicro/hippo/BaseFunction;
    .locals 1
    .param p1, "type"    # Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    .line 218
    iget-object v0, p0, Lcom/trendmicro/hippo/TopLevel;->errors:Ljava/util/EnumMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
