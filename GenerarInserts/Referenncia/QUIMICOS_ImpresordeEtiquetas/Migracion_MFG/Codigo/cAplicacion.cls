VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cAplicacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public m_con_mfg_ebfonse As Connection
Public m_con_mfg_cueros  As Connection
Public m_con_OYG         As Connection
Public m_con_MAGMA       As Connection
Private m_Proyecto As String
Private m_Base As String
Private m_ConfiguracionRegional As Integer  '0 - dd/mm
                                            '1 - mm/dd

Public Property Let ConfiguracionRegional(unInteger As Integer)
    m_ConfiguracionRegional = unInteger
End Property

Public Property Get ConfiguracionRegional() As Integer
    ConfiguracionRegional = m_ConfiguracionRegional
End Property

Public Sub ObtenerConfiguracionRegional(numero As Long)
    ' recibe la representacion interna del cliente de
    ' la fecha #1/10/1900# y analiza la configuracion
    ' regional del cliente
    
    Select Case numero
        Case 32883
            ConfiguracionRegional = 1
        Case 33147
            ConfiguracionRegional = 0
    End Select
End Sub

Public Property Get base() As String
    base = m_Base
End Property

Public Property Let base(unString As String)
    m_Base = unString
End Property

Public Property Get FechaSys() As Date
    FechaSys = Now
End Property

Public Property Let proyecto_ebfonse(unString As String)
    m_Proyecto = unString
    Dim con As cConexion
    
    Set con = New cConexion
    Set m_con_mfg_ebfonse = New Connection
    m_con_mfg_ebfonse.ConnectionString = con.StringDeConexion(proyecto, "progress", "Opciones_MFG_BD_EBFONSE")
    m_con_mfg_ebfonse.Open
        
End Property



Public Property Let proyecto_Cueros(unString As String)

    m_Proyecto = unString
    Dim con As cConexion
    Set con = New cConexion
    Set m_con_mfg_cueros = New Connection
    m_con_mfg_cueros.ConnectionString = con.StringDeConexion(proyecto, "progress", "Opciones_MFG_BD_EBCUEROS")
    m_con_mfg_cueros.Open
    
End Property


Public Property Let proyecto_Magma(unString As String)

    m_Proyecto = unString
    Dim con As cConexion
    Set con = New cConexion
    Set m_con_MAGMA = New Connection
    m_con_MAGMA.ConnectionString = con.StringDeConexion(proyecto, "sql", "Opciones_MFG_BD_MAGMA")
    m_con_MAGMA.Open
    
End Property

Public Property Let proyecto_OYG(unString As String)
  
    m_Proyecto = unString
    
    Dim con As cConexion
    Set con = New cConexion
    Set m_con_OYG = New Connection
    m_con_OYG.ConnectionString = con.StringDeConexion(proyecto, m_Base, "Opciones_OYG")
    m_con_OYG.Open
    
End Property

Public Property Get proyecto() As String
    proyecto = m_Proyecto
End Property

Private Sub Class_Initialize()
    On Error GoTo ErrorHandler
    
'    Set m_Propiedades = New Dictionary
    Set m_con_mfg_cueros = New Connection
    
    Exit Sub
    
ErrorHandler:
'    AgregarError Me, "Class_Initialize", error_noEspecificado
End Sub

Public Sub liberar()

    '    On Error GoTo ErrorHandler
    '
    ''    Set m_UsuarioLogueado = Nothing
    ''    Set m_Funcion = Nothing
    ''    Set m_Empresa = Nothing
    ''    Set m_Sucursal = Nothing
    '
    'Exit Sub
    '
    'ErrorHandler:
    '    AgregarError Me, "liberar", error_noEspecificado

End Sub


Public Sub cerrarConexiones()

    On Error GoTo salir
    ' Cierro la conexion en forma segura
    If m_con_mfg_ebfonse.State = adStateOpen Then
        m_con_mfg_ebfonse.Close
    End If
    
    Set m_con_mfg_ebfonse = Nothing
    
    If m_con_mfg_cueros.State = adStateOpen Then
        m_con_mfg_cueros.Close
    End If
    
    If Me.m_con_OYG = adStateOpen Then
        m_con_OYG.Close
    End If
    
salir:
    Set m_con_mfg_cueros = Nothing
    Set m_con_mfg_ebfonse = Nothing
    Set m_con_OYG = Nothing
    
End Sub


Private Sub Class_Terminate()

    cerrarConexiones

End Sub
