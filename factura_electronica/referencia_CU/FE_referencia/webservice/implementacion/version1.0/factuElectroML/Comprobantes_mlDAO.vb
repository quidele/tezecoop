Public Class Comprobantes_mlDAO

    Public [error] As String
    Public listaComprobantes As New ArrayList
    Public ComprobanteBuscado As Comprobantes_ml
    Public un_resultadoSP As New ResultadoSP
    Public listaObservaciones As New ArrayList
    Public una_observacion As New Observaciones

    Private Function rsto_Comprobante(ByVal pComprobante As Comprobantes_ml, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pComprobante.idsolicitud.valor = rs("idsolicitud")
        pComprobante.CbteTipo.valor = rs("CbteTipo")
        pComprobante.PtoVta.valor = rs("PtoVta")
        pComprobante.Concepto.valor = rs("Concepto")
        pComprobante.DocTipo.valor = rs("DocTipo")
        pComprobante.DocNro.valor = rs("DocNro")
        pComprobante.CbteDesde.valor = rs("CbteDesde")
        pComprobante.CbteHasta.valor = rs("CbteHasta")
        pComprobante.CbteFch.valor = rs("CbteFch")
        pComprobante.ImpTotal.valor = rs("ImpTotal")
        pComprobante.ImpTotConc.valor = rs("ImpTotConc")
        pComprobante.ImpNeto.valor = rs("ImpNeto")
        pComprobante.ImpOpEx.valor = rs("ImpOpEx")
        pComprobante.ImpIVA.valor = rs("ImpIVA")
        pComprobante.ImpTrib.valor = rs("ImpTrib")
        pComprobante.FchServDesde.valor = rs("FchServDesde")
        pComprobante.FchServHasta.valor = rs("FchServHasta")
        pComprobante.FchVtoPago.valor = rs("FchVtoPago")
        pComprobante.MonId.valor = rs("MonId")
        pComprobante.MonCotiz.valor = rs("MonCotiz")
        pComprobante.estado_envio.valor = rs("estado_envio")
        pComprobante.CAE.valor = rs("CAE")
        pComprobante.CAEFchVto.valor = rs("CAEFchVto")

        pComprobante.idsolicitud.tipo = rs("idsolicitud").GetType()
        pComprobante.CbteTipo.tipo = rs("CbteTipo").GetType()
        pComprobante.PtoVta.tipo = rs("PtoVta").GetType()
        pComprobante.Concepto.tipo = rs("Concepto").GetType()
        pComprobante.DocTipo.tipo = rs("DocTipo").GetType()
        pComprobante.DocNro.tipo = rs("DocNro").GetType()
        pComprobante.CbteDesde.tipo = rs("CbteDesde").GetType()
        pComprobante.CbteHasta.tipo = rs("CbteHasta").GetType()
        pComprobante.CbteFch.tipo = rs("CbteFch").GetType()
        pComprobante.ImpTotal.tipo = rs("ImpTotal").GetType()
        pComprobante.ImpTotConc.tipo = rs("ImpTotConc").GetType()
        pComprobante.ImpNeto.tipo = rs("ImpNeto").GetType()
        pComprobante.ImpOpEx.tipo = rs("ImpOpEx").GetType()
        pComprobante.ImpIVA.tipo = rs("ImpIVA").GetType()
        pComprobante.ImpTrib.tipo = rs("ImpTrib").GetType()
        pComprobante.FchServDesde.tipo = rs("FchServDesde").GetType()
        pComprobante.FchServHasta.tipo = rs("FchServHasta").GetType()
        pComprobante.FchVtoPago.tipo = rs("FchVtoPago").GetType()
        pComprobante.MonId.tipo = rs("MonId").GetType()
        pComprobante.MonCotiz.tipo = rs("MonCotiz").GetType()
        pComprobante.estado_envio.tipo = rs("estado_envio").GetType()
        pComprobante.CAE.tipo = rs("CAE").GetType()
        pComprobante.CAEFchVto.tipo = rs("CAEFchVto").GetType()



    End Function

    Public Function ObtenerComprobante(ByVal pComprobante As Campo) As Boolean
        Dim Sql As String
        Dim un_Comprobante As New Comprobantes_ml

        ObtenerComprobante = False
        listaComprobantes.Clear()


        Sql = "select "
        Sql = Sql + "idsolicitud,"
        Sql = Sql + "CbteTipo,"
        Sql = Sql + "PtoVta,"
        Sql = Sql + "Concepto,"
        Sql = Sql + "DocTipo,"
        Sql = Sql + "DocNro,"
        Sql = Sql + "CbteDesde,"
        Sql = Sql + "CbteHasta,"
        Sql = Sql + "CbteFch,"
        Sql = Sql + "ImpTotal,"
        Sql = Sql + "ImpTotConc,"
        Sql = Sql + "ImpNeto,"
        Sql = Sql + "ImpOpEx,"
        Sql = Sql + "ImpIVA,"
        Sql = Sql + "ImpTrib,"
        Sql = Sql + "FchServDesde,"
        Sql = Sql + "FchServHasta,"
        Sql = Sql + "FchVtoPago,"
        Sql = Sql + "MonId,"
        Sql = Sql + "MonCotiz,"
        Sql = Sql + "estado_envio,"
        Sql = Sql + "CAE,"
        Sql = Sql + "CAEFchVto"
        Sql = Sql + " From comprobantes_ml "
        Sql = Sql + " where idsolicitud = " + SQLAdapter.formatValuetoSQL(pComprobante)

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        If AdmConexiones.rsSQLFE.HasRows Then
            Do While AdmConexiones.rsSQLFE.Read
                un_Comprobante = New Comprobantes_ml() '-- Crea objeto Comprobante con sus atributos (campos)

                Me.rsto_Comprobante(un_Comprobante, AdmConexiones.rsSQLFE) '-- Asigna datos campo a campo para el objeto Comprobante


                listaComprobantes.Add(un_Comprobante) '-- Agrega la solicitud al ARRAY de Comprobantes
                ComprobanteBuscado = un_Comprobante
                ObtenerComprobante = True
            Loop
        Else
            Me.error = "No existen registros para procesar en comprobantes"
            Exit Function
        End If

    End Function

    Public Function actualizarComprobante(ByVal un_Comprobante As Comprobantes_ml) As Boolean
        Dim sql As String
        Dim un_campo As New Campo

        sql = " UPDATE comprobantes_ml "
        sql = sql + " SET "

        sql = sql + "CAE = " + SQLAdapter.formatValuetoSQL(un_Comprobante.CAE)
        sql = sql + ",CAEFchVto = " + SQLAdapter.formatValuetoSQL(un_Comprobante.CAEFchVto)
        sql = sql + ",estado_envio = " + SQLAdapter.formatValuetoSQL(un_Comprobante.estado_envio)
        sql = sql + ",nro_doc_afip = " + SQLAdapter.formatValuetoSQL(un_Comprobante.nro_doc_afip)

        'sql = sql + ",codtarea = " + SQLAdapter.formatValuetoSQL(un_Comprobante.codtarea)
        'sql = sql + ",estadocmp = " + SQLAdapter.formatValuetoSQL(un_Comprobante.estadocmp)
        '-- AGREGADO:
        'sql = sql + ",fechaemision = " + SQLAdapter.formatValuetoSQL(un_Comprobante.fechaemision)
        '-- FIN AGREGADO
        sql = sql + " WHERE "
        sql = sql + " idsolicitud = " + SQLAdapter.formatValuetoSQL(un_Comprobante.idsolicitud)
        Try
            If AdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                actualizarComprobante = True
            Else
                Me.error = AdmConexiones.error
                actualizarComprobante = False
            End If
            AdmConexiones.cerrarDataReaderSQLFE()
        Catch ex As Exception
            [error] = ex.Message
        End Try
        
    End Function

    Public Function InsertarComprobantesMLFE(ByVal idSolicitud As Campo) As Boolean
        Dim Sql As String

        InsertarComprobantesMLFE = False

        ' obtenemos el detalle de la liquidacion 
        Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Obteniendo el detalle de la liquidación"
        Sql = " exec spu_insertarComprobanteML"
        Sql = Sql + " 	@idSolicitud  = " + SQLAdapter.formatValuetoSQL(idSolicitud)

        If Not AdmConexiones.ejecutarQuerySQLFE(Sql) Then
            Me.error = AdmConexiones.error
            InsertarComprobantesMLFE = False
            Exit Function
        End If

        If AdmConexiones.rsSQLFE.HasRows Then '-- Si rsSQLFE (variable pública de tipo "lector de datos SQL") tiene filas...
            If AdmConexiones.rsSQLFE.Read Then '-- Si el lector de datos anterior da verdadero en la lectura...
                un_resultadoSP = New ResultadoSP() '-- El objeto "ResultadoSP" tiene los atributos descripción y resultado 
                Me.rsto_resultadoSP(un_resultadoSP, AdmConexiones.rsSQLFE)
                una_observacion = New Observaciones() '-- El objeto "Observaciones" tiene los atributos descripción y resultado 
                listaComprobantes.Add(un_resultadoSP) '-- Agrega el objeto resultado (con atributos descripción y resultado) a un array de lista de solicitudes
                una_observacion.Msg = un_resultadoSP.descripcion
                If Not un_resultadoSP.descripcion.esNulo Then
                    Me.error = un_resultadoSP.descripcion.valor
                End If
                una_observacion.Code = un_resultadoSP.resultado
                listaObservaciones.Add(una_observacion)
                InsertarComprobantesMLFE = True
                Exit Function
            End If
        Else
            Me.error = "No existen registros para procesar en spu_insertarComprobanteML "
            InsertarComprobantesMLFE = False

            Exit Function
        End If



    End Function

    Private Function rsto_resultadoSP(ByVal pResultadoSP As ResultadoSP, _
                                ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pResultadoSP.resultado.valor = rs("resultado")
        pResultadoSP.descripcion.valor = rs("descripcion")

        pResultadoSP.resultado.tipo = rs("resultado").GetType
        pResultadoSP.descripcion.tipo = rs("descripcion").GetType

    End Function



    Public Function actualizarComprobanteMagma(ByVal un_Comprobante As Comprobantes_ml) As Boolean
        Dim Sql As String

        actualizarComprobanteMagma = False
        'Dim un_Comprobante As New Comprobante

        ' obtenemos el detalle de la liquidacion 
        Sql = " exec spu_actualizarDatosFacturaElectronica_v1_3  "
        Sql = Sql + "@Nro_Trans=" + SQLAdapter.formatValuetoSQL(un_Comprobante.idsolicitud) + SQLAdapter.COMA
        Sql = Sql + "@Fec_vto=" + SQLAdapter.formatValuetoSQL(un_Comprobante.FchVtoPago) + SQLAdapter.COMA
        Sql = Sql + "@cae=" + SQLAdapter.formatValuetoSQL(un_Comprobante.CAE) + SQLAdapter.COMA
        Sql = Sql + "@nvo_nro_fac=" + SQLAdapter.formatValuetoSQL(un_Comprobante.nro_doc_afip) + SQLAdapter.COMA
        Sql = Sql + "@fec_emision=" + SQLAdapter.formatValuetoSQL(un_Comprobante.CbteFch)

        Console.WriteLine("El Sql formado es " + Sql)

        actualizarComprobanteMagma = AdmConexiones.ejecutarNonQuerySQLFE(Sql)
        Me.error = AdmConexiones.error

        If AdmConexiones.error <> "" Then
            Log.EscbribirLinea_Log(AdmConexiones.error)

        Else
            actualizarComprobanteMagma = True
        End If


    End Function


End Class
