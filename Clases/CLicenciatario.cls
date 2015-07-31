VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CLicenciatario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit



Public Function esMontoIgualaLicencia(ByVal pnrLicencia As String, ByVal pvlMontoCupon As Single) As Boolean
Dim vlnrLicencia  As Single
Dim vlMontoCupon  As Single


    pnrLicencia = Replace(pnrLicencia, ",", ".")
    pvlMontoCupon = Replace(pvlMontoCupon, ",", ".")
    
    
    If IsNumeric(pnrLicencia) Then
        vlnrLicencia = CSng(pnrLicencia)
    Else
        vlnrLicencia = 0
    End If
    
    If IsNumeric(pvlMontoCupon) Then
        vlMontoCupon = CSng(pvlMontoCupon)
    Else
        vlMontoCupon = 0
    End If
    
    If vlnrLicencia = vlMontoCupon Then
        esMontoIgualaLicencia = True
    Else
        esMontoIgualaLicencia = False
    End If
         
         
End Function
