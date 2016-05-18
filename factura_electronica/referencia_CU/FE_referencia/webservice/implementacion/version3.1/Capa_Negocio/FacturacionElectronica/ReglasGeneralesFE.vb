Imports fonseca_libDatos
Imports DAOFacturacionElectronica

Public MustInherit Class ReglasGeneralesFE

    Protected Const DEFAULT_VERBOSE As Boolean = True

    Protected _error As String
    


    Friend WriteOnly Property MyError() As String
        Set(ByVal value As String)
            _error = value
            If Not value.Trim.Equals(String.Empty) Then Log.Logger(tipoLogging.Error, Me._error)
        End Set
    End Property

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property
    

    Friend Sub Clear()
        Try
            Me._error = String.Empty
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Function ActualizarComprobanteEnMagmaML(ByVal pIdSolicitud As Integer, ByVal pCae As String, ByVal pCAEFchVto As String, ByVal pCbteDesde As Integer, _
                                                   ByVal pCbteFch As String, ByRef pObjAdmConexionesBD As AdmConexionesBD) As Response

        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion()

            Return objAdmFacturacion.ActualizarComprobanteLocalEnMagma(pIdSolicitud, pCae, pCAEFchVto, pCbteDesde, pCbteFch, pObjAdmConexionesBD)


        Catch ex As Exception
            Throw ex
        End Try
    End Function
    Friend Function ActualizarComprobanteML(ByVal pIdSolicitud As Integer, ByVal pCae As String, ByVal pCAEFchVto As String, ByVal pEstadoEnvio As String, ByVal pCbteDesde As Integer, _
                                              ByVal pCbteFch As String, ByRef pObjAdmConexionesBD As AdmConexionesBD) As Response

        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion()

            Return objAdmFacturacion.ModificarPorIdUnivoco(New comprobantes_ml_Screen() With {.idsolicitud = pIdSolicitud, .CAE = pCae, .CAEFchVto = pCAEFchVto,
                                                                                      .estado_envio = pEstadoEnvio, .CbteDesde = pCbteDesde, .CbteFch = pCbteFch}, pObjAdmConexionesBD)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Sub CompletarComprobanteConResponseML_HOMO(ByRef pObjComprobante As comprobantes_ml_Screen, ByRef pObjRespuesta As ar.gov.afip.wshomofev1.FECAEResponse, ByVal pEstadoEnvio As String)
        Try
            pObjComprobante.CAE = pObjRespuesta.FeDetResp(0).CAE
            pObjComprobante.CAEFchVto = pObjRespuesta.FeDetResp(0).CAEFchVto
            pObjComprobante.CbteDesde = pObjRespuesta.FeDetResp(0).CbteDesde
            pObjComprobante.CbteFch = pObjRespuesta.FeDetResp(0).CbteFch
            pObjComprobante.estado_envio = pEstadoEnvio
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Sub CompletarComprobanteConResponseML_PROD(ByRef pObjComprobante As comprobantes_ml_Screen, ByRef pObjRespuesta As ar.gov.afip.wsfe_v1.FECAEResponse, ByVal pEstadoEnvio As String)
        Try
            pObjComprobante.CAE = pObjRespuesta.FeDetResp(0).CAE
            pObjComprobante.CAEFchVto = pObjRespuesta.FeDetResp(0).CAEFchVto
            pObjComprobante.CbteDesde = pObjRespuesta.FeDetResp(0).CbteDesde
            pObjComprobante.CbteFch = pObjRespuesta.FeDetResp(0).CbteFch
            pObjComprobante.estado_envio = pEstadoEnvio
        Catch ex As Exception
            Throw ex
        End Try
    End Sub



    Friend Function CrearObjetoObservaciones(ByRef pObjComprobante As comprobantes_ml_Screen) As Observaciones
        Try
            Dim objObservaciones As New observaciones() With {.Code = 1, .Msg = "CAE: " + pObjComprobante.CAE.ToString + " | CAE Fecha Vto: " + pObjComprobante.CAEFchVto.ToString + _
                " | Nro de comprobante magma: " + pObjComprobante.DocNro.ToString + " | Nro de comprobante AFIP: " + pObjComprobante.CbteDesde.ToString + _
                " | Fecha comprobante: " + pObjComprobante.CbteFch.ToString + " | Estado de envío: " + pObjComprobante.estado_envio.ToString, .idsolicitud = pObjComprobante.idsolicitud.ToString.CastToInteger}

            Return objObservaciones

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function CrearObjeto_ComprobanteFE_desde_ComprobanteML(ByVal comprobanteLocal As comprobantes_ml_Screen) As comprobantes_ml_Screen
        Try
            Dim comprobanteE As New comprobantes_ml_Screen
            With comprobanteE
                .CAE = comprobanteLocal.CAE
                .CAEFchVto = comprobanteLocal.CAEFchVto
                .CbteDesde = comprobanteLocal.CbteDesde
                .CbteFch = comprobanteLocal.CbteFch
                .CbteHasta = comprobanteLocal.CbteHasta
                .CbteTipo = comprobanteLocal.CbteTipo
                .Concepto = comprobanteLocal.Concepto
                .DocNro = comprobanteLocal.DocNro
                .DocTipo = comprobanteLocal.DocTipo
                .EmisionTipo = comprobanteLocal.EmisionTipo
                .estado_envio = comprobanteLocal.estado_envio
                .FchProceso = comprobanteLocal.FchProceso
                .FchServDesde = comprobanteLocal.FchServDesde
                .FchServHasta = comprobanteLocal.FchServHasta
                .FchVtoPago = comprobanteLocal.FchVtoPago
                .idsolicitud = comprobanteLocal.idsolicitud
                .ImpIVA = comprobanteLocal.ImpIVA
                .ImpNeto = comprobanteLocal.ImpNeto
                .ImpOpEx = comprobanteLocal.ImpOpEx
                .ImpTotal = comprobanteLocal.ImpTotal
                .ImpTotConc = comprobanteLocal.ImpTotConc
                .ImpTrib = comprobanteLocal.ImpTrib
                .MonCotiz = comprobanteLocal.MonCotiz
                .MonId = comprobanteLocal.MonId
                .nro_doc_afip = comprobanteLocal.nro_doc_afip
                .PtoVta = comprobanteLocal.PtoVta
                .Resultado = comprobanteLocal.Resultado
            End With

            Return comprobanteE

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function InsertarComprobantes(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
        InsertarComprobantes = False

        Try
            TransactionManager.StartSession()
            Me.Clear()

            Dim codigoObservacion As Integer = 0
            Dim objAdmConexionesBD As New AdmConexionesBD(pObjConexion)

            TransactionManager.Add(objAdmConexionesBD)
            TransactionManager.BeginTransactions()

            Dim resp As Response = InsertarComprobanteLocal(pIdSolicitud, objAdmConexionesBD)

            If resp.resultado.Equals("OK") Then
                resp.descripcion = resp.resultado
                codigoObservacion = 1
            End If

            If resp.resultado.Equals("ERROR") Then codigoObservacion = -1

            InsertarObservaciones(pIdSolicitud, codigoObservacion, "Preparación de comprobante a enviar: " + resp.descripcion.ToString, objAdmConexionesBD)

            TransactionManager.CommitTransactions()

            InsertarComprobantes = True

        Catch ex As Exception
            TransactionManager.RollbackTransactions()
            MyError = ex.Message
        Finally
            TransactionManager.CloseSession()
        End Try
    End Function

    Friend Function InsertarComprobanteLocal(ByVal pIdSolicitud As Integer, ByRef pObjConexionesBD As AdmConexionesBD) As Response

        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion()

            Return objAdmFacturacion.InsertarComprobanteLocal(pIdSolicitud, pObjConexionesBD)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend sub InsertarObservaciones(ByVal pIdSolicitud As Integer, ByVal pCode As Integer, ByVal pMsg As String, ByRef pObjConexionesBD As AdmConexionesBD) 
        Try
            Me.Clear()

            Dim facturacion As New AdmFacturacion()

            facturacion.Insertar(New observaciones() With {.idsolicitud = pIdSolicitud, .Code = pCode, .Msg = pMsg}, pObjConexionesBD)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Function ObtenerArchivoPath(ByVal pAmbiente As String, ByVal pTipoMercado As String, ByVal pObjConexion As Conexion) As String
        Try
            Me.Clear()

            Dim modoOperacion As String
            Dim stringFecha As String
            Dim archivoPath As String

            modoOperacion = Mid(pAmbiente, 1, 4) + "_"
            stringFecha = GestionFechas.FechaServidor_TipoStringBD(pObjConexion, GestionFechas.Formatos.DiaMesAño_Guion, "")
            archivoPath = "TA_" + modoOperacion + pTipoMercado + stringFecha + ".xml"

            Return archivoPath

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerComprobantesML(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of comprobantes_ml_Screen)
        Try
            Me.Clear()

            Dim facturacion As New AdmFacturacion

            Return facturacion.Obtener(New comprobantes_ml_Screen() With {.idsolicitud = pIdSolicitud}, pObjConexion).Cast(Of comprobantes_ml_Screen).ToList()

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerObservacion(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of observaciones)
        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.Obtener(New observaciones() With {.idsolicitud = pIdSolicitud}, pObjConexion).Cast(Of observaciones).ToList()

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviarMercadoLocal(ByRef pObjConexion As Conexion) As List(Of Solicitud)
        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.ObtenerSolicitudesEnviarMercadoLocal(pObjConexion).Cast(Of Solicitud).ToList()

        Catch ex As Exception
            Throw ex
        End Try
    End Function

   

 

    Private Function ObtenerSolicitudesEnviarMercadoExpo(ByRef pObjConexion As Conexion) As List(Of Solicitud)
        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.ObtenerSolicitudesEnviarMercadoExpo(pObjConexion).Cast(Of Solicitud).ToList
            

        Catch ex As Exception
            Throw ex
        End Try
    End Function

 

    Private Function GenerarDataTableSolicitudes(pList As List(Of Solicitud)) As DataTable
        Try
            Dim dt As New DataTable()

            dt.Columns.Add(New DataColumn("Fecha", GetType(String)))
            dt.Columns.Add(New DataColumn("Solicitud", GetType(String)))
            dt.Columns.Add(New DataColumn("Documento", GetType(String)))
            dt.Columns.Add(New DataColumn("Titular", GetType(String)))
            dt.Columns.Add(New DataColumn("Serie", GetType(String)))
            dt.Columns.Add(New DataColumn("Número", GetType(String)))
            dt.Columns.Add(New DataColumn("Importe", GetType(String)))
            dt.Columns.Add(New DataColumn("Estado", GetType(String)))

            Dim dr As DataRow

            For Each item As Solicitud In pList
                dr = dt.NewRow()
                dr("Fecha") = CDate(item.fec_doc.ToString).ToShortDateString
                dr("Solicitud") = item.idsolicitud.ToString
                dr("Documento") = item.cod_doc.ToString
                dr("Titular") = item.nom_tit.ToString
                dr("Serie") = item.serie_doc.ToString
                dr("Número") = item.nro_doc.ToString
                dr("Importe") = item.imp_tot_mo.ToString
                dr("Estado") = item.estado_envio.ToString
                dt.Rows.Add(dr)
            Next

            Return dt

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Friend Function ObtenerSolicitudesEnviarMercadoExpo_DT(ByRef pObjConexion As Conexion) As DataTable

        Try

            Return GenerarDataTableSolicitudes(ObtenerSolicitudesEnviarMercadoExpo(pObjConexion))

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerSolicitudesEnviarMercadoLocal_DT(ByRef pObjConexion As Conexion) As DataTable

        Try

            Return GenerarDataTableSolicitudes(ObtenerSolicitudesEnviarMercadoLocal(pObjConexion))

        Catch ex As Exception
            Throw ex
        End Try
    End Function



    Friend Function ObtenerDetalleIVA(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of detalle_iva)
        Try
            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.Obtener(New detalle_iva() With {.idsolicitud = pIdSolicitud}, pObjConexion).Cast(Of detalle_iva).ToList()

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerDetalleTributo(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of detalle_tributos)
        Try
            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.Obtener(New detalle_tributos() With {.idsolicitud = pIdSolicitud}, pObjConexion).Cast(Of detalle_tributos).ToList

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerComprobanteAsociado(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of cbtesasoc)
        Try

            Dim objAdmFacturacion As New AdmFacturacion

            Return objAdmFacturacion.Obtener(New cbtesasoc With {.idsolicitud = pIdSolicitud}, pObjConexion).Cast(Of cbtesasoc).ToList

        Catch ex As Exception
            Throw ex
        End Try
    End Function




    Friend Sub ValidarEstadoReproceso(ByVal pEstado As String)
        Try
            If Not pEstado.Trim.ToUpper.Equals("NO ASIGNADO") Then Throw New ValidationException("El estado del registro no permite visualizar el menú contextual.")
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

End Class
