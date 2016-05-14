Public Class AdmFacturaElectronica


    Public [error] As String
    Public listaSolicitudesAEnviar As New ArrayList
    Dim respuesta As String
    Public modo_operacion As String = Configuration.ConfigurationManager.AppSettings("MODO_OPERACION") ' Produccion / Homologacion

    ' Para Mercado Local
    Private unComprobantes_ml As New Comprobantes_ml
    Private uncbtesasoc As New cbtesasoc

    Dim unDetalle_tributosDAO As New Detalle_tributosDAO
    Dim unDetalle_ivaDAO As New Detalle_ivaDAO
    Dim unComprobante_mlDAO As New Comprobantes_mlDAO
    Dim uncbtesasocDAO As New cbtesasocDAO

    ' Para Exportacion

    Dim un_comprobante As New Comprobante
    Dim un_comprobanteDAO As New ComprobanteDAO

    '* para Homologacion Mercado local*/
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

    Public objHomoFECompConsultarResponse As New ar.gov.afip.wshomofev1.FECompConsultarResponse()

    '* para Produccion Mercado Local*/
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

    Public objProdFECompConsultarResponse As New ar.gov.afip.wsfe_v1.FECompConsultarResponse()


    ' Para Exportacion
    Private unv_Comprobantes_ex As New v_Comprobantes_EX
    Private unv_PermisoDestino_ex As New v_PermisoDestino_EX
    Private unv_Items_ex As New v_Items_EX
    Private unv_cmpasociados_ex As New v_cmpasociados_EX

    Dim unComprobante_exDAO As New v_Comprobantes_EXDAO
    Dim unv_cmpasociados_exDAO As New v_cmpasociados_EXDAO
    Dim unv_Items_exDAO As New v_Items_EXDAO
    Dim unv_PermisoDestino_exDAO As New v_PermisoDestino_EXDAO

    ' Para Homologacion Exportacion

    Dim objHomoWSFEX As New ar.gov.afip.wsfexhomo.ServiceSoapClient
    Dim objHomoFEXUltNroResponse As New ar.gov.afip.wsfexhomo.FEXResponse_LastID
    Dim objHomoFEXDetalleRequestHomo As New ar.gov.afip.wsfexhomo.ClsFEXRequest
    Dim ArrayOfv_PermisosDestinoHomo(0) As ar.gov.afip.wsfexhomo.Permiso
    Dim ArrayOfv_ItemsHomo(0) As ar.gov.afip.wsfexhomo.Item
    Dim ArrayOfv_cmpasociados_homo(0) As ar.gov.afip.wsfexhomo.Cmp_asoc
    Dim objHomoFEXRequest As New ar.gov.afip.wsfexhomo.ClsFEXRequest
    Dim objHomoFEXGetCMPR As New ar.gov.afip.wsfexhomo.ClsFEXGetCMPR
    Dim objHomoFEXResponseAuthorize As New ar.gov.afip.wsfexhomo.FEXResponseAuthorize ' ver si podemos borrar
    Dim objHomoFEXAuthRequest As New ar.gov.afip.wsfexhomo.ClsFEXAuthRequest
    Dim objHomoFEXResponseLast_CMP As New ar.gov.afip.wsfexhomo.FEXResponseLast_CMP
    Dim objHomoClsFEX_LastCMP As New ar.gov.afip.wsfexhomo.ClsFEX_LastCMP
    Dim objHomoClsFEX_LastCMP_Response As New ar.gov.afip.wsfexhomo.ClsFEX_LastCMP_Response

    Public objHomoFEXGetCMPResponse As New ar.gov.afip.wsfexhomo.FEXGetCMPResponse
    ' Para Produccion Exportacion

    Dim objProdWSFEX As New ar.gov.afip.wsfex.ServiceSoapClient
    Dim objProdFEXUltNroResponse As New ar.gov.afip.wsfex.FEXResponse_LastID
    Dim objProdFEXDetalleRequestProd As New ar.gov.afip.wsfex.ClsFEXRequest
    Dim ArrayOfv_PermisosDestinoProd(0) As ar.gov.afip.wsfex.Permiso
    Dim ArrayOfv_ItemsProd(0) As ar.gov.afip.wsfex.Item
    Dim ArrayOfv_cmpasociados_Prod(0) As ar.gov.afip.wsfex.Cmp_asoc
    Dim objProdFEXRequest As New ar.gov.afip.wsfex.ClsFEXRequest
    Dim objProdFEXGetCMPR As New ar.gov.afip.wsfex.ClsFEXGetCMPR
    Dim objProdFEXResponseAuthorize As New ar.gov.afip.wsfex.FEXResponseAuthorize ' ver si podemos borrar
    Dim objProdFEXAuthRequest As New ar.gov.afip.wsfex.ClsFEXAuthRequest

    Dim objProdFEXResponseLast_CMP As New ar.gov.afip.wsfex.FEXResponseLast_CMP
    Dim objProdClsFEX_LastCMP As New ar.gov.afip.wsfex.ClsFEX_LastCMP
    Dim objProdClsFEX_LastCMP_Response As New ar.gov.afip.wsfex.ClsFEX_LastCMP_Response

    Public objProdFEXGetCMPResponse As New ar.gov.afip.wsfex.FEXGetCMPResponse
    '/* objeto que permite obtener un token Tanto para Produccion como Homologación*/
    Dim objAccesoTA As New AccesoAFIP





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
        Log.EscbribirLinea_Log("Modo de operacion: " + modo_operacion.ToString)
        unDetalle_ivaDAO.obtenerDetalle_iva(pun_comprobante.idsolicitud)
        unDetalle_tributosDAO.obtenerDetalle_tributos(pun_comprobante.idsolicitud)
        uncbtesasocDAO.obtenerCbtesasoc(pun_comprobante.idsolicitud)
        Log.EscbribirLinea_Log("Solicitando Token y Firma")
        ' Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Solicitando token"
        ' obtención del token
        If modo_operacion = "Homologacion" Then

            If Not objAccesoTA.obtenerTicketHomologacion() Then
                Me.error = "No se puede obtener el ticket de acceso" + vbCrLf + "Error Extendido: " + objAccesoTA.Error
                Log.EscbribirLinea_Log(Me.error)
                Exit Function
            End If
        ElseIf modo_operacion = "Produccion" Then

            If Not objAccesoTA.obtenerTicketProduccion() Then
                Me.error = "no se puede obtener el ticket de acceso" + vbCrLf + "Error Extendido: " + objAccesoTA.Error
                Log.EscbribirLinea_Log(Me.error)
                Exit Function
            End If
        End If
        Log.EscbribirLinea_Log("Token " + objAccesoTA.Token.ToString)
        Log.EscbribirLinea_Log("Sign " + objAccesoTA.Sign.ToString)
        Try

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
        Log.EscbribirLinea_Log("Respuesta: " + respuesta.ToString)
        If respuesta = "R" Then


            If modo_operacion = "Homologacion" Then
                For Each elem As ar.gov.afip.wshomofev1.FEDetResponse In objHomoFECAEResponse.FeDetResp
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    If elem.Observaciones Is Nothing Then
                        Me.error += " Comprobante rechazado por error desconocido."

                        Exit Function
                    End If
                    Log.EscbribirLinea_Log("Guardando observaciones.")
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
                    Log.EscbribirLinea_Log(Me.error)
                Next
            ElseIf modo_operacion = "Produccion" Then
                For Each elem As ar.gov.afip.wsfe_v1.FEDetResponse In objProdFECAEResponse.FeDetResp
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    If elem.Observaciones Is Nothing Then
                        For Each elem2 As ar.gov.afip.wsfe_v1.Err In objProdFECAEResponse.Errors
                            Me.error += elem2.Code.ToString + " - " + elem2.Msg
                        Next
                        If Me.error = "" Then
                            Me.error = "error desconocido!"
                        End If
                        Exit Function
                    End If
                    'Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Guardando observaciones"
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
                    Log.EscbribirLinea_Log(Me.error)
                Next
                Exit Function
            End If

            If modo_operacion = "Homologacion" Then

                Log.EscbribirLinea_Log("Actualizando datos del comprobante")

                unComprobantes_ml.CbteFch.valor = SQLAdapter.convertiraFecha(objHomoFECAEResponse.FeDetResp(0).CbteFch)
                unComprobantes_ml.CbteFch.tipo = SQLAdapter.getTipoDate

                unComprobantes_ml.CbteFch.formato = "Corto"

                unComprobantes_ml.CAE.valor = objHomoFECAEResponse.FeDetResp(0).CAE
                unComprobantes_ml.CAE.tipo = objHomoFECAEResponse.FeDetResp(0).CAE.GetType

                unComprobantes_ml.CAEFchVto.valor = objHomoFECAEResponse.FeDetResp(0).CAEFchVto
                unComprobantes_ml.CAEFchVto.tipo = objHomoFECAEResponse.FeDetResp(0).CAEFchVto.GetType

                unComprobantes_ml.DocNro.valor = objHomoFECAEResponse.FeDetResp(0).DocNro
                unComprobantes_ml.DocNro.tipo = objHomoFECAEResponse.FeDetResp(0).DocNro.GetType

                unComprobantes_ml.estado_envio.valor = "Error"
                unComprobantes_ml.estado_envio.tipo = SQLAdapter.getTipoString

                unComprobantes_ml.nro_doc_afip.valor = objHomoFECAEResponse.FeDetResp(0).CbteDesde
                unComprobantes_ml.nro_doc_afip.tipo = objHomoFECAEResponse.FeDetResp(0).CbteDesde.GetType


                If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                    Me.error = unComprobante_mlDAO.error
                End If

                Log.EscbribirLinea_Log("Error del comprobante")

                Exit Function

            ElseIf modo_operacion = "Produccion" Then
                'Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Actualizando datos del comprobante"
                Log.EscbribirLinea_Log("Actualizando datos del comprobante")

                unComprobantes_ml.CbteFch.valor = SQLAdapter.convertiraFecha(objHomoFECAEResponse.FeDetResp(0).CbteFch)
                unComprobantes_ml.CbteFch.tipo = SQLAdapter.getTipoDate

                unComprobantes_ml.CbteFch.formato = "Corto"

                unComprobantes_ml.CAE.valor = objProdFECAEResponse.FeDetResp(0).CAE
                unComprobantes_ml.CAE.tipo = objProdFECAEResponse.FeDetResp(0).CAE.GetType

                unComprobantes_ml.CAEFchVto.valor = objProdFECAEResponse.FeDetResp(0).CAEFchVto
                unComprobantes_ml.CAEFchVto.tipo = objProdFECAEResponse.FeDetResp(0).CAEFchVto.GetType

                unComprobantes_ml.DocNro.valor = objProdFECAEResponse.FeDetResp(0).DocNro
                unComprobantes_ml.DocNro.tipo = objProdFECAEResponse.FeDetResp(0).DocNro.GetType

                unComprobantes_ml.estado_envio.valor = "Error"
                unComprobantes_ml.estado_envio.tipo = SQLAdapter.getTipoString

                unComprobantes_ml.nro_doc_afip.valor = objProdFECAEResponse.FeDetResp(0).CbteDesde
                unComprobantes_ml.nro_doc_afip.tipo = objProdFECAEResponse.FeDetResp(0).CbteDesde.GetType


                If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                    Me.error = unComprobante_mlDAO.error
                End If

                Log.EscbribirLinea_Log("Error del comprobante")

                Exit Function

            End If
            Exit Function
        Else
            Me.error = ""
        End If


        If modo_operacion = "Homologacion" Then

            unComprobantes_ml.CbteFch.valor = SQLAdapter.convertiraFecha(objHomoFECAEResponse.FeDetResp(0).CbteFch)
            unComprobantes_ml.CbteFch.tipo = SQLAdapter.getTipoDate

            unComprobantes_ml.CbteFch.formato = "Corto"

            unComprobantes_ml.CAE.valor = objHomoFECAEResponse.FeDetResp(0).CAE
            unComprobantes_ml.CAE.tipo = objHomoFECAEResponse.FeDetResp(0).CAE.GetType

            unComprobantes_ml.CAEFchVto.valor = objHomoFECAEResponse.FeDetResp(0).CAEFchVto
            unComprobantes_ml.CAEFchVto.tipo = objHomoFECAEResponse.FeDetResp(0).CAEFchVto.GetType

            unComprobantes_ml.DocNro.valor = objHomoFECAEResponse.FeDetResp(0).DocNro
            unComprobantes_ml.DocNro.tipo = objHomoFECAEResponse.FeDetResp(0).DocNro.GetType

            unComprobantes_ml.estado_envio.valor = "Aprobado"
            unComprobantes_ml.estado_envio.tipo = SQLAdapter.getTipoString

            unComprobantes_ml.nro_doc_afip.valor = objHomoFECAEResponse.FeDetResp(0).CbteDesde
            unComprobantes_ml.nro_doc_afip.tipo = objHomoFECAEResponse.FeDetResp(0).CbteDesde.GetType

        ElseIf modo_operacion = "Produccion" Then

            unComprobantes_ml.CbteFch.valor = SQLAdapter.convertiraFecha(objProdFECAEResponse.FeDetResp(0).CbteFch)
            unComprobantes_ml.CbteFch.tipo = SQLAdapter.getTipoDate

            unComprobantes_ml.CbteFch.formato = "Corto"

            unComprobantes_ml.CAE.valor = objProdFECAEResponse.FeDetResp(0).CAE
            unComprobantes_ml.CAE.tipo = objProdFECAEResponse.FeDetResp(0).CAE.GetType

            unComprobantes_ml.CAEFchVto.valor = objProdFECAEResponse.FeDetResp(0).CAEFchVto
            unComprobantes_ml.CAEFchVto.tipo = objProdFECAEResponse.FeDetResp(0).CAEFchVto.GetType

            unComprobantes_ml.DocNro.valor = objProdFECAEResponse.FeDetResp(0).DocNro
            unComprobantes_ml.DocNro.tipo = objProdFECAEResponse.FeDetResp(0).DocNro.GetType

            unComprobantes_ml.estado_envio.valor = "Aprobado"
            unComprobantes_ml.estado_envio.tipo = SQLAdapter.getTipoString

            unComprobantes_ml.nro_doc_afip.valor = objProdFECAEResponse.FeDetResp(0).CbteDesde
            unComprobantes_ml.nro_doc_afip.tipo = objProdFECAEResponse.FeDetResp(0).CbteDesde.GetType
        End If

        Log.EscbribirLinea_Log("<--INICIA GRABACION CAE--> ")
        Log.EscbribirLinea_Log("ID: " + unComprobantes_ml.idsolicitud.valor.ToString)
        Log.EscbribirLinea_Log("CAE: " + unComprobantes_ml.CAE.valor)
        Log.EscbribirLinea_Log("CAEFchVto: " + unComprobantes_ml.CAEFchVto.valor)
        Log.EscbribirLinea_Log("DocNro AFIP: " + unComprobantes_ml.nro_doc_afip.valor.ToString)
        Log.EscbribirLinea_Log("CbteFch: " + unComprobantes_ml.CbteFch.valor.ToString)
        Log.EscbribirLinea_Log("<FINALIZA GRABACION CAE> ")

        Log.EscbribirLinea_Log("Comprobante_Aprobado")
        If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
            Me.error = unComprobante_mlDAO.error
            Exit Function
        End If

        'MsgBox("Salimos antes de Actualizar magma!! ")
        'solicitarCAE = True
        'Exit Function


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
        'Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Grabando estado envío"
        If Me.error = "" Then
            unComprobantes_ml.estado_envio.valor = "Asignado"
            If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                Me.error = unComprobante_mlDAO.error
                Exit Function
            End If
            Log.EscbribirLinea_Log("Comprobante_Asignado")
        Else
            unComprobantes_ml.estado_envio.valor = "No Asignado"
            If Not unComprobante_mlDAO.actualizarComprobante(unComprobantes_ml) Then
                Me.error = unComprobante_mlDAO.error
                Exit Function
            End If
            solicitarCAE = False
            Log.EscbribirLinea_Log("No asignado")
            Exit Function
        End If

        solicitarCAE = True


    End Function

    Public Function solicitarCAE_ex(ByVal pun_comprobante As v_Comprobantes_EX, ByVal Frm_obtieneCAE As Object) As Boolean

        Dim una_SolicitudEXDAO As New SolicitudEXDAO

        solicitarCAE_ex = False

        unv_Comprobantes_ex = pun_comprobante

        unv_cmpasociados_exDAO.obtenerV_cmpasociados_EX(pun_comprobante.Id)
        unv_Items_exDAO.obtenerv_Items_EX(pun_comprobante.Id)
        unv_PermisoDestino_exDAO.obtenerv_PermisoDestino_EX(pun_comprobante.Id)

        Log.EscbribirLinea_Log("Solicitando Token")

        If modo_operacion = "Homologacion" Then
            Log.EscbribirLinea_Log("Modo de operacion: 'Homologacion'")
            If Not objAccesoTA.obtenerTicketHomologacion_EX() Then
                Me.error = "no se puede obtener el ticket de acceso"
                Log.EscbribirLinea_Log(objAccesoTA.Error + " " + Me.error)
                Exit Function
            End If
        ElseIf modo_operacion = "Produccion" Then
            Log.EscbribirLinea_Log("Modo de operacion: 'Produccion'")
            If Not objAccesoTA.obtenerTicketProduccion_Ex() Then
                Me.error = "no se puede obtener el ticket de acceso"
                Log.EscbribirLinea_Log(objAccesoTA.Error + " " + Me.error)
                Exit Function
            End If
        End If
        Log.EscbribirLinea_Log("Token " + objAccesoTA.Token.ToString)
        Log.EscbribirLinea_Log("Sign " + objAccesoTA.Sign.ToString)
        Try

            Log.EscbribirLinea_Log("Adaptando Formatos a AFIP")

            ' /*  Adaptar al formato AFIP */
            If modo_operacion = "Homologacion" Then
                AdaptarFormatoAFIPHOMO_EX()
            ElseIf modo_operacion = "Produccion" Then
                AdaptarFormatoAFIPPROD_EX()
            End If

            Log.EscbribirLinea_Log("Estableciendo comunicación con AFIP")
            If modo_operacion = "Homologacion" Then
                objHomoFEXResponseAuthorize = objHomoWSFEX.FEXAuthorize(objHomoFEXAuthRequest, objHomoFEXRequest)
                If Not objHomoFEXResponseAuthorize.FEXResultAuth Is Nothing Then
                    respuesta = objHomoFEXResponseAuthorize.FEXResultAuth.Resultado.ToString()
                End If

            ElseIf modo_operacion = "Produccion" Then
                objProdFEXResponseAuthorize = objProdWSFEX.FEXAuthorize(objProdFEXAuthRequest, objProdFEXRequest)
                If Not objProdFEXResponseAuthorize.FEXResultAuth Is Nothing Then
                    respuesta = objProdFEXResponseAuthorize.FEXResultAuth.Resultado.ToString()
                End If
            End If

        Catch ex As Exception
            Me.error = ex.Message
            If Me.error.Contains("(407)") Then
                objAccesoTA.CargarWebAFIP_WS()
                Me.error += vbCrLf + "Intente nuevamente."
            End If
            Log.EscbribirLinea_Log(ex.Message)
            Exit Function
        End Try


        If respuesta = "R" Or respuesta Is Nothing Then

            If modo_operacion = "Homologacion" Then

                If objHomoFEXResponseAuthorize.FEXErr.ErrCode <> 0 Then
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    Dim objObservaciones As New Observaciones()
                    objObservaciones.Code.valor = objHomoFEXResponseAuthorize.FEXErr.ErrCode
                    objObservaciones.Code.tipo = objHomoFEXResponseAuthorize.FEXErr.ErrCode.GetType
                    objObservaciones.Msg.valor = objHomoFEXResponseAuthorize.FEXErr.ErrMsg
                    objObservaciones.Msg.tipo = objHomoFEXResponseAuthorize.FEXErr.ErrMsg.GetType
                    objObservaciones.idsolicitud = pun_comprobante.Id

                    objObservacionesDAO.insertarObservacion(objObservaciones)
                    Me.error = Me.error + "** " + objObservaciones.Msg.valor + " "
                Else
                    Me.error = "Comprobante rechazado por error desconocido."
                    Log.EscbribirLinea_Log("Comprobante rechazado por error desconocido.")
                End If
                Exit Function
            ElseIf modo_operacion = "Produccion" Then

                If objProdFEXResponseAuthorize.FEXErr.ErrCode <> 0 Then
                    Dim objObservacionesDAO As New ObservacionesDAO()
                    Dim objObservaciones As New Observaciones()
                    objObservaciones.Code.valor = objProdFEXResponseAuthorize.FEXErr.ErrCode
                    objObservaciones.Code.tipo = objProdFEXResponseAuthorize.FEXErr.ErrCode.GetType
                    objObservaciones.Msg.valor = objProdFEXResponseAuthorize.FEXErr.ErrMsg
                    objObservaciones.Msg.tipo = objProdFEXResponseAuthorize.FEXErr.ErrMsg.GetType
                    objObservaciones.idsolicitud = pun_comprobante.Id

                    objObservacionesDAO.insertarObservacion(objObservaciones)
                    Me.error = Me.error + "** " + objObservaciones.Msg.valor + " "
                Else
                    Me.error = "Comprobante rechazado por error desconocido."
                    Log.EscbribirLinea_Log("Comprobante rechazado por error desconocido.")
                End If
                Exit Function
            End If

            If modo_operacion = "Homologacion" Then

                'Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Actualizando datos del comprobante"
                Log.EscbribirLinea_Log("Actualizando datos del comprobante")

                un_comprobante.codaut.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Cae
                un_comprobante.codaut.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Cae.GetType
                un_comprobante.fecha_emision.valor = SQLAdapter.convertiraFecha(objHomoFEXResponseAuthorize.FEXResultAuth.Fch_cbte)
                un_comprobante.fecha_emision.tipo = SQLAdapter.getTipoDate 'objHomoFEXResponseAuthorize.FEXResultAuth.Fch_cbte.GetType
                un_comprobante.fecha_emision.formato = "Corto"
                un_comprobante.nro.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Cbte_nro
                un_comprobante.nro.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Cbte_nro.GetType
                un_comprobante.vtocodaut.valor = SQLAdapter.convertiraFecha(objHomoFEXResponseAuthorize.FEXResultAuth.Fch_venc_Cae)
                un_comprobante.vtocodaut.tipo = SQLAdapter.getTipoDate
                un_comprobante.vtocodaut.formato = "Corto"
                un_comprobante.nro_trans.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Id
                un_comprobante.nro_trans.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Id.GetType
                un_comprobante.idSolicitud.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Id
                un_comprobante.idSolicitud.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Id.GetType
                un_comprobante.ptovta.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Punto_vta
                un_comprobante.ptovta.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Punto_vta.GetType
                un_comprobante.estado_envio.valor = "Error"
                un_comprobante.estado_envio.tipo = SQLAdapter.getTipoString
                un_comprobante.tipo.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Tipo_cbte
                un_comprobante.tipo.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Tipo_cbte.GetType

                'objHomoFEXResponseAuthorize.FEXResultAuth.Reproceso

                If Not un_comprobanteDAO.actualizarComprobante(un_comprobante) Then
                    Me.error = un_comprobanteDAO.error
                End If

                Log.EscbribirLinea_Log(Me.error)

                Exit Function
            ElseIf modo_operacion = "Produccion" Then

                Log.EscbribirLinea_Log("Actualizando datos del comprobante")

                un_comprobante.codaut.valor = objProdFEXResponseAuthorize.FEXResultAuth.Cae
                un_comprobante.codaut.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Cae.GetType
                un_comprobante.fecha_emision.valor = SQLAdapter.convertiraFecha(objProdFEXResponseAuthorize.FEXResultAuth.Fch_cbte)
                un_comprobante.fecha_emision.tipo = SQLAdapter.getTipoDate 'objHomoFEXResponseAuthorize.FEXResultAuth.Fch_cbte.GetType
                un_comprobante.fecha_emision.formato = "Corto"
                un_comprobante.nro.valor = objProdFEXResponseAuthorize.FEXResultAuth.Cbte_nro
                un_comprobante.nro.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Cbte_nro.GetType
                un_comprobante.vtocodaut.valor = SQLAdapter.convertiraFecha(objProdFEXResponseAuthorize.FEXResultAuth.Fch_venc_Cae)
                un_comprobante.vtocodaut.tipo = SQLAdapter.getTipoDate
                un_comprobante.vtocodaut.formato = "Corto"
                un_comprobante.nro_trans.valor = objProdFEXResponseAuthorize.FEXResultAuth.Id
                un_comprobante.nro_trans.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Id.GetType
                un_comprobante.idSolicitud.valor = objProdFEXResponseAuthorize.FEXResultAuth.Id
                un_comprobante.idSolicitud.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Id.GetType
                un_comprobante.ptovta.valor = objProdFEXResponseAuthorize.FEXResultAuth.Punto_vta
                un_comprobante.ptovta.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Punto_vta.GetType
                un_comprobante.estado_envio.valor = "Error"
                un_comprobante.estado_envio.tipo = SQLAdapter.getTipoString
                un_comprobante.tipo.valor = objProdFEXResponseAuthorize.FEXResultAuth.Tipo_cbte
                un_comprobante.tipo.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Tipo_cbte.GetType

                'objHomoFEXResponseAuthorize.FEXResultAuth.Reproceso

                If Not un_comprobanteDAO.actualizarComprobante(un_comprobante) Then
                    Me.error = un_comprobanteDAO.error
                End If

                Log.EscbribirLinea_Log(Me.error)

                Exit Function
            End If
            Exit Function
        Else
            Me.error = ""
        End If 'FIN IF Resupesta = 'R'

        If modo_operacion = "Homologacion" Then

            Log.EscbribirLinea_Log("Actualizando datos del comprobante")
            un_comprobante.codaut.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Cae
            un_comprobante.codaut.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Cae.GetType
            un_comprobante.fecha_emision.valor = SQLAdapter.convertiraFecha(objHomoFEXResponseAuthorize.FEXResultAuth.Fch_cbte)
            un_comprobante.fecha_emision.tipo = SQLAdapter.getTipoDate 'objHomoFEXResponseAuthorize.FEXResultAuth.Fch_cbte.GetType
            un_comprobante.fecha_emision.formato = "Corto"
            un_comprobante.nro.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Cbte_nro
            un_comprobante.nro.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Cbte_nro.GetType
            un_comprobante.vtocodaut.valor = SQLAdapter.convertiraFecha(objHomoFEXResponseAuthorize.FEXResultAuth.Fch_venc_Cae)
            un_comprobante.vtocodaut.tipo = SQLAdapter.getTipoDate
            un_comprobante.vtocodaut.formato = "Corto"
            un_comprobante.nro_trans.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Id
            un_comprobante.nro_trans.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Id.GetType
            un_comprobante.idSolicitud.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Id
            un_comprobante.idSolicitud.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Id.GetType
            un_comprobante.ptovta.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Punto_vta
            un_comprobante.ptovta.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Punto_vta.GetType
            un_comprobante.estado_envio.valor = "Aprobado"
            un_comprobante.estado_envio.tipo = SQLAdapter.getTipoString
            un_comprobante.tipo.valor = objHomoFEXResponseAuthorize.FEXResultAuth.Tipo_cbte
            un_comprobante.tipo.tipo = objHomoFEXResponseAuthorize.FEXResultAuth.Tipo_cbte.GetType
            'objHomoFEXResponseAuthorize.FEXResultAuth.Reproceso
            If Not un_comprobanteDAO.actualizarComprobante(un_comprobante) Then
                Me.error = un_comprobanteDAO.error
                Log.EscbribirLinea_Log(Me.error)
                Exit Function
            End If

        ElseIf modo_operacion = "Produccion" Then

            Log.EscbribirLinea_Log("Actualizando datos del comprobante")
            un_comprobante.codaut.valor = objProdFEXResponseAuthorize.FEXResultAuth.Cae
            un_comprobante.codaut.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Cae.GetType
            un_comprobante.fecha_emision.valor = SQLAdapter.convertiraFecha(objProdFEXResponseAuthorize.FEXResultAuth.Fch_cbte)
            un_comprobante.fecha_emision.tipo = SQLAdapter.getTipoDate 'objProdFEXResponseAuthorize.FEXResultAuth.Fch_cbte.GetType
            un_comprobante.fecha_emision.formato = "Corto"
            un_comprobante.nro.valor = objProdFEXResponseAuthorize.FEXResultAuth.Cbte_nro
            un_comprobante.nro.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Cbte_nro.GetType
            un_comprobante.vtocodaut.valor = SQLAdapter.convertiraFecha(objProdFEXResponseAuthorize.FEXResultAuth.Fch_venc_Cae)
            un_comprobante.vtocodaut.tipo = SQLAdapter.getTipoDate
            un_comprobante.vtocodaut.formato = "Corto"
            un_comprobante.nro_trans.valor = objProdFEXResponseAuthorize.FEXResultAuth.Id
            un_comprobante.nro_trans.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Id.GetType
            un_comprobante.idSolicitud.valor = objProdFEXResponseAuthorize.FEXResultAuth.Id
            un_comprobante.idSolicitud.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Id.GetType
            un_comprobante.ptovta.valor = objProdFEXResponseAuthorize.FEXResultAuth.Punto_vta
            un_comprobante.ptovta.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Punto_vta.GetType
            un_comprobante.estado_envio.valor = "Aprobado"
            un_comprobante.estado_envio.tipo = SQLAdapter.getTipoString
            un_comprobante.tipo.valor = objProdFEXResponseAuthorize.FEXResultAuth.Tipo_cbte
            un_comprobante.tipo.tipo = objProdFEXResponseAuthorize.FEXResultAuth.Tipo_cbte.GetType
            'objProdFEXResponseAuthorize.FEXResultAuth.Reproceso
            If Not un_comprobanteDAO.actualizarComprobante(un_comprobante) Then
                Me.error = un_comprobanteDAO.error
                Log.EscbribirLinea_Log(Me.error)
                Exit Function
            End If
        End If


        'MsgBox("Salimos sin actualizar magma")
        'solicitarCAE_ex = True
        'Exit Function

        'unComprobante_mlDAO.actualizarComprobante()
        Log.EscbribirLinea_Log("Actualizando base de datos local y Magma")
        '/  Actualizamos la base de datos local y magma
        '/  ya existe un SPs para actualizar magma llamado
        '   usar como referencia el sp [fon].[spu_carga_factura_electronica_ml]

        AdmConexiones.BeginTransSQLFE()

        Me.error = ""
        ' llamar a este store procedure 
        If Not un_comprobanteDAO.actualizarDatosFacturaElectronica(un_comprobante) Then 'Mal'

            Me.error = un_comprobanteDAO.error
            Log.EscbribirLinea_Log(Me.error)
            AdmConexiones.RollbackSQL()

        Else
            AdmConexiones.CommitSQLFE()
            Log.EscbribirLinea_Log("Commit Realizado con éxito!!!")
        End If
        'ufn_actualizarDatosFacturaElectronica_v1_3()
        Log.EscbribirLinea_Log("Grabando estado de envío")

        If Me.error = "" Then
            un_comprobante.estado_envio.valor = "Asignado"
            un_comprobanteDAO.actualizacionProvisoria(un_comprobante)
            Log.EscbribirLinea_Log("Comprobante_Asignado")
        Else
            un_comprobante.estado_envio.valor = "No Asignado"
            un_comprobanteDAO.actualizacionProvisoria(un_comprobante)
            solicitarCAE_ex = False
            Log.EscbribirLinea_Log("Comprobante No Asignado")
            Exit Function
        End If

        solicitarCAE_ex = True




    End Function






    ' Obtener Solicitudes a procesar 
    Public Function MostrarSoldesAEnviar() As Boolean
        ' Frm_obtieneCAE.ToolStripStatusLabel7.Text = "Obteniendo solicitudes a procesar"
        Dim una_SolicitudDAO As New SolicitudMLDAO

        MostrarSoldesAEnviar = True
        listaSolicitudesAEnviar.Clear()
        Try

            If Not una_SolicitudDAO.obtenerSolicitudaEnviar() Then
                MostrarSoldesAEnviar = False
                [error] = una_SolicitudDAO.error
                Log.EscbribirLinea_Log(Me.error)
                Exit Function
            End If

            If una_SolicitudDAO.listaSolicitudes.Count = 0 Then
                MostrarSoldesAEnviar = False
                Me.error = "No existen comprobantes para enviar a AFIP."
                Log.EscbribirLinea_Log("No existen comprobantes para enviar a AFIP")
                Exit Function
            End If

            listaSolicitudesAEnviar = una_SolicitudDAO.listaSolicitudes

        Catch ex As Exception
            Throw ex
        End Try

        ' procesamos los comprobantes
        'For Each un_comprobante As Comprobante In un_ComprobateDAO.listaComprobantes '-- Analiza el Array que se cargó en la clase ComprobanteDAO
        'listaComprobantesAEnviar.Add(un_comprobante) '-- Agrega un comprobante más a la lista de comprobantes A ENVIAR.
        'Next

    End Function

    ''' <summary>
    ''' Obtiene solicitudes a procesar
    ''' </summary>
    ''' <returns>True si resultó exitosa la operación</returns>
    ''' <remarks></remarks>
    Public Function MostrarSoldesAEnviarEx() As Boolean

        Dim una_SolicitudEXDAO As New SolicitudEXDAO

        MostrarSoldesAEnviarEx = True
        listaSolicitudesAEnviar.Clear()

        If Not una_SolicitudEXDAO.obtenerSolicitudaEnviar() Then
            MostrarSoldesAEnviarEx = False
            [error] = una_SolicitudEXDAO.error
            Log.EscbribirLinea_Log([error])
            Exit Function
        End If

        If una_SolicitudEXDAO.listaSolicitudes.Count = 0 Then
            MostrarSoldesAEnviarEx = False
            [error] = "No existen comprobantes para enviar a AFIP."
            Log.EscbribirLinea_Log("No existen comprobantes para enviar a AFIP")
            Exit Function
        End If


        listaSolicitudesAEnviar = una_SolicitudEXDAO.listaSolicitudes

    End Function








    ''' <summary>
    ''' Adapta el comprobante al formato de AFIP para Homologación
    ''' </summary>
    ''' <returns>Boolean</returns>
    Private Function AdaptarFormatoAFIPHOMO() As Boolean
        Log.EscbribirLinea_Log("Adaptando formato Afip - Homologacion")
        Dim existeDetalleIVA As Boolean = False
        Dim existeDetalleTributo As Boolean = False
        Dim existeCmpAsociados As Boolean = False


        objHomoFEAuthRequest.Token = objAccesoTA.Token
        objHomoFEAuthRequest.Sign = objAccesoTA.Sign
        objHomoFEAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")

        objHomoWSFE.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFE.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFE.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)

        Try
            objHomoFEUltNroResponse = objHomoWSFE.FECompUltimoAutorizado(objHomoFEAuthRequest, _
                                    unComprobantes_ml.PtoVta.valor, unComprobantes_ml.CbteTipo.valor)
        Catch ex As Exception
            Me.error = ex.Message
        End Try
        
        Log.EscbribirLinea_Log("Último Nro de Comprobante en AFIP (Homo): " + objHomoFEUltNroResponse.CbteNro.ToString)
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
            .ImpTrib = unComprobantes_ml.ImpTrib.valor
            .ImpOpEx = unComprobantes_ml.ImpOpEx.valor
            .ImpIVA = unComprobantes_ml.ImpIVA.valor
            .CbteFch = Format(Now, "yyyyMMdd") ' este es el que vale
            .MonId = unComprobantes_ml.MonId.valor
            .MonCotiz = unComprobantes_ml.MonCotiz.valor

        End With
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
        AdaptarFormatoAFIPHOMO = True
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
        Log.EscbribirLinea_Log("Último Nro de Comprobante en AFIP: " + objProdFEUltNroResponse.CbteNro.ToString)
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
            .ImpTrib = unComprobantes_ml.ImpTrib.valor
            .ImpOpEx = unComprobantes_ml.ImpOpEx.valor
            .ImpIVA = unComprobantes_ml.ImpIVA.valor
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

    ''' <summary>
    ''' Adapta el comprobante al formato de AFIP Exportacion para Homologacion
    ''' </summary>
    ''' <returns>Boolean</returns>
    Private Function AdaptarFormatoAFIPHOMO_EX() As Boolean
        Log.EscbribirLinea_Log("Adaptando formato Afip - Homologacion - EX")

        Dim existeCmpAsociados As Boolean = False
        Dim existeItems As Boolean = False
        Dim existePermisosDestino As Boolean = False

        objHomoFEXAuthRequest.Token = objAccesoTA.Token
        objHomoFEXAuthRequest.Sign = objAccesoTA.Sign
        objHomoFEXAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")

        objHomoWSFEX.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFEX.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
        objHomoWSFEX.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)

        Dim objHomo As New ar.gov.afip.wsfexhomo.ClsFEX_LastCMP

        objHomo.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objHomo.Sign = objAccesoTA.Sign
        objHomo.Token = objAccesoTA.Token
        objHomo.Pto_venta = unv_Comprobantes_ex.Punto_vta.valor
        objHomo.Tipo_cbte = unv_Comprobantes_ex.Tipo_cbte.valor

        Dim response As ar.gov.afip.wsfexhomo.FEXResponseLast_CMP

        response = objHomoWSFEX.FEXGetLast_CMP(objHomo)

        Log.EscbribirLinea_Log("Último Nro de Comprobante de Exportacion en AFIP (Homo): " + objHomoFEUltNroResponse.CbteNro().ToString)

        objHomoFEXRequest.Tipo_cbte = unv_Comprobantes_ex.Tipo_cbte.valor
        objHomoFEXRequest.Punto_vta = unv_Comprobantes_ex.Punto_vta.valor
        objHomoFEXRequest.Cbte_nro = response.FEXResult_LastCMP.Cbte_nro

        With objHomoFEXRequest

            .Cbte_nro = response.FEXResult_LastCMP.Cbte_nro + 1
            .Cliente = unv_Comprobantes_ex.Cliente.valor
            .Cuit_pais_cliente = unv_Comprobantes_ex.Cuit_pais_cliente.valor
            .Domicilio_cliente = unv_Comprobantes_ex.Domicilio_cliente.valor
            .Dst_cmp = unv_Comprobantes_ex.Dst_cmp.valor
            .Fecha_cbte = Format(Now, "yyyyMMdd") ' unv_Comprobantes_ex.Fecha_cbte.valor()
            .Forma_pago = unv_Comprobantes_ex.formaspago.valor
            .Id = unv_Comprobantes_ex.Id.valor
            .Id_impositivo = unv_Comprobantes_ex.ID_impositivo.valor
            .Idioma_cbte = unv_Comprobantes_ex.Idioma_cbte.valor
            .Imp_total = unv_Comprobantes_ex.Imp_total.valor
            .Incoterms = unv_Comprobantes_ex.Incoterms.valor
            .Incoterms_Ds = unv_Comprobantes_ex.Incoterms_Ds.valor
            .Moneda_ctz = unv_Comprobantes_ex.Moneda_Ctz.valor
            .Moneda_Id = unv_Comprobantes_ex.Moneda_ID.valor
            .Obs_comerciales = unv_Comprobantes_ex.Obs_comerciales.valor
            .Permiso_existente = unv_Comprobantes_ex.Permiso_existente.valor
            .Tipo_expo = unv_Comprobantes_ex.Tipo_expo.valor

        End With

        Dim i As Integer = 0
        For Each unv_Items_ex As v_Items_EX In unv_Items_exDAO.listav_Items_EX
            ReDim Preserve ArrayOfv_ItemsHomo(0 To i)
            existeItems = True
            ArrayOfv_ItemsHomo(0 To i) = New ar.gov.afip.wsfexhomo.Item
            ArrayOfv_ItemsHomo(i).Pro_codigo = unv_Items_ex.Pro_codigo.valor
            ArrayOfv_ItemsHomo(i).Pro_ds = unv_Items_ex.Pro_ds.valor
            ArrayOfv_ItemsHomo(i).Pro_precio_uni = unv_Items_ex.Pro_precio_uni.valor
            ArrayOfv_ItemsHomo(i).Pro_qty = unv_Items_ex.Pro_qty.valor
            ArrayOfv_ItemsHomo(i).Pro_total_item = unv_Items_ex.Pro_total_item.valor
            ArrayOfv_ItemsHomo(i).Pro_umed = unv_Items_ex.Pro_umed.valor
            i = i + 1
        Next
        i = 0
        For Each unv_PermisoDestino_ex As v_PermisoDestino_EX In unv_PermisoDestino_exDAO.listav_PermisoDestino_EX
            ReDim Preserve ArrayOfv_PermisosDestinoHomo(0 To i)
            existePermisosDestino = True
            ArrayOfv_PermisosDestinoHomo(0 To i) = New ar.gov.afip.wsfexhomo.Permiso
            ArrayOfv_PermisosDestinoHomo(i).Dst_merc = unv_PermisoDestino_ex.Dst_merc.valor
            ArrayOfv_PermisosDestinoHomo(i).Id_permiso = unv_PermisoDestino_ex.Id_permisos.valor
            i = i + 1
        Next
        i = 0
        For Each unv_cmpasociados_ex As v_cmpasociados_EX In unv_cmpasociados_exDAO.listav_cmpasociados_EX
            ReDim Preserve ArrayOfv_cmpasociados_homo(0 To i)
            existeCmpAsociados = True
            ArrayOfv_cmpasociados_homo(i).Cbte_nro = unv_cmpasociados_ex.Cbte_nro.valor
            ArrayOfv_cmpasociados_homo(i).Cbte_punto_vta = unv_cmpasociados_ex.Cbte_punto_vta.valor
            ArrayOfv_cmpasociados_homo(i).CBte_tipo = unv_cmpasociados_ex.Cbte_tipo.valor
            i = i + 1

        Next
        If existeItems Then
            objHomoFEXRequest.Items = ArrayOfv_ItemsHomo
            Log.EscbribirLinea_Log("Lista de Items creada")
        End If
        If existePermisosDestino Then
            objHomoFEXRequest.Permisos = ArrayOfv_PermisosDestinoHomo
            Log.EscbribirLinea_Log("Lista de PermisosDestino creada")
        End If
        If existeCmpAsociados Then
            objHomoFEXRequest.Cmps_asoc = ArrayOfv_cmpasociados_homo
            Log.EscbribirLinea_Log("Lista de CmpAsociados creada")
        End If


        Log.EscbribirLinea_Log("Adaptacion Homologacion Completa")
        AdaptarFormatoAFIPHOMO_EX = True


    End Function

    Private Function AdaptarFormatoAFIPPROD_EX() As Boolean

        Log.EscbribirLinea_Log("Adaptando formato Afip - Produccion - EX")

        Dim existeCmpAsociados As Boolean = False
        Dim existeItems As Boolean = False
        Dim existePermisosDestino As Boolean = False

        objProdFEXAuthRequest.Token = objAccesoTA.Token
        objProdFEXAuthRequest.Sign = objAccesoTA.Sign
        objProdFEXAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")

        objProdWSFEX.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
        objProdWSFEX.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
        objProdWSFEX.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)
        Dim objProd As New ar.gov.afip.wsfex.ClsFEX_LastCMP
        objProd.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objProd.Sign = objAccesoTA.Sign
        objProd.Token = objAccesoTA.Token
        objProd.Pto_venta = unv_Comprobantes_ex.Punto_vta.valor
        objProd.Tipo_cbte = unv_Comprobantes_ex.Tipo_cbte.valor

        Dim response As ar.gov.afip.wsfex.FEXResponseLast_CMP

        response = objProdWSFEX.FEXGetLast_CMP(objProd)

        Log.EscbribirLinea_Log("Último Nro de Comprobante de Exportacion en AFIP (Prod): " + objProdFEUltNroResponse.CbteNro().ToString)

        objProdFEXRequest.Tipo_cbte = objProd.Tipo_cbte
        objProdFEXRequest.Punto_vta = objProd.Pto_venta
        objProdFEXRequest.Cbte_nro = response.FEXResult_LastCMP.Cbte_nro

        With objProdFEXRequest

            .Cbte_nro = response.FEXResult_LastCMP.Cbte_nro + 1
            .Cliente = unv_Comprobantes_ex.Cliente.valor
            .Cuit_pais_cliente = unv_Comprobantes_ex.Cuit_pais_cliente.valor
            .Domicilio_cliente = unv_Comprobantes_ex.Domicilio_cliente.valor
            .Dst_cmp = unv_Comprobantes_ex.Dst_cmp.valor
            .Fecha_cbte = Format(unv_Comprobantes_ex.Fecha_cbte.valor, "yyyyMMdd") ' unv_Comprobantes_ex.Fecha_cbte.valor()
            .Forma_pago = unv_Comprobantes_ex.formaspago.valor
            .Id = unv_Comprobantes_ex.Id.valor
            .Id_impositivo = unv_Comprobantes_ex.ID_impositivo.valor
            .Idioma_cbte = unv_Comprobantes_ex.Idioma_cbte.valor
            .Imp_total = unv_Comprobantes_ex.Imp_total.valor
            .Incoterms = unv_Comprobantes_ex.Incoterms.valor
            .Incoterms_Ds = unv_Comprobantes_ex.Incoterms_Ds.valor
            .Moneda_ctz = unv_Comprobantes_ex.Moneda_Ctz.valor
            .Moneda_Id = unv_Comprobantes_ex.Moneda_ID.valor
            '.Obs = unv_Comprobantes_ex.Obs.valor ' ojo con el null
            .Obs_comerciales = unv_Comprobantes_ex.Obs_comerciales.valor
            .Permiso_existente = unv_Comprobantes_ex.Permiso_existente.valor
            .Tipo_expo = unv_Comprobantes_ex.Tipo_expo.valor

        End With

        Dim i As Integer = 0
        For Each unv_Items_ex As v_Items_EX In unv_Items_exDAO.listav_Items_EX
            ReDim Preserve ArrayOfv_ItemsProd(0 To i)
            existeItems = True
            ArrayOfv_ItemsProd(0 To i) = New ar.gov.afip.wsfex.Item
            ArrayOfv_ItemsProd(i).Pro_codigo = unv_Items_ex.Pro_codigo.valor
            ArrayOfv_ItemsProd(i).Pro_ds = unv_Items_ex.Pro_ds.valor
            ArrayOfv_ItemsProd(i).Pro_precio_uni = unv_Items_ex.Pro_precio_uni.valor
            ArrayOfv_ItemsProd(i).Pro_qty = unv_Items_ex.Pro_qty.valor
            ArrayOfv_ItemsProd(i).Pro_total_item = unv_Items_ex.Pro_total_item.valor
            ArrayOfv_ItemsProd(i).Pro_umed = unv_Items_ex.Pro_umed.valor

            i = i + 1
        Next
        i = 0
        For Each unv_PermisoDestino_ex As v_PermisoDestino_EX In unv_PermisoDestino_exDAO.listav_PermisoDestino_EX
            ReDim Preserve ArrayOfv_PermisosDestinoProd(0 To i)
            existePermisosDestino = True
            ArrayOfv_PermisosDestinoProd(0 To i) = New ar.gov.afip.wsfex.Permiso
            ArrayOfv_PermisosDestinoProd(i).Dst_merc = unv_PermisoDestino_ex.Dst_merc.valor
            ArrayOfv_PermisosDestinoProd(i).Id_permiso = unv_PermisoDestino_ex.Id_permisos.valor
            i = i + 1
        Next
        i = 0
        For Each unv_cmpasociados_ex As v_cmpasociados_EX In unv_cmpasociados_exDAO.listav_cmpasociados_EX
            ReDim Preserve ArrayOfv_cmpasociados_Prod(0 To i)
            existeCmpAsociados = True
            ArrayOfv_cmpasociados_Prod(i).Cbte_nro = unv_cmpasociados_ex.Cbte_nro.valor
            ArrayOfv_cmpasociados_Prod(i).Cbte_punto_vta = unv_cmpasociados_ex.Cbte_punto_vta.valor
            ArrayOfv_cmpasociados_Prod(i).CBte_tipo = unv_cmpasociados_ex.Cbte_tipo.valor
            i = i + 1

        Next
        If existeItems Then
            objProdFEXRequest.Items = ArrayOfv_ItemsProd
            Log.EscbribirLinea_Log("Lista de Items creada")
        End If
        If existePermisosDestino Then
            objProdFEXRequest.Permisos = ArrayOfv_PermisosDestinoProd
            Log.EscbribirLinea_Log("Lista de PermisosDestino creada")
        End If
        If existeCmpAsociados Then
            objProdFEXRequest.Cmps_asoc = ArrayOfv_cmpasociados_Prod
            Log.EscbribirLinea_Log("Lista de CmpAsociados creada")
        End If


        Log.EscbribirLinea_Log("Adaptacion Prodlogacion Completa")
        AdaptarFormatoAFIPPROD_EX = True


    End Function





    Public Function BuscarComprobantesPRODAfip_ML(ByVal punComprobante As Comprobantes_ml) As Boolean

        BuscarComprobantesPRODAfip_ML = False

        Dim ptoVta As String = punComprobante.PtoVta.ToString
        Dim req As New ar.gov.afip.wsfe_v1.FECompConsultaReq

        If Not objAccesoTA.obtenerTicketProduccion() Then
            Me.error = objAccesoTA.Error
            Exit Function
        End If

        objProdFEAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objProdFEAuthRequest.Sign = objAccesoTA.Sign
        objProdFEAuthRequest.Token = objAccesoTA.Token

        If punComprobante.PtoVta.valor = 0 Then
            'Valor Predeterminado Punto de Venta 
            req.PtoVta = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_ML"), Integer)
        Else
            req.PtoVta = punComprobante.PtoVta.valor
        End If

        If punComprobante.CbteTipo.valor = 0 Then
            'Valor Predeterminado "FACTURA A"
            req.CbteTipo = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_ML"), Integer)
        Else
            req.CbteTipo = punComprobante.CbteTipo.valor
        End If

        If punComprobante.CAE.valor = 0 Then
            'Obtiene el ultimo CAE desde AFIP
            objProdFEUltNroResponse = objProdWSFE.FECompUltimoAutorizado(objProdFEAuthRequest, req.PtoVta, req.CbteTipo)
            req.CbteNro = objProdFEUltNroResponse.CbteNro
        Else
            req.CbteNro = punComprobante.CAE.valor
        End If

        Try
            Dim objProdFECompConsultarRequestBody As New ar.gov.afip.wsfe_v1.FECompConsultarRequestBody(objProdFEAuthRequest, req)
            Dim objProdFECompConsultarRequest As New ar.gov.afip.wsfe_v1.FECompConsultarRequest(objProdFECompConsultarRequestBody)
            objProdFECompConsultarResponse = objProdWSFE.ar_gov_afip_wsfe_v1_ServiceSoap_FECompConsultar(objProdFECompConsultarRequest)
        Catch ex As Exception
            Me.error = ex.Message
            If ex.InnerException().ToString.Contains("(407)") Then
                objAccesoTA.CargarWebAFIP_WS()
                Me.error += vbCrLf + "Intente nuevamente."
            End If
            Log.EscbribirLinea_Log(Me.error)
            Exit Function
        End Try


        BuscarComprobantesPRODAfip_ML = True
    End Function

    Public Function BuscarComprobantesHOMOAfip_ML(ByVal punComprobante As Comprobantes_ml) As Boolean
        BuscarComprobantesHOMOAfip_ML = False

        Dim ptoVta As String = punComprobante.PtoVta.ToString
        Dim req As New ar.gov.afip.wshomofev1.FECompConsultaReq

        If Not objAccesoTA.obtenerTicketHomologacion() Then
            Me.error = objAccesoTA.Error
            Exit Function
        End If

        objHomoFEAuthRequest.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objHomoFEAuthRequest.Sign = objAccesoTA.Sign
        objHomoFEAuthRequest.Token = objAccesoTA.Token

        If punComprobante.PtoVta.valor = 0 Then
            'Valor Predeterminado Punto de Venta 27
            req.PtoVta = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_ML"), Integer)
        Else
            req.PtoVta = punComprobante.PtoVta.valor
        End If

        If punComprobante.CbteTipo.valor = 0 Then
            'Valor Predeterminado "FACTURA A" = 1
            req.CbteTipo = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_ML"), Integer)
        Else
            req.CbteTipo = punComprobante.CbteTipo.valor
        End If

        Try
            If punComprobante.CAE.valor = 0 Then
                'Obtiene el ultimo CAE desde AFIP
                objHomoFEUltNroResponse = objHomoWSFE.FECompUltimoAutorizado(objHomoFEAuthRequest, req.PtoVta, req.CbteTipo)
                req.CbteNro = objHomoFEUltNroResponse.CbteNro
            Else
                req.CbteNro = punComprobante.CAE.valor
            End If

            Dim objHomoFECompConsultarRequestBody As New ar.gov.afip.wshomofev1.FECompConsultarRequestBody(objHomoFEAuthRequest, req)
            Dim objHomoFECompConsultarRequest As New ar.gov.afip.wshomofev1.FECompConsultarRequest(objHomoFECompConsultarRequestBody)
            objHomoFECompConsultarResponse = objHomoWSFE.ar_gov_afip_wshomofev1_ServiceSoap_FECompConsultar(objHomoFECompConsultarRequest)

        Catch ex As Exception
            Me.error = ex.Message
            If ex.InnerException().ToString.Contains("(407)") Then
                objAccesoTA.CargarWebAFIP_WS()
                Me.error += vbCrLf + "Intente nuevamente."
            End If
            Log.EscbribirLinea_Log(Me.error)
            Exit Function
        End Try


        BuscarComprobantesHOMOAfip_ML = True
    End Function

    Public Function BuscarComprobantesHOMOAfip_EX(ByVal punComprobante As Comprobante) As Boolean

        BuscarComprobantesHOMOAfip_EX = False


        Dim ptoVta As String = punComprobante.ptovta.ToString

        'Dim req As New ar.gov.afip.wshomofev1.FECompConsultaReq
        Dim objClsFEX_LastCMP As New ar.gov.afip.wsfexhomo.ClsFEX_LastCMP
        Dim objClsFEX_LastCMP_Response As New ar.gov.afip.wsfexhomo.ClsFEX_LastCMP_Response

        If Not objAccesoTA.obtenerTicketHomologacion_EX() Then
            Me.error = objAccesoTA.Error
            Exit Function
        End If

        objClsFEX_LastCMP.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objClsFEX_LastCMP.Sign = objAccesoTA.Sign
        objClsFEX_LastCMP.Token = objAccesoTA.Token


        If punComprobante.PtoVta.valor = 0 Then
            objClsFEX_LastCMP.Pto_venta = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_EX"), Integer)
        Else
            objClsFEX_LastCMP.Pto_venta = punComprobante.ptovta.valor
        End If

        If punComprobante.tipo.valor = 0 Then
            objClsFEX_LastCMP.Tipo_cbte = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_EX"), Integer)
        Else
            objClsFEX_LastCMP.Tipo_cbte = punComprobante.tipo.valor
        End If

        Try

            Dim objClsFEXGetCMP As New ar.gov.afip.wsfexhomo.ClsFEXGetCMP

            If punComprobante.nro.valor = 0 Then
                objHomoFEXResponseLast_CMP = objHomoWSFEX.FEXGetLast_CMP(objClsFEX_LastCMP)
                objClsFEXGetCMP.Cbte_nro = objHomoFEXResponseLast_CMP.FEXResult_LastCMP.Cbte_nro
            Else
                objClsFEXGetCMP.Cbte_nro = punComprobante.nro.valor
            End If

            objClsFEXGetCMP.Punto_vta = objClsFEX_LastCMP.Pto_venta
            objClsFEXGetCMP.Tipo_cbte = objClsFEX_LastCMP.Tipo_cbte

            objHomoFEXAuthRequest.Cuit = objClsFEX_LastCMP.Cuit
            objHomoFEXAuthRequest.Sign = objClsFEX_LastCMP.Sign
            objHomoFEXAuthRequest.Token = objClsFEX_LastCMP.Token

            objHomoFEXGetCMPResponse = objHomoWSFEX.FEXGetCMP(objHomoFEXAuthRequest, objClsFEXGetCMP)



        Catch ex As Exception
            Me.error = ex.Message
            If ex.Message().ToString.Contains("(407)") Then
                objAccesoTA.CargarWebAFIP_WS()
                Me.error += vbCrLf + "Intente nuevamente."
            End If
            Log.EscbribirLinea_Log(Me.error)
            Exit Function
        End Try


        BuscarComprobantesHOMOAfip_EX = True
    End Function

    Public Function BuscarComprobantesPRODAfip_EX(ByVal punComprobante As Comprobante) As Boolean
        BuscarComprobantesPRODAfip_EX = False

        Dim ptoVta As String = punComprobante.ptovta.ToString


        If Not objAccesoTA.obtenerTicketProduccion_Ex() Then
            Me.error = objAccesoTA.Error
            Exit Function
        End If


        objProdClsFEX_LastCMP.Cuit = Configuration.ConfigurationManager.AppSettings("CUIT_FONSECA")
        objProdClsFEX_LastCMP.Sign = objAccesoTA.Sign
        objProdClsFEX_LastCMP.Token = objAccesoTA.Token


        If punComprobante.ptovta.valor = 0 Then
            objProdClsFEX_LastCMP.Pto_venta = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_EX"), Integer)
        Else
            objProdClsFEX_LastCMP.Pto_venta = punComprobante.ptovta.valor
        End If

        If punComprobante.tipo.valor = 0 Then
            objProdClsFEX_LastCMP.Tipo_cbte = CType(Configuration.ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_EX"), Integer)
        Else
            objProdClsFEX_LastCMP.Tipo_cbte = punComprobante.tipo.valor
        End If
        Dim objClsFEXGetCMP As New ar.gov.afip.wsfex.ClsFEXGetCMP
        Try
            If punComprobante.codaut.valor = 0 Then
                objProdFEXResponseLast_CMP = objProdWSFEX.FEXGetLast_CMP(objProdClsFEX_LastCMP)
                objClsFEXGetCMP.Cbte_nro = objProdFEXResponseLast_CMP.FEXResult_LastCMP.Cbte_nro
            Else
                objClsFEXGetCMP.Cbte_nro = punComprobante.nro.valor
            End If

            objClsFEXGetCMP.Cbte_nro = objProdFEXResponseLast_CMP.FEXResult_LastCMP.Cbte_nro
            objClsFEXGetCMP.Punto_vta = objProdClsFEX_LastCMP.Pto_venta
            objClsFEXGetCMP.Tipo_cbte = objProdClsFEX_LastCMP.Tipo_cbte

            objProdFEXAuthRequest.Cuit = objProdClsFEX_LastCMP.Cuit
            objProdFEXAuthRequest.Sign = objProdClsFEX_LastCMP.Sign
            objProdFEXAuthRequest.Token = objProdClsFEX_LastCMP.Token

            objProdFEXGetCMPResponse = objProdWSFEX.FEXGetCMP(objProdFEXAuthRequest, objClsFEXGetCMP)

        Catch ex As Exception
            Me.error = ex.Message
            If ex.InnerException().ToString.Contains("(407)") Then
                objAccesoTA.CargarWebAFIP_WS()
                Me.error += vbCrLf + "Intente nuevamente."
            End If
            Log.EscbribirLinea_Log(Me.error)
            Exit Function
        End Try

        BuscarComprobantesPRODAfip_EX = True
    End Function
End Class
