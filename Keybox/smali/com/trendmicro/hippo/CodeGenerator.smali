.class Lcom/trendmicro/hippo/CodeGenerator;
.super Lcom/trendmicro/hippo/Icode;
.source "CodeGenerator.java"


# static fields
.field private static final ECF_TAIL:I = 0x1

.field private static final MIN_FIXUP_TABLE_SIZE:I = 0x28

.field private static final MIN_LABEL_TABLE_SIZE:I = 0x20


# instance fields
.field private compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

.field private doubleTableTop:I

.field private exceptionTableTop:I

.field private fixupTable:[J

.field private fixupTableTop:I

.field private iCodeTop:I

.field private itsData:Lcom/trendmicro/hippo/InterpreterData;

.field private itsInFunctionFlag:Z

.field private itsInTryFlag:Z

.field private labelTable:[I

.field private labelTableTop:I

.field private lineNumber:I

.field private literalIds:Lcom/trendmicro/hippo/ObjArray;

.field private localTop:I

.field private scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

.field private stackDepth:I

.field private strings:Lcom/trendmicro/hippo/ObjToIntMap;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 16
    invoke-direct {p0}, Lcom/trendmicro/hippo/Icode;-><init>()V

    .line 34
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    iput-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 42
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    return-void
.end method

.method private addBackwardGoto(II)V
    .locals 2
    .param p1, "gotoOp"    # I
    .param p2, "jumpPC"    # I

    .line 1215
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1217
    .local v0, "fromPC":I
    if-le v0, p2, :cond_0

    .line 1218
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addGotoOp(I)V

    .line 1219
    invoke-direct {p0, v0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->resolveGoto(II)V

    .line 1220
    return-void

    .line 1217
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private addExceptionHandler(IIIZII)V
    .locals 4
    .param p1, "icodeStart"    # I
    .param p2, "icodeEnd"    # I
    .param p3, "handlerStart"    # I
    .param p4, "isFinally"    # Z
    .param p5, "exceptionObjectLocal"    # I
    .param p6, "scopeLocal"    # I

    .line 1414
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->exceptionTableTop:I

    .line 1415
    .local v0, "top":I
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    .line 1416
    .local v1, "table":[I
    if-nez v1, :cond_1

    .line 1417
    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1418
    :cond_0
    const/16 v2, 0xc

    new-array v1, v2, [I

    .line 1419
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    goto :goto_0

    .line 1420
    :cond_1
    array-length v2, v1

    if-ne v2, v0, :cond_2

    .line 1421
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [I

    .line 1422
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1423
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    .line 1425
    :cond_2
    :goto_0
    add-int/lit8 v2, v0, 0x0

    aput p1, v1, v2

    .line 1426
    add-int/lit8 v2, v0, 0x1

    aput p2, v1, v2

    .line 1427
    add-int/lit8 v2, v0, 0x2

    aput p3, v1, v2

    .line 1428
    add-int/lit8 v2, v0, 0x3

    aput p4, v1, v2

    .line 1429
    add-int/lit8 v2, v0, 0x4

    aput p5, v1, v2

    .line 1430
    add-int/lit8 v2, v0, 0x5

    aput p6, v1, v2

    .line 1432
    add-int/lit8 v2, v0, 0x6

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->exceptionTableTop:I

    .line 1433
    return-void
.end method

.method private addGoto(Lcom/trendmicro/hippo/Node;I)V
    .locals 9
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;
    .param p2, "gotoOp"    # I

    .line 1173
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 1174
    .local v0, "label":I
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTableTop:I

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1175
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    aget v1, v1, v0

    .line 1177
    .local v1, "targetPC":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 1178
    invoke-direct {p0, p2, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addBackwardGoto(II)V

    goto :goto_1

    .line 1180
    :cond_1
    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1181
    .local v2, "gotoPC":I
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addGotoOp(I)V

    .line 1182
    iget v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTableTop:I

    .line 1183
    .local v3, "top":I
    iget-object v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    if-eqz v4, :cond_2

    array-length v4, v4

    if-ne v3, v4, :cond_4

    .line 1184
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    if-nez v4, :cond_3

    .line 1185
    const/16 v4, 0x28

    new-array v4, v4, [J

    iput-object v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    goto :goto_0

    .line 1187
    :cond_3
    array-length v5, v4

    mul-int/lit8 v5, v5, 0x2

    new-array v5, v5, [J

    .line 1188
    .local v5, "tmp":[J
    const/4 v6, 0x0

    invoke-static {v4, v6, v5, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1189
    iput-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    .line 1192
    .end local v5    # "tmp":[J
    :cond_4
    :goto_0
    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTableTop:I

    .line 1193
    iget-object v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    int-to-long v5, v0

    const/16 v7, 0x20

    shl-long/2addr v5, v7

    int-to-long v7, v2

    or-long/2addr v5, v7

    aput-wide v5, v4, v3

    .line 1195
    .end local v2    # "gotoPC":I
    .end local v3    # "top":I
    :goto_1
    return-void
.end method

.method private addGotoOp(I)V
    .locals 4
    .param p1, "gotoOp"    # I

    .line 1316
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1317
    .local v0, "array":[B
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1318
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x3

    array-length v3, v0

    if-le v2, v3, :cond_0

    .line 1319
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1321
    :cond_0
    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 1323
    add-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1324
    return-void
.end method

.method private addIcode(I)V
    .locals 1
    .param p1, "icode"    # I

    .line 1255
    invoke-static {p1}, Lcom/trendmicro/hippo/Icode;->validIcode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1257
    and-int/lit16 v0, p1, 0xff

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1258
    return-void

    .line 1255
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private addIndexOp(II)V
    .locals 1
    .param p1, "op"    # I
    .param p2, "index"    # I

    .line 1364
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexPrefix(I)V

    .line 1365
    invoke-static {p1}, Lcom/trendmicro/hippo/Icode;->validIcode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1366
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 1368
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 1370
    :goto_0
    return-void
.end method

.method private addIndexPrefix(I)V
    .locals 1
    .param p1, "index"    # I

    .line 1395
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1396
    :cond_0
    const/4 v0, 0x6

    if-ge p1, v0, :cond_1

    .line 1397
    rsub-int/lit8 v0, p1, -0x20

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 1398
    :cond_1
    const/16 v0, 0xff

    if-gt p1, v0, :cond_2

    .line 1399
    const/16 v0, -0x26

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1400
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1401
    :cond_2
    const v0, 0xffff

    if-gt p1, v0, :cond_3

    .line 1402
    const/16 v0, -0x27

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1403
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    goto :goto_0

    .line 1405
    :cond_3
    const/16 v0, -0x28

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1406
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addInt(I)V

    .line 1408
    :goto_0
    return-void
.end method

.method private addInt(I)V
    .locals 4
    .param p1, "i"    # I

    .line 1287
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1288
    .local v0, "array":[B
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1289
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x4

    array-length v3, v0

    if-le v2, v3, :cond_0

    .line 1290
    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1292
    :cond_0
    ushr-int/lit8 v2, p1, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1293
    add-int/lit8 v2, v1, 0x1

    ushr-int/lit8 v3, p1, 0x10

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1294
    add-int/lit8 v2, v1, 0x2

    ushr-int/lit8 v3, p1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 1295
    add-int/lit8 v2, v1, 0x3

    int-to-byte v3, p1

    aput-byte v3, v0, v2

    .line 1296
    add-int/lit8 v2, v1, 0x4

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1297
    return-void
.end method

.method private addStringOp(ILjava/lang/String;)V
    .locals 1
    .param p1, "op"    # I
    .param p2, "str"    # Ljava/lang/String;

    .line 1354
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addStringPrefix(Ljava/lang/String;)V

    .line 1355
    invoke-static {p1}, Lcom/trendmicro/hippo/Icode;->validIcode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1356
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 1358
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 1360
    :goto_0
    return-void
.end method

.method private addStringPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 1374
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v0

    .line 1375
    .local v0, "index":I
    if-ne v0, v1, :cond_0

    .line 1376
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v0

    .line 1377
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 1379
    :cond_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 1380
    rsub-int/lit8 v1, v0, -0x29

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_0

    .line 1381
    :cond_1
    const/16 v1, 0xff

    if-gt v0, v1, :cond_2

    .line 1382
    const/16 v1, -0x2d

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1383
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    goto :goto_0

    .line 1384
    :cond_2
    const v1, 0xffff

    if-gt v0, v1, :cond_3

    .line 1385
    const/16 v1, -0x2e

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1386
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    goto :goto_0

    .line 1388
    :cond_3
    const/16 v1, -0x2f

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1389
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addInt(I)V

    .line 1391
    :goto_0
    return-void
.end method

.method private addToken(I)V
    .locals 1
    .param p1, "token"    # I

    .line 1249
    invoke-static {p1}, Lcom/trendmicro/hippo/Icode;->validTokenCode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1250
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1251
    return-void

    .line 1249
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private addUint16(I)V
    .locals 4
    .param p1, "value"    # I

    .line 1274
    const/high16 v0, -0x10000

    and-int/2addr v0, p1

    if-nez v0, :cond_1

    .line 1275
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1276
    .local v0, "array":[B
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1277
    .local v1, "top":I
    add-int/lit8 v2, v1, 0x2

    array-length v3, v0

    if-le v2, v3, :cond_0

    .line 1278
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1280
    :cond_0
    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 1281
    add-int/lit8 v2, v1, 0x1

    int-to-byte v3, p1

    aput-byte v3, v0, v2

    .line 1282
    add-int/lit8 v2, v1, 0x2

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1283
    return-void

    .line 1274
    .end local v0    # "array":[B
    .end local v1    # "top":I
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private addUint8(I)V
    .locals 3
    .param p1, "value"    # I

    .line 1262
    and-int/lit16 v0, p1, -0x100

    if-nez v0, :cond_1

    .line 1263
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1264
    .local v0, "array":[B
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1265
    .local v1, "top":I
    array-length v2, v0

    if-ne v1, v2, :cond_0

    .line 1266
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->increaseICodeCapacity(I)[B

    move-result-object v0

    .line 1268
    :cond_0
    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 1269
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1270
    return-void

    .line 1262
    .end local v0    # "array":[B
    .end local v1    # "top":I
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private addVarOp(II)V
    .locals 3
    .param p1, "op"    # I
    .param p2, "varIndex"    # I

    .line 1328
    const/4 v0, -0x7

    if-eq p1, v0, :cond_5

    const/16 v0, 0x9d

    const/16 v1, 0x80

    if-eq p1, v0, :cond_3

    const/16 v0, 0x37

    if-eq p1, v0, :cond_1

    const/16 v2, 0x38

    if-ne p1, v2, :cond_0

    goto :goto_0

    .line 1349
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1339
    :cond_1
    :goto_0
    if-ge p2, v1, :cond_5

    .line 1340
    if-ne p1, v0, :cond_2

    const/16 v0, -0x30

    goto :goto_1

    :cond_2
    const/16 v0, -0x31

    :goto_1
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1341
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1342
    return-void

    .line 1330
    :cond_3
    if-ge p2, v1, :cond_4

    .line 1331
    const/16 v0, -0x3d

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1332
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1333
    return-void

    .line 1335
    :cond_4
    const/16 v0, -0x3c

    invoke-direct {p0, v0, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 1336
    return-void

    .line 1346
    :cond_5
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 1347
    return-void
.end method

.method private allocLocal()I
    .locals 3

    .line 1465
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    .line 1466
    .local v0, "localSlot":I
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    .line 1467
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsMaxLocals:I

    if-le v1, v2, :cond_0

    .line 1468
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    iput v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsMaxLocals:I

    .line 1470
    :cond_0
    return v0
.end method

.method private badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 229
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private fixLabelGotos()V
    .locals 7

    .line 1199
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTableTop:I

    if-ge v0, v1, :cond_1

    .line 1200
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTable:[J

    aget-wide v2, v1, v0

    .line 1201
    .local v2, "fixup":J
    const/16 v1, 0x20

    shr-long v4, v2, v1

    long-to-int v1, v4

    .line 1202
    .local v1, "label":I
    long-to-int v4, v2

    .line 1203
    .local v4, "jumpSource":I
    iget-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    aget v5, v5, v1

    .line 1204
    .local v5, "pc":I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    .line 1208
    invoke-direct {p0, v4, v5}, Lcom/trendmicro/hippo/CodeGenerator;->resolveGoto(II)V

    .line 1199
    .end local v1    # "label":I
    .end local v2    # "fixup":J
    .end local v4    # "jumpSource":I
    .end local v5    # "pc":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1206
    .restart local v1    # "label":I
    .restart local v2    # "fixup":J
    .restart local v4    # "jumpSource":I
    .restart local v5    # "pc":I
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 1210
    .end local v0    # "i":I
    .end local v1    # "label":I
    .end local v2    # "fixup":J
    .end local v4    # "jumpSource":I
    .end local v5    # "pc":I
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->fixupTableTop:I

    .line 1211
    return-void
.end method

.method private generateCallFunAndThis(Lcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "left"    # Lcom/trendmicro/hippo/Node;

    .line 980
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 981
    .local v0, "type":I
    const/4 v1, 0x1

    const/16 v2, 0x21

    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    const/16 v4, 0x24

    if-eq v0, v4, :cond_1

    const/16 v2, 0x27

    if-eq v0, v2, :cond_0

    .line 1008
    invoke-direct {p0, p1, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1010
    const/16 v2, -0x12

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1011
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 983
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 985
    .local v1, "name":Ljava/lang/String;
    const/16 v2, -0xf

    invoke-direct {p0, v2, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 986
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 987
    goto :goto_0

    .line 991
    .end local v1    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 992
    .local v4, "target":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 993
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 994
    .local v5, "id":Lcom/trendmicro/hippo/Node;
    if-ne v0, v2, :cond_2

    .line 995
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 997
    .local v2, "property":Ljava/lang/String;
    const/16 v3, -0x10

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 998
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 999
    .end local v2    # "property":Ljava/lang/String;
    goto :goto_0

    .line 1000
    :cond_2
    invoke-direct {p0, v5, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1002
    const/16 v1, -0x11

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1004
    nop

    .line 1014
    .end local v4    # "target":Lcom/trendmicro/hippo/Node;
    .end local v5    # "id":Lcom/trendmicro/hippo/Node;
    :goto_0
    return-void
.end method

.method private generateFunctionICode()V
    .locals 4

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsInFunctionFlag:Z

    .line 92
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 94
    .local v1, "theFunction":Lcom/trendmicro/hippo/ast/FunctionNode;
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v3

    iput v3, v2, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    .line 95
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v3

    iput-boolean v3, v2, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    .line 96
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 97
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/trendmicro/hippo/InterpreterData;->itsName:Ljava/lang/String;

    .line 99
    :cond_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 100
    const/16 v2, -0x3e

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 101
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBaseLineno()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    .line 103
    :cond_1
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isInStrictMode()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 104
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-boolean v0, v2, Lcom/trendmicro/hippo/InterpreterData;->isStrict:Z

    .line 107
    :cond_2
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->generateICodeFromTree(Lcom/trendmicro/hippo/Node;)V

    .line 108
    return-void
.end method

.method private generateICodeFromTree(Lcom/trendmicro/hippo/Node;)V
    .locals 6
    .param p1, "tree"    # Lcom/trendmicro/hippo/Node;

    .line 112
    invoke-direct {p0}, Lcom/trendmicro/hippo/CodeGenerator;->generateNestedFunctions()V

    .line 114
    invoke-direct {p0}, Lcom/trendmicro/hippo/CodeGenerator;->generateRegExpLiterals()V

    .line 116
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 117
    invoke-direct {p0}, Lcom/trendmicro/hippo/CodeGenerator;->fixLabelGotos()V

    .line 119
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsFunctionType:I

    if-nez v1, :cond_0

    .line 120
    const/16 v1, 0x41

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 123
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    array-length v1, v1

    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    if-eq v1, v2, :cond_1

    .line 126
    new-array v1, v2, [B

    .line 127
    .local v1, "tmp":[B
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    iget v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    invoke-static {v2, v0, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 130
    .end local v1    # "tmp":[B
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 131
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    goto :goto_1

    .line 133
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, v1, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    .line 134
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->strings:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap;->newIterator()Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    move-result-object v1

    .line 135
    .local v1, "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->start()V

    :goto_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->done()Z

    move-result v3

    if-nez v3, :cond_4

    .line 136
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 137
    .local v3, "str":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getValue()I

    move-result v4

    .line 138
    .local v4, "index":I
    iget-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    aget-object v5, v5, v4

    if-eqz v5, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 139
    :cond_3
    iget-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsStringTable:[Ljava/lang/String;

    aput-object v3, v5, v4

    .line 135
    .end local v3    # "str":Ljava/lang/String;
    .end local v4    # "index":I
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->next()V

    goto :goto_0

    .line 142
    .end local v1    # "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    :cond_4
    :goto_1
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->doubleTableTop:I

    if-nez v1, :cond_5

    .line 143
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    goto :goto_2

    .line 144
    :cond_5
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    array-length v1, v1

    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->doubleTableTop:I

    if-eq v1, v2, :cond_6

    .line 145
    new-array v1, v2, [D

    .line 146
    .local v1, "tmp":[D
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    iget v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->doubleTableTop:I

    invoke-static {v2, v0, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    .line 150
    .end local v1    # "tmp":[D
    :cond_6
    :goto_2
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->exceptionTableTop:I

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    array-length v1, v1

    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->exceptionTableTop:I

    if-eq v1, v2, :cond_7

    .line 153
    new-array v1, v2, [I

    .line 154
    .local v1, "tmp":[I
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    iget v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->exceptionTableTop:I

    invoke-static {v2, v0, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 156
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v0, Lcom/trendmicro/hippo/InterpreterData;->itsExceptionTable:[I

    .line 159
    .end local v1    # "tmp":[I
    :cond_7
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarCount()I

    move-result v1

    iput v1, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxVars:I

    .line 162
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v1, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxVars:I

    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsMaxLocals:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsMaxStack:I

    add-int/2addr v1, v2

    iput v1, v0, Lcom/trendmicro/hippo/InterpreterData;->itsMaxFrameArray:I

    .line 166
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarNames()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/InterpreterData;->argNames:[Ljava/lang/String;

    .line 167
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamAndVarConst()[Z

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/InterpreterData;->argIsConst:[Z

    .line 168
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getParamCount()I

    move-result v1

    iput v1, v0, Lcom/trendmicro/hippo/InterpreterData;->argCount:I

    .line 170
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSourceStart()I

    move-result v1

    iput v1, v0, Lcom/trendmicro/hippo/InterpreterData;->encodedSourceStart:I

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getEncodedSourceEnd()I

    move-result v1

    iput v1, v0, Lcom/trendmicro/hippo/InterpreterData;->encodedSourceEnd:I

    .line 173
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v0

    if-eqz v0, :cond_8

    .line 174
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->toArray()[Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/InterpreterData;->literalIds:[Ljava/lang/Object;

    .line 178
    :cond_8
    return-void
.end method

.method private generateNestedFunctions()V
    .locals 7

    .line 182
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 183
    .local v0, "functionCount":I
    if-nez v0, :cond_0

    return-void

    .line 185
    :cond_0
    new-array v1, v0, [Lcom/trendmicro/hippo/InterpreterData;

    .line 186
    .local v1, "array":[Lcom/trendmicro/hippo/InterpreterData;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_1

    .line 187
    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v3

    .line 188
    .local v3, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    new-instance v4, Lcom/trendmicro/hippo/CodeGenerator;

    invoke-direct {v4}, Lcom/trendmicro/hippo/CodeGenerator;-><init>()V

    .line 189
    .local v4, "gen":Lcom/trendmicro/hippo/CodeGenerator;
    iget-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    iput-object v5, v4, Lcom/trendmicro/hippo/CodeGenerator;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 190
    iput-object v3, v4, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 191
    new-instance v5, Lcom/trendmicro/hippo/InterpreterData;

    iget-object v6, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/InterpreterData;-><init>(Lcom/trendmicro/hippo/InterpreterData;)V

    iput-object v5, v4, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    .line 192
    invoke-direct {v4}, Lcom/trendmicro/hippo/CodeGenerator;->generateFunctionICode()V

    .line 193
    iget-object v5, v4, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    aput-object v5, v1, v2

    .line 186
    .end local v3    # "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    .end local v4    # "gen":Lcom/trendmicro/hippo/CodeGenerator;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 195
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsNestedFunctions:[Lcom/trendmicro/hippo/InterpreterData;

    .line 196
    return-void
.end method

.method private generateRegExpLiterals()V
    .locals 8

    .line 200
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpCount()I

    move-result v0

    .line 201
    .local v0, "N":I
    if-nez v0, :cond_0

    return-void

    .line 203
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 204
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->checkRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v2

    .line 205
    .local v2, "rep":Lcom/trendmicro/hippo/RegExpProxy;
    new-array v3, v0, [Ljava/lang/Object;

    .line 206
    .local v3, "array":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-eq v4, v0, :cond_1

    .line 207
    iget-object v5, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpString(I)Ljava/lang/String;

    move-result-object v5

    .line 208
    .local v5, "string":Ljava/lang/String;
    iget-object v6, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/ast/ScriptNode;->getRegexpFlags(I)Ljava/lang/String;

    move-result-object v6

    .line 209
    .local v6, "flags":Ljava/lang/String;
    invoke-interface {v2, v1, v5, v6}, Lcom/trendmicro/hippo/RegExpProxy;->compileRegExp(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v3, v4

    .line 206
    .end local v5    # "string":Ljava/lang/String;
    .end local v6    # "flags":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 211
    .end local v4    # "i":I
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v3, v4, Lcom/trendmicro/hippo/InterpreterData;->itsRegExpLiterals:[Ljava/lang/Object;

    .line 212
    return-void
.end method

.method private getDoubleIndex(D)I
    .locals 4
    .param p1, "num"    # D

    .line 1301
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->doubleTableTop:I

    .line 1302
    .local v0, "index":I
    if-nez v0, :cond_0

    .line 1303
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    const/16 v2, 0x40

    new-array v2, v2, [D

    iput-object v2, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    goto :goto_0

    .line 1304
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    array-length v1, v1

    if-ne v1, v0, :cond_1

    .line 1305
    mul-int/lit8 v1, v0, 0x2

    new-array v1, v1, [D

    .line 1306
    .local v1, "na":[D
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1307
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v1, v2, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    .line 1309
    .end local v1    # "na":[D
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsDoubleTable:[D

    aput-wide p1, v1, v0

    .line 1310
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->doubleTableTop:I

    .line 1311
    return v0
.end method

.method private getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 1134
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Node;

    .line 1135
    .local v0, "localBlock":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v1

    return v1
.end method

.method private getTargetLabel(Lcom/trendmicro/hippo/Node;)I
    .locals 5
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;

    .line 1140
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->labelId()I

    move-result v0

    .line 1141
    .local v0, "label":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1142
    return v0

    .line 1144
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTableTop:I

    .line 1145
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    if-eqz v2, :cond_1

    array-length v2, v2

    if-ne v0, v2, :cond_3

    .line 1146
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    if-nez v2, :cond_2

    .line 1147
    const/16 v2, 0x20

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    goto :goto_0

    .line 1149
    :cond_2
    array-length v3, v2

    mul-int/lit8 v3, v3, 0x2

    new-array v3, v3, [I

    .line 1150
    .local v3, "tmp":[I
    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1151
    iput-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    .line 1154
    .end local v3    # "tmp":[I
    :cond_3
    :goto_0
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTableTop:I

    .line 1155
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    aput v1, v2, v0

    .line 1157
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->labelId(I)V

    .line 1158
    return v0
.end method

.method private increaseICodeCapacity(I)[B
    .locals 5
    .param p1, "extraSize"    # I

    .line 1437
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v0, v0, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    array-length v0, v0

    .line 1438
    .local v0, "capacity":I
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 1439
    .local v1, "top":I
    add-int v2, v1, p1

    if-le v2, v0, :cond_1

    .line 1440
    mul-int/lit8 v0, v0, 0x2

    .line 1441
    add-int v2, v1, p1

    if-le v2, v0, :cond_0

    .line 1442
    add-int v0, v1, p1

    .line 1444
    :cond_0
    new-array v2, v0, [B

    .line 1445
    .local v2, "array":[B
    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v3, v3, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1446
    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput-object v2, v3, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1447
    return-object v2

    .line 1439
    .end local v2    # "array":[B
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method private markTargetLabel(Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;

    .line 1163
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 1164
    .local v0, "label":I
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    aget v1, v1, v0

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 1166
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1168
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    iget v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    aput v2, v1, v0

    .line 1169
    return-void
.end method

.method private releaseLocal(I)V
    .locals 1
    .param p1, "localSlot"    # I

    .line 1475
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->localTop:I

    .line 1476
    if-eq p1, v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1477
    :cond_0
    return-void
.end method

.method private resolveForwardGoto(I)V
    .locals 2
    .param p1, "fromPC"    # I

    .line 1225
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    add-int/lit8 v1, p1, 0x3

    if-lt v0, v1, :cond_0

    .line 1226
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/CodeGenerator;->resolveGoto(II)V

    .line 1227
    return-void

    .line 1225
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private resolveGoto(II)V
    .locals 5
    .param p1, "fromPC"    # I
    .param p2, "jumpPC"    # I

    .line 1231
    sub-int v0, p2, p1

    .line 1233
    .local v0, "offset":I
    if-ltz v0, :cond_1

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1234
    :cond_1
    :goto_0
    add-int/lit8 v1, p1, 0x1

    .line 1235
    .local v1, "offsetSite":I
    int-to-short v2, v0

    if-eq v0, v2, :cond_3

    .line 1236
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->longJumps:Lcom/trendmicro/hippo/UintMap;

    if-nez v2, :cond_2

    .line 1237
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    new-instance v3, Lcom/trendmicro/hippo/UintMap;

    invoke-direct {v3}, Lcom/trendmicro/hippo/UintMap;-><init>()V

    iput-object v3, v2, Lcom/trendmicro/hippo/InterpreterData;->longJumps:Lcom/trendmicro/hippo/UintMap;

    .line 1239
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->longJumps:Lcom/trendmicro/hippo/UintMap;

    invoke-virtual {v2, v1, p2}, Lcom/trendmicro/hippo/UintMap;->put(II)V

    .line 1240
    const/4 v0, 0x0

    .line 1242
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-object v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsICode:[B

    .line 1243
    .local v2, "array":[B
    shr-int/lit8 v3, v0, 0x8

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 1244
    add-int/lit8 v3, v1, 0x1

    int-to-byte v4, v0

    aput-byte v4, v2, v3

    .line 1245
    return-void
.end method

.method private stackChange(I)V
    .locals 2
    .param p1, "change"    # I

    .line 1452
    if-gtz p1, :cond_0

    .line 1453
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    goto :goto_0

    .line 1455
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    add-int/2addr v0, p1

    .line 1456
    .local v0, "newDepth":I
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v1, v1, Lcom/trendmicro/hippo/InterpreterData;->itsMaxStack:I

    if-le v0, v1, :cond_1

    .line 1457
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput v0, v1, Lcom/trendmicro/hippo/InterpreterData;->itsMaxStack:I

    .line 1459
    :cond_1
    iput v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    .line 1461
    .end local v0    # "newDepth":I
    :goto_0
    return-void
.end method

.method private updateLineNumber(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 216
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v0

    .line 217
    .local v0, "lineno":I
    iget v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->lineNumber:I

    if-eq v0, v1, :cond_1

    if-ltz v0, :cond_1

    .line 218
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v1, v1, Lcom/trendmicro/hippo/InterpreterData;->firstLinePC:I

    if-gez v1, :cond_0

    .line 219
    iget-object v1, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput v0, v1, Lcom/trendmicro/hippo/InterpreterData;->firstLinePC:I

    .line 221
    :cond_0
    iput v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->lineNumber:I

    .line 222
    const/16 v1, -0x1a

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 223
    const v1, 0xffff

    and-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    .line 225
    :cond_1
    return-void
.end method

.method private visitArrayComprehension(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "initStmt"    # Lcom/trendmicro/hippo/Node;
    .param p3, "expr"    # Lcom/trendmicro/hippo/Node;

    .line 1128
    iget v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    invoke-direct {p0, p2, v0}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 1129
    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1130
    return-void
.end method

.method private visitExpression(Lcom/trendmicro/hippo/Node;I)V
    .locals 16
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "contextFlags"    # I

    .line 501
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    .line 502
    .local v2, "type":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 503
    .local v3, "child":Lcom/trendmicro/hippo/Node;
    iget v4, v0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    .line 504
    .local v4, "savedStackDepth":I
    const/16 v5, 0x5a

    const/4 v6, -0x4

    const/4 v7, -0x1

    const/4 v8, 0x0

    if-eq v2, v5, :cond_22

    const/16 v5, 0x67

    const/4 v9, 0x7

    if-eq v2, v5, :cond_21

    const/16 v5, 0x6e

    const/4 v10, 0x4

    const/4 v11, 0x2

    const/4 v12, 0x1

    if-eq v2, v5, :cond_1e

    const/16 v5, -0x32

    const/16 v13, 0x7f

    if-eq v2, v13, :cond_1c

    const/16 v14, 0x8f

    if-eq v2, v14, :cond_1a

    const/16 v15, 0x93

    if-eq v2, v15, :cond_19

    const/16 v15, 0xa0

    if-eq v2, v15, :cond_18

    const v15, 0xffff

    packed-switch v2, :pswitch_data_0

    const/16 v10, 0x37

    packed-switch v2, :pswitch_data_1

    packed-switch v2, :pswitch_data_2

    packed-switch v2, :pswitch_data_3

    packed-switch v2, :pswitch_data_4

    packed-switch v2, :pswitch_data_5

    packed-switch v2, :pswitch_data_6

    .line 970
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 901
    :pswitch_0
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {v0, v1, v3, v5}, Lcom/trendmicro/hippo/CodeGenerator;->visitArrayComprehension(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 902
    goto/16 :goto_c

    .line 864
    :pswitch_1
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v5, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 865
    :cond_0
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/ScriptNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 866
    .local v5, "index":I
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 867
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 868
    const/16 v6, 0x9d

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addVarOp(II)V

    .line 870
    .end local v5    # "index":I
    goto/16 :goto_c

    .line 775
    :pswitch_2
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    .line 776
    .local v5, "name":Ljava/lang/String;
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 777
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 778
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 779
    const/16 v6, -0x3b

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 780
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 782
    .end local v5    # "name":Ljava/lang/String;
    goto/16 :goto_c

    .line 545
    :pswitch_3
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 546
    goto/16 :goto_c

    .line 786
    :pswitch_4
    const/4 v5, -0x1

    .line 789
    .local v5, "index":I
    iget-boolean v6, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsInFunctionFlag:Z

    if-eqz v6, :cond_1

    iget-object v6, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v6, v6, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-nez v6, :cond_1

    .line 790
    iget-object v6, v0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 791
    :cond_1
    if-ne v5, v7, :cond_2

    .line 792
    const/16 v6, -0xe

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 793
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    goto :goto_0

    .line 795
    :cond_2
    invoke-direct {v0, v10, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addVarOp(II)V

    .line 796
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 797
    const/16 v6, 0x20

    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 800
    .end local v5    # "index":I
    :goto_0
    goto/16 :goto_c

    .line 811
    :pswitch_5
    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitIncDec(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 812
    goto/16 :goto_c

    .line 599
    :pswitch_6
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 600
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 601
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 602
    iget v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 603
    .local v5, "afterSecondJumpStart":I
    const/16 v8, 0x6a

    if-ne v2, v8, :cond_3

    goto :goto_1

    :cond_3
    const/4 v9, 0x6

    :goto_1
    move v8, v9

    .line 604
    .local v8, "jump":I
    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addGotoOp(I)V

    .line 605
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 606
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 607
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 608
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 610
    and-int/lit8 v6, p2, 0x1

    invoke-direct {v0, v3, v6}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 611
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->resolveForwardGoto(I)V

    .line 613
    .end local v5    # "afterSecondJumpStart":I
    .end local v8    # "jump":I
    goto/16 :goto_c

    .line 914
    :pswitch_7
    const/16 v5, 0x10

    invoke-virtual {v1, v5, v8}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v5

    .line 916
    .local v5, "memberTypeFlags":I
    const/4 v6, 0x0

    .line 918
    .local v6, "childCount":I
    :cond_4
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 919
    add-int/2addr v6, v12

    .line 920
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 921
    if-nez v3, :cond_4

    .line 922
    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 923
    rsub-int/lit8 v7, v6, 0x1

    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 925
    .end local v5    # "memberTypeFlags":I
    .end local v6    # "childCount":I
    goto/16 :goto_c

    .line 943
    :pswitch_8
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 944
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 945
    goto/16 :goto_c

    .line 948
    :pswitch_9
    if-eqz v3, :cond_5

    .line 949
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    goto :goto_2

    .line 951
    :cond_5
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 952
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 954
    :goto_2
    const/16 v5, 0x49

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 955
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v5

    and-int/2addr v5, v15

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    .line 956
    goto/16 :goto_c

    .line 905
    :pswitch_a
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 906
    const/16 v5, 0x11

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 907
    goto/16 :goto_c

    .line 702
    :pswitch_b
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 703
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 704
    goto/16 :goto_c

    .line 897
    :pswitch_c
    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 898
    goto/16 :goto_c

    .line 883
    :pswitch_d
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 884
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 885
    goto/16 :goto_c

    .line 854
    :pswitch_e
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v5, :cond_6

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 855
    :cond_6
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/ast/ScriptNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 856
    .local v5, "index":I
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 857
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 858
    const/16 v6, 0x38

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addVarOp(II)V

    .line 860
    .end local v5    # "index":I
    goto/16 :goto_c

    .line 845
    :pswitch_f
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v5, :cond_7

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 846
    :cond_7
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 847
    .restart local v5    # "index":I
    invoke-direct {v0, v10, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addVarOp(II)V

    .line 848
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 850
    .end local v5    # "index":I
    goto/16 :goto_c

    .line 522
    :pswitch_10
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 523
    .local v5, "localIndex":I
    const/16 v6, 0x36

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 524
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 526
    .end local v5    # "localIndex":I
    goto/16 :goto_c

    .line 889
    :pswitch_11
    invoke-virtual {v1, v10}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v5

    .line 890
    .local v5, "index":I
    const/16 v6, 0x30

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 891
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 893
    .end local v5    # "index":I
    goto/16 :goto_c

    .line 877
    :pswitch_12
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 878
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 879
    goto/16 :goto_c

    .line 816
    :pswitch_13
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v5

    .line 817
    .local v5, "num":D
    double-to-int v7, v5

    .line 818
    .local v7, "inum":I
    int-to-double v8, v7

    cmpl-double v8, v8, v5

    if-nez v8, :cond_b

    .line 819
    if-nez v7, :cond_8

    .line 820
    const/16 v8, -0x33

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 822
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    div-double/2addr v8, v5

    const-wide/16 v10, 0x0

    cmpg-double v8, v8, v10

    if-gez v8, :cond_c

    .line 823
    const/16 v8, 0x1d

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    goto :goto_3

    .line 825
    :cond_8
    if-ne v7, v12, :cond_9

    .line 826
    const/16 v8, -0x34

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_3

    .line 827
    :cond_9
    int-to-short v8, v7

    if-ne v8, v7, :cond_a

    .line 828
    const/16 v8, -0x1b

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 830
    and-int v8, v7, v15

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    goto :goto_3

    .line 832
    :cond_a
    const/16 v8, -0x1c

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 833
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addInt(I)V

    goto :goto_3

    .line 836
    :cond_b
    invoke-direct {v0, v5, v6}, Lcom/trendmicro/hippo/CodeGenerator;->getDoubleIndex(D)I

    move-result v8

    .line 837
    .local v8, "index":I
    const/16 v9, 0x28

    invoke-direct {v0, v9, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 839
    .end local v8    # "index":I
    :cond_c
    :goto_3
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 841
    .end local v5    # "num":D
    .end local v7    # "inum":I
    goto/16 :goto_c

    .line 805
    :pswitch_14
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 806
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 807
    goto/16 :goto_c

    .line 728
    :pswitch_15
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 729
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 730
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 731
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 732
    const/16 v5, 0x8d

    const/4 v6, -0x2

    if-ne v2, v5, :cond_d

    .line 733
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 734
    invoke-direct {v0, v11}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 735
    const/16 v5, 0x24

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 736
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 738
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 740
    :cond_d
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 741
    const/16 v5, 0x25

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 742
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 743
    goto/16 :goto_c

    .line 709
    :pswitch_16
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 710
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 711
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    .line 712
    .local v5, "property":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 713
    const/16 v6, 0x8c

    if-ne v2, v6, :cond_e

    .line 714
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 715
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 716
    const/16 v6, 0x21

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 718
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 720
    :cond_e
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 721
    const/16 v6, 0x23

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 722
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 724
    .end local v5    # "property":Ljava/lang/String;
    goto/16 :goto_c

    .line 637
    :pswitch_17
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 638
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 639
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 640
    goto/16 :goto_c

    .line 643
    :pswitch_18
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v6, 0x31

    if-ne v5, v6, :cond_f

    goto :goto_4

    :cond_f
    move v12, v8

    :goto_4
    move v5, v12

    .line 644
    .local v5, "isName":Z
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 645
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 646
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 647
    if-eqz v5, :cond_10

    .line 649
    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_5

    .line 651
    :cond_10
    const/16 v6, 0x1f

    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 653
    :goto_5
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 654
    goto/16 :goto_c

    .line 552
    .end local v5    # "isName":Z
    :pswitch_19
    const/16 v5, 0x1e

    if-ne v2, v5, :cond_11

    .line 553
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    goto :goto_6

    .line 555
    :cond_11
    invoke-direct {v0, v3}, Lcom/trendmicro/hippo/CodeGenerator;->generateCallFunAndThis(Lcom/trendmicro/hippo/Node;)V

    .line 557
    :goto_6
    const/4 v6, 0x0

    .line 558
    .local v6, "argCount":I
    :goto_7
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    move-object v3, v7

    if-eqz v7, :cond_12

    .line 559
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 560
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 562
    :cond_12
    const/16 v7, 0xa

    invoke-virtual {v1, v7, v8}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v7

    .line 564
    .local v7, "callType":I
    const/16 v9, 0x47

    if-eq v2, v9, :cond_14

    if-eqz v7, :cond_14

    .line 566
    const/16 v9, -0x15

    invoke-direct {v0, v9, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 567
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 568
    if-ne v2, v5, :cond_13

    move v8, v12

    :cond_13
    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 569
    iget v8, v0, Lcom/trendmicro/hippo/CodeGenerator;->lineNumber:I

    and-int/2addr v8, v15

    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    goto :goto_8

    .line 574
    :cond_14
    const/16 v8, 0x26

    if-ne v2, v8, :cond_15

    and-int/lit8 v8, p2, 0x1

    if-eqz v8, :cond_15

    iget-object v8, v0, Lcom/trendmicro/hippo/CodeGenerator;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 575
    invoke-virtual {v8}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGenerateDebugInfo()Z

    move-result v8

    if-nez v8, :cond_15

    iget-boolean v8, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsInTryFlag:Z

    if-nez v8, :cond_15

    .line 577
    const/16 v2, -0x37

    .line 579
    :cond_15
    invoke-direct {v0, v2, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 582
    :goto_8
    if-ne v2, v5, :cond_16

    .line 584
    neg-int v5, v6

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    goto :goto_9

    .line 588
    :cond_16
    rsub-int/lit8 v5, v6, -0x1

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 590
    :goto_9
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget v5, v5, Lcom/trendmicro/hippo/InterpreterData;->itsMaxCalleeArgs:I

    if-le v6, v5, :cond_17

    .line 591
    iget-object v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iput v6, v5, Lcom/trendmicro/hippo/InterpreterData;->itsMaxCalleeArgs:I

    .line 594
    .end local v6    # "argCount":I
    .end local v7    # "callType":I
    :cond_17
    goto/16 :goto_c

    .line 678
    :pswitch_1a
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 679
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 680
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 681
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 682
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 683
    goto/16 :goto_c

    .line 764
    :pswitch_1b
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    .line 765
    .local v5, "name":Ljava/lang/String;
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 766
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 767
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 768
    invoke-direct {v0, v2, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 769
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 771
    .end local v5    # "name":Ljava/lang/String;
    goto/16 :goto_c

    .line 959
    :cond_18
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 960
    .local v5, "enterWith":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 961
    .local v6, "with":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v9

    invoke-direct {v0, v9, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 962
    invoke-direct {v0, v11}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 963
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 964
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {v0, v7, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 965
    const/4 v7, 0x3

    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 966
    goto/16 :goto_c

    .line 930
    .end local v5    # "enterWith":Lcom/trendmicro/hippo/Node;
    .end local v6    # "with":Lcom/trendmicro/hippo/Node;
    :cond_19
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 931
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 932
    const/16 v5, -0x35

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 933
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 934
    iget v5, v0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 935
    .local v5, "queryPC":I
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    invoke-direct {v0, v6, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 936
    const/16 v6, -0x36

    invoke-direct {v0, v6, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addBackwardGoto(II)V

    .line 938
    .end local v5    # "queryPC":I
    goto/16 :goto_c

    .line 747
    :cond_1a
    :pswitch_1c
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 748
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 749
    if-ne v2, v14, :cond_1b

    .line 750
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 751
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 752
    const/16 v5, 0x44

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 754
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 756
    :cond_1b
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 757
    const/16 v5, 0x45

    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 758
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 759
    goto/16 :goto_c

    .line 691
    :cond_1c
    :pswitch_1d
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 692
    if-ne v2, v13, :cond_1d

    .line 693
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 694
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_c

    .line 696
    :cond_1d
    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 698
    goto :goto_c

    .line 508
    :cond_1e
    invoke-virtual {v1, v12}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v5

    .line 509
    .local v5, "fnIndex":I
    iget-object v6, v0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v6, v5}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v6

    .line 511
    .local v6, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v7

    if-eq v7, v11, :cond_20

    .line 512
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v7

    if-ne v7, v10, :cond_1f

    goto :goto_a

    .line 513
    :cond_1f
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 515
    :cond_20
    :goto_a
    const/16 v7, -0x13

    invoke-direct {v0, v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 516
    invoke-direct {v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 518
    .end local v5    # "fnIndex":I
    .end local v6    # "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    goto :goto_c

    .line 617
    :cond_21
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 618
    .local v5, "ifThen":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 619
    .local v6, "ifElse":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 620
    iget v8, v0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 621
    .local v8, "elseJumpStart":I
    invoke-direct {v0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->addGotoOp(I)V

    .line 622
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 624
    and-int/lit8 v7, p2, 0x1

    invoke-direct {v0, v5, v7}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 625
    iget v7, v0, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 626
    .local v7, "afterElseJumpStart":I
    const/4 v9, 0x5

    invoke-direct {v0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->addGotoOp(I)V

    .line 627
    invoke-direct {v0, v8}, Lcom/trendmicro/hippo/CodeGenerator;->resolveForwardGoto(I)V

    .line 628
    iput v4, v0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    .line 630
    and-int/lit8 v9, p2, 0x1

    invoke-direct {v0, v6, v9}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 631
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->resolveForwardGoto(I)V

    .line 633
    .end local v5    # "ifThen":Lcom/trendmicro/hippo/Node;
    .end local v6    # "ifElse":Lcom/trendmicro/hippo/Node;
    .end local v7    # "afterElseJumpStart":I
    .end local v8    # "elseJumpStart":I
    goto :goto_c

    .line 530
    :cond_22
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 531
    .local v5, "lastChild":Lcom/trendmicro/hippo/Node;
    :goto_b
    if-eq v3, v5, :cond_23

    .line 532
    invoke-direct {v0, v3, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 533
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 534
    invoke-direct {v0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 535
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    goto :goto_b

    .line 538
    :cond_23
    and-int/lit8 v6, p2, 0x1

    invoke-direct {v0, v3, v6}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 540
    .end local v5    # "lastChild":Lcom/trendmicro/hippo/Node;
    nop

    .line 972
    :goto_c
    add-int/lit8 v5, v4, 0x1

    iget v6, v0, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    if-eq v5, v6, :cond_24

    .line 973
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 975
    :cond_24
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_1b
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_19
        :pswitch_18
        :pswitch_1d
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_1a
        :pswitch_15
        :pswitch_19
        :pswitch_14
        :pswitch_13
        :pswitch_14
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_1a
        :pswitch_1a
        :pswitch_11
        :pswitch_14
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x34
        :pswitch_1a
        :pswitch_1a
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3e
        :pswitch_d
        :pswitch_d
        :pswitch_12
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x42
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_1c
        :pswitch_b
        :pswitch_19
        :pswitch_a
        :pswitch_9
        :pswitch_1b
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x69
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x8a
        :pswitch_4
        :pswitch_3
        :pswitch_16
        :pswitch_15
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x9c
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private visitIncDec(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 5
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 1019
    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v0

    .line 1020
    .local v0, "incrDecrMask":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 1021
    .local v1, "childType":I
    const/16 v2, 0x21

    const/4 v3, 0x0

    if-eq v1, v2, :cond_5

    const/16 v2, 0x24

    if-eq v1, v2, :cond_4

    const/16 v2, 0x27

    const/4 v4, 0x1

    if-eq v1, v2, :cond_3

    const/16 v2, 0x37

    if-eq v1, v2, :cond_1

    const/16 v2, 0x44

    if-ne v1, v2, :cond_0

    .line 1056
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1057
    .local v2, "ref":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1058
    const/16 v3, -0xb

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1059
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1060
    goto :goto_0

    .line 1063
    .end local v2    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1023
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    iget-boolean v2, v2, Lcom/trendmicro/hippo/InterpreterData;->itsNeedsActivation:Z

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1024
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v2, p2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 1025
    .local v2, "i":I
    const/4 v3, -0x7

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addVarOp(II)V

    .line 1026
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1027
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1028
    goto :goto_0

    .line 1031
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    .line 1032
    .local v2, "name":Ljava/lang/String;
    const/4 v3, -0x8

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 1033
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1034
    invoke-direct {p0, v4}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1035
    goto :goto_0

    .line 1046
    .end local v2    # "name":Ljava/lang/String;
    :cond_4
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1047
    .local v2, "object":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1048
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1049
    .local v4, "index":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1050
    const/16 v3, -0xa

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1051
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1052
    const/4 v3, -0x1

    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1053
    goto :goto_0

    .line 1038
    .end local v2    # "object":Lcom/trendmicro/hippo/Node;
    .end local v4    # "index":Lcom/trendmicro/hippo/Node;
    :cond_5
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1039
    .restart local v2    # "object":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1040
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    .line 1041
    .local v3, "property":Ljava/lang/String;
    const/16 v4, -0x9

    invoke-direct {p0, v4, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addStringOp(ILjava/lang/String;)V

    .line 1042
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 1043
    nop

    .line 1066
    .end local v2    # "object":Lcom/trendmicro/hippo/Node;
    .end local v3    # "property":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method private visitLiteral(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 10
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 1070
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 1072
    .local v0, "type":I
    const/4 v1, 0x0

    .line 1073
    .local v1, "propertyIds":[Ljava/lang/Object;
    const/16 v2, 0x43

    const/16 v3, 0x42

    if-ne v0, v3, :cond_1

    .line 1074
    const/4 v4, 0x0

    .line 1075
    .local v4, "count":I
    move-object v5, p2

    .local v5, "n":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v5, :cond_0

    .line 1076
    add-int/lit8 v4, v4, 0x1

    .line 1075
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    goto :goto_0

    .end local v5    # "n":Lcom/trendmicro/hippo/Node;
    :cond_0
    goto :goto_1

    .line 1078
    .end local v4    # "count":I
    :cond_1
    if-ne v0, v2, :cond_8

    .line 1079
    const/16 v4, 0xc

    invoke-virtual {p1, v4}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    check-cast v1, [Ljava/lang/Object;

    .line 1080
    array-length v4, v1

    .line 1084
    .restart local v4    # "count":I
    :goto_1
    const/16 v5, -0x1d

    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 1085
    const/4 v5, 0x2

    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1086
    :goto_2
    const/4 v5, -0x1

    if-eqz p2, :cond_5

    .line 1087
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    .line 1088
    .local v6, "childType":I
    const/16 v7, 0x98

    const/4 v8, 0x0

    if-ne v6, v7, :cond_2

    .line 1089
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1090
    const/16 v7, -0x39

    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_3

    .line 1091
    :cond_2
    const/16 v7, 0x99

    if-ne v6, v7, :cond_3

    .line 1092
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1093
    const/16 v7, -0x3a

    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_3

    .line 1094
    :cond_3
    const/16 v7, 0xa4

    const/16 v9, -0x1e

    if-ne v6, v7, :cond_4

    .line 1095
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {p0, v7, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1096
    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    goto :goto_3

    .line 1098
    :cond_4
    invoke-direct {p0, p2, v8}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 1099
    invoke-direct {p0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 1101
    :goto_3
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1102
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object p2

    .line 1103
    .end local v6    # "childType":I
    goto :goto_2

    .line 1104
    :cond_5
    if-ne v0, v3, :cond_7

    .line 1105
    const/16 v2, 0xb

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 1106
    .local v2, "skipIndexes":[I
    if-nez v2, :cond_6

    .line 1107
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    goto :goto_4

    .line 1109
    :cond_6
    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v3

    .line 1110
    .local v3, "index":I
    iget-object v6, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6, v2}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 1111
    const/16 v6, -0x1f

    invoke-direct {p0, v6, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 1113
    .end local v2    # "skipIndexes":[I
    .end local v3    # "index":I
    :goto_4
    goto :goto_5

    .line 1114
    :cond_7
    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v3

    .line 1115
    .restart local v3    # "index":I
    iget-object v6, p0, Lcom/trendmicro/hippo/CodeGenerator;->literalIds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 1116
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 1118
    .end local v3    # "index":I
    :goto_5
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 1119
    return-void

    .line 1082
    .end local v4    # "count":I
    :cond_8
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/CodeGenerator;->badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2
.end method

.method private visitStatement(Lcom/trendmicro/hippo/Node;I)V
    .locals 21
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "initialStackDepth"    # I

    .line 234
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move/from16 v9, p2

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v10

    .line 235
    .local v10, "type":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 236
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    const/16 v1, -0x3e

    if-eq v10, v1, :cond_18

    const/16 v1, 0x41

    if-eq v10, v1, :cond_17

    const/16 v1, 0x52

    const/16 v11, -0x38

    const/4 v2, 0x1

    if-eq v10, v1, :cond_13

    const/16 v1, 0x6e

    const/4 v3, -0x5

    const/4 v4, 0x3

    const/4 v5, -0x1

    if-eq v10, v1, :cond_f

    const/16 v1, 0x73

    const/4 v6, -0x4

    const/4 v12, 0x0

    if-eq v10, v1, :cond_c

    const/16 v1, 0x7c

    if-eq v10, v1, :cond_b

    const/16 v1, 0x7e

    if-eq v10, v1, :cond_9

    const/16 v1, 0x8e

    const/4 v13, 0x2

    if-eq v10, v1, :cond_7

    const/16 v1, 0xa1

    if-eq v10, v1, :cond_6

    const v1, 0xffff

    const/16 v11, 0x32

    if-eq v10, v11, :cond_5

    const/16 v11, 0x33

    if-eq v10, v11, :cond_4

    packed-switch v10, :pswitch_data_0

    packed-switch v10, :pswitch_data_1

    packed-switch v10, :pswitch_data_2

    .line 491
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 363
    :pswitch_0
    move-object v1, v8

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v1, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 364
    .local v1, "target":Lcom/trendmicro/hippo/Node;
    const/16 v2, -0x17

    invoke-direct {v7, v1, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 366
    .end local v1    # "target":Lcom/trendmicro/hippo/Node;
    goto/16 :goto_9

    .line 385
    :pswitch_1
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 386
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 387
    const/16 v1, 0x86

    if-ne v10, v1, :cond_0

    move v3, v6

    :cond_0
    invoke-direct {v7, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 388
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 389
    goto/16 :goto_9

    .line 341
    :pswitch_2
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->markTargetLabel(Lcom/trendmicro/hippo/Node;)V

    .line 342
    goto/16 :goto_9

    .line 482
    :pswitch_3
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 483
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    invoke-direct {v7, v10, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 484
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 485
    goto/16 :goto_9

    .line 432
    :pswitch_4
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    .line 433
    .local v1, "localIndex":I
    const/16 v3, 0xe

    invoke-virtual {v8, v3}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v3

    .line 434
    .local v3, "scopeIndex":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v4

    .line 435
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 436
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 437
    invoke-direct {v7, v4}, Lcom/trendmicro/hippo/CodeGenerator;->addStringPrefix(Ljava/lang/String;)V

    .line 438
    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexPrefix(I)V

    .line 439
    const/16 v6, 0x39

    invoke-direct {v7, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 440
    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v2, v12

    :goto_0
    invoke-direct {v7, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addUint8(I)V

    .line 441
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 443
    .end local v1    # "localIndex":I
    .end local v3    # "scopeIndex":I
    .end local v4    # "name":Ljava/lang/String;
    goto/16 :goto_9

    .line 347
    :pswitch_5
    move-object v1, v8

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v1, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 348
    .local v1, "target":Lcom/trendmicro/hippo/Node;
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 349
    invoke-direct {v7, v1, v10}, Lcom/trendmicro/hippo/CodeGenerator;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 350
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 352
    .end local v1    # "target":Lcom/trendmicro/hippo/Node;
    goto/16 :goto_9

    .line 356
    :pswitch_6
    move-object v1, v8

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v1, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 357
    .restart local v1    # "target":Lcom/trendmicro/hippo/Node;
    invoke-direct {v7, v1, v10}, Lcom/trendmicro/hippo/CodeGenerator;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 359
    .end local v1    # "target":Lcom/trendmicro/hippo/Node;
    goto/16 :goto_9

    .line 459
    :pswitch_7
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 460
    const/16 v3, 0x14

    invoke-virtual {v8, v3, v12}, Lcom/trendmicro/hippo/Node;->getIntProp(II)I

    move-result v3

    if-eqz v3, :cond_2

    .line 462
    const/16 v2, -0x3f

    invoke-direct {v7, v2}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 463
    iget v2, v7, Lcom/trendmicro/hippo/CodeGenerator;->lineNumber:I

    and-int/2addr v1, v2

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    goto/16 :goto_9

    .line 464
    :cond_2
    if-eqz v0, :cond_3

    .line 465
    invoke-direct {v7, v0, v2}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 466
    const/4 v1, 0x4

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 467
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    goto/16 :goto_9

    .line 469
    :cond_3
    const/16 v1, -0x16

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 471
    goto/16 :goto_9

    .line 291
    :pswitch_8
    invoke-direct {v7, v4}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 292
    goto/16 :goto_9

    .line 285
    :pswitch_9
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 286
    invoke-direct {v7, v13}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 287
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 288
    goto/16 :goto_9

    .line 454
    :cond_4
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 455
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    invoke-direct {v7, v11, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 456
    goto/16 :goto_9

    .line 446
    :cond_5
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 447
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 448
    invoke-direct {v7, v11}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 449
    iget v2, v7, Lcom/trendmicro/hippo/CodeGenerator;->lineNumber:I

    and-int/2addr v1, v2

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addUint16(I)V

    .line 450
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 451
    goto/16 :goto_9

    .line 309
    :cond_6
    const/16 v1, -0x40

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 310
    goto/16 :goto_9

    .line 296
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/CodeGenerator;->allocLocal()I

    move-result v1

    .line 297
    .local v1, "local":I
    invoke-virtual {v8, v13, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 298
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 299
    :goto_1
    if-eqz v0, :cond_8

    .line 300
    invoke-direct {v7, v0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 301
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    goto :goto_1

    .line 303
    :cond_8
    invoke-direct {v7, v11, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 304
    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->releaseLocal(I)V

    .line 306
    .end local v1    # "local":I
    goto/16 :goto_9

    .line 371
    :cond_9
    invoke-direct {v7, v2}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 372
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    .line 373
    .local v1, "finallyRegister":I
    const/16 v2, -0x18

    invoke-direct {v7, v2, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 374
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 375
    :goto_2
    if-eqz v0, :cond_a

    .line 376
    invoke-direct {v7, v0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 377
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    goto :goto_2

    .line 379
    :cond_a
    const/16 v2, -0x19

    invoke-direct {v7, v2, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 381
    .end local v1    # "finallyRegister":I
    goto/16 :goto_9

    .line 275
    :cond_b
    :pswitch_a
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 278
    :goto_3
    :pswitch_b
    if-eqz v0, :cond_19

    .line 279
    invoke-direct {v7, v0, v9}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 280
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    goto :goto_3

    .line 313
    :cond_c
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 317
    invoke-direct {v7, v0, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 318
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    .line 319
    .local v1, "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    :goto_4
    if-eqz v1, :cond_e

    .line 322
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getType()I

    move-result v3

    const/16 v4, 0x74

    if-ne v3, v4, :cond_d

    .line 324
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 325
    .local v3, "test":Lcom/trendmicro/hippo/Node;
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 326
    invoke-direct {v7, v2}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 327
    invoke-direct {v7, v3, v12}, Lcom/trendmicro/hippo/CodeGenerator;->visitExpression(Lcom/trendmicro/hippo/Node;I)V

    .line 328
    const/16 v4, 0x2e

    invoke-direct {v7, v4}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 329
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 332
    iget-object v4, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    const/4 v11, -0x6

    invoke-direct {v7, v4, v11}, Lcom/trendmicro/hippo/CodeGenerator;->addGoto(Lcom/trendmicro/hippo/Node;I)V

    .line 333
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 320
    .end local v3    # "test":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    move-object v1, v3

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    goto :goto_4

    .line 323
    :cond_d
    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->badTree(Lcom/trendmicro/hippo/Node;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 335
    .end local v1    # "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    :cond_e
    invoke-direct {v7, v6}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 336
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 338
    goto/16 :goto_9

    .line 240
    :cond_f
    invoke-virtual {v8, v2}, Lcom/trendmicro/hippo/Node;->getExistingIntProp(I)I

    move-result v1

    .line 241
    .local v1, "fnIndex":I
    iget-object v6, v7, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v6

    .line 242
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v6

    .line 249
    .local v6, "fnType":I
    if-ne v6, v4, :cond_10

    .line 250
    const/16 v4, -0x14

    invoke-direct {v7, v4, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    goto :goto_5

    .line 252
    :cond_10
    if-ne v6, v2, :cond_12

    .line 261
    :goto_5
    iget-boolean v4, v7, Lcom/trendmicro/hippo/CodeGenerator;->itsInFunctionFlag:Z

    if-nez v4, :cond_11

    .line 262
    const/16 v4, -0x13

    invoke-direct {v7, v4, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 263
    invoke-direct {v7, v2}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 264
    invoke-direct {v7, v3}, Lcom/trendmicro/hippo/CodeGenerator;->addIcode(I)V

    .line 265
    invoke-direct {v7, v5}, Lcom/trendmicro/hippo/CodeGenerator;->stackChange(I)V

    .line 268
    .end local v1    # "fnIndex":I
    .end local v6    # "fnType":I
    :cond_11
    goto/16 :goto_9

    .line 253
    .restart local v1    # "fnIndex":I
    .restart local v6    # "fnType":I
    :cond_12
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 393
    .end local v1    # "fnIndex":I
    .end local v6    # "fnType":I
    :cond_13
    move-object v12, v8

    check-cast v12, Lcom/trendmicro/hippo/ast/Jump;

    .line 394
    .local v12, "tryNode":Lcom/trendmicro/hippo/ast/Jump;
    invoke-direct {v7, v12}, Lcom/trendmicro/hippo/CodeGenerator;->getLocalBlockRef(Lcom/trendmicro/hippo/Node;)I

    move-result v13

    .line 395
    .local v13, "exceptionObjectLocal":I
    invoke-direct/range {p0 .. p0}, Lcom/trendmicro/hippo/CodeGenerator;->allocLocal()I

    move-result v14

    .line 397
    .local v14, "scopeLocal":I
    const/16 v1, -0xd

    invoke-direct {v7, v1, v14}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 399
    iget v15, v7, Lcom/trendmicro/hippo/CodeGenerator;->iCodeTop:I

    .line 400
    .local v15, "tryStart":I
    iget-boolean v6, v7, Lcom/trendmicro/hippo/CodeGenerator;->itsInTryFlag:Z

    .line 401
    .local v6, "savedFlag":Z
    iput-boolean v2, v7, Lcom/trendmicro/hippo/CodeGenerator;->itsInTryFlag:Z

    move-object v5, v0

    .line 402
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .local v5, "child":Lcom/trendmicro/hippo/Node;
    :goto_6
    if-eqz v5, :cond_14

    .line 403
    invoke-direct {v7, v5, v9}, Lcom/trendmicro/hippo/CodeGenerator;->visitStatement(Lcom/trendmicro/hippo/Node;I)V

    .line 404
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    goto :goto_6

    .line 406
    :cond_14
    iput-boolean v6, v7, Lcom/trendmicro/hippo/CodeGenerator;->itsInTryFlag:Z

    .line 408
    iget-object v4, v12, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 409
    .local v4, "catchTarget":Lcom/trendmicro/hippo/Node;
    if-eqz v4, :cond_15

    .line 410
    iget-object v0, v7, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    .line 411
    invoke-direct {v7, v4}, Lcom/trendmicro/hippo/CodeGenerator;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    aget v16, v0, v1

    .line 412
    .local v16, "catchStartPC":I
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move v1, v15

    move/from16 v2, v16

    move/from16 v3, v16

    move-object/from16 v18, v4

    .end local v4    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .local v18, "catchTarget":Lcom/trendmicro/hippo/Node;
    move/from16 v4, v17

    move-object/from16 v17, v5

    .end local v5    # "child":Lcom/trendmicro/hippo/Node;
    .local v17, "child":Lcom/trendmicro/hippo/Node;
    move v5, v13

    move/from16 v19, v6

    .end local v6    # "savedFlag":Z
    .local v19, "savedFlag":Z
    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/CodeGenerator;->addExceptionHandler(IIIZII)V

    goto :goto_7

    .line 409
    .end local v16    # "catchStartPC":I
    .end local v17    # "child":Lcom/trendmicro/hippo/Node;
    .end local v18    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .end local v19    # "savedFlag":Z
    .restart local v4    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .restart local v5    # "child":Lcom/trendmicro/hippo/Node;
    .restart local v6    # "savedFlag":Z
    :cond_15
    move-object/from16 v18, v4

    move-object/from16 v17, v5

    move/from16 v19, v6

    .line 416
    .end local v4    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .end local v5    # "child":Lcom/trendmicro/hippo/Node;
    .end local v6    # "savedFlag":Z
    .restart local v17    # "child":Lcom/trendmicro/hippo/Node;
    .restart local v18    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .restart local v19    # "savedFlag":Z
    :goto_7
    invoke-virtual {v12}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 417
    .local v6, "finallyTarget":Lcom/trendmicro/hippo/Node;
    if-eqz v6, :cond_16

    .line 418
    iget-object v0, v7, Lcom/trendmicro/hippo/CodeGenerator;->labelTable:[I

    .line 419
    invoke-direct {v7, v6}, Lcom/trendmicro/hippo/CodeGenerator;->getTargetLabel(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    aget v16, v0, v1

    .line 420
    .local v16, "finallyStartPC":I
    const/4 v4, 0x1

    move-object/from16 v0, p0

    move v1, v15

    move/from16 v2, v16

    move/from16 v3, v16

    move v5, v13

    move-object/from16 v20, v6

    .end local v6    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    .local v20, "finallyTarget":Lcom/trendmicro/hippo/Node;
    move v6, v14

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/CodeGenerator;->addExceptionHandler(IIIZII)V

    goto :goto_8

    .line 417
    .end local v16    # "finallyStartPC":I
    .end local v20    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    .restart local v6    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    :cond_16
    move-object/from16 v20, v6

    .line 425
    .end local v6    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    .restart local v20    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    :goto_8
    invoke-direct {v7, v11, v14}, Lcom/trendmicro/hippo/CodeGenerator;->addIndexOp(II)V

    .line 426
    invoke-direct {v7, v14}, Lcom/trendmicro/hippo/CodeGenerator;->releaseLocal(I)V

    .line 428
    .end local v12    # "tryNode":Lcom/trendmicro/hippo/ast/Jump;
    .end local v13    # "exceptionObjectLocal":I
    .end local v14    # "scopeLocal":I
    .end local v15    # "tryStart":I
    .end local v18    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .end local v19    # "savedFlag":Z
    .end local v20    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    move-object/from16 v0, v17

    goto :goto_9

    .line 474
    .end local v17    # "child":Lcom/trendmicro/hippo/Node;
    .restart local v0    # "child":Lcom/trendmicro/hippo/Node;
    :cond_17
    invoke-direct/range {p0 .. p1}, Lcom/trendmicro/hippo/CodeGenerator;->updateLineNumber(Lcom/trendmicro/hippo/Node;)V

    .line 475
    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/CodeGenerator;->addToken(I)V

    .line 476
    goto :goto_9

    .line 488
    :cond_18
    nop

    .line 494
    :cond_19
    :goto_9
    iget v1, v7, Lcom/trendmicro/hippo/CodeGenerator;->stackDepth:I

    if-ne v1, v9, :cond_1a

    .line 497
    return-void

    .line 495
    :cond_1a
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x39
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x81
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_2
        :pswitch_a
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_b
    .end packed-switch
.end method


# virtual methods
.method public compile(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ast/ScriptNode;Ljava/lang/String;Z)Lcom/trendmicro/hippo/InterpreterData;
    .locals 4
    .param p1, "compilerEnv"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .line 54
    iput-object p1, p0, Lcom/trendmicro/hippo/CodeGenerator;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 61
    new-instance v0, Lcom/trendmicro/hippo/NodeTransformer;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NodeTransformer;-><init>()V

    invoke-virtual {v0, p2, p1}, Lcom/trendmicro/hippo/NodeTransformer;->transform(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 68
    if-eqz p4, :cond_0

    .line 69
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    goto :goto_0

    .line 71
    :cond_0
    iput-object p2, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 74
    :goto_0
    new-instance v0, Lcom/trendmicro/hippo/InterpreterData;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    iget-object v2, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 75
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getSourceName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 77
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ScriptNode;->isInStrictMode()Z

    move-result v3

    invoke-direct {v0, v1, v2, p3, v3}, Lcom/trendmicro/hippo/InterpreterData;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    .line 78
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/trendmicro/hippo/InterpreterData;->topLevel:Z

    .line 80
    if-eqz p4, :cond_1

    .line 81
    invoke-direct {p0}, Lcom/trendmicro/hippo/CodeGenerator;->generateFunctionICode()V

    goto :goto_1

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->scriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/CodeGenerator;->generateICodeFromTree(Lcom/trendmicro/hippo/Node;)V

    .line 85
    :goto_1
    iget-object v0, p0, Lcom/trendmicro/hippo/CodeGenerator;->itsData:Lcom/trendmicro/hippo/InterpreterData;

    return-object v0
.end method
