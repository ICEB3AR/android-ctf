.class public Lcom/trendmicro/hippo/optimizer/ClassCompiler;
.super Ljava/lang/Object;
.source "ClassCompiler.java"


# instance fields
.field private compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private mainMethodClassName:Ljava/lang/String;

.field private targetExtends:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private targetImplements:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V
    .locals 1
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    if-eqz p1, :cond_0

    .line 35
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 36
    const-string v0, "com.trendmicro.hippo.optimizer.OptRuntime"

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    .line 37
    return-void

    .line 34
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public compileToClassFiles(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)[Ljava/lang/Object;
    .locals 23
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "sourceLocation"    # Ljava/lang/String;
    .param p3, "lineno"    # I
    .param p4, "mainClassName"    # Ljava/lang/String;

    .line 138
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    new-instance v2, Lcom/trendmicro/hippo/Parser;

    iget-object v3, v0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 139
    .local v2, "p":Lcom/trendmicro/hippo/Parser;
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move/from16 v5, p3

    invoke-virtual {v2, v3, v4, v5}, Lcom/trendmicro/hippo/Parser;->parse(Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/ast/AstRoot;

    move-result-object v6

    .line 140
    .local v6, "ast":Lcom/trendmicro/hippo/ast/AstRoot;
    new-instance v7, Lcom/trendmicro/hippo/IRFactory;

    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-direct {v7, v8}, Lcom/trendmicro/hippo/IRFactory;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 141
    .local v7, "irf":Lcom/trendmicro/hippo/IRFactory;
    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/IRFactory;->transformTree(Lcom/trendmicro/hippo/ast/AstRoot;)Lcom/trendmicro/hippo/ast/ScriptNode;

    move-result-object v14

    .line 144
    .local v14, "tree":Lcom/trendmicro/hippo/ast/ScriptNode;
    const/4 v7, 0x0

    .line 145
    const/4 v6, 0x0

    .line 146
    const/4 v2, 0x0

    .line 148
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->getTargetExtends()Ljava/lang/Class;

    move-result-object v15

    .line 149
    .local v15, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->getTargetImplements()[Ljava/lang/Class;

    move-result-object v13

    .line 151
    .local v13, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v16, 0x0

    const/16 v17, 0x1

    if-nez v13, :cond_0

    if-nez v15, :cond_0

    move/from16 v8, v17

    goto :goto_0

    :cond_0
    move/from16 v8, v16

    :goto_0
    move/from16 v18, v8

    .line 152
    .local v18, "isPrimary":Z
    if-eqz v18, :cond_1

    .line 153
    move-object/from16 v8, p4

    move-object v12, v8

    .local v8, "scriptClassName":Ljava/lang/String;
    goto :goto_1

    .line 155
    .end local v8    # "scriptClassName":Ljava/lang/String;
    :cond_1
    const-string v8, "1"

    invoke-virtual {v0, v1, v8}, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->makeAuxiliaryClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v12, v8

    .line 158
    .local v12, "scriptClassName":Ljava/lang/String;
    :goto_1
    new-instance v8, Lcom/trendmicro/hippo/optimizer/Codegen;

    invoke-direct {v8}, Lcom/trendmicro/hippo/optimizer/Codegen;-><init>()V

    move-object v11, v8

    .line 159
    .local v11, "codegen":Lcom/trendmicro/hippo/optimizer/Codegen;
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    invoke-virtual {v11, v8}, Lcom/trendmicro/hippo/optimizer/Codegen;->setMainMethodClass(Ljava/lang/String;)V

    .line 160
    iget-object v9, v0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 162
    invoke-virtual {v14}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSource()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    .line 161
    move-object v8, v11

    move-object v10, v12

    move-object/from16 v21, v11

    .end local v11    # "codegen":Lcom/trendmicro/hippo/optimizer/Codegen;
    .local v21, "codegen":Lcom/trendmicro/hippo/optimizer/Codegen;
    move-object v11, v14

    move-object v0, v12

    .end local v12    # "scriptClassName":Ljava/lang/String;
    .local v0, "scriptClassName":Ljava/lang/String;
    move-object/from16 v12, v19

    move-object/from16 v19, v2

    move-object v2, v13

    .end local v13    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local v2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local v19, "p":Lcom/trendmicro/hippo/Parser;
    move/from16 v13, v20

    invoke-virtual/range {v8 .. v13}, Lcom/trendmicro/hippo/optimizer/Codegen;->compileToClassFile(Lcom/trendmicro/hippo/CompilerEnvirons;Ljava/lang/String;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)[B

    move-result-object v8

    .line 165
    .local v8, "scriptClassBytes":[B
    const/4 v9, 0x2

    if-eqz v18, :cond_2

    .line 166
    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v16

    aput-object v8, v9, v17

    return-object v9

    .line 168
    :cond_2
    invoke-virtual {v14}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v10

    .line 169
    .local v10, "functionCount":I
    new-instance v11, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v11, v10}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    .line 170
    .local v11, "functionNames":Lcom/trendmicro/hippo/ObjToIntMap;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    if-eq v12, v10, :cond_4

    .line 171
    invoke-virtual {v14, v12}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v13

    .line 172
    .local v13, "ofn":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {v13}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v9

    .line 173
    .local v9, "name":Ljava/lang/String;
    if-eqz v9, :cond_3

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v22

    if-eqz v22, :cond_3

    .line 174
    invoke-virtual {v13}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v3

    invoke-virtual {v11, v9, v3}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 170
    .end local v9    # "name":Ljava/lang/String;
    .end local v13    # "ofn":Lcom/trendmicro/hippo/ast/FunctionNode;
    :cond_3
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v3, p1

    const/4 v9, 0x2

    goto :goto_2

    .line 177
    .end local v12    # "i":I
    :cond_4
    if-nez v15, :cond_5

    .line 178
    sget-object v15, Lcom/trendmicro/hippo/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    .line 180
    :cond_5
    nop

    .line 181
    invoke-static {v11, v1, v15, v2, v0}, Lcom/trendmicro/hippo/JavaAdapter;->createAdapterCode(Lcom/trendmicro/hippo/ObjToIntMap;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;Ljava/lang/String;)[B

    move-result-object v3

    .line 185
    .local v3, "mainClassBytes":[B
    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v16

    aput-object v3, v9, v17

    const/4 v12, 0x2

    aput-object v0, v9, v12

    const/4 v12, 0x3

    aput-object v8, v9, v12

    return-object v9
.end method

.method public getCompilerEnv()Lcom/trendmicro/hippo/CompilerEnvirons;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    return-object v0
.end method

.method public getMainMethodClass()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetExtends()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->targetExtends:Ljava/lang/Class;

    return-object v0
.end method

.method public getTargetImplements()[Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->targetImplements:[Ljava/lang/Class;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, [Ljava/lang/Class;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    :goto_0
    return-object v0
.end method

.method protected makeAuxiliaryClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "mainClassName"    # Ljava/lang/String;
    .param p2, "auxMarker"    # Ljava/lang/String;

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setMainMethodClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .line 50
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->mainMethodClassName:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setTargetExtends(Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 85
    .local p1, "extendsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->targetExtends:Ljava/lang/Class;

    .line 86
    return-void
.end method

.method public setTargetImplements([Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 104
    .local p1, "implementsClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, [Ljava/lang/Class;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/ClassCompiler;->targetImplements:[Ljava/lang/Class;

    .line 105
    return-void
.end method
