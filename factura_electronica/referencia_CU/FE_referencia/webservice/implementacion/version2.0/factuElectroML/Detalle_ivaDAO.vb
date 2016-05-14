Public Class Detalle_ivaDAO

    Public [error] As String
    Public listaDetalle_iva As New ArrayList
    Public Detalle_ivaBuscado As Detalle_iva


    Private Function rsto_Detalle_iva(ByVal pDetalle_iva As Detalle_iva, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pDetalle_iva.idsolicitud.valor = rs("idsolicitud")
        pDetalle_iva.Id.valor = rs("Id")
        pDetalle_iva.BaseImp.valor = rs("BaseImp")
        pDetalle_iva.Importe.valor = rs("Importe")


        pDetalle_iva.idsolicitud.tipo = rs("idsolicitud").GetType()
        pDetalle_iva.Id.tipo = rs("Id").GetType()
        pDetalle_iva.BaseImp.tipo = rs("BaseImp").GetType()
        pDetalle_iva.Importe.tipo = rs("Importe").GetType()

    End Function

    Public Function obtenerDetalle_iva(ByVal pDetalle_iva As Campo) As Boolean
        Dim Sql As String
        Dim un_Detalle_iva As Detalle_iva

        obtenerDetalle_iva = False
        listaDetalle_iva.Clear()

        Sql = "select "
        Sql = Sql + "idsolicitud, "
        Sql = Sql + "Id, "
        Sql = Sql + "BaseImp, "
        Sql = Sql + "Importe"
        Sql = Sql + " From detalle_iva "
        Sql = Sql + " where idsolicitud = " + SQLAdapter.formatValuetoSQL(pDetalle_iva)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read
                un_Detalle_iva = New Detalle_iva() '-- Crea objeto Detalle_iva con sus atributos (campos)

                Me.rsto_Detalle_iva(un_Detalle_iva, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto Detalle_iva


                listaDetalle_iva.Add(un_Detalle_iva) '-- Agrega la solicitud al ARRAY de Detalle_iva
                Detalle_ivaBuscado = un_Detalle_iva
                obtenerDetalle_iva = True
            Loop
        Else
            Me.error = "No existen registros para procesar en Detalle_iva"
            Log.EscbribirLinea_Log("No existen registros para procesar en Detalle_iva")
            Exit Function
        End If
    End Function




End Class
