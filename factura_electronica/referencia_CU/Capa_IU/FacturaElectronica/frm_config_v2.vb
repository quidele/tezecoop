Imports Fonseca_lib_controles
Imports fonseca_libDatos
Imports FacturacionElectronica


Public Class frm_config_v2

    Private _usuarioMod As String
    Private _baseDatos As String
    Private _version As String
    Private _ambiente As String
    Private _listaSeguridad As List(Of Seguridad)
    Private _tipoDeConexion As String
    Private _appName As String

    Private _configuracionResultado As Configuraciones
    Private _objConfiguraciones As Configuraciones
    Private _objPresets As Configuraciones
    Private _clave As String
    Private _listaConexiones As List(Of Conexion)
    Private _rutaArchivoConfig As String
    Private _rutaArchivoPresets As String
    Private _nombreFormulario As String

    Public Property ListaConexiones() As List(Of Conexion)
        Get
            Return _listaConexiones
        End Get
        Set(ByVal value As List(Of Conexion))
            _listaConexiones = value
        End Set
    End Property
    Public WriteOnly Property RutaArchivoConfig() As String
        Set(ByVal value As String)
            _rutaArchivoConfig = value
        End Set
    End Property
    Public WriteOnly Property RutaArchivoPresets() As String
        Set(ByVal value As String)
            _rutaArchivoPresets = value
        End Set
    End Property
    Public WriteOnly Property ObjConfiguraciones() As Configuraciones
        Set(ByVal value As Configuraciones)
            _objConfiguraciones = value
        End Set
    End Property
    Public WriteOnly Property ObjPresets() As Configuraciones
        Set(ByVal value As Configuraciones)
            _objPresets = value
        End Set
    End Property
    Public WriteOnly Property FormularioPadre() As Form
        Set(ByVal value As Form)
            _nombreFormulario = value.AccessibleName
        End Set
    End Property

    ''' <summary>
    ''' Constructor usado para obtener el accesibleName, pero no sirve para abrir el form.
    ''' </summary>
    ''' <remarks></remarks>
    Sub New()
        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()
    End Sub

    ''' <summary>
    ''' Constructor verdadero. Los parámetros son indispensables.
    ''' </summary>
    ''' <param name="pUsuario"></param>
    ''' <param name="pBase"></param>
    ''' <param name="pVersion"></param>
    ''' <param name="pListaConexiones"></param>
    ''' <param name="pAmbiente"></param>
    ''' <remarks></remarks>
    Sub New(ByVal pUsuario As String, ByVal pBase As String, ByVal pVersion As String, _
          ByVal pListaConexiones As List(Of Conexion), ByVal pAmbiente As String, _
          ByVal pListaSeguridad As List(Of Seguridad), ByVal pTipoConexion As String, pAppName As String)

        ' Llamada necesaria para el Diseñador de Windows Forms.
        InitializeComponent()

        _usuarioMod = pUsuario
        _baseDatos = pBase
        _version = pVersion
        _listaConexiones = pListaConexiones
        _ambiente = pAmbiente
        _listaSeguridad = pListaSeguridad
        _tipoDeConexion = pTipoConexion
        _appName = pAppName
    End Sub

    Private Sub frm_config_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.Icon = Resources.Ejecutar_2
            Me.MaximumSize = Me.Size
            Me.MinimumSize = Me.Size

            _clave = ObtenerClaveAdministrador()

            ConfigurarControles(_listaConexiones, _objConfiguraciones)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnAceptar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAceptar.Click
        Try

            Dim objConfiguraciones_nuevo As Configuraciones

            objConfiguraciones_nuevo = ActualizarNuevosValores(_objConfiguraciones, cmb_conf_ambiente.Text, cmb_conf_tipoConexion.Text, cmb_conf_ambienteAFIP.Text)

            If Not ValidarClave(_clave) Then
                Exit Sub
            End If

            If Not ValidarConexionSeleccionada(_listaConexiones, cmb_conf_ambiente.Text, cmb_conf_tipoConexion.Text) Then
                Throw New Exception("No existe ninguna conexión disponible con la configuración seleccionada.")
            End If

            If Not RealizarConsultaDePrueba(objConfiguraciones_nuevo, _listaConexiones) Then
                Throw New Exception("Error configurando la conexión. ")
            End If

            'Si todo está en orden guardamos la configuracion.
            If GuardarObjetoConfiguracion(objConfiguraciones_nuevo, _rutaArchivoConfig) Then
                Log.Logger(tipoLogging.Check, "Configuración guardada!")
                MessageBox.Show("Configuración guardada!", "Configuración", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Me.DialogResult = Windows.Forms.DialogResult.OK
                Exit Sub
            End If


        Catch ex As Exception
            MessageBox.Show("Error inesperado." + vbCrLf + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub btnCancelar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Me.DialogResult = Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub

    '-----------------'
    '     METODOS
    '-----------------'

    ''' <summary>
    ''' Actualiza la configuracion con los nuevos valores. Version_6.3
    ''' </summary>
    ''' <param name="pConfiguraciones"></param>
    ''' <param name="pAmbiente"></param>
    ''' <param name="pTipoConexion"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-NA</remarks>
    Private Function ActualizarNuevosValores(ByVal pConfiguraciones As Configuraciones, ByVal pAmbiente As String, ByVal pTipoConexion As String, ByVal pAmbienteAFIP As String) As Configuraciones
        Try

            pConfiguraciones.ListaPropiedades.ForEach(Sub(p As Propiedades) If p.Propiedad.ToUpper.Equals("AMBIENTE") Then p.Valor = pAmbiente)
            pConfiguraciones.ListaPropiedades.ForEach(Sub(p As Propiedades) If p.Propiedad.ToUpper.Equals("TIPO_DE_CONEXION") Then p.Valor = pTipoConexion)
            pConfiguraciones.ListaPropiedades.ForEach(Sub(p As Propiedades) If p.Propiedad.ToUpper.Equals("AFIP") Then p.Valor = pAmbienteAFIP)
            Return pConfiguraciones

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Configura los controles de la pantalla. Version_6.3
    ''' </summary>
    ''' <param name="pListaConexiones"></param>
    ''' <param name="pObjConfiguraciones"></param>
    ''' <remarks>MVC-NA</remarks>
    Private Sub ConfigurarControles(pListaConexiones As List(Of Conexion), pObjConfiguraciones As Configuraciones)
        Try

            Dim listaAFIP As New List(Of String)
            listaAFIP.Add("Produccion")
            listaAFIP.Add("Homologacion")

            cmb_conf_ambiente.DataSource = ObtenerValoresPosibles(pListaConexiones, "Ambiente")
            cmb_conf_tipoConexion.DataSource = ObtenerValoresPosibles(pListaConexiones, "Conexion")
            cmb_conf_ambienteAFIP.DataSource = listaAFIP

            cmb_conf_ambiente.Text = ObtenerValoresConfiguracion(pObjConfiguraciones, "AMBIENTE")
            cmb_conf_tipoConexion.Text = ObtenerValoresConfiguracion(pObjConfiguraciones, "TIPO_DE_CONEXION")
            cmb_conf_ambienteAFIP.Text = ObtenerValoresConfiguracion(pObjConfiguraciones, "AFIP")

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    ''' <summary>
    ''' Guarda un objeto de tipo configuracion para frm_mdi_principa. Version_6.3
    ''' </summary>
    ''' <param name="pObjConfig"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Private Function GuardarObjetoConfiguracion(ByVal pObjConfig As Configuraciones, ByVal rutaArchivo As String) As Boolean
        GuardarObjetoConfiguracion = False
        Try
            Dim objGestorXML As New GestionXML(rutaArchivo)


            If Not objGestorXML.GuardarObjetoXML(pObjConfig) Then
                MessageBox.Show(objGestorXML.Error)
            End If

            GuardarObjetoConfiguracion = True

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Obtiene la clave de administrador. Version_6.3
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Private Function ObtenerClaveAdministrador() As String
        Try
            Dim passWord As String
            Dim objPrincipalFacturadorWebService As New PrincipalFacturadorWebService(_listaConexiones, _ambiente, _tipoDeConexion, _appName)

            If Not objPrincipalFacturadorWebService.ObtenerClaveAdministrador(My.Application.Info.ProductName, _nombreFormulario) Then
                Throw New Exception(objPrincipalFacturadorWebService.Error)
            End If

            passWord = objPrincipalFacturadorWebService.ObjetoObtenido.ToString

            Log.Logger(tipoLogging.Info, "Longitud password obtenido: " + passWord.Length.ToString)

            Return passWord

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Obtiene valores de configuracion desde la propiedad. Version_6.3
    ''' </summary>
    ''' <param name="pConfiguraciones"></param>
    ''' <param name="pPropiedad"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-NA</remarks>
    Private Function ObtenerValoresConfiguracion(pConfiguraciones As Configuraciones, pPropiedad As String) As String
        Try
            Dim a As String = String.Empty


            If pPropiedad.ToUpper.Contains("AMBIENTE") Then
                a = (From item As Propiedades In pConfiguraciones.ListaPropiedades Where item.Propiedad.ToString.ToUpper.Equals("AMBIENTE") Select item.Valor)(0).ToString
            ElseIf pPropiedad.ToUpper.Contains("AFIP") Then
                a = (From item As Propiedades In pConfiguraciones.ListaPropiedades Where item.Propiedad.ToString.ToUpper.Equals("AFIP") Select item.Valor)(0).ToString
            ElseIf pPropiedad.ToUpper.Contains("TIPO_DE_CONEXION") Then
                a = (From item As Propiedades In pConfiguraciones.ListaPropiedades Where item.Propiedad.ToString.ToUpper.Equals("TIPO_DE_CONEXION") Select item.Valor)(0).ToString
            End If

            Return a

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Obtiene valores posibles para una propiedad. Version_6.3
    ''' </summary>
    ''' <param name="pLista"></param>
    ''' <param name="pPropiedad"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-NA</remarks>
    Private Function ObtenerValoresPosibles(pLista As List(Of Conexion), pPropiedad As String) As List(Of String)
        Try

            Dim a As List(Of String) = Nothing

            If pPropiedad.ToUpper.Contains("AMBIENTE") Then
                a = (From item As Conexion In pLista Select item.Ambiente).Distinct.ToList
            ElseIf pPropiedad.ToUpper.Contains("AFIP") Then
                a = (From item As Conexion In pLista Select item.TipoConexion).Distinct.ToList
            ElseIf pPropiedad.ToUpper.Contains("CONEX") Then
                a = (From item As Conexion In pLista Select item.TipoConexion).Distinct.ToList
            End If

            Return a

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Realiza una cosulta a la base de seguridad de la nueva configuracion elegida. Version_6.3
    ''' </summary>
    ''' <param name="pNuevaConfiguracion"></param>
    ''' <param name="pListaConexiones"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-Ok</remarks>
    Private Function RealizarConsultaDePrueba(pNuevaConfiguracion As Configuraciones, pListaConexiones As List(Of Conexion)) As Boolean
        RealizarConsultaDePrueba = False
        Try
            Dim nuevoAmbiente As String = FuncionesGenerales.GetAmbiente(pNuevaConfiguracion.ListaPropiedades)
            Dim nuevoTipoConexion As String = FuncionesGenerales.GetTipoDeConexion(pNuevaConfiguracion.ListaPropiedades)

            Dim objRecepciones_nuevo As New PrincipalFacturadorWebService(pListaConexiones, nuevoAmbiente, nuevoTipoConexion, _appName)

            'Realizamos una consulta de prueba para verificar que la conexion sea posible y no de error.
            If Not objRecepciones_nuevo.RealizarConsultaDePrueba("Base_Seguridad") Then
                Exit Function
            End If

            RealizarConsultaDePrueba = True
        Catch ex As Exception
            Throw ex
        End Try

    End Function

    ''' <summary>
    ''' Valida la clave ingresada con la clave de administrador. Version_6.3
    ''' </summary>
    ''' <param name="pClave"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-NA</remarks>
    Private Function ValidarClave(ByVal pClave As String) As Boolean
        ValidarClave = False
        Try
            Dim resultado As DialogResult
            Dim claveIngresada As String

            If pClave.Equals(String.Empty) Then
                Return True
            Else
                Dim objIPB As New InputBox_Key("Ingrese la clave de administrador para continuar", "Validación de clave")
                objIPB.PasswordChar = CChar("*")
                objIPB.BackgroundImage = Resources.barra_01_go
                objIPB.StartPosition = FormStartPosition.CenterScreen
                objIPB.ColorBoton = Boton_Cristal.ColoresBoton.Verde

                resultado = objIPB.ShowDialog()

                If resultado = Windows.Forms.DialogResult.OK Then

                    claveIngresada = objIPB.Valor

                    If claveIngresada.Equals(pClave) Then
                        Return True
                    Else
                        MessageBox.Show("Clave incorrecta.", "Error de clave.", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    End If
                End If
            End If

        Catch ex As Exception
            Throw ex
        End Try
    End Function

    ''' <summary>
    ''' Valida que la conexion seleccionada exista en la lista de conexiones. Version_6.3
    ''' </summary>
    ''' <param name="pLista"></param>
    ''' <param name="pAmbiente"></param>
    ''' <param name="pTipoConexion"></param>
    ''' <returns></returns>
    ''' <remarks>MVC-NA</remarks>
    Private Function ValidarConexionSeleccionada(pLista As List(Of Conexion), pAmbiente As String, pTipoConexion As String) As Boolean
        ValidarConexionSeleccionada = False
        Try
            Dim cantidad As Integer = 0

            cantidad = (From item As Conexion In pLista Where item.Ambiente.ToUpper.Equals(pAmbiente.ToUpper) And _
                             item.TipoConexion.ToUpper.Equals(pTipoConexion.ToUpper)).ToList.Count()

            If cantidad = 0 Then
                Exit Function
            End If

            ValidarConexionSeleccionada = True

        Catch ex As Exception
            Throw ex
        End Try
    End Function


End Class