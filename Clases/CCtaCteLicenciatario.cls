VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCtaCteLicenciatario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Clase creada en la version 2.5
Option Explicit

Public nrComprobante   As String
Public nrTalonario     As String
Public tpComprobante   As String
Public tpLetra         As String
Public CuponesCompensados As Single


Private lerror As String


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property


' Para anular un cupon el comprobante no tiene que haber sido compensado
' si fue compensado se tiene que anular el Recibo generado
' para anular un recibo ya generado la caja debe estar abierta
Public Function anularCupon() As Boolean
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", Me.tpComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", Me.tpLetra
    
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", CStr(Now())
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()

    ' EULISES Mejorar esto, controlar los registros afectados
    If ObjTablasIO.Actualizar() Then
       anularCupon = True
    Else
       lerror = ObjTablasIO.Error
       anularCupon = False
    End If

End Function

Public Function esComprobanteCompensado() As Boolean


    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", Me.tpComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", Me.tpLetra, " AND"
    ObjTablasIO.setearCampoOperadorValor "flCompensado", "=", "1"
    ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        esComprobanteCompensado = True
        lerror = "el comprobante no puede 'Anularse' porque ya fue compensado."
        Exit Function
    Else
        esComprobanteCompensado = False
    End If
    

End Function


' Desanular Comprobante
Public Function DesanularCupon() As Boolean
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", Me.tpComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", Me.tpLetra
    
    ' marcamos el flag de anulado como desanulado
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", ""
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()

    ' EULISES Mejorar esto, controlar los registros afectados
    If ObjTablasIO.Actualizar() Then
       DesanularCupon = True
    Else
       lerror = ObjTablasIO.Error
       DesanularCupon = False
    End If

End Function


' version  2.7
Public Function obtenerCuponesAnulados(nrLicencia As String) As Boolean

    obtenerCuponesAnulados = False

    objSPs.nmStoredProcedure = "obtenerCuponesAnulados_v2_7"
    objSPs.setearCampoValor "@nrLicencia_param", nrLicencia
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If
 
End Function



Public Function grabarMovimientoContablePagoLicenciatario(pIdRecibo As String, _
                    pcdConcepto As String, pnrCaja As String, pdsMovimiento As String, _
                    pnmProveedor As String, pvlDolares As String, pvlPesos As String, _
                    pvlEuros As String, pdsUsuario As String) As Boolean

   ' agregado en la version 4
   objMovimientos.limpiarObjeto
   
    '  MsgBox "VOY POR ACAAAA"
    
    objMovimientos.IdRecibo = pIdRecibo
    objMovimientos.nrCaja = pnrCaja
        
    If pvlPesos < 0 Then
        objMovimientos.cdConcepto = "2020"
        objMovimientos.dsMovimiento = "Ingreso Compensatorio por comisiones"
        objMovimientos.vlPesos = Abs(pvlPesos)
        objMovimientos.dsProveedor = pnmProveedor
        objMovimientos.dsUsuario = pdsUsuario
        objMovimientos.dtMovimiento = CStr(Now)
        objMovimientos.nrFactura = ""
        objMovimientos.IdProveedor = ""
        objMovimientos.vlDolares = 0
        objMovimientos.vlEuros = 0
        If objMovimientos.grabarMovimientoContable() Then
            grabarMovimientoContablePagoLicenciatario = True
        Else
            lerror = objMovimientos.Error
            grabarMovimientoContablePagoLicenciatario = False
            Exit Function
        End If
        ' si es menor reseteo con cero para que con el if de abajo salga del
        ' la función
        objMovimientos.vlPesos = 0
    Else
        objMovimientos.vlPesos = pvlPesos
    End If
           
           
    If objMovimientos.vlPesos = 0 And pvlDolares = 0 And pvlEuros = 0 Then
        grabarMovimientoContablePagoLicenciatario = True
        Exit Function
    End If
    
    objMovimientos.cdConcepto = pcdConcepto
    objMovimientos.dsMovimiento = pdsMovimiento
    objMovimientos.dsProveedor = pnmProveedor
    objMovimientos.dsUsuario = pdsUsuario
    objMovimientos.dtMovimiento = CStr(Now)
    objMovimientos.nrFactura = ""
    objMovimientos.IdProveedor = ""
    objMovimientos.vlDolares = pvlDolares
    objMovimientos.vlEuros = pvlEuros

    If objMovimientos.grabarMovimientoContable() Then
        grabarMovimientoContablePagoLicenciatario = True
    Else
        lerror = objMovimientos.Error
        grabarMovimientoContablePagoLicenciatario = False
    End If
    
    
End Function



Public Function grabarMovimientoContablePagoLicenciatarioenMonedaReal(pIdRecibo As String, _
                    pcdConcepto As String, pnrCaja As String, pdsMovimiento As String, _
                    pnmProveedor As String, _
                    pvlReales As Single, pvlDiaReal As Single, pdsUsuario As String) As Boolean


    ' MsgBox " VOY POR ACAAAA VESIÓN 3.7 "
   ' agregado en la version 4
   objMovimientos.limpiarObjeto
   
    objMovimientos.IdRecibo = pIdRecibo
    objMovimientos.nrCaja = pnrCaja
        
    If pvlReales = 0 Then
        grabarMovimientoContablePagoLicenciatarioenMonedaReal = True
        Exit Function
    End If
    
    objMovimientos.cdConcepto = pcdConcepto
    objMovimientos.dsMovimiento = pdsMovimiento
    objMovimientos.dsProveedor = pnmProveedor
    objMovimientos.dsUsuario = pdsUsuario
    objMovimientos.dtMovimiento = CStr(Now)
    objMovimientos.nrFactura = ""
    objMovimientos.IdProveedor = ""
    objMovimientos.vlPesos = pvlReales * pvlDiaReal
    objMovimientos.vlDolares = 0
    objMovimientos.vlEuros = 0

    If objMovimientos.grabarMovimientoContable() Then
        grabarMovimientoContablePagoLicenciatarioenMonedaReal = True
    Else
        lerror = objMovimientos.Error
        grabarMovimientoContablePagoLicenciatarioenMonedaReal = False
    End If
    
    
End Function

Public Function obtenerCantidadCuponesCompensadosdelDia(pnrLicencia As String) As Boolean

    obtenerCantidadCuponesCompensadosdelDia = False

    CuponesCompensados = 0

    objSPs.nmStoredProcedure = "sp_cuponesCompensadosdelDia_v3_3"
    objSPs.setearCampoValor "@pnrLicencia", pnrLicencia
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If

    Me.CuponesCompensados = objSPs.rs_resultados("cupones_compensados")

    obtenerCantidadCuponesCompensadosdelDia = True

End Function

    
