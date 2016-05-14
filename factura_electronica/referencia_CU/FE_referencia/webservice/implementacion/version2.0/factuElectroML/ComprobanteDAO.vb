Public Class ComprobanteDAO


    Public [error] As String
    Public listaComprobantes As New ArrayList
    Public ComprobanteBuscado As Comprobante

   

    Public Function obtenerComprobantesaEnviar() As Boolean '-- Valida según Store procedure si hay comprobantes a enviar
        Dim Sql As String, HayCompro As Boolean             '-- Si hay, crea el objeto comprobante y luego lo añade a la lista de comprobantes
        Dim un_Comprobante As New Comprobante

        ' obtenemos el detalle de la liquidación 
        HayCompro = False
        Sql = " exec spu_obtenerComprobantesaEnviar_v1_2  "
        AdmConexiones.ejecutarQuerySQLFE(Sql) '-- Ejecuta el Stored Procedure 

        Do While AdmConexiones.rsSQLFE.Read() '-- Mientras haya registros devueltos por SQL (Lectura rsSQLFE.READ = True)
            un_Comprobante = New Comprobante()
            HayCompro = True
            Me.rsto_Comprobante(un_Comprobante, AdmConexiones.rsSQLFE) '-- Carga valores y tipos a cada atributo del objeto Comprobante
            listaComprobantes.Add(un_Comprobante) '-- un_Comprobante es el objeto completo, el atributo rsSQLFE es el que contiene todos
            ComprobanteBuscado = un_Comprobante   '-- los datos leídos por SQL. Para especificar "el campo a campo" se lo hace en la 
            obtenerComprobantesaEnviar = True     '-- función rsto_Comprobante, local a esta clase ComprobanteDAO.
        Loop                                      '-- Finalmente, guarda una copia del comprobante en comprobanteBuscado e informa TRUE
        '-- como valor de la función, lo que le permite seguir el flujo desde donde se invocó  

        If Not (HayCompro) Then
            [error] = "No existen Comprobantes a Enviar"
        End If
    End Function


    Private Function rsto_Comprobante(ByVal pComprobante As Comprobante, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pComprobante.cod_doc.valor = rs("cod_doc")
        pComprobante.nro_doc.valor = rs("nro_doc")
        pComprobante.nro_trans.valor = rs("nro_trans")
        '-- Agregado 
        pComprobante.nom_tit.valor = rs("nom_tit")
        pComprobante.imp_tot_mo.valor = rs("imp_tot_mo")
        pComprobante.estado_envio.valor = rs("estado_envio")
        '-- Fin agregado

        pComprobante.cod_doc.tipo = rs("cod_doc").GetType
        pComprobante.nro_doc.tipo = rs("nro_doc").GetType
        pComprobante.nro_trans.tipo = rs("nro_trans").GetType
        '-- Agregado
        pComprobante.nom_tit.tipo = rs("nom_tit").GetType
        pComprobante.imp_tot_mo.tipo = rs("imp_tot_mo").GetType
        pComprobante.estado_envio.tipo = rs("estado_envio").GetType
        '-- Fin agregado
    End Function


    Public Function actualizarDatosFacturaElectronica(ByVal pun_Comprobante As Comprobante) As Boolean
        Dim Sql As String
        Dim un_Comprobante As New Comprobante

        ' obtenemos el detalle de la liuidacion 
        Sql = " exec spu_actualizarDatosFacturaElectronica_v1_3  "
        Sql = Sql + "@Nro_Trans=" + SQLAdapter.formatValuetoSQL(pun_Comprobante.idSolicitud) + SQLAdapter.COMA
        Sql = Sql + "@Fec_vto=" + SQLAdapter.formatValuetoSQL(pun_Comprobante.vtocodaut) + SQLAdapter.COMA
        Sql = Sql + "@cae=" + SQLAdapter.formatValuetoSQL(pun_Comprobante.codaut) + SQLAdapter.COMA
        Sql = Sql + "@nvo_nro_fac=" + SQLAdapter.formatValuetoSQL(pun_Comprobante.nro) + SQLAdapter.COMA
        Sql = Sql + "@fec_emision=" + SQLAdapter.formatValuetoSQL(pun_Comprobante.fecha_emision)

        Console.WriteLine("El Sql formado es " + Sql)

        actualizarDatosFacturaElectronica = AdmConexiones.ejecutarNonQuerySQLFE(Sql)
        Me.error = AdmConexiones.error

    End Function

    Public Function actualizacionProvisoria(ByVal un_comprobante As Comprobante) As Boolean
        Dim sql As String
        Dim un_campo As New Campo

        sql = " UPDATE comprobante "
        sql = sql + " SET "
        sql = sql + " estado_envio =	 " + SQLAdapter.formatValuetoSQL(un_comprobante.estado_envio)

        sql = sql + " WHERE "
        sql = sql + " idsolicitud = " + SQLAdapter.formatValuetoSQL(un_comprobante.nro_trans)

        If AdmConexiones.ejecutarNonQuerySQLFE(sql) Then
            actualizacionProvisoria = True
        Else
            Me.error = AdmConexiones.error
            actualizacionProvisoria = False
        End If
        AdmConexiones.cerrarDataReaderSQLFE()

    End Function


    Public Function actualizarComprobante(ByVal un_comprobante As Comprobante) As Boolean
        actualizarComprobante = False
        Dim sql As String

        sql = " UPDATE comprobante "
        sql = sql + " SET "
        sql = sql + " codaut = " + SQLAdapter.formatValuetoSQL(un_comprobante.codaut) + SQLAdapter.COMA
        sql = sql + " fechaemision = " + SQLAdapter.formatValuetoSQL(un_comprobante.fecha_emision) + SQLAdapter.COMA
        sql = sql + " nro = " + SQLAdapter.formatValuetoSQL(un_comprobante.nro) + SQLAdapter.COMA
        sql = sql + " vtocodaut = " + SQLAdapter.formatValuetoSQL(un_comprobante.vtocodaut) + SQLAdapter.COMA
        'sql = sql + " nro_trans"
        sql = sql + " ptovta = " + SQLAdapter.formatValuetoSQL(un_comprobante.ptovta) + SQLAdapter.COMA
        sql = sql + " estado_envio = " + SQLAdapter.formatValuetoSQL(un_comprobante.estado_envio) + SQLAdapter.COMA
        sql = sql + " tipo = " + SQLAdapter.formatValuetoSQL(un_comprobante.tipo)
        sql = sql + " WHERE "
        sql = sql + " idSolicitud = " + SQLAdapter.formatValuetoSQL(un_comprobante.idSolicitud)

        If AdmConexiones.ejecutarNonQuerySQLFE(sql) Then
            actualizarComprobante = True
        Else
            Me.error = AdmConexiones.error
            actualizarComprobante = False
        End If
        AdmConexiones.cerrarDataReaderSQLFE()

    End Function

End Class

