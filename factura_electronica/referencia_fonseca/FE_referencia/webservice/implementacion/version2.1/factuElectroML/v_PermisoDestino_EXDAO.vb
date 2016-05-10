Public Class v_PermisoDestino_EXDAO

    Public [error] As String
    Public listav_PermisoDestino_EX As New ArrayList
    Public v_PermisoDestino_EXBuscado As v_PermisoDestino_EX

    Private Function rsto_v_PermisoDestino_EX(ByVal pv_PermisoDestino_EX As v_PermisoDestino_EX, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean


        pv_PermisoDestino_EX.idsolicitud.valor = rs("idsolicitud")
        pv_PermisoDestino_EX.Id_permisos.valor = rs("Id_permisos")
        pv_PermisoDestino_EX.Dst_merc.valor = rs("Dst_merc")

        pv_PermisoDestino_EX.idsolicitud.tipo = rs("idsolicitud").GetType
        pv_PermisoDestino_EX.Id_permisos.tipo = rs("Id_permisos").GetType
        pv_PermisoDestino_EX.Dst_merc.tipo = rs("Dst_merc").GetType

    End Function

    Public Function obtenerv_PermisoDestino_EX(ByVal pv_PermisoDestino_EX As Campo) As Boolean

        Dim Sql As String
        Dim un_v_PermisoDestino_EX As v_PermisoDestino_EX
        obtenerv_PermisoDestino_EX = False


        Sql = "SELECT "
        Sql = Sql + "idsolicitud,"
        Sql = Sql + "Id_permisos,"
        Sql = Sql + "Dst_merc "
        Sql = Sql + " FROM v_PermisoDestino_EX WHERE idsolicitud = " + SQLAdapter.formatValuetoSQL(pv_PermisoDestino_EX)


        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read

                un_v_PermisoDestino_EX = New v_PermisoDestino_EX() '-- Crea objeto v_PermisoDestino_EX con sus atributos (campos)

                Me.rsto_v_PermisoDestino_EX(un_v_PermisoDestino_EX, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto v_PermisoDestino_EX


                listav_PermisoDestino_EX.Add(un_v_PermisoDestino_EX) '-- Agrega la solicitud al ARRAY de v_PermisoDestino_EX
                v_PermisoDestino_EXBuscado = un_v_PermisoDestino_EX
                obtenerv_PermisoDestino_EX = True
            Loop
        Else
            Me.error = "No existen registros para procesar en v_PermisoDestino_EX"
            Log.EscbribirLinea_Log("No existen registros para procesar en v_PermisoDestino_EX")
            Exit Function
        End If

    End Function

End Class
