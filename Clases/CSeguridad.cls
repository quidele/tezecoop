VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CSeguridad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public objUsuarioSupervisor    As New CUsuario

Public Function ObtenerPermisoSupervisor() As Boolean

    ObtenerPermisoSupervisor = False
    
    
    Set objUsuarioSupervisor = Nothing
    Set objUsuarioSupervisor = New CUsuario
    
    objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
    objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
    

    ' ************************************** '
    MsgBox "A continuación deberá ingresar las credenciales, usuario y clave de un supervisor.", vbInformation + vbDefaultButton1, "Seguridad"
    Frm_Acceso_Operaciones.Show 1
    
    If objParametros.ObtenerValor("CANCELA") = "SI" Then
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
        objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
        Exit Function
    End If
    
    objUsuarioSupervisor.dsUsuario = objParametros.ObtenerValor("dsUsuario_Acceso_Supervisor")
    objUsuarioSupervisor.dsPassword = objParametros.ObtenerValor("dsPassword_Acceso_Supervisor")
    
    If objUsuarioSupervisor.ValidarUsuario() = False Then
         MsgBox "El usuario ingresado no es válido o la clave es inválida, no puede ingresar a esta opción.", vbCritical, "Atención"
         
         objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
         objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
         Exit Function
    End If
    
    If objUsuarioSupervisor.dsUsuario = objUsuario.dsUsuario Then
        If objUsuarioSupervisor.tpNivelJerarquico = "Supervisor" Then
            MsgBox "No puede acceder a esta opción con su usuario, requiere las credenciales de otro supervisor.", vbCritical, "Atención"
        Else
            MsgBox "No puede acceder a esta opción con su usuario, requiere las credenciales de un supervisor.", vbCritical, "Atención"
        End If
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
        objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
        Exit Function
    End If
    If objUsuarioSupervisor.tpNivelJerarquico <> "Supervisor" Then
        MsgBox "El usuario ingresado no es supervisor. Para acceder a esta opción requiere las credenciales de un supervisor", vbCritical, "Atención"
        objParametros.GrabarValor "dsUsuario_Acceso_Supervisor", ""
        objParametros.GrabarValor "dsPassword_Acceso_Supervisor", ""
        Exit Function
    End If
    ' ************************************** '

    ObtenerPermisoSupervisor = True

End Function

