VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CComisiones"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


' deshabilitado en la version 4.1
'Public Function obtenerComision(pvlTotalGeneral As Single, Condicion_Venta As String, tpComision As String, pdsCodigoDestinos As String) As Single
'
'    obtenerComision = 0
'    If pvlTotalGeneral = 0 Then Exit Function
'
'    If UCase(tpComision) = "RETORNO" Then
'        obtenerComision = obtenerComisionRetorno(pvlTotalGeneral, Condicion_Venta, tpComision, pdsCodigoDestinos)
'        Exit Function
'    End If
'
'    ObjTablasIO.nmTabla = "TB_Comisiones"
'    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
'    ObjTablasIO.setearCampoOperadorValor "vlMontoMinimo", "<=", CStr(pvlTotalGeneral), " AND "
'    ObjTablasIO.setearCampoOperadorValor "vlMontoMaximo", ">=", CStr(pvlTotalGeneral), " AND "
'    ObjTablasIO.setearCampoOperadorValor "tpComision", "=", "Viaje"
'    ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
'    ObjTablasIO.setearCampoOperadorValor "vlComisionEmpleados", "->", ""
'    ObjTablasIO.Seleccionar
'
'    If Not ObjTablasIO.rs_resultados.EOF Then
'        Select Case tpComision
'        Case "A Empleados"
'            obtenerComision = ObjTablasIO.rs_resultados("vlComisionEmpleados").value
'        Case "A Clientes"
'            obtenerComision = ObjTablasIO.rs_resultados("vlComision").value
'        Case Else
'            obtenerComision = 0
'        End Select
'    Else
'        obtenerComision = 0
'    End If
'
'End Function
'

' Eulises 20080820
' Desabilita en la version 4.1
'Private Function obtenerComisionRetorno(pvlTotalGeneral As Single, pCondicion_Venta As String, tpComision As String, pdsCodigoDestinos As String) As Single
'
'    ' voy por ACA 20080820
'
'    objSPs.nmStoredProcedure = "SP_obtenerComisionRetorno_v3_4"
'    objSPs.setearCampoValor "@vlTotalGeneral_param", pvlTotalGeneral
'    objSPs.setearCampoValor "@tpComision_param", "Retorno"
'    objSPs.setearCampoValor "@tpCliente_param", tpComision
'    objSPs.setearCampoValor "@dsCodigoDestinos_param", pdsCodigoDestinos
'
'    If Not objSPs.ExecSP() Then
'        obtenerComisionRetorno = False
'        MsgBox "Error al ejecutar el obtenerComisionRetorno" + objSPs.Error, vbCritical + vbDefaultButton1, "Atención"
'        Exit Function
'    End If
'
'     If objSPs.rs_resultados.EOF Then
'        obtenerComisionRetorno = False
'        MsgBox "Error al ejecutar el obtenerComisionRetorno" + objSPs.Error, vbCritical + vbDefaultButton1, "Atención"
'        obtenerComisionRetorno = 0
'    Else
'        obtenerComisionRetorno = objSPs.rs_resultados("vlComision")
'    End If
'
'End Function

Public Function obtenerComision(pvlTotalGeneral As Single, pCondicion_Venta As String, _
                                tpComision As String, pdsCodigoDestinos As String, tpComprobante_param As String) As Single


    objSPs.nmStoredProcedure = "sp_obtenerComision_v4_2"
    objSPs.setearCampoValor "@tpComprobante_param", tpComprobante_param
    objSPs.setearCampoValor "@vlTotalGeneral_param", pvlTotalGeneral
    objSPs.setearCampoValor "@tpComision_param", tpComision
    objSPs.setearCampoValor "@tpCliente_param", tpComision
    objSPs.setearCampoValor "@dsCodigoDestinos_param", pdsCodigoDestinos
    
    
    If Not objSPs.ExecSP() Then
        obtenerComision = False
        MsgBox "Error al ejecutar el obtenerComision" + objSPs.Error, vbCritical + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    If objSPs.rs_resultados.EOF Then
        obtenerComision = False
        MsgBox "Error al ejecutar el obtenerComision" + objSPs.Error, vbCritical + vbDefaultButton1, "Atención"
        obtenerComision = 0
    Else
        obtenerComision = objSPs.rs_resultados("vlComision")
    End If
    
End Function



