
Imports System.Security
Imports System.Security.Principal.WindowsIdentity




Public Class seguridad



    Public Shared [error] As String


    Public Shared Function obtenerUsuarioWindowsActual() As String

        obtenerUsuarioWindowsActual = GetCurrent.Name

    End Function


    Public Shared Function obtenerUID_Magma() As String
        Dim posi As Integer

        posi = InStr(GetCurrent.Name, "\", CompareMethod.Text)
        obtenerUID_Magma = Right(GetCurrent.Name, GetCurrent.Name.Length - posi)

    End Function


    Public Shared Function esAccesoValido() As Boolean
        Dim Sql As String

        esAccesoValido = False
        ' obtenemos el detalle de la liuidacion 
        Sql = " select * from mt_permisos_gen where usuario='" + obtenerUID_Magma() + "' "
        Sql = Sql + " 	and proceso = 'MGExplorer' "

        If Not AdmConexiones.ejecutarQuerySQLFE(Sql) Then
            [error] = "Error al realizar la consulta de acceso"
            esAccesoValido = False
            Exit Function
        End If

        If AdmConexiones.rsSQLFE.HasRows Then
            If AdmConexiones.rsSQLFE.Read Then
                esAccesoValido = True
            Else
                [error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"
            End If
        Else
            [error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"

            Exit Function
        End If


    End Function


    Public Shared Function esAccesoValidoaOpcion _
                            (ByVal pnmOpcion As String) As Boolean
        Dim Sql As String

        esAccesoValidoaOpcion = False
        ' obtenemos el detalle de la liuidacion 
        Sql = " select * from mt_permisos_gen where usuario='" + obtenerUID_Magma() + "' "
        Sql = Sql + " 	and proceso = 'MGExplorer' "

        If Not AdmConexiones.ejecutarQuerySQLFE(Sql) Then
            [error] = "Error al realizar la consulta de acceso"
            esAccesoValidoaOpcion = False
            Exit Function
        End If

        If AdmConexiones.rsSQLFE.HasRows Then
            If AdmConexiones.rsSQLFE.Read Then
                esAccesoValidoaOpcion = True
            Else
                [error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"
                Log.EscbribirLinea_Log([error])
            End If
        Else
            [error] = "El usuario '" + obtenerUID_Magma() + "' no tiene acceso al este sistema"
            Log.EscbribirLinea_Log([error])
            Exit Function
        End If


    End Function



End Class
