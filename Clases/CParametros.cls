VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CParametros"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Type rcParametros
    nmCampo As String
    Valor   As String
End Type


Dim lmParametros()    As rcParametros

Public dsParametro       As String
Public vlParametro       As Variant
Public tpParametro       As String
Public flEditable      As String
Public nrTamanio         As String
Public dtActualizacion   As String


Private lerror        As String

' declaracion de las propiedades del objeto
Property Get Error() As String
    Error = lerror
End Property

Public Function ObtenerValor(pnmCampo As String) As String
Dim nI As Integer

    ObtenerValor = ""
    For nI = LBound(lmParametros) To UBound(lmParametros)
        If UCase(pnmCampo) = UCase(lmParametros(nI).nmCampo) Then
           ObtenerValor = lmParametros(nI).Valor
           Exit Function
        End If
    Next nI
    
    lerror = "No exite el Parametro"
    Debug.Assert Err
    
    
End Function

Public Sub GrabarValor(pnmCampo As String _
                            , pValor As String)
    Dim nI As Integer

    For nI = LBound(lmParametros) To UBound(lmParametros)
        If UCase(pnmCampo) = UCase(lmParametros(nI).nmCampo) Then
           lmParametros(nI).Valor = pValor
           Exit Sub
        End If
    Next nI
    
    ReDim Preserve lmParametros(LBound(lmParametros) To UBound(lmParametros) + 1)
    lmParametros(UBound(lmParametros) - 1).nmCampo = AdaptarNulos(pnmCampo, "")
    lmParametros(UBound(lmParametros) - 1).Valor = AdaptarNulos(pValor, "")
    
End Sub



Public Function ObtenerValorBD(pdsParametro As String) As Variant
Dim strMSG As String

    ObtenerValorBD = False

    ObjTablasIO.nmTabla = "tb_parametros"
    ObjTablasIO.setearCampoOperadorValor "dsParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsParametro", "=", pdsParametro
    ObjTablasIO.setearCampoOperadorValor "vlParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpParametro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flEditable", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrTamanio", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "->", ""
    
    If Not ObjTablasIO.Seleccionar() Then
        lerror = ObjTablasIO.Error
        Exit Function
    End If
        
    If ObjTablasIO.rs_resultados.EOF Then
        lerror = ObjTablasIO.Error
        Exit Function
    End If
    
    
    Me.dsParametro = ObjTablasIO.rs_resultados("dsParametro")
    
    On Error Resume Next
    Me.vlParametro = FormatearValor(ObjTablasIO.rs_resultados("tpParametro"), ObjTablasIO.rs_resultados("vlParametro"))
    
    If Err Then
        strMSG = "El parámertro " + ObjTablasIO.rs_resultados("dsParametro") + " no pudo se formateando a " + ObjTablasIO.rs_resultados("tpParametro") + vbCrLf
        strMSG = strMSG + "Valor = " + CStr(ObjTablasIO.rs_resultados("vlParametro")) + vbCrLf
        strMSG = strMSG + "El programa se cerrará, contactese con el administrador del sistema."
        MsgBox strMSG, vbCritical, "Error al convertir el parámetro"
        End
    End If
    
    On Error GoTo 0
    
    Me.tpParametro = ObjTablasIO.rs_resultados("tpParametro")
    Me.flEditable = ObjTablasIO.rs_resultados("flEditable")
    Me.nrTamanio = ObjTablasIO.rs_resultados("nrTamanio")
    Me.dtActualizacion = ObjTablasIO.rs_resultados("dtActualizacion")
    
    ObtenerValorBD = UCase(Me.vlParametro)
    
End Function


Private Function FormatearValor(ptpParamero As String, vlParametro As String) As Variant
    
    Select Case UCase(ptpParamero)
    Case "S/N", "TEXTO", "FECHA CORTA", "FECHA LARGA"
        FormatearValor = CStr(vlParametro)
    Case "DECIMAL"
        FormatearValor = CSng(vlParametro)
    Case "ENTERO"
        FormatearValor = CLng(vlParametro)
    Case Else
        FormatearValor = CStr(vlParametro)
    End Select
    
End Function


Private Sub Class_Initialize()
    ReDim lmParametros(0 To 0)
End Sub

