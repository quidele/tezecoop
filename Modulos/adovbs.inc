Attribute VB_Name = "adovbs"
'--------------------------------------------------------------------
' Microsoft ADO
'
' Copyright (c) 1996-1998 Microsoft Corporation.
'
'
'
' ADO constants include file for VBScript
'
'--------------------------------------------------------------------

'---- CursorTypeEnum Values ----
Public Const adOpenForwardOnly = 0
Public Const adOpenKeyset = 1
Public Const adOpenDynamic = 2
Public Const adOpenStatic = 3

'---- CursorOptionEnum Values ----
Public Const adHoldRecords = &H100
Public Const adMovePrevious = &H200
Public Const adAddNew = &H1000400
Public Const adDelete = &H1000800
Public Const adUpdate = &H1008000
Public Const adBookmark = &H2000
Public Const adApproxPosition = &H4000
Public Const adUpdateBatch = &H10000
Public Const adResync = &H20000
Public Const adNotify = &H40000
Public Const adFind = &H80000
Public Const adSeek = &H400000
Public Const adIndex = &H800000

'---- LockTypeEnum Values ----
Public Const adLockReadOnly = 1
Public Const adLockPessimistic = 2
Public Const adLockOptimistic = 3
Public Const adLockBatchOptimistic = 4

'---- ExecuteOptionEnum Values ----
Public Const adAsyncExecute = &H10
Public Const adAsyncFetch = &H20
Public Const adAsyncFetchNonBlocking = &H40
Public Const adExecuteNoRecords = &H80
Public Const adExecuteStream = &H400

'---- ConnectOptionEnum Values ----
Public Const adAsyncConnect = &H10

'---- ObjectStateEnum Values ----
Public Const adStateClosed = &H0
Public Const adStateOpen = &H1
Public Const adStateConnecting = &H2
Public Const adStateExecuting = &H4
Public Const adStateFetching = &H8

'---- CursorLocationEnum Values ----
Public Const adUseServer = 2
Public Const adUseClient = 3

'---- DataTypeEnum Values ----
Public Const adEmpty = 0
Public Const adTinyInt = 16
Public Const adSmallInt = 2
Public Const adInteger = 3
Public Const adBigInt = 20
Public Const adUnsignedTinyInt = 17
Public Const adUnsignedSmallInt = 18
Public Const adUnsignedInt = 19
Public Const adUnsignedBigInt = 21
Public Const adSingle = 4
Public Const adDouble = 5
Public Const adCurrency = 6
Public Const adDecimal = 14
Public Const adNumeric = 131
Public Const adBoolean = 11
Public Const adError = 10
Public Const adUserDefined = 132
Public Const adVariant = 12
Public Const adIDispatch = 9
Public Const adIUnknown = 13
Public Const adGUID = 72
Public Const adDate = 7
Public Const adDBDate = 133
Public Const adDBTime = 134
Public Const adDBTimeStamp = 135
Public Const adBSTR = 8
Public Const adChar = 129
Public Const adVarChar = 200
Public Const adLongVarChar = 201
Public Const adWChar = 130
Public Const adVarWChar = 202
Public Const adLongVarWChar = 203
Public Const adBinary = 128
Public Const adVarBinary = 204
Public Const adLongVarBinary = 205
Public Const adChapter = 136
Public Const adFileTime = 64
Public Const adPropVariant = 138
Public Const adVarNumeric = 139
Public Const adArray = &H2000

'---- FieldAttributeEnum Values ----
Public Const adFldMayDefer = &H2
Public Const adFldUpdatable = &H4
Public Const adFldUnknownUpdatable = &H8
Public Const adFldFixed = &H10
Public Const adFldIsNullable = &H20
Public Const adFldMayBeNull = &H40
Public Const adFldLong = &H80
Public Const adFldRowID = &H100
Public Const adFldRowVersion = &H200
Public Const adFldCacheDeferred = &H1000
Public Const adFldIsChapter = &H2000
Public Const adFldNegativeScale = &H4000
Public Const adFldKeyColumn = &H8000
Public Const adFldIsRowURL = &H10000
Public Const adFldIsDefaultStream = &H20000
Public Const adFldIsCollection = &H40000

'---- EditModeEnum Values ----
Public Const adEditNone = &H0
Public Const adEditInProgress = &H1
Public Const adEditAdd = &H2
Public Const adEditDelete = &H4

'---- RecordStatusEnum Values ----
Public Const adRecOK = &H0
Public Const adRecNew = &H1
Public Const adRecModified = &H2
Public Const adRecDeleted = &H4
Public Const adRecUnmodified = &H8
Public Const adRecInvalid = &H10
Public Const adRecMultipleChanges = &H40
Public Const adRecPendingChanges = &H80
Public Const adRecCanceled = &H100
Public Const adRecCantRelease = &H400
Public Const adRecConcurrencyViolation = &H800
Public Const adRecIntegrityViolation = &H1000
Public Const adRecMaxChangesExceeded = &H2000
Public Const adRecObjectOpen = &H4000
Public Const adRecOutOfMemory = &H8000
Public Const adRecPermissionDenied = &H10000
Public Const adRecSchemaViolation = &H20000
Public Const adRecDBDeleted = &H40000

'---- GetRowsOptionEnum Values ----
Public Const adGetRowsRest = -1

'---- PositionEnum Values ----
Public Const adPosUnknown = -1
Public Const adPosBOF = -2
Public Const adPosEOF = -3

'---- BookmarkEnum Values ----
Public Const adBookmarkCurrent = 0
Public Const adBookmarkFirst = 1
Public Const adBookmarkLast = 2

'---- MarshalOptionsEnum Values ----
Public Const adMarshalAll = 0
Public Const adMarshalModifiedOnly = 1

'---- AffectEnum Values ----
Public Const adAffectCurrent = 1
Public Const adAffectGroup = 2
Public Const adAffectAllChapters = 4

'---- ResyncEnum Values ----
Public Const adResyncUnderlyingValues = 1
Public Const adResyncAllValues = 2

'---- CompareEnum Values ----
Public Const adCompareLessThan = 0
Public Const adCompareEqual = 1
Public Const adCompareGreaterThan = 2
Public Const adCompareNotEqual = 3
Public Const adCompareNotComparable = 4

'---- FilterGroupEnum Values ----
Public Const adFilterNone = 0
Public Const adFilterPendingRecords = 1
Public Const adFilterAffectedRecords = 2
Public Const adFilterFetchedRecords = 3
Public Const adFilterConflictingRecords = 5

'---- SearchDirectionEnum Values ----
Public Const adSearchForward = 1
Public Const adSearchBackward = -1

'---- PersistFormatEnum Values ----
Public Const adPersistADTG = 0
Public Const adPersistXML = 1

'---- StringFormatEnum Values ----
Public Const adClipString = 2

'---- ConnectPromptEnum Values ----
Public Const adPromptAlways = 1
Public Const adPromptComplete = 2
Public Const adPromptCompleteRequired = 3
Public Const adPromptNever = 4

'---- ConnectModeEnum Values ----
Public Const adModeUnknown = 0
Public Const adModeRead = 1
Public Const adModeWrite = 2
Public Const adModeReadWrite = 3
Public Const adModeShareDenyRead = 4
Public Const adModeShareDenyWrite = 8
Public Const adModeShareExclusive = &HC
Public Const adModeShareDenyNone = &H10
Public Const adModeRecursive = &H400000

'---- RecordCreateOptionsEnum Values ----
Public Const adCreateCollection = &H2000
Public Const adCreateStructDoc = &H80000000
Public Const adCreateNonCollection = &H0
Public Const adOpenIfExists = &H2000000
Public Const adCreateOverwrite = &H4000000
Public Const adFailIfNotExists = -1

'---- RecordOpenOptionsEnum Values ----
Public Const adOpenRecordUnspecified = -1
Public Const adOpenOutput = &H800000
Public Const adOpenAsync = &H1000
Public Const adDelayFetchStream = &H4000
Public Const adDelayFetchFields = &H8000
Public Const adOpenExecuteCommand = &H10000

'---- IsolationLevelEnum Values ----
Public Const adXactUnspecified = &HFFFFFFFF
Public Const adXactChaos = &H10
Public Const adXactReadUncommitted = &H100
Public Const adXactBrowse = &H100
Public Const adXactCursorStability = &H1000
Public Const adXactReadCommitted = &H1000
Public Const adXactRepeatableRead = &H10000
Public Const adXactSerializable = &H100000
Public Const adXactIsolated = &H100000

'---- XactAttributeEnum Values ----
Public Const adXactCommitRetaining = &H20000
Public Const adXactAbortRetaining = &H40000

'---- PropertyAttributesEnum Values ----
Public Const adPropNotSupported = &H0
Public Const adPropRequired = &H1
Public Const adPropOptional = &H2
Public Const adPropRead = &H200
Public Const adPropWrite = &H400

'---- ErrorValueEnum Values ----
Public Const adErrProviderFailed = &HBB8
Public Const adErrInvalidArgument = &HBB9
Public Const adErrOpeningFile = &HBBA
Public Const adErrReadFile = &HBBB
Public Const adErrWriteFile = &HBBC
Public Const adErrNoCurrentRecord = &HBCD
Public Const adErrIllegalOperation = &HC93
Public Const adErrCantChangeProvider = &HC94
Public Const adErrInTransaction = &HCAE
Public Const adErrFeatureNotAvailable = &HCB3
Public Const adErrItemNotFound = &HCC1
Public Const adErrObjectInCollection = &HD27
Public Const adErrObjectNotSet = &HD5C
Public Const adErrDataConversion = &HD5D
Public Const adErrObjectClosed = &HE78
Public Const adErrObjectOpen = &HE79
Public Const adErrProviderNotFound = &HE7A
Public Const adErrBoundToCommand = &HE7B
Public Const adErrInvalidParamInfo = &HE7C
Public Const adErrInvalidConnection = &HE7D
Public Const adErrNotReentrant = &HE7E
Public Const adErrStillExecuting = &HE7F
Public Const adErrOperationCancelled = &HE80
Public Const adErrStillConnecting = &HE81
Public Const adErrInvalidTransaction = &HE82
Public Const adErrUnsafeOperation = &HE84
Public Const adwrnSecurityDialog = &HE85
Public Const adwrnSecurityDialogHeader = &HE86
Public Const adErrIntegrityViolation = &HE87
Public Const adErrPermissionDenied = &HE88
Public Const adErrDataOverflow = &HE89
Public Const adErrSchemaViolation = &HE8A
Public Const adErrSignMismatch = &HE8B
Public Const adErrCantConvertvalue = &HE8C
Public Const adErrCantCreate = &HE8D
Public Const adErrColumnNotOnThisRow = &HE8E
Public Const adErrURLIntegrViolSetColumns = &HE8F
Public Const adErrURLDoesNotExist = &HE8F
Public Const adErrTreePermissionDenied = &HE90
Public Const adErrInvalidURL = &HE91
Public Const adErrResourceLocked = &HE92
Public Const adErrResourceExists = &HE93
Public Const adErrCannotComplete = &HE94
Public Const adErrVolumeNotFound = &HE95
Public Const adErrOutOfSpace = &HE96
Public Const adErrResourceOutOfScope = &HE97
Public Const adErrUnavailable = &HE98
Public Const adErrURLNamedRowDoesNotExist = &HE99
Public Const adErrDelResOutOfScope = &HE9A
Public Const adErrPropInvalidColumn = &HE9B
Public Const adErrPropInvalidOption = &HE9C
Public Const adErrPropInvalidValue = &HE9D
Public Const adErrPropConflicting = &HE9E
Public Const adErrPropNotAllSettable = &HE9F
Public Const adErrPropNotSet = &HEA0
Public Const adErrPropNotSettable = &HEA1
Public Const adErrPropNotSupported = &HEA2
Public Const adErrCatalogNotSet = &HEA3
Public Const adErrCantChangeConnection = &HEA4
Public Const adErrFieldsUpdateFailed = &HEA5
Public Const adErrDenyNotSupported = &HEA6
Public Const adErrDenyTypeNotSupported = &HEA7
Public Const adErrProviderNotSpecified = &HEA9

'---- ParameterAttributesEnum Values ----
Public Const adParamSigned = &H10
Public Const adParamNullable = &H40
Public Const adParamLong = &H80

'---- ParameterDirectionEnum Values ----
Public Const adParamUnknown = &H0
Public Const adParamInput = &H1
Public Const adParamOutput = &H2
Public Const adParamInputOutput = &H3
Public Const adParamReturnValue = &H4

'---- CommandTypeEnum Values ----
Public Const adCmdUnknown = &H8
Public Const adCmdText = &H1
Public Const adCmdTable = &H2
Public Const adCmdStoredProc = &H4
Public Const adCmdFile = &H100
Public Const adCmdTableDirect = &H200

'---- EventStatusEnum Values ----
Public Const adStatusOK = &H1
Public Const adStatusErrorsOccurred = &H2
Public Const adStatusCantDeny = &H3
Public Const adStatusCancel = &H4
Public Const adStatusUnwantedEvent = &H5

'---- EventReasonEnum Values ----
Public Const adRsnAddNew = 1
Public Const adRsnDelete = 2
Public Const adRsnUpdate = 3
Public Const adRsnUndoUpdate = 4
Public Const adRsnUndoAddNew = 5
Public Const adRsnUndoDelete = 6
Public Const adRsnRequery = 7
Public Const adRsnResynch = 8
Public Const adRsnClose = 9
Public Const adRsnMove = 10
Public Const adRsnFirstChange = 11
Public Const adRsnMoveFirst = 12
Public Const adRsnMoveNext = 13
Public Const adRsnMovePrevious = 14
Public Const adRsnMoveLast = 15

'---- SchemaEnum Values ----
Public Const adSchemaProviderSpecific = -1
Public Const adSchemaAsserts = 0
Public Const adSchemaCatalogs = 1
Public Const adSchemaCharacterSets = 2
Public Const adSchemaCollations = 3
Public Const adSchemaColumns = 4
Public Const adSchemaCheckConstraints = 5
Public Const adSchemaConstraintColumnUsage = 6
Public Const adSchemaConstraintTableUsage = 7
Public Const adSchemaKeyColumnUsage = 8
Public Const adSchemaReferentialConstraints = 9
Public Const adSchemaTableConstraints = 10
Public Const adSchemaColumnsDomainUsage = 11
Public Const adSchemaIndexes = 12
Public Const adSchemaColumnPrivileges = 13
Public Const adSchemaTablePrivileges = 14
Public Const adSchemaUsagePrivileges = 15
Public Const adSchemaProcedures = 16
Public Const adSchemaSchemata = 17
Public Const adSchemaSQLLanguages = 18
Public Const adSchemaStatistics = 19
Public Const adSchemaTables = 20
Public Const adSchemaTranslations = 21
Public Const adSchemaProviderTypes = 22
Public Const adSchemaViews = 23
Public Const adSchemaViewColumnUsage = 24
Public Const adSchemaViewTableUsage = 25
Public Const adSchemaProcedureParameters = 26
Public Const adSchemaForeignKeys = 27
Public Const adSchemaPrimaryKeys = 28
Public Const adSchemaProcedureColumns = 29
Public Const adSchemaDBInfoKeywords = 30
Public Const adSchemaDBInfoLiterals = 31
Public Const adSchemaCubes = 32
Public Const adSchemaDimensions = 33
Public Const adSchemaHierarchies = 34
Public Const adSchemaLevels = 35
Public Const adSchemaMeasures = 36
Public Const adSchemaProperties = 37
Public Const adSchemaMembers = 38
Public Const adSchemaTrustees = 39
Public Const adSchemaFunctions = 40
Public Const adSchemaActions = 41
Public Const adSchemaCommands = 42
Public Const adSchemaSets = 43

'---- FieldStatusEnum Values ----
Public Const adFieldOK = 0
Public Const adFieldCantConvertValue = 2
Public Const adFieldIsNull = 3
Public Const adFieldTruncated = 4
Public Const adFieldSignMismatch = 5
Public Const adFieldDataOverflow = 6
Public Const adFieldCantCreate = 7
Public Const adFieldUnavailable = 8
Public Const adFieldPermissionDenied = 9
Public Const adFieldIntegrityViolation = 10
Public Const adFieldSchemaViolation = 11
Public Const adFieldBadStatus = 12
Public Const adFieldDefault = 13
Public Const adFieldIgnore = 15
Public Const adFieldDoesNotExist = 16
Public Const adFieldInvalidURL = 17
Public Const adFieldResourceLocked = 18
Public Const adFieldResourceExists = 19
Public Const adFieldCannotComplete = 20
Public Const adFieldVolumeNotFound = 21
Public Const adFieldOutOfSpace = 22
Public Const adFieldCannotDeleteSource = 23
Public Const adFieldReadOnly = 24
Public Const adFieldResourceOutOfScope = 25
Public Const adFieldAlreadyExists = 26
Public Const adFieldPendingInsert = &H10000
Public Const adFieldPendingDelete = &H20000
Public Const adFieldPendingChange = &H40000
Public Const adFieldPendingUnknown = &H80000
Public Const adFieldPendingUnknownDelete = &H100000

'---- SeekEnum Values ----
Public Const adSeekFirstEQ = &H1
Public Const adSeekLastEQ = &H2
Public Const adSeekAfterEQ = &H4
Public Const adSeekAfter = &H8
Public Const adSeekBeforeEQ = &H10
Public Const adSeekBefore = &H20

'---- ADCPROP_UPDATECRITERIA_ENUM Values ----
Public Const adCriteriaKey = 0
Public Const adCriteriaAllCols = 1
Public Const adCriteriaUpdCols = 2
Public Const adCriteriaTimeStamp = 3

'---- ADCPROP_ASYNCTHREADPRIORITY_ENUM Values ----
Public Const adPriorityLowest = 1
Public Const adPriorityBelowNormal = 2
Public Const adPriorityNormal = 3
Public Const adPriorityAboveNormal = 4
Public Const adPriorityHighest = 5

'---- ADCPROP_AUTORECALC_ENUM Values ----
Public Const adRecalcUpFront = 0
Public Const adRecalcAlways = 1

'---- ADCPROP_UPDATERESYNC_ENUM Values ----

'---- ADCPROP_UPDATERESYNC_ENUM Values ----

'---- MoveRecordOptionsEnum Values ----
Public Const adMoveUnspecified = -1
Public Const adMoveOverWrite = 1
Public Const adMoveDontUpdateLinks = 2
Public Const adMoveAllowEmulation = 4

'---- CopyRecordOptionsEnum Values ----
Public Const adCopyUnspecified = -1
Public Const adCopyOverWrite = 1
Public Const adCopyAllowEmulation = 4
Public Const adCopyNonRecursive = 2

'---- StreamTypeEnum Values ----
Public Const adTypeBinary = 1
Public Const adTypeText = 2

'---- LineSeparatorEnum Values ----
Public Const adLF = 10
Public Const adCR = 13
Public Const adCRLF = -1

'---- StreamOpenOptionsEnum Values ----
Public Const adOpenStreamUnspecified = -1
Public Const adOpenStreamAsync = 1
Public Const adOpenStreamFromRecord = 4

'---- StreamWriteEnum Values ----
Public Const adWriteChar = 0
Public Const adWriteLine = 1

'---- SaveOptionsEnum Values ----
Public Const adSaveCreateNotExist = 1
Public Const adSaveCreateOverWrite = 2

'---- FieldEnum Values ----
Public Const adDefaultStream = -1
Public Const adRecordURL = -2

'---- StreamReadEnum Values ----
Public Const adReadAll = -1
Public Const adReadLine = -2

'---- RecordTypeEnum Values ----
Public Const adSimpleRecord = 0
Public Const adCollectionRecord = 1
Public Const adStructDoc = 2
