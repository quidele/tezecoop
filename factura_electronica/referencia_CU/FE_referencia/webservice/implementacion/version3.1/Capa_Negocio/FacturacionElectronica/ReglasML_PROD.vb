Imports fonseca_libDatos
Imports DAOFacturacionElectronica

Public Class ReglasML_PROD
    Inherits ReglasGeneralesFE
    Implements IReglasFE

    Public Overloads ReadOnly Property [Error] As String Implements IReglasFE.Error
        Get
            Return MyBase.Error
        End Get
    End Property


 



    Private Sub CompletarComprobanteConResponse(ByRef pObjComprobante As comprobantes_ml_Screen, ByRef pObjRespuesta As ar.gov.afip.wsfe_v1.FECAEResponse, ByVal pEstadoEnvio As String)
        Try
            MyBase.CompletarComprobanteConResponseML_PROD(pObjComprobante, pObjRespuesta, pEstadoEnvio)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Overloads Function InsertarComprobantes(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean Implements IReglasFE.InsertarComprobantes
        Return MyBase.InsertarComprobantes(pIdSolicitud, pObjConexion)
    End Function

    Private Function ObtenerComprobanteFE(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As comprobantes_ml_Screen
        Try
            Me.Clear()

            Dim objComprobanteML As comprobantes_ml_Screen

            objComprobanteML = MyBase.ObtenerComprobantesML(pIdSolicitud, pObjConexion).FirstOf()

            objComprobanteML.DetalleIVA = MyBase.ObtenerDetalleIVA(pIdSolicitud, pObjConexion)
            objComprobanteML.DetalleTributos = MyBase.ObtenerDetalleTributo(pIdSolicitud, pObjConexion)
            objComprobanteML.CbtesAsociados = MyBase.ObtenerComprobanteAsociado(pIdSolicitud, pObjConexion)

            Return objComprobanteML

        Catch ex As Exception
            Throw New Exception("No se encontró el comprobante buscado por id " + CStr(pIdSolicitud) + ". " + vbCrLf + ex.Message)
        End Try
    End Function

    Public Function ObtenerDatosUltimoComprobante(ByVal pPtoVta As Integer, ByVal pCbteTipo As Integer, ByVal pCbteNro As Integer, ByVal pDnSource As String, _
                                                  ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, ByVal pCuitEmpresa As String, _
                                                  ByVal pNombreCertificado As String, ByVal pDireccion As String, ByVal pMilisegundos As Integer, _
                                                  ByRef pObjConexion As Conexion) As String Implements IReglasFE.ObtenerDatosUltimoComprobante
        Try
            Dim objComprobanteFE As comprobantes_ml_Screen
            Dim descripcion As String = String.Empty
            Dim detallesVarios As String = String.Empty

            objComprobanteFE = ObtenerComprobanteFE(pPtoVta, pCbteTipo, pCbteNro, pDnSource, pDnDestination, pIdServicioNegocio, pCuitEmpresa, pNombreCertificado, pDireccion, pMilisegundos, pObjConexion)

            For Each elemento As Detalle_iva In objComprobanteFE.DetalleIVA
                detallesVarios += (vbCrLf + "Detalle Iva: " + vbCrLf + _
                                    "BaseImp: " + elemento.baseImp.ToString + vbCrLf + _
                                    "Importe: " + elemento.importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next


            For Each elemento As Detalle_tributos In objComprobanteFE.DetalleTributos
                detallesVarios += (vbCrLf + "Detalle Tributo: " + vbCrLf + _
                                   "Alic: " + elemento.alic.ToString + vbCrLf + _
                                    "BaseImp: " + elemento.baseImp.ToString + vbCrLf + _
                                    "Desc: " + elemento.descripcion.ToString + vbCrLf + _
                                    "Importe: " + elemento.importe.ToString + vbCrLf + _
                                    "Id: " + elemento.Id.ToString)
            Next

            For Each elemento As CbtesAsoc In objComprobanteFE.CbtesAsociados
                detallesVarios += (vbCrLf + "Cbtes Asociados: " + vbCrLf + _
                                   "Nro: " + elemento.Nro.ToString + vbCrLf + _
                                    "PtoVta: " + elemento.PtoVta.ToString + vbCrLf + _
                                    "Tipo: " + elemento.Tipo.ToString)
            Next



            For Each elemento As Observaciones In objComprobanteFE.Observaciones
                detallesVarios += (vbCrLf + "Observaciones: " + vbCrLf + _
                                   "Code: " + elemento.code.ToString + vbCrLf + _
                                    "Msg: " + elemento.msg.ToString)
            Next


            With (objComprobanteFE)
                descripcion = "CbteDesde: " + .CbteDesde.ToString + vbCrLf + _
                    "CbteHasta: " + .CbteHasta.ToString + vbCrLf + _
                    "CbteFch: " + .CbteFch.ToString + vbCrLf + _
                    "FchVto: " + .CAEFchVto.ToString + vbCrLf + _
                    "CodAutorizacion: " + .CAE.ToString + vbCrLf + _
                    "CbteTipo: " + .CbteTipo.ToString + vbCrLf + _
                    "DocNro: " + .DocNro.ToString + vbCrLf + _
                    "DocTipo: " + .DocTipo.ToString + vbCrLf + _
                    "FchVtoPago: " + .FchVtoPago.ToString + vbCrLf + _
                    "PtoVta: " + .PtoVta.ToString + vbCrLf + _
                    "Concepto: " + .Concepto.ToString + vbCrLf + _
                    "Resultado: " + .Resultado.ToString + vbCrLf + _
                    "EmisionTipo: " + .EmisionTipo.ToString + vbCrLf + _
                    "FchProceso: " + .FchProceso.ToString + vbCrLf + _
                    "FchServDesde: " + .FchServDesde.ToString + vbCrLf + _
                    "FchServHasta: " + .FchServHasta.ToString + vbCrLf + _
                    "MonId: " + .MonId.ToString + vbCrLf + _
                    "ImpNeto: " + .ImpNeto.ToString + vbCrLf + _
                    "ImpIVA: " + .ImpIVA.ToString + vbCrLf + _
                    "ImpOpEx: " + .ImpOpEx.ToString + vbCrLf + _
                    "ImpTotal: " + .ImpTotal.ToString + vbCrLf + _
                    "ImpTotConc: " + .ImpTotConc.ToString + vbCrLf + _
                    "ImpTrib: " + .ImpTrib.ToString + vbCrLf + _
                    "MonCotiz: " + .MonCotiz.ToString + vbCrLf + _
                    detallesVarios

            End With

            Return descripcion

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerComprobanteFE(ByVal pPtoVta As Integer, ByVal pCbteTipo As Integer, ByVal pCbteNro As Integer, ByVal pDnSource As String, _
                                        ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, ByVal pCuitEmpresa As String, _
                                        ByVal pNombreCertificado As String, ByVal pDireccion As String, ByVal pMilisegundos As Integer, ByRef pObjConexion As Conexion) As comprobantes_ml_Screen Implements IReglasFE.ObtenerComprobanteFE
        Try

            Dim objTicket As Ticket
            Dim objAccesoAFIP As New AccesoAFIP_ML_PROD()
            Dim rutaArchivoXML As String

            rutaArchivoXML = ObtenerArchivoPath(ApplicationSettings.Ambiente, ApplicationSettings.TipoDeConexion, pObjConexion)

            objTicket = objAccesoAFIP.ObtenerTicket(pDnSource, pDnDestination, pIdServicioNegocio, pNombreCertificado, pDireccion, pMilisegundos, rutaArchivoXML, DEFAULT_VERBOSE)

            If pCbteNro = 0 Then
                pCbteNro = objAccesoAFIP.ObtenerUltimoNroCbteAutorizado(objTicket, pCuitEmpresa, pPtoVta, pCbteTipo)
            End If

            Return objAccesoAFIP.BuscarComprobantesAFIP(objTicket, pCuitEmpresa, pPtoVta, pCbteTipo, pCbteNro) 

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Overloads Function ObtenerObservaciones(ByVal pIdSolicitudes As Integer, ByRef pObjConexiones As Conexion) As List(Of observaciones) Implements IReglasFE.ObtenerObservaciones

        Try

            Return MyBase.ObtenerObservacion(pIdSolicitudes, pObjConexiones)

        Catch ex As Exception
            Me._error = ex.Message
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_DT(ByRef pObjConexion As Conexion) As DataTable Implements IReglasFE.ObtenerSolicitudesEnviar_DT
        Try
            Return MyBase.ObtenerSolicitudesEnviarMercadoLocal_DT(pObjConexion)
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_Lista(ByRef pObjConexion As Conexion) As List(Of Solicitud) Implements IReglasFE.ObtenerSolicitudesEnviar_Lista
        Try
            Return MyBase.ObtenerSolicitudesEnviarMercadoLocal(pObjConexion)
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function SolicitarCAE(ByVal pIdSolicitud As Integer, ByVal pDnSource As String, ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, _
                                  ByVal pNombreCertificado As String, ByVal pDireccion As String, ByVal pCuitEmpresa As String, ByVal pMilisegundos As Integer, _
                                  ByRef pObjConexion As Conexion) As List(Of observaciones) Implements IReglasFE.SolicitarCAE
        Try
            TransactionManager.StartSession()
            Me.Clear()
            Dim respuesta As String
            Dim rutaArchivoXML As String
            Dim objCbtesAsoc As New cbtesasoc
            Dim objAccesoAFIP As New AccesoAFIP_ML_PROD()
            Dim objTicket As Ticket
            Dim list As New List(Of observaciones)
            Dim msg As String = String.Empty

            Dim objProdFECAEResponse As ar.gov.afip.wsfe_v1.FECAEResponse

            Dim objComprobante As comprobantes_ml_Screen = ObtenerComprobanteFE(pIdSolicitud, pObjConexion)

            Dim objAdmConexionesBD As New AdmConexionesBD(pObjConexion)

            TransactionManager.Add(objAdmConexionesBD)

            rutaArchivoXML = ObtenerArchivoPath(ApplicationSettings.Ambiente, ApplicationSettings.TipoDeConexion, pObjConexion)

            objTicket = objAccesoAFIP.ObtenerTicket(pDnSource, pDnDestination, pIdServicioNegocio, pNombreCertificado, pDireccion, pMilisegundos, rutaArchivoXML, DEFAULT_VERBOSE)

            objProdFECAEResponse = objAccesoAFIP.ObtenerRespuestaAFIP(objComprobante, objTicket, pCuitEmpresa)

            respuesta = objProdFECAEResponse.FeCabResp.Resultado

            If respuesta.ToUpper.Equals("R") Then

                For Each item As ar.gov.afip.wsfe_v1.FEDetResponse In objProdFECAEResponse.FeDetResp

                    If item.Observaciones Is Nothing Then

                        For Each elem As ar.gov.afip.wsfe_v1.Err In objProdFECAEResponse.Errors
                            msg += elem.Code.ToString + " - " + elem.Msg
                        Next

                        If msg.Trim.Equals(String.Empty) Then msg += "¡Error desconocido!"

                        Throw New Exception(msg)

                    End If

                    list = New List(Of observaciones)

                    For Each elem_obs In item.Observaciones
                        MyBase.InsertarObservaciones(pIdSolicitud, elem_obs.Code, elem_obs.Msg, objAdmConexionesBD)
                        list.Add(New observaciones() With {.Code = elem_obs.Code, .Msg = elem_obs.Msg, .idsolicitud = pIdSolicitud})
                        msg += " * " + elem_obs.Msg.ToString + vbCrLf
                    Next

                Next

                'SALIMOS
                Throw New ObjectResultException(msg, list)

            End If

            TransactionManager.BeginTransactions()

            Dim estadoEnvio As String = "Aprobado"

            ProcesarComprobante(pIdSolicitud, objProdFECAEResponse.FeDetResp(0).CAE, objProdFECAEResponse.FeDetResp(0).CAEFchVto,
                                objProdFECAEResponse.FeDetResp(0).CbteDesde, objProdFECAEResponse.FeDetResp(0).CbteFch, estadoEnvio, objAdmConexionesBD)

            TransactionManager.CommitTransactions()

            CompletarComprobanteConResponse(objComprobante, objProdFECAEResponse, estadoEnvio)

            list = New List(Of observaciones)

            list.Add(CrearObjetoObservaciones(objComprobante))

            Return list

        Catch ex As Exception
            TransactionManager.RollbackTransactions()
            MyError = ex.Message
            Throw ex
        Finally
            TransactionManager.CloseSession()
        End Try
    End Function

    Private Sub ProcesarComprobante(ByVal pIdSolicitud As Integer, ByVal pCae As String, ByVal pCaeFchVto As String, ByVal pCbteDesde As Integer, _
                                       ByVal pCbteFch As String, ByRef pEstadoEnvio As String, ByRef pObjAdmConexionesBD As AdmConexionesBD)
        Try


            Dim response = MyBase.ActualizarComprobanteEnMagmaML(pIdSolicitud, pCae, pCaeFchVto, pCbteDesde, pCbteFch, pObjAdmConexionesBD)

            If response.resultado.Equals("OK") Then pEstadoEnvio = "Asignado"
            If Not response.resultado.Equals("OK") Then pEstadoEnvio = "No Asignado"

            Dim response2 = MyBase.ActualizarComprobanteML(pIdSolicitud, pCae, pCaeFchVto, pEstadoEnvio, pCbteDesde, pCbteFch, pObjAdmConexionesBD)

            If Not response.resultado.Equals("OK") Then Throw New Exception(response2.descripcion.ToString)

        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Sub

    Public Function ReprocesarComprobante(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As observaciones Implements FacturacionElectronica.IReglasFE.ReprocesarComprobante
        Try
            TransactionManager.StartSession()

            Dim objComprobante As comprobantes_ml_Screen = ObtenerComprobanteFE(pIdSolicitud, pObjConexion)

            Dim objAdmConexionesBD As New AdmConexionesBD(pObjConexion)

            TransactionManager.Add(objAdmConexionesBD)

            ValidarEstadoReproceso(objComprobante.estado_envio.ToString)

            TransactionManager.BeginTransactions()

            Dim estadoEnvio As String = "Aprobado"

            ProcesarComprobante(pIdSolicitud, objComprobante.CAE.ToString, objComprobante.CAEFchVto.ToString, CInt(objComprobante.CbteDesde.ToString),
                                objComprobante.CbteFch.ToString, estadoEnvio, objAdmConexionesBD)

            TransactionManager.CommitTransactions()

            objComprobante.estado_envio = estadoEnvio

            Return CrearObjetoObservaciones(objComprobante)

        Catch ex As Exception
            TransactionManager.RollbackTransactions()
            MyError = ex.Message
            Throw ex
        Finally
            TransactionManager.CloseSession()
        End Try
    End Function


    Public Sub ValidarComprobanteEnvio(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) Implements IReglasFE.ValidarComprobanteEnvio

        Try
            Me.Clear()
            Dim listaSolicitudes As List(Of Solicitud)
            Dim objSolicitudEnvio As Solicitud
            Dim msg As String = String.Empty

            listaSolicitudes = MyBase.ObtenerSolicitudesEnviarMercadoLocal(pObjConexion)

            objSolicitudEnvio = (From item As Solicitud In listaSolicitudes Where CInt(item.idsolicitud.ToString) = pIdSolicitud).ToList(0)

            'Validamos fechas
            If listaSolicitudes.Where(Function(o) o.cod_doc.Equals(objSolicitudEnvio.cod_doc.ToString)).Where(Function(o) o.fec_doc.ToString.CastToDate < objSolicitudEnvio.fec_doc.ToString.CastToDate).Count > 0 Then
                msg = "El documento '" + objSolicitudEnvio.cod_doc.ToString + "' Nº '" + objSolicitudEnvio.nro_doc.ToString + " no se puede procesar ya que exiten documentos con fecha anterior sin enviar a AFIP."
                msg += vbCrLf + "Fecha del documento: " + objSolicitudEnvio.fec_doc.ToString + "."
            End If

            'Validamos el estado
            If objSolicitudEnvio.estado_envio.ToString.Trim.ToUpper.Equals("AFECCONTA") Then _
                msg += vbCrLf + "La factura está afectada por contaduría, para continuar debe desafectarla."

            If objSolicitudEnvio.estado_envio.ToString.Trim.ToUpper.Equals("NO ASIGNADO") Then _
                msg += vbCrLf + "La factura está en estado ""No Asignado"". Es probable que ya exista en AFIP. Consulte los comprobantes existentes en AFIP para mayor seguridad."
            

            If objSolicitudEnvio.estado_envio.ToString.Trim.ToUpper.Equals("ASIGNADO") Then _
                msg += vbCrLf + "La factura está en estado ""Asignado"". Es probable que esté intentando enviar una factura duplicada. Consulte al proveedor del sistema."
            

            If Not msg.Trim.Equals(String.Empty) Then Throw New ValidationException(msg)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub


    Public Overloads Sub ValidarEstadoReproceso(ByVal pEstado As String) Implements FacturacionElectronica.IReglasFE.ValidarEstadoReproceso
        Try
            MyBase.ValidarEstadoReproceso(pEstado)
        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Sub


End Class
