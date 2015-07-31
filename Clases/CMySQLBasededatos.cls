VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMySQLBasededatos"
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
Private ldsDSN                      As String
Private ldsUID                      As String
Private lnmServidor                 As String
Private lnmBasededatos              As String
Private ldsMotorBD                  As String
Private lrs                         As Object
Private lrs_Diccionariodedatos      As Object
Private lrecordAffected             As Double
Private lrecordAffected_local       As Double
Private lobjConfigRegional          As CConfigRegional
'/*************************************************/
'/* Actualización Sistema Local                   */
Private ldsDSN_Local                As String
Private ldsUID_Local                As String
Private ltpModoActual               As String
Private lDiccionariodedatos         As CMySQLDiccDatos
'/*************************************************/

Public lobjConfig                   As CConfig

Private bExisteUnaTransaccion As Boolean


Property Get getConnection() As Object
    Set getConnection = lobjConn
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



Property Set DiccionarioDeDatos(Valor As CMySQLDiccDatos)
    Set lDiccionariodedatos = Valor
End Property

Property Get DiccionarioDeDatos()
    Set DiccionarioDeDatos = lDiccionariodedatos
End Property

Property Get nmServidor() As String
     nmServidor = lnmServidor
End Property

Property Let nmServidor(Valor As String)
    lnmServidor = Valor
End Property


Property Get nmBasededatos() As String
     nmBasededatos = lnmBasededatos
End Property

Property Let nmBasededatos(Valor As String)
    lnmBasededatos = Valor
End Property



Property Set ConfigRegional(Valor As CConfigRegional)
    Set lobjConfigRegional = Valor
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

    Select Case ldsMotorBD
    Case "MY_SQL"
        abrirBD = abrirBD_mySQL()
    Case "SQL_SERVER"
        abrirBD = False
    Case "MDB"
        abrirBD = AbrirBD_MDB()
    Case Else
        abrirBD = False
    End Select


End Function



Private Function AbrirBD_MDB() As Boolean
Dim strDriver     As String
Dim strDataSource As String
Dim strConection  As String

    Set lobjConn = CreateObject("ADODB.Connection")
    strDataSource = "PROVIDER=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=" + nmBasededatos
    lobjConn.CursorLocation = adUseServer
    lobjConn.Mode = adModeShareDenyNone
    strConection = strDataSource
    On Error Resume Next
    lobjConn.Open strConection
    If Err Then
        AbrirBD_MDB = False
    Else
        AbrirBD_MDB = True
    End If
    On Error GoTo 0
    
End Function


Public Function abrirBD_mySQL() As Boolean
Dim strDriver     As String
Dim strDataSource As String
Dim strConection  As String


    On Error Resume Next
    lobjConn.Cancel
    On Error GoTo 0
    On Error Resume Next
    lobjConn.Close
    On Error GoTo 0
    On Error Resume Next
    Set lobjConn = Nothing
    On Error GoTo 0
    
    Set lobjConn = CreateObject("ADODB.Connection")
    
    strDataSource = "DRIVER={MySQL ODBC 3.51 Driver};SERVER=" + _
    Me.nmServidor + ";DATABASE=" + Me.nmBasededatos + ";UID=" + Me.dsUID + ";PWD=sonrisa14;OPTION=3"
    
    ' strDataSource = "DSN=" + Me.dsDSN + ";UID=" + Me.dsUID + ";PWD=sonrisa14"
    
    ' lobjConn.CommandTimeout = 0
    lobjConn.CursorLocation = adUseServer
    strConection = strDataSource
    
    
    On Error Resume Next
    lobjConn.Open strConection
    
    If Err Then
        lerror = Err.Description
        Debug.Assert lerror
        abrirBD_mySQL = False
    Else
         Configurar_Basededatos lobjConn
         abrirBD_mySQL = True
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
        Case "MDB"
        End Select
        
End Sub


  '****************************************'
  '* cierra base de datos                 *'
  '****************************************'
Public Sub cerrarBD()
    On Error Resume Next
    lobjConn.Close
    On Error GoTo 0
    Set lobjConn = Nothing
End Sub


'****************************************************'
'* Llamadas a Stores Procedures de la base de datos
'****************************************************'

Property Get rs_resultados() As Object
    Set rs_resultados = lrs
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


Public Function ExecStoredProcedures_Diccionariodedatos(pnmSP As String, strParams As String)
Dim strSQL As String
Dim rs     As Object

    Screen.MousePointer = vbHourglass
    
    lrecordAffected = -1
    
    CerrarRecordsets_Diccionario
    CerrarRecordsets
    
    ReabrirlaConexion
    
    Set rs = CreateObject("adodb.recordset")
        
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
    
    rs.Open strSQL, , adOpenForwardOnly, adLockReadOnly, adCmdText
    
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
    ReDim mCampoOperadorValor(0 To 0)
    ExecStoredProcedures_Diccionariodedatos = True

End Function


Public Function ExecStoredProcedures(pnmSP As String, Optional strParams As String) As Boolean
Dim strSQL As String
Dim rs     As Object

    Screen.MousePointer = vbHourglass
    
    lrecordAffected = -1
    
    ReabrirlaConexion
    
    CerrarRecordsets_Diccionario
    CerrarRecordsets
    
    Set rs = CreateObject("ADODB.recordset")
    
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
    
    rs.Open strSQL, , adOpenForwardOnly, adLockReadOnly, adCmdText
    
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
    ReDim mCampoOperadorValor(0 To 0)
    ExecStoredProcedures = True
    
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
    bExisteUnaTransaccion = False
    ReabrirlaConexion
    lobjConn.BeginTrans
    bExisteUnaTransaccion = True
    
End Sub

' Volver una transacion
Public Sub RollBackTrans()
    On Error Resume Next
    lobjConn.RollBackTrans
    On Error GoTo 0
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
    
    lerror = ""
    lrecordAffected = -1
    CerrarRecordsets
    
    ReabrirlaConexion
    
    On Error Resume Next
    Set lrs = lobjConn.Execute(pstrSQL, lrecordAffected, pOpciones)
    
    If Err Then
        lerror = Err.Description
        ExecuteSQL = False
    Else
        ExecuteSQL = True
    End If
    On Error GoTo 0
    
End Function

Private Sub CerrarRecordsets()

    If Not lrs Is Nothing Then
        If lrs.State = adStateOpen Then
            lrs.Close
        End If
        Set lrs = Nothing
    End If

End Sub

Private Sub CerrarRecordsets_Diccionario()
    
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
        MsgBox "Se ha perdido la conexión con el servidor central, el sistema se cerrará.", vbCritical, "Atención"
        End
    End If

End Sub


' Esta function realiza el formateo de los parametros de tipo char,varchar
Public Function FormatearValorSQL(pValor As Variant, pTipo As String, Optional pnmCampo As String) As String
Dim strValor     As String
Dim dia          As String
Dim mes          As String
Dim anio         As String
Dim strHora      As String
Dim strSegundos  As String
Dim strMinutos   As String
Dim pos          As Integer

    If IsNull(pValor) Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    If Trim(CStr(pValor)) = "" Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    
    Select Case UCase(pTipo)
    Case "BIT", "INT", "SMALLINT", "NUMERIC", "REAL", "NUMERIC", "INTEGER", "COUNTER"
            Select Case lobjConfigRegional.sDecimal
            Case "."
                ' extraigo el simbolo de miles
                pValor = Replace(Trim(pValor), ",", "", , , vbTextCompare)
                FormatearValorSQL = pValor
            Case ","
                pValor = Replace(Trim(pValor), ".", "", , , vbTextCompare)
                FormatearValorSQL = Replace(Trim(pValor), ",", ".", , , vbTextCompare)
            Case Else
                MsgBox "La configuración regional de windows no es apropiada " + _
                       " para este sistema. El sistema no puede continuar ejecutandose.", vbCritical + vbDefaultButton1, "Atención"
                End
            End Select
            FormatearValorSQL = pValor
    Case "DATETIME"
          If pValor = "  /  /       :  :  " Or pValor = "/  /       :  :" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY HH:MM:SS") + Chr(39)
            Case "MDB"
                FormatearValorSQL = "#" + Format(pValor, "YYYY/MM/DD HH:MM:SS") + "#"
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
            End Select
          End If
    Case "SMALLDATETIME"
          If pValor = "/  /" Or pValor = "__/__/____" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = Chr(39) + anio + "/" + mes + "/" + dia + Chr(39)
                Case 19
                    FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD HH:MM:SS") + Chr(39)
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY") + Chr(39)
            Case "MDB"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = "#" + anio + "/" + mes + "/" + dia + "#"
                Case 19
                    FormatearValorSQL = "#" + Format(pValor, "YYYY/MM/DD HH:MM:SS") + "#"
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/YY") + Chr(39)
            End Select
          End If
    Case "SMALLDATETIME_DOWN"
          If pValor = "/  /" Or pValor = "__/__/____" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = Chr(39) + anio + "/" + mes + "/" + dia + " 00:00:00.000" + Chr(39)
                Case 19
                    FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD 00:00:00.000") + Chr(39)
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case "MDB"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = "#" + anio + "/" + mes + "/" + dia + " 00:00:00" + "#"
                Case 19
                    FormatearValorSQL = "#" + Format(pValor, "YYYY/MM/DD 00:00:00") + "#"
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/YY") + Chr(39)
            End Select
          End If
    Case "SMALLDATETIME_UP"
          If pValor = "/  /" Or pValor = "__/__/____" Then
            FormatearValorSQL = "null"
          Else
            Select Case Me.dsMotorBD
            Case "MY_SQL"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = Chr(39) + anio + "/" + mes + "/" + dia + " 23:59:59.000" + Chr(39)
                Case 19
                    FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/DD 23:59:59.000") + Chr(39)
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case "MDB"
                Select Case Len(pValor)
                Case 10
                    dia = CStr(Day(pValor))
                    If Len(dia) = 1 Then dia = "0" + dia
                    mes = CStr(Month(pValor))
                    If Len(mes) = 1 Then mes = "0" + mes
                    anio = CStr(Year(pValor))
                    FormatearValorSQL = "#" + anio + "/" + mes + "/" + dia + " 23:59:59" + "#"
                Case 19
                    FormatearValorSQL = "#" + Format(pValor, "YYYY/MM/DD 23:59:59") + "#"
                Case Else
                    FormatearValorSQL = "null"
                End Select
                    Exit Function
            Case "SQL_SERVER"
                FormatearValorSQL = Chr(39) + Format(pValor, "DD/MM/YYYY") + Chr(39)
            Case Else
                FormatearValorSQL = Chr(39) + Format(pValor, "YYYY/MM/YY") + Chr(39)
            End Select
          End If
    Case "CHAR", "VARCHAR", "TELEFONO", "DNI", "NRO_COMPROBANTE"
        FormatearValorSQL = Chr(39) + Replace(Trim(CStr(pValor)), "'", "''", , , vbTextCompare) + Chr(39)
    Case "HORA"
        pos = InStr(1, pValor, ":", vbTextCompare)
        If pos = 0 Then
            MsgBox "Falto formatearlo, el sistema no puede continuar", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        strHora = Left(pValor, pos - 1)
        pValor = Right(pValor, Len(pValor) - pos)
        pos = InStr(1, pValor, ":", vbTextCompare)
        If pos = 0 Then
            strMinutos = Right(pValor, pos + 1)
        Else
            strSegundos = Right(pValor, Len(pValor) - (pos))
            strMinutos = Left(pValor, pos - 1)
        End If
        
        strHora = CompletarCerosaIzquierda(strHora, 2)
        strMinutos = CompletarCerosaIzquierda(strMinutos, 2)
        strSegundos = CompletarCerosaIzquierda(strSegundos, 2)
        pValor = strHora + ":" + strMinutos + ":" + strSegundos
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
        MsgBox "Falto formatearlo, el sistema no puede continuar", vbCritical + vbDefaultButton1, "Atención"
        FormatearValorSQL = Chr(39) + Trim(pValor) + Chr(39)
        End
    End Select
    
End Function


' Devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Public Function rs_resultados_valor(pnom_valor As Variant) As String
 
    If IsNull(lrs(pnom_valor).value) Then
        Select Case lrs(pnom_valor).Type
        Case adChar, adBSTR, adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
             adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rs_resultados_valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
             adDBDate, adDBTimeStamp, adDBTime, adBoolean
             rs_resultados_valor = 0
        End Select
    Else
        Select Case lrs(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rs_resultados_valor = Trim(lrs(pnom_valor).value)
        Case adBoolean
             If lrs(pnom_valor).value Then
                rs_resultados_valor = "1"
             Else
                rs_resultados_valor = "0"
             End If
        Case Else
             rs_resultados_valor = lrs(pnom_valor).value
        End Select
    End If
    
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


Public Function ExecSQL_Bacth(pStrSQLs As String)
Dim nPos As Integer
Dim strAux1 As String
Dim strAux2 As String

    lerror = ""
    objbasededatos.BeginTrans
    
    nPos = InStr(1, pStrSQLs, ";", vbTextCompare)
    
    Do Until nPos = 0
        strAux1 = Left(pStrSQLs, nPos - 1)
        strAux2 = Right(pStrSQLs, Len(pStrSQLs) - nPos - Len(";") + 1)
        If Not objbasededatos.ExecuteSQL(strAux1) Then
            ExecSQL_Bacth = False
            Exit Function
        End If
        pStrSQLs = strAux2
        nPos = InStr(1, pStrSQLs, ";", vbTextCompare)
    Loop
    
    objbasededatos.CommitTrans
    
    ExecSQL_Bacth = True

End Function


Private Function CompletarCerosaIzquierda(pValor As String, nrCantidadCeros As Integer) As String
Dim nI As Integer
Dim i As Integer

    nI = Len(pValor)
    For i = nI To nrCantidadCeros - 1
        pValor = "0" + pValor
    Next
    CompletarCerosaIzquierda = pValor
    
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
    
    rs.Open strSQL, , adOpenForwardOnly, adLockReadOnly, adCmdText
    
    ' si existió algun error devolvemos error
    If Err Then
        Screen.MousePointer = vbDefault
        lerror = Err.Description
        ExecStoredProcedures_Params = False
        Exit Function
    End If
    
    Set lrs = rs

    Screen.MousePointer = vbDefault
    On Error GoTo 0
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
        Case "MDB"
            strSQL = "select now()  AS FECHA"
        Case "MY_SQL"
            strSQL = "select CURRENT_TIMESTAMP AS FECHA"
        End Select
        
        If Not Me.ExecuteSQL(strSQL) Then
                lerror = "No se pudo obtener la fecha remota, SQL: " + strSQL
                Exit Function
             End If
        If Me.rs_resultados.EOF Then
           lerror = "No se pudo obtener la fecha remota, SQL: " + strSQL
           Exit Function
        End If
        getDateasString = Me.rs_resultados("FECHA")
             
End Function

