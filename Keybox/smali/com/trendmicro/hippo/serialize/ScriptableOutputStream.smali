.class public Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;
.super Ljava/io/ObjectOutputStream;
.source "ScriptableOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;
    }
.end annotation


# instance fields
.field private scope:Lcom/trendmicro/hippo/Scriptable;

.field private table:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 53
    iput-object p2, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    .line 55
    const-string v1, ""

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->enableReplaceObject(Z)Z

    .line 57
    invoke-virtual {p0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->excludeStandardObjectNames()V

    .line 58
    return-void
.end method

.method static lookupQualifiedName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "qualifiedName"    # Ljava/lang/String;

    .line 158
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, "."

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .local v0, "st":Ljava/util/StringTokenizer;
    move-object v1, p0

    .line 160
    .local v1, "result":Ljava/lang/Object;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 161
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 162
    .local v2, "s":Ljava/lang/String;
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 163
    if-eqz v1, :cond_1

    instance-of v3, v1, Lcom/trendmicro/hippo/Scriptable;

    if-nez v3, :cond_0

    .line 164
    goto :goto_1

    .line 165
    .end local v2    # "s":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 166
    :cond_1
    :goto_1
    return-object v1
.end method


# virtual methods
.method public addExcludedName(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 103
    iget-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->lookupQualifiedName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 104
    .local v0, "obj":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 108
    iget-object v1, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    return-void

    .line 105
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Object for excluded name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public addOptionalExcludedName(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v0, p1}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->lookupQualifiedName(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 82
    .local v0, "obj":Ljava/lang/Object;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->NOT_FOUND:Lcom/trendmicro/hippo/UniqueTag;

    if-eq v0, v1, :cond_1

    .line 83
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 89
    iget-object v1, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 84
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Object for excluded name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is not a Scriptable, it is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public excludeAllIds([Ljava/lang/Object;)V
    .locals 5
    .param p1, "ids"    # [Ljava/lang/Object;

    .line 61
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 62
    .local v2, "id":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->scope:Lcom/trendmicro/hippo/Scriptable;

    move-object v4, v2

    check-cast v4, Ljava/lang/String;

    .line 63
    invoke-interface {v3, v4, v3}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_0

    .line 65
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->addExcludedName(Ljava/lang/String;)V

    .line 61
    .end local v2    # "id":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 68
    :cond_1
    return-void
.end method

.method public excludeStandardObjectNames()V
    .locals 22

    .line 130
    move-object/from16 v0, p0

    const-string v1, "Object"

    const-string v2, "Object.prototype"

    const-string v3, "Function"

    const-string v4, "Function.prototype"

    const-string v5, "String"

    const-string v6, "String.prototype"

    const-string v7, "Math"

    const-string v8, "Array"

    const-string v9, "Array.prototype"

    const-string v10, "Error"

    const-string v11, "Error.prototype"

    const-string v12, "Number"

    const-string v13, "Number.prototype"

    const-string v14, "Date"

    const-string v15, "Date.prototype"

    const-string v16, "RegExp"

    const-string v17, "RegExp.prototype"

    const-string v18, "Script"

    const-string v19, "Script.prototype"

    const-string v20, "Continuation"

    const-string v21, "Continuation.prototype"

    filled-new-array/range {v1 .. v21}, [Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "names":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 143
    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->addExcludedName(Ljava/lang/String;)V

    .line 142
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 146
    .end local v2    # "i":I
    :cond_0
    const-string v2, "XML"

    const-string v3, "XML.prototype"

    const-string v4, "XMLList"

    const-string v5, "XMLList.prototype"

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v2

    .line 150
    .local v2, "optionalNames":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 151
    aget-object v4, v2, v3

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->addOptionalExcludedName(Ljava/lang/String;)V

    .line 150
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 153
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method public hasExcludedName(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 115
    iget-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeExcludedName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 122
    iget-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method

.method protected replaceObject(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream;->table:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 185
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 186
    return-object p1

    .line 187
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;

    invoke-direct {v1, v0}, Lcom/trendmicro/hippo/serialize/ScriptableOutputStream$PendingLookup;-><init>(Ljava/lang/String;)V

    return-object v1
.end method
