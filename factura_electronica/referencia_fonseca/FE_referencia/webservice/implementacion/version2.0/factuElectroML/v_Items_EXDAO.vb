Public Class v_Items_EXDAO

    Public [error] As String
    Public listav_Items_EX As New ArrayList
    Public v_Items_EXBuscado As v_Items_EX

    Private Function rsto_v_cmpasociados_EX(ByVal pv_Items_EX As v_Items_EX, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pv_Items_EX.Pro_codigo.valor = rs("Pro_codigo")
        pv_Items_EX.Pro_ds.valor = rs("Pro_ds")
        pv_Items_EX.Pro_qty.valor = rs("Pro_qty")
        pv_Items_EX.Pro_umed.valor = rs("Pro_umed")
        pv_Items_EX.Pro_precio_uni.valor = rs("Pro_precio_uni")
        pv_Items_EX.Pro_total_item.valor = rs("Pro_total_item")

        pv_Items_EX.Pro_codigo.tipo = rs("Pro_codigo").GetType
        pv_Items_EX.Pro_ds.tipo = rs("Pro_ds").GetType
        pv_Items_EX.Pro_qty.tipo = rs("Pro_qty").GetType
        pv_Items_EX.Pro_umed.tipo = rs("Pro_umed").GetType
        pv_Items_EX.Pro_precio_uni.tipo = rs("Pro_precio_uni").GetType
        pv_Items_EX.Pro_total_item.tipo = rs("Pro_total_item").GetType


    End Function


    Public Function obtenerv_Items_EX(ByVal pv_Items_EX As Campo) As Boolean

        Dim Sql As String
        Dim un_v_Items_EX As v_Items_EX
        obtenerv_Items_EX = False

        Sql = "SELECT "
        Sql = Sql + "Pro_codigo,"
        Sql = Sql + "Pro_ds,"
        Sql = Sql + "Pro_qty,"
        Sql = Sql + "Pro_umed,"
        Sql = Sql + "Pro_precio_uni,"
        Sql = Sql + "Pro_total_item"
        Sql = Sql + " FROM v_Items_Ex WHERE idSolicitud = " + SQLAdapter.formatValuetoSQL(pv_Items_EX)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read

                un_v_Items_EX = New v_Items_EX() '-- Crea objeto v_Items_EX con sus atributos (campos)
                Me.rsto_v_cmpasociados_EX(un_v_Items_EX, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto v_Items_EX
                listav_Items_EX.Add(un_v_Items_EX) '-- Agrega la solicitud al ARRAY de v_Items_EX
                v_Items_EXBuscado = un_v_Items_EX
                obtenerv_Items_EX = True
            Loop
        Else
            Me.error = "No existen registros para procesar en v_Items_EX"
            Log.EscbribirLinea_Log("No existen registros para procesar en v_Items_EX")
            Exit Function
        End If

    End Function
End Class
