Imports fonseca_libDatos
Imports DAOFacturacionElectronica

Public MustInherit Class ReglasGeneralesFE

    Protected Const DEFAULT_VERBOSE As Boolean = True

    Protected _error As String
    Protected _listaObtenida As ArrayList
    Protected _objetoObtenido As Object


    Protected _listaConexiones As List(Of Conexion)
    Protected _ambiente As String
    Protected _tipoDeConexion As String
    Protected _appName As String

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property
    Public ReadOnly Property ObjetoObtenido() As Object
        Get
            Return _objetoObtenido
        End Get
    End Property
    Public ReadOnly Property ListaObtenida() As ArrayList
        Get
            Return _listaObtenida
        End Get
    End Property

    Sub New(ByVal pListaConexiones As List(Of Conexion), ByVal pAmbiente As String, ByVal pTipoDeConexion As String, pAppName As String)
        _listaConexiones = pListaConexiones
        _ambiente = pAmbiente
        _tipoDeConexion = pTipoDeConexion
        _appName = pAppName
    End Sub

    Friend Sub Clear()
        Try
            Me._error = String.Empty
            Me._listaObtenida = Nothing
            Me._objetoObtenido = Nothing
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Function ActualizarComprobanteEnMagmaML(ByVal pIdSolicitud As Integer, ByVal pCae As String, ByVal pCAEFchVto As String, ByVal pCbteDesde As Integer, _
                                                   ByVal pCbteFch As String, ByRef pObjAdmConexionesBD As AdmConexionesBD) As Boolean
        ActualizarComprobanteEnMagmaML = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion()

            If Not objAdmFacturacion.ActualizarComprobanteEnMagmaML(pIdSolicitud, pCae, pCAEFchVto, pCbteDesde, pCbteFch, pObjAdmConexionesBD) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            ActualizarComprobanteEnMagmaML = True
        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function
    Friend Function ActualizarComprobanteML(ByVal pIdSolicitud As Integer, ByVal pCae As String, ByVal pCAEFchVto As String, ByVal pEstadoEnvio As String, ByVal pCbteDesde As Integer, _
                                              ByVal pCbteFch As String, ByRef pObjAdmConexionesBD As AdmConexionesBD) As Boolean
        ActualizarComprobanteML = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion()

            If Not objAdmFacturacion.ActualizarComprobanteML(pIdSolicitud, pCae, pCAEFchVto, pEstadoEnvio, pCbteDesde, pCbteFch, pObjAdmConexionesBD) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            ActualizarComprobanteML = True
        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Friend Sub CompletarComprobanteConResponseML_HOMO(ByRef pObjComprobante As Comprobantes_ml, ByRef pObjRespuesta As ar.gov.afip.wshomofev1.FECAEResponse, ByVal pEstadoEnvio As String)
        Try
            pObjComprobante.CAE = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CAE, SQLAdapter.getTipoString)
            pObjComprobante.CAEFchVto = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CAEFchVto, SQLAdapter.getTipoString)
            pObjComprobante.CbteDesde = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CbteDesde, SQLAdapter.getTipoString)
            pObjComprobante.CbteFch = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CbteFch, SQLAdapter.getTipoString)
            pObjComprobante.estado_envio = Campo.ToCampo(pEstadoEnvio, SQLAdapter.getTipoString)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Friend Sub CompletarComprobanteConResponseML_PROD(ByRef pObjComprobante As Comprobantes_ml, ByRef pObjRespuesta As ar.gov.afip.wsfe_v1.FECAEResponse, ByVal pEstadoEnvio As String)
        Try
            pObjComprobante.CAE = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CAE, SQLAdapter.getTipoString)
            pObjComprobante.CAEFchVto = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CAEFchVto, SQLAdapter.getTipoString)
            pObjComprobante.CbteDesde = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CbteDesde, SQLAdapter.getTipoString)
            pObjComprobante.CbteFch = Campo.ToCampo(pObjRespuesta.FeDetResp(0).CbteFch, SQLAdapter.getTipoString)
            pObjComprobante.estado_envio = Campo.ToCampo(pEstadoEnvio, SQLAdapter.getTipoString)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    

    Friend Function CrearObjetoObservaciones(ByRef pObjComprobante As Comprobantes_ml) As Observaciones
        Try
            Dim objObservaciones As New Observaciones(1, "CAE: " + pObjComprobante.CAE.ToString + " | CAE Fecha Vto: " + pObjComprobante.CAEFchVto.ToString + _
                                                      " | Nro de comprobante magma: " + pObjComprobante.DocNro.ToString + " | Nro de comprobante AFIP: " + pObjComprobante.CbteDesde.ToString + _
                                                      " | Fecha comprobante: " + pObjComprobante.CbteFch.ToString + " | Estado de envío: " + pObjComprobante.estado_envio.ToString, CInt(pObjComprobante.idsolicitud.ToString))
            Return objObservaciones

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function CrearObjeto_ComprobanteFE_desde_ComprobanteML(ByVal pObjComprobanteML As Comprobantes_ml) As Comprobantes_ml
        Try
            Dim objComprobanteFE As New Comprobantes_ml

            objComprobanteFE.CAE = pObjComprobanteML.CAE
            objComprobanteFE.CAEFchVto = pObjComprobanteML.CAEFchVto
            objComprobanteFE.CbteDesde = pObjComprobanteML.CbteDesde
            objComprobanteFE.CbteFch = pObjComprobanteML.CbteFch
            objComprobanteFE.CbteHasta = pObjComprobanteML.CbteHasta
            objComprobanteFE.CbteTipo = pObjComprobanteML.CbteTipo
            objComprobanteFE.Concepto = pObjComprobanteML.Concepto
            objComprobanteFE.DocNro = pObjComprobanteML.DocNro
            objComprobanteFE.DocTipo = pObjComprobanteML.DocTipo
            objComprobanteFE.EmisionTipo = pObjComprobanteML.EmisionTipo
            objComprobanteFE.estado_envio = pObjComprobanteML.estado_envio
            objComprobanteFE.FchProceso = pObjComprobanteML.FchProceso
            objComprobanteFE.FchServDesde = pObjComprobanteML.FchServDesde
            objComprobanteFE.FchServHasta = pObjComprobanteML.FchServHasta
            objComprobanteFE.FchVtoPago = pObjComprobanteML.FchVtoPago
            objComprobanteFE.idsolicitud = pObjComprobanteML.idsolicitud
            objComprobanteFE.ImpIVA = pObjComprobanteML.ImpIVA
            objComprobanteFE.ImpNeto = pObjComprobanteML.ImpNeto
            objComprobanteFE.ImpOpEx = pObjComprobanteML.ImpOpEx
            objComprobanteFE.ImpTotal = pObjComprobanteML.ImpTotal
            objComprobanteFE.ImpTotConc = pObjComprobanteML.ImpTotConc
            objComprobanteFE.ImpTrib = pObjComprobanteML.ImpTrib
            objComprobanteFE.MonCotiz = pObjComprobanteML.MonCotiz
            objComprobanteFE.MonId = pObjComprobanteML.MonId
            objComprobanteFE.nro_doc_afip = pObjComprobanteML.nro_doc_afip
            objComprobanteFE.PtoVta = pObjComprobanteML.PtoVta
            objComprobanteFE.Resultado = pObjComprobanteML.Resultado

            Return objComprobanteFE

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function InsertarComprobantesML(ByVal pIdSolicitud As Integer, ByRef pObjConexionesBD As AdmConexionesBD) As Boolean
        InsertarComprobantesML = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion()

            If Not objAdmFacturacion.InsertarComprobanteML(pIdSolicitud, pObjConexionesBD) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._listaObtenida = objAdmFacturacion.ListaObtenida
            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido

            InsertarComprobantesML = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Friend Function InsertarObservaciones(ByVal pIdSolicitud As Integer, ByVal pCode As Integer, ByVal pMsg As String, ByRef pObjConexionesBD As AdmConexionesBD) As Boolean
        InsertarObservaciones = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion()

            If Not objAdmFacturacion.InsertarObservacion(pIdSolicitud, pCode, pMsg, pObjConexionesBD) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._listaObtenida = objAdmFacturacion.ListaObtenida
            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido

            InsertarObservaciones = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

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

    Friend Function ObtenerComprobantesML(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
        ObtenerComprobantesML = False
        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion

            If Not objAdmFacturacion.ObtenerComprobantesML(pIdSolicitud, pObjConexion) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido
            Me._listaObtenida = objAdmFacturacion.ListaObtenida

            ObtenerComprobantesML = True
        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Friend Function ObtenerObservaciones(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
        ObtenerObservaciones = False
        Try
            Me.Clear()

            Dim objAdmFacturacion As New AdmFacturacion

            If Not objAdmFacturacion.ObtenerObservaciones(pIdSolicitud, pObjConexion) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido
            Me._listaObtenida = objAdmFacturacion.ListaObtenida

            ObtenerObservaciones = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function


    Private Function ObtenerSolicitudesEnviarMercadoLocal(ByRef pObjConexion As Conexion) As Boolean
        ObtenerSolicitudesEnviarMercadoLocal = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion

            If Not objAdmFacturacion.ObtenerSolicitudesEnviarMercadoLocal(pObjConexion) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._listaObtenida = objAdmFacturacion.ListaObtenida
            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido

            ObtenerSolicitudesEnviarMercadoLocal = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Friend Function ObtenerSolicitudesEnviarMercadoLocal_DT(ByRef pObjConexion As Conexion) As DataTable

        Try
            Dim objDataColumn As DataColumn
            Dim objDataTable As New DataTable()

            If Not ObtenerSolicitudesEnviarMercadoLocal(pObjConexion) Then
                Throw New Exception(Me._error)
            End If

            objDataColumn = New DataColumn("Fecha", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Solicitud", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Documento", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Titular", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Serie", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Número", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Importe", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Estado", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            

            Dim objDataRow As DataRow

            For Each item As Solicitud In _listaObtenida
                objDataRow = objDataTable.NewRow()
                objDataRow("Fecha") = CDate(item.fec_doc.ToString).ToShortDateString
                objDataRow("Solicitud") = item.idSolicitud.ToString
                objDataRow("Documento") = item.cod_doc.ToString
                objDataRow("Titular") = item.nom_tit.ToString
                objDataRow("Serie") = item.serie_doc.ToString
                objDataRow("Número") = item.nro_doc.ToString
                objDataRow("Importe") = item.imp_tot_mo.ToString
                objDataRow("Estado") = item.estado_envio.ToString
                objDataTable.Rows.Add(objDataRow)
            Next

            Return objDataTable

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerSolicitudesEnviarMercadoLocal_Lista(ByRef pObjConexion As Conexion) As List(Of Solicitud)

        Try
            Dim objLista As New List(Of Solicitud)

            If Not ObtenerSolicitudesEnviarMercadoLocal(pObjConexion) Then
                Throw New Exception(Me._error)
            End If

            For Each item As Solicitud In _listaObtenida
                objLista.Add(item)
            Next

            Return objLista

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function ObtenerSolicitudesEnviarMercadoExpo(ByRef pObjConexion As Conexion) As Boolean
        ObtenerSolicitudesEnviarMercadoExpo = False
        Try
            Me.Clear()
            Dim objAdmFacturacion As New AdmFacturacion

            If Not objAdmFacturacion.ObtenerSolicitudesEnviarMercadoExpo(pObjConexion) Then
                Me._error = objAdmFacturacion.Error
                Exit Function
            End If

            Me._listaObtenida = objAdmFacturacion.ListaObtenida
            Me._objetoObtenido = objAdmFacturacion.ObjetoObtenido

            ObtenerSolicitudesEnviarMercadoExpo = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Friend Function ObtenerSolicitudesEnviarMercadoExpo_DT(ByRef pObjConexion As Conexion) As DataTable

        Try
            Dim objDataColumn As DataColumn
            Dim objDataTable As New DataTable()

            If Not ObtenerSolicitudesEnviarMercadoExpo(pObjConexion) Then
                Throw New Exception(Me._error)
            End If

            objDataColumn = New DataColumn("Fecha", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Solicitud", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Documento", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Titular", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Serie", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Número", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Importe", GetType(String))
            objDataTable.Columns.Add(objDataColumn)
            objDataColumn = New DataColumn("Estado", GetType(String))
            objDataTable.Columns.Add(objDataColumn)

            Dim objDataRow As DataRow

            For Each item As Solicitud In _listaObtenida
                objDataRow = objDataTable.NewRow()
                objDataRow("Fecha") = CDate(item.fec_doc.ToString).ToShortDateString
                objDataRow("Solicitud") = item.idSolicitud.ToString
                objDataRow("Documento") = item.cod_doc.ToString
                objDataRow("Titular") = item.nom_tit.ToString
                objDataRow("Serie") = item.serie_doc.ToString
                objDataRow("Número") = item.nro_doc.ToString
                objDataRow("Importe") = item.imp_tot_mo.ToString
                objDataRow("Estado") = item.estado_envio.ToString
                objDataTable.Rows.Add(objDataRow)
            Next

            Return objDataTable

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function ObtenerSolicitudesEnviarMercadoExpo_Lista(ByRef pObjConexion As Conexion) As List(Of Solicitud)

        Try
            Dim objLista As New List(Of Solicitud)

            If Not ObtenerSolicitudesEnviarMercadoExpo(pObjConexion) Then
                Throw New Exception(Me._error)
            End If

            For Each item As Solicitud In _listaObtenida
                objLista.Add(item)
            Next

            Return objLista

        Catch ex As Exception
            Throw ex
        End Try
    End Function




    Friend Function OtenerListaDetalleIVA(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of Detalle_iva)
        Try
            Dim objAdmFacturacion As New AdmFacturacion

            Dim objListaDetalleIVA As New List(Of Detalle_iva)

            If Not objAdmFacturacion.ObtenerDetalleIVA(pIdSolicitud, pObjConexion) Then
                Throw New Exception(objAdmFacturacion.Error)
            End If

            For Each item As Detalle_iva In objAdmFacturacion.ListaObtenida
                objListaDetalleIVA.Add(item)
            Next

            Return objListaDetalleIVA

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function OtenerListaDetalleTributo(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of Detalle_tributos)
        Try
            Dim objAdmFacturacion As New AdmFacturacion

            Dim objListaDetalleTributos As New List(Of Detalle_tributos)

            If Not objAdmFacturacion.ObtenerDetalleTributo(pIdSolicitud, pObjConexion) Then
                Throw New Exception(objAdmFacturacion.Error)
            End If

            For Each item As Detalle_tributos In objAdmFacturacion.ListaObtenida
                objListaDetalleTributos.Add(item)
            Next

            Return objListaDetalleTributos

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Friend Function OtenerListaComprobantesAsociados(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As List(Of CbtesAsoc)
        Try
            Dim objAdmFacturacion As New AdmFacturacion

            Dim objListaCbtesAsoc As New List(Of CbtesAsoc)

            If Not objAdmFacturacion.ObtenerComprobantesAsociados(pIdSolicitud, pObjConexion) Then
                Throw New Exception(objAdmFacturacion.Error)
            End If

            For Each item As CbtesAsoc In objAdmFacturacion.ListaObtenida
                objListaCbtesAsoc.Add(item)
            Next

            Return objListaCbtesAsoc

        Catch ex As Exception
            Throw ex
        End Try
    End Function




    Friend Function ValidarEstadoReproceso(ByVal pEstado As String) As Boolean
        ValidarEstadoReproceso = False
        Try

            If Not pEstado.Trim.ToUpper.Equals("NO ASIGNADO") Then
                Me._error = "El estado del registro no permite visualizar el menú contextual."
                Exit Function
            End If

            ValidarEstadoReproceso = True
        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

End Class
