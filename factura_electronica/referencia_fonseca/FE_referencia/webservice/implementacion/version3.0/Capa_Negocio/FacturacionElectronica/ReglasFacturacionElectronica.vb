﻿Imports DAOFacturacionElectronica
Imports fonseca_libDatos

Public Class ReglasFacturacionElectronica

    Protected _error As String
    Protected _listaObtenida As ArrayList
    Protected _objetoObtenido As Object

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
    
    Protected _listaConfiguracionFE As List(Of ConfiguracionFE)

    Protected _listaConexiones As List(Of Conexion)
    Protected _ambiente As String
    Protected _tipoDeConexion As String
    Protected _appName As String

    Private _tipoMercado As String = "ML"
    Private _ambienteAFIP As String = "PRODUCCION"
    Protected Const _baseFacturacion As String = "FacturaElectronica"

    Sub New(ByVal pListaConexiones As List(Of Conexion), ByVal pAmbiente As String, ByVal pAmbienteAFIP As String, ByVal pTipoMercado As String, ByVal pTipoDeConexion As String, pAppName As String)
        _listaConexiones = pListaConexiones
        _ambiente = pAmbiente
        _ambienteAFIP = pAmbienteAFIP
        _tipoDeConexion = pTipoDeConexion
        _appName = pAppName
        _tipoMercado = pTipoMercado
    End Sub

    Public Sub SetListaConfiguracionFE(ByVal pLista As List(Of ConfiguracionFE))
        _listaConfiguracionFE = pLista
    End Sub



    Private Function ObtenerInstanciaObjeto(pAmbienteAFIP As String, pTipoMercado As String) As IReglasFE
        Try

            If pAmbienteAFIP.ToUpper.Trim.Equals("PRODUCCION") AndAlso pTipoMercado.ToUpper.Trim.Equals("ML") Then
                Return New ReglasML_PROD(_listaConexiones, _ambiente, _tipoDeConexion, _appName)
            End If

            If pAmbienteAFIP.ToUpper.Trim.Equals("HOMOLOGACION") AndAlso pTipoMercado.ToUpper.Trim.Equals("ML") Then
                Return New ReglasML_HOMO(_listaConexiones, _ambiente, _tipoDeConexion, _appName)
            End If

            Return New ReglasML_PROD(_listaConexiones, _ambiente, _tipoDeConexion, _appName)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function InsertarComprobantes(ByVal pIdSolicitud As Integer) As Boolean
        InsertarComprobantes = False
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)

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

    Public Function ObtenerObservaciones(ByVal pIdSolicitudes As Integer) As Boolean
        ObtenerObservaciones = False
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not objReglasFE.ObtenerObservaciones(pIdSolicitudes, objConexion) Then
                Me._error = objReglasFE.Error
                Exit Function
            End If

            Me._objetoObtenido = objReglasFE.ObjetoObtenido
            Me._listaObtenida = objReglasFE.ListaObtenida

            ObtenerObservaciones = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_DT() As DataTable
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ObtenerSolicitudesEnviar_DT(objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ObtenerSolicitudesEnviar_Lista() As List(Of Solicitud)
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ObtenerSolicitudesEnviar_Lista(objConexion)

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ValidarComprobanteEnvio(ByVal pIdSolicitud As Integer) As Boolean
        ValidarComprobanteEnvio = False
        Try
            Dim objReglasFE As IReglasFE
            Dim objConexion As New Conexion
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)

            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not objReglasFE.ValidarComprobanteEnvio(pIdSolicitud, objConexion) Then
                Me._error = objReglasFE.Error
                Exit Function
            End If

            ValidarComprobanteEnvio = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Public Overloads Function ValidarEstadoReproceso(ByVal pEstado As String) As Boolean
        ValidarEstadoReproceso = False
        Try
            Dim objReglasFE As IReglasFE
            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            Return objReglasFE.ValidarEstadoReproceso(pEstado)

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function


    Public Function ObtenerDatosUltimoComprobante(ByVal pPtoVta As String, ByVal pCbteTipo As String, ByVal pCbteNro As String) As String
        Dim objReglasFE As IReglasFE = Nothing
        Try

            Dim ptoVta, cbteTipo, cbteNro, milisegundos As Integer
            Dim dnSource, dnDestination, idServicioNegocio, cuitEmpresa, nombreCertificado, direccion As String
            Dim objConexion As New Conexion()
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)
            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not IsNumeric(pPtoVta) Then pPtoVta = "0"
            If Not IsNumeric(pCbteNro) Then pCbteNro = "0"
            If Not IsNumeric(pCbteTipo) Then pCbteTipo = "0"

            If pPtoVta.Trim.Equals("0") Then
                ptoVta = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "PTO_VTA")  'DEFAULT_PTO_VTA_ML
            Else
                ptoVta = CInt(pPtoVta)
            End If

            If pCbteTipo.Trim.Equals("0") Then
                cbteTipo = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "CBTE_TIPO")  'DEFAULT_CBTE_TIPO_ML
            Else
                cbteTipo = CInt(pCbteTipo)
            End If

            cbteNro = CInt(pCbteNro)

            dnSource = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "DNORIGEN")
            dnDestination = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "DNDESTINO")
            idServicioNegocio = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "SERVICIO")
            cuitEmpresa = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "CUIT_FONSECA")
            nombreCertificado = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "NOMBRE_CERTI")
            direccion = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "SERVICE_DIR")
            milisegundos = CInt(ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "TIEMPO_ESPERA"))

            Return objReglasFE.ObtenerDatosUltimoComprobante(ptoVta, cbteTipo, cbteNro, dnSource, dnDestination, idServicioNegocio, cuitEmpresa, _
                                                             nombreCertificado, direccion, milisegundos, objConexion)

        Catch ex As Exception
            If objReglasFE IsNot Nothing Then
                Me._error = objReglasFE.Error
                Me._objetoObtenido = objReglasFE.ObjetoObtenido
            End If
            Throw ex
        End Try
    End Function


    Public Function ReprocesarComprobante(ByVal pIdSolicitud As Integer) As Boolean
        ReprocesarComprobante = False
        Dim objReglasFE As IReglasFE = Nothing
        Try
            Dim objConexion As New Conexion()
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)
            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            If Not objReglasFE.ReprocesarComprobante(pIdSolicitud, objConexion) Then
                Me._error = objReglasFE.Error
                Exit Function
            End If

            Me._listaObtenida = objReglasFE.ListaObtenida
            Me._objetoObtenido = objReglasFE.ObjetoObtenido

            ReprocesarComprobante = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function

    Public Function SolicitarCAE(ByVal pIdSolicitud As Integer) As Boolean
        SolicitarCAE = False
        Dim objReglasFE As IReglasFE = Nothing
        Try

            Dim milisegundos As Integer
            Dim dnSource, dnDestination, idServicioNegocio, cuitEmpresa, nombreCertificado, direccion As String
            Dim objConexion As New Conexion()
            objConexion.SetConexion(_listaConexiones, _ambiente, _baseFacturacion, _tipoDeConexion)
            objReglasFE = ObtenerInstanciaObjeto(_ambienteAFIP, _tipoMercado)

            dnSource = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "DNORIGEN")
            dnDestination = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "DNDESTINO")
            idServicioNegocio = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "SERVICIO")
            cuitEmpresa = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "CUIT_FONSECA")
            nombreCertificado = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "NOMBRE_CERTI")
            direccion = ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "SERVICE_DIR")
            milisegundos = CInt(ConfiguracionFE.ObtenerValor(_listaConfiguracionFE, _ambienteAFIP, _tipoMercado, "TIEMPO_ESPERA"))

            If Not objReglasFE.SolicitarCAE(pIdSolicitud, dnSource, dnDestination, idServicioNegocio, nombreCertificado, direccion, cuitEmpresa, milisegundos, objConexion) Then
                Me._error = objReglasFE.Error
                Exit Function
            End If

            Me._listaObtenida = objReglasFE.ListaObtenida
            Me._objetoObtenido = objReglasFE.ObjetoObtenido

            SolicitarCAE = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function
End Class
