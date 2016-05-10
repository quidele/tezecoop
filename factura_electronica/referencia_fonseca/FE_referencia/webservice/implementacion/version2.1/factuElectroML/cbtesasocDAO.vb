Public Class cbtesasocDAO

    Public [error] As String
    Public listaCbtesasoc As New ArrayList
    Public cbtesasocBuscado As cbtesasoc



    Private Function rsto_cbtesasoc(ByVal pcbtesasoc As cbtesasoc, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pcbtesasoc.idsolicitud.valor = rs("idsolicitud")
        pcbtesasoc.Tipo.valor = rs("Tipo")
        pcbtesasoc.PtoVta.valor = rs("PtoVta")
        pcbtesasoc.Nro.valor = rs("Nro")

        pcbtesasoc.idsolicitud.tipo = rs("idsolicitud").GetType()
        pcbtesasoc.Tipo.tipo = rs("Tipo").GetType()
        pcbtesasoc.PtoVta.tipo = rs("PtoVta").GetType()
        pcbtesasoc.Nro.tipo = rs("Nro").GetType()

    End Function


    Public Function obtenerCbtesasoc(ByVal pcbtesasoc As Campo) As Boolean
        Dim Sql As String
        Dim un_cbtesasoc As cbtesasoc

        Sql = "select "
        Sql = Sql + "	idsolicitud	, "
        Sql = Sql + "	Tipo	, "
        Sql = Sql + "	PtoVta	, "
        Sql = Sql + "	Nro	"
        Sql = Sql + "	  From cbtesasoc	"
        Sql = Sql + "	  where idsolicitud =  " + SQLAdapter.formatValuetoSQL(pcbtesasoc)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read
                un_cbtesasoc = New cbtesasoc() '-- Crea objeto Cbtesasoc con sus atributos (campos)

                Me.rsto_cbtesasoc(un_cbtesasoc, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto Cbtesasoc


                listaCbtesasoc.Add(un_cbtesasoc) '-- Agrega la solicitud al ARRAY de Cbtesasoc
                cbtesasocBuscado = un_cbtesasoc
                obtenerCbtesasoc = True
            Loop
        Else
            Me.error = "No existen registros para procesar en comprobantes ASOC"
            Log.EscbribirLinea_Log(Me.error)
            Exit Function
        End If
    End Function


End Class
