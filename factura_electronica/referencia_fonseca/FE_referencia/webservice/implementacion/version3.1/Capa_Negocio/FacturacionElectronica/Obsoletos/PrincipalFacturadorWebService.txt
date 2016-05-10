Imports fonseca_libDatos
Imports DAOSistemaMagma
Imports System.IO

Public Class PrincipalFacturadorWebService

    Private Const _baseDeSeguridad As String = "Base_Seguridad"
    Private _error As String
    Private _objetoObtenido As Object
    Private _listaObtenida As ArrayList

    Private _listaConexiones As List(Of Conexion)
    Private _ambiente As String
    Private _tipoDeConexion As String
    Private _appName As String

    Private Property [MyError]() As String
        Get
            Return _error
        End Get
        Set(ByVal value As String)
            _error = value
            Log.Logger(tipoLogging.Error, value)
        End Set
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
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Sub New(ByVal pListaConexiones As List(Of Conexion), ByVal pAmbiente As String, ByVal pTipoDeConexion As String, pAppName As String)
        _listaConexiones = pListaConexiones
        _ambiente = pAmbiente
        _tipoDeConexion = pTipoDeConexion
        _appName = pAppName
    End Sub
    Sub New()

    End Sub

    Public Sub GestionarArchivosLog(ByVal pPath As String)
        Try
            Log.Logger(tipoLogging.Info, "PrincipalGestionFonseca - GestionarArchivosLog")
            Dim listaArchivos As New ArrayList
            Dim folder As New DirectoryInfo(pPath)
            Log.Logger(tipoLogging.Check, "Revisando carpeta de logs: " + pPath)
            Log.Logger(tipoLogging.Check, folder.GetFiles().Count.ToString + " archivos encontrados.")

            For Each file As FileInfo In folder.GetFiles()

                If Not file.Extension.ToUpper.Contains("LOG") Then
                    Continue For
                End If

                If file.LastWriteTime().AddDays(30) < Date.Now Then
                    listaArchivos.Add(file.Name)
                End If

            Next

            If listaArchivos.Count = 0 Then
                Log.Logger(tipoLogging.Check, "No hay archivos para procesar")
                Exit Sub
            End If

            Log.Logger(tipoLogging.Check, listaArchivos.Count.ToString + " archivos para eliminar.")

            For Each archivo As String In listaArchivos
                Log.Logger(tipoLogging.Check, "Eliminando archivo: " + pPath + archivo)
                File.Delete(pPath + archivo)
            Next

        Catch ex As Exception
            Log.Logger(tipoLogging.Error, ex.Message)
        End Try
    End Sub

    ' ''' <summary>
    ' ''' Obtiene la clave de administrador para una aplicacion y formulario. Version_6.3
    ' ''' </summary>
    ' ''' <param name="pAplicacion"></param>
    ' ''' <param name="pFormulario"></param>
    ' ''' <returns></returns>
    ' ''' <remarks>MVC-Ok</remarks>
    'Public Function ObtenerClaveAdministrador(ByVal pAplicacion As String, ByVal pFormulario As String) As Boolean
    '    ObtenerClaveAdministrador = False
    '    Try

    '        Dim objAdmSistemaMagma As New AdmSistemaMagma()

    '        Dim objConexion As New Conexion("Magma_ERP")

    '        'Obtiene los registros de cabecera obtenidos en el rango de fecha indicado.
    '        If Not objAdmSistemaMagma.ObtenerClaveDeAdministrador(pAplicacion, pFormulario, objConexion) Then
    '            Me._error = objAdmSistemaMagma.Error
    '            Exit Function
    '        End If

    '        'Obtenemos la lista de ordenes.
    '        _objetoObtenido = CType(objAdmSistemaMagma.ObjetoObtenido, ct_clavesAdmin).password

    '        ObtenerClaveAdministrador = True

    '    Catch ex As Exception
    '        Me._error = ex.Message
    '    End Try
    'End Function
    ''' <summary>
    ''' Obtiene la clave de administrador para una aplicacion y formulario. Version_6.3
    ''' </summary>
    ''' <param name="pAplicacion"></param>
    ''' <param name="pFormulario"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Public Function ObtenerClaveAdministrador(ByVal pAplicacion As String, ByVal pFormulario As String) As List(Of ct_clavesAdmin)
        Try
            Dim objAdmSistemaMagma As New AdmSistemaMagma()
            Dim objConexion As New Conexion(_baseDeSeguridad)
            Dim list As New List(Of ct_clavesAdmin)

            list = objAdmSistemaMagma.Obtener(New ct_clavesAdmin() With {.nom_aplicacion = pAplicacion, .formulario_tr = pFormulario}, objConexion).Cast(Of ct_clavesAdmin).ToList()

            Return list

        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Obtener el User ID de magma. Version_6.3
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Public Function ObtenerUID_Magma() As String
        Try
            Dim usuario As String

            Dim objAdmLibDatos As New AdmLibDatos()

            usuario = objAdmLibDatos.ObtenerUID_Magma()

            Return usuario

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function RealizarConsultaDePrueba(ByVal pNombreBase As String) As Boolean
        RealizarConsultaDePrueba = False
        Me._error = String.Empty
        Try

            Dim objConexion As New Conexion()
            objConexion.SetConexion(_listaConexiones, _ambiente, pNombreBase, _tipoDeConexion)

            Dim objAdmSistemaMagma As New AdmSistemaMagma()

            objAdmSistemaMagma.RealizarConsultaDePrueba(objConexion)

            RealizarConsultaDePrueba = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function






    Public Sub GestionarArchivosConfig(personalFolder As String, applicationPath As String, configFilePath As String, applicationCurrentPath As String,
                                       isNetworkDeployed As Boolean, isFirstRun As Boolean, pisarArchivos As Boolean, isNetworkAvailable As Boolean)
        Try

            Dim directorioAplicacion As String = personalFolder + "\" + applicationPath
            Dim archivoAplicacion As String = directorioAplicacion + "\" + configFilePath

            If Not Directory.Exists(directorioAplicacion) Then Directory.CreateDirectory(directorioAplicacion)

            If Not isNetworkDeployed OrElse Not isNetworkAvailable Then Exit Sub

            'Si el archivo fue borrado por el usuario lo vuelve a copiar a la ruta por defecto, Si es la primera ejecucion del programa y la variable
            'pisarArchivos está en TRUE. Se copia el archivo de configuracion a la ruta por defecto.

            If (isFirstRun AndAlso pisarArchivos = True) OrElse (Not File.Exists(archivoAplicacion)) Then

                Log.Logger(tipoLogging.Info, "Copiando desde " + applicationCurrentPath + "\" + configFilePath)
                Log.Logger(tipoLogging.Info, "Copiando hasta " + archivoAplicacion)

                File.Copy(applicationCurrentPath + "\" + configFilePath, archivoAplicacion, True)

            End If

        Catch ex As Exception
            Throw ex
        End Try
    End Sub


    ''' <summary>
    ''' Obtiene una lista de objetos de tipo Conexion a partir del XML de la aplicación. Version_6.1
    ''' </summary>
    ''' <remarks></remarks>
    Public Function ObtenerConexiones(ByVal pRutaArchivoConexiones As String) As List(Of Conexion)
        Try
            Dim lista As List(Of Conexion)
            Dim objGestionXML As New GestionXML(pRutaArchivoConexiones)

            lista = New List(Of Conexion)
            lista = CType(objGestionXML.ObtenerObjetoDesdeXML(lista.GetType()), Global.System.Collections.Generic.List(Of Global.fonseca_libDatos.Conexion))

            Return lista

        Catch ex As Exception
            Throw New Exception("No se obtuvieron datos de conexion. Falta el archivo """ + pRutaArchivoConexiones + """." + vbCrLf + " Error extendido: ")
        End Try
    End Function

    ''' <summary>
    ''' Obtiene una lista de objetos de tipo ConfiguracionFE a partir del XML de la aplicación. Version_6.1
    ''' </summary>
    ''' <remarks></remarks>
    Public Function ObtenerConfiguraciones(ByVal pRutaArchivoConfiguraciones As String) As List(Of ConfiguracionesFE)
        Try
            Dim lista As List(Of ConfiguracionesFE)
            Dim objGestionXML As New GestionXML(pRutaArchivoConfiguraciones)

            lista = New List(Of ConfiguracionesFE)
            lista = CType(objGestionXML.ObtenerObjetoDesdeXML(lista.GetType()), List(Of ConfiguracionesFE))

            Return lista

        Catch ex As Exception
            Throw New Exception("No se obtuvieron datos de conexion. Falta el archivo """ + pRutaArchivoConfiguraciones + """." + vbCrLf + " Error extendido: ")
        End Try
    End Function

    Sub SetApplicationValues(pConnectionFilePath As String, pConfigFilePath As String, pVersion As String, pSpecialFolder As String, pAppPath As String, pBaseDeSeguridad As String,
                             pTerminal As String, listaConfiguracionesFE As List(Of ConfiguracionesFE))
        Try
            SetApplicationValues(pConnectionFilePath, pConfigFilePath, pVersion, _
                                   pSpecialFolder, pAppPath, pBaseDeSeguridad, pTerminal)

            ApplicationSettings.ConfiguracionesFE = listaConfiguracionesFE

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub SetApplicationValues(pConnectionFilePath As String, pConfigFilePath As String, pVersion As String, _
                                    pSpecialFolder As String, pAppPath As String, pBaseDeSeguridad As String, pTerminal As String)
        Try
            'Estas variables son fijas y solo deberian setearse al inicio de la aplicación
            ApplicationSettings.ApplicationName = GetApplicationTitle()
            ApplicationSettings.ApplicationDirectory = pAppPath
            ApplicationSettings.FileConfigPath = pConfigFilePath
            ApplicationSettings.FileConnectionsPath = pConnectionFilePath
            ApplicationSettings.SecurityDataBaseName = pBaseDeSeguridad
            ApplicationSettings.EnvironmentFolderPersonal = pSpecialFolder
            ApplicationSettings.Version = pVersion
            ApplicationSettings.Terminal = pTerminal
            ApplicationSettings.DefaultFormNameSize = 16
            'Estas variables pueden cambiar al seleccionar una diferente configuracion
            UpdateApplicationValues(ObtenerObjetoConfiguracion(ApplicationSettings.CompletePathConfigFile))

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Sub UpdateApplicationValues(pConfig As Config.Configuraciones)
        Try
            ApplicationSettings.Configuraciones = pConfig
            Log.Logger(tipoLogging.Check, "Obtiene conexiones.")
            ApplicationSettings.ListaConexiones = FuncionesGenerales.ObtenerConexiones(ApplicationSettings.FileConnectionsPath)
            ApplicationSettings.UserID = FuncionesGenerales.GetWindowsUser()
            'O tambien se puede incluir la funcion de busqueda de ambiente en la clase abstracta
            ApplicationSettings.Ambiente = FuncionesGenerales.GetAmbiente(ApplicationSettings.Configuraciones.ListaPropiedades)
            ApplicationSettings.TipoDeConexion = FuncionesGenerales.GetTipoDeConexion(ApplicationSettings.Configuraciones.ListaPropiedades)
            ApplicationSettings.DataBase = New Conexion(ApplicationSettings.SecurityDataBaseName).Nombre

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Function GetApplicationTitle() As String
        Try
            Dim title As String

            If My.Application.Info.Title <> "" Then
                title = My.Application.Info.Title
            Else
                title = System.IO.Path.GetFileNameWithoutExtension(My.Application.Info.AssemblyName)
            End If

            Return title

        Catch ex As Exception
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Obtiene un objeto de tipo Configuracion para frm_mdi_principal. Version_6.1
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function ObtenerObjetoConfiguracion(ByVal pRutaArchivo As String) As Config.Configuraciones
        Try
            Dim objGestorXML As New GestionXML()
            Dim objConfig As New Config.Configuraciones

            objGestorXML.ArchivoPath = pRutaArchivo

            objConfig = CType(objGestorXML.ObtenerObjetoDesdeXML(objConfig.GetType()), Config.Configuraciones)

            Return objConfig

        Catch ex As Exception
            MyError = ex.Message
            Throw ex
        End Try
    End Function

   

End Class
