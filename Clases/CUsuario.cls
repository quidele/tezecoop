VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CUsuario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit

Public dsUsuario            As String
Public dsPassword           As String
Public tpAcceso             As String
Public dsError              As String
Public nmEmpleado           As String
Public flBloqueado          As Boolean
Public tpNivelJerarquico    As String


Public Function ValidarUsuario() As Boolean
Dim strSQL      As String

    Me.flBloqueado = False
    ObjTablasIO.nmTabla = "TB_Usuarios"
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dspassword", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpAcceso", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flBloqueado", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", Me.dsUsuario, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Me.dsError = "El usuario no existe."
        ValidarUsuario = False
        Exit Function
    Else
        If UCase(ObjTablasIO.rs_resultados("dspassword").value) = UCase(objbasededatos.hashCadena(Me.dsPassword)) Then
            Me.dsUsuario = ObjTablasIO.rs_resultados("dsUsuario").value
            Me.tpAcceso = ObjTablasIO.rs_resultados("tpAcceso").value
            Me.nmEmpleado = AdaptarNulos(ObjTablasIO.rs_resultados("nmNombre").value, "") + " " + _
                            AdaptarNulos(ObjTablasIO.rs_resultados("nmApellido").value, "")
                            
            Me.tpNivelJerarquico = ObjTablasIO.rs_resultados("tpNivelJerarquico").value
            Me.flBloqueado = ObjTablasIO.rs_resultados("flBloqueado").value
            
            If Me.flBloqueado Then
                Me.dsError = "No tiene acceso al sistema, el usuario " + Me.dsUsuario + " se encuentra bloqueado."
                ValidarUsuario = False
                Exit Function
            End If
            
            If UCase(Me.tpAcceso) = UCase("Administración") And _
               objConfig.nrPuesto <> "9" Then
                Me.dsError = "No tiene acceso, un usuario de la Administración no puede iniciar una sesión en un puesto."
                ValidarUsuario = False
            End If
            ValidarUsuario = True
            Exit Function
        Else
            Me.dsError = "La password es incorrecta."
            ValidarUsuario = False
            Exit Function
        End If
    End If
    
    
    
End Function




Public Function ObtenerAcceso(pnmFuncion As String, ptpAcceso As String, ptpNivelJerarquico As String) As Boolean

    objSPs.nmStoredProcedure = "sco_acceso_permitido"
    objSPs.setearCampoValor "p_tpNivelAcceso", ptpAcceso
    objSPs.setearCampoValor "p_nmOpcionMenu", pnmFuncion
    objSPs.setearCampoValor "p_tpNivelJerarquico", ptpNivelJerarquico
    
    If objSPs.ExecSP Then
        MsgBox "Error al obtener el nivel de acceso, el programa se cerrará", vbCritical, "Seguridad"
        End
    End If
    
    
    If objSPs.rs_resultados("flAcceso") = "SI" Then
        dsError = ""
        ObtenerAcceso = True
    Else
        dsError = objSPs.rs_resultados("dsErrorAcceso")
        ObtenerAcceso = False
    End If
    
    
End Function



' agregado en la version 2.8
Public Function obtenerUsuariosActivosCajasPuestos() As Object
Dim strSQL      As String

    Me.flBloqueado = False
    ObjTablasIO.nmTabla = "TB_Usuarios"
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
    ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0", " AND "
    ObjTablasIO.setearCampoOperadorValor "tpAcceso", "=", "Puestos"
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Set obtenerUsuariosActivosCajasPuestos = Nothing
    Else
        Set obtenerUsuariosActivosCajasPuestos = ObjTablasIO.rs_resultados
    End If
    

End Function





' agregado en la version 2.8
Public Function obtenerUsuariosActivos() As Object
Dim strSQL      As String

    Me.flBloqueado = False
    ObjTablasIO.nmTabla = "TB_Usuarios"
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
    ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0"
    
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Set obtenerUsuariosActivos = Nothing
    Else
        Set obtenerUsuariosActivos = ObjTablasIO.rs_resultados
    End If
    

End Function


Public Function obtenerUsuariosSupervisores() As Object
Dim strSQL      As String

    Me.flBloqueado = False
    ObjTablasIO.nmTabla = "TB_Usuarios"
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
    ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0", " AND "
    ObjTablasIO.setearCampoOperadorValor "tpNivelJerarquico", "=", "Supervisor"
    
    
    ObjTablasIO.Seleccionar
    
    If ObjTablasIO.rs_resultados.EOF Then
        Set obtenerUsuariosSupervisores = Nothing
    Else
        Set obtenerUsuariosSupervisores = ObjTablasIO.rs_resultados
    End If
    

End Function

