Public Class Detalle_tributosDAO

    Public [error] As String
    Public listaDetalle_tributo As New ArrayList
    Public Detalle_tributoBuscado As Detalle_tributos


    Private Function rsto_Detalle_tributos(ByVal pDetalle_tributos As Detalle_tributos, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pDetalle_tributos.idsolicitud.valor = rs("idsolicitud")
        pDetalle_tributos.Id.valor = rs("Id")
        pDetalle_tributos.Descripcion.valor = rs("Descripcion")
        pDetalle_tributos.BaseImp.valor = rs("BaseImp")
        pDetalle_tributos.Alic.valor = rs("Alic")
        pDetalle_tributos.Importe.valor = rs("Importe")


        pDetalle_tributos.idsolicitud.tipo = rs("idsolicitud").GetType()
        pDetalle_tributos.Id.tipo = rs("Id").GetType()
        pDetalle_tributos.Descripcion.tipo = rs("Descripcion").GetType()
        pDetalle_tributos.BaseImp.tipo = rs("BaseImp").GetType()
        pDetalle_tributos.Alic.tipo = rs("Alic").GetType()
        pDetalle_tributos.Importe.tipo = rs("Importe").GetType()


    End Function

    Public Function obtenerDetalle_tributos(ByVal pDetalle_tributos As Campo) As Boolean

        Dim Sql As String
        Dim un_Detalle_tributos As Detalle_tributos


        Sql = "select "
        Sql = Sql + "	idsolicitud	, "
        Sql = Sql + "	Id	, "
        Sql = Sql + "	Descripcion	, "
        Sql = Sql + "	BaseImp	, "
        Sql = Sql + "	Alic	, "
        Sql = Sql + "	Importe   "
        Sql = Sql + "	From detalle_tributos	"
        Sql = Sql + "	 where idsolicitud =  " + SQLAdapter.formatValuetoSQL(pDetalle_tributos)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read
                un_Detalle_tributos = New Detalle_tributos() '-- Crea objeto Detalle_tributos con sus atributos (campos)

                Me.rsto_Detalle_tributos(un_Detalle_tributos, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto Detalle_tributos


                listaDetalle_tributo.Add(un_Detalle_tributos) '-- Agrega la solicitud al ARRAY de Detalle_tributos
                Detalle_tributoBuscado = un_Detalle_tributos
                obtenerDetalle_tributos = True
            Loop
        Else
            Me.error = "No existen registros para procesar en tributos"
            Log.EscbribirLinea_Log("No existen registros para procesar en tributos")
            Exit Function
        End If

    End Function


End Class
