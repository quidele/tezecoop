VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCliente"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public cdCliente As String
Public dsRazonSocial As String
Public tpDoc As String
Public nrDoc As String
Public dsEmail As String
Public nrPuesto As String
Public tpFormadePago As String

    


Dim lerror As String

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property


Public Function ObtenerNuevocdCliente(pnrPuesto As String) As String

    objSPs.nmStoredProcedure = "SP_ObtenerMaxcdCliente_v1_8"
    objSPs.setearCampoValor "@nrPuesto", pnrPuesto
    
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
        End
    End If
    
    ObtenerNuevocdCliente = CStr(objSPs.rs_resultados("MaxcdCliente") + 1)
    
    
End Function



Public Function insertarCliente() As Boolean
Dim strValor As String

    insertarCliente = True
    
    strValor = ObtenerNuevocdCliente(nrPuesto)
    
    ObjTablasIO.nmTabla = "TB_Clientes"
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", dsRazonSocial
    ObjTablasIO.setearCampoOperadorValor "tpDoc", "<-", tpDoc
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "<-", nrDoc
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "<-", dsEmail
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", nrPuesto
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", Me.cdCliente
    ObjTablasIO.setearCampoOperadorValor "tpCliente", "<-", "Empresa"
    
    If Not ObjTablasIO.Insertar Then
       insertarCliente = False
    Else
       insertarCliente = True
    End If


End Function


Public Function guardarCliente() As Boolean
Dim strValor As String

    guardarCliente = True
    
    strValor = ObtenerNuevocdCliente(nrPuesto)
    
    ObjTablasIO.nmTabla = "TB_Clientes"
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", dsRazonSocial
    ObjTablasIO.setearCampoOperadorValor "tpDoc", "<-", tpDoc
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "<-", nrDoc
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "<-", dsEmail
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", nrPuesto
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", cdCliente
    ObjTablasIO.setearCampoOperadorValor "tpCliente", "<-", "Empresa"
    
    If Not ObjTablasIO.Actualizar Then
       guardarCliente = False
    Else
       guardarCliente = True
    End If


End Function



Public Function ObtenerCliente(pcdCliente As String) As Boolean

    ObjTablasIO.nmTabla = "TB_Clientes"
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", dsRazonSocial
    ObjTablasIO.setearCampoOperadorValor "tpDoc", "->", tpDoc
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", nrDoc
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", dsEmail
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", nrPuesto
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", pcdCliente
    ObjTablasIO.setearCampoOperadorValor "tpFormadePago", "->", ""
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
       ObtenerCliente = False
    Else
        dsRazonSocial = objbasededatos.rs_resultados_valor("dsRazonSocial")
        tpDoc = objbasededatos.rs_resultados_valor("tpDoc")
        nrDoc = objbasededatos.rs_resultados_valor("nrDoc")
        dsEmail = objbasededatos.rs_resultados_valor("dsEmail")
        nrPuesto = objbasededatos.rs_resultados_valor("nrPuesto")
        tpFormadePago = objbasededatos.rs_resultados_valor("tpFormadePago")
        ObtenerCliente = True
    End If


End Function


Public Function ExisteCliente(pdsRazonSocial As String) As Boolean
Dim strValor As String

    ObjTablasIO.nmTabla = "TB_Clientes"
    
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "=", pdsRazonSocial
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpDoc", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpFormadePago", "->", ""
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
       ExisteCliente = False
    Else
        dsRazonSocial = objbasededatos.rs_resultados_valor("dsRazonSocial")
        tpDoc = objbasededatos.rs_resultados_valor("tpDoc")
        nrDoc = objbasededatos.rs_resultados_valor("nrDoc")
        dsEmail = objbasededatos.rs_resultados_valor("dsEmail")
        nrPuesto = objbasededatos.rs_resultados_valor("nrPuesto")
        cdCliente = objbasededatos.rs_resultados_valor("cdCliente")
        tpFormadePago = objbasededatos.rs_resultados_valor("tpFormadePago")
        ExisteCliente = True
    End If

End Function


