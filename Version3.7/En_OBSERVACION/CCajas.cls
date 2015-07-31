VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCajas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Private lobjConn                    As Object
Private lerror                      As String
Private lObjTablasIO                As Object

Public nrCaja                       As String
Public vlSaldoInicialPesos          As Single
Public vlSaldoInicialDolares        As Single
Public vlSaldoInicialEuros          As Single
Public vlSaldoInicialReales         As Single

Public vlDiaEuro                    As Single
Public vlDiaDolar                   As Single
Public vlDiaReal                    As Single
Public vlSaldoFinalRealPesos        As Single
Public vlSaldoFinalRealEuros        As Single
Public vlSaldoFinalRealDolares      As Single
Public vlSaldoFinalRealReales       As Single

Public vlSaldoFinalPesos            As Single
Public vlSaldoFinalDolares          As Single
Public vlSaldoFinalEuros            As Single
Public vlSaldoFinalReales           As Single

Public vlCierrePesos                As Single
Public vlCierreDolares              As Single
Public vlCierreEuros                As Single
Public vlCierreReales                As Single

Public dsUsuario                    As String
Public dtApertura                   As String
Public dtCierre                     As String

' Propiedades incluidas en la version 2.5

Public dsPuesto                     As String
Public nrPuesto                     As String
Public nmEmpleado                   As String
Public dsEstado                     As String

Public vlTotalSaldoFinalReal        As String
Public vlDiferenciaDeCierre         As String
Public dsDiferenciaDeCierre         As String
Public dsObservacion                As String

Public vlFondoFijoPesos             As String
Public vlFondoFijoDolares           As String
Public vlFondoFijoEuros             As String
Public vlFondoFijoReales            As String



Public vlPesos                      As Single
Public vlDolares                    As Single
Public vlEuros                      As Single
Public vlReales                      As Single

    
Property Set Basededatos(Valor As Object)
    Set lobjConn = Valor
End Property

Property Set ObjTablasIO(Valor As Object)
    Set lObjTablasIO = Valor
End Property


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

 Public Function ObtenerCajaAbiertadelUsuario(pdsUsuario As String) As String
 
    lObjTablasIO.nmTabla = "TB_Cajas"
    
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", pdsUsuario, " and "
    lObjTablasIO.setearCampoOperadorValor "flEstado", "=", "0", " and "
    lObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "IS NULL", " ", " and "
    lObjTablasIO.setearCampoOperadorValor "nrcaja", ">", "0"
    
    
    lObjTablasIO.Seleccionar
    If lObjTablasIO.rs_resultados.EOF Then
        ObtenerCajaAbiertadelUsuario = ""
    Else
        ObtenerCajaAbiertadelUsuario = lObjTablasIO.rs_resultados("nrCaja").Value
    End If
 
 End Function


 Public Function ObtenerUltimaCajaAdmCerrada() As Boolean
 
    lObjTablasIO.nmTabla = "VW_UltimaCajaAdm"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "->", ""
    
    lObjTablasIO.Seleccionar
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        nrCaja = lObjTablasIO.rs_resultados("nrCaja")
        vlSaldoFinalRealPesos = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealPesos").Value)
        vlSaldoFinalRealEuros = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealEuros").Value)
        vlSaldoFinalRealDolares = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealDolares").Value)
        vlSaldoFinalRealReales = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealReales").Value)
    
    Else
        nrCaja = 0
        vlSaldoFinalRealPesos = 0
        vlSaldoFinalRealEuros = 0
        vlSaldoFinalRealDolares = 0
    End If
 
End Function
 
 
Private Function ObtenerSaldoInicialparaAperturadeCajaADM() As Boolean

'    If objbasededatos.SP_CalculaSaldoInicial Then
'        vlSaldoFinalRealPesos = objParametros.ObtenerValor("ControldeCajasADM.vlSaldoFinalRealPesos")
'        vlSaldoFinalRealDolares = objParametros.ObtenerValor("ControldeCajasADM.vlSaldoFinalRealDolares")
'        vlSaldoFinalRealEuros = objParametros.ObtenerValor("ControldeCajasADM.vlSaldoFinalRealEuros")
'        ObtenerSaldoInicialparaAperturadeCajaADM = True
'    Else
'        ObtenerSaldoInicialparaAperturadeCajaADM = False
'    End If
    
    
 End Function
 

 
 

 Public Function ObtenerCajadeADMAbierta() As Boolean
 
    lObjTablasIO.nmTabla = "VW_CajadeADMAbierta"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "->", ""
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    
    
    lObjTablasIO.Seleccionar
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        nrCaja = lObjTablasIO.rs_resultados("nrCaja")
        vlSaldoFinalRealPesos = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealPesos").Value)
        vlSaldoFinalRealEuros = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealEuros").Value)
        vlSaldoFinalRealDolares = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealDolares").Value)
        vlSaldoFinalRealReales = AdaptarValorNumerico(lObjTablasIO.rs_resultados("vlSaldoFinalRealReales").Value)
        dsUsuario = lObjTablasIO.rs_resultados("dsUsuario").Value
        ObtenerCajadeADMAbierta = True
    Else
        ObtenerCajadeADMAbierta = False
        vlSaldoFinalRealPesos = 0
        vlSaldoFinalRealEuros = 0
        vlSaldoFinalRealDolares = 0
        vlSaldoFinalRealReales = 0
    End If
    
 
 End Function
 
 
' Actualizar caja
' opera con valores
' Parámetros de entrada
'       vlDiaEuro
'       vlDiaDolar
'       vlPesos
'       vlDolares
'       vlEuros
Public Function ActualizarCaja(pbSaldoSistema As Boolean) As Boolean
Dim i                           As Integer
Dim strValor                    As String
Dim lvlSaldoPesos               As Single
Dim lvlSaldoDolares             As Single
Dim lvlSaldoEuros               As Single
Dim vlTotalSaldoFinal           As Single
Dim lvlSaldoReales              As Single

    ActualizarCaja = False
    
    If Me.nrCaja = "" Then
        lerror = "Numero de caja no valido."
        Exit Function
    End If
    
    ' Validaciones de la actualización
    If Not objCajas.esCajaAbierta(Me.nrCaja) Then
        lerror = "La caja no esta abierta."
        Exit Function
    End If
    
    If Not objCajas.esCajaPuesto(Me.nrCaja) Then
        lerror = "La caja no es caja de un puesto."
        Exit Function
    End If

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", Me.nrCaja
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealReales", "->", ""
    
    
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalReal", "->", ""
    
    lObjTablasIO.Seleccionar
    
    If Not lObjTablasIO.rs_resultados.EOF Then
            If pbSaldoSistema Then
                lvlSaldoPesos = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalPesos").Value, "0")
                lvlSaldoDolares = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalDolares").Value, "0")
                lvlSaldoEuros = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalEuros").Value, "0")
                lvlSaldoReales = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalReales").Value, "0")
            Else
                lvlSaldoPesos = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalRealPesos").Value, "0")
                lvlSaldoDolares = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalRealDolares").Value, "0")
                lvlSaldoEuros = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalRealEuros").Value, "0")
                lvlSaldoReales = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoFinalRealReales").Value, "0")
            End If
    Else
        ActualizarCaja = False
        lerror = "no se pudo obtener el saldo de la caja."
        Exit Function
    End If
    
    lvlSaldoPesos = lvlSaldoPesos + CSng(vlPesos)
    lvlSaldoDolares = lvlSaldoDolares + CSng(vlDolares)
    lvlSaldoEuros = lvlSaldoEuros + CSng(vlEuros)
    lvlSaldoReales = lvlSaldoReales + CSng(vlReales)
            
    vlTotalSaldoFinal = lvlSaldoEuros * Me.vlDiaEuro
    vlTotalSaldoFinal = vlTotalSaldoFinal + lvlSaldoDolares * Me.vlDiaDolar
    vlTotalSaldoFinal = vlTotalSaldoFinal + lvlSaldoReales * Me.vlDiaReal
    vlTotalSaldoFinal = vlTotalSaldoFinal + lvlSaldoPesos
            
            
    lObjTablasIO.nmTabla = "TB_Cajas"
    If pbSaldoSistema Then
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "<-", CStr(lvlSaldoPesos)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "<-", CStr(lvlSaldoDolares)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "<-", CStr(lvlSaldoEuros)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalReales", "<-", CStr(lvlSaldoReales)
    
    Else
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", CStr(lvlSaldoPesos)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", CStr(lvlSaldoDolares)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", CStr(lvlSaldoEuros)
        lObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealReales", "<-", CStr(lvlSaldoReales)
    End If
    
    
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", Me.nrCaja
    lObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()


    If lObjTablasIO.Actualizar Then
        ActualizarCaja = True
    Else
        ActualizarCaja = False
        lerror = "no se pudo actualizar el saldo de la caja."
        Exit Function
    End If
    
    If Me.ActualizarDiferenciaSaldoCajaPuesto() Then
        ActualizarCaja = True
    Else
        ActualizarCaja = False
        lerror = "no se pudo actualizar el saldo de la caja."
    End If
    
    
    
    
    
End Function


Public Function puedeOperar(pCajaRegistro As String, pcdConcepto As String) As Boolean

    puedeOperar = True
    
    If objParametros.ObtenerValor("CajaAbierta") = "NO" Or _
         (objParametros.ObtenerValor("CajaAbierta") = "SI" And _
         objParametros.ObtenerValor("nrCaja") <> pCajaRegistro) Then
       puedeOperar = False
    Else
            '   Comentado en la version 2.9
            '       Select Case pcdConcepto
            '       Case "1027", 1028, "1063" ' Agregar todo los conceptos que se requieran
            '            puedeOperar = False
            '       Case Else
            '            puedeOperar = True
            '       End Select
       ' version 2.9
       If objMovimientos.esMovimientoContabledelSistema(pcdConcepto) Then
            puedeOperar = False
       End If
    
    End If
    
    
End Function


Public Function SumarCajaADM(pnrCaja As String, ptpCaja As String, ptpCajaImputacion As String) As Boolean

    SumarCajaADM = False
    
    objSPs.nmStoredProcedure = "SP_SumaCajaADM_v2_9"
    objSPs.setearCampoValor "@nrCaja_param", pnrCaja
    objSPs.setearCampoValor "@tpCaja_param", ptpCaja
    objSPs.setearCampoValor "@tpCajaImputacion_param", ptpCajaImputacion

    Me.vlDolares = 0
    Me.vlPesos = 0
    Me.vlEuros = 0
    
    If Not objSPs.ExecSP() Then
        MsgBox "No se pudo obtener el saldo de la caja, el programa se cerrará.", vbCritical + vbDefaultButton1, "Atención"
        End
    End If
    
    
    
    Do Until objbasededatos.rs_resultados.EOF
        Select Case objbasededatos.rs_resultados("tpOperacion").Value
        Case "Entrada de Dinero"
            Me.vlDolares = Me.vlDolares + Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaDolares").Value, 0))
            Me.vlPesos = Me.vlPesos + Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaPesos").Value, 0))
            Me.vlEuros = Me.vlEuros + Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaEuros").Value, 0))
        Case "Salida de Dinero"
            Me.vlDolares = Me.vlDolares - Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaDolares").Value, 0))
            Me.vlPesos = Me.vlPesos - Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaPesos").Value, 0))
            Me.vlEuros = Me.vlEuros - Abs(AdaptarNulos(objbasededatos.rs_resultados("SumaEuros").Value, 0))
        End Select
        objbasededatos.rs_resultados.MoveNext
    Loop
    
    SumarCajaADM = True
    
    
End Function



Public Function ObtenerSaldosdeInicioyValores(pnrCaja As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja
    lObjTablasIO.setearCampoOperadorValor "vlSaldoInicialPesos", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoInicialDolares", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlSaldoInicialEuros", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlDiaEuro", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlDiaDolar", "->", ""
    lObjTablasIO.setearCampoOperadorValor "vlDiaReal", "->", ""
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    lObjTablasIO.setearCampoOperadorValor "dtApertura", "->", ""
    lObjTablasIO.setearCampoOperadorValor "dtCierre", "->", ""
    
    lObjTablasIO.Seleccionar
    
    If Not lObjTablasIO.rs_resultados.EOF Then
        Me.nrCaja = pnrCaja
        Me.vlSaldoInicialPesos = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoInicialPesos").Value, 0)
        Me.vlSaldoInicialDolares = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoInicialDolares").Value, 0)
        Me.vlSaldoInicialEuros = AdaptarNulos(lObjTablasIO.rs_resultados("vlSaldoInicialEuros").Value, 0)
        Me.vlDiaEuro = AdaptarNulos(lObjTablasIO.rs_resultados("vlDiaEuro").Value, 0)
        Me.vlDiaDolar = AdaptarNulos(lObjTablasIO.rs_resultados("vlDiaDolar").Value, 0)
        Me.vlDiaReal = AdaptarNulos(lObjTablasIO.rs_resultados("vlDiaReal").Value, 0)
        Me.dsUsuario = AdaptarNulos(lObjTablasIO.rs_resultados("dsUsuario").Value, "")
        Me.dtApertura = AdaptarNulos(lObjTablasIO.rs_resultados("dtApertura").Value, "")
        Me.dtCierre = AdaptarNulos(lObjTablasIO.rs_resultados("dtCierre").Value, "")
        ObtenerSaldosdeInicioyValores = True
    Else
        ObtenerSaldosdeInicioyValores = False
    End If

End Function


Public Function CambiarUsuariodelaCaja(pnrCaja As String, pdsUsuario As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", pdsUsuario
    
    If lObjTablasIO.Actualizar Then
        CambiarUsuariodelaCaja = True
    Else
        CambiarUsuariodelaCaja = False
    
    End If
    
End Function


Public Function VerificarUsuariotieneCajaAbierta(pnrCaja As String, pdsUsuario As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", pdsUsuario, " AND "
    lObjTablasIO.setearCampoOperadorValor "flEstado", "=", "0"
    lObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    
     lObjTablasIO.Seleccionar
     
    If Not lObjTablasIO.rs_resultados.EOF Then
        VerificarUsuariotieneCajaAbierta = True
    Else
        VerificarUsuariotieneCajaAbierta = False
    End If
    
End Function


Public Function ObtenerCajadeADMActiva() As String

    ObtenerCajadeADMActiva = ""

    objSPs.nmStoredProcedure = "sco_CajadeADMActiva"
    If Not objSPs.ExecSP() Then
        MsgBox "No se pudo obtener la caja activa de la adm.", vbCritical + vbDefaultButton1, "Seguridad"
        Exit Function
    End If
    
    If objSPs.rs_resultados.EOF Then
        MsgBox "No existe una caja activa de la adm", vbCritical + vbDefaultButton1, "Seguridad"
        Exit Function
    End If
    
    ObtenerCajadeADMActiva = CStr(objSPs.rs_resultados("nrCaja").Value)


End Function


' Pasar y realizar merge en la versión 1.3
' incluidas en la version 1.3
Public Function esCajaAbierta(pnrCaja As String) As Boolean
 
    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja, " AND "
    lObjTablasIO.setearCampoOperadorValor "flEstado", "=", "0"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", pnrCaja
    lObjTablasIO.Seleccionar
    
    If lObjTablasIO.rs_resultados.EOF Then
        esCajaAbierta = False
    Else
        esCajaAbierta = True
    End If
 
 End Function
 
 ' incluida en la version 1.3
 Public Function esCajaPuesto(pnrCaja As String) As Boolean
 
    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja, " AND "
    lObjTablasIO.setearCampoOperadorValor "flCajaAdm", "=", "0"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", pnrCaja
    lObjTablasIO.Seleccionar
    
    If lObjTablasIO.rs_resultados.EOF Then
        esCajaPuesto = False
    Else
        esCajaPuesto = True
    End If
 
 End Function


Public Function ObtenerFondoCajaAnterior(pnrPuesto As String)

    objSPs.nmStoredProcedure = "sco_FondoFijoCajaAnterior_v2_5"
    objSPs.setearCampoValor "@nrPuesto", pnrPuesto
    If Not objSPs.ExecSP() Then
        Me.vlFondoFijoPesos = 0
        Me.vlFondoFijoDolares = 0
        Me.vlFondoFijoEuros = 0
    Else
        If objSPs.rs_resultados.EOF Then
            Me.vlFondoFijoPesos = 0
            Me.vlFondoFijoDolares = 0
            Me.vlFondoFijoEuros = 0
        Else
            Me.vlFondoFijoPesos = objbasededatos.rs_resultados_valor("vlSaldoInicialPesos")
            Me.vlFondoFijoDolares = objbasededatos.rs_resultados_valor("vlSaldoInicialDolares")
            Me.vlFondoFijoEuros = objbasededatos.rs_resultados_valor("vlSaldoInicialEuros")
        End If
    End If
    

End Function


Public Function puedeOperarUsuarioCajaPuesto(pnrCaja_param As String, pdsUsuario As String) As Boolean

    objSPs.nmStoredProcedure = "SP_puedeOperarUsuarioCajaPuesto_v3_2"
    objSPs.setearCampoValor "@pnrCaja_param", pnrCaja_param
    objSPs.setearCampoValor "@pdsUsuario_param", pdsUsuario
    
    If Not objSPs.ExecSP() Then
        puedeOperarUsuarioCajaPuesto = False
        lerror = "Error en el store SP_puedeOperarUsuarioCajaPuesto_v3_2, error extendido: " + objSPs.Error
    Else
        If objbasededatos.rs_resultados_valor("Resultado") = "NO" Then
            puedeOperarUsuarioCajaPuesto = False
        Else
            puedeOperarUsuarioCajaPuesto = True
        End If
        lerror = objbasededatos.rs_resultados_valor("descripcion")
    End If

End Function


Public Function realizarReaperturadelaCajaPuesto _
                            (pnrCaja_param As String, _
                            pdsUsuario As String, _
                            pdsUsuario_Supervisor_param) As Boolean

    objSPs.nmStoredProcedure = "SP_realizarReaperturadelaCajaPuesto_v3_2"
    objSPs.setearCampoValor "@pnrCaja_param", pnrCaja_param
    objSPs.setearCampoValor "@pdsUsuario_param", pdsUsuario
    objSPs.setearCampoValor "@pdsUsuario_Supervisor_param", pdsUsuario_Supervisor_param
    
    If Not objSPs.ExecSP() Then
        realizarReaperturadelaCajaPuesto = False
        lerror = "Error en el store SP_realizarReaperturadelaCajaPuesto_v3_2, error extendido: " + objSPs.Error
    Else
        realizarReaperturadelaCajaPuesto = True
    End If
    
End Function


Public Function realizarCierreCajaPuesto _
                            (pnrCaja_param As String, _
                            pdsUsuario As String, _
                            pdsUsuario_Supervisor_param) As Boolean

    objSPs.nmStoredProcedure = "SP_realizarCierreCajaPuesto_v2_6"
    objSPs.setearCampoValor "@pnrCaja_param", pnrCaja_param
    objSPs.setearCampoValor "@pdsUsuario_param", pdsUsuario
    objSPs.setearCampoValor "@pdsUsuario_Supervisor_param", pdsUsuario_Supervisor_param
    
    If Not objSPs.ExecSP() Then
        realizarCierreCajaPuesto = False
        lerror = objSPs.Error
    Else
        realizarCierreCajaPuesto = True
    End If
    
End Function

Public Function obtenerCaja(pnrCaja As String) As Boolean

    obtenerCaja = False
    
    ' obtener los datos de la caja en cuestion
    objSPs.nmStoredProcedure = "sco_cajapuesto_v2_5"
    objSPs.setearCampoValor "@nrCaja_param", pnrCaja
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sco_cajapuesto_v2_5, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Me.dsPuesto = objbasededatos.rs_resultados("dsPuesto")
    Me.nrPuesto = objbasededatos.rs_resultados("nrPuesto")
    Me.dtApertura = objbasededatos.rs_resultados("dtApertura")
    Me.dtCierre = objbasededatos.rs_resultados_valor("dtCierre")
    Me.nmEmpleado = objbasededatos.rs_resultados("nmEmpleado")
    Me.vlSaldoInicialPesos = objbasededatos.rs_resultados("vlSaldoInicialPesos")
    Me.vlSaldoInicialDolares = objbasededatos.rs_resultados("vlSaldoInicialDolares")
    Me.vlSaldoInicialEuros = objbasededatos.rs_resultados("vlSaldoInicialEuros")
    Me.vlDiaDolar = objbasededatos.rs_resultados("vlDiaDolar")
    Me.vlDiaEuro = objbasededatos.rs_resultados("vlDiaEuro")
    Me.dsEstado = objbasededatos.rs_resultados("dsEstado")
    Me.vlSaldoFinalRealPesos = objbasededatos.rs_resultados_valor("vlSaldoFinalRealPesos")
    Me.vlSaldoFinalRealEuros = objbasededatos.rs_resultados_valor("vlSaldoFinalRealEuros")
    Me.vlSaldoFinalRealDolares = objbasededatos.rs_resultados_valor("vlSaldoFinalRealDolares")
    Me.vlTotalSaldoFinalReal = objbasededatos.rs_resultados_valor("vlTotalSaldoFinalReal")
    Me.vlDiferenciaDeCierre = objbasededatos.rs_resultados_valor("vlDiferenciaDeCierre")
    Me.dsDiferenciaDeCierre = objbasededatos.rs_resultados_valor("dsDiferenciaDeCierre")
    Me.dsObservacion = objbasededatos.rs_resultados_valor("dsObservacion")

    ' agregado en la version 3.7
    Me.vlSaldoFinalPesos = objbasededatos.rs_resultados_valor("vlSaldoFinalPesos")
    Me.vlSaldoFinalEuros = objbasededatos.rs_resultados_valor("vlSaldoFinalEuros")
    Me.vlSaldoFinalDolares = objbasededatos.rs_resultados_valor("vlSaldoFinalDolares")
        
    Me.vlSaldoInicialReales = objbasededatos.rs_resultados_valor("vlSaldoInicialReales")
    Me.vlSaldoFinalReales = objbasededatos.rs_resultados_valor("vlSaldoFinalReales")
    Me.vlSaldoFinalRealReales = objbasededatos.rs_resultados_valor("vlSaldoFinalRealReales")
    Me.vlCierreReales = objbasededatos.rs_resultados_valor("vlCierreReales")
    Me.vlFondoFijoReales = objbasededatos.rs_resultados_valor("vlFondoFijoReales")

    obtenerCaja = True
    

End Function


Public Function SumarCajaPuestos(pnrCaja As String) As Boolean
    
    SumarCajaPuestos = False
    
    ' obtener los datos de la caja en cuestion
    objSPs.nmStoredProcedure = "SP_SumaCajaPuestosCondVenta_v3_7"
    objSPs.setearCampoValor "@pnrCaja_param", pnrCaja
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sco_cajapuesto_v2_5, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Me.vlSaldoFinalPesos = objbasededatos.rs_resultados("vlSaldoFinalPesos")
    Me.vlSaldoFinalDolares = objbasededatos.rs_resultados("vlSaldoFinalDolares")
    Me.vlSaldoFinalEuros = objbasededatos.rs_resultados("vlSaldoFinalEuros")
    Me.vlSaldoFinalReales = objbasededatos.rs_resultados("vlSaldoFinalReales")
    
    
    
    SumarCajaPuestos = True

End Function


Public Function obtenerCajasPendientesdeAprobacion(pdsUsuario As String) As Collection
Dim col_CajasPendientesdeAprobacion As Collection

    Set obtenerCajasPendientesdeAprobacion = New Collection
    Set col_CajasPendientesdeAprobacion = New Collection
    
    ' obtener los datos de la caja en cuestion
    objSPs.nmStoredProcedure = "sp_obtenerCajasPendientesdeAprobacion_v2_5"
    objSPs.setearCampoValor "@pdsUsuario_param", pdsUsuario
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sp_obtenerCajasPendientesdeAprobacion_v2_5, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Do Until objSPs.rs_resultados.EOF
        col_CajasPendientesdeAprobacion.Add CStr(objSPs.rs_resultados("nrCaja"))
        objSPs.rs_resultados.MoveNext
    Loop
    
   Set obtenerCajasPendientesdeAprobacion = col_CajasPendientesdeAprobacion
   
End Function



Public Sub AprobarRechazarCajaPuesto()
Dim col_CajasPendientesdeAprobacion As Collection
Dim l_caja_puesto                   As Object
Dim resp                            As Byte
Dim i                               As Integer

    Set col_CajasPendientesdeAprobacion = Me.obtenerCajasPendientesdeAprobacion(objUsuario.dsUsuario)
    
    
    If col_CajasPendientesdeAprobacion.Count < 1 Then Exit Sub
    
    i = 1
    Do While i <= col_CajasPendientesdeAprobacion.Count
        MsgBox "Por favor, verifique los cambios efectuados en la caja '" + col_CajasPendientesdeAprobacion.Item(i) + "'.", vbInformation, "Atención"
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.nrcajapuesto", col_CajasPendientesdeAprobacion.Item(i)
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "SI"
        frm_DetalleCajaPuesto.Show vbModal
        resp = MsgBox("Aprueba los cambios efectuados en su caja nro. '" + col_CajasPendientesdeAprobacion.Item(i) + "'?" + vbCrLf + "Presione cancelar para realizarlo mas tarde.", vbQuestion + vbYesNoCancel, "Atención")
        Select Case resp
        Case vbYes
            objSPs.nmStoredProcedure = "sp_AprobarCajaPuesto_v2_5"
            objSPs.setearCampoValor "@pdsUsuario_param", objUsuario.dsUsuario
            objSPs.setearCampoValor "@pnrCaja_param", col_CajasPendientesdeAprobacion.Item(i)
            If Not objSPs.ExecSP() Then
                lerror = "Error al ejecutar el procedure sp_AprobarCajaPuesto_v2_5, decripción: " + objSPs.Error
                Exit Sub
            End If
            MsgBox "Caja aprobada.", vbInformation + vbDefaultButton1, "Atención"
        Case vbNo
            objSPs.nmStoredProcedure = "sp_RechazarCajaPuesto_v2_5"
            objSPs.setearCampoValor "@pdsUsuario_param", objUsuario.dsUsuario
            objSPs.setearCampoValor "@pnrCaja_param", col_CajasPendientesdeAprobacion.Item(i)
            If Not objSPs.ExecSP() Then
                lerror = "Error al ejecutar el procedure sp_obtenerCajasPendientesdeAprobacion_v2_5, decripción: " + objSPs.Error
                Exit Sub
            End If
            MsgBox "Caja rechazada.", vbInformation + vbDefaultButton1, "Atención"
        Case Else
            ' debera revisarla mas  tarde
        End Select
        i = i + 1
    Loop

End Sub


Public Function ActualizarDiferenciaSaldoCajaPuesto() As Boolean

    ActualizarDiferenciaSaldoCajaPuesto = False
    
    objSPs.nmStoredProcedure = "sp_ActualizarDiferenciaSaldoCajaPuesto_v2_5"
    objSPs.setearCampoValor "@pnrCaja_param", Me.nrCaja
    If Not objSPs.ExecSP() Then
        lerror = "Error:" + objSPs.Error
        Exit Function
    End If
    
    ActualizarDiferenciaSaldoCajaPuesto = True
        
End Function

Public Function hayCajasModificadasporAdministracion() As Boolean
Dim col_CajasPendientesdeAprobacion As Collection

    Set col_CajasPendientesdeAprobacion = Me.obtenerCajasPendientesdeAprobacion(objUsuario.dsUsuario)
    If col_CajasPendientesdeAprobacion.Count < 1 Then
        hayCajasModificadasporAdministracion = False
    Else
        hayCajasModificadasporAdministracion = True
    End If

End Function

Public Function hayCajasRechazadasporlaCajera() As Boolean
Dim col_CajasRechazadas As Collection

    Set col_CajasRechazadas = Me.obtenerCajasRechazadas()
    If col_CajasRechazadas.Count < 1 Then
        hayCajasRechazadasporlaCajera = False
    Else
        hayCajasRechazadasporlaCajera = True
    End If

End Function

' creada en la version 2.9
Public Function obtenerCajasRechazadas() As Collection
Dim col_CajasRechazadas As Collection

    Set obtenerCajasRechazadas = New Collection
    Set col_CajasRechazadas = New Collection
    
    ' obtener los datos de la caja en cuestion
    objSPs.nmStoredProcedure = "sp_obtenerCajasRechazadas_v2_9"
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sp_obtenerCajasRechazadas_v2_9, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Do Until objSPs.rs_resultados.EOF
        col_CajasRechazadas.Add CStr(objSPs.rs_resultados("nrCaja"))
        objSPs.rs_resultados.MoveNext
    Loop
    
   Set obtenerCajasRechazadas = col_CajasRechazadas
   
End Function


' creada en la version 2.9
Public Function marcarComoImputada(pnrCaja As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja
    lObjTablasIO.setearCampoOperadorValor "flImputado", "<-", 1
    
    If lObjTablasIO.Actualizar Then
        marcarComoImputada = True
    Else
        lerror = lObjTablasIO.Error
        marcarComoImputada = False
    End If
    
    

End Function



' creada en la version 3.2
Public Function esImputacionCajaActual(pnrCaja As String, pnrCajaAdmdeImputacion As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja, "AND"
    lObjTablasIO.setearCampoOperadorValor "nrCajaAdmImputaOrigen", "IS NULL", ""
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    
    If lObjTablasIO.Seleccionar Then
        ' MsgBox "antes de lObjTablasIO.rs_resultados.EOF "
        If Not lObjTablasIO.rs_resultados.EOF Then
            esImputacionCajaActual = True
        End If
    Else
        esImputacionCajaActual = False
    End If
    
    ' MsgBox "sale de esImputacionCajaActual "
    
End Function


' creada en la version 3.2
Public Function marcarCajaAdmImputacionOrigen(pnrCaja As String, pnrCajaAdmdeImputacion As String) As Boolean
    
        lObjTablasIO.nmTabla = "TB_Cajas"
        lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja, "AND"
        lObjTablasIO.setearCampoOperadorValor "nrCajaAdmImputaOrigen", "<-", pnrCajaAdmdeImputacion
        lObjTablasIO.setearCampoOperadorValor "nrCajaAdmImputaOrigen", "IS NULL", ""
        
        If lObjTablasIO.Actualizar Then
            marcarCajaAdmImputacionOrigen = True
        Else
            lerror = lObjTablasIO.Error
            marcarCajaAdmImputacionOrigen = False
        End If
        
End Function

Public Function grabarValoresImputacionesDesimputacionesCajasPuestos( _
            ptpAccion As String, pnrCajaAdmActual As String, _
            pnrCajaPuesto_param As String, _
            pesCajaActual As String) As Boolean


    grabarValoresImputacionesDesimputacionesCajasPuestos = False
    
    objSPs.nmStoredProcedure = "sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2"
    objSPs.setearCampoValor "@tpAccion", ptpAccion
    objSPs.setearCampoValor "@nrCajaAdmActual", pnrCajaAdmActual
    objSPs.setearCampoValor "@nrCajaPuesto_param", pnrCajaPuesto_param
    objSPs.setearCampoValor "@esCajaActual", pesCajaActual
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sp_grabarValoresImputacionesDesimputacionesCajasPuestos_v3_2, decripción: " + objSPs.Error
        Exit Function
    End If
    
    grabarValoresImputacionesDesimputacionesCajasPuestos = True


End Function



Public Function marcarComoNoImputada(pnrCaja As String, pnrCajaAdmActual As String) As Boolean

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCaja
    lObjTablasIO.setearCampoOperadorValor "flImputado", "<-", 0
    
    If lObjTablasIO.Actualizar Then
        marcarComoNoImputada = True
    Else
        lerror = lObjTablasIO.Error
        marcarComoNoImputada = False
    End If
    
    

End Function


 Public Function calcularSaldoInicial(ptpCaja As String, _
                                        ptpCajaImputacion, _
                                        pnrCaja As String) As Boolean

    calcularSaldoInicial = False
    
    objSPs.nmStoredProcedure = "SP_CalculaSaldoInicial_v2_9"
    objSPs.setearCampoValor "@tpCaja_param", ptpCaja
    objSPs.setearCampoValor "@tpCajaImputacion_param", ptpCajaImputacion
    objSPs.setearCampoValor "@nrCaja_param", pnrCaja
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure SP_CalculaSaldoInicial_v2_9, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Me.vlSaldoInicialPesos = objSPs.rs_resultados("vlSaldoInicialPesos")
    Me.vlSaldoInicialDolares = objSPs.rs_resultados("vlSaldoInicialDolares")
    Me.vlSaldoInicialEuros = objSPs.rs_resultados("vlSaldoInicialEuros")
        
    calcularSaldoInicial = True
    
 End Function
 
 ' incluido en la version 3.2
 Public Function existenCajasDesimputadas(pnrCajaAdmActual As String) As Boolean

    existenCajasDesimputadas = False
    
    objSPs.nmStoredProcedure = "sp_existen_cajas_desimputadas_v3_2"
    objSPs.setearCampoValor "@nrCajaAdmActual", pnrCajaAdmActual
    
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure sp_existen_cajas_desimputadas_v3_2, decripción: " + objSPs.Error
        Exit Function
    End If
    
    If objSPs.rs_resultados("resultado") = "SI" Then
        lerror = objSPs.rs_resultados("descripcion")
        existenCajasDesimputadas = True
    Else
        existenCajasDesimputadas = False
    End If
        

    
 End Function
 
Public Function ActualizarValoresSumadosCajasPuestosImputadas(pnrCajaAdmActual As String) As Boolean

    ActualizarValoresSumadosCajasPuestosImputadas = False
    
    objSPs.nmStoredProcedure = "SP_obtenerCajasPuestosImputadas_v3_2"
    objSPs.setearCampoValor "@nrCaja_param", pnrCajaAdmActual
    objSPs.setearCampoValor "@flSumatorio_param", "1"
   
    If Not objSPs.ExecSP() Then
        lerror = "Error al ejecutar el procedure SP_obtenerCajasPuestosImputadas_v3_2, decripción: " + objSPs.Error
        Exit Function
    End If
    
    Dim vlSumaCajasPuestosCierrePesos As String
    Dim vlSumaCajasPuestosCierreDolares As String
    Dim vlSumaCajasPuestosCierreEuros As String
    Dim vlSumaCajasPuestosDiferencia As String
    
    vlSumaCajasPuestosCierrePesos = objSPs.rs_resultados("vlSumaCierrePesos")
    vlSumaCajasPuestosCierreDolares = objSPs.rs_resultados("vlSumaCierreDolares")
    vlSumaCajasPuestosCierreEuros = objSPs.rs_resultados("vlSumaCierreEuros")
    vlSumaCajasPuestosDiferencia = objSPs.rs_resultados("vlSumaDiferenciaDeCierre")

    lObjTablasIO.nmTabla = "TB_Cajas"
    lObjTablasIO.setearCampoOperadorValor "nrCaja", "=", pnrCajaAdmActual
    lObjTablasIO.setearCampoOperadorValor "vlSumaCajasPuestosCierrePesos", "<-", vlSumaCajasPuestosCierrePesos
    lObjTablasIO.setearCampoOperadorValor "vlSumaCajasPuestosCierreDolares", "<-", vlSumaCajasPuestosCierreDolares
    lObjTablasIO.setearCampoOperadorValor "vlSumaCajasPuestosCierreEuros", "<-", vlSumaCajasPuestosCierreEuros
    lObjTablasIO.setearCampoOperadorValor "vlSumaCajasPuestosDiferencia", "<-", vlSumaCajasPuestosDiferencia
    
    If lObjTablasIO.Actualizar Then
        ActualizarValoresSumadosCajasPuestosImputadas = True
    Else
        lerror = lObjTablasIO.Error
    End If
        

End Function
 
 

