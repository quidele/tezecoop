Public Class AdmFacturaElectronica


    Public [error] As String
    Public listaSolicitudesAEnviar As New ArrayList
    Private unComprobantes_ml As New Comprobantes_ml
    Private uncbtesasoc As New cbtesasoc

    Dim unDetalle_tributosDAO As New Detalle_tributosDAO
    Dim unDetalle_ivaDAO As New Detalle_ivaDAO
    Dim unComprobante_mlDAO As New Comprobantes_mlDAO
    Dim uncbtesasocDAO As New cbtesasocDAO

    Public modo_operacion As String = Configuration.ConfigurationManager.AppSettings("MODO_OPERACION") ' Produccion / Homologacion

    '/* objeto que permite obtener un token Tanto para Produccion como Homologación*/
    Dim objAccesoTA As New AccesoAFIP


    Dim respuesta As String

    '* para Homologacion */
    Dim objHomoWSFE As New ar.gov.afip.wshomofev1.ServiceSoapClient

    Dim objHomoFEAuthRequest As New ar.gov.afip.wshomofev1.FEAuthRequest
    Dim objHomoFECAECabeceraRequest As New ar.gov.afip.wshomofev1.FECAECabRequest
    Dim ArrayOfFEDetalleRequestHomo(0) As ar.gov.afip.wshomofev1.FECAEDetRequest
    Dim objHomoFEDetalleRequest As New ar.gov.afip.wshomofev1.FECAEDetRequest
    Dim objHomoFECAERequest As New ar.gov.afip.wshomofev1.FECAERequest
    Dim objHomoFECAEResponse As New ar.gov.afip.wshomofev1.FECAEResponse
    Dim objHomoIVA As New ar.gov.afip.wshomofev1.AlicIva
    Dim ArrayOfTributosHomo(0) As ar.gov.afip.wshomofev1.Tributo
    Dim ArrayOfIvaHomo(0) As ar.gov.afip.wshomofev1.AlicIva
    Dim ArrayOfcbtesasocHomo(0) As ar.gov.afip.wshomofev1.CbteAsoc
    Dim objHomoFEUltNroResponse As New ar.gov.afip.wshomofev1.FERecuperaLastCbteResponse


    '* para Produccion */
    Dim objProdWSFE As New ar.gov.afip.wsfe_v1.ServiceSoapClient

    Dim objProdFECAECabeceraRequest As New ar.gov.afip.wsfe_v1.FECAECabRequest
    Dim ArrayOfFEDetalleRequestProd(0) As ar.gov.afip.wsfe_v1.FECAEDetRequest
    Dim objProdFEDetalleRequest As New ar.gov.afip.wsfe_v1.FECAEDetRequest
    Dim objProdFECAERequest As New ar.gov.afip.wsfe_v1.FECAERequest
    Dim objProdFECAEResponse As New ar.gov.afip.wsfe_v1.FECAEResponse
    Dim objProdIVA As New ar.gov.afip.wsfe_v1.AlicIva
    Dim ArrayOfTributosProd(0) As ar.gov.afip.wsfe_v1.Tributo
    Dim ArrayOfIvaProd(0) As ar.gov.afip.wsfe_v1.AlicIva
    Dim ArrayOfcbtesasocProd(0) As ar.gov.afip.wsfe_v1.CbteAsoc
    Dim objProdFEUltNroResponse As New ar.gov.afip.wsfe_v1.FERecuperaLastCbteResponse
    Dim objProdFEAuthRequest As New ar.gov.afip.wsfe_v1.FEAuthRequest

    'Public Function solicitarCAE(ByVal puna_solicitud As SolicitudML) As Boolean
    Public Function solicitarCAE(ByVal pun_comprobante As Comprobantes_ml, ByVal Frm_obtieneCAE As Object) As Boolean
        Dim una_SolicitudDAO As New SolicitudMLDAO

        solicitarCAE = False


        ' todos los objetos deben ser declarados a nivel de instancia
        ' obtener Comprobantes_ml haciendo uso de Comprobantes_mlDAO
        ' obtener Detalle_iva haciendo uso de Detalle_ivaDAO
        ' obtener Detalle_iva haciendo uso de Detalle_ivaDAO
        ' obtener Detalle_tributos haciendo uso de Detalle_tributosDAO

        unComprobantes_ml = pun_comprobante

        unDetalle_ivaDAO.obtenerDetalle_iva(pun_comprobante.idsolicitud)
        unDetalle_tributosDAO.obtenerDetalle_tributos(pun_comprobante.idsolicitud)
        uncbtesasocDAO.obtenerCbtesasoc(pun_comprobante.idsolicitud)
        Log.EscbribirLinea_Log("Solicitando Token")
        Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Solicitando token"
        ' obtención del token
        If modo_operacion = "Homologacion" Then
            Log.EscbribirLinea_Log("Modo de operacion: 'Homologacion'")
            If Not objAccesoTA.obtenerTicketHomologacion() Then
                Me.error = "no se puede obtener el ticket de acceso"
                Log.EscbribirLinea_Log("no se puede obtener el ticket de acceso")
                Exit Function
            End If
        ElseIf modo_operacion = "Produccion" Then
            Log.EscbribirLinea_Log("Modo de operacion: 'Produccion'")
            If Not objAccesoTA.obtenerTicketProduccion() Then
                Me.error = "no se puede obtener el ticket de acceso"
                Log.EscbribirLinea_Log("no se puede obtener el ticket de acceso")
                Exit Function
            End If
        End If

        Try



            Log.EscbribirLinea_Log("Adaptando Formatos")
            Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Adaptando formatos"
            ' /*  Adaptar al formato AFIP */
            If modo_operacion = "Homologacion" Then
                AdaptarFormatoAFIPHOMO()
            ElseIf modo_operacion = "Produccion" Then
                AdaptarFormatoAFIPPROD()
            End If


            '/* Nos comunicamos con el web services de factura electronica por obtener el cae*/
            'Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Estableciendo comunicación con AFIP"
            Log.EscbribirLinea_Log("Estableciendo comunicación con AFIP")
            If modo_operacion = "Homologacion" Then
                objHomoFECAEResponse = objHomoWSFE.FECAESolicitar(objHomoFEAuthRequest, objHomoFECAERequest)
                respuesta = objHomoFECAEResponse.FeCabResp.Resultado
            ElseIf modo_operacion = "Produccion" Then
                objProdFECAEResponse = objProdWSFE.FECAESolicitar(objProdFEAuthRequest, objProdFECAERequest)
                respuesta = objProdFECAEResponse.FeCabResp.Resultado
            End If

        Catch ex As Exception
            Me.error = ex.Message
            Exit Function
        End Try
        Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Analizando resultado AFIP"
        '   Log.EscbribirLinea_Log("Resultado: " + objHomoFECAEResponse.FeCabResp.Resultado)
        If respuesta = "R" Then


            If modo_operacion = "Homologacion" Then
                For Each elem As ar.gov.afip.wshomofev1.FEDetResponse In objHomoFECAEResponse.FeDetResp
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    If elem.Observaciones Is Nothing Then
                        Me.error = "Comprobante rechazado por error desconocido."
                        Log.EscbribirLinea_Log("Comprobante rechazado por error desconocido.")
                        Exit Function
                    End If
                    Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Guardando observaciones"
                    For Each elem_obs In elem.Observaciones
                        ' grabar la tabla de observaciones 
                        Dim objObservaciones As New Observaciones()
                        objObservaciones.Code.valor = elem_obs.Code
                        objObservaciones.Code.tipo = elem_obs.Code.GetType
                        objObservaciones.Msg.valor = elem_obs.Msg
                        objObservaciones.Msg.tipo = elem_obs.Msg.GetType
                        objObservaciones.idsolicitud = pun_comprobante.idsolicitud
                        objObservacionesDAO.insertarObservacion(objObservaciones)

                        Me.error = Me.error + "** " + objObservaciones.Msg.valor + " "
                    Next

                Next
            ElseIf modo_operacion = "Produccion" Then
                For Each elem As ar.gov.afip.wsfe_v1.FEDetResponse In objProdFECAEResponse.FeDetResp
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    If elem.Observaciones Is Nothing Then
                        Me.error = "Comprobante rechazado por error desconocido."
                        Log.EscbribirLinea_Log("Comprobante rechazado por error desconocido.")
                        Exit Function
                    End If
                    Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Guardando observaciones"
                    For Each elem_obs In elem.Observaciones
                        ' grabar la tabla de observaciones 
                        Dim objObservaciones As New Observaciones()
                        objObservaciones.Code.valor = elem_obs.Code
                        objObservaciones.Code.tipo = elem_obs.Code.GetType
                        objObservaciones.Msg.valor = elem_obs.Msg
                        objObservaciones.Msg.tipo = elem_obs.Msg.GetType
                        objObservaciones.idsolicitud = pun_comprobante.idsolicitud
                        objObservacionesDAO.insertarObservacion(objObservaciones)

                        Me.error = Me.error + "** " + objObservaciones.Msg.valor + " "
                    Next

                Next
            End If


            ' actualizar el comprobante PARA ERROR!!!

            If modo_operacion = "Homologacion" Then
                Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Actualizando datos del comprobante"
                Log.EscbribirLinea_Log("Actualizando datos del comprobante")
                Dim un_ComprobanteErrorML As New Comprobantes_ml

                un_ComprobanteErrorML.CAE.valor = objHomoFECAEResponse.FeDetResp(0).CAE
                un_ComprobanteErrorML.CAE.tipo = objHomoFECAEResponse.FeDetResp(0).CAE.GetType
                un_ComprobanteErrorML.CAEFchVto.valor = objHomoFECAEResponse.FeDetResp(0).CAEFchVto
                un_ComprobanteErrorML.CAEFchVto.tipo = objHomoFECAEResponse.FeDetResp(0).CAEFchVto.GetType
                un_ComprobanteErrorML.DocNro.valor = objHomoFECAEResponse.FeDetResp(0).DocNro
                un_ComprobanteErrorML.DocNro.tipo = objHomoFECAEResponse.FeDetResp(0).DocNro.GetType
                un_ComprobanteErrorML.estado_envio.valor = "Error"
                un_ComprobanteErrorML.estado_envio.tipo = GetType(String)
                un_ComprobanteErrorML.nro_doc_afip.valor = objHomoFECAEResponse.FeDetResp(0).CbteDesde
                un_ComprobanteErrorML.nro_doc_afip.tipo = objHomoFECAEResponse.FeDetResp(0).CbteDesde.GetType
                unComprobante_mlDAO.actualizarComprobante(un_ComprobanteErrorML)

                Log.EscbribirLinea_Log("Error del comprobante")

                Exit Function
            
            ElseIf modo_operacion = "Produccion" Then
                Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Actualizando datos del comprobante"
                Log.EscbribirLinea_Log("Actualizando datos del comprobante")
                Dim un_ComprobanteErrorML As New Comprobantes_ml

                un_ComprobanteErrorML.CAE.valor = objProdFECAEResponse.FeDetResp(0).CAE
                un_ComprobanteErrorML.CAE.tipo = objProdFECAEResponse.FeDetResp(0).CAE.GetType
                un_ComprobanteErrorML.CAEFchVto.valor = objProdFECAEResponse.FeDetResp(0).CAEFchVto
                un_ComprobanteErrorML.CAEFchVto.tipo = objProdFECAEResponse.FeDetResp(0).CAEFchVto.GetType
                un_ComprobanteErrorML.DocNro.valor = objProdFECAEResponse.FeDetResp(0).DocNro
                un_ComprobanteErrorML.DocNro.tipo = objProdFECAEResponse.FeDetResp(0).DocNro.GetType
                un_ComprobanteErrorML.estado_envio.valor = "Error"
                un_ComprobanteErrorML.estado_envio.tipo = GetType(String)
                un_ComprobanteErrorML.nro_doc_afip.valor = objProdFECAEResponse.FeDetResp(0).CbteDesde
                un_ComprobanteErrorML.nro_doc_afip.tipo = objProdFECAEResponse.FeDetResp(0).CbteDesde.GetType
                unComprobante_mlDAO.actualizarComprobante(un_ComprobanteErrorML)

                Log.EscbribirLinea_Log("Error del comprobante")

                Exit Function
           
            End If
            Exit Function
        Else
            Me.error = ""
        End If


        If modo_operacion = "Homologacion" Then
            unComprobantes_ml.CAE.valor = objHomoFECAEResponse.FeDetResp(0).CAE
            unComprobantes_ml.CAE.tipo = objHomoFECAEResponse.FeDetResp(0).CAE.GetType
            unComprobantes_ml.CAEFchVto.valor = objHomoFECAEResponse.FeDetResp(0).CAEFchVto
            unComprobantes_ml.CAEFchVto.tipo = objHomoFECAEResponse.FeDetResp(0).CAEFchVto.GetType
            unComprobantes_ml.DocNro.valor = objHomoFECAEResponse.FeDetResp(0).DocNro
            unComprobantes_ml.DocNro.tipo = objHomoFECAEResponse.FeDetResp(0).DocNro.GetType
            unComprobantes_ml.estado_envio.valor = "Aprobado"
            unComprobantes_ml.estado_envio.tipo = GetType(String)
            unComprobantes_ml.nro_doc_afip.valor = objHomoFECAEResponse.FeDetResp(0).CbteDesde
            unComprobantes_ml.nro_doc_afip.tipo = objHomoFECAEResponse.FeDetResp(0).CbteDesde.GetType

            Log.EscbribirLinea_Log("Comprobante_Aprobado")
            If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                Me.error = unComprobante_mlDAO.error
                Exit Function
            End If
        ElseIf modo_operacion = "Produccion" Then
            unComprobantes_ml.CAE.valor = objProdFECAEResponse.FeDetResp(0).CAE
            unComprobantes_ml.CAE.tipo = objProdFECAEResponse.FeDetResp(0).CAE.GetType
            unComprobantes_ml.CAEFchVto.valor = objProdFECAEResponse.FeDetResp(0).CAEFchVto
            unComprobantes_ml.CAEFchVto.tipo = objProdFECAEResponse.FeDetResp(0).CAEFchVto.GetType
            unComprobantes_ml.DocNro.valor = objProdFECAEResponse.FeDetResp(0).DocNro
            unComprobantes_ml.DocNro.tipo = objProdFECAEResponse.FeDetResp(0).DocNro.GetType
            unComprobantes_ml.estado_envio.valor = "Aprobado"
            unComprobantes_ml.estado_envio.tipo = GetType(String)
            unComprobantes_ml.nro_doc_afip.valor = objProdFECAEResponse.FeDetResp(0).CbteDesde
            unComprobantes_ml.nro_doc_afip.tipo = objProdFECAEResponse.FeDetResp(0).CbteDesde.GetType

            Log.EscbribirLinea_Log("Comprobante_Aprobado")
            If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                Me.error = unComprobante_mlDAO.error
                Exit Function
            End If
        End If

        
        'unComprobante_mlDAO.actualizarComprobante()
        Log.EscbribirLinea_Log("Actualizando base de datos local y Magma")
        '/  Actualizamos la base de datos local y magma
        '/  ya existe un SPs para actualizar magma llamado
        '   usar como referencia el sp [fon].[spu_carga_factura_electronica_ml]
        AdmConexiones.BeginTransSQLFE()

        Me.error = ""
        ' llamar a este store procedure 
        If Not unComprobante_mlDAO.actualizarComprobanteMagma(unComprobantes_ml) Then

            Me.error = unComprobante_mlDAO.error
            Log.EscbribirLinea_Log(unComprobante_mlDAO.error)
            AdmConexiones.RollbackSQL()

        Else
            AdmConexiones.CommitSQLFE()
            Log.EscbribirLinea_Log("Commit Realizado con éxito!!!")
        End If
        'ufn_actualizarDatosFacturaElectronica_v1_3()
        Log.EscbribirLinea_Log("Grabando estado de envío")
        Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Grabando estado envío"
        If Me.error = "" Then
            unComprobantes_ml.estado_envio.valor = "Asignado"
            unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml)
            Log.EscbribirLinea_Log("Comprobante_Asignado")
        Else
            unComprobantes_ml.estado_envio.valor = "No Asignado"
            unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml)
            solicitarCAE = False
            Log.EscbribirLinea_Log("No asignado")
            Exit Function
        End If

        solicitarCAE = True


    End Function



    ' Obtener Solicitudes a procesar 


    Public Function MostrarSoldesAEnviar() As Boolean
        Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Obteniendo solicitudes a procesar"
        Dim una_SolicitudDAO As New SolicitudMLDAO

        MostrarSoldesAEnviar = True
        listaSolicitudesAEnviar.Clear()

        If Not una_SolicitudDAO.obtenerSolicitudaEnviar() Then
            MostrarSoldesAEnviar = False
            [error] = una_SolicitudDAO.error
            Log.EscbribirLinea_Log([error])
            Exit Function
        End If

        If una_SolicitudDAO.listaSolicitudes.Count = 0 Then
            MostrarSoldesAEnviar = False
            [error] = "No existen comprobantes para enviar a AFIP."
            Log.EscbribirLinea_Log("No existen comprobantes para enviar a AFIP")
            Exit Function
        End If

        listaSolicitudesAEnviar = una_SolicitudDAO.listaSolicitudes



        ' procesamos los comprobantes
        'For Each un_comprobante As Comprobante In un_ComprobateDAO.listaComprobantes '-- Analiza el Array que se cargó en la clase ComprobanteDAO
        'listaComprobantesAEnviar.Add(un_comprobante) '-- Agrega un comprobante más a la lista de comprobantes A ENVIAR.
        'Next

    End Function

    Private Sub LlenarListaObservaciones(ByVal elem As System.Object)



    End Sub



    ''' <summary>
    ''' Adapta el comprobante al formato de AFIP para Homologación
    ''' </summary>
    ''' <returns>Boolean</returns>
    Private Function AdaptarFormatoAFIPHOMO() As Boolean
        Log.EscbribirLinea_Log("Adaptando formato Afip - Homologacion")
        Dim existeDetalleIVA As Boolean = False
        Dim existeDetalleTributo As Boolean = False
        Dim existeCmpAsociados As Boolean = False

        Log.EscbribirLinea_Log("Token " + objAccesoTA.Token.ToString)
        Log.EscbribirLinea_Log("Sign " + objAccesoTA.Sign.ToString)

        objHomoFEAuthRequest.Token = objAccesoTA.Token
        objHomoFEAuthRequest.Sign = objAccesoTA.Sign
        objHomoFEAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")

        objHomoWSFE.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFE.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFE.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)
        objHomoFEUltNroResponse = objHomoWSFE.FECompUltimoAutorizado(objHomoFEAuthRequest, _
                                    unComprobantes_ml.PtoVta.valor, unComprobantes_ml.CbteTipo.valor)

        objHomoFECAECabeceraRequest.CbteTipo = unComprobantes_ml.CbteTipo.valor
        objHomoFECAECabeceraRequest.CantReg = 1
        objHomoFECAECabeceraRequest.PtoVta = unComprobantes_ml.PtoVta.valor

        With objHomoFEDetalleRequest

            .Concepto = unComprobantes_ml.Concepto.valor  '1 ' Productos 
            .DocTipo = unComprobantes_ml.DocTipo.valor
            .DocNro = unComprobantes_ml.DocNro.valor
            .CbteDesde = objHomoFEUltNroResponse.CbteNro + 1
            .CbteHasta = objHomoFEUltNroResponse.CbteNro + 1
            .ImpTotal = unComprobantes_ml.ImpTotal.valor
            .ImpTotConc = unComprobantes_ml.ImpTotConc.valor
            .ImpNeto = unComprobantes_ml.ImpNeto.valor
            '.ImpTrib = unComprobantes_ml.ImpNeto.valor

            .ImpTrib = unComprobantes_ml.ImpTrib.valor
            .ImpOpEx = unComprobantes_ml.ImpOpEx.valor
            .ImpIVA = unComprobantes_ml.ImpIVA.valor

            '.ImpTrib = 0
            '.ImpOpEx = 0
            '.ImpIVA = 0

            .CbteFch = Format(Now, "yyyyMMdd") ' este es el que vale
            .MonId = unComprobantes_ml.MonId.valor
            .MonCotiz = unComprobantes_ml.MonCotiz.valor

        End With

        ' /* modificar en Produccion ver tema indices y creaciobn inicial del objeto en la matriz */
        Dim i As Integer = 0
        For Each unDetalle_tributos As Detalle_tributos In unDetalle_tributosDAO.listaDetalle_tributo
            existeDetalleTributo = True
            ReDim Preserve ArrayOfTributosHomo(0 To i)
            ArrayOfTributosHomo(0 To i) = New ar.gov.afip.wshomofev1.Tributo()
            ArrayOfTributosHomo(i).Alic = unDetalle_tributos.Alic.valor
            ArrayOfTributosHomo(i).BaseImp = unDetalle_tributos.BaseImp.valor
            ArrayOfTributosHomo(i).Desc = unDetalle_tributos.Descripcion.valor
            ArrayOfTributosHomo(i).Id = unDetalle_tributos.Id.valor
            ArrayOfTributosHomo(i).Importe = unDetalle_tributos.Importe.valor
            i = i + 1
        Next

        i = 0
        For Each unDetalle_iva As Detalle_iva In unDetalle_ivaDAO.listaDetalle_iva
            existeDetalleIVA = True
            ReDim Preserve ArrayOfIvaHomo(0 To i)
            ArrayOfIvaHomo(0 To i) = New ar.gov.afip.wshomofev1.AlicIva()
            ArrayOfIvaHomo(i).BaseImp = unDetalle_iva.BaseImp.valor
            ArrayOfIvaHomo(i).Id = unDetalle_iva.Id.valor
            ArrayOfIvaHomo(i).Importe = unDetalle_iva.Importe.valor
            i = i + 1
        Next


        ' arreglado el sp porque en facturas no hay cmpasociados
        i = 0
        For Each uncbtesasoc As cbtesasoc In uncbtesasocDAO.listaCbtesasoc
            existeCmpAsociados = True
            ReDim Preserve ArrayOfcbtesasocHomo(0 To i)
            ArrayOfcbtesasocHomo(i) = New ar.gov.afip.wshomofev1.CbteAsoc
            ArrayOfcbtesasocHomo(i).Nro = uncbtesasoc.Nro.valor
            ArrayOfcbtesasocHomo(i).PtoVta = uncbtesasoc.PtoVta.valor
            ArrayOfcbtesasocHomo(i).Tipo = uncbtesasoc.Tipo.valor
        Next

        If existeDetalleIVA Then
            objHomoFEDetalleRequest.Iva = ArrayOfIvaHomo
            Log.EscbribirLinea_Log("Lista de Detalle_IVA creada")
        End If
        If existeDetalleTributo Then
            objHomoFEDetalleRequest.Tributos = ArrayOfTributosHomo
            Log.EscbribirLinea_Log("Lista de Detalle_tributos creada")
        End If
        If existeCmpAsociados Then
            objHomoFEDetalleRequest.CbtesAsoc = ArrayOfcbtesasocHomo
            Log.EscbribirLinea_Log("Lista de Detalles_Asoc creada")
        End If

        objHomoFECAERequest.FeCabReq = objHomoFECAECabeceraRequest
        ArrayOfFEDetalleRequestHomo(0) = objHomoFEDetalleRequest
        objHomoFECAERequest.FeDetReq = ArrayOfFEDetalleRequestHomo
        Log.EscbribirLinea_Log("Adaptacion Homologacion Completa")
    End Function

    ''' <summary>
    ''' Adapta el comprobante al formato de AFIP para Producción
    ''' </summary>
    ''' <returns>Boolean</returns>
    Private Function AdaptarFormatoAFIPPROD() As Boolean
        Log.EscbribirLinea_Log("Adaptando formato Afip - Producción")
        Dim existeDetalleIVA As Boolean = False
        Dim existeDetalleTributo As Boolean = False
        Dim existeCmpAsociados As Boolean = False


        Log.EscbribirLinea_Log("Token " + objAccesoTA.Token.ToString)
        Log.EscbribirLinea_Log("Sign " + objAccesoTA.Sign.ToString)

        objProdFEAuthRequest.Token = objAccesoTA.Token
        objProdFEAuthRequest.Sign = objAccesoTA.Sign
        objProdFEAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")

        objProdWSFE.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
        objProdWSFE.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
        objProdWSFE.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)
        objProdFEUltNroResponse = objProdWSFE.FECompUltimoAutorizado(objProdFEAuthRequest, _
                                    unComprobantes_ml.PtoVta.valor, unComprobantes_ml.CbteTipo.valor)

        objProdFECAECabeceraRequest.CbteTipo = unComprobantes_ml.CbteTipo.valor
        objProdFECAECabeceraRequest.CantReg = 1
        objProdFECAECabeceraRequest.PtoVta = unComprobantes_ml.PtoVta.valor

        With objProdFEDetalleRequest

            .Concepto = unComprobantes_ml.Concepto.valor  '1 ' Productos 
            .DocTipo = unComprobantes_ml.DocTipo.valor
            .DocNro = unComprobantes_ml.DocNro.valor
            .CbteDesde = objProdFEUltNroResponse.CbteNro + 1
            .CbteHasta = objProdFEUltNroResponse.CbteNro + 1
            .ImpTotal = unComprobantes_ml.ImpTotal.valor
            .ImpTotConc = unComprobantes_ml.ImpTotConc.valor
            .ImpNeto = unComprobantes_ml.ImpNeto.valor
            '.ImpTrib = unComprobantes_ml.ImpNeto.valor

            .ImpTrib = unComprobantes_ml.ImpTrib.valor
            .ImpOpEx = unComprobantes_ml.ImpOpEx.valor
            .ImpIVA = unComprobantes_ml.ImpIVA.valor

            '.ImpTrib = 0
            '.ImpOpEx = 0
            '.ImpIVA = 0

            '.CbteFch = Format(Now, "yyyyMMdd") ' este es el que vale
            .CbteFch = Format(unComprobantes_ml.CbteFch.valor, "yyyyMMdd")
            .MonId = unComprobantes_ml.MonId.valor
            .MonCotiz = unComprobantes_ml.MonCotiz.valor

        End With

        ' /* modificar en Produccion ver tema indices y creaciobn inicial del objeto en la matriz */
        Dim i As Integer = 0
        For Each unDetalle_tributos As Detalle_tributos In unDetalle_tributosDAO.listaDetalle_tributo
            existeDetalleTributo = True
            ReDim Preserve ArrayOfTributosProd(0 To i)
            ArrayOfTributosProd(0 To i) = New ar.gov.afip.wsfe_v1.Tributo()
            ArrayOfTributosProd(i).Alic = unDetalle_tributos.Alic.valor
            ArrayOfTributosProd(i).BaseImp = unDetalle_tributos.BaseImp.valor
            ArrayOfTributosProd(i).Desc = unDetalle_tributos.Descripcion.valor
            ArrayOfTributosProd(i).Id = unDetalle_tributos.Id.valor
            ArrayOfTributosProd(i).Importe = unDetalle_tributos.Importe.valor
            i = i + 1
        Next
        i = 0
        For Each unDetalle_iva As Detalle_iva In unDetalle_ivaDAO.listaDetalle_iva
            existeDetalleIVA = True
            ReDim Preserve ArrayOfIvaProd(0 To i)
            ArrayOfIvaProd(0 To i) = New ar.gov.afip.wsfe_v1.AlicIva()
            ArrayOfIvaProd(i).BaseImp = unDetalle_iva.BaseImp.valor
            ArrayOfIvaProd(i).Id = unDetalle_iva.Id.valor
            ArrayOfIvaProd(i).Importe = unDetalle_iva.Importe.valor
            i = i + 1
        Next

        ' arreglado el sp porque en facturas no hay cmpasociados
        i = 0
        For Each uncbtesasoc As cbtesasoc In uncbtesasocDAO.listaCbtesasoc
            existeCmpAsociados = True
            ReDim Preserve ArrayOfcbtesasocProd(0 To i)
            ArrayOfcbtesasocProd(i) = New ar.gov.afip.wsfe_v1.CbteAsoc
            ArrayOfcbtesasocProd(i).Nro = uncbtesasoc.Nro.valor
            ArrayOfcbtesasocProd(i).PtoVta = uncbtesasoc.PtoVta.valor
            ArrayOfcbtesasocProd(i).Tipo = uncbtesasoc.Tipo.valor
        Next

        If existeDetalleIVA Then
            objProdFEDetalleRequest.Iva = ArrayOfIvaProd
            Log.EscbribirLinea_Log("Lista de Detalle_IVA creada")
        End If
        If existeDetalleTributo Then
            objProdFEDetalleRequest.Tributos = ArrayOfTributosProd
            Log.EscbribirLinea_Log("Lista de Detalle_tributo creada")
        End If
        If existeCmpAsociados Then
            objProdFEDetalleRequest.CbtesAsoc = ArrayOfcbtesasocProd
            Log.EscbribirLinea_Log("Lista de Comprobantes_Asoc creada")
        End If

        objProdFECAERequest.FeCabReq = objProdFECAECabeceraRequest
        ArrayOfFEDetalleRequestProd(0) = objProdFEDetalleRequest
        objProdFECAERequest.FeDetReq = ArrayOfFEDetalleRequestProd
        Log.EscbribirLinea_Log("Adaptación Produccion Completa")

        AdaptarFormatoAFIPPROD = True



    End Function

End Class
