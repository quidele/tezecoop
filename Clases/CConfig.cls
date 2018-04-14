VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit


Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Public nrPuesto             As String
Public AbreCaja             As String
Public dsMotorBD            As String
Public dsDSN                As String
Public dsUID                As String
Public vlDiaDolar           As String
Public vlDiaEuro            As String
Public vlDiaReal            As String
Public vlComisionRetorno    As String
Public nrCantidadRenglones  As String
Public nrCUIT               As String
Public dsPathTemp           As String
Public dsError              As String
Public dsUsuario            As String
Public tpImpresion          As String
Public dsleyendaCopia       As String
Public vlValorPromo         As String
Public nrTamanioCodBarra    As Integer
Public nrCantidaddeCopias   As Integer
Public Cantidad_Intentos_Cierre As String
Public Cantidad_copias_cierre_caja_Puesto As String
Public Carga_Manual_TodoslosPuestos As String
Public Sub_Path_Reportes    As String

Public dsUsuarioBD             As String
Public nmBasededatos         As String
Public nmServidor            As String
Public Carpeta_mySQL_bin     As String
Public tpModo_Operacion       As String
Public Carpeta_Sincronizacion        As String
Public nmUnidadxDefecto              As String
Public Ruta_Sincronizador            As String
Public GrabaLog                      As String
Public Ruta_CargaMaestros            As String



Dim lerror As String

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property


'*********************************************************************

Public Function ObtenerEntrada(strEntrada As String, strSeccion As String, bMensaje As Boolean) As String
    Dim strDefault As String
    Dim iLen As Integer
   
    Dim arrCarpeta As String * 255
    iLen = GetPrivateProfileString(strSeccion, strEntrada, strDefault, arrCarpeta, 255, App.Path & "\" & "Config.INI")
    If (iLen = 0) Then
        If bMensaje Then MsgBox "Falta la entrada '" & strEntrada & "'.", vbCritical, "Atención"
        ObtenerEntrada = ""
        Exit Function
    End If
    
    ObtenerEntrada = Left(arrCarpeta, iLen)
    
End Function

Public Function ObtenerEntradaDefecto(strEntrada As String, strSeccion As String, bMensaje As Boolean, strDefault As String) As String
    Dim iLen As Integer
   
    Dim arrCarpeta As String * 255
    iLen = GetPrivateProfileString(strSeccion, strEntrada, strDefault, arrCarpeta, 255, App.Path & "\" & "Config.INI")
    If (iLen = 0) Then
        If bMensaje Then MsgBox "Falta la entrada '" & strEntrada & "'.", vbCritical, "Atención"
        ObtenerEntradaDefecto = ""
        Exit Function
    End If
    
    ObtenerEntradaDefecto = Left(arrCarpeta, iLen)
    
End Function

Public Sub GuardarEntrada(strEntrada As String, strSeccion As String, strDefault As String)
    Dim iLen As Integer
   
    Dim arrCarpeta As String * 255
    iLen = WritePrivateProfileString(strSeccion, strEntrada, strDefault, App.Path & "\" & "Config.INI")
    If (iLen = 0) Then
        MsgBox "Falta la entrada '" & strEntrada & "'.", vbCritical, "Atención"
        Exit Sub
    End If
    
End Sub


Public Function CargarINI()

    
    Me.nrPuesto = ObtenerEntrada("nrPuesto", "TERMINAL", True)
    ' Me.nrUltimaCaja = ObtenerEntrada("nrUltimaCaja", "TERMINAL", True)
    Me.dsMotorBD = ObtenerEntrada("dsMotorBD", "TERMINAL", True)
    Me.dsDSN = ObtenerEntrada("dsDSN", "TERMINAL", True)
    Me.dsUID = ObtenerEntrada("dsUID", "TERMINAL", True)
    Me.nrCantidadRenglones = ObtenerEntrada("nrCantidadRenglones", "TERMINAL", True)
    Me.nrCUIT = ObtenerEntrada("nrCUIT", "TERMINAL", True)
    Me.dsPathTemp = ObtenerEntrada("dsPathTemp", "TERMINAL", True)
    Me.dsUsuario = ObtenerEntrada("dsUsuario", "TERMINAL", True)
    Me.tpImpresion = UCase(ObtenerEntrada("tpImpresion", "TERMINAL", True))
    Me.dsleyendaCopia = ObtenerEntrada("dsleyendaCopia", "TERMINAL", True)
    Me.nrCantidaddeCopias = ObtenerEntrada("nrCantidaddeCopias", "TERMINAL", True)
    Me.Cantidad_Intentos_Cierre = ObtenerEntrada("Cantidad_Intentos_Cierre", "TERMINAL", True)
    Me.Cantidad_copias_cierre_caja_Puesto = ObtenerEntrada("Cantidad_copias_cierre_caja_Puesto", "TERMINAL", True)
    Me.Carga_Manual_TodoslosPuestos = ObtenerEntrada("Carga_Manual_TodoslosPuestos", "TERMINAL", True)
    
    If IsNumeric(ObtenerEntrada("nrTamanioCodBarra", "TERMINAL", True)) Then
        nrTamanioCodBarra = ObtenerEntrada("nrTamanioCodBarra", "TERMINAL", True)
    Else
        MsgBox "El valor campo nrTamanioCodBarra del archivo de Configuración INI es erroneo.", vbCritical + vbDefaultButton1, "Atención"
        End
    End If
    
    
    Me.dsUsuarioBD = ObtenerEntrada("dsUsuarioBD", "TERMINAL", True)
    Me.nmBasededatos = ObtenerEntrada("nmBasededatos", "TERMINAL", True)
    Me.nmServidor = ObtenerEntrada("nmServidor", "TERMINAL", True)
    Me.Carpeta_mySQL_bin = ObtenerEntrada("Carpeta_mySQL_bin", "TERMINAL", True)
    Me.tpModo_Operacion = ObtenerEntrada("tpModo_Operacion", "TERMINAL", True)
    Me.Sub_Path_Reportes = ObtenerEntrada("Sub_Path_Reportes", "TERMINAL", True)
    Me.Carpeta_Sincronizacion = ObtenerEntrada("Carpeta_Sincronizacion", "TERMINAL", True)
    Me.nmUnidadxDefecto = ObtenerEntrada("nmUnidadxDefecto", "TERMINAL", True)
    Me.Ruta_Sincronizador = ObtenerEntrada("Ruta_Sincronizador", "TERMINAL", True)
    Me.Ruta_CargaMaestros = ObtenerEntrada("Ruta_CargaMaestros", "TERMINAL", True)
    Me.GrabaLog = ObtenerEntrada("GrabaLog", "TERMINAL", False)

End Function


Public Function GuardarINI()

    GuardarEntrada "nrPuesto", "TERMINAL", Me.nrPuesto
    ' GuardarEntrada "nrUltimaCaja", "TERMINAL", Me.nrUltimaCaja
    GuardarEntrada "dsMotorBD", "TERMINAL", Me.dsMotorBD
    GuardarEntrada "dsDSN", "TERMINAL", Me.dsDSN
    GuardarEntrada "dsUID", "TERMINAL", Me.dsUID
    GuardarEntrada "nrCantidadRenglones", "TERMINAL", Me.nrCantidadRenglones
    GuardarEntrada "dsUsuario", "TERMINAL", Me.dsUsuario
    GuardarEntrada "tpImpresion", "TERMINAL", Me.tpImpresion
    
End Function



Public Function ObtenerValoresEuroyDolaryPromoyComisionRetorno() As Boolean


    ObjTablasIO.nmTabla = "TB_Parametros"
    ObjTablasIO.setearCampoOperadorValor "vlParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsParametro", "=", "VALOR EURO"
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Me.dsError = "No existe el concepto para el valor euro"
        ObtenerValoresEuroyDolaryPromoyComisionRetorno = False
        Exit Function
    Else
        Me.vlDiaEuro = ObjTablasIO.rs_resultados("vlParametro").value
    End If
    
    ObjTablasIO.nmTabla = "TB_Parametros"
    ObjTablasIO.setearCampoOperadorValor "vlParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsParametro", "=", "VALOR DOLAR"
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Me.dsError = "No existe el concepto para el valor Dolar"
        Me.vlDiaDolar = ""
        ObtenerValoresEuroyDolaryPromoyComisionRetorno = False
        Exit Function
    Else
        Me.vlDiaDolar = ObjTablasIO.rs_resultados("vlParametro").value
    End If
    
    If objbasededatos.ExecStoredProcedures("SP_ValorPromoRetorno") Then
        Me.vlValorPromo = "$ " + FormatNumber(objbasededatos.rs_resultados("ValorPromo"), 0) + ".-"
    End If
    ObtenerValoresEuroyDolaryPromoyComisionRetorno = True
    
    ' obtencion de la comision de retorno
    ObjTablasIO.nmTabla = "TB_Comisiones"
    ObjTablasIO.setearCampoOperadorValor "vlMontoMinimo", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpComision", "=", "Retorno", " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"

    ObjTablasIO.Seleccionar
    
    
    If ObjTablasIO.rs_resultados.EOF Then
        Me.dsError = "No existe la comisión de 'Retorno'."
        lerror = "No existe la comisión de 'Retorno'."
        Me.vlComisionRetorno = "1"
        ObtenerValoresEuroyDolaryPromoyComisionRetorno = False
        Exit Function
    Else
        Me.vlComisionRetorno = ObjTablasIO.rs_resultados("vlMontoMinimo").value
    End If
    
    ' obtenemos la cotización del Real
  
    ObjTablasIO.nmTabla = "TB_Parametros"
    ObjTablasIO.setearCampoOperadorValor "vlParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsParametro", "=", "VALOR REAL"
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Me.dsError = "No existe el concepto para el valor Real"
        Me.vlDiaReal = 0
        ObtenerValoresEuroyDolaryPromoyComisionRetorno = False
        Exit Function
    Else
        Me.vlDiaReal = ObjTablasIO.rs_resultados("vlParametro").value
    End If
    
    
End Function

