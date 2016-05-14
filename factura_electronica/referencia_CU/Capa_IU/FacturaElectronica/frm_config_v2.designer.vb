<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_config_v2
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frm_config_v2))
        Me.btnCancelar = New Fonseca_lib_controles.Boton_Cristal()
        Me.btnAceptar = New Fonseca_lib_controles.Boton_Cristal()
        Me.grpConfiguraciones = New System.Windows.Forms.GroupBox()
        Me.lbl_conf_tipoConexion = New System.Windows.Forms.Label()
        Me.cmb_conf_tipoConexion = New System.Windows.Forms.ComboBox()
        Me.lbl_conf_ambiente = New System.Windows.Forms.Label()
        Me.cmb_conf_ambiente = New System.Windows.Forms.ComboBox()
        Me.lbl_conf_ambienteAFIP = New System.Windows.Forms.Label()
        Me.cmb_conf_ambienteAFIP = New System.Windows.Forms.ComboBox()
        Me.grpConfiguraciones.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnCancelar
        '
        Me.btnCancelar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btnCancelar.BackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.BackgroundImage = CType(resources.GetObject("btnCancelar.BackgroundImage"), System.Drawing.Image)
        Me.btnCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnCancelar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnCancelar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnCancelar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnCancelar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnCancelar.FlatAppearance.BorderSize = 0
        Me.btnCancelar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnCancelar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnCancelar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnCancelar.Location = New System.Drawing.Point(231, 180)
        Me.btnCancelar.Name = "btnCancelar"
        Me.btnCancelar.Size = New System.Drawing.Size(75, 35)
        Me.btnCancelar.TabIndex = 2
        Me.btnCancelar.Text = "Cancelar"
        Me.btnCancelar.UseVisualStyleBackColor = True
        '
        'btnAceptar
        '
        Me.btnAceptar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btnAceptar.BackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.BackgroundImage = CType(resources.GetObject("btnAceptar.BackgroundImage"), System.Drawing.Image)
        Me.btnAceptar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnAceptar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnAceptar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnAceptar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnAceptar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnAceptar.FlatAppearance.BorderSize = 0
        Me.btnAceptar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAceptar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAceptar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnAceptar.Location = New System.Drawing.Point(12, 180)
        Me.btnAceptar.Name = "btnAceptar"
        Me.btnAceptar.Size = New System.Drawing.Size(75, 35)
        Me.btnAceptar.TabIndex = 3
        Me.btnAceptar.Text = "Aceptar"
        Me.btnAceptar.UseVisualStyleBackColor = True
        '
        'grpConfiguraciones
        '
        Me.grpConfiguraciones.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.grpConfiguraciones.BackColor = System.Drawing.Color.Transparent
        Me.grpConfiguraciones.Controls.Add(Me.lbl_conf_ambienteAFIP)
        Me.grpConfiguraciones.Controls.Add(Me.cmb_conf_ambienteAFIP)
        Me.grpConfiguraciones.Controls.Add(Me.lbl_conf_tipoConexion)
        Me.grpConfiguraciones.Controls.Add(Me.cmb_conf_tipoConexion)
        Me.grpConfiguraciones.Controls.Add(Me.lbl_conf_ambiente)
        Me.grpConfiguraciones.Controls.Add(Me.cmb_conf_ambiente)
        Me.grpConfiguraciones.Location = New System.Drawing.Point(12, 12)
        Me.grpConfiguraciones.Name = "grpConfiguraciones"
        Me.grpConfiguraciones.Size = New System.Drawing.Size(308, 164)
        Me.grpConfiguraciones.TabIndex = 1
        Me.grpConfiguraciones.TabStop = False
        Me.grpConfiguraciones.Text = "Configuración"
        '
        'lbl_conf_tipoConexion
        '
        Me.lbl_conf_tipoConexion.AutoSize = True
        Me.lbl_conf_tipoConexion.Location = New System.Drawing.Point(6, 108)
        Me.lbl_conf_tipoConexion.Name = "lbl_conf_tipoConexion"
        Me.lbl_conf_tipoConexion.Size = New System.Drawing.Size(89, 13)
        Me.lbl_conf_tipoConexion.TabIndex = 7
        Me.lbl_conf_tipoConexion.Text = "Tipo de conexión"
        '
        'cmb_conf_tipoConexion
        '
        Me.cmb_conf_tipoConexion.BackColor = System.Drawing.SystemColors.ControlLight
        Me.cmb_conf_tipoConexion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmb_conf_tipoConexion.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.cmb_conf_tipoConexion.FormattingEnabled = True
        Me.cmb_conf_tipoConexion.Location = New System.Drawing.Point(6, 124)
        Me.cmb_conf_tipoConexion.Name = "cmb_conf_tipoConexion"
        Me.cmb_conf_tipoConexion.Size = New System.Drawing.Size(279, 21)
        Me.cmb_conf_tipoConexion.TabIndex = 6
        '
        'lbl_conf_ambiente
        '
        Me.lbl_conf_ambiente.AutoSize = True
        Me.lbl_conf_ambiente.Location = New System.Drawing.Point(6, 21)
        Me.lbl_conf_ambiente.Name = "lbl_conf_ambiente"
        Me.lbl_conf_ambiente.Size = New System.Drawing.Size(51, 13)
        Me.lbl_conf_ambiente.TabIndex = 5
        Me.lbl_conf_ambiente.Text = "Ambiente"
        '
        'cmb_conf_ambiente
        '
        Me.cmb_conf_ambiente.BackColor = System.Drawing.SystemColors.ControlLight
        Me.cmb_conf_ambiente.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmb_conf_ambiente.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.cmb_conf_ambiente.FormattingEnabled = True
        Me.cmb_conf_ambiente.Location = New System.Drawing.Point(6, 37)
        Me.cmb_conf_ambiente.Name = "cmb_conf_ambiente"
        Me.cmb_conf_ambiente.Size = New System.Drawing.Size(279, 21)
        Me.cmb_conf_ambiente.TabIndex = 4
        '
        'lbl_conf_ambienteAFIP
        '
        Me.lbl_conf_ambienteAFIP.AutoSize = True
        Me.lbl_conf_ambienteAFIP.Location = New System.Drawing.Point(6, 68)
        Me.lbl_conf_ambienteAFIP.Name = "lbl_conf_ambienteAFIP"
        Me.lbl_conf_ambienteAFIP.Size = New System.Drawing.Size(77, 13)
        Me.lbl_conf_ambienteAFIP.TabIndex = 9
        Me.lbl_conf_ambienteAFIP.Text = "Ambiente AFIP"
        '
        'cmb_conf_ambienteAFIP
        '
        Me.cmb_conf_ambienteAFIP.BackColor = System.Drawing.SystemColors.ControlLight
        Me.cmb_conf_ambienteAFIP.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cmb_conf_ambienteAFIP.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.cmb_conf_ambienteAFIP.FormattingEnabled = True
        Me.cmb_conf_ambienteAFIP.Location = New System.Drawing.Point(6, 84)
        Me.cmb_conf_ambienteAFIP.Name = "cmb_conf_ambienteAFIP"
        Me.cmb_conf_ambienteAFIP.Size = New System.Drawing.Size(279, 21)
        Me.cmb_conf_ambienteAFIP.TabIndex = 8
        '
        'frm_config_v2
        '
        Me.AccessibleName = "Config_conexion"
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(332, 217)
        Me.Controls.Add(Me.grpConfiguraciones)
        Me.Controls.Add(Me.btnAceptar)
        Me.Controls.Add(Me.btnCancelar)
        Me.Name = "frm_config_v2"
        Me.Text = "Configuración"
        Me.grpConfiguraciones.ResumeLayout(False)
        Me.grpConfiguraciones.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents btnCancelar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents btnAceptar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents grpConfiguraciones As System.Windows.Forms.GroupBox
    Friend WithEvents lbl_conf_tipoConexion As System.Windows.Forms.Label
    Friend WithEvents cmb_conf_tipoConexion As System.Windows.Forms.ComboBox
    Friend WithEvents lbl_conf_ambiente As System.Windows.Forms.Label
    Friend WithEvents cmb_conf_ambiente As System.Windows.Forms.ComboBox
    Friend WithEvents lbl_conf_ambienteAFIP As System.Windows.Forms.Label
    Friend WithEvents cmb_conf_ambienteAFIP As System.Windows.Forms.ComboBox
End Class
