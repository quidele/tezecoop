VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CBasededatos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
    
Option Explicit

Const adUseServer = 2
Const adStateOpen = 1
Const adOpenForwardOnly = 0
Const adCmdText = 1
Const adLockReadOnly = 1
Const adCmdStoredProc = 4
Const adParamReturnValue = 4
Const adParamInput = 1
Const adNumeric = 131
Const adParamInputOutput = 3
Const adDouble = 5


Private lobjConn                    As Object
Private lobjConn_diccionario        As Object
Private lerror                      As String
Private lnmBasededatos_Local        As String
Private ldsDSN                      As String
Private ldsUID                      As String
Private ldsPassword                 As String
Private ldsMotorBD                  As String
Private lrs                         As Object
Private lrs_Diccionariodedatos      As Object
Private lrecordAffected             As Double
Private lrecordAffected_local       As Double

Dim lobjConfigRegional              As New CConfigRegional
Dim objLog                          As New CArchivo
Dim lstrUltSQL                      As String


'/*************************************************/
'/* Actualización Sistema Local                   */
Private ldsDSN_Local                As String
Private ldsUID_Local                As String
Private ltpModoActual               As String
Private lDiccionariodedatos         As CDiccionariodeDatos
'/*************************************************/

Private bExisteUnaTransaccion As Boolean


Public nmServidor As String
Public nmBasededatos As String

Property Get getConnection() As Object
    getConnection = lobjConn
End Property




Property Get tpModoActual() As String
    tpModoActual = ltpModoActual
End Property

Property Let tpModoActual(ptpModoActual As String)
     ltpModoActual = ptpModoActual
End Property
 

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = Replace(lerror, "[Microsoft][ODBC SQL Server Driver]", "", 1, , vbTextCompare)
End Property

Property Get nmBasededatos_Local() As String
    nmBasededatos_Local = lnmBasededatos_Local
End Property

Property Let nmBasededatos_Local(Valor As String)
    lnmBasededatos_Local = Valor
End Property


Property Set DiccionarioDeDatos(Valor As CDiccionariodeDatos)
    Set lDiccionariodedatos = Valor
End Property

Property Get DiccionarioDeDatos()
    Set DiccionarioDeDatos = lDiccionariodedatos
End Property

Property Get dsDSN() As String
    dsDSN = ldsDSN
End Property

Property Let dsDSN(Valor As String)
    ldsDSN = Valor
End Property

Property Get dsUID() As String
    dsUID = ldsUID
End Property


Property Let dsPassword(Valor As String)
    ldsPassword = Valor
End Property


Property Get dsPassword() As String
    dsPassword = ldsPassword
End Property

Property Let dsUID(Valor As String)
    ldsUID = Valor
End Property




'/*************************************************/
'/* Actualización Sistema Local                   */
Property Get dsDSN_Local() As String
    dsDSN_Local = ldsDSN_Local
End Property

Property Let dsDSN_Local(Valor As String)
    ldsDSN_Local = Valor
End Property

Property Get dsUID_Local() As String
    dsUID_Local = ldsUID_Local
End Property

Property Let dsUID_Local(Valor As String)
    ldsUID_Local = Valor
End Property
'/*************************************************/

Property Get dsMotorBD() As String
    dsMotorBD = ldsMotorBD
End Property

Property Let dsMotorBD(Valor As String)
    ldsMotorBD = Valor
End Property


Public Function abrirBD() As Boolean
Dim strDriver     As String
Dim strDataSource As String
Dim strConection  As String


    lobjConfigRegional.ConfigurarSistema

    Set lobjConn = CreateObject("adodb.connection")
       
    ' para SQL EXPRESS EDITION        Provider=SQLOLEDB;
    
    strDataSource = "DSN=" + Me.dsDSN + ";UID=" + Me.dsUID + ";PWD=" + Me.dsPassword
    
    lobjConn.CommandTimeout = 120
    lobjConn.CursorLocation = adUseServer
    strConection = strDataSource
    
    On Error Resume Next
    lobjConn.Open strConection
    
    If Err Then
        lerror = Err.Description
        Debug.Assert lerror
        abrirBD = False
    Else
         Configurar_Basededatos lobjConn
         abrirBD = True
    End If
        
End Function

Public Function abrirBD_Diccionario() As Boolean
Dim strDriver     As String
Dim strDataSource As String
Dim strConection  As String



    Set lobjConn_diccionario = CreateObject("object")
    
    strDataSource = "DSN=" + Me.dsDSN + ";UID=" + Me.dsUID + ";PWD=sonrisa14"
    
    lobjConn_diccionario.CommandTimeout = 120
    lobjConn_diccionario.CursorLocation = adUseServer
    strConection = strDataSource
    
    On Error Resume Next
    lobjConn_diccionario.Open strConection
    
    If Err Then
        lerror = Err.Description
        Debug.Assert lerror
        abrirBD_Diccionario = False
    Else
         Configurar_Basededatos lobjConn
         abrirBD_Diccionario = True
    End If
        
End Function





Private Sub Configurar_Basededatos(pCon As Object)
        
        Select Case Me.dsMotorBD
        Case "SQL_SERVER"
             pCon.Execute "SET DATEFORMAT dmy"
        Case "ACCESS"
        End Select
        
End Sub


  '****************************************'
  '* cierra base de datos                 *'
  '****************************************'
Public Sub cerrarBD()
    Set lobjConn = Nothing
End Sub


'****************************************************'
'* Llamadas a Stores Procedures de la base de datos
'****************************************************'

Property Get rs_resultados() As Object
    Set rs_resultados = lrs
End Property


' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Property Get rsResultados() As ADODB.Recordset
    Set rsResultados = lrs
End Property

Public Sub close_resultados()
    
    If Not lrs Is Nothing Then
        If lrs.State = adStateOpen Then
            lrs.Close
        End If
        Set lrs = Nothing
    End If
    
End Sub


Property Get rs_resultados_Diccionariodedatos() As Object
    Set rs_resultados_Diccionariodedatos = lrs_Diccionariodedatos
End Property


Public Sub close_resultados_Diccionariodedatos()
    
    If Not lrs_Diccionariodedatos Is Nothing Then
        If lrs_Diccionariodedatos.State = adStateOpen Then
            lrs_Diccionariodedatos.Close
        End If
        Set lrs_Diccionariodedatos = Nothing
    End If
    
End Sub


Public Function ExecStoredProcedures_Diccionariodedatos(psSQL As String)
Dim strSQL As String
Dim rs     As Object

    Screen.MousePointer = vbHourglass
    
    lrecordAffected = -1
    
    CerrarRecordsets_Diccionario
    CerrarRecordsets
    
    ReabrirlaConexion
    
    Set rs = CreateObject("adodb.recordset")
        
    
    ' Aqui se debe grabar un archivo Log con lo comandos  SQL que se ejecuten
    strSQL = "Exec " + psSQL
    
    ' On Error Resume Next
    Set rs.ActiveConnection = lobjConn
    
    rs.Open strSQL, , adOpenKeyset, adLockReadOnly, adCmdText
    
    ' si existió algun error devolvemos error
    If Err Then
        Screen.MousePointer = vbDefault
        lerror = Err.Description
        ExecStoredProcedures_Diccionariodedatos = False
        Exit Function
    End If
    
    Set lrs_Diccionariodedatos = rs
    
    Screen.MousePointer = vbDefault
    On Error GoTo 0
    
    ' objLog.Grabar_Log strSQL
    
    ReDim mCampoOperadorValor(0 To 0)
    ExecStoredProcedures_Diccionariodedatos = True

End Function


Public Function ExecStoredProcedures(psSQL As String) As Boolean
Dim strSQL As String
Dim rs     As Object

    Screen.MousePointer = vbHourglass
    
    lrecordAffected = -1
    
    ReabrirlaConexion
    
    CerrarRecordsets_Diccionario
    CerrarRecordsets
    
    Set rs = CreateObject("adodb.recordset")
    
    ' Aqui se debe grabar un archivo Log con lo comandos  SQL que se ejecuten
    strSQL = "Exec " + psSQL
    
    On Error Resume Next
    Set rs.ActiveConnection = lobjConn
    
    rs.Open strSQL, , adOpenKeyset, adOpenStatic, adCmdText
    
    
    ' si existió algun error devolvemos error
    If Err Then
        Screen.MousePointer = vbDefault
        lerror = Err.Description
        ExecStoredProcedures = False
        Exit Function
    End If
    
    Set lrs = rs

    Screen.MousePointer = vbDefault
    On Error GoTo 0
    
    ' objLog.Grabar_Log strSQL
     
    ReDim mCampoOperadorValor(0 To 0)
    ExecStoredProcedures = True
    
End Function



Public Function hashCadena(pCadena As String) As String
Dim nTamanio   As Integer
Dim nAscii     As Integer
Dim nHashValor As Long
Dim i          As Integer
Dim Caracter   As String

    nTamanio = Len(pCadena)
    For i = 1 To nTamanio
        Caracter = Mid(pCadena, i, 1)
        nAscii = Asc(Caracter)
        nHashValor = nHashValor + (nAscii * 3)
    Next
    'hashCadena = nHashValor
    
    hashCadena = pCadena
    
End Function

'/************************************************************/
'/************************************************************/
'/************************************************************/
'/************************************************************/
'/*         IMPLEMENTACION METODOS ACCESO A DATOS            */
'/************************************************************/
'/************************************************************/
'/************************************************************/
'/************************************************************/


' Registros afectados por la ultima operacion SQL
Property Get recordAffected() As Double
    recordAffected = lrecordAffected
End Property

' Abrir la transaccion
Public Sub BeginTrans()

    CerrarRecordsets
    lobjConn.BeginTrans
    bExisteUnaTransaccion = True
    
End Sub

' Volver una transacion
Public Sub RollBackTrans()

    lobjConn.RollBackTrans
    bExisteUnaTransaccion = False
    
End Sub

' Procesar la Transaccion
Public Function CommitTrans() As Boolean

    On Error Resume Next
    
    lobjConn.CommitTrans
    
    If Err Then
        lerror = Err.Description
        CommitTrans = False
    Else
        CommitTrans = True
    End If
    On Error GoTo 0
    
    bExisteUnaTransaccion = False
    
End Function

Public Function ExecuteSQL(pstrSQL As String, Optional pOpciones As Long = -1) As Boolean
    
    lrecordAffected = -1
    CerrarRecordsets
    
    ReabrirlaConexion
    
    On Error Resume Next
    
    Set lrs = lobjConn.Execute(pstrSQL, lrecordAffected, pOpciones)

    If Err Then
        ' objLog.Grabar_Log pstrSQL
        Screen.MousePointer = vbDefault
        lerror = Err.Description
        ' objLog.Grabar_Log Err.Description
        ExecuteSQL = False
    Else
        ExecuteSQL = True
    End If
    On Error GoTo 0
    
    
     ' objLog.Grabar_Log pstrSQL
     
     
End Function

Private Sub CerrarRecordsets()

    On Error Resume Next
    lrs.ActiveConnection = Nothing
    On Error GoTo 0
    
    If Not lrs Is Nothing Then
        If lrs.State = adStateOpen Then
            lrs.Close
        End If
        Set lrs = Nothing
    End If

End Sub

Private Sub CerrarRecordsets_Diccionario()

    On Error Resume Next
    lrs_Diccionariodedatos.ActiveConnection = Nothing
    On Error GoTo 0
    
    If Not lrs_Diccionariodedatos Is Nothing Then
        If lrs_Diccionariodedatos.State = adStateOpen Then
            lrs_Diccionariodedatos.Close
        End If
        Set lrs_Diccionariodedatos = Nothing
    End If

End Sub

Private Sub ReabrirlaConexion()

    If bExisteUnaTransaccion Then Exit Sub
    If Not abrirBD Then
        MsgBox "Se ha perdido la conexión con la Administración, el sistema se cerrará.", vbCritical, "Atención"
    End If

End Sub



' Esta function realiza el formateo de los parametros de tipo char,varchar
Public Function FormatearValorSQL(pValor As Variant, pTipo As String, Optional pnmCampo As String) As String
Dim strValor
Dim dia    As String
Dim mes    As String
Dim anio   As String


    If IsNull(pValor) Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    If Trim(CStr(pValor)) = "" Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    Select Case UCase(pTipo)
    Case "BIT", "INT", "SMALLINT", "NUMERIC", "REAL", "DECIMAL", "INTEGER", "COUNTER"
            Select Case lobjConfigRegional.sDecimal
            Case "."
                ' extraigo el simbolo de miles
                pValor = Replace(Trim(pValor), ",", "", , , vbTextCompare)
                FormatearValorSQL = pValor
            Case ","
                Select Case UCase(CStr(pValor))
                Case "FALSE", "FALSO"
                    pValor = 0
                Case "TRUE", "VERDADERO"
                    pValor = 1
                End Select
                pValor = Replace(Trim(pValor), ".", "", , , vbTextCompare)
                FormatearValorSQL = Replace(Trim(pValor), ",", ".", , , vbTextCompare)
            Case Else
                MsgBox "La configuración regional de windows no es apropiada " + _
                       " para este sistema. El sistema no puede continuar ejecutandose.", vbCritical + vbDefaultButton1, "Atención"
                End
            End Select
            FormatearValorSQL = pValor
    Case "DATETIME"
          If pValor = "  /  /       :  :  " Or pValor = "/  /       :  :" Or pValor = "  /  /    " Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY HH:MM:SS") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            End Select
          End If
    Case "SMALLDATETIME"
          If pValor = "/  /" Or pValor = "__/__/____" Or pValor = "  /  /    " Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                If Len(pValor) <> 10 Then
                    FormatearValorSQL = "null"
                    Exit Function
                End If
                dia = CStr(Day(pValor))
                If Len(dia) = 1 Then dia = "0" + dia
                mes = CStr(Month(pValor))
                If Len(mes) = 1 Then mes = "0" + mes
                anio = CStr(Year(pValor))
                FormatearValorSQL = Chr(39) + anio + "/" + mes + "/" + dia + Chr(39)
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/YY") + Chr(39)
            End Select
          End If
    Case "CHAR", "VARCHAR", "NRO_COMPROBANTE"
        FormatearValorSQL = Chr(39) + Replace(Trim(CStr(pValor)), "'", "''", , , vbTextCompare) + Chr(39)
    Case "DOUBLE", "FLOAT"
        Select Case lobjConfigRegional.sDecimal
        Case "."
            ' extraigo el simbolo de miles
            strValor = Replace(Trim(CStr(pValor)), ",", "", , , vbTextCompare)
            FormatearValorSQL = strValor
        Case ","
            strValor = Replace(Trim(CStr(pValor)), ".", "", , , vbTextCompare)
            FormatearValorSQL = Replace(Trim(strValor), ",", ".", , , vbTextCompare)
        Case Else
            MsgBox "La configuración regional de windows no es apropiada " + _
                   " para este sistema. El sistema no puede continuar ejecutandose.", vbCritical + vbDefaultButton1, "Atención"
            End
        End Select
        
    Case Else
        MsgBox "Falto formatearlo, el sistema no puede continuar. Debera ingresar el tipo de dato para el campo '" + pnmCampo + "'.", vbCritical + vbDefaultButton1, "Atención"
        End
    End Select
    
End Function



Public Function ExecStoredProcedures_Params(pnmSP As String, Optional strParams As String) As Boolean
Dim strSQL As String
Dim rs     As Object

    Screen.MousePointer = vbHourglass
    
    lrecordAffected = -1
    
    ReabrirlaConexion
    
    CerrarRecordsets_Diccionario
    CerrarRecordsets
    
    Set rs = CreateObject("adodb.recordset")
    
    ' Aqui se debe grabar un archivo Log con lo comandos  SQL que se ejecuten
    
    Select Case Me.dsMotorBD
    Case "SQL_SERVER"
        strSQL = "Exec " + pnmSP + " " + strParams
    Case "MY_SQL"
        strSQL = "Call " + pnmSP + " (" + strParams + ");"
    Case Else
        strSQL = "Call " + pnmSP + " (" + strParams + ");"
    End Select
    
    On Error Resume Next
    Set rs.ActiveConnection = lobjConn

    rs.Open strSQL, , adOpenKeyset, adLockReadOnly, adCmdText
    
    ' si existió algun error devolvemos error
    If Err Then
        objLog.Grabar_Log strSQL
        Screen.MousePointer = vbDefault
        lerror = Err.Description
        objLog.Grabar_Log Err.Description
        ExecStoredProcedures_Params = False
        
        Exit Function
    End If
    
    Set lrs = rs

    Screen.MousePointer = vbDefault
    On Error GoTo 0
    
    objLog.Grabar_Log strSQL
    
    ReDim mCampoOperadorValor(0 To 0)
    ExecStoredProcedures_Params = True
    
End Function



Public Function getDateasString() As String
Dim strSQL As String

        getDateasString = ""
        Select Case Me.dsMotorBD
        Case "SQL_SERVER"
             strSQL = "SET DATEFORMAT dmy"
             If Not Me.ExecuteSQL(strSQL) Then
                lerror = "No se pudo obtener el formato de dmy, SQL: " + strSQL
                Exit Function
             End If
             strSQL = "select getdate() AS FECHA"
             If Not Me.ExecuteSQL(strSQL) Then
                lerror = "No se pudo obtener la fecha remota, SQL: " + strSQL
                Exit Function
             End If
             If Me.rs_resultados.EOF Then
                lerror = "No se pudo obtener la fecha remota, SQL: " + strSQL
                Exit Function
             End If
             getDateasString = Me.rs_resultados("FECHA")
        Case "MDB"
        End Select
        
End Function


' Devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Public Function rs_resultados_valor(pnom_valor As Variant) As String
 
    If IsNull(lrs(pnom_valor).Value) Then
        Select Case lrs(pnom_valor).Type
        Case adChar, adBSTR, adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
             adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rs_resultados_valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, adBoolean
             rs_resultados_valor = 0
        Case adDBDate, adDBTimeStamp, adDBTime
             rs_resultados_valor = vbNullString
        End Select
    Else
        Select Case lrs(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rs_resultados_valor = Trim(lrs(pnom_valor).Value)
        Case adBoolean
             If lrs(pnom_valor).Value Then
                rs_resultados_valor = "1"
             Else
                rs_resultados_valor = "0"
             End If
        Case Else
             rs_resultados_valor = lrs(pnom_valor).Value
        End Select
    End If
    
End Function


' Ejecuta stored procedures declarados en la base de datos
' devueldo true o falso
' tambien provoca la devolucion de datos a traves de la
' Propiedad rsResultados
Public Function ExecSQL_directo(psSQL As String) As Boolean
Dim strSQL      As String
Dim iPuntero    As Integer
    
    iPuntero = Screen.MousePointer
    Screen.MousePointer = vbHourglass
    strSQL = psSQL
    On Error Resume Next
    Set lrs = lobjConn.Execute(strSQL)
    
    If Err Then
        lerror = Err.Description
        ExecSQL_directo = False
        Screen.MousePointer = iPuntero
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    lstrUltSQL = psSQL
    ReDim mCampoOperadorValor(0 To 0)
    Screen.MousePointer = iPuntero
    ExecSQL_directo = True
    
End Function




' Realiza una apertura sobro el gestor de la base de datos
' es decir que accede en forma directo evitando el acceso
' al framework
Public Function abrirBD_Directo(pDSN As String, pUsuario As String, pPassword As String) As Boolean
Dim strDriver     As String
Dim strDataSource As String
Dim strConection  As String

    Set lobjConn = CreateObject("ADODB.Connection")  ' New ADODB.Connection
    strDataSource = "DSN=" + pDSN
    lobjConn.CommandTimeout = 120
    'lobjConn.CursorLocation = adUseServer
    strConection = strDataSource
    On Error Resume Next
    lobjConn.Open strConection, pUsuario, pPassword
    If Err Then
        lerror = Err.Description
        Debug.Assert lerror
        abrirBD_Directo = False
    Else
        abrirBD_Directo = True
    End If
    On Error GoTo 0
    
End Function


' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Public Function rsResultados_Valor(pnom_valor As Variant) As String
 
    If IsNull(lrs(pnom_valor).Value) Then
        Select Case lrs(pnom_valor).Type
        Case adChar, adBSTR, adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
             adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rsResultados_Valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
             adBoolean
             rsResultados_Valor = 0
        Case adDBDate, adDBTimeStamp, adDBTime, adDate
              rsResultados_Valor = vbNullString
        End Select
    Else
        Select Case lrs(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rsResultados_Valor = Trim(lrs(pnom_valor).Value)
        Case Else
             rsResultados_Valor = lrs(pnom_valor).Value
        End Select
    End If
    
End Function


Public Function obtenerMetadataTablas()

    
    obtenerMetadataTablas = objBasededatos.ExecSQL_directo(" select [name] from dbo.sysobjects where  OBJECTPROPERTY(id, N'IsUserTable') = 1 order by name")
    
    
End Function
