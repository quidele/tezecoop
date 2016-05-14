Imports fonseca_libDatos

Public Class ComprobanteDAO

    'Public [error] As String
    'Public listaComprobantes As New ArrayList
    'Public ComprobanteBuscado As Comprobante

    Private _comprobanteBuscado As Comprobante
    Public ReadOnly Property ComprobanteBuscado() As Comprobante
        Get
            Return _comprobanteBuscado
        End Get
    End Property

    Private _listaComprobantes As ArrayList
    Public ReadOnly Property ListaComprobantes() As ArrayList
        Get
            Return _listaComprobantes
        End Get
    End Property

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property


    Public Function obtenerComprobantesaEnviar() As Boolean
        Log.Logger("info", "ComprobanteDAO - obtenerComprobantesaEnviar")
        Dim Sql As String
        Dim un_Comprobante As New Comprobante
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        obtenerComprobantesaEnviar = False

        Try

            Sql = " EXEC spu_obtenerComprobantesaEnviar_v1_2  "

            Log.Logger("Debug", Sql)

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Exit Try
            End If

            _listaComprobantes = New ArrayList

            If objAdmConexiones.rsSQLFE.HasRows() Then


                Do While objAdmConexiones.rsSQLFE.Read()
                    un_Comprobante = New Comprobante()

                    Me.rsto_Comprobante(un_Comprobante, objAdmConexiones.rsSQLFE)
                    _listaComprobantes.Add(un_Comprobante)
                    _comprobanteBuscado = un_Comprobante
                    obtenerComprobantesaEnviar = True
                Loop

            Else
                Me._error = "No existen Comprobantes a Enviar. "
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            obtenerComprobantesaEnviar = True
        Catch ex As Exception
            Me._error = "No existen Comprobantes a Enviar. " + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function


    Private Function rsto_Comprobante(ByVal pComprobante As Comprobante, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        Log.Logger("info", "ComprobanteDAO - rsto_Comprobante")
        Try

            pComprobante.cod_doc.Valor = rs("cod_doc")
            pComprobante.nro_doc.Valor = rs("nro_doc")
            pComprobante.nro_trans.Valor = rs("nro_trans")
            '-- Agregado 
            pComprobante.nom_tit.Valor = rs("nom_tit")
            pComprobante.imp_tot_mo.Valor = rs("imp_tot_mo")
            pComprobante.estado_envio.Valor = rs("estado_envio")
            '-- Fin agregado
            pComprobante.cod_doc.Tipo = rs("cod_doc").GetType
            pComprobante.nro_doc.Tipo = rs("nro_doc").GetType
            pComprobante.nro_trans.Tipo = rs("nro_trans").GetType
            '-- Agregado
            pComprobante.nom_tit.Tipo = rs("nom_tit").GetType
            pComprobante.imp_tot_mo.Tipo = rs("imp_tot_mo").GetType
            pComprobante.estado_envio.Tipo = rs("estado_envio").GetType
            '-- Fin agregado
            rsto_Comprobante = True
        Catch ex As Exception
            rsto_Comprobante = False
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try
    End Function


    Public Function actualizarDatosFacturaElectronica(ByVal puna_solicitud As Solicitud) As Boolean
        Log.Logger(tipoLogging.Info, "ComprobanteDAO - actualizarDatosFacturaElectronica")

        Dim Sql As String
        Dim un_Comprobante As New Comprobante
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia

        actualizarDatosFacturaElectronica = False

        Try

            ' obtenemos el detalle de la liuidacion 
            Sql = " EXEC ufn_actualizarDatosFacturaElectronica_v1_4  "
            Sql = Sql + " @Nro_Trans = " + SQLAdapter.formatValuetoSQL(puna_solicitud.idsolicitud) + SQLAdapter.COMA
            Sql = Sql + " @Fec_vto = " + SQLAdapter.formatValuetoSQL(puna_solicitud.vtocodaut) + SQLAdapter.COMA
            Sql = Sql + " @cae = " + SQLAdapter.formatValuetoSQL(puna_solicitud.codaut) + SQLAdapter.COMA
            Sql = Sql + " @nvo_nro_fac = " + SQLAdapter.formatValuetoSQL(puna_solicitud.nro) + SQLAdapter.COMA
            Sql = Sql + " @fec_emision = " + SQLAdapter.formatValuetoSQL(puna_solicitud.fechaemision)

            Log.Logger(tipoLogging.Debug, Sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            actualizarDatosFacturaElectronica = True

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function

    Public Function actualizacionProvisoria(ByVal un_comprobante As Comprobante) As Boolean
        Log.Logger(tipoLogging.Info, "ComprobanteDAO - actualizacionProvisoria")

        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        actualizacionProvisoria = False

        Try

            sql = " UPDATE comprobante "
            sql = sql + " SET "
            sql = sql + " estado_envio = " + SQLAdapter.formatValuetoSQL(un_comprobante.estado_envio)
            sql = sql + " WHERE "
            sql = sql + " idsolicitud = " + SQLAdapter.formatValuetoSQL(un_comprobante.nro_trans)

            Log.Logger(tipoLogging.Debug, sql)

            If objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                actualizacionProvisoria = True
            Else
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                actualizacionProvisoria = False
            End If

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function

End Class

