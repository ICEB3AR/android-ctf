.class public abstract Lcom/trendmicro/hippo/IdScriptableObject;
.super Lcom/trendmicro/hippo/ScriptableObject;
.source "IdScriptableObject.java"

# interfaces
.implements Lcom/trendmicro/hippo/IdFunctionCall;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;
    }
.end annotation


# instance fields
.field private transient prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 339
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptableObject;-><init>()V

    .line 340
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 344
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 345
    return-void
.end method

.method private getBuiltInDescriptor(Lcom/trendmicro/hippo/Symbol;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 5
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 1030
    const/4 v0, 0x0

    .line 1031
    .local v0, "value":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 1033
    .local v1, "attr":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1034
    .local v2, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v2, :cond_0

    .line 1035
    move-object v2, p0

    .line 1038
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_1

    .line 1039
    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v3

    .line 1040
    .local v3, "id":I
    if-eqz v3, :cond_1

    .line 1041
    iget-object v4, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 1042
    iget-object v4, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v1

    .line 1043
    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    return-object v4

    .line 1046
    .end local v3    # "id":I
    :cond_1
    const/4 v3, 0x0

    return-object v3
.end method

.method private getBuiltInDescriptor(Ljava/lang/String;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .line 1003
    const/4 v0, 0x0

    .line 1004
    .local v0, "value":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 1006
    .local v1, "attr":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 1007
    .local v2, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v2, :cond_0

    .line 1008
    move-object v2, p0

    .line 1011
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v3

    .line 1012
    .local v3, "info":I
    if-eqz v3, :cond_1

    .line 1013
    const v4, 0xffff

    and-int/2addr v4, v3

    .line 1014
    .local v4, "id":I
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    .line 1015
    ushr-int/lit8 v1, v3, 0x10

    .line 1016
    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v5

    return-object v5

    .line 1018
    .end local v4    # "id":I
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v4, :cond_2

    .line 1019
    invoke-virtual {v4, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v4

    .line 1020
    .restart local v4    # "id":I
    if-eqz v4, :cond_2

    .line 1021
    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 1022
    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v1

    .line 1023
    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v5

    return-object v5

    .line 1026
    .end local v4    # "id":I
    :cond_2
    const/4 v4, 0x0

    return-object v4
.end method

.method protected static incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;
    .locals 2
    .param p0, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 912
    nop

    .line 913
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    .line 912
    const-string v1, "msg.incompat.call"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected static instanceIdInfo(II)I
    .locals 1
    .param p0, "attributes"    # I
    .param p1, "id"    # I

    .line 702
    shl-int/lit8 v0, p0, 0x10

    or-int/2addr v0, p1

    return v0
.end method

.method private newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 10
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "arity"    # I
    .param p5, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 919
    const/4 v0, 0x0

    .line 920
    .local v0, "function":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_0

    .line 921
    new-instance v1, Lcom/trendmicro/hippo/IdFunctionObject;

    move-object v3, v1

    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-object v7, p3

    move v8, p4

    move-object v9, p5

    invoke-direct/range {v3 .. v9}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    move-object v0, v1

    goto :goto_0

    .line 923
    :cond_0
    new-instance v8, Lcom/trendmicro/hippo/IdFunctionObjectES6;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/IdFunctionObjectES6;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    move-object v0, v8

    .line 926
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 927
    :cond_1
    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1052
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1053
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 1054
    .local v0, "maxPrototypeId":I
    if-eqz v0, :cond_0

    .line 1055
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->activatePrototypeMap(I)V

    .line 1057
    :cond_0
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 2
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1062
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 1063
    const/4 v0, 0x0

    .line 1064
    .local v0, "maxPrototypeId":I
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_0

    .line 1065
    invoke-virtual {v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getMaxId()I

    move-result v0

    .line 1067
    :cond_0
    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 1068
    return-void
.end method


# virtual methods
.method public final activatePrototypeMap(I)V
    .locals 2
    .param p1, "maxPrototypeId"    # I

    .line 805
    new-instance v0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;-><init>(Lcom/trendmicro/hippo/IdScriptableObject;I)V

    .line 806
    .local v0, "values":Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;
    monitor-enter p0

    .line 807
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-nez v1, :cond_0

    .line 809
    iput-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    .line 810
    monitor-exit p0

    .line 811
    return-void

    .line 808
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    .end local v0    # "values":Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;
    .end local p1    # "maxPrototypeId":I
    throw v1

    .line 810
    .restart local v0    # "values":Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;
    .restart local p1    # "maxPrototypeId":I
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V
    .locals 7
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "arity"    # I

    .line 884
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 885
    .local v6, "scope":Lcom/trendmicro/hippo/Scriptable;
    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move v4, p5

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/IdScriptableObject;->newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    .line 886
    .local v0, "f":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/IdFunctionObject;->addAsProperty(Lcom/trendmicro/hippo/Scriptable;)V

    .line 887
    return-void
.end method

.method protected final defaultGet(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 354
    invoke-super {p0, p1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final defaultHas(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 349
    invoke-super {p0, p1, p0}, Lcom/trendmicro/hippo/ScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected final defaultPut(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 359
    invoke-super {p0, p1, p0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 360
    return-void
.end method

.method public defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "key"    # Ljava/lang/Object;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 932
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 933
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    .line 934
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    .line 935
    .local v1, "info":I
    const-string v2, "value"

    if-eqz v1, :cond_2

    .line 936
    const v3, 0xffff

    and-int/2addr v3, v1

    .line 937
    .local v3, "id":I
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 938
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IdScriptableObject;->delete(I)V

    goto :goto_0

    .line 940
    :cond_0
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->checkPropertyDefinition(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 941
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    .line 942
    .local v4, "current":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {p0, v0, v4, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->checkPropertyChange(Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 943
    ushr-int/lit8 v5, v1, 0x10

    .line 944
    .local v5, "attr":I
    invoke-static {p3, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 945
    .local v2, "value":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v6, :cond_1

    and-int/lit8 v6, v5, 0x1

    if-nez v6, :cond_1

    .line 946
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v6

    .line 947
    .local v6, "currentValue":Ljava/lang/Object;
    invoke-virtual {p0, v2, v6}, Lcom/trendmicro/hippo/IdScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 948
    invoke-virtual {p0, v3, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 951
    .end local v6    # "currentValue":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p0, v5, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->applyDescriptorToAttributeBitset(ILcom/trendmicro/hippo/ScriptableObject;)I

    move-result v6

    invoke-virtual {p0, v0, v6}, Lcom/trendmicro/hippo/IdScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 952
    return-void

    .line 955
    .end local v2    # "value":Ljava/lang/Object;
    .end local v3    # "id":I
    .end local v4    # "current":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v5    # "attr":I
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_6

    .line 956
    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v3

    .line 957
    .restart local v3    # "id":I
    if-eqz v3, :cond_6

    .line 958
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 959
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->delete(I)V

    goto :goto_1

    .line 961
    :cond_3
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->checkPropertyDefinition(Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 962
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    .line 963
    .restart local v4    # "current":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {p0, v0, v4, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->checkPropertyChange(Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 964
    iget-object v5, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v5

    .line 965
    .restart local v5    # "attr":I
    invoke-static {p3, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 966
    .restart local v2    # "value":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v6, :cond_4

    and-int/lit8 v6, v5, 0x1

    if-nez v6, :cond_4

    .line 967
    iget-object v6, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v6, v3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 968
    .restart local v6    # "currentValue":Ljava/lang/Object;
    invoke-virtual {p0, v2, v6}, Lcom/trendmicro/hippo/IdScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 969
    iget-object v7, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v3, p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->set(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 972
    .end local v6    # "currentValue":Ljava/lang/Object;
    :cond_4
    iget-object v6, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {p0, v5, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->applyDescriptorToAttributeBitset(ILcom/trendmicro/hippo/ScriptableObject;)I

    move-result v7

    invoke-virtual {v6, v3, v7}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->setAttributes(II)V

    .line 976
    invoke-super {p0, v0, p0}, Lcom/trendmicro/hippo/ScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 977
    invoke-super {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->delete(Ljava/lang/String;)V

    .line 980
    :cond_5
    return-void

    .line 985
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "info":I
    .end local v2    # "value":Ljava/lang/Object;
    .end local v3    # "id":I
    .end local v4    # "current":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v5    # "attr":I
    :cond_6
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 986
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 4
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 557
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    .line 558
    .local v0, "info":I
    if-eqz v0, :cond_2

    .line 560
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 561
    ushr-int/lit8 v1, v0, 0x10

    .line 563
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x4

    if-eqz v2, :cond_1

    .line 564
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 565
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v3

    if-nez v3, :cond_0

    .line 568
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    goto :goto_0

    .line 566
    .restart local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_0
    const-string v3, "msg.delete.property.with.configurable.false"

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 569
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 570
    .local v2, "id":I
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 572
    .end local v2    # "id":I
    :goto_0
    return-void

    .line 575
    .end local v1    # "attr":I
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_4

    .line 576
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v1

    .line 577
    .local v1, "id":I
    if-eqz v1, :cond_4

    .line 578
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 579
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->delete(I)V

    .line 581
    :cond_3
    return-void

    .line 584
    .end local v1    # "id":I
    :cond_4
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->delete(Lcom/trendmicro/hippo/Symbol;)V

    .line 585
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 524
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    .line 525
    .local v0, "info":I
    if-eqz v0, :cond_2

    .line 527
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 528
    ushr-int/lit8 v1, v0, 0x10

    .line 530
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x4

    if-eqz v2, :cond_1

    .line 531
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 532
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v3

    if-nez v3, :cond_0

    .line 535
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    goto :goto_0

    .line 533
    .restart local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_0
    const-string v3, "msg.delete.property.with.configurable.false"

    invoke-static {v3, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 536
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_1
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 537
    .local v2, "id":I
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 539
    .end local v2    # "id":I
    :goto_0
    return-void

    .line 542
    .end local v1    # "attr":I
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_4

    .line 543
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 544
    .local v1, "id":I
    if-eqz v1, :cond_4

    .line 545
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 546
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->delete(I)V

    .line 548
    :cond_3
    return-void

    .line 551
    .end local v1    # "id":I
    :cond_4
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->delete(Ljava/lang/String;)V

    .line 552
    return-void
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 772
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 1
    .param p1, "maxPrototypeId"    # I
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "sealed"    # Z

    .line 780
    if-eq p2, p0, :cond_0

    if-eqz p2, :cond_0

    .line 781
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 782
    invoke-static {p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 785
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->activatePrototypeMap(I)V

    .line 786
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->createPrecachedConstructor()Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    .line 787
    .local v0, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    if-eqz p3, :cond_1

    .line 788
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->sealObject()V

    .line 790
    :cond_1
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 791
    if-eqz p3, :cond_2

    .line 792
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 794
    :cond_2
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 795
    return-object v0
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 0
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 879
    return-void
.end method

.method protected findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 722
    const/4 v0, 0x0

    return v0
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 712
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 874
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 869
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 433
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 434
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 435
    return-object v0

    .line 437
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I

    move-result v1

    .line 438
    .local v1, "info":I
    if-eqz v1, :cond_1

    .line 439
    const v2, 0xffff

    and-int/2addr v2, v1

    .line 440
    .local v2, "id":I
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    .line 441
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_1

    return-object v0

    .line 443
    .end local v2    # "id":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v2, :cond_2

    .line 444
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v2

    .line 445
    .restart local v2    # "id":I
    if-eqz v2, :cond_2

    .line 446
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 447
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_2

    return-object v0

    .line 450
    .end local v2    # "id":I
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    return-object v2
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 410
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 411
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 412
    return-object v0

    .line 414
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    .line 415
    .local v1, "info":I
    if-eqz v1, :cond_1

    .line 416
    const v2, 0xffff

    and-int/2addr v2, v1

    .line 417
    .local v2, "id":I
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    .line 418
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_1

    return-object v0

    .line 420
    .end local v2    # "id":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v2, :cond_2

    .line 421
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v2

    .line 422
    .restart local v2    # "id":I
    if-eqz v2, :cond_2

    .line 423
    iget-object v3, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 424
    sget-object v3, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v3, :cond_2

    return-object v0

    .line 427
    .end local v2    # "id":I
    :cond_2
    sget-object v2, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    return-object v2
.end method

.method public getAttributes(Lcom/trendmicro/hippo/Symbol;)I
    .locals 3
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 607
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    .line 608
    .local v0, "info":I
    if-eqz v0, :cond_0

    .line 609
    ushr-int/lit8 v1, v0, 0x10

    .line 610
    .local v1, "attr":I
    return v1

    .line 612
    .end local v1    # "attr":I
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_1

    .line 613
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v1

    .line 614
    .local v1, "id":I
    if-eqz v1, :cond_1

    .line 615
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v2

    return v2

    .line 618
    .end local v1    # "id":I
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(Lcom/trendmicro/hippo/Symbol;)I

    move-result v1

    return v1
.end method

.method public getAttributes(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 590
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    .line 591
    .local v0, "info":I
    if-eqz v0, :cond_0

    .line 592
    ushr-int/lit8 v1, v0, 0x10

    .line 593
    .local v1, "attr":I
    return v1

    .line 595
    .end local v1    # "attr":I
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_1

    .line 596
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 597
    .local v1, "id":I
    if-eqz v1, :cond_1

    .line 598
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v2

    return v2

    .line 601
    .end local v1    # "id":I
    :cond_1
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method getIds(ZZ)[Ljava/lang/Object;
    .locals 10
    .param p1, "getNonEnumerable"    # Z
    .param p2, "getSymbols"    # Z

    .line 647
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    .line 649
    .local v0, "result":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_0

    .line 650
    invoke-virtual {v1, p1, p2, v0}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->getNames(ZZ[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 653
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getMaxInstanceId()I

    move-result v1

    .line 654
    .local v1, "maxInstanceId":I
    if-eqz v1, :cond_7

    .line 655
    const/4 v2, 0x0

    .line 656
    .local v2, "ids":[Ljava/lang/Object;
    const/4 v3, 0x0

    .line 658
    .local v3, "count":I
    move v4, v1

    .local v4, "id":I
    :goto_0
    if-eqz v4, :cond_5

    .line 659
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v5

    .line 660
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v6

    .line 661
    .local v6, "info":I
    if-eqz v6, :cond_4

    .line 662
    ushr-int/lit8 v7, v6, 0x10

    .line 663
    .local v7, "attr":I
    and-int/lit8 v8, v7, 0x4

    if-nez v8, :cond_1

    .line 664
    sget-object v8, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v9

    if-ne v8, v9, :cond_1

    .line 665
    goto :goto_1

    .line 668
    :cond_1
    if-nez p1, :cond_2

    and-int/lit8 v8, v7, 0x2

    if-nez v8, :cond_4

    .line 669
    :cond_2
    if-nez v3, :cond_3

    .line 671
    new-array v2, v4, [Ljava/lang/Object;

    .line 673
    :cond_3
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "count":I
    .local v8, "count":I
    aput-object v5, v2, v3

    move v3, v8

    .line 658
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "info":I
    .end local v7    # "attr":I
    .end local v8    # "count":I
    .restart local v3    # "count":I
    :cond_4
    :goto_1
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 677
    .end local v4    # "id":I
    :cond_5
    if-eqz v3, :cond_7

    .line 678
    array-length v4, v0

    if-nez v4, :cond_6

    array-length v4, v2

    if-ne v4, v3, :cond_6

    .line 679
    move-object v0, v2

    goto :goto_2

    .line 682
    :cond_6
    array-length v4, v0

    add-int/2addr v4, v3

    new-array v4, v4, [Ljava/lang/Object;

    .line 683
    .local v4, "tmp":[Ljava/lang/Object;
    array-length v5, v0

    const/4 v6, 0x0

    invoke-static {v0, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 684
    array-length v5, v0

    invoke-static {v2, v6, v4, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 685
    move-object v0, v4

    .line 689
    .end local v2    # "ids":[Ljava/lang/Object;
    .end local v3    # "count":I
    .end local v4    # "tmp":[Ljava/lang/Object;
    :cond_7
    :goto_2
    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 2
    .param p1, "id"    # I

    .line 729
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I

    .line 740
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 697
    const/4 v0, 0x0

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 991
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 992
    .local v0, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    if-nez v0, :cond_1

    .line 993
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 994
    move-object v1, p2

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->getBuiltInDescriptor(Ljava/lang/String;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    goto :goto_0

    .line 995
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->isSymbol(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 996
    move-object v1, p2

    check-cast v1, Lcom/trendmicro/hippo/NativeSymbol;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeSymbol;->getKey()Lcom/trendmicro/hippo/SymbolKey;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/IdScriptableObject;->getBuiltInDescriptor(Lcom/trendmicro/hippo/Symbol;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    .line 999
    :cond_1
    :goto_0
    return-object v0
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 6
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 387
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    .line 388
    .local v0, "info":I
    if-eqz v0, :cond_2

    .line 389
    ushr-int/lit8 v1, v0, 0x10

    .line 390
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x4

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 391
    return v3

    .line 393
    :cond_0
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 394
    .local v2, "id":I
    sget-object v4, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 396
    .end local v1    # "attr":I
    .end local v2    # "id":I
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_3

    .line 397
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v1

    .line 398
    .local v1, "id":I
    if-eqz v1, :cond_3

    .line 399
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->has(I)Z

    move-result v2

    return v2

    .line 402
    .end local v1    # "id":I
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 365
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    .line 366
    .local v0, "info":I
    if-eqz v0, :cond_2

    .line 367
    ushr-int/lit8 v1, v0, 0x10

    .line 368
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x4

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 369
    return v3

    .line 371
    :cond_0
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 372
    .local v2, "id":I
    sget-object v4, Lcom/trendmicro/hippo/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 374
    .end local v1    # "attr":I
    .end local v2    # "id":I
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_3

    .line 375
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 376
    .local v1, "id":I
    if-eqz v1, :cond_3

    .line 377
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->has(I)Z

    move-result v2

    return v2

    .line 380
    .end local v1    # "id":I
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1
.end method

.method public final hasPrototypeMap()Z
    .locals 1

    .line 800
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final initPrototypeConstructor(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 841
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    iget v0, v0, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->constructorId:I

    .line 842
    .local v0, "id":I
    if-eqz v0, :cond_2

    .line 844
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v1

    if-ne v1, v0, :cond_1

    .line 846
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 847
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    const/4 v2, 0x2

    const-string v3, "constructor"

    invoke-virtual {v1, v0, v3, p1, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 848
    return-void

    .line 845
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 843
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method protected initPrototypeId(I)V
    .locals 2
    .param p1, "id"    # I

    .line 864
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 7
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p4, "functionName"    # Ljava/lang/String;
    .param p5, "arity"    # I

    .line 833
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 834
    .local v6, "scope":Lcom/trendmicro/hippo/Scriptable;
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p4

    move v4, p5

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/IdScriptableObject;->newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    .line 835
    .local v0, "function":Lcom/trendmicro/hippo/IdFunctionObject;
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    const/4 v2, 0x2

    invoke-virtual {v1, p2, p3, v0, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 836
    return-object v0
.end method

.method public final initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 6
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "arity"    # I

    .line 816
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/IdScriptableObject;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    return-object v0
.end method

.method public final initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;
    .locals 7
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "propertyName"    # Ljava/lang/String;
    .param p4, "functionName"    # Ljava/lang/String;
    .param p5, "arity"    # I

    .line 822
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 823
    .local v6, "scope":Lcom/trendmicro/hippo/Scriptable;
    nop

    .line 824
    if-eqz p4, :cond_0

    move-object v3, p4

    goto :goto_0

    :cond_0
    move-object v3, p3

    .line 823
    :goto_0
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p5

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/IdScriptableObject;->newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/IdFunctionObject;

    move-result-object v0

    .line 826
    .local v0, "function":Lcom/trendmicro/hippo/IdFunctionObject;
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    const/4 v2, 0x2

    invoke-virtual {v1, p2, p3, v0, v2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 827
    return-object v0
.end method

.method public final initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .line 859
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 860
    return-void
.end method

.method public final initPrototypeValue(ILjava/lang/String;Ljava/lang/Object;I)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .line 853
    iget-object v0, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 854
    return-void
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 4
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 491
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Lcom/trendmicro/hippo/Symbol;)I

    move-result v0

    .line 492
    .local v0, "info":I
    const-string v1, "msg.modify.sealed"

    if-eqz v0, :cond_4

    .line 493
    if-ne p2, p0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 494
    :cond_0
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 496
    :cond_1
    :goto_0
    ushr-int/lit8 v1, v0, 0x10

    .line 497
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_3

    .line 498
    if-ne p2, p0, :cond_2

    .line 499
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 500
    .local v2, "id":I
    invoke-virtual {p0, v2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 501
    .end local v2    # "id":I
    goto :goto_1

    .line 503
    :cond_2
    invoke-static {p2}, Lcom/trendmicro/hippo/IdScriptableObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v2

    invoke-interface {v2, p1, p2, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 506
    :cond_3
    :goto_1
    return-void

    .line 508
    .end local v1    # "attr":I
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v2, :cond_7

    .line 509
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Lcom/trendmicro/hippo/Symbol;)I

    move-result v2

    .line 510
    .restart local v2    # "id":I
    if-eqz v2, :cond_7

    .line 511
    if-ne p2, p0, :cond_6

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_2

    .line 512
    :cond_5
    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 514
    :cond_6
    :goto_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v1, v2, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->set(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 515
    return-void

    .line 518
    .end local v2    # "id":I
    :cond_7
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 519
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 456
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    .line 457
    .local v0, "info":I
    const-string v1, "msg.modify.sealed"

    if-eqz v0, :cond_4

    .line 458
    if-ne p2, p0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 459
    :cond_0
    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 462
    :cond_1
    :goto_0
    ushr-int/lit8 v1, v0, 0x10

    .line 463
    .local v1, "attr":I
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_3

    .line 464
    if-ne p2, p0, :cond_2

    .line 465
    const v2, 0xffff

    and-int/2addr v2, v0

    .line 466
    .local v2, "id":I
    invoke-virtual {p0, v2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 467
    .end local v2    # "id":I
    goto :goto_1

    .line 469
    :cond_2
    invoke-interface {p2, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 472
    :cond_3
    :goto_1
    return-void

    .line 474
    .end local v1    # "attr":I
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v2, :cond_7

    .line 475
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v2

    .line 476
    .restart local v2    # "id":I
    if-eqz v2, :cond_7

    .line 477
    if-ne p2, p0, :cond_6

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->isSealed()Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_2

    .line 478
    :cond_5
    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 481
    :cond_6
    :goto_2
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v1, v2, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->set(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 482
    return-void

    .line 485
    .end local v2    # "id":I
    :cond_7
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 486
    return-void
.end method

.method public setAttributes(Ljava/lang/String;I)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attributes"    # I

    .line 624
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->checkValidAttributes(I)V

    .line 625
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    .line 626
    .local v0, "info":I
    if-eqz v0, :cond_1

    .line 627
    const v1, 0xffff

    and-int/2addr v1, v0

    .line 628
    .local v1, "id":I
    ushr-int/lit8 v2, v0, 0x10

    .line 629
    .local v2, "currentAttributes":I
    if-eq p2, v2, :cond_0

    .line 630
    invoke-virtual {p0, v1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 632
    :cond_0
    return-void

    .line 634
    .end local v1    # "id":I
    .end local v2    # "currentAttributes":I
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_2

    .line 635
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 636
    .restart local v1    # "id":I
    if-eqz v1, :cond_2

    .line 637
    iget-object v2, p0, Lcom/trendmicro/hippo/IdScriptableObject;->prototypeValues:Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;

    invoke-virtual {v2, v1, p2}, Lcom/trendmicro/hippo/IdScriptableObject$PrototypeValues;->setAttributes(II)V

    .line 638
    return-void

    .line 641
    .end local v1    # "id":I
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 642
    return-void
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 761
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Changing attributes not supported for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 762
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 763
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " property"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 761
    const-string v1, "InternalError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 749
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
