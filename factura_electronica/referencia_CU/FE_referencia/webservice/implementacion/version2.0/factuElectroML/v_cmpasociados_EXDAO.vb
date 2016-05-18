Public Class v_cmpasociados_EXDAO

    Public [error] As String
    Public listav_cmpasociados_EX As New ArrayList
    Public v_cmpasociados_EXBuscado As v_cmpasociados_EX


    Private Function rsto_v_cmpasociados_EX(ByVal pv_cmpasociados_EX As v_cmpasociados_EX, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean


        pv_cmpasociados_EX.idsolicitud.valor = rs("idsolicitud")
        pv_cmpasociados_EX.Cbte_punto_vta.valor = rs("Cbte_punto_vta")
        pv_cmpasociados_EX.Cbte_nro.valor = rs("Cbte_nro")
        pv_cmpasociados_EX.Cbte_tipo.valor = rs("Cbte_tipo")

        pv_cmpasociados_EX.idsolicitud.tipo = rs("idsolicitud").GetType
        pv_cmpasociados_EX.Cbte_punto_vta.tipo = rs("Cbte_punto_vta").GetType
        pv_cmpasociados_EX.Cbte_nro.tipo = rs("Cbte_nro").GetType
        pv_cmpasociados_EX.Cbte_tipo.tipo = rs("Cbte_tipo").GetType

    End Function



    Public Function obtenerV_cmpasociados_EX(ByVal pv_cmpasociados_EX As Campo) As Boolean
        Dim Sql As String
        Dim un_v_cmpasociados_Ex As v_cmpasociados_EX
        obtenerV_cmpasociados_EX = False

        Sql = "SELECT "
        Sql = Sql + "idsolicitud,"
        Sql = Sql + "Cbte_punto_vta,"
        Sql = Sql + "Cbte_nro,"
        Sql = Sql + "Cbte_tipo"
        Sql = Sql + " From v_cmpasociados_EX "
        Sql = Sql + " where idsolicitud = " + SQLAdapter.formatValuetoSQL(pv_cmpasociados_EX)


        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read

                un_v_cmpasociados_Ex = New v_cmpasociados_EX() '-- Crea objeto v_cmpasociados_EX con sus atributos (campos)

                Me.rsto_v_cmpasociados_EX(un_v_cmpasociados_Ex, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto v_cmpasociados_EX


                listav_cmpasociados_EX.Add(un_v_cmpasociados_Ex) '-- Agrega la solicitud al ARRAY de v_cmpasociados_EX
                v_cmpasociados_EXBuscado = un_v_cmpasociados_Ex
                obtenerV_cmpasociados_EX = True
            Loop
        Else
            Me.error = "No existen registros para procesar en v_cmpasociados_EX"
            Log.EscbribirLinea_Log("No existen registros para procesar en v_cmpasociados_EX")
            Exit Function
        End If


    End Function

End Class
