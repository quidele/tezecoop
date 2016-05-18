Public Class ObservacionesDAO

    Public [error] As String
    Public listaObservaciones As New ArrayList
    Public ObservacionesBuscado As Observaciones


    Private Function rsto_Observaciones(ByVal pObservaciones As Observaciones, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pObservaciones.idObservacion.valor = rs("idObservacion")
        pObservaciones.idsolicitud.valor = rs("idsolicitud")
        pObservaciones.Code.valor = rs("Code")
        pObservaciones.Msg.valor = rs("Msg")

        pObservaciones.idObservacion.tipo = rs("idObservacion").GetType()
        pObservaciones.idsolicitud.tipo = rs("idsolicitud").GetType()
        pObservaciones.Code.tipo = rs("Code").GetType()
        pObservaciones.Msg.tipo = rs("Msg").GetType()

    End Function

    Public Function obtenerObservaciones(ByVal pObservaciones As Campo) As Boolean

        Dim Sql As String
        Dim un_Observaciones As Observaciones


        Sql = "select  "
        Sql = Sql + "	idObservacion	, "
        Sql = Sql + "	idsolicitud	, "
        Sql = Sql + "	Code	, "
        Sql = Sql + "	Msg	"
        Sql = Sql + "	  From observaciones	"
        Sql = Sql + "	   where idsolicitud =  " + SQLAdapter.formatValuetoSQL(pObservaciones)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read
                un_Observaciones = New Observaciones() '-- Crea objeto Observaciones con sus atributos (campos)

                Me.rsto_Observaciones(un_Observaciones, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto Observaciones


                listaObservaciones.Add(un_Observaciones) '-- Agrega la solicitud al ARRAY de Observaciones
                ObservacionesBuscado = un_Observaciones
                obtenerObservaciones = True
            Loop
        Else
            Me.error = "No existen registros para procesar en comprobante"
            Exit Function
        End If


    End Function

    Public Function insertarObservacion(ByVal pObservacion As Observaciones) As Boolean

        Dim sql As String
        Dim un_campo As New Campo

        sql = " INSERT INTO dbo.observaciones ("
        sql = sql + "	idsolicitud	, "
        sql = sql + "	Code	, "
        sql = sql + "	Msg	"
        sql = sql + "   )  VALUES ( "
        sql = sql + SQLAdapter.formatValuetoSQL(pObservacion.idsolicitud) + SQLAdapter.COMA
        sql = sql + SQLAdapter.formatValuetoSQL(pObservacion.Code) + SQLAdapter.COMA
        sql = sql + SQLAdapter.formatValuetoSQL(pObservacion.Msg)
        sql = sql + ")"

        insertarObservacion = AdmConexiones.ejecutarNonQuerySQLFE(sql)
        Log.EscbribirLinea_Log("Observaciones insertadas correctamente en TABLA")
    End Function




End Class
