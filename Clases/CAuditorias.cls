VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAuditorias"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public IdAuditoria As Integer
Public Modulo  As String
Public funcion As String
Public dsAuditoria As String
Public dsUsuario   As String
Public nrCaja  As String
Public tsAuditoria As String
Public dtAuditoria As String
Public nrPuesto    As String

Private lerror                      As String


Property Get Error() As String
    Error = lerror
End Property

Public Function grabarAuditoria() As Boolean
    
    ObjTablasIO.nmTabla = "TB_Auditorias"

    ObjTablasIO.setearCampoOperadorValor "Modulo", "<-", Me.Modulo
    ObjTablasIO.setearCampoOperadorValor "funcion", "<-", Me.funcion
    ObjTablasIO.setearCampoOperadorValor "dsAuditoria", "<-", Me.dsAuditoria
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", Me.dsUsuario
    
    
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", Me.nrCaja
    ObjTablasIO.setearCampoOperadorValor "tsAuditoria", "<-", objbasededatos.getDateasString
    ObjTablasIO.setearCampoOperadorValor "dtAuditoria", "<-", objbasededatos.getDateasString
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", Me.nrPuesto
    
    If ObjTablasIO.Insertar Then
        grabarAuditoria = True
    Else
        lerror = ObjTablasIO.Error
    End If
        
        
End Function


Public Function obtenerAuditoriaxCajaModuloFunction() As Boolean

    ObjTablasIO.nmTabla = "TB_Auditorias"

    ObjTablasIO.setearCampoOperadorValor "IdAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "Modulo", "->", ""
    ObjTablasIO.setearCampoOperadorValor "funcion", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tsAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    
    
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ""
    ObjTablasIO.setearCampoOperadorValor "Modulo", "=", ""
    ObjTablasIO.setearCampoOperadorValor "funcion", "=", ""
     
    
    If ObjTablasIO.Seleccionar Then
        obtenerAuditoriaxCajaModuloFunction = True
    Else
        lerror = ObjTablasIO.Error
    End If
        
        
End Function



Public Function obtenerAuditoriaxCaja() As Boolean

    ObjTablasIO.nmTabla = "TB_Auditorias"

    ObjTablasIO.setearCampoOperadorValor "IdAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "Modulo", "->", ""
    ObjTablasIO.setearCampoOperadorValor "funcion", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tsAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtAuditoria", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    
    
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ""

     
    If ObjTablasIO.Seleccionar Then
        obtenerAuditoriaxCaja = True
    Else
        lerror = ObjTablasIO.Error
    End If
        
        
End Function

