
Imports System.Security
Imports System.Security.Principal.WindowsIdentity


Public Class seguridad


    Private [_error] As String
    Public ReadOnly Property [Error]() As String
        Get
            Return [_error]
        End Get
        
    End Property


    Public Function obtenerUsuarioWindowsActual() As String

        obtenerUsuarioWindowsActual = GetCurrent.Name

    End Function


    Public Function obtenerUID_Magma() As String
        Dim posi As Integer

        posi = InStr(GetCurrent.Name, "\", CompareMethod.Text)
        obtenerUID_Magma = Right(GetCurrent.Name, GetCurrent.Name.Length - posi)

    End Function


    Public Function esAccesoValido() As Boolean
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia
        esAccesoValido = False
        ' obtenemos el detalle de la liuidacion 
        Sql = " select * from mt_permisos_gen where usuario='" + obtenerUID_Magma() + "' "
        Sql = Sql + " 	and proceso = 'MGExplorer' "

        If Not objAdmConexiones.EjecutarQuerySQL(Sql) Then
            [_error] = "Error al realizar la consulta de acceso"
            esAccesoValido = False
            Exit Function
        End If

        If objAdmConexiones.rsSQL.HasRows Then
            If objAdmConexiones.rsSQL.Read Then
                esAccesoValido = True
            Else
                [_error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"
            End If
        Else
            [_error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"

            Exit Function
        End If

        objAdmConexiones.rsSQL.Close()
    End Function


    Public Function esAccesoValidoaOpcion _
                            (ByVal pnmOpcion As String) As Boolean
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia

        esAccesoValidoaOpcion = False
        ' obtenemos el detalle de la liuidacion 
        Sql = " select * from mt_permisos_gen where usuario='" + obtenerUID_Magma() + "' "
        Sql = Sql + " 	and proceso = 'MGExplorer' "

        If Not objAdmConexiones.EjecutarQuerySQL(Sql) Then
            [_error] = "Error al realizar la consulta de acceso"
            esAccesoValidoaOpcion = False
            Exit Function
        End If

        If objAdmConexiones.rsSQL.HasRows Then
            If objAdmConexiones.rsSQL.Read Then
                esAccesoValidoaOpcion = True
            Else
                [_error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"
            End If
        Else
            [_error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"

            Exit Function
        End If


    End Function

  
  
End Class
