VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cEmpresa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const mk_tabla = "empresa"

Private m_nombreEmpresa As String
Private m_BaseDeDatos As String
Private m_Usuario As String
Private m_Password As String



Public Property Get nombre() As String
    nombre = m_nombreEmpresa
End Property

Public Property Let nombre(unString As String)
    m_nombreEmpresa = unString
End Property

Public Property Get database() As String
    database = m_BaseDeDatos
End Property

Public Property Let database(unString As String)
    m_BaseDeDatos = unString
End Property

Public Property Get usuario() As String
    usuario = m_Usuario
End Property

Public Property Let usuario(unString As String)
    m_Usuario = unString
End Property

Public Property Get password() As String
    password = m_Password
End Property

Public Property Let password(unString As String)
    m_Password = unString
End Property

Public Function obtenerEmpresas() As Recordset
    Dim sSql_MFG As String
    Dim cmd As Command
    Dim sSql_INF As String
    
    
    
    On Error GoTo ErrorHandler
    
    ' INFORMIX
    ' sSql_INF = "SELECT nombre,base "
    ' sSql_INF = sSql_INF & " FROM empresa"
    ' sSql_INF = sSql_INF & " WHERE base IN(SELECT alfa FROM param WHERE arg = 'fo_bases_cc')"

    ' MFG PROGRESS
    sSql_MFG = " select  code_cmmt as nombre , '' as base from PUB.code_mstr where  code_fldname='emp_etiq' "
    Set cmd = New Command
    
    With cmd
        .ActiveConnection = aplicacion.m_con_mfg_ebfonse
        .CommandType = adCmdText
        .CommandText = sSql_MFG
        Set obtenerEmpresas = .Execute
    End With
    
    
    Exit Function

ErrorHandler:
    Set obtenerEmpresas = Nothing
End Function
