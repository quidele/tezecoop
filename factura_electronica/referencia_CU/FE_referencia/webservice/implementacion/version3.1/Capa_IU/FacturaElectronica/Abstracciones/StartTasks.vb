Imports FacturacionElectronica.FuncionesGenerales
Imports FacturacionElectronica
Imports fonseca_libDatos
Imports System.IO

Public Class StartTasks


    Private Const _pisarArchivos As Boolean = True
    Private Const _directorioAplicacion As String = "Facturacion Electronica WS"
    Private Const _rutaArchivoConfiguracionesFE As String = "ConfiguracionesFE.xml"
    Private Const _rutaArchivoConexiones As String = "ConexionesBD.xml"

    Private Const _baseDeSeguridad As String = "FacturaElectronica"
    Private Const _rutaArchivoConfig As String = "FE_config_conex.xml"


    Public Shared Sub DoStartUpTasks()
        Try

            Dim obj As New PrincipalFacturadorWebService()
            Dim isFirstRun As Boolean = False

            Log.StartLog(GetWindowsUser())

            Log.Logger(tipoLogging.Info, "_\/_ Comienzo de la aplicación _\/_")
            Log.Logger(tipoLogging.Info, "      Versión: " + GeneralFunctions.ObtenerVersionRealSistema.ToString)

            Dim personalFolder As String = Environment.GetFolderPath(Environment.SpecialFolder.Personal)
            Dim applicationDirectory As String = My.Application.Info.DirectoryPath
            If My.Application.IsNetworkDeployed Then isFirstRun = My.Application.Deployment.IsFirstRun()


            fonseca_libDatos.Log.Logger(tipoLogging.Check, "Gestión de archivos de configuración")

            obj.GestionarArchivosConfig(Environment.GetFolderPath(Environment.SpecialFolder.Personal), _directorioAplicacion, _rutaArchivoConfig, My.Application.Info.DirectoryPath,
                                        My.Application.IsNetworkDeployed, isFirstRun, _pisarArchivos, My.Computer.Network.IsAvailable)

            obj.GestionarArchivosLog(Configuration.ConfigurationManager.AppSettings("LOG_RUTA"))


            Log.Logger(tipoLogging.Check, "Obtiene conexiones.")
            Dim listaConexiones = obj.ObtenerConexiones(_rutaArchivoConexiones)

            Log.Logger(tipoLogging.Check, "Obtiene configuraciones FE.")

            Dim listaConfiguracionesFE = obj.ObtenerConfiguraciones(_rutaArchivoConfiguracionesFE)

            Log.Logger(tipoLogging.Check, "Gestión de archivos de configuración")

            obj.SetApplicationValues(_rutaArchivoConexiones, _rutaArchivoConfig, GeneralFunctions.ObtenerVersionRealSistema, _
                                  personalFolder, _directorioAplicacion, _baseDeSeguridad, My.Computer.Name, listaConfiguracionesFE)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub



End Class
