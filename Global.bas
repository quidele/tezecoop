Attribute VB_Name = "Global"

Option Explicit

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Global Const FACTURACION_REMOTA = "FACTURACION_REMOTA"
Global Const ADMINISTRACION = "ADMINISTRACION"
Global Const MAX_VALOR_COMPROBANTE = 99999999
Global Const CANTIDAD_DECIMALES = 2
Global Const MODO_DEBUG = 0

Global objbasededatos           As CBasededatos
Global objDiccionariodeDatos    As CDiccionariodeDatos
Global ObjTablasIO              As CTablasIO
Global objConfig                As New CConfig
Global objConfigRegional        As New CConfigRegional

Global objParametros            As New CParametros
Global objCajas                 As New CCajas
Global objExportar              As New CExport
Global objUsuario               As New CUsuario
Global objProductos             As New CProductos
Global objMovimientos           As New CMovimientosConta
Global objComision              As New CComisiones
Global objIPAddress             As CIPAddress
Global objSPs                   As New CStoredProceduresIO
Global objSeguridad             As New CSeguridad
Global objEjeSincronizador      As New CEjeProgramas
Global objGUI                   As New CGUI
Global objCtaCteLic             As New CCtaCteLicenciatario
Global objComprobante           As New CComprobantes
Global objCliente               As New CCliente
Global objPuestos               As New CPuestos
Global objLog                   As New CArchivo
Global objAuditorias            As New CAuditorias
Global objAFIP                  As New CAFIP

Global Const WindowsFolder = 0
Global Const crptMaximized = 2
Global Const crptToPrinter = 1
Global Const crptToWindow = 0
Global Const DEFAULT_PWD = "1234"
Global Const DEFAULT_USRPARAM = "USRPARAM"


Global Azul     As Long
Global Amarillo As Long
Global Blanco   As Long
Global Gris     As Long
Global Rojo     As Long
Global Verde    As Long
Global Marron   As Long
Global Naranja  As Long



Enum ABM
    alta
    Baja
    modificacion
    Consulta
    CerrarCaja
    cajasincerrar
    facturar
End Enum


Public Function crearFactoryDAO(ptpModo_Operacion As String) As Boolean

    
    If ptpModo_Operacion = FACTURACION_REMOTA Then
        objEjeSincronizador.EjecutarSincronizador objConfig.Ruta_Sincronizador
        Set objbasededatos = New CMySQLBasededatos
        Set objDiccionariodeDatos = New CMySQLDiccDatos
        Set ObjTablasIO = New CMySQLTablasIO
    Else
       ' ADMINISTRACION
        Set objbasededatos = New CBasededatos
        Set objDiccionariodeDatos = New CDiccionariodeDatos
        Set ObjTablasIO = New CTablasIO
    End If
    

End Function


'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
' /*                   PROGRAMA INICIAL                          */
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/
'/****************************************************************/


Sub Main()
Dim lnrCaja As String

    If App.LogMode = MODO_DEBUG Then
        ' Realizar Pruebas
        Modulo_Pruebas.EjecutarPruebas
    End If

    objConfigRegional.ConfigurarSistema
    
    
     Azul = RGB(0, 0, 255)
     Amarillo = RGB(255, 255, 185)
     Blanco = RGB(255, 255, 255)
     Gris = &HE0E0E0       ' RGB(230, 230, 230)
     Rojo = RGB(255, 113, 113)
     Verde = RGB(64, 196, 73)
     Marron = RGB(255, 128, 64)
     Naranja = RGB(249, 152, 21)
    
    
    objConfig.CargarINI
    
    If objConfig.GrabaLog = "SI" Then
        objLog.GrabaLog = "SI"
        objLog.crearNombreArchivo
    End If
    
    crearFactoryDAO objConfig.tpModo_Operacion
      
    objParametros.GrabarValor "nrPuesto", objConfig.nrPuesto
    objbasededatos.dsDSN = objConfig.dsDSN
    objbasededatos.dsUID = objConfig.dsUID
    objbasededatos.dsMotorBD = objConfig.dsMotorBD
    
    Select Case objbasededatos.dsMotorBD
    Case "MY_SQL"
        On Error Resume Next
        objbasededatos.nmServidor = objConfig.nmServidor
        If Err Then
            MsgBox "ERROR: no se puede iniciar el modo local, verifique la propiedad 'dsMotorBD'.", vbCritical, "Atención"
            End
        End If
        On Error GoTo 0
        objbasededatos.nmBasededatos = objConfig.nmBasededatos
    Case "SQL_SERVER"
    Case "MDB"
    End Select
    
    
    Set objbasededatos.ConfigRegional = objConfigRegional
    
    If Not objbasededatos.abrirBD Then
        If objbasededatos.Error = "[Shared Memory]SQL Server does not exist or access denied." Then
            MsgBox "No se ha establecido la conexión con el Servidor." + vbCrLf + _
                   "Por favor verifique si la VPN se encuentra abierta. " + vbCrLf + _
                   "Vuelva a internar la operación, si persiste el problema comuníquese" + _
                   " con el administrador del sistema.", vbCritical, _
                   "Falló la conexión con el Servidor."
        Else
            MsgBox objbasededatos.Error
        End If
        End
    End If
    
    Set objDiccionariodeDatos.Basededatos = objbasededatos
    If Not objDiccionariodeDatos.InicializarDiccionario() Then
        MsgBox objDiccionariodeDatos.Error
        End
    End If
    
    ObjTablasIO.dsMotorBD = objConfig.dsMotorBD
    Set ObjTablasIO.Basededatos = objbasededatos
    
    Set ObjTablasIO.DiccionarioDeDatos = objDiccionariodeDatos
    Set objDiccionariodeDatos.TablasIO = ObjTablasIO
    Set objCajas.Basededatos = objbasededatos
    Set objCajas.ObjTablasIO = ObjTablasIO
    Set objMovimientos.ObjTablasIO = ObjTablasIO
    Set objExportar.objDiccionariodeDatos = objDiccionariodeDatos
    
    ' inicializacion del objeto Stores Procedures
    objSPs.dsMotorBD = objConfig.dsMotorBD
    Set objSPs.Basededatos = objbasededatos
    Set objSPs.DiccionarioDeDatos = objDiccionariodeDatos
    Set objSPs.lobjConfigRegional = objConfigRegional
    
    
    
    frm_Splash.Show 1
    
    CrearCarpeta objConfig.dsPathTemp
    
    
    ' validando el acceso del usuario
    Frm_Acceso.Show 1

    objUsuario.ValidarUsuario
    
    If objUsuario.tpAcceso = "Puestos" And objConfig.nrPuesto = "9" Then
        MsgBox "Prohibido el acceso a los usuarios de los 'Puestos'.", vbCritical
        End
    End If
    
    If objUsuario.tpAcceso = "Administración" And objConfig.nrPuesto <> "9" Then
        MsgBox "Prohibido el acceso a los usuarios de la 'Administración'.", vbCritical
        End
    End If
    
    '/* inicia version 2.7 */
    If objCajas.hayCajasModificadasporAdministracion() Then
        MsgBox "Existen cajas modificadas por la admministración con estado 'Pendiente' de aprobación o rechazo," + vbCrLf + _
               "para realizar dicha tarea ingrese a 'Maestros -> Manejo de Caja -> Cajas Pendientes'.", vbInformation + vbDefaultButton1
    End If
    ' objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
    ' resolver la aprobacion o rechazo de las cajas pendientes de aprobacion
    ' objCajas.AprobarRechazarCajaPuesto
    ' objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
    '/* fin version 2.7 */
    
    If UCase(objUsuario.dsPassword) = UCase(objbasededatos.hashCadena(DEFAULT_PWD)) Then
        frm_CambiarPassword.Show vbModal
        If objParametros.ObtenerValor("CAMBIO_CLAVE") = "NO" Then
            End
        End If
    End If
    
    Select Case objUsuario.tpAcceso
    Case "Puestos", "Administración"
    
        If objUsuario.tpAcceso = "Administración" And objConfig.dsMotorBD = "MY_SQL" Then
            MsgBox "La configuración actual no permite ingresar al sistema con el perfil de administración.", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        
        '/***************************************************/
        ' agregado en la version 2.9
                If objCajas.hayCajasRechazadasporlaCajera() Then
                    MsgBox "Existen cajas puestos Rechazadas.", vbInformation + vbDefaultButton1, "Atención"
                End If
        '/***************************************************/
        
        objConfig.AbreCaja = "SI"
        If Not objConfig.ObtenerValoresEuroyDolaryPromoyComisionRetorno Then
            MsgBox objConfig.dsError + vbCrLf + "El programa no puede iniciarse.", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        
        lnrCaja = objCajas.ObtenerCajaAbiertadelUsuario(objParametros.ObtenerValor("dsUsuario"))
        objParametros.GrabarValor "dsObservacion", ""
        
        If lnrCaja = "" Then
            ' Si esta en blanco
            objParametros.GrabarValor "frm_ABMCaja", "Alta"
            Select Case objUsuario.tpAcceso
            Case "Puestos"
                frm_ABMCaja.Show 1
            Case "Administración"
                frm_ABMCajaADM.Show 1
            End Select
            If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
                End
            Else
                ' objConfig.nrUltimaCaja = objParametros.ObtenerValor("nrCaja")
                objConfig.GuardarINI
            End If
        Else
            ' tiene un numero de caja
            MsgBox "El sistema esta reabrindo una caja que usted dejó abierta.", vbInformation, "Atención"
            objParametros.GrabarValor "nrCaja", lnrCaja
            objParametros.GrabarValor "frm_ABMCaja", "CajaSinCerrar"
            Select Case objUsuario.tpAcceso
            Case "Puestos"
                ' No se Muestra el detalle Modificación solicitada por Adrian
                ' objParametros.GrabarValor "frm_ABMCajaV2", "CajaSinCerrar"
                ' frm_ABMCajaV2.Show 1
            
                objParametros.GrabarValor "CajaAbierta", "SI"
                ' Obtenemos los valores la Cotización de Dolar y Euro
                objParametros.GrabarValor "vlDiaDolar", objConfig.vlDiaDolar
                objParametros.GrabarValor "vlDiaEuro", objConfig.vlDiaEuro
            Case "Administración"
                frm_ABMCajaADM.Show 1
            End Select
            
            ' Comentario en la version 2.5
            'If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
                ' Verificar el sentido de este código
                ' End
            ' End If
            objConfig.GuardarINI
            
        End If
    Case Else
        objConfig.AbreCaja = "NO"
                
        If Not objConfig.ObtenerValoresEuroyDolaryPromoyComisionRetorno Then
            MsgBox "Los valores de Dolar, Euro o Retorno no estan bien configurados," + vbCrLf + _
            " por favor vaya a la pantalla de conceptos para arreglar estos valores." _
            + vbCrLf + "Error Extendido: " + objConfig.Error, vbCritical + vbDefaultButton1, "Atención"
            
        End If
        
        objParametros.GrabarValor "vlDiaDolar", objConfig.vlDiaDolar
        objParametros.GrabarValor "vlDiaEuro", objConfig.vlDiaEuro
        
    End Select
    
    ' Agregado en la version 4.1
    Select Case objUsuario.tpAcceso
    Case "Puestos"
    Case Else
        objAFIP.mostrarTalonariosVencimientoCAI
    End Select
    
    
'   Dim strSQL As String
'
'   strSQL = " alter  procedure sp_marcarTipodeActualizacionCajaPuesto_v3_7(" + vbCrLf + _
'        " @nrTalonario_param          as varchar(4)," + vbCrLf + _
'        "  @nrComprobante_param        as varchar(8)," + vbCrLf + _
'        "  @tpComprobante_param        as varchar(4)," + vbCrLf + _
'        " @tpLetra_param              as varchar(2)," + vbCrLf + _
'        " @tpModificacionCajaPuesto_param  varchar(50), /* Agregado, Eliminado, Anulado, Modificado*/  " + vbCrLf + _
'        "                           /* En Analisis: Desanulado, Deseliminado */ " + vbCrLf + _
'        " @dsObservacionCajaPuesto_param   varchar(400)=null) " + vbCrLf + _
'        " as " + vbCrLf + _
'        " begin " + vbCrLf + _
'         "    Update [TB_Comprobantes] " + vbCrLf + _
'         "    set  tpModificacionCajaPuesto = @tpModificacionCajaPuesto_param, " + vbCrLf + _
'         "         dsObservacionCajaPuesto  = left(@tpModificacionCajaPuesto_param+': '+ isnull(@dsObservacionCajaPuesto_param,'') + ' / '+isnull(dsObservacionCajaPuesto,''),400) " + vbCrLf + _
'         "    Where " + vbCrLf + _
'         "         nrTalonario =  @nrTalonario_param    and " + vbCrLf + _
'          "        nrComprobante = @nrComprobante_param and " + vbCrLf + _
'            "          tpComprobante = @tpComprobante_param and " + vbCrLf + _
'             "     tpLetra = @tpLetra_param " + vbCrLf + "End /* DESDE VB */ "
'
'    If App.LogMode = MODO_DEBUG Then
'        ' Realizar Pruebas
'        MsgBox strSQL
'    End If
            
    ' objbasededatos.ExecuteSQL (strSQL)
             

    
    Frm_Principal.Show
    
End Sub



Public Function ReemplazarPalabra(pCadena As String, _
  pPalabraIn As String, pPalabraOut As String) As String
Dim nPos As Integer
Dim strAux1 As String
Dim strAux2 As String


    nPos = InStr(1, pCadena, pPalabraIn, vbTextCompare)
    If nPos > 0 Then
        strAux1 = Left(pCadena, nPos - 1)
        strAux2 = Right(pCadena, Len(pCadena) - nPos - Len(pPalabraIn) + 1)
        strAux1 = strAux1 + pPalabraOut + ReemplazarPalabra(strAux2, pPalabraIn, pPalabraOut)
        ReemplazarPalabra = strAux1
        Exit Function
    End If
    ReemplazarPalabra = pCadena
    
End Function



Public Function AdaptarNulos(pDato As Variant, valordefecto As Variant)
    
    
    If IsNull(pDato) Then
        AdaptarNulos = valordefecto
    Else
        If CStr(pDato) = "" Then
            AdaptarNulos = valordefecto
        Else
            AdaptarNulos = CStr(pDato)
        End If
    End If
    
End Function



Public Function ObtenerElAltoDeLaResolucion() As Integer
    ObtenerElAltoDeLaResolucion = (Screen.Height / Screen.TwipsPerPixelY)
End Function

Public Function ObtenerElAnchoDeLaResolucion() As Integer
    ObtenerElAnchoDeLaResolucion = (Screen.Width / Screen.TwipsPerPixelX)
End Function

Public Function ExisteElArchivo(strPathDelArchivo As String) As Boolean
    Dim FSO
    Dim Canal
    
    ExisteElArchivo = False
    Set FSO = CreateObject("Scripting.FileSystemObject")
    If InStr(1, strPathDelArchivo, "\", vbTextCompare) = 0 Then strPathDelArchivo = FSO.GetSpecialFolder(WindowsFolder) & "\" & strPathDelArchivo
    If FSO.FileExists(strPathDelArchivo) Then ExisteElArchivo = True
    Set FSO = Nothing
    
    
End Function


Public Function CrearCarpeta(strPath As String) As Boolean
    
    
    On Error Resume Next
    MkDir (strPath)
    On Error GoTo 0
    
End Function

Public Function AdaptarValorNumerico(pValor As String) As Single

    If Trim(pValor) = "" Then
        AdaptarValorNumerico = 0
    Else
        AdaptarValorNumerico = CSng(pValor)
    End If
    

End Function


Public Function ObtenerDatoDelRegistrodeWindows(pEntrada As String, pClave As String) As String

    ObtenerDatoDelRegistrodeWindows = GetSetting(pEntrada, "General Settings", pClave)
    
End Function


Public Function AdaptarTrueFalse(pControl As Control, ByVal Valor As String) As Variant

    AdaptarTrueFalse = Valor
    
    If LCase(Mid(pControl.Tag, 1, 2)) = "fl" Then
        If UCase(Valor) = "VERDADERO" Or UCase(Valor) = "TRUE" Then AdaptarTrueFalse = vbChecked
        If UCase(Valor) = "FALSE" Or UCase(Valor) = "FALSO" Then AdaptarTrueFalse = vbUnchecked
    Else
        If UCase(Valor) = "VERDADERO" Or UCase(Valor) = "TRUE" Then AdaptarTrueFalse = True
        If UCase(Valor) = "FALSE" Or UCase(Valor) = "FALSO" Then AdaptarTrueFalse = False
    End If

End Function

Public Sub Error_de_Conexion()

    MsgBox "Se ha producido un error en la conexion, imposible continuar, el sistema se cerrará.", vbCritical + vbDefaultButton1, "Atención"
    End
    
End Sub
