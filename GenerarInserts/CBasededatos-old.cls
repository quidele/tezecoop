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

' Variables locales del objeto
Private lobjConn                    As New ADODB.Connection
Private lError                      As String
Private ldsDSN                      As String
Private ldsUID                      As String
Private ldsMotorBD                  As String
Private ldsSistema                  As String
Private lrs                         As Object ' ADODB.Recordset
Private lrsLocal                    As Object ' ADODB.Recordset
Private lrsAuxiliar                 As Object ' ADODB.Recordset
Private objCapaDatos                As Object ' libJFwk.clsJFwk
Private lobjConnMDB                 As Object ' ADODB.Connection
Private lnom_mdbFile                As String
Private lstrUltSQL                  As String


' entrega el usuario NT de la RED
Property Get UltimoQuery() As String
    UltimoQuery = lstrUltSQL
End Property


' entrega el usuario NT de la RED
Property Get LegajoUsuario() As String
    LegajoUsuario = objCapaDatos.LegajoUsuario
End Property

' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Property Get base_Local() As Object     'ADODB.Connection
    Set base_Local = lobjConnMDB
End Property


' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Property Get rsResultadosAux() As Object   ' As ADODB.Recordset
    Set rsResultadosAux = lrsAuxiliar
End Property

Property Get rsResultados_local() As Object ' As ADODB.Recordset
    Set rsResultados_local = lrsLocal
End Property

' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Property Get rsResultados() As ADODB.Recordset
    Set rsResultados = lrs
End Property

' Abrir la transaccion
Public Sub BeginTrans()
    objCapaDatos.BeginTrans
End Sub

' Volver una transacion
Public Sub RollBackTrans()
    objCapaDatos.RollBackTrans
End Sub

' Procesar la transaccion
Public Sub CommintTrans()
    objCapaDatos.CommitTrans
End Sub

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

' devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Public Function rsResultadosAux_Valor(pnom_valor As String) As String

    If IsNull(lrsAuxiliar(pnom_valor).Value) Then
        Select Case lrs(pnom_valor).Type
        Case adChar, adBSTR, adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
             adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rsResultadosAux_Valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
             adDBDate, adDBTimeStamp, adDBTime, adBoolean
             rsResultadosAux_Valor = 0
        End Select
    Else
        Select Case lrsAuxiliar(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rsResultadosAux_Valor = Trim(lrsAuxiliar(pnom_valor).Value)
        Case Else
             rsResultadosAux_Valor = lrsAuxiliar(pnom_valor).Value
        End Select
    End If
    
End Function

' Devuelve los resultados conjuntos de datos
' que se obtengan del acceso a los datos
Public Function rsResultados_Local_Valor(pnom_valor As Variant) As String

    If IsNull(lrsLocal(pnom_valor).Value) Then
        Select Case lrsLocal(pnom_valor).Type
        Case adChar, adBSTR, adVariant, adBigInt, adInteger, adSmallInt, adTinyInt, _
             adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt, _
             adLongVarChar, adLongVarWChar, adLongVarBinary, adVarBinary, _
             adVarChar, adVarWChar, adWChar, adDate
             rsResultados_Local_Valor = vbNullString
        Case adCurrency, adDecimal, adDouble, adNumeric, adSingle, _
             adDBDate, adDBTimeStamp, adDBTime, adBoolean
             rsResultados_Local_Valor = 0
        End Select
    Else
        Select Case lrsLocal(pnom_valor).Type
        Case adChar, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
             rsResultados_Local_Valor = Trim(lrsLocal(pnom_valor).Value)
        Case Else
             rsResultados_Local_Valor = lrsLocal(pnom_valor).Value
        End Select
    End If
    
End Function


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lError
End Property


' declaracion de las propiedades del objeto
Property Get Perfiles() As Variant
    Perfiles = objCapaDatos.Perfiles
End Property

' DSN propiedad qque guarda el nombre del DSN del origen de datos
' lo usa la capa de acceso a datos
Property Get dsDSN() As String
    dsDSN = ldsDSN
End Property

Property Let dsDSN(Valor As String)
    ldsDSN = Valor
End Property


Property Let dsSistema(Valor As String)
    ldsSistema = Valor
End Property

Property Get dsUID() As String
    dsUID = ldsUID
End Property

Property Let dsUID(Valor As String)
    ldsUID = Valor
End Property

Property Get dsMotorBD() As String
    dsMotorBD = ldsMotorBD
End Property

Property Let dsMotorBD(Valor As String)
    ldsMotorBD = Valor
End Property

' Inicializa un perfil
Public Function InicializarSesionSegunPerfil(psPerfil As String) As Boolean
    InicializarSesionSegunPerfil = objCapaDatos.IniciarSesion(psPerfil)
End Function


' Realiza la inicialización de los objetos de
' la capa de datos @framework, devuelve true o false según
' el exito dela operación
Public Function abrirBD_Server() As Boolean
' Dim objcapa As libJFwk.clsJFwk

    On Error Resume Next
    Set objCapaDatos = CreateObject("libJFwk.clsJFwk")  '  New libJFwk.clsJFwk
    If Err Then
        lError = "Error al inicializar la capa de datos"
        abrirBD_Server = False
        Exit Function
    End If
    On Error GoTo 0
    objCapaDatos.DSN = Me.dsDSN
    objCapaDatos.Sistema = ldsSistema
    On Error Resume Next
    objCapaDatos.IniciarSesion
    If Err Then
        lError = Err.Description
    End If
    On Error GoTo 0
    If objCapaDatos.SessionID = "" Then
        abrirBD_Server = False
        Exit Function
    End If
    ' Configura formatos de fecha
    Configurar_Basededatos
    abrirBD_Server = True
    
End Function

' Realiza algunas configuraciones SQL para que durante la
' sesion el servidor responda de una forma particular
Private Sub Configurar_Basededatos()
Dim strSQL As String

        ' Configura formatos de fecha
        strSQL = "set dateformat ymd"
        objCapaDatos.EjecutarQry strSQL
        
End Sub


' Ejecuta stored procedures declarados en la base de datos
' devueldo true o falso
' tambien provoca la devolucion de datos a traves de la
' Propiedad rsResultados
Public Function ExecSQL(psSQL As String) As Boolean
Dim strSQL      As String
Dim iPuntero    As Integer
    
    iPuntero = Screen.MousePointer
    Screen.MousePointer = vbHourglass
    strSQL = "EXEC " + psSQL + "  "
    On Error Resume Next
    Set lrs = objCapaDatos.EjecutarQry(strSQL)
    If Err Then
        lError = Err.Description
        ExecSQL = False
        Screen.MousePointer = iPuntero
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    lstrUltSQL = psSQL
    ReDim mCampoOperadorValor(0 To 0)
    Screen.MousePointer = iPuntero
    ExecSQL = True
    
End Function


' Ejecuta stored procedures declarados en la base de datos
' devueldo true o falso
' tambien provoca la devolucion de datos a traves de la
' Propiedad rsResultados
Public Function ExecSQL_Aux(psSQL As String) As Boolean
Dim strSQL      As String
Dim iPuntero    As Integer
    
    iPuntero = Screen.MousePointer
    Screen.MousePointer = vbHourglass
    strSQL = "EXEC " + psSQL + "  "
    On Error Resume Next
    Set lrsAuxiliar = objCapaDatos.EjecutarQry(strSQL)
    If Err Then
        lError = Err.Description
        ExecSQL_Aux = False
        Screen.MousePointer = iPuntero
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    lstrUltSQL = psSQL
    ReDim mCampoOperadorValor(0 To 0)
    Screen.MousePointer = iPuntero
    ExecSQL_Aux = True
    
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
        lError = Err.Description
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

Public Function TienePermiso(psFuncion As String, Optional pTipo As String) As Boolean

    TienePermiso = objCapaDatos.TienePermiso(psFuncion, pTipo)
    
End Function



' cierra base de datos
Public Sub cerrarBD()
    Set lobjConn = Nothing
End Sub


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
        lError = Err.Description
        Debug.Assert lError
        abrirBD_Directo = False
    Else
        abrirBD_Directo = True
    End If
    On Error GoTo 0
    
End Function




' Esta function realiza el formateo de los parametros de tipo char,varchar
Public Function FormatearValorSQL(pValor As String, pTipo As String) As Variant

    If Trim(pValor) = "" Then
        FormatearValorSQL = "null"
        Exit Function
    End If
    Select Case UCase(pTipo)
    Case "BIT"
            pValor = ReemplazarPalabra(pValor, "True", "1")
            FormatearValorSQL = ReemplazarPalabra(pValor, "False", "0")
    Case "INT", "SMALLINT", "NUMERIC", "REAL", "NUMERIC"
            FormatearValorSQL = ReemplazarPalabra(pValor, ",", ".")
    Case "DATETIME"
        FormatearValorSQL = Chr(39) + Format(pValor, "YYYYMMDD HH:MM:SS") + Chr(39)
    Case "SMALLDATETIME"
        FormatearValorSQL = Chr(39) + Format(pValor, "YYYYMMDD") + Chr(39)
    Case "CHAR", "VARCHAR"
        FormatearValorSQL = Chr(39) + ReemplazarPalabra(Trim(pValor), "'", "''") + Chr(39)
    Case Else
        MsgBox "Falto formatearlo "
        FormatearValorSQL = Chr(39) + Trim(pValor) + Chr(39)
    End Select
    
End Function



' Esta function realiza el formateo de los parametros de tipo char,varchar
Public Function FormatearValorVB(pTipo As String, pValor As String) As Variant
    
    If Trim(pValor) = "" Then
        FormatearValorVB = Null
        Exit Function
    End If
    
    Select Case UCase(pTipo)
    Case "BIT", "INT", "SMALLINT", "NUMERIC", "REAL", "NUMERIC", "MONEY"
        FormatearValorVB = pValor
    Case "DATETIME"
        ' el segundo parametro de esta formula podria ser definido desde
        ' el formato_archivo
        On Error Resume Next
        FormatearValorVB = Format(pValor, "DD/MM/YYYY")
    Case "SMALLDATETIME"
        On Error Resume Next
        FormatearValorVB = Format(pValor, "DD/MM/YYYY HH:MM:SS")
    Case "CHAR", "VARCHAR"
        FormatearValorVB = Trim(pValor)
    Case Else
        MsgBox " Formato de especificadso en la funcion FormatearValorVB "
        FormatearValorVB = Trim(pValor)
    End Select
    
End Function

Public Function ValidarFormatoMDB(pTipo As String, pValor As String, pnrTamanioMax As Integer) As Boolean
Dim dia  As String
Dim mes  As String
Dim anio As String

    Select Case UCase(pTipo)
    Case "BIT", "INT", "SMALLINT", "NUMERIC", "REAL", "NUMERIC", "MONEY"
        ValidarFormatoMDB = True
     Case "DATETIME", "SMALLDATETIME"
        dia = Mid(pValor, 1, 2)
        mes = Mid(pValor, 4, 2)
        anio = Mid(pValor, 7, 4)
        
        If Not IsNumeric(dia) Or Not IsNumeric(mes) Or Not IsNumeric(anio) Then
            lError = "El formato de fecha es incorrecto, mofifique al formato DD/MM/YYYY"
            ValidarFormatoMDB = False
        End If
        If Not (CInt(dia) >= 1 And CInt(dia) <= 31) Then
            lError = "El formato de fecha es incorrecto, mofifique al formato DD/MM/YYYY"
            ValidarFormatoMDB = False
            Exit Function
        End If
        If Not (CInt(mes) >= 1 And CInt(mes) <= 12) Then
        lError = "El formato de fecha es incorrecto, mofifique al formato DD/MM/YYYY"
            ValidarFormatoMDB = False
            Exit Function
        End If
        If Not (CInt(anio) >= 1850) Then
            lError = "El formato de fecha es incorrecto, mofifique al formato DD/MM/YYYY"
            ValidarFormatoMDB = False
            Exit Function
        End If
        ValidarFormatoMDB = True
    Case "CHAR", "VARCHAR"
        If Len(pValor) > pnrTamanioMax Then
            ValidarFormatoMDB = False
            lError = "El Tamanio del campo supera el de su definición"
        Else
            ValidarFormatoMDB = True
        End If
    Case Else
        ValidarFormatoMDB = True
    End Select
    
End Function


Public Function abrirBD_Local() As Boolean
Dim strDriver           As String
Dim strDataSource       As String
Dim connectionString    As String
Dim DataBasePass        As String
Dim SQLServerName       As String
Dim SQLServerDatabase   As String


    If Not CrearMDBLocal Then
        abrirBD_Local = False
        Exit Function
    End If
    
    
    SQLServerName = lnom_mdbFile
    SQLServerDatabase = SQLServerName & "; Jet OLEDB:Database Password=; "
    connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin; " & "Data Source= " & SQLServerDatabase
    
    Set lobjConnMDB = CreateObject("ADODB.Connection")  ' New ADODB.Connection
    On Error Resume Next
    lobjConnMDB.Open connectionString
                                
    If Err Then
        lError = Err.Description
        Debug.Assert lError
        abrirBD_Local = False
    Else
        abrirBD_Local = True
    End If
    On Error GoTo 0
    
End Function


Public Function abrirBD_Local_Desde_Repositorio(strPathMDB As String, strNomMDB_Lote As String) As Boolean
Dim strDriver           As String
Dim strDataSource       As String
Dim connectionString    As String
Dim DataBasePass        As String
Dim SQLServerName       As String
Dim SQLServerDatabase   As String
Dim objArchivo          As New CArchivo
Dim strOrigen           As String
        
        
    If Not objArchivo.CopiarArchivo(strPathMDB + "\" + strNomMDB_Lote, App.Path + "\" + strNomMDB_Lote) Then
        lError = "Error al tratar de abrir los datos del resumen del lote. " + objArchivo.Error
        abrirBD_Local_Desde_Repositorio = False
        Exit Function
    End If
    
    SQLServerName = App.Path + "\" + strNomMDB_Lote
    SQLServerDatabase = SQLServerName & "; Jet OLEDB:Database Password=; "
    connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin; " & "Data Source= " & SQLServerDatabase
    
    Set lobjConnMDB = CreateObject("ADODB.Connection")  ' New ADODB.Connection
    On Error Resume Next
    lobjConnMDB.Open connectionString
                                
    If Err Then
        lError = Err.Description
        Debug.Assert lError
        abrirBD_Local_Desde_Repositorio = False
    Else
        abrirBD_Local_Desde_Repositorio = True
    End If
    On Error GoTo 0
    
End Function

' Corre local
Public Function ExecSQL_Local(psSQL As String) As Boolean
Dim strSQL      As String
Dim iPuntero    As Integer
    
    iPuntero = Screen.MousePointer
    Screen.MousePointer = vbHourglass
    strSQL = psSQL + "  "
    On Error Resume Next
    Set lrsLocal = CreateObject("ADODB.Recordset")  ' New ADODB.Recordset
    lrsLocal.Open strSQL, lobjConnMDB, adOpenDynamic, adLockOptimistic
    If Err Then
        lError = Err.Description
        ExecSQL_Local = False
        Screen.MousePointer = iPuntero
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    lstrUltSQL = psSQL
    ReDim mCampoOperadorValor(0 To 0)
    Screen.MousePointer = iPuntero
    ExecSQL_Local = True
    
End Function

Public Function ExecSQL_Local_desconectado(psSQL As String) As Boolean
Dim strSQL      As String
Dim iPuntero    As Integer
    
    iPuntero = Screen.MousePointer
    Screen.MousePointer = vbHourglass
    strSQL = psSQL + "  "
    On Error Resume Next
    Set lrsLocal = CreateObject("ADODB.Recordset")  ' New ADODB.Recordset
    lrsLocal.CursorType = adOpenStatic
    lrsLocal.MaxRecords = 4096 * 5
    lrsLocal.CacheSize = 4096 * 5
    lrsLocal.LockType = adLockBatchOptimistic
    lrsLocal.CursorLocation = adUseClient

    lrsLocal.Open strSQL, lobjConnMDB
    If Err Then
        lError = Err.Description
        ExecSQL_Local_desconectado = False
        Screen.MousePointer = iPuntero
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    lstrUltSQL = psSQL
    ReDim mCampoOperadorValor(0 To 0)
    Screen.MousePointer = iPuntero
    ExecSQL_Local_desconectado = True
    
End Function


Public Function EliminarTablaLocal(pnomTabla As String) As Boolean
Dim strSQL

    strSQL = "DROP Table " + pnomTabla
    On Error Resume Next
    lobjConnMDB.Execute (strSQL)
    If Err Then
        If Err.Number = -2147217865 Then
            EliminarTablaLocal = True
        Else
            lError = Err.Description
            EliminarTablaLocal = False
        End If
    Else
        EliminarTablaLocal = True
    End If
    On Error GoTo 0
    
End Function




' Esta function realiza el formateo de los parametros de tipo char,varchar
Private Function obtenerTipoMDB(pTipo As String, pTamanio As String) As String

    Select Case UCase(pTipo)
    Case "BIT"
        obtenerTipoMDB = "INTEGER"
    Case "INT"
        obtenerTipoMDB = "INTEGER"
    Case "SMALLINT"
        obtenerTipoMDB = "INTEGER"
    Case "NUMERIC"
        obtenerTipoMDB = "NUMERIC"
    Case "REAL"
        obtenerTipoMDB = "REAL"
    Case "NUMERIC"
        obtenerTipoMDB = "REAL"
    Case "DATETIME"
        obtenerTipoMDB = "DATETIME"
    Case "SMALLDATETIME"
        obtenerTipoMDB = "DATE"
    Case "CHAR", "VARCHAR"
        obtenerTipoMDB = "TEXT(" + pTamanio + ")"
    Case Else
        obtenerTipoMDB = "TEXT(" + pTamanio + ")"
    End Select
    
End Function


' Crea la base acess apartir de un archivo mdb vacio
Private Function CrearMDBLocal() As Boolean
Dim objArchivo    As New CArchivo
Dim strOrigen     As String
Dim strDestino     As String

    
    strOrigen = App.Path + "\dbEmulacion.mdbf"
    strDestino = App.Path + "\dbEmulacion.mdb"
    If Not objArchivo.CopiarArchivo(strOrigen, strDestino) Then
        lError = objArchivo.Error
        CrearMDBLocal = False
    Else
        CrearMDBLocal = True
        lnom_mdbFile = strDestino
    End If

End Function


' Crea la base acess apartir de un archivo mdb vacio
Public Function EliminarBasedelRepositorio(strPathMDB As String) As Boolean
Dim objArchivo    As New CArchivo

    On Error Resume Next
    If lobjConnMDB.State = adStateOpen Then
        lobjConnMDB.Close
    End If
    On Error GoTo 0
    
    If Not objArchivo.Eliminar(strPathMDB) Then
        lError = objArchivo.Error
        EliminarBasedelRepositorio = False
    Else
        EliminarBasedelRepositorio = True
    End If
    
End Function



' Crea la base acess apartir de un archivo mdb vacio
Public Function CopiarBaseLocalalRepositorio(strPathDestino As String, Optional pnom_mdb As String) As Boolean
Dim strDriver           As String
Dim strDataSource       As String
Dim connectionString    As String
Dim DataBasePass        As String
Dim SQLServerName       As String
Dim SQLServerDatabase   As String
Dim objArchivo          As New CArchivo
Dim strOrigen           As String

    If lobjConnMDB.State = adStateOpen Then
        lobjConnMDB.Close
    End If

    If pnom_mdb = "" Then
        strOrigen = App.Path + "\dbEmulacion.mdb"
    Else
        strOrigen = App.Path + "\" + pnom_mdb
    End If
    
    If Not objArchivo.CopiarArchivo(strOrigen, strPathDestino) Then
        lError = objArchivo.Error
        CopiarBaseLocalalRepositorio = False
        Exit Function
    End If
    
    ' abrir nuevamente la base de datos
    SQLServerName = strOrigen
    SQLServerDatabase = SQLServerName & "; Jet OLEDB:Database Password=; "
    connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin; " & "Data Source= " & SQLServerDatabase
    Set lobjConnMDB = CreateObject("ADODB.Connection") '  New ADODB.Connection
    On Error Resume Next
    lobjConnMDB.Open connectionString
    If Err Then
        lError = Err.Description
        Debug.Assert lError
    End If
    On Error GoTo 0
    CopiarBaseLocalalRepositorio = True
    
End Function

' Crea la base acess apartir de un archivo mdb vacio
Public Function EliminarBaseLocal() As Boolean
Dim objArchivo    As New CArchivo
Dim strOrigen     As String

    strOrigen = App.Path + "\dbEmulacion.mdb"
    On Error Resume Next
    If lobjConnMDB.State = adStateOpen Then
        lobjConnMDB.Close
    End If
    On Error GoTo 0
    
    If Not objArchivo.Eliminar(strOrigen) Then
        lError = objArchivo.Error
        EliminarBaseLocal = False
    Else
        EliminarBaseLocal = True
    End If
    
End Function


' Crea la base acess apartir de un archivo mdb vacio
Public Function EliminarBaseLocal_de_Lote(pnom_archivo As String) As Boolean
Dim objArchivo    As New CArchivo
Dim strOrigen     As String

    strOrigen = App.Path + "\" + pnom_archivo
    On Error Resume Next
    If lobjConnMDB.State = adStateOpen Then
        lobjConnMDB.Close
    End If
    On Error GoTo 0
    
    If Not objArchivo.Eliminar(strOrigen) Then
        lError = objArchivo.Error
        EliminarBaseLocal_de_Lote = False
    Else
        EliminarBaseLocal_de_Lote = True
    End If
    
End Function

