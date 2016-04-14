Imports System.Configuration.ConfigurationManager
Imports System.IO
Imports System.Reflection

Public Class frm_Config


    Private _rutaLog As String
    Public Property RutaLog() As String
        Get
            Return _rutaLog
        End Get
        Set(ByVal value As String)
            _rutaLog = value
        End Set
    End Property

    Private _logHabilitado As String
    Public Property LogHabilitado() As String
        Get
            Return _logHabilitado
        End Get
        Set(ByVal value As String)
            _logHabilitado = value
        End Set
    End Property

    Private _tipoLog As String
    Public Property TipoLog() As String
        Get
            Return _tipoLog
        End Get
        Set(ByVal value As String)
            _tipoLog = value
        End Set
    End Property

    Private _nombreArchivoConfig As String

    Private _personalizado As String

    Public Sub New()

        InitializeComponent()

        LeerDesdeAPPConfig()

        If File.Exists(_nombreArchivoConfig) Then
            If _personalizado = "SI" Then
                LeerConfiguracionTXT()
            End If
        End If

        AsignarValoresControles()

        rdoLogOn_CheckedChanged(New Object, New System.EventArgs)
        Me.Text = "Configuración"
    End Sub

    Private Sub AsignarValoresControles()

        If _logHabilitado = "SI" Then
            rdoLogOn.Checked() = True
        ElseIf _logHabilitado = "NO" Then
            rdoLogOff.Checked() = True
        End If

        cmbTipoLog.Text = _tipoLog
        txtRutaLog.Text = _rutaLog
    End Sub



    Private Sub LeerDesdeAPPConfig()
        Try
            _rutaLog = Configuration.ConfigurationManager.AppSettings("LOG_RUTA")
            _logHabilitado = Configuration.ConfigurationManager.AppSettings("LOG_ACTIVADO")
            _tipoLog = Configuration.ConfigurationManager.AppSettings("TIPO_LOG")
            _nombreArchivoConfig = Configuration.ConfigurationManager.AppSettings("NOM_ARCH_CONFIG")
            _personalizado = Configuration.ConfigurationManager.AppSettings("PERSONALIZADO")
        Catch ex As Exception

        End Try

    End Sub

    Private Sub rdoLogOn_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rdoLogOn.CheckedChanged
        If rdoLogOff.Checked = True Then
            For Each unControl As Control In grpLogOpciones.Controls
                unControl.Enabled = False
            Next
            _logHabilitado = "NO"
        ElseIf rdoLogOn.Checked = True Then
            For Each unControl As Control In grpLogOpciones.Controls
                unControl.Enabled = True
            Next
            _logHabilitado = "SI"
        End If
    End Sub

    Private Sub btnExaminar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExaminar.Click
        If fbdDialog.ShowDialog() = Windows.Forms.DialogResult.OK Then
            txtRutaLog.Text = fbdDialog.SelectedPath
        Else
            txtRutaLog.Text = ""
        End If
    End Sub

    'Dim _imageStream As Stream
    Dim _textStreamReader As StreamReader
    Dim _assembly As [Assembly]


    Private Sub LeerConfiguracionTXT()
        Dim sr As StreamReader = Nothing


        Try
            Dim listaArchivo As New ArrayList

            sr = New StreamReader(_nombreArchivoConfig)

            Do While Not sr.EndOfStream
                listaArchivo.Add(sr.ReadLine)
            Loop


            For Each item As String In listaArchivo
                Dim posicion As Integer = 0

                If item.Contains("LOG_RUTA") Then
                    posicion = InStr(item, "=") + 1
                    _rutaLog = Mid(item, posicion)
                End If

                If item.Contains("LOG_ACTIVADO") Then
                    posicion = InStr(item, "=") + 1
                    _logHabilitado = Mid(item, posicion)
                End If

                If item.Contains("TIPO_LOG") Then
                    posicion = InStr(item, "=") + 1
                    _tipoLog = Mid(item, posicion)
                End If

            Next

        Catch ex As IOException
            MessageBox.Show("Error al intentar recuperar datos del archivo de configuración")
        Catch ex As Exception
            MessageBox.Show("No se encontró el recurso solicitado.", "Error")
        Finally
            If Not sr Is Nothing Then
                sr.Close()
            End If
        End Try
    End Sub

    Private Sub GuardarConfiguracionTXT()
        Dim sr As StreamWriter = Nothing
        Try
            If Not File.Exists(_nombreArchivoConfig) Then
                File.Create(_nombreArchivoConfig)
            End If


            sr = New StreamWriter(_nombreArchivoConfig, False)

            sr.WriteLine("LOG_RUTA=" + _rutaLog)
            sr.WriteLine("LOG_ACTIVADO=" + _logHabilitado)
            sr.WriteLine("TIPO_LOG=" + _tipoLog)

        Catch ex As IOException
            MessageBox.Show("Error al intentar introducir datos del archivo de configuración")
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        Finally
            If Not sr Is Nothing Then
                sr.Close()
            End If
        End Try
    End Sub

    Private Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        _rutaLog = txtRutaLog.Text
        GuardarConfiguracionTXT()
        Me.Close()
    End Sub

    Private Sub cmbTipoLog_SelectionChangeCommitted(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbTipoLog.SelectionChangeCommitted
        _tipoLog = cmbTipoLog.Text
    End Sub

    Private Sub frm_Config_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        cmbTipoLog.Items.Add("Error")
        cmbTipoLog.Items.Add("Warn")
        cmbTipoLog.Items.Add("Info")
        cmbTipoLog.Items.Add("Debug")

    End Sub
End Class