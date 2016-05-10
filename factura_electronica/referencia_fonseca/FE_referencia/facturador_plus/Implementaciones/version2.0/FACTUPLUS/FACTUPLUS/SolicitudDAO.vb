Imports fonseca_libDatos

Public Class SolicitudDAO

    Public xml_solicitud As String
    Public xml_header_solicitud As String = "<?xml version=" + Chr(34) + "1.0" + Chr(34) + " encoding=" + Chr(34) + "UTF-8" + Chr(34) + "?>" + vbCrLf + "<comprobantes>"
    Public xml_trailer_solicitud As String = "</comprobantes>"
    Public un_resultadoSP As New ResultadoSP

    Private _solicitudBuscado As Solicitud
    Private _listaSolicitudes As ArrayList
    Private _error As String

    Public ReadOnly Property SolicitudBuscado() As Solicitud
        Get
            Return _solicitudBuscado
        End Get
    End Property
    Public ReadOnly Property ListaSolicitudes() As ArrayList
        Get
            Return _listaSolicitudes
        End Get
    End Property
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property


    Public Enum modos_generar As Integer
        real
        simulacion
    End Enum


    Public Function obtenerXMLSolicitudaEnviar(ByVal pidSolicitud As Campo, ByVal modo As modos_generar) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - obtenerXMLSolicitudaEnviar")
        Dim Sql As String

        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        If modo = modos_generar.real Then
            Sql = " EXEC spu_obtenerSolicitudXML_v1_1  "
        Else
            Sql = " EXEC spu_obtenerSolicitudXML_Simu_v1_1  " '-- Ya toma desde adentro del SP, el valor actual del nro de simulacion de la tabla simulacion.
        End If

        Sql = Sql + " @pidSolicitud  = " + SQLAdapter.formatValuetoSQL(pidSolicitud)

        Log.Logger(tipoLogging.Debug, Sql)

        Try

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Exit Function
            End If

            If objAdmConexiones.rsSQLFE.HasRows Then
                If objAdmConexiones.rsSQLFE.Read Then
                    xml_solicitud = objAdmConexiones.rsSQLFE("xml_solicitud")
                    obtenerXMLSolicitudaEnviar = True
                End If
            Else
                Me._error = "No se pudo obtener la solicitud."
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If
        Catch ex As Exception
            Me._error = "No se pudo obtener la solicitud. " + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function

    Public Function obtenerXMLSolicitudaEnviar_Simu(ByVal pidSolicitud As Campo, ByVal fecha As Campo) As Boolean
        Log.Logger("info", "SolicitudDAO - obtenerXMLSolicitudaEnviar")
        obtenerXMLSolicitudaEnviar_Simu = False

        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        ' obtenemos el detalle de la liquidacion 
        Sql = " EXEC spu_obtenerSolicitudXML_Simu_v1_1  "
        Sql = Sql + " 	@pidSolicitud  = " + SQLAdapter.formatValuetoSQL(pidSolicitud) + SQLAdapter.COMA
        Sql = Sql + "   @pfecha = " + SQLAdapter.formatValuetoSQL(fecha) 'VERLO

        Try
            Log.Logger(tipoLogging.Debug, Sql)
            objAdmConexiones.EjecutarQuerySQLFE(Sql)

            If objAdmConexiones.rsSQLFE.HasRows Then
                If objAdmConexiones.rsSQLFE.Read Then
                    xml_solicitud = objAdmConexiones.rsSQLFE("xml_solicitud")
                    obtenerXMLSolicitudaEnviar_Simu = True
                End If
            Else
                Me._error = "No se pudo obtener la solicitud."
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            obtenerXMLSolicitudaEnviar_Simu = True
        Catch ex As Exception
            Me._error = "No se pudo obtener la solicitud. " + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function




    Public Function obtenerSolicitud(ByVal pSolicitud As Campo) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - obtenerSolicitud")
        Dim Sql As String
        Dim un_Solicitud As Solicitud
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        obtenerSolicitud = False

        Try

            ' obtenemos el detalle de la liquidacion 
            Sql = " SELECT "
            Sql = Sql + "	       idsolicitud 	, "
            Sql = Sql + "	       tipo 	, "
            Sql = Sql + "	       ptovta 	, "
            Sql = Sql + "	       cuitemisor 	, "
            Sql = Sql + "	       fechaemision 	, "
            Sql = Sql + "	       idioma 	, "
            Sql = Sql + "	       concepto 	, "
            Sql = Sql + "	       ape 	, "
            Sql = Sql + "	       moneda 	, "
            Sql = Sql + "	       tipocambio 	, "
            Sql = Sql + "	       destinocmp 	, "
            Sql = Sql + "	       tipodocreceptor 	, "
            Sql = Sql + "	       nrodocreceptor 	, "
            Sql = Sql + "	       idimpositivoreceptor 	, "
            Sql = Sql + "	       receptor 	, "
            Sql = Sql + "	       domicilioreceptor 	, "
            Sql = Sql + "	       importetotal 	, "
            Sql = Sql + "	       incoterms 	, "
            Sql = Sql + "	       detalleincoterms 	, "
            Sql = Sql + "	       otrosdatoscomerciales 	, "
            Sql = Sql + "	       otrosdatosgenerales 	, "
            Sql = Sql + "	       estado_envio 	, "
            Sql = Sql + "	       observa_envio 	, "
            Sql = Sql + "	       codaut 	, "
            Sql = Sql + "	       vtocodaut 	, "
            Sql = Sql + "	       nro 	, "
            Sql = Sql + "	       codtarea 	, "
            Sql = Sql + "	       estadocmp 	, "
            Sql = Sql + "	       fechacreacion 	, "
            Sql = Sql + "	       lote  ,"
            Sql = Sql + "	       nom_moneda_ingles, "
            Sql = Sql + "	       nro_doc "
            Sql = Sql + "	       FROM comprobante "
            Sql = Sql + " WHERE idsolicitud = " + SQLAdapter.formatValuetoSQL(pSolicitud)

            Log.Logger(tipoLogging.Debug, Sql)

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            _listaSolicitudes = New ArrayList

            If objAdmConexiones.rsSQLFE.HasRows Then

                _listaSolicitudes = New ArrayList()

                Do While objAdmConexiones.rsSQLFE.Read
                    un_Solicitud = New Solicitud()

                    Me.rsto_Solicitud(un_Solicitud, objAdmConexiones.rsSQLFE)

                    _listaSolicitudes.Add(un_Solicitud)
                    _solicitudBuscado = un_Solicitud
                    obtenerSolicitud = True
                Loop
            Else
                Me._error = "No existen registros para procesar en comprobante"
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If
        Catch ex As Exception
            Me._error = "No existen registros para procesar en comprobante." + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function



    Private Function rsto_Solicitud(ByVal pSolicitud As Solicitud, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - rsto_Solicitud")
        rsto_Solicitud = True
        Try

            pSolicitud.idsolicitud.Valor = rs("idsolicitud")
            pSolicitud.tipo.Valor = rs("tipo")
            pSolicitud.ptovta.Valor = rs("ptovta")
            pSolicitud.cuitemisor.Valor = rs("cuitemisor")
            pSolicitud.fechaemision.Valor = rs("fechaemision")
            pSolicitud.idioma.Valor = rs("idioma")
            pSolicitud.concepto.Valor = rs("concepto")
            pSolicitud.ape.Valor = rs("ape")
            pSolicitud.moneda.Valor = rs("moneda")
            pSolicitud.tipocambio.Valor = rs("tipocambio")
            pSolicitud.destinocmp.Valor = rs("destinocmp")
            pSolicitud.tipodocreceptor.Valor = rs("tipodocreceptor")
            pSolicitud.nrodocreceptor.Valor = rs("nrodocreceptor")
            pSolicitud.idimpositivoreceptor.Valor = rs("idimpositivoreceptor")
            pSolicitud.receptor.Valor = rs("receptor")
            pSolicitud.domicilioreceptor.Valor = rs("domicilioreceptor")
            pSolicitud.importetotal.Valor = rs("importetotal")
            pSolicitud.incoterms.Valor = rs("incoterms")
            pSolicitud.detalleincoterms.Valor = rs("detalleincoterms")
            pSolicitud.otrosdatoscomerciales.Valor = rs("otrosdatoscomerciales")
            pSolicitud.otrosdatosgenerales.Valor = rs("otrosdatosgenerales")
            pSolicitud.estado_envio.Valor = rs("estado_envio")
            pSolicitud.observa_envio.Valor = rs("observa_envio")
            pSolicitud.codaut.Valor = rs("codaut")
            pSolicitud.vtocodaut.Valor = rs("vtocodaut")
            pSolicitud.nro.Valor = rs("nro")
            pSolicitud.codtarea.Valor = rs("codtarea")
            pSolicitud.estadocmp.Valor = rs("estadocmp")
            pSolicitud.fechacreacion.Valor = rs("fechacreacion")
            pSolicitud.lote.Valor = rs("lote")
            pSolicitud.nom_moneda_ingles.Valor = rs("nom_moneda_ingles")
            pSolicitud.nro_doc.Valor = rs("nro_doc")


            pSolicitud.idsolicitud.Tipo = rs("idsolicitud").GetType
            pSolicitud.tipo.Tipo = rs("tipo").GetType
            pSolicitud.ptovta.Tipo = rs("ptovta").GetType
            pSolicitud.cuitemisor.Tipo = rs("cuitemisor").GetType
            pSolicitud.fechaemision.Tipo = rs("fechaemision").GetType
            pSolicitud.idioma.Tipo = rs("idioma").GetType
            pSolicitud.concepto.Tipo = rs("concepto").GetType
            pSolicitud.ape.Tipo = rs("ape").GetType
            pSolicitud.moneda.Tipo = rs("moneda").GetType
            pSolicitud.tipocambio.Tipo = rs("tipocambio").GetType
            pSolicitud.destinocmp.Tipo = rs("destinocmp").GetType
            pSolicitud.tipodocreceptor.Tipo = rs("tipodocreceptor").GetType
            pSolicitud.nrodocreceptor.Tipo = rs("nrodocreceptor").GetType
            pSolicitud.idimpositivoreceptor.Tipo = rs("idimpositivoreceptor").GetType
            pSolicitud.receptor.Tipo = rs("receptor").GetType
            pSolicitud.domicilioreceptor.Tipo = rs("domicilioreceptor").GetType
            pSolicitud.importetotal.Tipo = rs("importetotal").GetType
            pSolicitud.incoterms.Tipo = rs("incoterms").GetType
            pSolicitud.detalleincoterms.Tipo = rs("detalleincoterms").GetType
            pSolicitud.otrosdatoscomerciales.Tipo = rs("otrosdatoscomerciales").GetType
            pSolicitud.otrosdatosgenerales.Tipo = rs("otrosdatosgenerales").GetType
            pSolicitud.estado_envio.Tipo = rs("estado_envio").GetType
            pSolicitud.observa_envio.Tipo = rs("observa_envio").GetType
            pSolicitud.codaut.Tipo = rs("codaut").GetType
            pSolicitud.vtocodaut.Tipo = rs("vtocodaut").GetType
            pSolicitud.nro.Tipo = rs("nro").GetType
            pSolicitud.codtarea.Tipo = rs("codtarea").GetType
            pSolicitud.estadocmp.Tipo = rs("estadocmp").GetType
            pSolicitud.fechacreacion.Tipo = rs("fechacreacion").GetType
            pSolicitud.lote.Tipo = rs("lote").GetType
            pSolicitud.nom_moneda_ingles.Tipo = rs("nom_moneda_ingles").GetType
            pSolicitud.nro_doc.Tipo = rs("nro_doc").GetType

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
            rsto_Solicitud = False
        End Try
    End Function



    Public Function actualizarSolicitud(ByVal una_solicitud As Solicitud) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - actualizarSolicitud")
        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        actualizarSolicitud = False

        Try

            sql = " UPDATE comprobante "
            sql = sql + " SET "
            sql = sql + "   codaut = " + SQLAdapter.formatValuetoSQL(una_solicitud.codaut)
            sql = sql + " , vtocodaut = " + SQLAdapter.formatValuetoSQL(una_solicitud.vtocodaut)
            sql = sql + " , nro 	= " + SQLAdapter.formatValuetoSQL(una_solicitud.nro)
            sql = sql + " , codtarea = 	 " + SQLAdapter.formatValuetoSQL(una_solicitud.codtarea)
            sql = sql + " , estadocmp =	 " + SQLAdapter.formatValuetoSQL(una_solicitud.estadocmp)
            sql = sql + " , fechaemision =	 " + SQLAdapter.formatValuetoSQL(una_solicitud.fechaemision)
            sql = sql + " WHERE "
            sql = sql + " idsolicitud = " + SQLAdapter.formatValuetoSQL(una_solicitud.idsolicitud)

            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            actualizarSolicitud = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function


    Public Function actualizarSolicitudImporteMoneda(ByVal una_solicitud As Solicitud) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - actualizarSolicitudImporteMoneda")
        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        actualizarSolicitudImporteMoneda = False

        Try

            sql = " UPDATE comprobante SET otrosdatosgenerales = " + SQLAdapter.formatValuetoSQL(una_solicitud.otrosdatosgenerales)
            sql = sql + " WHERE idsolicitud = " + SQLAdapter.formatValuetoSQL(una_solicitud.idsolicitud)

            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            actualizarSolicitudImporteMoneda = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try

    End Function

    Public Function generarSolicitudFacturaElectronica(ByVal pidsolicitud As Campo, ByVal plote As Campo) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - generarSolicitudFacturaElectronica")
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        generarSolicitudFacturaElectronica = False

        Try

            ' obtenemos el detalle de la liquidacion 
            Sql = " EXEC spu_generarSolicitud_v1_1  "
            Sql = Sql + " 	@plote  = " + SQLAdapter.formatValuetoSQL(plote) + SQLAdapter.COMA
            Sql = Sql + " 	@pnro_trans  = " + SQLAdapter.formatValuetoSQL(pidsolicitud)

            Log.Logger(tipoLogging.Debug, Sql)

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                generarSolicitudFacturaElectronica = False
                Exit Function
            End If



            If objAdmConexiones.rsSQLFE.HasRows Then

                _listaSolicitudes = New ArrayList

                If objAdmConexiones.rsSQLFE.Read Then
                    un_resultadoSP = New ResultadoSP()
                    Me.rsto_resultadoSP(un_resultadoSP, objAdmConexiones.rsSQLFE)
                    _listaSolicitudes.Add(un_resultadoSP)
                    generarSolicitudFacturaElectronica = True
                    Exit Function
                End If

            Else
                Me._error = "No existen registros para procesar en spu_generarSolicitud "
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

        Catch ex As Exception
            Me._error = "No existen registros para procesar en spu_generarSolicitud. " + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try

    End Function






    Private Function rsto_resultadoSP(ByVal pResultadoSP As ResultadoSP, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - rsto_resultadoSP")
        rsto_resultadoSP = True
        Try

            pResultadoSP.resultado.Valor = rs("resultado")
            pResultadoSP.descripcion.Valor = rs("descripcion")

            pResultadoSP.resultado.Tipo = rs("resultado").GetType
            pResultadoSP.descripcion.Tipo = rs("descripcion").GetType

            rsto_resultadoSP = False
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        End Try
    End Function



    Public Function obtenerproximoID() As Campo
        Log.Logger(tipoLogging.Info, "SolicitudDAO - obtenerproximoID")

        Dim Sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Try

            Sql = " SELECT ISNULL(MAX(lote)+1,1) AS maxID FROM lote "

            Log.Logger(tipoLogging.Debug, Sql)

            If Not objAdmConexiones.EjecutarQuerySQL(Sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            If objAdmConexiones.rsSQL.HasRows Then
                While objAdmConexiones.rsSQL.Read()
                    un_campo.Tipo = objAdmConexiones.rsSQL("maxID").GetType
                    un_campo.Valor = objAdmConexiones.rsSQL("maxID").ToString
                    Exit While
                End While
            End If

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
            obtenerproximoID = un_campo
        End Try
    End Function

    Public Function EliminarSolicitud(ByVal idsolicitud As Campo) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - EliminarSolicitud")
        EliminarSolicitud = False

        Dim sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Try

            sql = " spu_eliminarSolicitud " + SQLAdapter.formatValuetoSQL(idsolicitud)
            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            EliminarSolicitud = True

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try
    End Function

    Public Function actualizacionProvisoria(ByVal un_comprobante As Comprobante) As Boolean
        Log.Logger(tipoLogging.Info, "SolicitudDAO - actualizacionProvisoria")
        actualizacionProvisoria = False

        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Try

            sql = " UPDATE comprobante SET "
            sql = sql + " estado_envio =	 " + SQLAdapter.formatValuetoSQL(un_comprobante.estado_envio)
            sql = sql + " WHERE "
            sql = sql + " idsolicitud = " + SQLAdapter.formatValuetoSQL(un_comprobante.nro_trans)

            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            actualizacionProvisoria = True

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try

    End Function


End Class
