Imports DAOFacturacionElectronica
Imports fonseca_libDatos

Public Class ReglasFacturacionElectronica

    Protected _error As String

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Friend WriteOnly Property MyError() As String
        Set(ByVal value As String)
            _error = value
            If Not value.Trim.Equals(String.Empty) Then Log.Logger(tipoLogging.Error, Me._error)
        End Set
    End Property

    Private _tipoMercado As String = "ML"
    Private _ambienteAFIP As String = "PRODUCCION"
    Protected Const _baseFacturacion As String = "FacturaElectronica"

    Sub New()

    End Sub

  



    Private Function ObtenerInstanciaObjeto(pAmbienteAFIP As String, pTipoMercado As String) As IReglasFE
        Try

            If pAmbienteAFIP.ToUpper.Trim.Equals("PRODUCCION") AndAlso pTipoMercado.ToUpper.Trim.Equals("ML") Then
                Return New ReglasML_PROD()
            End If

            If pAmbienteAFIP.ToUpper.Trim.Equals("HOMOLOGACION") AndAlso pTipoMercado.ToUpper.Trim.Equals("ML") Then
                Return New ReglasML_HOMO()
            End If

            Return New ReglasML_PROD()

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function InsertarComprobantes(ByVal pIdSolicitud As Integer) As Boolean
        InsertarComprobantes = False
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion(_baseFacturacion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not objReglasFE.InsertarComprobantes(pIdSolicitud, objConexion) Then
                Me._error = objReglasFE.Error
                Exit Function
            End If

            InsertarComprobantes = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Public Function ObtenerObservaciones(ByVal pIdSolicitudes As Integer) As List(Of observaciones)
        Try
            Dim objReglasFE As IReglasFE

            Dim objConexion As New Conexion(_baseFacturacion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ObtenerObservaciones(pIdSolicitudes, objConexion)

        Catch ex As Exception
            Me._error = ex.Message
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_DT() As DataTable
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion(_baseFacturacion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ObtenerSolicitudesEnviar_DT(objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_Lista() As List(Of Solicitud)
        Try
            Dim objReglasFE As IReglasFE
           Dim objConexion As New Conexion(_baseFacturacion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ObtenerSolicitudesEnviar_Lista(objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public sub ValidarComprobanteEnvio(ByVal pIdSolicitud As Integer) 
        Try

            Dim objReglasFE As IReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            objReglasFE.ValidarComprobanteEnvio(pIdSolicitud, New Conexion(_baseFacturacion))

        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Sub

    Public Overloads Sub ValidarEstadoReproceso(ByVal pEstado As String)

        Try
            Dim objReglasFE As IReglasFE

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            objReglasFE.ValidarEstadoReproceso(pEstado)

        Catch ex As Exception
            Myerror = ex.Message
            Throw ex
        End Try
    End Sub


    Public Function ObtenerDatosUltimoComprobante(ByVal pPtoVta As String, ByVal pCbteTipo As String, ByVal pCbteNro As String) As String
        Dim objReglasFE As IReglasFE = Nothing
        Try

            Dim ptoVta, cbteTipo, cbteNro, milisegundos As Integer
            Dim dnSource, dnDestination, idServicioNegocio, cuitEmpresa, nombreCertificado, direccion As String
            Dim objConexion As New Conexion(_baseFacturacion)
            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not IsNumeric(pPtoVta) Then pPtoVta = "0"
            If Not IsNumeric(pCbteNro) Then pCbteNro = "0"
            If Not IsNumeric(pCbteTipo) Then pCbteTipo = "0"

            If pPtoVta.Trim.Equals("0") Then
                ptoVta = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "PTO_VTA")  'DEFAULT_PTO_VTA_ML
            Else
                ptoVta = CInt(pPtoVta)
            End If

            If pCbteTipo.Trim.Equals("0") Then
                cbteTipo = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "CBTE_TIPO")  'DEFAULT_CBTE_TIPO_ML
            Else
                cbteTipo = CInt(pCbteTipo)
            End If

            cbteNro = CInt(pCbteNro)

            dnSource = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "DNORIGEN")
            dnDestination = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "DNDESTINO")
            idServicioNegocio = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "SERVICIO")
            cuitEmpresa = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "CUIT_FONSECA")
            nombreCertificado = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "NOMBRE_CERTI")
            direccion = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "SERVICE_DIR")
            milisegundos = CInt(ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "TIEMPO_ESPERA"))

            Return objReglasFE.ObtenerDatosUltimoComprobante(ptoVta, cbteTipo, cbteNro, dnSource, dnDestination, idServicioNegocio, cuitEmpresa, _
                                                             nombreCertificado, direccion, milisegundos, objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Function ReprocesarComprobante(ByVal pIdSolicitud As Integer) As observaciones

        Try

            Dim objConexion As New Conexion(_baseFacturacion)

            Dim objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ReprocesarComprobante(pIdSolicitud, objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function SolicitarCAE(ByVal pIdSolicitud As Integer) As List(Of observaciones)

        Try

            Dim milisegundos As Integer
            Dim dnSource, dnDestination, idServicioNegocio, cuitEmpresa, nombreCertificado, direccion As String
            Dim objConexion As New Conexion(_baseFacturacion)
            Dim objReglasFE As IReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            dnSource = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "DNORIGEN")
            dnDestination = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "DNDESTINO")
            idServicioNegocio = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "SERVICIO")
            cuitEmpresa = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "CUIT_FONSECA")
            nombreCertificado = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "NOMBRE_CERTI")
            direccion = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "SERVICE_DIR")
            milisegundos = CInt(ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "TIEMPO_ESPERA"))

            Return objReglasFE.SolicitarCAE(pIdSolicitud, dnSource, dnDestination, idServicioNegocio, nombreCertificado, direccion, cuitEmpresa, milisegundos, objConexion)

        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Function
End Class
