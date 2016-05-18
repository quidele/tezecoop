Imports fonseca_libDatos

Public Class AdmFacturaElectronica

    Public Enum modos_generar As Integer
        real
        simulacion
    End Enum

    Public [error] As String
    Public listaComprobantesAEnviar As New ArrayList
    Public listaComprobantesProcesados As New ArrayList
    Private listaSolicitudesXML As New ArrayList
    Public lote As New lote
    Public una_simulacion As New Simulacion


    Public Function generarArchivodeEnviar(ByVal pnombreArchivo As String, ByVal modo As modos_generar, ByVal fecha As Date) As Boolean

        Dim un_ComprobateDAO As New ComprobanteDAO
        Dim una_SolicitudDAO As New SolicitudDAO
        Dim un_loteDAO As New loteDAO
        Dim una_SimulacionDao As New SimulacionDAO
        Dim simul As Boolean
        Dim fecha_base As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        generarArchivodeEnviar = True

        fecha_base.Valor = fecha
        fecha_base.Tipo = SQLAdapter.getTipoDate

        listaComprobantesProcesados.Clear()
        listaSolicitudesXML.Clear()

        If listaComprobantesAEnviar.Count = 0 Then
            generarArchivodeEnviar = False
            [error] = "No existen comprobantes para enviar a AFIP."
            Exit Function
        End If

        objAdmConexiones.BeginTransSQLFE()




        ' Verificar error
        If Not un_loteDAO.insertar(Me.lote) Then '-- Función insertar de la clase loteDAO, Inserta datos del objeto lote (de Me) en tabla lote
            Me.error = "Se produjo un error al Insertar Lote: " + vbCrLf + "Error extendido: " + un_loteDAO.Error
            objAdmConexiones.RollbackSQLFE()
            Exit Function
        End If

        ' procesamos los comprobantes
        For Each un_comprobante As Comprobante In listaComprobantesAEnviar '-- Analiza el Array que se cargó en la clase ComprobanteDAO
            una_SolicitudDAO.EliminarSolicitud(un_comprobante.nro_trans)
            If Not una_SolicitudDAO.generarSolicitudFacturaElectronica(un_comprobante.nro_trans, Me.lote.lote) Then '-- Envía a la función generarSolicitudFacturaElectronica
                un_comprobante.estado.Valor = "ERROR" '-- el nro trans del comprobante actual del array, y el nro de lote del objeto lote. Son 2 atributos tipo Campo (clase Campo)
                un_comprobante.estado.Tipo = SQLAdapter.getTipoString
                un_comprobante.observacion.Valor = una_SolicitudDAO.Error
                un_comprobante.estado.Tipo = SQLAdapter.getTipoString
                generarArchivodeEnviar = False
            Else
                If una_SolicitudDAO.un_resultadoSP.resultado.Valor = "ERROR" Then
                    generarArchivodeEnviar = False
                Else
                    generarComentarioImporteenIngles(un_comprobante.nro_trans)
                End If
                un_comprobante.estado = una_SolicitudDAO.un_resultadoSP.resultado
                un_comprobante.observacion = una_SolicitudDAO.un_resultadoSP.descripcion
            End If
            listaComprobantesProcesados.Add(un_comprobante) '-- Agrega un comprobante más a la lista de comprobantes procesados por ENVIO.
        Next

        If Not generarArchivodeEnviar Then
            Me.error = "Existen errores en los comprobantes, verifique los códigos AFIP se encuentren bien asignados"
            objAdmConexiones.RollbackSQLFE()
            Exit Function
        End If

        listaSolicitudesXML.Add(una_SolicitudDAO.xml_header_solicitud) '-- Agrega el encabezado del archivo XML

        ' obtenemos el formato xml 
        For Each un_comprobante As Comprobante In Me.listaComprobantesProcesados

            If modo = modos_generar.real Then '-- Proceso por click Generar REAL

                If Not una_SolicitudDAO.obtenerXMLSolicitudaEnviar(un_comprobante.nro_trans, modo) Then
                    generarArchivodeEnviar = False
                    un_comprobante.estado.Valor = "ERROR"
                    un_comprobante.observacion.Valor = una_SolicitudDAO.Error
                    un_comprobante.observacion.Tipo = SQLAdapter.getTipoString
                Else
                    listaSolicitudesXML.Add(una_SolicitudDAO.xml_solicitud)
                End If
            Else
                una_simulacion.nro_simu = una_SimulacionDao.obtenerproximaSimulacion() 'Obtengo el nro una sola vez

                If Not una_SolicitudDAO.obtenerXMLSolicitudaEnviar_Simu(un_comprobante.nro_trans, fecha_base) Then '-- Proceso por click en Generar SIMULACION 
                    generarArchivodeEnviar = False
                    un_comprobante.estado.Valor = "ERROR"
                    un_comprobante.observacion.Valor = una_SolicitudDAO.Error
                    un_comprobante.observacion.Tipo = SQLAdapter.getTipoString
                Else
                    listaSolicitudesXML.Add(una_SolicitudDAO.xml_solicitud) '-- xml_solitud contiene el string completo con la estructura del archivo XML.
                End If
            End If

        Next
        listaSolicitudesXML.Add(una_SolicitudDAO.xml_trailer_solicitud) '-- Agrega la cola del archivo XML

        If Not generarArchivodeEnviar Then
            Me.error = "Existen errores en la obtención de los datos XML"
            generarArchivodeEnviar = False
            objAdmConexiones.RollbackSQLFE()
            Exit Function
        End If


        Dim un_ArchivoSolicitudes As New ArchivoSolicitudes

        If Not un_ArchivoSolicitudes.grabarArchivoSolicitudXML(pnombreArchivo, listaSolicitudesXML) Then
            Me.error = "Existen errores en la generación del archivo XML." + vbCrLf + "Error Extendido: " + un_ArchivoSolicitudes.error
            generarArchivodeEnviar = False
            objAdmConexiones.RollbackSQLFE()
            Exit Function
        End If

        If modo = modos_generar.real Then
            '-- Agregado
            For Each un_comprobante As Comprobante In listaComprobantesAEnviar
                un_comprobante.estado_envio.Valor = "Enviado"
                un_comprobante.estado_envio.Tipo = SQLAdapter.getTipoString
                If Not un_ComprobateDAO.actualizacionProvisoria(un_comprobante) Then
                    un_comprobante.estado_envio.Valor = "ERROR"
                    Me.error = "Se produjo un error en la actualización del estado_envio del comprobante"
                End If
            Next
            '-- Fin agregado
            generarArchivodeEnviar = objAdmConexiones.CommitSQLFE()
        Else
            generarArchivodeEnviar = objAdmConexiones.RollbackSQLFE() 'Para simulación anula las transacciones hechas en SQL server
            simul = una_SimulacionDao.actualizarSimulacion(una_simulacion)
        End If
    End Function


    Public Function MostrarCptesAEnviar() As Boolean
        Dim un_ComprobateDAO As New ComprobanteDAO

        MostrarCptesAEnviar = True
        listaComprobantesAEnviar.Clear()

        If Not un_ComprobateDAO.obtenerComprobantesaEnviar() Then
            MostrarCptesAEnviar = False
            [error] = un_ComprobateDAO.error
            Exit Function
        End If

        If un_ComprobateDAO.listaComprobantes.Count = 0 Then
            MostrarCptesAEnviar = False
            [error] = "No existen comprobantes para enviar a AFIP."
            Exit Function
        End If

        listaComprobantesAEnviar = un_ComprobateDAO.listaComprobantes

        ' procesamos los comprobantes
        'For Each un_comprobante As Comprobante In un_ComprobateDAO.listaComprobantes '-- Analiza el Array que se cargó en la clase ComprobanteDAO
        'listaComprobantesAEnviar.Add(un_comprobante) '-- Agrega un comprobante más a la lista de comprobantes A ENVIAR.
        'Next

    End Function

    Private Function generarComentarioImporteenIngles(ByVal pidSolicitud As Campo)
        Dim una_solicitudDAO As New SolicitudDAO
        generarComentarioImporteenIngles = False

        If Not una_solicitudDAO.obtenerSolicitud(pidSolicitud) Then
            Me.error = una_solicitudDAO.error
            Exit Function
        End If

        ' MsgBox("Say " + una_solicitudDAO.SolicitudBuscado.nom_moneda_ingles.valor.ToString.Trim + " " + RegionalUtils.ImporteEnLetras(una_solicitudDAO.SolicitudBuscado.importetotal.valor, "EN"))
        '-- Arma importe en monedas:
        una_solicitudDAO.SolicitudBuscado.otrosdatosgenerales.valor = una_solicitudDAO.SolicitudBuscado.otrosdatosgenerales.valor + vbCrLf + "Say " + una_solicitudDAO.SolicitudBuscado.nom_moneda_ingles.valor.ToString.Trim + " " + RegionalUtils.ImporteEnLetras(una_solicitudDAO.SolicitudBuscado.importetotal.valor, "EN")
        '-- Actualiza datos generales (con el importe en letras en inglés) en tabla comprobantes para esa solitud en particular:
        generarComentarioImporteenIngles = una_solicitudDAO.actualizarSolicitudImporteMoneda(una_solicitudDAO.SolicitudBuscado)
        Me.error = una_solicitudDAO.error

    End Function


    Public Function procesarArchivoRecibido(ByVal pNombreArchivo As String, ByVal fecha As Date) As Boolean
        Dim un_xmlUtils As New XmlUtils

        If Not un_xmlUtils.procesararchivo(pNombreArchivo) Then
            Me.error = un_xmlUtils.error
            Exit Function
        End If
        procesarArchivoRecibido = procesarSolictudesRecibidas(un_xmlUtils.listadeSolicitudesRecibidas, fecha)


    End Function

    Private Function procesarSolictudesRecibidas(ByVal plistadeSolicitudesRecibidas As ArrayList, ByVal fecha As Date) As Boolean
        Dim una_solicitudDAO As New SolicitudDAO
        Dim un_comprobanteDAO As New ComprobanteDAO
        Dim un_comprobante As New Comprobante
        'Dim Soli As New Solicitud

        listaComprobantesProcesados.Clear()

        For Each unaSolicitud As Solicitud In plistadeSolicitudesRecibidas

            ' verificar si es valido realizar la recepcion de la solicitud
            If Not (una_solicitudDAO.obtenerSolicitud(unaSolicitud.idsolicitud)) Then
                Me.error = una_solicitudDAO.error
                Exit Function
            End If

            If Not una_solicitudDAO.SolicitudBuscado.estado_envio.valor.ToString.Trim = "Enviado" Then
                Me.error = una_solicitudDAO.error
                Exit Function
            End If

            If Not una_solicitudDAO.actualizarSolicitud(unaSolicitud) Then
                Me.error = una_solicitudDAO.error
                Exit Function
            End If
            If Not un_comprobanteDAO.actualizarDatosFacturaElectronica(unaSolicitud) Then
                Me.error = un_comprobanteDAO.error
                Exit Function
            End If
            una_solicitudDAO.obtenerSolicitud(unaSolicitud.idsolicitud)
            un_comprobante.nro_trans = una_solicitudDAO.SolicitudBuscado.idsolicitud
            un_comprobante.estado = una_solicitudDAO.SolicitudBuscado.estadocmp
            un_comprobante.observacion.valor = "CAE = " + una_solicitudDAO.SolicitudBuscado.codaut.valor.ToString
            un_comprobante.nro_doc = una_solicitudDAO.SolicitudBuscado.nro_doc
            un_comprobante.fecha_emision = una_solicitudDAO.SolicitudBuscado.fechaemision
            listaComprobantesProcesados.Add(un_comprobante) '-- Agrega el comprobante a la lista de comprobantes procesados.
        Next

        procesarSolictudesRecibidas = True

    End Function

    '-- Fin de clase


End Class
