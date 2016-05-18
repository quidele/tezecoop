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

    ''' <summary>
    ''' Obtiene la clave de administrador para una aplicacion y formulario. Version_6.3
    ''' </summary>
    ''' <param name="pAplicacion"></param>
    ''' <param name="pFormulario"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Public Function ObtenerClaveAdministrador(ByVal pAplicacion As String, ByVal pFormulario As String) As Boolean
        ObtenerClaveAdministrador = False
        Try

            Dim objAdmSistemaMagma As New AdmSistemaMagma(_listaConexiones, _ambiente, _tipoDeConexion, _appName)

            Dim objConexion As New Conexion()
            objConexion.SetConexion(_listaConexiones, _ambiente, "Magma_ERP", _tipoDeConexion)

            'Obtiene los registros de cabecera obtenidos en el rango de fecha indicado.
            If Not objAdmSistemaMagma.ObtenerClaveDeAdministrador(pAplicacion, pFormulario, objConexion) Then
                Me._error = objAdmSistemaMagma.Error
                Exit Function
            End If

            'Obtenemos la lista de ordenes.
            _objetoObtenido = CType(objAdmSistemaMagma.ObjetoObtenido, ct_clavesAdmin).password

            ObtenerClaveAdministrador = True

        Catch ex As Exception
            Me._error = ex.Message
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
            Dim objAdmLibDatos As New AdmLibDatos(_listaConexiones, _ambiente, _tipoDeConexion, _appName)

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

            Dim objAdmSistemaMagma As New AdmSistemaMagma(_listaConexiones, _ambiente, _tipoDeConexion, _appName)

            If Not objAdmSistemaMagma.RealizarConsultaDePrueba(objConexion) Then
                Me._error = objAdmSistemaMagma.Error
                Exit Function
            End If

            RealizarConsultaDePrueba = True

        Catch ex As Exception
            Me._error = ex.Message
        End Try
    End Function


End Class
