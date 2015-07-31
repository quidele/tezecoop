VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CUtilsBD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit


Public Function armarCampoOperadorValor(pnmTabla As String, pnmCampo As String, _
                                        pnmOperador As String, _
                                        ByVal pnmvalor) As String

    
    
    ObjTablasIO.nmTabla = pnmTabla
    Select Case Trim(pnmOperador)
    Case "="
        armarCampoOperadorValor = pnmCampo + pnmOperador + ObjTablasIO.FormatearValor(pnmvalor, pnmCampo)
    Case "<"
        armarCampoOperadorValor = pnmCampo + pnmOperador + ObjTablasIO.FormatearValor(pnmvalor, pnmCampo)
    Case ">"
        armarCampoOperadorValor = pnmCampo + pnmOperador + ObjTablasIO.FormatearValor(pnmvalor, pnmCampo)
    Case ">="
        armarCampoOperadorValor = pnmCampo + pnmOperador + ObjTablasIO.FormatearValor(pnmvalor, pnmCampo)
    Case "<="
        armarCampoOperadorValor = pnmCampo + pnmOperador + ObjTablasIO.FormatearValor(pnmvalor, pnmCampo)
    Case "LIKE"
        armarCampoOperadorValor = ObjTablasIO.ArmarLikeSegunMotorSQL(pnmvalor, pnmCampo, pnmOperador, " ")
    End Select


End Function


    



