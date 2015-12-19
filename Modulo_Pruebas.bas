Attribute VB_Name = "Modulo_Pruebas"
Dim strResultadoPruebas As String

Private Function inicializarAmbientePruebas() As Boolean

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
    


End Function

Public Sub EjecutarPruebas()
Dim resp As Integer

    inicializarAmbientePruebas
    
    strResultadoPruebas = ""
    ' If Not Prueba_ObtenerTalonariosND() Then strResultadoPruebas = strResultadoPruebas + vbCrLf + "Error en Prueba_ObtenerTalonariosND " + vbCrLf
    ' If Not Prueba_ObtenerTalonariosNDRICtaCte() Then strResultadoPruebas = strResultadoPruebas + vbCrLf + "Error en Prueba_ObtenerTalonariosNDRICtaCte " + vbCrLf
    ' If Not Prueba_sco_Puestos_v4_7_ndync() Then strResultadoPruebas = strResultadoPruebas + "Error en Prueba_sco_Puestos_v4_7_ndync " + vbCrLf
    ' If Not Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0() Then strResultadoPruebas = strResultadoPruebas + "Error en Prueba_sco_Puestos_v4_7_ndync " + vbCrLf
    
    
        
    If strResultadoPruebas <> "" Then
        MsgBox strResultadoPruebas
        End
    End If
    
    resp = MsgBox("Las Pruebas se ejecutaron OK, Desea Continuar la Ejecucion del Programa?", vbYesNo + vbDefaultButton2)
    If resp = vbNo Then End


End Sub





Public Function Prueba_ObtenerTalonariosND() As Boolean

    If objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND") <> 4 Then
        strResultadoPruebas = "Error PUESTO_FACTURACION_ND <>  4 "
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
   '***********************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_obtener_puntosdeventa_facturacion_v4_7"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Contado"
    objSPs.setearCampoValor "@tpComprobante", "ND"

    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
           
    If objbasededatos.rs_resultados("nrTalonario") <> 8 Then
        strResultadoPruebas = "Error nrTalonario <>  8 "
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("tpLetra") <> "B" Then
        strResultadoPruebas = "Error tpLetra <>  B "
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("nrCAI") <> "35063106681863" Then
        strResultadoPruebas = "Error nrCAI <>  35063106681863 "
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("dtCAI") <> "14/01/2017" Then
        strResultadoPruebas = "Error dtCai, VALOR ESPERADO  2017-01-14 00:00:00.000 VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("dtCAI"))
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("flFacturaCtacte") <> True Then
        strResultadoPruebas = "Error flFacturaCtacte, VALOR ESPERADO  True VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("flFacturaCtacte"))
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("nrComprobante") <> 1 Then
        strResultadoPruebas = "Error nrComprobante, VALOR 1  True VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante"))
        Prueba_ObtenerTalonariosND = False
        Exit Function
    End If
    
    Prueba_ObtenerTalonariosND = True
    
End Function




Public Function Prueba_ObtenerTalonariosNDRICtaCte() As Boolean

    If objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND") <> 4 Then
        strResultadoPruebas = "Error PUESTO_FACTURACION_ND <>  4 "
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
   '***********************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_obtener_puntosdeventa_facturacion_v4_7"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Cuenta Corriente"
    objSPs.setearCampoValor "@tpComprobante", "ND"

    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
           
    If objbasededatos.rs_resultados("nrTalonario") <> 0 Then
        strResultadoPruebas = "Error nrTalonario <>  0 "
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    If Trim(objbasededatos.rs_resultados("tpLetra")) <> "X" Then
        strResultadoPruebas = "Error tpLetra  VALOR ESPERADO  X  VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("tpLetra"))
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("nrCAI") <> Null Then
        strResultadoPruebas = "Error nrCAI <>  null "
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("dtCAI") <> Null Then
        strResultadoPruebas = "Error dtCai, VALOR ESPERADO  null VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("dtCAI"))
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("flFacturaCtacte") <> True Then
        strResultadoPruebas = "Error flFacturaCtacte, VALOR ESPERADO  True VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("flFacturaCtacte"))
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("nrComprobante") <> 3 Then
        strResultadoPruebas = "Error nrComprobante, VALOR ESPERADO 3   VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante"))
        Prueba_ObtenerTalonariosNDRICtaCte = False
        Exit Function
    End If
    
    Prueba_ObtenerTalonariosNDRICtaCte = True
    
End Function

Public Function Prueba_sco_Puestos_v4_7_ndync() As Boolean
    Dim l_strResultadoPruebas As String
    
    Prueba_sco_Puestos_v4_7_ndync = False

    l_strResultadoPruebas = ""

    If objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND") <> 4 Then
        l_strResultadoPruebas = "Error PUESTO_FACTURACION_ND <>  4 "
        Exit Function
    End If
    
      '***********************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "sco_Puestos_v4_7"
    objSPs.setearCampoValor "@nrPuesto_param", objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND")
    
    If Not objSPs.ExecSP Then
        l_strResultadoPruebas = "Error al ejecutar sco_Puestos_v4_7 " + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Exit Function
    End If
    
    If objbasededatos.rs_resultados("nrComprobante_automatico_nd_ult") <> 1 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_automatico_nd_ult , VALOR ESPERADO    1    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_automatico_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_auto_empresa_nd_ult") <> 2 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_auto_empresa_nd_ult   , VALOR ESPERADO    2    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_auto_empresa_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_auto_ctacte_nd_ult") <> 3 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_auto_ctacte_nd_ult    , VALOR ESPERADO    3    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_auto_ctacte_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_nd_ult") <> 4 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_nd_ult , VALOR ESPERADO    4    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_empresa_nd_ult") <> 5 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_empresa_nd_ult , VALOR ESPERADO    5    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_empresa_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_ctacte_nd_ult") <> 6 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_ctacte_nd_ult  , VALOR ESPERADO    6    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_ctacte_nd_ult"))
    If objbasededatos.rs_resultados("nrComprobante_automatico_nc_ult") <> 7 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_automatico_nc_ult , VALOR ESPERADO    7    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_automatico_nc_ult"))
    If objbasededatos.rs_resultados("nrComprobante_auto_empresa_nc_ult") <> 8 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_auto_empresa_nc_ult   , VALOR ESPERADO    8    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_auto_empresa_nc_ult"))
    If objbasededatos.rs_resultados("nrComprobante_auto_ctacte_nc_ult") <> 9 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_auto_ctacte_nc_ult    , VALOR ESPERADO    9    VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_auto_ctacte_nc_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_nc_ult") <> 10 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_nc_ult , VALOR ESPERADO    10   VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_nc_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_empresa_nc_ult") <> 11 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_empresa_nc_ult , VALOR ESPERADO    11   VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_empresa_nc_ult"))
    If objbasededatos.rs_resultados("nrComprobante_manual_ctacte_nc_ult") <> 12 Then l_strResultadoPruebas = l_strResultadoPruebas + "Error    nrComprobante_manual_ctacte_nc_ult  , VALOR ESPERADO    12   VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante_manual_ctacte_nc_ult"))

    If l_strResultadoPruebas <> "" Then
        strResultadoPruebas = strResultadoPruebas + l_strResultadoPruebas
    Else
        Prueba_sco_Puestos_v4_7_ndync = True
    End If
End Function



Public Function Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0() As Boolean
Dim valor_original As Variant

    If objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND") <> 4 Then
        strResultadoPruebas = "Error PUESTO_FACTURACION_ND <>  4 "
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
    
    '**********************************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_obtener_puntosdeventa_facturacion_v4_7"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Cuenta Corriente"
    objSPs.setearCampoValor "@tpComprobante", "ND"

    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
        
    valor_original = objbasededatos.rs_resultados("nrComprobante")
        
    
   '**********************************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_actualizar_puntosdeventa_facturacion_v2_0"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Cuenta Corriente"
    objSPs.setearCampoValor "@tpComprobante", "ND"
    objSPs.setearCampoValor "@nrComprobante", -3

    
    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
    
    
    '**********************************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_obtener_puntosdeventa_facturacion_v4_7"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Cuenta Corriente"
    objSPs.setearCampoValor "@tpComprobante", "ND"

    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
           

    If objbasededatos.rs_resultados("nrComprobante") <> -3 Then
        strResultadoPruebas = "Error nrComprobante, VALOR ESPERADO -3   VALOR ENTREGADO " + CStr(objbasededatos.rs_resultados("nrComprobante"))
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
    
    '**********************************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_actualizar_puntosdeventa_facturacion_v2_0"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValorBD("PUESTO_FACTURACION_ND"))
    objSPs.setearCampoValor "@tipo_iva", "CF"
    objSPs.setearCampoValor "@auto_impresor", "S"
    objSPs.setearCampoValor "@tpFormadePago", "Cuenta Corriente"
    objSPs.setearCampoValor "@tpComprobante", "ND"
    objSPs.setearCampoValor "@nrComprobante", valor_original

    
    If Not objSPs.ExecSP Then
        strResultadoPruebas = "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema."
        Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = False
        Exit Function
    End If
    
    Prueba_spu_actualizar_puntosdeventa_facturacion_v2_0 = True
    
End Function


