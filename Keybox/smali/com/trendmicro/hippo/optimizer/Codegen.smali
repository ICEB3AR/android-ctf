.class public Lcom/trendmicro/hippo/optimizer/Codegen;
.super Ljava/lang/Object;
.source "Codegen.java"

# interfaces
.implements Lcom/trendmicro/hippo/Evaluator;


# static fields
.field static final DEFAULT_MAIN_METHOD_CLASS:Ljava/lang/String; = "com.trendmicro.hippo.optimizer.OptRuntime"

.field static final FUNCTION_CONSTRUCTOR_SIGNATURE:Ljava/lang/String; = "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;I)V"

.field static final FUNCTION_INIT_SIGNATURE:Ljava/lang/String; = "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V"

.field static final ID_FIELD_NAME:Ljava/lang/String; = "_id"

.field static final REGEXP_INIT_METHOD_NAME:Ljava/lang/String; = "_reInit"

.field static final REGEXP_INIT_METHOD_SIGNATURE:Ljava/lang/String; = "(Lcom/trendmicro/hippo/Context;)V"

.field private static final SUPER_CLASS_NAME:Ljava/lang/String; = "com.trendmicro.hippo.NativeFunction"

.field private static final globalLock:Ljava/lang/Object;

.field private static globalSerialClassCounter:I


# instance fields
.field private compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private directCallTargets:Lcom/trendmicro/hippo/ObjArray;

.field private itsConstantList:[D

.field private itsConstantListSize:I

.field mainClassName:Ljava/lang/String;

.field mainClassSignature:Ljava/lang/String;

.field private mainMethodClass:Ljava/lang/String;

.field private scriptOrFnIndexes:Lcom/trendmicro/hippo/ObjToIntMap;

.field scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1246
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/optimizer/Codegen;->globalLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1255
    const-string v0, "com.trendmicro.hippo.optimizer.OptRuntime"

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    return-void
.end method

.method private static addDoubleWrap(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 4
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1131
    const/16 v0, 0xb8

    const-string v1, "com/trendmicro/hippo/optimizer/OptRuntime"

    const-string v2, "wrapDouble"

    const-string v3, "(D)Ljava/lang/Double;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    return-void
.end method

.method static badTree()Ljava/lang/RuntimeException;
    .locals 2

    .line 1217
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Bad tree in codegen"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static collectScriptNodes_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/ObjArray;)V
    .locals 3
    .param p0, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p1, "x"    # Lcom/trendmicro/hippo/ObjArray;

    .line 269
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 270
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 271
    .local v0, "nestedCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 272
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->collectScriptNodes_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/ObjArray;)V

    .line 271
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 274
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;
    .locals 9
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 148
    move-object v0, p1

    check-cast v0, [Ljava/lang/Object;

    .line 149
    .local v0, "nameBytesPair":[Ljava/lang/Object;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    check-cast v1, Ljava/lang/String;

    .line 150
    .local v1, "className":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v0, v2

    check-cast v2, [B

    .line 154
    .local v2, "classBytes":[B
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 156
    .local v3, "hippoLoader":Ljava/lang/ClassLoader;
    invoke-static {v3, p2}, Lcom/trendmicro/hippo/SecurityController;->createLoader(Ljava/lang/ClassLoader;Ljava/lang/Object;)Lcom/trendmicro/hippo/GeneratedClassLoader;

    move-result-object v4

    .line 160
    .local v4, "loader":Lcom/trendmicro/hippo/GeneratedClassLoader;
    :try_start_0
    invoke-interface {v4, v1, v2}, Lcom/trendmicro/hippo/GeneratedClassLoader;->defineClass(Ljava/lang/String;[B)Ljava/lang/Class;

    move-result-object v5

    .line 161
    .local v5, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v4, v5}, Lcom/trendmicro/hippo/GeneratedClassLoader;->linkClass(Ljava/lang/Class;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    return-object v5

    .line 165
    .end local v5    # "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v5

    .line 166
    .local v5, "x":Ljava/lang/IllegalArgumentException;
    move-object v6, v5

    .local v6, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 163
    .end local v5    # "x":Ljava/lang/IllegalArgumentException;
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v5

    .line 164
    .local v5, "x":Ljava/lang/SecurityException;
    move-object v6, v5

    .line 167
    .end local v5    # "x":Ljava/lang/SecurityException;
    .restart local v6    # "e":Ljava/lang/Exception;
    nop

    .line 168
    :goto_0
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Malformed optimizer package "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private emitConstantDudeInitializers(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 12
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1035
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantListSize:I

    .line 1036
    .local v0, "N":I
    if-nez v0, :cond_0

    .line 1037
    return-void

    .line 1039
    :cond_0
    const/16 v1, 0x18

    const-string v2, "<clinit>"

    const-string v3, "()V"

    invoke-virtual {p1, v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1041
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    .line 1042
    .local v1, "array":[D
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_2

    .line 1043
    aget-wide v3, v1, v2

    .line 1044
    .local v3, "num":D
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_k"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1045
    .local v5, "constantName":Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->getStaticConstantWrapperType(D)Ljava/lang/String;

    move-result-object v6

    .line 1046
    .local v6, "constantType":Ljava/lang/String;
    const/16 v7, 0xa

    invoke-virtual {p1, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1048
    double-to-int v7, v3

    .line 1049
    .local v7, "inum":I
    int-to-double v8, v7

    cmpl-double v8, v8, v3

    if-nez v8, :cond_1

    .line 1050
    invoke-virtual {p1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1051
    const/16 v8, 0xb8

    const-string v9, "java/lang/Integer"

    const-string v10, "valueOf"

    const-string v11, "(I)Ljava/lang/Integer;"

    invoke-virtual {p1, v8, v9, v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1054
    :cond_1
    invoke-virtual {p1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 1055
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->addDoubleWrap(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 1057
    :goto_1
    const/16 v8, 0xb3

    iget-object v9, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p1, v8, v9, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1042
    .end local v3    # "num":D
    .end local v5    # "constantName":Ljava/lang/String;
    .end local v6    # "constantType":Ljava/lang/String;
    .end local v7    # "inum":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1061
    .end local v2    # "i":I
    :cond_2
    const/16 v2, 0xb1

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1062
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1063
    return-void
.end method

.method private emitDirectConstructor(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V
    .locals 9
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "ofn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 350
    iget-object v0, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/optimizer/Codegen;->getDirectCtorName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 351
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    .line 350
    const/16 v2, 0xa

    invoke-virtual {p1, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 354
    iget-object v0, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v0

    .line 355
    .local v0, "argCount":I
    mul-int/lit8 v1, v0, 0x3

    add-int/lit8 v1, v1, 0x4

    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 357
    .local v1, "firstLocal":I
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 358
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 359
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 360
    const/16 v5, 0xb6

    const-string v6, "com/trendmicro/hippo/BaseFunction"

    const-string v7, "createObject"

    const-string v8, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {p1, v5, v6, v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 368
    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 369
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 370
    invoke-virtual {p1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 371
    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 372
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 373
    mul-int/lit8 v3, v2, 0x3

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 374
    mul-int/lit8 v3, v2, 0x3

    add-int/lit8 v3, v3, 0x5

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addDLoad(I)V

    .line 372
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 376
    .end local v2    # "i":I
    :cond_0
    mul-int/lit8 v2, v0, 0x3

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 377
    const/16 v2, 0xb8

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    iget-object v4, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 379
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 380
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v5

    .line 377
    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 382
    .local v2, "exitLabel":I
    const/16 v3, 0x59

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 383
    const/16 v3, 0xc1

    const-string v4, "com/trendmicro/hippo/Scriptable"

    invoke-virtual {p1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 384
    const/16 v3, 0x99

    invoke-virtual {p1, v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 386
    const/16 v3, 0xc0

    invoke-virtual {p1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 387
    const/16 v3, 0xb0

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 388
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 390
    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 391
    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 393
    add-int/lit8 v3, v1, 0x1

    int-to-short v3, v3

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 394
    return-void
.end method

.method private emitRegExpInit(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 18
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 969
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    .line 970
    .local v2, "totalRegCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v5, v4

    if-eq v3, v5, :cond_0

    .line 971
    aget-object v4, v4, v3

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpCount()I

    move-result v4

    add-int/2addr v2, v4

    .line 970
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 973
    .end local v3    # "i":I
    :cond_0
    if-nez v2, :cond_1

    .line 974
    return-void

    .line 977
    :cond_1
    const-string v3, "_reInit"

    const-string v4, "(Lcom/trendmicro/hippo/Context;)V"

    const/16 v5, 0xa

    invoke-virtual {v1, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 979
    const/16 v3, 0x4a

    const-string v4, "_reInitDone"

    const-string v6, "Z"

    invoke-virtual {v1, v4, v6, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 981
    const/16 v3, 0xb2

    iget-object v7, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {v1, v3, v7, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v3

    .line 983
    .local v3, "doInit":I
    const/16 v7, 0x99

    invoke-virtual {v1, v7, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 984
    const/16 v7, 0xb1

    invoke-virtual {v1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 985
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 988
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 989
    const/16 v9, 0xb8

    const-string v10, "com/trendmicro/hippo/ScriptRuntime"

    const-string v11, "checkRegExpProxy"

    const-string v12, "(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;"

    invoke-virtual {v1, v9, v10, v11, v12}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addAStore(I)V

    .line 998
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v12, v11

    if-eq v10, v12, :cond_4

    .line 999
    aget-object v11, v11, v10

    .line 1000
    .local v11, "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpCount()I

    move-result v12

    .line 1001
    .local v12, "regCount":I
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_2
    if-eq v14, v12, :cond_3

    .line 1002
    invoke-virtual {v0, v11, v14}, Lcom/trendmicro/hippo/optimizer/Codegen;->getCompiledRegexpName(Lcom/trendmicro/hippo/ast/ScriptNode;I)Ljava/lang/String;

    move-result-object v15

    .line 1003
    .local v15, "reFieldName":Ljava/lang/String;
    const-string v7, "Ljava/lang/Object;"

    .line 1004
    .local v7, "reFieldType":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpString(I)Ljava/lang/String;

    move-result-object v13

    .line 1005
    .local v13, "reString":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpFlags(I)Ljava/lang/String;

    move-result-object v8

    .line 1006
    .local v8, "reFlags":Ljava/lang/String;
    invoke-virtual {v1, v15, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 1008
    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1009
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 1010
    invoke-virtual {v1, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 1011
    if-nez v8, :cond_2

    .line 1012
    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    goto :goto_3

    .line 1014
    :cond_2
    invoke-virtual {v1, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 1016
    :goto_3
    const/16 v5, 0xb9

    const-string v9, "com/trendmicro/hippo/RegExpProxy"

    move/from16 v16, v2

    .end local v2    # "totalRegCount":I
    .local v16, "totalRegCount":I
    const-string v2, "compileRegExp"

    move/from16 v17, v3

    .end local v3    # "doInit":I
    .local v17, "doInit":I
    const-string v3, "(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;"

    invoke-virtual {v1, v5, v9, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1022
    iget-object v2, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const/16 v3, 0xb3

    invoke-virtual {v1, v3, v2, v15, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    .end local v7    # "reFieldType":Ljava/lang/String;
    .end local v8    # "reFlags":Ljava/lang/String;
    .end local v13    # "reString":Ljava/lang/String;
    .end local v15    # "reFieldName":Ljava/lang/String;
    add-int/lit8 v14, v14, 0x1

    move/from16 v2, v16

    move/from16 v3, v17

    const/16 v5, 0xa

    const/16 v7, 0xb1

    const/4 v8, 0x0

    const/4 v9, 0x1

    goto :goto_2

    .end local v16    # "totalRegCount":I
    .end local v17    # "doInit":I
    .restart local v2    # "totalRegCount":I
    .restart local v3    # "doInit":I
    :cond_3
    move/from16 v16, v2

    move/from16 v17, v3

    .line 998
    .end local v2    # "totalRegCount":I
    .end local v3    # "doInit":I
    .end local v11    # "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    .end local v12    # "regCount":I
    .end local v14    # "j":I
    .restart local v16    # "totalRegCount":I
    .restart local v17    # "doInit":I
    add-int/lit8 v10, v10, 0x1

    const/16 v5, 0xa

    const/16 v7, 0xb1

    const/4 v8, 0x0

    const/4 v9, 0x1

    goto :goto_1

    .end local v16    # "totalRegCount":I
    .end local v17    # "doInit":I
    .restart local v2    # "totalRegCount":I
    .restart local v3    # "doInit":I
    :cond_4
    move/from16 v16, v2

    move/from16 v17, v3

    .line 1027
    .end local v2    # "totalRegCount":I
    .end local v3    # "doInit":I
    .end local v10    # "i":I
    .restart local v16    # "totalRegCount":I
    .restart local v17    # "doInit":I
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 1028
    iget-object v2, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const/16 v3, 0xb3

    invoke-virtual {v1, v3, v2, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1029
    const/16 v2, 0xb1

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 1030
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 1031
    return-void
.end method

.method private generateCallMethod(Lcom/trendmicro/classfile/ClassFileWriter;Z)V
    .locals 17
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "isStrictMode"    # Z

    .line 480
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "call"

    const-string v3, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    const/16 v4, 0x11

    invoke-virtual {v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 492
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 493
    .local v2, "nonTopCallLabel":I
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 494
    const/16 v4, 0xb8

    const-string v5, "com/trendmicro/hippo/ScriptRuntime"

    const-string v6, "hasTopCall"

    const-string v7, "(Lcom/trendmicro/hippo/Context;)Z"

    invoke-virtual {v1, v4, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const/16 v6, 0x9a

    invoke-virtual {v1, v6, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 500
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 501
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 502
    const/4 v7, 0x2

    invoke-virtual {v1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 503
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 504
    const/4 v9, 0x4

    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 505
    invoke-virtual/range {p1 .. p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 506
    const-string v10, "doTopCall"

    const-string v11, "(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Z)Ljava/lang/Object;"

    invoke-virtual {v1, v4, v5, v10, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    const/16 v5, 0xb0

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 517
    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 520
    invoke-virtual {v1, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 521
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 522
    invoke-virtual {v1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 523
    invoke-virtual {v1, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 524
    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 526
    iget-object v8, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v8, v8

    .line 527
    .local v8, "end":I
    if-gt v7, v8, :cond_0

    move v6, v3

    .line 529
    .local v6, "generateSwitch":Z
    :cond_0
    const/4 v7, 0x0

    .line 530
    .local v7, "switchStart":I
    const/4 v10, 0x0

    .line 531
    .local v10, "switchStackTop":I
    if-eqz v6, :cond_1

    .line 532
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 533
    const/16 v11, 0xb4

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "_id"

    const-string v14, "I"

    invoke-virtual {v1, v11, v12, v13, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    add-int/lit8 v11, v8, -0x1

    invoke-virtual {v1, v3, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v7

    .line 539
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v8, :cond_8

    .line 540
    iget-object v11, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v11, v11, v3

    .line 541
    .local v11, "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    if-eqz v6, :cond_3

    .line 542
    if-nez v3, :cond_2

    .line 543
    invoke-virtual {v1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 544
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v10

    goto :goto_1

    .line 546
    :cond_2
    add-int/lit8 v12, v3, -0x1

    invoke-virtual {v1, v7, v12, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 550
    :cond_3
    :goto_1
    invoke-virtual {v11}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v12

    const/16 v13, 0x6e

    if-ne v12, v13, :cond_7

    .line 551
    invoke-static {v11}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v12

    .line 552
    .local v12, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    invoke-virtual {v12}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 553
    iget-object v13, v12, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v13}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v13

    .line 554
    .local v13, "pcount":I
    if-eqz v13, :cond_5

    .line 557
    const/4 v14, 0x0

    .local v14, "p":I
    :goto_2
    if-eq v14, v13, :cond_4

    .line 558
    const/16 v15, 0xbe

    invoke-virtual {v1, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 559
    invoke-virtual {v1, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 560
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v15

    .line 561
    .local v15, "undefArg":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v5

    .line 562
    .local v5, "beyond":I
    const/16 v4, 0xa4

    invoke-virtual {v1, v4, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 564
    invoke-virtual {v1, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 565
    invoke-virtual {v1, v14}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 566
    const/16 v4, 0x32

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 567
    const/16 v4, 0xa7

    invoke-virtual {v1, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 568
    invoke-virtual {v1, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 569
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 570
    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 572
    const/4 v4, -0x1

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->adjustStackTop(I)V

    .line 573
    move/from16 v16, v10

    .end local v10    # "switchStackTop":I
    .local v16, "switchStackTop":I
    const-wide/16 v9, 0x0

    invoke-virtual {v1, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 575
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 557
    .end local v5    # "beyond":I
    .end local v15    # "undefArg":I
    add-int/lit8 v14, v14, 0x1

    move v9, v4

    move/from16 v10, v16

    const/16 v4, 0xb8

    const/16 v5, 0xb0

    goto :goto_2

    .end local v16    # "switchStackTop":I
    .restart local v10    # "switchStackTop":I
    :cond_4
    move v4, v9

    move/from16 v16, v10

    .end local v10    # "switchStackTop":I
    .restart local v16    # "switchStackTop":I
    goto :goto_3

    .line 554
    .end local v14    # "p":I
    .end local v16    # "switchStackTop":I
    .restart local v10    # "switchStackTop":I
    :cond_5
    move v4, v9

    move/from16 v16, v10

    .end local v10    # "switchStackTop":I
    .restart local v16    # "switchStackTop":I
    goto :goto_3

    .line 552
    .end local v13    # "pcount":I
    .end local v16    # "switchStackTop":I
    .restart local v10    # "switchStackTop":I
    :cond_6
    move v4, v9

    move/from16 v16, v10

    .end local v10    # "switchStackTop":I
    .restart local v16    # "switchStackTop":I
    goto :goto_3

    .line 550
    .end local v12    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v16    # "switchStackTop":I
    .restart local v10    # "switchStackTop":I
    :cond_7
    move v4, v9

    move/from16 v16, v10

    .line 580
    .end local v10    # "switchStackTop":I
    .restart local v16    # "switchStackTop":I
    :goto_3
    iget-object v5, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 582
    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v9

    .line 583
    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v10

    .line 580
    const/16 v12, 0xb8

    invoke-virtual {v1, v12, v5, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    const/16 v5, 0xb0

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 539
    .end local v11    # "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    add-int/lit8 v3, v3, 0x1

    move v9, v4

    move v4, v12

    move/from16 v10, v16

    goto/16 :goto_0

    .line 586
    .end local v3    # "i":I
    .end local v16    # "switchStackTop":I
    .restart local v10    # "switchStackTop":I
    :cond_8
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 588
    return-void
.end method

.method private generateCode(Ljava/lang/String;)[B
    .locals 11
    .param p1, "encodedSource"    # Ljava/lang/String;

    .line 278
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v0

    const/4 v2, 0x1

    const/16 v3, 0x89

    if-ne v0, v3, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 279
    .local v0, "hasScript":Z
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v3, v3

    if-gt v3, v2, :cond_2

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v1

    .line 280
    .local v2, "hasFunctions":Z
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ScriptNode;->isInStrictMode()Z

    move-result v3

    .line 282
    .local v3, "isStrictMode":Z
    const/4 v4, 0x0

    .line 283
    .local v4, "sourceFile":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 284
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v1, v5, v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v4

    .line 287
    :cond_3
    new-instance v1, Lcom/trendmicro/classfile/ClassFileWriter;

    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v6, "com.trendmicro.hippo.NativeFunction"

    invoke-direct {v1, v5, v6, v4}, Lcom/trendmicro/classfile/ClassFileWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .local v1, "cfw":Lcom/trendmicro/classfile/ClassFileWriter;
    const/4 v5, 0x2

    const-string v6, "_id"

    const-string v7, "I"

    invoke-virtual {v1, v6, v7, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addField(Ljava/lang/String;Ljava/lang/String;S)V

    .line 292
    if-eqz v2, :cond_4

    .line 293
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateFunctionConstructor(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 296
    :cond_4
    if-eqz v0, :cond_5

    .line 297
    const-string v5, "com/trendmicro/hippo/Script"

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInterface(Ljava/lang/String;)V

    .line 298
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateScriptCtor(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 299
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateMain(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 300
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateExecute(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 303
    :cond_5
    invoke-direct {p0, v1, v3}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateCallMethod(Lcom/trendmicro/classfile/ClassFileWriter;Z)V

    .line 304
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateResumeGenerator(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 306
    invoke-direct {p0, v1, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateNativeFunctionOverrides(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;)V

    .line 308
    iget-object v5, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v5, v5

    .line 309
    .local v5, "count":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    if-eq v6, v5, :cond_7

    .line 310
    iget-object v7, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v7, v7, v6

    .line 312
    .local v7, "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    new-instance v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;

    invoke-direct {v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;-><init>()V

    .line 313
    .local v8, "bodygen":Lcom/trendmicro/hippo/optimizer/BodyCodegen;
    iput-object v1, v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->cfw:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 314
    iput-object p0, v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->codegen:Lcom/trendmicro/hippo/optimizer/Codegen;

    .line 315
    iget-object v9, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    iput-object v9, v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 316
    iput-object v7, v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 317
    iput v6, v8, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->scriptOrFnIndex:I

    .line 319
    invoke-virtual {v8}, Lcom/trendmicro/hippo/optimizer/BodyCodegen;->generateBodyCode()V

    .line 321
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v9

    const/16 v10, 0x6e

    if-ne v9, v10, :cond_6

    .line 322
    invoke-static {v7}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v9

    .line 323
    .local v9, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    invoke-direct {p0, v1, v9}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateFunctionInit(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V

    .line 324
    invoke-virtual {v9}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v10

    if-eqz v10, :cond_6

    .line 325
    invoke-direct {p0, v1, v9}, Lcom/trendmicro/hippo/optimizer/Codegen;->emitDirectConstructor(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V

    .line 309
    .end local v7    # "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    .end local v8    # "bodygen":Lcom/trendmicro/hippo/optimizer/BodyCodegen;
    .end local v9    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 330
    .end local v6    # "i":I
    :cond_7
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->emitRegExpInit(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 331
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->emitConstantDudeInitializers(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 333
    invoke-virtual {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->toByteArray()[B

    move-result-object v6

    return-object v6
.end method

.method private generateExecute(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 6
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 614
    const-string v0, "exec"

    const-string v1, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;"

    const/16 v2, 0x11

    invoke-virtual {p1, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 620
    const/4 v0, 0x1

    .line 621
    .local v0, "CONTEXT_ARG":I
    const/4 v1, 0x2

    .line 623
    .local v1, "SCOPE_ARG":I
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 624
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 625
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 626
    const/16 v3, 0x59

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 627
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 628
    nop

    .line 629
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 628
    const/16 v3, 0xb6

    const-string v4, "call"

    const-string v5, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {p1, v3, v2, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    const/16 v2, 0xb0

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 639
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 640
    return-void
.end method

.method private generateFunctionConstructor(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 14
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 661
    const/4 v0, 0x1

    .line 662
    .local v0, "SCOPE_ARG":I
    const/4 v1, 0x2

    .line 663
    .local v1, "CONTEXT_ARG":I
    const/4 v2, 0x3

    .line 665
    .local v2, "ID_ARG":I
    const-string v3, "<init>"

    const-string v4, "(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Context;I)V"

    const/4 v5, 0x1

    invoke-virtual {p1, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 666
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 667
    const/16 v6, 0xb7

    const-string v7, "com.trendmicro.hippo.NativeFunction"

    const-string v8, "()V"

    invoke-virtual {p1, v6, v7, v3, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 670
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 671
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 672
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0xb5

    const-string v9, "_id"

    const-string v10, "I"

    invoke-virtual {p1, v8, v7, v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 675
    const/4 v7, 0x2

    invoke-virtual {p1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 676
    invoke-virtual {p1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 678
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v8, v8, v4

    invoke-virtual {v8}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v8

    const/16 v9, 0x89

    if-ne v8, v9, :cond_0

    move v8, v5

    goto :goto_0

    :cond_0
    move v8, v4

    .line 679
    .local v8, "start":I
    :goto_0
    iget-object v9, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v9, v9

    .line 680
    .local v9, "end":I
    if-eq v8, v9, :cond_6

    .line 681
    sub-int v10, v9, v8

    if-gt v7, v10, :cond_1

    goto :goto_1

    :cond_1
    move v5, v4

    :goto_1
    move v4, v5

    .line 683
    .local v4, "generateSwitch":Z
    const/4 v5, 0x0

    .line 684
    .local v5, "switchStart":I
    const/4 v7, 0x0

    .line 685
    .local v7, "switchStackTop":I
    if-eqz v4, :cond_2

    .line 686
    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 689
    add-int/lit8 v3, v8, 0x1

    add-int/lit8 v10, v9, -0x1

    invoke-virtual {p1, v3, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v5

    .line 692
    :cond_2
    move v3, v8

    .local v3, "i":I
    :goto_2
    if-eq v3, v9, :cond_5

    .line 693
    if-eqz v4, :cond_4

    .line 694
    if-ne v3, v8, :cond_3

    .line 695
    invoke-virtual {p1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 696
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v7

    goto :goto_3

    .line 698
    :cond_3
    add-int/lit8 v10, v3, -0x1

    sub-int/2addr v10, v8

    invoke-virtual {p1, v5, v10, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 702
    :cond_4
    :goto_3
    iget-object v10, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v10, v10, v3

    invoke-static {v10}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v10

    .line 703
    .local v10, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    iget-object v11, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 705
    invoke-virtual {p0, v10}, Lcom/trendmicro/hippo/optimizer/Codegen;->getFunctionInitMethodName(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)Ljava/lang/String;

    move-result-object v12

    .line 703
    const-string v13, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V"

    invoke-virtual {p1, v6, v11, v12, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 707
    const/16 v11, 0xb1

    invoke-virtual {p1, v11}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 692
    .end local v10    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 711
    .end local v3    # "i":I
    :cond_5
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 712
    return-void

    .line 680
    .end local v4    # "generateSwitch":Z
    .end local v5    # "switchStart":I
    .end local v7    # "switchStackTop":I
    :cond_6
    invoke-static {}, Lcom/trendmicro/hippo/optimizer/Codegen;->badTree()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method private generateFunctionInit(Lcom/trendmicro/classfile/ClassFileWriter;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V
    .locals 7
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "ofn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 717
    const/4 v0, 0x1

    .line 718
    .local v0, "CONTEXT_ARG":I
    const/4 v1, 0x2

    .line 719
    .local v1, "SCOPE_ARG":I
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/optimizer/Codegen;->getFunctionInitMethodName(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V"

    const/16 v4, 0x12

    invoke-virtual {p1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 724
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 725
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 726
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 727
    const/16 v4, 0xb6

    const-string v5, "com/trendmicro/hippo/NativeFunction"

    const-string v6, "initScriptFunction"

    invoke-virtual {p1, v4, v5, v6, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    iget-object v3, p2, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getRegexpCount()I

    move-result v3

    if-eqz v3, :cond_0

    .line 736
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 737
    const/16 v2, 0xb8

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    const-string v4, "_reInit"

    const-string v5, "(Lcom/trendmicro/hippo/Context;)V"

    invoke-virtual {p1, v2, v3, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 741
    :cond_0
    const/16 v2, 0xb1

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 743
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 744
    return-void
.end method

.method private generateMain(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 5
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 592
    const-string v0, "main"

    const-string v1, "([Ljava/lang/String;)V"

    const/16 v2, 0x9

    invoke-virtual {p1, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 596
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xbb

    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;)V

    .line 597
    const/16 v1, 0x59

    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 598
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xb7

    const-string v3, "<init>"

    const-string v4, "()V"

    invoke-virtual {p1, v2, v1, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 601
    const/16 v1, 0x2a

    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 603
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    const/16 v2, 0xb8

    const-string v3, "(Lcom/trendmicro/hippo/Script;[Ljava/lang/String;)V"

    invoke-virtual {p1, v2, v1, v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    const/16 v0, 0xb1

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 609
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 610
    return-void
.end method

.method private generateNativeFunctionOverrides(Lcom/trendmicro/classfile/ClassFileWriter;Ljava/lang/String;)V
    .locals 24
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "encodedSource"    # Ljava/lang/String;

    .line 752
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "getLanguageVersion"

    const-string v3, "()I"

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 754
    iget-object v2, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 755
    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 758
    invoke-virtual {v1, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 763
    const/4 v5, 0x0

    .line 764
    .local v5, "Do_getFunctionName":I
    const/4 v6, 0x1

    .line 765
    .local v6, "Do_getParamCount":I
    const/4 v7, 0x2

    .line 766
    .local v7, "Do_getParamAndVarCount":I
    const/4 v8, 0x3

    .line 767
    .local v8, "Do_getParamOrVarName":I
    const/4 v9, 0x4

    .line 768
    .local v9, "Do_getEncodedSource":I
    const/4 v10, 0x5

    .line 769
    .local v10, "Do_getParamOrVarConst":I
    const/4 v11, 0x6

    .line 771
    .local v11, "SWITCH_COUNT":I
    const/4 v12, 0x0

    .local v12, "methodIndex":I
    :goto_0
    const/4 v13, 0x6

    if-eq v12, v13, :cond_1c

    .line 772
    const/4 v13, 0x4

    if-ne v12, v13, :cond_0

    if-nez p2, :cond_0

    .line 773
    move v0, v2

    move-object/from16 v18, v3

    move/from16 v19, v5

    move/from16 v22, v6

    move/from16 v23, v7

    goto/16 :goto_b

    .line 782
    :cond_0
    const-string v14, "()Ljava/lang/String;"

    const/4 v2, 0x2

    const/4 v15, 0x3

    if-eqz v12, :cond_6

    if-eq v12, v4, :cond_5

    if-eq v12, v2, :cond_4

    if-eq v12, v15, :cond_3

    if-eq v12, v13, :cond_2

    const/4 v13, 0x5

    if-ne v12, v13, :cond_1

    .line 804
    const/4 v13, 0x3

    .line 805
    .local v13, "methodLocals":S
    const-string v14, "getParamOrVarConst"

    const-string v15, "(I)Z"

    invoke-virtual {v1, v14, v15, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 807
    goto :goto_1

    .line 815
    .end local v13    # "methodLocals":S
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 809
    :cond_2
    const/4 v13, 0x1

    .line 810
    .restart local v13    # "methodLocals":S
    const-string v15, "getEncodedSource"

    invoke-virtual {v1, v15, v14, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 812
    invoke-virtual/range {p1 .. p2}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 813
    goto :goto_1

    .line 799
    .end local v13    # "methodLocals":S
    :cond_3
    const/4 v13, 0x2

    .line 800
    .restart local v13    # "methodLocals":S
    const-string v14, "getParamOrVarName"

    const-string v15, "(I)Ljava/lang/String;"

    invoke-virtual {v1, v14, v15, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 802
    goto :goto_1

    .line 794
    .end local v13    # "methodLocals":S
    :cond_4
    const/4 v13, 0x1

    .line 795
    .restart local v13    # "methodLocals":S
    const-string v14, "getParamAndVarCount"

    invoke-virtual {v1, v14, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 797
    goto :goto_1

    .line 789
    .end local v13    # "methodLocals":S
    :cond_5
    const/4 v13, 0x1

    .line 790
    .restart local v13    # "methodLocals":S
    const-string v14, "getParamCount"

    invoke-virtual {v1, v14, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 792
    goto :goto_1

    .line 784
    .end local v13    # "methodLocals":S
    :cond_6
    const/4 v13, 0x1

    .line 785
    .restart local v13    # "methodLocals":S
    const-string v15, "getFunctionName"

    invoke-virtual {v1, v15, v14, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 787
    nop

    .line 818
    :goto_1
    iget-object v14, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v14, v14

    .line 820
    .local v14, "count":I
    const/4 v15, 0x0

    .line 821
    .local v15, "switchStart":I
    const/16 v16, 0x0

    .line 822
    .local v16, "switchStackTop":I
    if-le v14, v4, :cond_7

    .line 825
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 826
    const/16 v2, 0xb4

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v18, v3

    const-string v3, "_id"

    move/from16 v19, v5

    .end local v5    # "Do_getFunctionName":I
    .local v19, "Do_getFunctionName":I
    const-string v5, "I"

    invoke-virtual {v1, v2, v4, v3, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 830
    add-int/lit8 v2, v14, -0x1

    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v15

    goto :goto_2

    .line 822
    .end local v19    # "Do_getFunctionName":I
    .restart local v5    # "Do_getFunctionName":I
    :cond_7
    move-object/from16 v18, v3

    move/from16 v19, v5

    .line 833
    .end local v5    # "Do_getFunctionName":I
    .restart local v19    # "Do_getFunctionName":I
    :goto_2
    const/4 v2, 0x0

    move/from16 v3, v16

    .end local v16    # "switchStackTop":I
    .local v2, "i":I
    .local v3, "switchStackTop":I
    :goto_3
    if-eq v2, v14, :cond_1b

    .line 834
    iget-object v4, v0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v4, v4, v2

    .line 835
    .local v4, "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    if-nez v2, :cond_8

    .line 836
    const/4 v5, 0x1

    if-le v14, v5, :cond_9

    .line 837
    invoke-virtual {v1, v15}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 838
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v3

    goto :goto_4

    .line 841
    :cond_8
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v1, v15, v5, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 846
    :cond_9
    :goto_4
    if-eqz v12, :cond_19

    const/4 v5, 0x1

    if-eq v12, v5, :cond_18

    const/4 v5, 0x2

    if-eq v12, v5, :cond_17

    const/4 v5, 0x3

    if-eq v12, v5, :cond_11

    const/4 v5, 0x4

    if-eq v12, v5, :cond_10

    const/4 v5, 0x5

    if-ne v12, v5, :cond_f

    .line 910
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarCount()I

    move-result v5

    .line 911
    .local v5, "paramAndVarCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarConst()[Z

    move-result-object v16

    .line 912
    .local v16, "constness":[Z
    if-nez v5, :cond_a

    .line 916
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 917
    const/16 v0, 0xac

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    move/from16 v20, v3

    move/from16 v22, v6

    move/from16 v23, v7

    goto/16 :goto_a

    .line 918
    :cond_a
    const/16 v0, 0xac

    const/4 v0, 0x1

    if-ne v5, v0, :cond_b

    .line 921
    const/16 v17, 0x0

    aget-boolean v0, v16, v17

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 922
    const/16 v0, 0xac

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    move/from16 v20, v3

    move/from16 v22, v6

    move/from16 v23, v7

    goto/16 :goto_a

    .line 925
    :cond_b
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 928
    move/from16 v20, v3

    .end local v3    # "switchStackTop":I
    .local v20, "switchStackTop":I
    add-int/lit8 v3, v5, -0x1

    invoke-virtual {v1, v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v3

    .line 930
    .local v3, "paramSwitchStart":I
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_5
    if-eq v0, v5, :cond_e

    .line 931
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v21

    if-eqz v21, :cond_c

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 932
    :cond_c
    if-nez v0, :cond_d

    .line 933
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    move/from16 v21, v5

    move/from16 v22, v6

    goto :goto_6

    .line 935
    :cond_d
    move/from16 v21, v5

    .end local v5    # "paramAndVarCount":I
    .local v21, "paramAndVarCount":I
    add-int/lit8 v5, v0, -0x1

    move/from16 v22, v6

    const/4 v6, 0x0

    .end local v6    # "Do_getParamCount":I
    .local v22, "Do_getParamCount":I
    invoke-virtual {v1, v3, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 938
    :goto_6
    aget-boolean v5, v16, v0

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Z)V

    .line 939
    const/16 v5, 0xac

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 930
    add-int/lit8 v0, v0, 0x1

    move/from16 v5, v21

    move/from16 v6, v22

    goto :goto_5

    .end local v21    # "paramAndVarCount":I
    .end local v22    # "Do_getParamCount":I
    .restart local v5    # "paramAndVarCount":I
    .restart local v6    # "Do_getParamCount":I
    :cond_e
    move/from16 v21, v5

    move/from16 v22, v6

    .line 942
    .end local v0    # "j":I
    .end local v3    # "paramSwitchStart":I
    .end local v5    # "paramAndVarCount":I
    .end local v6    # "Do_getParamCount":I
    .restart local v21    # "paramAndVarCount":I
    .restart local v22    # "Do_getParamCount":I
    move/from16 v23, v7

    const/16 v0, 0xac

    goto/16 :goto_a

    .line 957
    .end local v16    # "constness":[Z
    .end local v20    # "switchStackTop":I
    .end local v21    # "paramAndVarCount":I
    .end local v22    # "Do_getParamCount":I
    .local v3, "switchStackTop":I
    .restart local v6    # "Do_getParamCount":I
    :cond_f
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 947
    :cond_10
    move/from16 v20, v3

    move/from16 v22, v6

    .end local v3    # "switchStackTop":I
    .end local v6    # "Do_getParamCount":I
    .restart local v20    # "switchStackTop":I
    .restart local v22    # "Do_getParamCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSourceStart()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 948
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSourceEnd()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 949
    const/16 v0, 0xb6

    const-string v3, "java/lang/String"

    const-string v5, "substring"

    const-string v6, "(II)Ljava/lang/String;"

    invoke-virtual {v1, v0, v3, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 953
    const/16 v0, 0xb0

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 954
    move/from16 v23, v7

    const/16 v0, 0xac

    goto/16 :goto_a

    .line 873
    .end local v20    # "switchStackTop":I
    .end local v22    # "Do_getParamCount":I
    .restart local v3    # "switchStackTop":I
    .restart local v6    # "Do_getParamCount":I
    :cond_11
    move/from16 v20, v3

    move/from16 v22, v6

    const/16 v0, 0xb0

    .end local v3    # "switchStackTop":I
    .end local v6    # "Do_getParamCount":I
    .restart local v20    # "switchStackTop":I
    .restart local v22    # "Do_getParamCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarCount()I

    move-result v3

    .line 874
    .local v3, "paramAndVarCount":I
    if-nez v3, :cond_12

    .line 878
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 879
    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    move/from16 v23, v7

    const/16 v0, 0xac

    goto/16 :goto_a

    .line 880
    :cond_12
    const/4 v5, 0x1

    if-ne v3, v5, :cond_13

    .line 883
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 884
    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    move/from16 v23, v7

    const/16 v0, 0xac

    goto/16 :goto_a

    .line 887
    :cond_13
    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 890
    add-int/lit8 v0, v3, -0x1

    invoke-virtual {v1, v5, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v0

    .line 892
    .local v0, "paramSwitchStart":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_7
    if-eq v6, v3, :cond_16

    .line 893
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getStackTop()S

    move-result v17

    if-eqz v17, :cond_14

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 894
    :cond_14
    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v5

    .line 895
    .local v5, "s":Ljava/lang/String;
    if-nez v6, :cond_15

    .line 896
    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    move/from16 v21, v3

    move/from16 v23, v7

    const/4 v7, 0x0

    goto :goto_8

    .line 898
    :cond_15
    move/from16 v21, v3

    .end local v3    # "paramAndVarCount":I
    .restart local v21    # "paramAndVarCount":I
    add-int/lit8 v3, v6, -0x1

    move/from16 v23, v7

    const/4 v7, 0x0

    .end local v7    # "Do_getParamAndVarCount":I
    .local v23, "Do_getParamAndVarCount":I
    invoke-virtual {v1, v0, v3, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 901
    :goto_8
    invoke-virtual {v1, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 902
    const/16 v3, 0xb0

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 892
    .end local v5    # "s":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    move/from16 v3, v21

    move/from16 v7, v23

    const/4 v5, 0x1

    goto :goto_7

    .end local v21    # "paramAndVarCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .restart local v3    # "paramAndVarCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_16
    move/from16 v21, v3

    move/from16 v23, v7

    .line 905
    .end local v0    # "paramSwitchStart":I
    .end local v3    # "paramAndVarCount":I
    .end local v6    # "j":I
    .end local v7    # "Do_getParamAndVarCount":I
    .restart local v21    # "paramAndVarCount":I
    .restart local v23    # "Do_getParamAndVarCount":I
    const/16 v0, 0xac

    goto :goto_a

    .line 866
    .end local v20    # "switchStackTop":I
    .end local v21    # "paramAndVarCount":I
    .end local v22    # "Do_getParamCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .local v3, "switchStackTop":I
    .local v6, "Do_getParamCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_17
    move/from16 v20, v3

    move/from16 v22, v6

    move/from16 v23, v7

    .end local v3    # "switchStackTop":I
    .end local v6    # "Do_getParamCount":I
    .end local v7    # "Do_getParamAndVarCount":I
    .restart local v20    # "switchStackTop":I
    .restart local v22    # "Do_getParamCount":I
    .restart local v23    # "Do_getParamAndVarCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarCount()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 867
    const/16 v0, 0xac

    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 868
    goto :goto_a

    .line 860
    .end local v20    # "switchStackTop":I
    .end local v22    # "Do_getParamCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .restart local v3    # "switchStackTop":I
    .restart local v6    # "Do_getParamCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_18
    move/from16 v20, v3

    move/from16 v22, v6

    move/from16 v23, v7

    const/16 v0, 0xac

    .end local v3    # "switchStackTop":I
    .end local v6    # "Do_getParamCount":I
    .end local v7    # "Do_getParamAndVarCount":I
    .restart local v20    # "switchStackTop":I
    .restart local v22    # "Do_getParamCount":I
    .restart local v23    # "Do_getParamAndVarCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamCount()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 861
    invoke-virtual {v1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 862
    goto :goto_a

    .line 849
    .end local v20    # "switchStackTop":I
    .end local v22    # "Do_getParamCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .restart local v3    # "switchStackTop":I
    .restart local v6    # "Do_getParamCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_19
    move/from16 v20, v3

    move/from16 v22, v6

    move/from16 v23, v7

    const/16 v0, 0xac

    .end local v3    # "switchStackTop":I
    .end local v6    # "Do_getParamCount":I
    .end local v7    # "Do_getParamAndVarCount":I
    .restart local v20    # "switchStackTop":I
    .restart local v22    # "Do_getParamCount":I
    .restart local v23    # "Do_getParamAndVarCount":I
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v3

    const/16 v5, 0x89

    if-ne v3, v5, :cond_1a

    .line 850
    const-string v3, ""

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    goto :goto_9

    .line 852
    :cond_1a
    move-object v3, v4

    check-cast v3, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v3

    .line 853
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(Ljava/lang/String;)V

    .line 855
    .end local v3    # "name":Ljava/lang/String;
    :goto_9
    const/16 v3, 0xb0

    invoke-virtual {v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 856
    nop

    .line 833
    .end local v4    # "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    :goto_a
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    move/from16 v3, v20

    move/from16 v6, v22

    move/from16 v7, v23

    goto/16 :goto_3

    .end local v20    # "switchStackTop":I
    .end local v22    # "Do_getParamCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .local v3, "switchStackTop":I
    .restart local v6    # "Do_getParamCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_1b
    move/from16 v22, v6

    move/from16 v23, v7

    const/16 v0, 0xac

    .line 961
    .end local v2    # "i":I
    .end local v6    # "Do_getParamCount":I
    .end local v7    # "Do_getParamAndVarCount":I
    .restart local v22    # "Do_getParamCount":I
    .restart local v23    # "Do_getParamAndVarCount":I
    invoke-virtual {v1, v13}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 771
    .end local v3    # "switchStackTop":I
    .end local v13    # "methodLocals":S
    .end local v14    # "count":I
    .end local v15    # "switchStart":I
    :goto_b
    add-int/lit8 v12, v12, 0x1

    move v2, v0

    move-object/from16 v3, v18

    move/from16 v5, v19

    move/from16 v6, v22

    move/from16 v7, v23

    const/4 v4, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 963
    .end local v12    # "methodIndex":I
    .end local v19    # "Do_getFunctionName":I
    .end local v22    # "Do_getParamCount":I
    .end local v23    # "Do_getParamAndVarCount":I
    .local v5, "Do_getFunctionName":I
    .restart local v6    # "Do_getParamCount":I
    .restart local v7    # "Do_getParamAndVarCount":I
    :cond_1c
    return-void
.end method

.method private generateResumeGenerator(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 11
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 416
    const/4 v0, 0x0

    .line 417
    .local v0, "hasGenerators":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 418
    aget-object v2, v2, v1

    invoke-static {v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->isGenerator(Lcom/trendmicro/hippo/ast/ScriptNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 419
    const/4 v0, 0x1

    .line 417
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 424
    .end local v1    # "i":I
    :cond_1
    if-nez v0, :cond_2

    .line 425
    return-void

    .line 427
    :cond_2
    const/16 v1, 0x11

    const-string v2, "resumeGenerator"

    const-string v3, "(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {p1, v2, v3, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 435
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 436
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 437
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 438
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 439
    const/4 v3, 0x5

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addALoad(I)V

    .line 440
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addILoad(I)V

    .line 442
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 443
    const/16 v3, 0xb4

    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "_id"

    const-string v6, "I"

    invoke-virtual {p1, v3, v4, v5, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v3, v3

    sub-int/2addr v3, v2

    invoke-virtual {p1, v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->addTableSwitch(II)I

    move-result v1

    .line 446
    .local v1, "startSwitch":I
    invoke-virtual {p1, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchDefault(I)V

    .line 447
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->acquireLabel()I

    move-result v2

    .line 449
    .local v2, "endlabel":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    array-length v5, v4

    const/4 v6, 0x6

    const/16 v7, 0xb0

    if-ge v3, v5, :cond_4

    .line 450
    aget-object v4, v4, v3

    .line 451
    .local v4, "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    invoke-virtual {p1, v1, v3, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->markTableSwitchCase(III)V

    .line 452
    invoke-static {v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->isGenerator(Lcom/trendmicro/hippo/ast/ScriptNode;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 453
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 459
    .local v5, "type":Ljava/lang/String;
    const/16 v6, 0xb8

    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 461
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/optimizer/Codegen;->getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "_gen"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 459
    invoke-virtual {p1, v6, v8, v9, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    invoke-virtual {p1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 464
    .end local v5    # "type":Ljava/lang/String;
    goto :goto_2

    .line 465
    :cond_3
    const/16 v5, 0xa7

    invoke-virtual {p1, v5, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->add(II)V

    .line 449
    .end local v4    # "n":Lcom/trendmicro/hippo/ast/ScriptNode;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 469
    .end local v3    # "i":I
    :cond_4
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->markLabel(I)V

    .line 470
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V

    .line 471
    invoke-virtual {p1, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 475
    invoke-virtual {p1, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 476
    return-void
.end method

.method private generateScriptCtor(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 5
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 644
    const-string v0, "<init>"

    const-string v1, "()V"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->startMethod(Ljava/lang/String;Ljava/lang/String;S)V

    .line 646
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 647
    const/16 v3, 0xb7

    const-string v4, "com.trendmicro.hippo.NativeFunction"

    invoke-virtual {p1, v3, v4, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter;->addInvoke(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 650
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->addLoadThis()V

    .line 651
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(I)V

    .line 652
    invoke-virtual {p1}, Lcom/trendmicro/classfile/ClassFileWriter;->getClassName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xb5

    const-string v3, "_id"

    const-string v4, "I"

    invoke-virtual {p1, v1, v0, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    const/16 v0, 0xb1

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->add(I)V

    .line 656
    invoke-virtual {p1, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->stopMethod(S)V

    .line 657
    return-void
.end method

.method private static getStaticConstantWrapperType(D)Ljava/lang/String;
    .locals 3
    .param p0, "num"    # D

    .line 1138
    double-to-int v0, p0

    .line 1139
    .local v0, "inum":I
    int-to-double v1, v0

    cmpl-double v1, v1, p0

    if-nez v1, :cond_0

    .line 1140
    const-string v1, "Ljava/lang/Integer;"

    return-object v1

    .line 1142
    :cond_0
    const-string v1, "Ljava/lang/Double;"

    return-object v1
.end method

.method private static initOptFunctions_r(Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 4
    .param p0, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 244
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v1

    .local v1, "N":I
    :goto_0
    if-eq v0, v1, :cond_0

    .line 245
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v2

    .line 246
    .local v2, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    new-instance v3, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;-><init>(Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 247
    invoke-static {v2}, Lcom/trendmicro/hippo/optimizer/Codegen;->initOptFunctions_r(Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 244
    .end local v2    # "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 249
    .end local v0    # "i":I
    .end local v1    # "N":I
    :cond_0
    return-void
.end method

.method private initScriptNodesData(Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 5
    .param p1, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 253
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    .line 254
    .local v0, "x":Lcom/trendmicro/hippo/ObjArray;
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/optimizer/Codegen;->collectScriptNodes_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/ObjArray;)V

    .line 256
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    .line 257
    .local v1, "count":I
    new-array v2, v1, [Lcom/trendmicro/hippo/ast/ScriptNode;

    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 258
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;)V

    .line 260
    new-instance v2, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v2, v1}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnIndexes:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 261
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v1, :cond_0

    .line 262
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnIndexes:Lcom/trendmicro/hippo/ObjToIntMap;

    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnNodes:[Lcom/trendmicro/hippo/ast/ScriptNode;

    aget-object v4, v4, v2

    invoke-virtual {v3, v4, v2}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 261
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 264
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method static isGenerator(Lcom/trendmicro/hippo/ast/ScriptNode;)Z
    .locals 2
    .param p0, "node"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 398
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v0

    const/16 v1, 0x6e

    if-ne v0, v1, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 399
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 398
    :goto_0
    return v0
.end method

.method static pushUndefined(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 4
    .param p0, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1146
    const/16 v0, 0xb2

    const-string v1, "com/trendmicro/hippo/Undefined"

    const-string v2, "instance"

    const-string v3, "Ljava/lang/Object;"

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1148
    return-void
.end method

.method private transform(Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 7
    .param p1, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 199
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->initOptFunctions_r(Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 201
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/CompilerEnvirons;->getOptimizationLevel()I

    move-result v0

    .line 203
    .local v0, "optLevel":I
    const/4 v1, 0x0

    .line 204
    .local v1, "possibleDirectCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/optimizer/OptFunctionNode;>;"
    if-lez v0, :cond_2

    .line 210
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v2

    const/16 v3, 0x89

    if-ne v2, v3, :cond_2

    .line 211
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v2

    .line 212
    .local v2, "functionCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v2, :cond_2

    .line 213
    invoke-static {p1, v3}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v4

    .line 214
    .local v4, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    iget-object v5, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 217
    iget-object v5, v4, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v5

    .line 218
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_1

    .line 219
    if-nez v1, :cond_0

    .line 220
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    move-object v1, v6

    .line 222
    :cond_0
    invoke-interface {v1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .end local v4    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v5    # "name":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 229
    .end local v2    # "functionCount":I
    .end local v3    # "i":I
    :cond_2
    if-eqz v1, :cond_3

    .line 230
    new-instance v2, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v2}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->directCallTargets:Lcom/trendmicro/hippo/ObjArray;

    .line 233
    :cond_3
    new-instance v2, Lcom/trendmicro/hippo/optimizer/OptTransformer;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->directCallTargets:Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v2, v1, v3}, Lcom/trendmicro/hippo/optimizer/OptTransformer;-><init>(Ljava/util/Map;Lcom/trendmicro/hippo/ObjArray;)V

    .line 235
    .local v2, "ot":Lcom/trendmicro/hippo/optimizer/OptTransformer;
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v2, p1, v3}, Lcom/trendmicro/hippo/optimizer/OptTransformer;->transform(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 237
    if-lez v0, :cond_4

    .line 238
    new-instance v3, Lcom/trendmicro/hippo/optimizer/Optimizer;

    invoke-direct {v3}, Lcom/trendmicro/hippo/optimizer/Optimizer;-><init>()V

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->optimize(Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 240
    :cond_4
    return-void
.end method


# virtual methods
.method public captureStackInfo(Lcom/trendmicro/hippo/HippoException;)V
    .locals 1
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;

    .line 59
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method cleanName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1170
    const-string v0, ""

    .line 1171
    .local v0, "result":Ljava/lang/String;
    instance-of v1, p1, Lcom/trendmicro/hippo/ast/FunctionNode;

    if-eqz v1, :cond_1

    .line 1172
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    .line 1173
    .local v1, "name":Lcom/trendmicro/hippo/ast/Name;
    if-nez v1, :cond_0

    .line 1174
    const-string v0, "anonymous"

    goto :goto_0

    .line 1176
    :cond_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 1178
    .end local v1    # "name":Lcom/trendmicro/hippo/ast/Name;
    :goto_0
    goto :goto_1

    .line 1179
    :cond_1
    const-string v0, "script"

    .line 1181
    :goto_1
    return-object v0
.end method

.method public compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 12
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .line 89
    sget-object v1, Lcom/trendmicro/hippo/optimizer/Codegen;->globalLock:Ljava/lang/Object;

    monitor-enter v1

    .line 90
    :try_start_0
    sget v0, Lcom/trendmicro/hippo/optimizer/Codegen;->globalSerialClassCounter:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    sput v0, Lcom/trendmicro/hippo/optimizer/Codegen;->globalSerialClassCounter:I

    .line 91
    .local v0, "serial":I
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    const-string v1, "c"

    .line 94
    .local v1, "baseName":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_0

    .line 95
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v3

    const-string v5, "\\W"

    const-string v6, "_"

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 96
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v3

    if-nez v3, :cond_0

    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 101
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.trendmicro.hippo.gen."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 103
    .local v3, "mainClassName":Ljava/lang/String;
    move-object v6, p0

    move-object v7, p1

    move-object v8, v3

    move-object v9, p2

    move-object v10, p3

    move/from16 v11, p4

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/optimizer/Codegen;->compileToClassFile(Lcom/trendmicro/hippo/CompilerEnvirons;Ljava/lang/String;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)[B

    move-result-object v5

    .line 107
    .local v5, "mainClassBytes":[B
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v4

    aput-object v5, v6, v2

    return-object v6

    .line 91
    .end local v0    # "serial":I
    .end local v1    # "baseName":Ljava/lang/String;
    .end local v3    # "mainClassName":Ljava/lang/String;
    .end local v5    # "mainClassBytes":[B
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public compileToClassFile(Lcom/trendmicro/hippo/CompilerEnvirons;Ljava/lang/String;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)[B
    .locals 1
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "mainClassName"    # Ljava/lang/String;
    .param p3, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p4, "encodedSource"    # Ljava/lang/String;
    .param p5, "returnFunction"    # Z

    .line 177
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 179
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/optimizer/Codegen;->transform(Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 185
    if-eqz p5, :cond_0

    .line 186
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object p3

    .line 189
    :cond_0
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/optimizer/Codegen;->initScriptNodesData(Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 191
    iput-object p2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    .line 192
    invoke-static {p2}, Lcom/trendmicro/classfile/ClassFileWriter;->classNameToSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    .line 194
    invoke-direct {p0, p4}, Lcom/trendmicro/hippo/optimizer/Codegen;->generateCode(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public createFunctionObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Function;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "bytecode"    # Ljava/lang/Object;
    .param p4, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 131
    invoke-direct {p0, p3, p4}, Lcom/trendmicro/hippo/optimizer/Codegen;->defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 135
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    .line 136
    .local v1, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v2

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v4

    move-object v2, v3

    .line 137
    .local v2, "initArgs":[Ljava/lang/Object;
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/NativeFunction;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 141
    .end local v2    # "initArgs":[Ljava/lang/Object;
    .local v1, "f":Lcom/trendmicro/hippo/NativeFunction;
    nop

    .line 142
    return-object v1

    .line 138
    .end local v1    # "f":Lcom/trendmicro/hippo/NativeFunction;
    :catch_0
    move-exception v1

    .line 139
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to instantiate compiled class:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/Script;
    .locals 5
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/optimizer/Codegen;->defineClass(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v0

    .line 118
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Script;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .local v1, "script":Lcom/trendmicro/hippo/Script;
    nop

    .line 123
    return-object v1

    .line 119
    .end local v1    # "script":Lcom/trendmicro/hippo/Script;
    :catch_0
    move-exception v1

    .line 120
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to instantiate compiled class:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method getBodyMethodName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_c_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->cleanName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getBodyMethodSignature(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;
    .locals 5
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1187
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1188
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassSignature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1189
    const-string v1, "Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1192
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v1

    const/16 v2, 0x6e

    if-ne v1, v2, :cond_0

    .line 1193
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v1

    .line 1194
    .local v1, "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1195
    iget-object v2, v1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v2

    .line 1196
    .local v2, "pCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v2, :cond_0

    .line 1197
    const-string v4, "Ljava/lang/Object;D"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1196
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1201
    .end local v1    # "ofn":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .end local v2    # "pCount":I
    .end local v3    # "i":I
    :cond_0
    const-string v1, "[Ljava/lang/Object;)Ljava/lang/Object;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getCompiledRegexpName(Lcom/trendmicro/hippo/ast/ScriptNode;I)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p2, "regexpIndex"    # I

    .line 1212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_re"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getDirectCtorName(Lcom/trendmicro/hippo/ast/ScriptNode;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getFunctionInitMethodName(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)Ljava/lang/String;
    .locals 2
    .param p1, "ofn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 1207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_i"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/optimizer/Codegen;->getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getIndex(Lcom/trendmicro/hippo/ast/ScriptNode;)I
    .locals 1
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1152
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->scriptOrFnIndexes:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->getExisting(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getPatchedStack(Lcom/trendmicro/hippo/HippoException;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;
    .param p2, "nativeStackTrace"    # Ljava/lang/String;

    .line 69
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getScriptStack(Lcom/trendmicro/hippo/HippoException;)Ljava/util/List;
    .locals 1
    .param p1, "ex"    # Lcom/trendmicro/hippo/HippoException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/HippoException;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 74
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getSourcePositionFromStack(Lcom/trendmicro/hippo/Context;[I)Ljava/lang/String;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "linep"    # [I

    .line 64
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method pushNumberAsObject(Lcom/trendmicro/classfile/ClassFileWriter;D)V
    .locals 8
    .param p1, "cfw"    # Lcom/trendmicro/classfile/ClassFileWriter;
    .param p2, "num"    # D

    .line 1067
    const-wide/16 v0, 0x0

    cmpl-double v2, p2, v0

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    const-string v5, "com/trendmicro/hippo/optimizer/OptRuntime"

    const-string v6, "Ljava/lang/Double;"

    const/16 v7, 0xb2

    if-nez v2, :cond_1

    .line 1068
    div-double/2addr v3, p2

    cmpl-double v0, v3, v0

    if-lez v0, :cond_0

    .line 1070
    const-string v0, "zeroObj"

    invoke-virtual {p1, v7, v5, v0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1074
    :cond_0
    invoke-virtual {p1, p2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 1075
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->addDoubleWrap(Lcom/trendmicro/classfile/ClassFileWriter;)V

    goto/16 :goto_2

    .line 1078
    :cond_1
    cmpl-double v0, p2, v3

    if-nez v0, :cond_2

    .line 1079
    const-string v0, "oneObj"

    invoke-virtual {p1, v7, v5, v0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1082
    return-void

    .line 1084
    :cond_2
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    cmpl-double v0, p2, v0

    if-nez v0, :cond_3

    .line 1085
    const-string v0, "minusOneObj"

    invoke-virtual {p1, v7, v5, v0, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1089
    :cond_3
    cmpl-double v0, p2, p2

    if-eqz v0, :cond_4

    .line 1090
    const-string v0, "com/trendmicro/hippo/ScriptRuntime"

    const-string v1, "NaNobj"

    invoke-virtual {p1, v7, v0, v1, v6}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1094
    :cond_4
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantListSize:I

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_5

    .line 1099
    invoke-virtual {p1, p2, p3}, Lcom/trendmicro/classfile/ClassFileWriter;->addPush(D)V

    .line 1100
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Codegen;->addDoubleWrap(Lcom/trendmicro/classfile/ClassFileWriter;)V

    goto :goto_2

    .line 1103
    :cond_5
    iget v0, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantListSize:I

    .line 1104
    .local v0, "N":I
    const/4 v1, 0x0

    .line 1105
    .local v1, "index":I
    if-nez v0, :cond_6

    .line 1106
    const/16 v2, 0x40

    new-array v2, v2, [D

    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    goto :goto_1

    .line 1108
    :cond_6
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    .line 1109
    .local v2, "array":[D
    :goto_0
    if-eq v1, v0, :cond_7

    aget-wide v3, v2, v1

    cmpl-double v3, v3, p2

    if-eqz v3, :cond_7

    .line 1110
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1112
    :cond_7
    array-length v3, v2

    if-ne v0, v3, :cond_8

    .line 1113
    mul-int/lit8 v3, v0, 0x2

    new-array v2, v3, [D

    .line 1114
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1115
    iput-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    .line 1118
    .end local v2    # "array":[D
    :cond_8
    :goto_1
    if-ne v1, v0, :cond_9

    .line 1119
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantList:[D

    aput-wide p2, v2, v0

    .line 1120
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->itsConstantListSize:I

    .line 1122
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_k"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1123
    .local v2, "constantName":Ljava/lang/String;
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/optimizer/Codegen;->getStaticConstantWrapperType(D)Ljava/lang/String;

    move-result-object v3

    .line 1124
    .local v3, "constantType":Ljava/lang/String;
    iget-object v4, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainClassName:Ljava/lang/String;

    invoke-virtual {p1, v7, v4, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1127
    .end local v0    # "N":I
    .end local v1    # "index":I
    .end local v2    # "constantName":Ljava/lang/String;
    .end local v3    # "constantType":Ljava/lang/String;
    :goto_2
    return-void
.end method

.method public setEvalScriptFlag(Lcom/trendmicro/hippo/Script;)V
    .locals 1
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;

    .line 79
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setMainMethodClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .line 1222
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/Codegen;->mainMethodClass:Ljava/lang/String;

    .line 1223
    return-void
.end method
