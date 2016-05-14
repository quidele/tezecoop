Imports DAOFacturacionElectronica
Imports fonseca_libDatos

Public Interface IReglasFE

    ReadOnly Property [Error] As String
    ReadOnly Property ListaObtenida As ArrayList
    ReadOnly Property ObjetoObtenido As Object

    Function InsertarComprobantes(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
    Function ObtenerObservaciones(ByVal pIdSolicitudes As Integer, ByRef pObjConexiones As Conexion) As Boolean
    Function ObtenerSolicitudesEnviar_DT(ByRef pObjConexion As Conexion) As DataTable
    Function ObtenerSolicitudesEnviar_Lista(ByRef pObjConexion As Conexion) As List(Of Solicitud)
    Function ObtenerDatosUltimoComprobante(ByVal pPtoVta As Integer, ByVal pCbteTipo As Integer, ByVal pCbteNro As Integer, ByVal pDnSource As String, _
                                           ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, ByVal pCuitEmpresa As String, _
                                           ByVal pNombreCertificado As String, ByVal pDireccion As String, ByVal pMilisegundos As Integer, ByRef pObjConexion As Conexion) As String
    Function ObtenerComprobanteFE(ByVal pPtoVta As Integer, ByVal pCbteTipo As Integer, ByVal pCbteNro As Integer, ByVal pDnSource As String, _
                                      ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, ByVal pCuitEmpresa As String, _
                                      ByVal pNombreCertificado As String, ByVal pDireccion As String, ByVal pMilisegundos As Integer, ByRef pObjConexion As Conexion) As Comprobantes_ml
    Function ReprocesarComprobante(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
    Function SolicitarCAE(ByVal pIdSolicitud As Integer, ByVal pDnSource As String, ByVal pDnDestination As String, ByVal pIdServicioNegocio As String, ByVal pNombreCertificado As String, _
                          ByVal pDireccion As String, ByVal pCuitEmpresa As String, ByVal pMilisegundos As Integer, ByRef pObjConexion As Conexion) As Boolean

    Function ValidarComprobanteEnvio(ByVal pIdSolicitud As Integer, ByRef pObjConexion As Conexion) As Boolean
    Function ValidarEstadoReproceso(ByVal pEstado As String) As Boolean
End Interface
