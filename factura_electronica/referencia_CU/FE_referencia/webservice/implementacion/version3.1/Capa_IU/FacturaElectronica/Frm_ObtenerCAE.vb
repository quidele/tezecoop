Imports FacturacionElectronica
Imports FacturacionElectronica.FuncionesGenerales
Imports fonseca_libDatos
Imports System.IO
Imports DAOFacturacionElectronica
Imports Fonseca_libFunciones
Imports fonseca_libDatos.Config


Public Class Frm_ObtenerCAE


    Private _listaConfiguracionesFE As List(Of ConfiguracionesFE)

    Private _tipoMercado As String = "ML"
    Private _ambienteAFIP As String = "PRODUCCION"

    Private Sub Frm_ObtenerCAE_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Console.WriteLine(Me.Name + "_Load")
        Try
            Me.Icon = Resources.Documento_ico

            ConfigurarDgv_cab_observaciones()

            ActualizarInformacionSistema_v2()

            RealizarBusqueda()

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btn_cab_actualizar_Click(sender As Object, e As EventArgs) Handles btn_cab_actualizar.Click
        Console.WriteLine("btn_cab_actualizar_Click")
        RealizarBusqueda()
    End Sub



    'Private Sub AbrirConfiguraciones_v2()
    '    Try

    '        Dim objConfiguracionMDI As Configuraciones = ObtenerObjetoConfiguracion(_rutaArchivoConfig)

    '        Dim appName As String = My.Application.Info.Title + " - Version: " + ObtenerVersionRealSistema().ToString

    '        Dim objListaConexiones As New List(Of Conexion)

    '        objListaConexiones = ObtenerConexiones(_rutaArchivoConexiones)

    '        Dim objFrm As New frm_config_v2(_usuario_Mod.ToString, _baseDatos.ToString, ObtenerVersionRealSistema().ToString, objListaConexiones, GetAmbiente(objConfiguracionMDI.ListaPropiedades), _
    '                                          Nothing, _tipoDeConexion, appName)

    '        objFrm.ObjConfiguraciones = objConfiguracionMDI
    '        objFrm.FormularioPadre = Me
    '        objFrm.RutaArchivoConfig = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfig
    '        objFrm.RutaArchivoPresets = "" 'Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfigPresets

    '        objFrm.StartPosition = FormStartPosition.CenterParent
    '        Dim ds As DialogResult = objFrm.ShowDialog()

    '        ActualizarInformacionSistema_v2()

    '    Catch ex As Exception
    '        Throw ex
    '    End Try
    'End Sub
    Private Sub AbrirConfiguraciones_v2()
        Try

            Dim objConfiguracionMDI As Configuraciones = ObtenerObjetoConfiguracion(ApplicationSettings.FileConfigPath)

            Dim appName As String = My.Application.Info.Title + " - Version: " + ObtenerVersionRealSistema().ToString

            Dim objListaConexiones As New List(Of Conexion)

            objListaConexiones = ObtenerConexiones(ApplicationSettings.FileConnectionsPath)

            Dim objFrm As New frm_config_v2(ApplicationSettings.UserID, ApplicationSettings.DataBase, ObtenerVersionRealSistema().ToString, objListaConexiones, GetAmbiente(objConfiguracionMDI.ListaPropiedades), _
                                              Nothing, ApplicationSettings.TipoDeConexion, appName)

            objFrm.ObjConfiguraciones = objConfiguracionMDI
            objFrm.FormularioPadre = Me
            objFrm.RutaArchivoConfig = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + ApplicationSettings.ApplicationDirectory + "\" + ApplicationSettings.ApplicationName
            objFrm.RutaArchivoPresets = "" 'Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfigPresets

            objFrm.StartPosition = FormStartPosition.CenterParent
            Dim ds As DialogResult = objFrm.ShowDialog()

            ActualizarInformacionSistema_v2()

        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Private Sub AbrirLogViewer()
        Try
            Dim objFrm As New fonseca_libDatos.LogViewer
            objFrm.BackgroundImage = Me.BackgroundImage
            objFrm.BackgroundImageLayout = Me.BackgroundImageLayout

            Dim ds As DialogResult = objFrm.ShowDialog()

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ' ''' <summary>
    ' ''' Muestra los datos de versión actualizados. Version_6.1
    ' ''' </summary>
    ' ''' <remarks></remarks>
    'Private Sub ActualizarInformacionSistema_v2()
    '    Try
    '        Log.Logger(tipoLogging.Check, "ActualizarInformacionSistema_v2")
    '        Dim objConexion As New Conexion
    '        Dim appName As String = My.Application.Info.Title + " - Version: " + ObtenerVersionRealSistema().ToString

    '        Dim objConfiguracionMDI As Configuraciones = ObtenerObjetoConfiguracion(_rutaArchivoConfig)

    '        Dim ambiente As String = GetAmbiente(objConfiguracionMDI.ListaPropiedades)
    '        Dim tipoConexion As String = GetTipoDeConexion(objConfiguracionMDI.ListaPropiedades)
    '        Dim ambienteAFIP As String = GetAmbienteAFIP(objConfiguracionMDI.ListaPropiedades)

    '        objConexion.SetConexion(_listaConexiones, ambiente, _baseDeSeguridad, tipoConexion)

    '        'loguearConexion(objConexion)

    '        Dim objPrincipalFacturadorWebService As New PrincipalFacturadorWebService(_listaConexiones, ambiente, tipoConexion, appName)

    '        _usuario_Mod = objPrincipalFacturadorWebService.ObtenerUID_Magma
    '        _baseDatos = objConexion.Nombre
    '        _tipoDeConexion = objConexion.TipoConexion
    '        _ambiente = ambiente.ToUpper
    '        _ambienteAFIP = ambienteAFIP

    '        Me.lbl_TS_Base.Text = " Base de seguridad: " + GetDataBaseFromConnectionString(objConexion.ConnectionString).ToUpper
    '        Me.lbl_TS_Version.Text = " Versión: " + ObtenerVersionRealSistema.ToString
    '        Me.lbl_TS_Usuario.Text = " Usuario: " + _usuario_Mod.ToUpper
    '        Me.lbl_TS_Ambiente.Text = " Ambiente: " + ambiente.ToUpper
    '        Me.lbl_TS_AmbienteAFIP.Text = " Ambiente AFIP: " + _ambienteAFIP.ToUpper

    '    Catch ex As Exception
    '        Throw ex
    '    End Try
    'End Sub

    ''' <summary>
    ''' Muestra los datos de versión actualizados. Version_6.1
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub ActualizarInformacionSistema_v2()
        Try

            'Dim objConfiguracionMDI As Configuraciones = ObtenerObjetoConfiguracion(_rutaArchivoConfig)
            Dim objConfiguracionMDI As Configuraciones = ObtenerObjetoConfiguracion(ApplicationSettings.FileConfigPath)

            Me.lbl_TS_Base.Text = " Base de seguridad: " + ApplicationSettings.DataBase
            Me.lbl_TS_Version.Text = " Versión: " + ApplicationSettings.Version
            Me.lbl_TS_Usuario.Text = " Usuario: " + ApplicationSettings.UserID
            Me.lbl_TS_Ambiente.Text = " Ambiente: " + ApplicationSettings.Ambiente
            Me.lbl_TS_AmbienteAFIP.Text = " Ambiente AFIP: " + GetAmbienteAFIP(objConfiguracionMDI.ListaPropiedades)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    ''' <summary>
    ''' Aplica el estilo de las grillas del formulario. Version_6.3
    ''' </summary>
    ''' <param name="dgv"></param>
    ''' <remarks>MVC-NA</remarks>
    Private Sub AplicarEstiloDeGrillas(ByVal dgv As DataGridView)
        Dim cs As New System.Windows.Forms.DataGridViewCellStyle

        Dim colorLineas As Color = Color.FromArgb(255, 251, 186)
        Dim colorBackground As Color = Color.FromArgb(255, 254, 244)
        cs.BackColor = colorLineas

        With dgv
            .EnableHeadersVisualStyles = False
            '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
            '.BackgroundColor = Color.FloralWhite
            .BackgroundColor = colorBackground
            .GridColor = Color.Gold

            'Las grillas de detalle no deben tener colores distintos
            If Not dgv.Name.Contains("det_") Then
                .AlternatingRowsDefaultCellStyle = cs
            End If

            .CellBorderStyle = DataGridViewCellBorderStyle.Single
            .ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing
            .ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter
            .ColumnHeadersDefaultCellStyle.Font = New Font("Tahoma", 10, FontStyle.Bold)
            .ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Raised
            .ColumnHeadersDefaultCellStyle.BackColor = Color.LightGoldenrodYellow
            .ColumnHeadersHeight = 34

        End With

    End Sub

    Private Sub CargarObjetoObservaciones(ByVal pObjeto As Object)
        Try
            Dim objObservaciones As Observaciones

            If pObjeto Is Nothing Then Exit Sub

            If Not TypeOf pObjeto Is observaciones Then Exit Sub

            objObservaciones = CType(pObjeto, observaciones)

            dgv_cab_observaciones.Rows.Add(New Object() {objObservaciones.code, objObservaciones.msg})

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub ConfigurarDgv_cab_observaciones()
        Try
            With dgv_cab_observaciones
                .Columns.Add("code", "Código")
                .Columns.Add("msg", "Descripción")
                .Columns("msg").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
                .EditMode = DataGridViewEditMode.EditProgrammatically
                .ReadOnly = True
                .SelectionMode = DataGridViewSelectionMode.RowHeaderSelect
                .AllowUserToDeleteRows = False
                .AllowUserToResizeRows = False
                .AllowUserToAddRows = False
                .AllowUserToOrderColumns = False

                AplicarEstiloDeGrillas(.InnerDGV)

            End With



        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub ConsultarComprobante()
        Dim objReglasFE As ReglasFacturacionElectronica = Nothing
        Try
            Dim defaultPtoVta As String = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "PTO_VTA")
            Dim defaultCbteTipo As String = ConfiguracionesFE.ObtenerValor(ApplicationSettings.ConfiguracionesFE, _ambienteAFIP, _tipoMercado, "CBTE_TIPO")
            Dim defaultCbteNro As String = "0"
            Dim cadenaResultado As String

            Dim objFrm As New Frm_BusquedaCbtes(defaultPtoVta, defaultCbteTipo, defaultCbteNro)
            objReglasFE = New ReglasFacturacionElectronica()


            Dim respuesta As DialogResult

            objFrm.StartPosition = FormStartPosition.CenterParent
            respuesta = objFrm.ShowDialog

            If respuesta = Windows.Forms.DialogResult.OK Then
                cadenaResultado = objReglasFE.ObtenerDatosUltimoComprobante(objFrm.PtoVta, objFrm.TipoCbte, objFrm.NroCbtes)
                MessageBox.Show(cadenaResultado)
            End If



        Catch ex As ObjectResultException
            Dim msg As String = String.Empty
            msg = ex.Message

            If ex.ObjectThrown IsNot Nothing Then
                dgv_cab_observaciones.Rows.Clear()
                CargarObjetoObservaciones(CType(ex.ObjectThrown, observaciones))
            End If

            If ex.InnerException IsNot Nothing Then
                If ex.InnerException.ToString.Contains("(407)") Then msg += vbCrLf + "Intente nuevamente."
            End If

            MessageBox.Show(msg, "Advertencia.", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    'Private Sub GestionarArchivosConfig()
    '    Try


    '        If Not Directory.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion) Then
    '            Directory.CreateDirectory(Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion)
    '        End If

    '        If Not My.Application.IsNetworkDeployed OrElse Not My.Computer.Network.IsAvailable Then
    '            Exit Sub
    '        End If

    '        'Si el archivo fue borrado por el usuario lo vuelve a copiar a la ruta por defecto, Si es la primera ejecucion del programa y la variable
    '        'pisarArchivos está en TRUE. Se copia el archivo de configuracion a la ruta por defecto.
    '        If (My.Application.Deployment.IsFirstRun() AndAlso _pisarArchivos = True) OrElse (Not File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfig)) Then
    '            Log.Logger(tipoLogging.Info, "Copiando desde " + My.Application.Info.DirectoryPath + "\" + _rutaArchivoConfig)
    '            Log.Logger(tipoLogging.Info, "Copiando hasta " + Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfig)
    '            File.Copy(My.Application.Info.DirectoryPath + "\" + _rutaArchivoConfig, Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + _rutaArchivoConfig, True)
    '        End If

    '    Catch ex As Exception
    '        Throw ex
    '    End Try
    'End Sub

    'Private Sub GestionarArchivosLog(p1 As String)
    '    Try

    '        Dim objPrincipalFacturadorWebService As New PrincipalFacturadorWebService(_listaConexiones, _ambiente, _tipoDeConexion, Me.Name)

    '        objPrincipalFacturadorWebService.GestionarArchivosLog(p1)


    '    Catch ex As Exception
    '        MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
    '    End Try
    'End Sub



    ' ''' <summary>
    ' ''' Obtiene una lista de objetos de tipo ConfiguracionFE a partir del XML de la aplicación. Version_6.1
    ' ''' </summary>
    ' ''' <remarks></remarks>
    'Private Function ObtenerConfiguraciones(ByVal pRutaArchivoConfiguraciones As String) As List(Of ConfiguracionFE)
    '    Try
    '        Dim lista As List(Of ConfiguracionFE)
    '        Dim objGestionXML As New GestionXML(pRutaArchivoConfiguraciones)

    '        lista = New List(Of ConfiguracionFE)
    '        lista = CType(objGestionXML.ObtenerObjetoDesdeXML(lista.GetType()), Global.System.Collections.Generic.List(Of Global.FacturacionElectronica.ConfiguracionFE))

    '        Return lista

    '    Catch ex As Exception
    '        Throw New Exception("No se obtuvieron datos de conexion. Falta el archivo """ + pRutaArchivoConfiguraciones + """." + vbCrLf + " Error extendido: ")
    '    End Try
    'End Function

    ' ''' <summary>
    ' ''' Obtiene un objeto de tipo Configuracion para frm_mdi_principal. Version_6.3
    ' ''' </summary>
    ' ''' <returns></returns>
    ' ''' <remarks>MVC-Ok</remarks>
    'Private Function ObtenerObjetoConfiguracion(ByVal pFileName As String) As Configuraciones
    '    Try
    '        Dim path As String = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + _directorioAplicacion + "\" + pFileName

    '        Log.Logger(tipoLogging.Check, "Obteniendo archivo de configuracion desde " + path)
    '        Dim objGestorXML As New GestionXML(path)
    '        Dim objConfiguraciones As New Configuraciones

    '        objConfiguraciones = CType(objGestorXML.ObtenerObjetoDesdeXML(objConfiguraciones.GetType()), Configuraciones)
    '        Log.Logger(tipoLogging.Info, objConfiguraciones.ListaPropiedades.Count.ToString() + " Propiedades encontradas.")

    '        Return objConfiguraciones

    '    Catch ex As Exception
    '        Throw ex
    '    End Try
    'End Function
    ''' <summary>
    ''' Obtiene un objeto de tipo Configuracion para frm_mdi_principal. Version_6.3
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Private Function ObtenerObjetoConfiguracion(ByVal pFileName As String) As Configuraciones
        Try
            Dim path As String = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "\" + ApplicationSettings.ApplicationDirectory + "\" + pFileName

            Log.Logger(tipoLogging.Check, "Obteniendo archivo de configuracion desde " + path)
            Dim objGestorXML As New GestionXML(path)
            Dim objConfiguraciones As New Configuraciones

            objConfiguraciones = CType(objGestorXML.ObtenerObjetoDesdeXML(objConfiguraciones.GetType()), Configuraciones)
            Log.Logger(tipoLogging.Info, objConfiguraciones.ListaPropiedades.Count.ToString() + " Propiedades encontradas.")

            Return objConfiguraciones

        Catch ex As Exception
            Throw ex
        End Try
    End Function
    ''' <summary>
    ''' Version_6.1
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function ObtenerVersionRealSistema() As String
        Try
            Log.Logger(tipoLogging.Check, "ObtenerVersionRealSistema")
            Dim version As String

            If My.Computer.Network.IsAvailable AndAlso My.Application.IsNetworkDeployed Then
                Log.Logger(tipoLogging.Check, "IsNetworkDeployed = TRUE")
                Log.Logger(tipoLogging.Check, "Network.IsAvailable = TRUE")
                version = My.Application.Deployment.CurrentVersion.ToString
            Else
                If Not My.Computer.Network.IsAvailable Then
                    Log.Logger(tipoLogging.Check, "Network.IsAvailable = FALSE")
                End If
                If Not My.Application.IsNetworkDeployed Then
                    Log.Logger(tipoLogging.Check, "IsNetworkDeployed = FALSE")
                End If
                version = Application.ProductVersion
            End If

            Return version

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Sub ProcesarEnvioAfip(ByVal pIdSolicitud As Integer)
        Dim objReglasFE As ReglasFacturacionElectronica = Nothing
        Try

            objReglasFE = New ReglasFacturacionElectronica()

            dgv_cab_observaciones.Rows.Clear()

            objReglasFE.ValidarComprobanteEnvio(pIdSolicitud)

            'Inserta la solicitud a comprobantes para enviar.
            If Not objReglasFE.InsertarComprobantes(pIdSolicitud) Then
                MessageBox.Show(objReglasFE.Error, "Error de inserción.", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Sub
            End If

            CargarObjetoObservaciones(objReglasFE.ObtenerObservaciones(pIdSolicitud).FirstOf)

            Dim list As List(Of observaciones) = objReglasFE.SolicitarCAE(pIdSolicitud)

            For Each elemento As observaciones In list
                CargarObjetoObservaciones(elemento)
            Next

            MessageBox.Show("CAE obtenido correctamente desde AFIP", "Exito", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)

        Catch ex As ValidationException
            MessageBox.Show(objReglasFE.Error, "Validación.", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Finally
            RealizarBusqueda()
        End Try
    End Sub

    Private Sub RealizarBusqueda()
        Try
            Dim objReglasFacturacionElectronica As New ReglasFacturacionElectronica()
            Dim objDT As New DataTable
            'dgv_cab_Solicitudes.Rows.Clear()

            objDT = objReglasFacturacionElectronica.ObtenerSolicitudesEnviar_DT()

            dgv_cab_Solicitudes.Datasource = objDT

            dgv_cab_Solicitudes.Columns(5).AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells
            dgv_cab_Solicitudes.Columns(4).AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells
            dgv_cab_Solicitudes.Columns(3).AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill

            AplicarEstiloDeGrillas(dgv_cab_Solicitudes.InnerDGV)

            dgv_cab_Solicitudes.Sort(dgv_cab_Solicitudes.Columns("Solicitud"), System.ComponentModel.ListSortDirection.Ascending)
            lbl_cab_mensaje.Text = objDT.Rows.Count.ToString + " Registro(s)."

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub ReprocesarEnvioMagma(ByVal pIdSolicitud As Integer)
        Try

            Dim objReglasFE As New ReglasFacturacionElectronica()

            dgv_cab_observaciones.Rows.Clear()

            Dim obs As observaciones = objReglasFE.ReprocesarComprobante(pIdSolicitud)

            CargarObjetoObservaciones(obs)

            MessageBox.Show("Datos modificados correctamente en Magma.", "Exito", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Finally
            RealizarBusqueda()
        End Try
    End Sub

    Private Sub SalirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SalirToolStripMenuItem.Click
        Me.Close()
    End Sub



    Private Sub AbrirMenuContextual(pRowIndex As Integer, pLocX As Integer, pLocY As Integer)
        Try
            Dim objReglasFacturacionElectronica As New ReglasFacturacionElectronica()
            Dim estado As String

            estado = dgv_cab_Solicitudes.Rows(pRowIndex).Cells("Estado").FormattedValue.ToString

            objReglasFacturacionElectronica.ValidarEstadoReproceso(estado)

        Catch ex As ValidationException
            cms_solicitudes.Show(pLocX, pLocY)
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnReprocesar_Click(sender As Object, e As EventArgs) Handles btnReprocesar.Click
        Try
            If dgv_cab_Solicitudes.SelectedRows.Count = 0 Then Exit Sub

            Dim respuesta As DialogResult
            Dim nroDoc As Integer = CInt(dgv_cab_Solicitudes.SelectedRows(0).Cells("Número").FormattedValue.ToString)
            Dim codDoc As String = dgv_cab_Solicitudes.SelectedRows(0).Cells("Documento").FormattedValue.ToString
            Dim idSolicitud As Integer = CInt(dgv_cab_Solicitudes.SelectedRows(0).Cells("Solicitud").Value.ToString)

            respuesta = MessageBox.Show("Ha solicitado la actualización de Magma para el comprobante " + codDoc + " N° " + CStr(nroDoc) + vbCrLf + _
                                        "¿Está seguro de que desea reprocesar? ", "Confirmación", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1)

            If respuesta = Windows.Forms.DialogResult.No Then
                Exit Sub
            End If

            ReprocesarEnvioMagma(idSolicitud)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnConsultarCbtes_Click(sender As Object, e As EventArgs) Handles btnConsultarCbtes.Click
        Try
            ConsultarComprobante()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub btnProcesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnProcesar.Click
        Try
            If dgv_cab_Solicitudes.SelectedRows.Count = 0 Then Exit Sub
            Dim respuesta As DialogResult
            Dim nroDoc As Integer = CInt(dgv_cab_Solicitudes.SelectedRows(0).Cells("Número").FormattedValue.ToString)
            Dim codDoc As String = dgv_cab_Solicitudes.SelectedRows(0).Cells("Documento").FormattedValue.ToString
            Dim idSolicitud As Integer = CInt(dgv_cab_Solicitudes.SelectedRows(0).Cells("Solicitud").Value.ToString)

            respuesta = MessageBox.Show("Ha solicitado el envío del comprobante " + codDoc + " N° " + CStr(nroDoc) + vbCrLf + _
                                        "¿Está seguro de que desea enviar esa información a AFIP? ", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1)

            '("Solicitud")("Documento")("Titular")("Serie")("Número")("Importe")("Estado")

            If respuesta = Windows.Forms.DialogResult.No Then
                Exit Sub
            End If

            ProcesarEnvioAfip(idSolicitud)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub





    Private Sub ConfiguraciónToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ConfiguraciónToolStripMenuItem.Click
        Try
            'AbrirConfiguraciones()
            AbrirConfiguraciones_v2()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub dgv_cab_Solicitudes_MouseClick(sender As Object, e As MouseEventArgs) Handles dgv_cab_Solicitudes.MouseClick
        Try

            If dgv_cab_Solicitudes.SelectedRows.Count < 1 Then
                Exit Sub
            End If

            If e.Button = Windows.Forms.MouseButtons.Right Then
                AbrirMenuContextual(dgv_cab_Solicitudes.SelectedRows(0).Index, MousePosition.X, MousePosition.Y)
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub dgv_cab_Solicitudes_MouseDoubleClick(sender As Object, e As MouseEventArgs) Handles dgv_cab_Solicitudes.MouseDoubleClick
        btnProcesar_Click(sender, e)
    End Sub
    Private Sub VisorDeLogsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VisorDeLogsToolStripMenuItem.Click
        AbrirLogViewer()
    End Sub

    ''<<Version 2.1.3>>
    Private Sub DGV_listaComprobantes_SortCompare(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewSortCompareEventArgs) Handles dgv_cab_Solicitudes.SortCompare
        Dim a As DataGridViewColumn = CType(e.Column, DataGridViewColumn)
        Dim dgv As DataGridView = CType(sender, DataGridView)

        For Each col As DataGridViewColumn In dgv.Columns
            col.DefaultCellStyle.BackColor = Color.White
        Next
        a.DefaultCellStyle.BackColor = Color.FloralWhite

        If e.CellValue1 Is Nothing Or e.CellValue2 Is Nothing Then
            Exit Sub
        End If

        If IsNumeric(e.CellValue1.ToString) Then
            e.SortResult = e.NumberCompare
            e.Handled = True
            Exit Sub
        End If

        If IsDate(e.CellValue1.ToString) Then
            e.SortResult = e.DateCompare
            e.Handled = True
            Exit Sub
        End If

    End Sub



End Class