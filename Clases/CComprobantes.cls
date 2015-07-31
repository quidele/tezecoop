VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CComprobantes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Clases agregada el la versión  2.5
Option Explicit

Public nrComprobante   As String
Public nrTalonario     As String
Public tpComprobante   As String
Public tpLetra         As String
Public nrCaja          As String
Public nrCierre        As String


Public vlPesos                      As Single
Public vlDolares                    As Single
Public vlEuros                      As Single
Public vlReales                     As Single


Public vlPagoPesosACP               As Single
Public vlPagoDolaresACP             As Single
Public vlPagoEurosACP               As Single
Public vlPagoRealesACP              As Single

Public vlDiaEuro                    As Single
Public vlDiaDolar                   As Single
Public vlDiaReal                    As Single

Public CondVenta                    As String
Public IdReciboCtaCte               As String

' Parametros para la administracion de los cambios realizados posterior
' al cierre de una caja puesto
Public tpModificacionCajaPuesto     As String
Public dsObservacionCajaPuesto      As String

' para el manejo de deseliminar
Public flAnulado As Integer

Private lerror As String


' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

' Reliza la anulacion de un comprobante
' Esta anulación no genera una nota de crédito ya que taxis ezeiza
' trabaja con Facturas C
Public Function AnularComprobante() As Boolean
Dim resp     As Byte
Dim strSQL   As String

    AnularComprobante = False

    ' Agregar verificacion de anulado nos veces
    objCtaCteLic.nrTalonario = Me.nrTalonario
    objCtaCteLic.nrComprobante = Me.nrComprobante
    objCtaCteLic.tpComprobante = Me.tpComprobante
    objCtaCteLic.tpLetra = Me.tpLetra

    ' verificar si el comprobate a sido compensado
    If objCtaCteLic.esComprobanteCompensado() Then
        lerror = objCtaCteLic.Error
        AnularComprobante = False
        Exit Function
    End If
    
            
    ' Anular el cupon
    If Not objCtaCteLic.anularCupon() Then
        lerror = objCtaCteLic.Error
        Exit Function
    End If
        
    If Not Me.guardarComprobanteCajaPuestoAnterior() Then
        Exit Function
    End If
    '/***********************************************************************/
    
    ' Anular el recibo en caso de ser una factura de cta. cte.
    ' DEBERIA ESTAR EN EL OBJETO CTA CTE
    If Me.IdReciboCtaCte <> "" Then
       strSQL = " SP_AnularFacturaCtaCte " + Me.IdReciboCtaCte + ","
       strSQL = strSQL + objUsuario.dsUsuario
       If Not objbasededatos.ExecStoredProcedures(strSQL) Then
           lerror = "Error: " + objbasededatos.Error
           Exit Function
       End If
    End If

    ' Anulamos el comprobantes
    ObjTablasIO.nmTabla = "TB_Comprobantes"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", _
    "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", _
    "=", Me.tpLetra, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
    "=", Me.tpComprobante
    
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", CStr(Now())
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", 0
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
    
    If Not ObjTablasIO.Actualizar() Then
        lerror = "Error: " + ObjTablasIO.Error
        Exit Function
    End If
      
    Me.vlPesos = Me.vlPesos * (-1)
    Me.vlDolares = Me.vlDolares * (-1)
    Me.vlEuros = Me.vlEuros * (-1)
    Me.vlReales = Me.vlReales * (-1)
    
    objCajas.nrCaja = Me.nrCaja
    ' Cotizaciones de la caja en cuestion
    objCajas.vlDiaDolar = Me.vlDiaDolar
    objCajas.vlDiaEuro = Me.vlDiaEuro
    objCajas.vlDiaReal = Me.vlDiaReal
    objCajas.vlPesos = Me.vlPesos
    objCajas.vlDolares = Me.vlDolares
    objCajas.vlEuros = Me.vlEuros
    objCajas.vlReales = Me.vlReales
    
    ' actualizamos el saldo se la caja
    If Not objCajas.ActualizarCaja(True) Then
        lerror = "Error: " + objCajas.Error
        Exit Function
    End If
    
    lerror = "El Comprobante se ha anulado con éxito."
    
    AnularComprobante = True
    

End Function


Public Function guardarComprobanteCajaPuestoAnterior() As Boolean

    guardarComprobanteCajaPuestoAnterior = False
    
    objSPs.nmStoredProcedure = "sp_guardarComprobanteCajaPuestoAnterior_v2_5"
    objSPs.setearCampoValor "@nrTalonario_param", Me.nrTalonario
    objSPs.setearCampoValor "@nrComprobante_param", Me.nrComprobante
    objSPs.setearCampoValor "@tpComprobante_param", Me.tpComprobante
    objSPs.setearCampoValor "@tpLetra_param", Me.tpLetra
    objSPs.setearCampoValor "@nrCierre_param", Me.nrCierre
    
    objSPs.setearCampoValor "@nrTalonario_new_param", Me.nrTalonario
    objSPs.setearCampoValor "@nrComprobante_new_param", Me.nrComprobante
    objSPs.setearCampoValor "@tpComprobante_new_param", Me.tpComprobante
    objSPs.setearCampoValor "@tpLetra_new_param", Me.tpLetra
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If
    guardarComprobanteCajaPuestoAnterior = True
    
End Function


Public Function marcarTipodeActualizacionCajaPuesto() As Boolean

    marcarTipodeActualizacionCajaPuesto = False
    
    objSPs.nmStoredProcedure = "sp_marcarTipodeActualizacionCajaPuesto_v3_7"
    objSPs.setearCampoValor "@nrTalonario_param", Me.nrTalonario
    objSPs.setearCampoValor "@nrComprobante_param", Me.nrComprobante
    objSPs.setearCampoValor "@tpComprobante_param", Me.tpComprobante
    objSPs.setearCampoValor "@tpLetra_param", Me.tpLetra
    ' Agregado, Eliminado , Anulado, Modificado
    objSPs.setearCampoValor "@tpModificacionCajaPuesto_param", Me.tpModificacionCajaPuesto
    objSPs.setearCampoValor "@dsObservacionCajaPuesto_param", Me.dsObservacionCajaPuesto
    
    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If
    marcarTipodeActualizacionCajaPuesto = True

End Function


Public Function obtenerCondVentayValoresdePagosModificados _
(pcdCondVenta_anterior As String, _
 pcdCondVenta_nueva As String, _
 pvlMontoViaje As String, _
 pvlPagoPesos As String, _
 pvlPagoDolares As String, _
 pvlPagoEuros As String, _
 pvlPagoReales As String) As Boolean

    obtenerCondVentayValoresdePagosModificados = False
    
    objSPs.nmStoredProcedure = "sp_obtenerCondVentayValoresdePagosModificados_v3_7"
    objSPs.setearCampoValor "@cdCondVenta_param", pcdCondVenta_anterior
    objSPs.setearCampoValor "@cdCondVenta_new_param", pcdCondVenta_nueva
    objSPs.setearCampoValor "@vlPagoPesos_param", pvlPagoPesos
    objSPs.setearCampoValor "@vlPagoDolares_param", pvlPagoDolares
    objSPs.setearCampoValor "@vlPagoEuros_param", pvlPagoEuros
    objSPs.setearCampoValor "@vlPagoReales_param", pvlPagoReales
    objSPs.setearCampoValor "@vlTotalGeneral", pvlMontoViaje

    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If
    
    Me.vlPesos = objSPs.rs_resultados("vlPagoPesos")
    Me.vlDolares = objSPs.rs_resultados("vlPagoDolares")
    Me.vlEuros = objSPs.rs_resultados("vlPagoEuros")
    Me.vlReales = objSPs.rs_resultados("vlPagoReales")
    
    Me.vlPagoPesosACP = objSPs.rs_resultados("vlPagoPesosACP")
    Me.vlPagoDolaresACP = objSPs.rs_resultados("vlPagoDolaresACP")
    Me.vlPagoEurosACP = objSPs.rs_resultados("vlPagoEurosACP")
    Me.vlPagoRealesACP = objSPs.rs_resultados("vlPagoRealesACP")
    
    obtenerCondVentayValoresdePagosModificados = True
    
    
End Function




' Reliza la Desanulacion de un comprobante
Public Function desanularComprobante() As Boolean
Dim resp     As Byte
Dim strSQL   As String

    desanularComprobante = False

    ' Agregar verificacion de anulado nos veces
    objCtaCteLic.nrTalonario = Me.nrTalonario
    objCtaCteLic.nrComprobante = Me.nrComprobante
    objCtaCteLic.tpComprobante = Me.tpComprobante
    objCtaCteLic.tpLetra = Me.tpLetra

    ' verificar si el comprobate a sido compensado
    If objCtaCteLic.esComprobanteCompensado() Then
        lerror = objCtaCteLic.Error
        desanularComprobante = False
        Exit Function
    End If
    
    ' Anular el cupon
    If Not objCtaCteLic.DesanularCupon() Then
        lerror = objCtaCteLic.Error
        Exit Function
    End If
        
    If Not Me.guardarComprobanteCajaPuestoAnterior() Then
        Exit Function
    End If

    ' Anulamos el comprobantes
    ObjTablasIO.nmTabla = "TB_Comprobantes"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", _
    "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", _
    "=", Me.tpLetra, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
    "=", Me.tpComprobante
    
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", CStr(Now())
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", 0
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
    
    If Not ObjTablasIO.Actualizar() Then
        lerror = "Error: " + ObjTablasIO.Error
        Exit Function
    End If
      
    ' Volvemos a tomar la factura en forma positiva
    Me.vlPesos = Me.vlPesos
    Me.vlDolares = Me.vlDolares
    Me.vlEuros = Me.vlEuros
    
    objCajas.nrCaja = Me.nrCaja
    ' Cotizaciones de la caja en cuestion
    objCajas.vlDiaDolar = Me.vlDiaDolar
    objCajas.vlDiaEuro = Me.vlDiaEuro
    objCajas.vlPesos = Me.vlPesos
    objCajas.vlDolares = Me.vlDolares
    objCajas.vlEuros = Me.vlEuros
    objCajas.vlReales = Me.vlReales
    
    ' actualizamos el saldo se la caja
    If Not objCajas.ActualizarCaja(True) Then
        lerror = "Error: " + objCajas.Error
        Exit Function
    End If
    
    lerror = "El Comprobante se ha desanulado con éxito."
    
    desanularComprobante = True
    

End Function

'  Version 2.5
Public Function deseliminarComprobante() As Boolean
Dim strMotivo As String

    deseliminarComprobante = False
    
    ' Grabar el estado anterior en la tabla de comprobantes cierres
    If Not objComprobante.guardarComprobanteCajaPuestoAnterior() Then
        Exit Function
    End If
    
    ' Grabar el motivo de la Eliminación
    If Not marcarTipodeActualizacionCajaPuesto() Then
        Exit Function
    End If

    
    ' Agregar verificacion de anulado nos veces
    objCtaCteLic.nrTalonario = Me.nrTalonario
    objCtaCteLic.nrComprobante = Me.nrComprobante
    objCtaCteLic.tpComprobante = Me.tpComprobante
    objCtaCteLic.tpLetra = Me.tpLetra

    ' verificar si el comprobate a sido compensado
    If objCtaCteLic.esComprobanteCompensado() Then
        lerror = objCtaCteLic.Error
        Exit Function
    End If
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", Me.nrComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", Me.nrTalonario, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", Me.tpComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", Me.tpLetra
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
    
    If Not ObjTablasIO.Actualizar() Then
        lerror = ObjTablasIO.Error
        Exit Function
    End If
    
    ' eliminar el detalle
    ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", Me.nrComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", Me.nrTalonario, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", Me.tpComprobante, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", Me.tpLetra
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
            
    If Not ObjTablasIO.Actualizar Then
        lerror = "Error al restaurar el detalle del comprobante"
        Exit Function
    End If
    
    ObjTablasIO.nmTabla = "TB_Comprobantes"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", Me.nrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", Me.nrTalonario, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", Me.tpComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", Me.tpLetra
    
    ' Modificado en la version 2.5
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
        
    If Not ObjTablasIO.Actualizar() Then
        lerror = "Error no se pudo desanulador el comprobante"
        Exit Function
    End If
    
    ' Si el comproibante no esta anulado restauramos el saldo sobre la caja
    If Me.flAnulado = 0 Then
            objCajas.nrCaja = Me.nrCaja
            objCajas.vlPesos = Me.vlPesos
            objCajas.vlDolares = Me.vlDolares
            objCajas.vlEuros = Me.vlEuros
            ' actualizamos el saldo se la caja
            If Not objCajas.ActualizarCaja(True) Then
                lerror = objCajas.Error
                Exit Function
            End If
    End If

    deseliminarComprobante = True
    
    lerror = "El comprobante se ha deseliminado con éxito."
    
    
End Function


'  Version 2.5
Public Function eliminarFisicamenteunComprobanteEliminadoLogicamente() As Boolean

    eliminarFisicamenteunComprobanteEliminadoLogicamente = False
    
    objSPs.nmStoredProcedure = "sp_eliminarFisicamenteunComprobanteEliminadoLogicamente_v2_5"
    objSPs.setearCampoValor "@nrTalonario_param", Me.nrTalonario
    objSPs.setearCampoValor "@nrComprobante_param", Me.nrComprobante
    objSPs.setearCampoValor "@tpComprobante_param", Me.tpComprobante
    objSPs.setearCampoValor "@tpLetra_param", Me.tpLetra

    If Not objSPs.ExecSP() Then
        lerror = objSPs.Error
        Exit Function
    End If
    
    eliminarFisicamenteunComprobanteEliminadoLogicamente = True
    
End Function
