Imports System.Threading
Imports fonseca_libDatos
Imports DAOFacturacionElectronica
Imports System.Xml
Imports System.Text
Imports System.Security.Cryptography.X509Certificates

Class AccesoAFIP_ML_HOMO
    Inherits AccesoAFIP

    Public Function ObtenerTicket(ByVal pDnSource As String, ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, _
                               ByVal pNombreCertificado As String, ByVal pDireccion As String, _
                               ByVal pMilisegundos As Integer, ByVal pRutaPathXML As String, ByVal pVerboseMode As Boolean) As Ticket
        Try
            Dim objTicketRespuesta As New Ticket

            Dim objGestionXML As New GestionXML()

            'Valida que exista un archivo XML para recuperar la firma.
            If objGestionXML.ValidarExistenciaXML(pRutaPathXML) Then _
                objTicketRespuesta = objGestionXML.ObtenerObjetoDesdeXML(pRutaPathXML, objTicketRespuesta.GetType)

            If objTicketRespuesta IsNot Nothing AndAlso TypeOf objTicketRespuesta Is Ticket Then Return objTicketRespuesta

            'Si el objeto obtenido es nada entonces intentamos obtenerlo desde AFIP
            'Primero cargamos una pagina web con la direccion para que quede en caché.
            CargarWeb(pDireccion, pMilisegundos)

            If pVerboseMode Then
                Log.Logger(tipoLogging.Info, "***DN origen: " + pDnSource)
                Log.Logger(tipoLogging.Info, "***Servicio a acceder: " + pIdServicioNegocio)
                Log.Logger(tipoLogging.Info, "***DN destino: " + pDnDestination)
            End If

            objTicketRespuesta = ObtenerLoginTicketResponse(pDnSource, pIdServicioNegocio, pDnDestination, pNombreCertificado, pVerboseMode)

            Log.Logger(tipoLogging.Info, "Guardando objeto " + pRutaPathXML)

            If Not objGestionXML.GuardarObjetoXML(objTicketRespuesta, pRutaPathXML) Then Throw New Exception(objGestionXML.Error)

            Log.Logger(tipoLogging.Info, "Token y Firma obtenidos correctamente - WS")

            Return objTicketRespuesta

        Catch ex As Exception
            Throw New Exception("No se puede obtener el ticket de acceso." + vbCrLf + "Error Extendido: " + ex.Message)
        End Try
    End Function


    Private Function ObtenerLoginTicketResponse(ByVal pDnSource As String, ByVal pIdServicioNegocio As String, _
                                              ByRef pDnDestination As String, ByVal pNombreCertificado As String, ByVal pVerboseMode As Boolean) As Ticket
        Try
            Dim objLoginTicketRequest As XmlDocument
            Dim objCmsFirmadoBase64 As String
            Dim loginTicketResponse As String

            ' PASO 1: Genero el Login Ticket Request
            Log.Logger(tipoLogging.Info, "Generando el Login Ticket Request")

            objLoginTicketRequest = GenerarLoginTicketRequest(pDnSource, pIdServicioNegocio, pDnDestination)

            ' PASO 2: Firmo el Login Ticket Request
            Log.Logger(tipoLogging.Info, "Firmando el Login Ticket Request")
            objCmsFirmadoBase64 = FirmarLoginTicketRequest(pDnSource, pNombreCertificado, objLoginTicketRequest)

            ' PASO 3: Invoco al WSAA para obtener el Login Ticket Response
            Log.Logger(tipoLogging.Info, "Invocando al WSAA para obtener el Login Ticket Response")
            loginTicketResponse = ObtenerLoginTicketResponse(objCmsFirmadoBase64)

            ' PASO 4: Analizo el Login Ticket Response recibido del WSAA
            Log.Logger(tipoLogging.Info, "Analizando el Ticket Response recibido del WSAA")
            Return LoginTicketResponseToTicket(loginTicketResponse)

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Private Function ObtenerLoginTicketResponse(pCmsFirmadoBase64 As String) As String
        Try
            Dim ObjWSAA As New ar.gov.afip.wsaahomo.LoginCMSClient


            ObjWSAA.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
            ObjWSAA.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
            ObjWSAA.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)

            Return ObjWSAA.loginCms(pCmsFirmadoBase64)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Adapta el comprobante al formato de AFIP para Producción
    ''' </summary>
    ''' <returns>Boolean</returns>
    Private Function AdaptarFormatoAFIP(ByVal pObjProdFECAECabeceraRequest As ar.gov.afip.wshomofev1.FECAECabRequest, _
                                        ByVal pObjProdFEDetalleRequest As ar.gov.afip.wshomofev1.FECAEDetRequest, _
                                        ByVal pObjComprobanteFE As comprobantes_ml_Screen) As Boolean
        AdaptarFormatoAFIP = False
        Try

            'System.Diagnostics.Log.EscbribirLinea_Log("Adaptando formato Afip - Producción")
            Dim existeDetalleIVA As Boolean = False
            Dim existeDetalleTributo As Boolean = False
            Dim existeCmpAsociados As Boolean = False

            Dim ArrayOfTributosProd(0) As ar.gov.afip.wshomofev1.Tributo
            Dim ArrayOfIvaProd(0) As ar.gov.afip.wshomofev1.AlicIva
            Dim ArrayOfcbtesasocProd(0) As ar.gov.afip.wshomofev1.CbteAsoc
            Dim ArrayOfFEDetalleRequestProd(0) As ar.gov.afip.wshomofev1.FECAEDetRequest
            Dim objProdFECAERequest As New ar.gov.afip.wshomofev1.FECAERequest


            ' /* modificar en Produccion ver tema indices y creaciobn inicial del objeto en la matriz */
            Dim i As Integer = 0
            For Each item As Detalle_tributos In pObjComprobanteFE.DetalleTributos
                existeDetalleTributo = True
                ReDim Preserve ArrayOfTributosProd(0 To i)
                ArrayOfTributosProd(i) = New ar.gov.afip.wshomofev1.Tributo()
                ArrayOfTributosProd(i).Alic = CDbl(item.alic.ToString)
                ArrayOfTributosProd(i).BaseImp = CDbl(item.baseImp.ToString)
                ArrayOfTributosProd(i).Desc = item.descripcion.ToString
                ArrayOfTributosProd(i).Id = CInt(item.Id.ToString)
                ArrayOfTributosProd(i).Importe = CDbl(item.importe.ToString)
                i = i + 1
            Next

            i = 0
            For Each item As Detalle_iva In pObjComprobanteFE.DetalleIVA
                existeDetalleIVA = True
                ReDim Preserve ArrayOfIvaProd(0 To i)
                ArrayOfIvaProd(i) = New ar.gov.afip.wshomofev1.AlicIva()
                ArrayOfIvaProd(i).BaseImp = item.baseImp.Valor
                ArrayOfIvaProd(i).Id = item.Id.Valor
                ArrayOfIvaProd(i).Importe = item.importe.Valor
                i = i + 1
            Next

            i = 0
            For Each item As CbtesAsoc In pObjComprobanteFE.CbtesAsociados
                existeCmpAsociados = True
                ReDim Preserve ArrayOfcbtesasocProd(0 To i)
                ArrayOfcbtesasocProd(i) = New ar.gov.afip.wshomofev1.CbteAsoc
                ArrayOfcbtesasocProd(i).Nro = item.Nro.Valor
                ArrayOfcbtesasocProd(i).PtoVta = item.PtoVta.Valor
                ArrayOfcbtesasocProd(i).Tipo = item.Tipo.Valor
            Next

            If existeDetalleIVA Then
                pObjProdFEDetalleRequest.Iva = ArrayOfIvaProd
                'System.Diagnostics.Log.EscbribirLinea_Log("Lista de Detalle_IVA creada")
            End If
            If existeDetalleTributo Then
                pObjProdFEDetalleRequest.Tributos = ArrayOfTributosProd
                'System.Diagnostics.Log.EscbribirLinea_Log("Lista de Detalle_tributo creada")
            End If
            If existeCmpAsociados Then
                pObjProdFEDetalleRequest.CbtesAsoc = ArrayOfcbtesasocProd
                'System.Diagnostics.Log.EscbribirLinea_Log("Lista de Comprobantes_Asoc creada")
            End If

            objProdFECAERequest.FeCabReq = pObjProdFECAECabeceraRequest
            ArrayOfFEDetalleRequestProd(0) = pObjProdFEDetalleRequest
            objProdFECAERequest.FeDetReq = ArrayOfFEDetalleRequestProd
            'System.Diagnostics.Log.EscbribirLinea_Log("Adaptación Produccion Completa")

            _objetoObtenido = objProdFECAERequest

            AdaptarFormatoAFIP = True

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerRespuestaAFIP(ByVal pObjComprobantesFE As comprobantes_ml_Screen, ByVal pObjTicket As Ticket, ByVal pCuitEmpresa As String) As ar.gov.afip.wshomofev1.FECAEResponse
        Try
            Dim cbteNro As Integer
            Dim objProdFEAuthRequest As New ar.gov.afip.wshomofev1.FEAuthRequest
            Dim objProdWSFE As New ar.gov.afip.wshomofev1.ServiceSoapClient
            Dim objProdFEUltNroResponse As New ar.gov.afip.wshomofev1.FERecuperaLastCbteResponse
            Dim objProdFECAEResponse As New ar.gov.afip.wshomofev1.FECAEResponse
            Dim objProdFECAECabeceraRequest As New ar.gov.afip.wshomofev1.FECAECabRequest
            Dim objProdFEDetalleRequest As ar.gov.afip.wshomofev1.FECAEDetRequest
            Dim objProdFECAERequest As New ar.gov.afip.wshomofev1.FECAERequest

            objProdFEAuthRequest.Token = pObjTicket.Token
            objProdFEAuthRequest.Sign = pObjTicket.Sign
            objProdFEAuthRequest.Cuit = pCuitEmpresa

            objProdWSFE.Endpoint.Binding.SendTimeout = New TimeSpan(0, 1, 60)
            objProdWSFE.Endpoint.Binding.ReceiveTimeout = New TimeSpan(0, 1, 60)
            objProdWSFE.Endpoint.Binding.OpenTimeout = New TimeSpan(0, 1, 60)


            'System.Diagnostics.Log.EscbribirLinea_Log("Último Nro de Comprobante en AFIP: " + objProdFEUltNroResponse.CbteNro.ToString)
            objProdFECAECabeceraRequest.CbteTipo = CInt(pObjComprobantesFE.CbteTipo.ToString)
            objProdFECAECabeceraRequest.CantReg = 1
            objProdFECAECabeceraRequest.PtoVta = CInt(pObjComprobantesFE.PtoVta.ToString)

            objProdFEUltNroResponse = objProdWSFE.FECompUltimoAutorizado(objProdFEAuthRequest, CInt(pObjComprobantesFE.PtoVta.ToString), _
                                                                         CInt(pObjComprobantesFE.CbteTipo.ToString))

            cbteNro = objProdFEUltNroResponse.CbteNro + 1

            objProdFEDetalleRequest = CrearDetalleRequest_desde_ComprobanteFE(pObjComprobantesFE, cbteNro, cbteNro)

            If Not AdaptarFormatoAFIP(objProdFECAECabeceraRequest, objProdFEDetalleRequest, pObjComprobantesFE) Then
                Throw New Exception(Me._error)
            End If

            objProdFECAERequest = CType(_objetoObtenido, ar.gov.afip.wshomofev1.FECAERequest)

            objProdFECAEResponse = objProdWSFE.FECAESolicitar(objProdFEAuthRequest, objProdFECAERequest)

            Return objProdFECAEResponse

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function BuscarComprobantesAFIP(ByVal pObjTicket As Ticket, ByVal pCuitEmpresa As String, ByVal pPtoVta As Integer, _
                                                  ByVal pCbteTipo As Integer, ByVal pCbteNro As Integer) As comprobantes_ml_Screen

        Try
            Dim mensaje As String = String.Empty
            Dim objProdWSFE As New ar.gov.afip.wshomofev1.ServiceSoapClient
            Dim objProdFECompConsultarResponse As New ar.gov.afip.wshomofev1.FECompConsultarResponse()
            Dim objProdFEAuthRequest As New ar.gov.afip.wshomofev1.FEAuthRequest

            Dim ptoVta As String = pPtoVta

            Dim req As New ar.gov.afip.wshomofev1.FECompConsultaReq

            objProdFEAuthRequest.Token = pObjTicket.Token
            objProdFEAuthRequest.Sign = pObjTicket.Sign
            objProdFEAuthRequest.Cuit = pCuitEmpresa

            req.PtoVta = ptoVta
            req.CbteTipo = pCbteTipo
            req.CbteNro = pCbteNro

            Dim objProdFECompConsultarRequestBody As New ar.gov.afip.wshomofev1.FECompConsultarRequestBody(objProdFEAuthRequest, req)
            Dim objProdFECompConsultarRequest As New ar.gov.afip.wshomofev1.FECompConsultarRequest(objProdFECompConsultarRequestBody)
            objProdFECompConsultarResponse = objProdWSFE.ar_gov_afip_wshomofev1_ServiceSoap_FECompConsultar(objProdFECompConsultarRequest)

            'Analizamos si se obtuvo una respuesta desde el webservice
            If objProdFECompConsultarResponse.Body.FECompConsultarResult.ResultGet Is Nothing Then
                mensaje = "No se obtuvieron datos de AFIP."
                'Analizamos si existe un error y creamos un objeto de observacion.
                If objProdFECompConsultarResponse.Body.FECompConsultarResult.Errors IsNot Nothing Then _
                    Throw New ObjectResultException(mensaje, CrearObjetoObservacion(objProdFECompConsultarResponse.Body.FECompConsultarResult.Errors(0)))
            End If

            Return CrearObjetoComprobanteFE_Desde_ResultGet(objProdFECompConsultarResponse)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearObjetoObservacion(a As ar.gov.afip.wshomofev1.Err) As Observaciones
        Try
            Dim objObser As New Observaciones

            objObser.code = a.Code.ToString
            objObser.msg = a.Msg.ToString

            Return objObser

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Private Function CrearObjetoComprobanteFE_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As comprobantes_ml_Screen
        Try
            Dim objComprobanteFE As New comprobantes_ml_Screen()

            objComprobanteFE = CrearComprobanteML_Desde_ResultGet(pResult)

            objComprobanteFE.CbtesAsociados = CrearListaCbtesAsoc_Desde_ResultGet(pResult)
            objComprobanteFE.DetalleTributos = CrearListaDetalle_tributos_Desde_ResultGet(pResult)
            objComprobanteFE.DetalleIVA = CrearListaDetalles_iva_Desde_ResultGet(pResult)
            objComprobanteFE.Observaciones = CrearListaObservaciones_Desde_ResultGet(pResult)

            Return objComprobanteFE

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearListaDetalles_iva_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As List(Of detalle_iva)
        Try

            Dim objDetalle_iva As New Detalle_iva
            Dim objListaDetalles As New List(Of Detalle_iva)

            With pResult.Body.FECompConsultarResult.ResultGet
                If .Iva Is Nothing Then
                    Return objListaDetalles
                End If

                For Each elemento As ar.gov.afip.wshomofev1.AlicIva In .Iva
                    objDetalle_iva = New Detalle_iva

                    objDetalle_iva.baseImp = elemento.BaseImp
                    objDetalle_iva.importe = elemento.Importe
                    objDetalle_iva.Id = elemento.Id

                    objListaDetalles.Add(objDetalle_iva)
                Next
            End With

            Return objListaDetalles

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearListaDetalle_tributos_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As List(Of detalle_tributos)
        Try

            Dim objDetalle_tributos As New Detalle_tributos
            Dim objListaDetalles As New List(Of Detalle_tributos)

            With pResult.Body.FECompConsultarResult.ResultGet
                If .Tributos Is Nothing Then
                    Return objListaDetalles
                End If

                For Each elemento As ar.gov.afip.wshomofev1.Tributo In .Tributos
                    objDetalle_tributos = New Detalle_tributos

                    objDetalle_tributos.alic = elemento.Alic
                    objDetalle_tributos.baseImp = elemento.BaseImp
                    objDetalle_tributos.importe = elemento.Importe
                    objDetalle_tributos.Id = elemento.Id
                    objDetalle_tributos.descripcion = elemento.Desc

                    objListaDetalles.Add(objDetalle_tributos)
                Next
            End With

            Return objListaDetalles

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearListaCbtesAsoc_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As List(Of cbtesasoc)
        Try

            Dim objCbtesAsoc As New CbtesAsoc
            Dim objListaDetalles As New List(Of CbtesAsoc)

            With pResult.Body.FECompConsultarResult.ResultGet
                If .CbtesAsoc Is Nothing Then
                    Return objListaDetalles
                End If

                For Each elemento As ar.gov.afip.wshomofev1.CbteAsoc In .CbtesAsoc
                    objCbtesAsoc = New CbtesAsoc

                    objCbtesAsoc.Nro = elemento.Nro
                    objCbtesAsoc.PtoVta = elemento.PtoVta
                    objCbtesAsoc.Tipo = elemento.Tipo

                    objListaDetalles.Add(objCbtesAsoc)
                Next
            End With

            Return objListaDetalles

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearListaObservaciones_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As List(Of observaciones)
        Try

            Dim objObservaciones As New Observaciones
            Dim objListaDetalles As New List(Of Observaciones)

            With pResult.Body.FECompConsultarResult.ResultGet
                If .Observaciones Is Nothing Then
                    Return objListaDetalles
                End If

                For Each elemento As ar.gov.afip.wshomofev1.Obs In .Observaciones
                    objObservaciones = New Observaciones

                    objObservaciones.code = elemento.Code
                    objObservaciones.msg = elemento.Msg

                    objListaDetalles.Add(objObservaciones)
                Next
            End With

            Return objListaDetalles

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearComprobanteML_Desde_ResultGet(pResult As ar.gov.afip.wshomofev1.FECompConsultarResponse) As comprobantes_ml_Screen
        Try
            Dim objCbteFE As New comprobantes_ml_Screen

            With pResult.Body.FECompConsultarResult.ResultGet

                objCbteFE.CbteDesde = .CbteDesde
                objCbteFE.CbteHasta = .CbteHasta
                objCbteFE.CAEFchVto = .FchVto
                objCbteFE.CbteFch = .CbteFch
                objCbteFE.CbteTipo = .CbteTipo
                objCbteFE.Concepto = .Concepto
                objCbteFE.DocNro = .DocNro
                objCbteFE.nro_doc_afip = .DocNro
                objCbteFE.DocTipo = .DocTipo
                objCbteFE.FchServDesde = .FchServDesde
                objCbteFE.FchServHasta = .FchServHasta
                objCbteFE.FchVtoPago = .FchVtoPago
                objCbteFE.ImpIVA = .ImpIVA
                objCbteFE.ImpNeto = .ImpNeto
                objCbteFE.ImpOpEx = .ImpOpEx
                objCbteFE.ImpTotal = .ImpTotal
                objCbteFE.ImpTotConc = .ImpTotConc
                objCbteFE.ImpTrib = .ImpTrib
                objCbteFE.MonCotiz = .MonCotiz
                objCbteFE.MonId = .MonId
                objCbteFE.PtoVta = .PtoVta
                objCbteFE.CAE = .CodAutorizacion
                objCbteFE.Resultado = .Resultado
                objCbteFE.EmisionTipo = .EmisionTipo
                objCbteFE.FchProceso = .FchProceso
            End With

            Return objCbteFE

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerUltimoNroCbteAutorizado(ByVal pObjTicket As Ticket, ByVal pCuitEmpresa As String, ByVal pPtoVta As Integer, ByVal pCbteTipo As Integer) As Integer
        Try
            Dim objProdWSFE As New ar.gov.afip.wshomofev1.ServiceSoapClient
            Dim objProdFEAuthRequest As New ar.gov.afip.wshomofev1.FEAuthRequest
            Dim objProdFEUltNroResponse As New ar.gov.afip.wshomofev1.FERecuperaLastCbteResponse
            Dim cbteNro As Integer = 0

            objProdFEAuthRequest.Token = pObjTicket.Token
            objProdFEAuthRequest.Sign = pObjTicket.Sign
            objProdFEAuthRequest.Cuit = pCuitEmpresa

            objProdFEUltNroResponse = objProdWSFE.FECompUltimoAutorizado(objProdFEAuthRequest, pPtoVta, pCbteTipo)

            cbteNro = objProdFEUltNroResponse.CbteNro

            Return cbteNro

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function CrearDetalleRequest_desde_ComprobanteFE(pObjComprobanteFE As comprobantes_ml_Screen, pCbteDesde As Integer, pCbteHasta As Integer) As ar.gov.afip.wshomofev1.FECAEDetRequest
        Try
            Dim objDetalleRequest As New ar.gov.afip.wshomofev1.FECAEDetRequest

            With objDetalleRequest

                .Concepto = pObjComprobanteFE.Concepto.Valor  '1 ' Productos 
                .DocTipo = pObjComprobanteFE.DocTipo.Valor
                .DocNro = pObjComprobanteFE.DocNro.Valor
                .CbteDesde = pCbteDesde
                .CbteHasta = pCbteHasta
                .ImpTotal = pObjComprobanteFE.ImpTotal.Valor
                .ImpTotConc = pObjComprobanteFE.ImpTotConc.Valor
                .ImpNeto = pObjComprobanteFE.ImpNeto.Valor
                .ImpTrib = pObjComprobanteFE.ImpTrib.Valor
                .ImpOpEx = pObjComprobanteFE.ImpOpEx.Valor
                .ImpIVA = pObjComprobanteFE.ImpIVA.Valor
                .CbteFch = Format(pObjComprobanteFE.CbteFch.Valor, "yyyyMMdd")
                .MonId = pObjComprobanteFE.MonId.Valor
                .MonCotiz = pObjComprobanteFE.MonCotiz.Valor

            End With

            Return objDetalleRequest

        Catch ex As Exception
            Throw ex
        End Try
    End Function

End Class