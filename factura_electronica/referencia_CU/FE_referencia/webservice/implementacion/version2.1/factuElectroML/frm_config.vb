Imports System.Configuration

Public Class frmConfiguracion
    Private exportacion = False, mercadoLocal = False, prueba = False, facElect = False, produccion = False, homologacion = False, logSi = False, logNo As Boolean = False
    Private TEspera = False, CarpLog = False, PvtaEx = False, PvtaML = False, TcteEX = False, TcteML As Boolean = False
    Public Sub btnGuardar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        If rdoEX.Checked = True Then
            exportacion = True
        End If

        If rdoML.Checked = True Then
            mercadoLocal = True
        End If

        If rdoPrueba.Checked = True Then
            prueba = True
        End If

        If rdoFacElec.Checked = True Then
            facElect = True
        End If

        If rdoProd.Checked = True Then
            produccion = True
        End If

        If rdoHomo.Checked = True Then
            homologacion = True
        End If

        If rdoLogNo.Checked = True Then
            logNo = True
        End If

        If rdoLogSi.Checked = False Then
            logSi = True
        End If

        Me.DialogResult = Windows.Forms.DialogResult.OK
        Me.Close()
    End Sub

    Private Sub frmConfiguracion_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        cargarRadioButtons()
        cargarTextBoxes()

        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.MaximumSize = Me.Size
        Me.MinimumSize = Me.Size
        Me.SizeGripStyle = Windows.Forms.SizeGripStyle.Hide
        Me.StartPosition = FormStartPosition.CenterScreen
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedToolWindow

        txtTiempoEspera.ForeColor = Color.Gray
        txtCarpetaLog.ForeColor = Color.Gray
        txtPtoVtaEx.ForeColor = Color.Gray
        txtPtoVtaML.ForeColor = Color.Gray
        txtTipoCbteEx.ForeColor = Color.Gray
        txtTipoCbteML.ForeColor = Color.Gray

        AddHandler txtPtoVtaEx.TextChanged, AddressOf txtPtoVtaEx_TextChanged
        AddHandler txtTiempoEspera.TextChanged, AddressOf txtTiempoEspera_TextChanged
        AddHandler txtPtoVtaML.TextChanged, AddressOf txtPtoVtaML_TextChanged
        AddHandler txtTipoCbteEx.TextChanged, AddressOf txtTipoBbteEx_TextChanged
        AddHandler txtTipoCbteML.TextChanged, AddressOf txtTipoBbteML_TextChanged
        AddHandler txtCarpetaLog.TextChanged, AddressOf txtCarpetaLog_TextChanged

    End Sub


    Public Sub GuardarConfiguracion()
        Dim config1 As Configuration = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None)

        If exportacion = True Then
            config1.AppSettings.Settings("TIPO_MERCADO").Value = "EX"
        End If

        If mercadoLocal = True Then
            config1.AppSettings.Settings("TIPO_MERCADO").Value = "ML"
        End If

        If prueba = True Then
            config1.ConnectionStrings.ConnectionStrings("FacturaElectronica").ConnectionString = "Data Source=SVR-MAGMA-BD;Database=FacturaElectronica_Prueba"
        End If

        If facElect = True Then
            config1.ConnectionStrings.ConnectionStrings("FacturaElectronica").ConnectionString = "Data Source=SVR-MAGMA-BD;Database=FacturaElectronica"
        End If

        If produccion = True Then
            config1.AppSettings.Settings("MODO_OPERACION").Value = "Produccion"
        End If

        If homologacion = True Then
            config1.AppSettings.Settings("MODO_OPERACION").Value = "Homologacion"
        End If

        If logNo = True Then
            config1.AppSettings.Settings("LOG_ACTIVADO").Value = "NO"
        End If

        If logSi = True Then
            config1.AppSettings.Settings("LOG_ACTIVADO").Value = "SI"
        End If

        If PvtaEx = True Then
            config1.AppSettings.Settings("DEFAULT_PTO_VTA_EX").Value = txtPtoVtaEx.Text
        End If

        If PvtaML = True Then
            config1.AppSettings.Settings("DEFAULT_PTO_VTA_ML").Value = txtPtoVtaML.Text
        End If

        If TcteEX = True Then
            config1.AppSettings.Settings("DEFAULT_CBTE_TIPO_EX").Value = txtTipoCbteEx.Text
        End If

        If TcteML = True Then
            config1.AppSettings.Settings("DEFAULT_CBTE_TIPO_ML").Value = txtTipoCbteML.Text
        End If
        If TEspera = True Then
            config1.AppSettings.Settings("TIEMPO_ESPERA").Value = txtTiempoEspera.Text
        End If

        If CarpLog = True Then
            config1.AppSettings.Settings("LOG_RUTA").Value = txtCarpetaLog.Text
        End If
        config1.Save(ConfigurationSaveMode.Modified, True)
    End Sub

    Private Sub cargarRadioButtons()
        If ConfigurationManager.AppSettings("LOG_ACTIVADO") = "SI" Then
            rdoLogSi.Checked = True
        Else
            rdoLogNo.Checked = True
        End If

        If ConfigurationManager.AppSettings("MODO_OPERACION") = "Produccion" Then
            rdoProd.Checked = True
        Else
            rdoHomo.Checked = True
        End If

        If ConfigurationManager.AppSettings("TIPO_MERCADO") = "ML" Then
            rdoML.Checked = True
        Else
            rdoEX.Checked = True
        End If

        If ConfigurationManager.ConnectionStrings("FacturaElectronica").ConnectionString.Contains("Prueba") = True Then
            rdoPrueba.Checked = True
        Else
            rdoFacElec.Checked = True
        End If
    End Sub

    Private Sub cargarTextBoxes()
        txtCarpetaLog.Text = ConfigurationManager.AppSettings("LOG_RUTA")
        txtPtoVtaEx.Text = ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_EX")
        txtPtoVtaML.Text = ConfigurationManager.AppSettings("DEFAULT_PTO_VTA_ML")
        txtTiempoEspera.Text = ConfigurationManager.AppSettings("TIEMPO_ESPERA")
        txtTipoCbteEx.Text = ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_EX")
        txtTipoCbteML.Text = ConfigurationManager.AppSettings("DEFAULT_CBTE_TIPO_ML")
    End Sub


    Private Sub txtCarpetaLog_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtCarpetaLog.ForeColor = Color.Black
        CarpLog = True
        RemoveHandler txtCarpetaLog.TextChanged, AddressOf txtCarpetaLog_TextChanged
    End Sub
    Private Sub txtPtoVtaEx_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtPtoVtaEx.ForeColor = Color.Black
        PvtaEx = True
        RemoveHandler txtPtoVtaEx.TextChanged, AddressOf txtPtoVtaEx_TextChanged
    End Sub
    Private Sub txtPtoVtaML_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtPtoVtaML.ForeColor = Color.Black
        PvtaML = True
        RemoveHandler txtPtoVtaML.TextChanged, AddressOf txtPtoVtaML_TextChanged
    End Sub
    Private Sub txtTiempoEspera_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtTiempoEspera.ForeColor = Color.Black
        TEspera = True
        RemoveHandler txtTiempoEspera.TextChanged, AddressOf txtTiempoEspera_TextChanged
    End Sub
    Private Sub txtTipoBbteEx_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtTipoCbteEx.ForeColor = Color.Black
        TcteEX = True
        RemoveHandler txtTipoCbteEx.TextChanged, AddressOf txtTipoBbteEx_TextChanged
    End Sub
    Private Sub txtTipoBbteML_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtTipoCbteML.ForeColor = Color.Black
        TcteML = True
        RemoveHandler txtTipoCbteML.TextChanged, AddressOf txtTipoBbteML_TextChanged
    End Sub

    
End Class