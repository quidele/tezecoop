<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm_ObtenerCAE
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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Frm_ObtenerCAE))
        Dim DataGridViewCellStyle5 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle6 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewRow3 As System.Windows.Forms.DataGridViewRow = New System.Windows.Forms.DataGridViewRow()
        Dim DataGridViewCellStyle7 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle8 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewRow4 As System.Windows.Forms.DataGridViewRow = New System.Windows.Forms.DataGridViewRow()
        Me.grp_cab_botones = New System.Windows.Forms.GroupBox()
        Me.btnProcesar = New Fonseca_lib_controles.Boton_Cristal()
        Me.btnConsultarCbtes = New Fonseca_lib_controles.Boton_Cristal()
        Me.btn_cab_actualizar = New Fonseca_lib_controles.Boton_Cristal()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.tbPrincipal = New System.Windows.Forms.TabPage()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.dgv_cab_observaciones = New Fonseca_lib_controles.DataGridView_titulo()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.lbl_cab_mensaje = New System.Windows.Forms.Label()
        Me.dgv_cab_Solicitudes = New Fonseca_lib_controles.DataGridView_titulo()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.lbl_TS_Usuario = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lbl_TS_Base = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lbl_TS_Version = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lbl_TS_Ambiente = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lbl_TS_AmbienteAFIP = New System.Windows.Forms.ToolStripStatusLabel()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.ArchivoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SalirToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AyudaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VisorDeLogsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ConfiguraciónToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.cms_solicitudes = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.btnReprocesar = New System.Windows.Forms.ToolStripMenuItem()
        Me.grp_cab_botones.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.tbPrincipal.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.cms_solicitudes.SuspendLayout()
        Me.SuspendLayout()
        '
        'grp_cab_botones
        '
        Me.grp_cab_botones.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.grp_cab_botones.Controls.Add(Me.btnProcesar)
        Me.grp_cab_botones.Controls.Add(Me.btnConsultarCbtes)
        Me.grp_cab_botones.Controls.Add(Me.btn_cab_actualizar)
        Me.grp_cab_botones.Location = New System.Drawing.Point(6, 6)
        Me.grp_cab_botones.Name = "grp_cab_botones"
        Me.grp_cab_botones.Size = New System.Drawing.Size(910, 66)
        Me.grp_cab_botones.TabIndex = 0
        Me.grp_cab_botones.TabStop = False
        '
        'btnProcesar
        '
        Me.btnProcesar.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnProcesar.BackColor = System.Drawing.Color.Transparent
        Me.btnProcesar.BackgroundImage = CType(resources.GetObject("btnProcesar.BackgroundImage"), System.Drawing.Image)
        Me.btnProcesar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnProcesar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnProcesar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnProcesar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnProcesar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnProcesar.FlatAppearance.BorderSize = 0
        Me.btnProcesar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnProcesar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnProcesar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnProcesar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnProcesar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnProcesar.Location = New System.Drawing.Point(795, 15)
        Me.btnProcesar.Name = "btnProcesar"
        Me.btnProcesar.Size = New System.Drawing.Size(109, 41)
        Me.btnProcesar.TabIndex = 2
        Me.btnProcesar.Text = "Enviar a AFIP"
        Me.btnProcesar.UseVisualStyleBackColor = False
        '
        'btnConsultarCbtes
        '
        Me.btnConsultarCbtes.BackColor = System.Drawing.Color.Transparent
        Me.btnConsultarCbtes.BackgroundImage = CType(resources.GetObject("btnConsultarCbtes.BackgroundImage"), System.Drawing.Image)
        Me.btnConsultarCbtes.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnConsultarCbtes.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnConsultarCbtes.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnConsultarCbtes.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnConsultarCbtes.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnConsultarCbtes.FlatAppearance.BorderSize = 0
        Me.btnConsultarCbtes.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnConsultarCbtes.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnConsultarCbtes.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnConsultarCbtes.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnConsultarCbtes.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnConsultarCbtes.Location = New System.Drawing.Point(94, 15)
        Me.btnConsultarCbtes.Name = "btnConsultarCbtes"
        Me.btnConsultarCbtes.Size = New System.Drawing.Size(81, 41)
        Me.btnConsultarCbtes.TabIndex = 1
        Me.btnConsultarCbtes.Text = "Consultar"
        Me.btnConsultarCbtes.UseVisualStyleBackColor = False
        '
        'btn_cab_actualizar
        '
        Me.btn_cab_actualizar.BackColor = System.Drawing.Color.Transparent
        Me.btn_cab_actualizar.BackgroundImage = CType(resources.GetObject("btn_cab_actualizar.BackgroundImage"), System.Drawing.Image)
        Me.btn_cab_actualizar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_cab_actualizar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_cab_actualizar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_cab_actualizar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_cab_actualizar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_cab_actualizar.FlatAppearance.BorderSize = 0
        Me.btn_cab_actualizar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_cab_actualizar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_cab_actualizar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_cab_actualizar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_cab_actualizar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_cab_actualizar.Location = New System.Drawing.Point(6, 15)
        Me.btn_cab_actualizar.Name = "btn_cab_actualizar"
        Me.btn_cab_actualizar.Size = New System.Drawing.Size(83, 41)
        Me.btn_cab_actualizar.TabIndex = 0
        Me.btn_cab_actualizar.Text = "Actualizar"
        Me.btn_cab_actualizar.UseVisualStyleBackColor = False
        '
        'TabControl1
        '
        Me.TabControl1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.TabControl1.Controls.Add(Me.tbPrincipal)
        Me.TabControl1.Location = New System.Drawing.Point(12, 50)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(930, 539)
        Me.TabControl1.TabIndex = 1
        '
        'tbPrincipal
        '
        Me.tbPrincipal.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.tbPrincipal.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.tbPrincipal.Controls.Add(Me.GroupBox2)
        Me.tbPrincipal.Controls.Add(Me.GroupBox1)
        Me.tbPrincipal.Controls.Add(Me.grp_cab_botones)
        Me.tbPrincipal.Location = New System.Drawing.Point(4, 22)
        Me.tbPrincipal.Name = "tbPrincipal"
        Me.tbPrincipal.Padding = New System.Windows.Forms.Padding(3)
        Me.tbPrincipal.Size = New System.Drawing.Size(922, 513)
        Me.tbPrincipal.TabIndex = 0
        Me.tbPrincipal.Text = "Facturación"
        Me.tbPrincipal.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupBox2.Controls.Add(Me.dgv_cab_observaciones)
        Me.GroupBox2.Location = New System.Drawing.Point(6, 328)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(910, 179)
        Me.GroupBox2.TabIndex = 2
        Me.GroupBox2.TabStop = False
        '
        'dgv_cab_observaciones
        '
        Me.dgv_cab_observaciones.AllowUserToAddRows = True
        Me.dgv_cab_observaciones.AllowUserToDeleteRows = True
        Me.dgv_cab_observaciones.AllowUserToOrderColumns = False
        Me.dgv_cab_observaciones.AllowUserToResizeColumns = True
        Me.dgv_cab_observaciones.AllowUserToResizeRows = True
        Me.dgv_cab_observaciones.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.dgv_cab_observaciones.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.None
        Me.dgv_cab_observaciones.BackColor = System.Drawing.Color.Transparent
        Me.dgv_cab_observaciones.BackgroundColor = System.Drawing.SystemColors.AppWorkspace
        Me.dgv_cab_observaciones.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Raised
        DataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dgv_cab_observaciones.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle5
        Me.dgv_cab_observaciones.ColumnHeadersHeight = 18
        Me.dgv_cab_observaciones.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_cab_observaciones.ColumnHeadersVisible = True
        Me.dgv_cab_observaciones.CurrentCell = Nothing
        Me.dgv_cab_observaciones.Datasource = Nothing
        DataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.dgv_cab_observaciones.DefaultCellStyle = DataGridViewCellStyle6
        Me.dgv_cab_observaciones.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnKeystrokeOrF2
        Me.dgv_cab_observaciones.GridColor = System.Drawing.SystemColors.ControlDark
        Me.dgv_cab_observaciones.Location = New System.Drawing.Point(9, 19)
        Me.dgv_cab_observaciones.MultiSelect = True
        Me.dgv_cab_observaciones.Name = "dgv_cab_observaciones"
        Me.dgv_cab_observaciones.ReadOnly = False
        Me.dgv_cab_observaciones.RowHeadersVisible = True
        Me.dgv_cab_observaciones.RowHeadersWidth = 41
        Me.dgv_cab_observaciones.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.EnableResizing
        Me.dgv_cab_observaciones.RowTemplate = DataGridViewRow3
        Me.dgv_cab_observaciones.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.dgv_cab_observaciones.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.RowHeaderSelect
        Me.dgv_cab_observaciones.Size = New System.Drawing.Size(895, 150)
        Me.dgv_cab_observaciones.TabIndex = 0
        Me.dgv_cab_observaciones.TitleBackColor = System.Drawing.Color.Transparent
        Me.dgv_cab_observaciones.TitleFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dgv_cab_observaciones.TitleForeColor = System.Drawing.SystemColors.ControlText
        Me.dgv_cab_observaciones.Titulo = "Observaciones"
        '
        'GroupBox1
        '
        Me.GroupBox1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupBox1.Controls.Add(Me.lbl_cab_mensaje)
        Me.GroupBox1.Controls.Add(Me.dgv_cab_Solicitudes)
        Me.GroupBox1.Location = New System.Drawing.Point(6, 78)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(910, 244)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        '
        'lbl_cab_mensaje
        '
        Me.lbl_cab_mensaje.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.lbl_cab_mensaje.AutoSize = True
        Me.lbl_cab_mensaje.Location = New System.Drawing.Point(6, 224)
        Me.lbl_cab_mensaje.Name = "lbl_cab_mensaje"
        Me.lbl_cab_mensaje.Size = New System.Drawing.Size(60, 13)
        Me.lbl_cab_mensaje.TabIndex = 1
        Me.lbl_cab_mensaje.Text = "Registro(s)."
        '
        'dgv_cab_Solicitudes
        '
        Me.dgv_cab_Solicitudes.AllowUserToAddRows = False
        Me.dgv_cab_Solicitudes.AllowUserToDeleteRows = False
        Me.dgv_cab_Solicitudes.AllowUserToOrderColumns = False
        Me.dgv_cab_Solicitudes.AllowUserToResizeColumns = True
        Me.dgv_cab_Solicitudes.AllowUserToResizeRows = False
        Me.dgv_cab_Solicitudes.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.dgv_cab_Solicitudes.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.None
        Me.dgv_cab_Solicitudes.BackColor = System.Drawing.Color.Transparent
        Me.dgv_cab_Solicitudes.BackgroundColor = System.Drawing.SystemColors.AppWorkspace
        Me.dgv_cab_Solicitudes.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Raised
        DataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle7.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dgv_cab_Solicitudes.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle7
        Me.dgv_cab_Solicitudes.ColumnHeadersHeight = 18
        Me.dgv_cab_Solicitudes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_cab_Solicitudes.ColumnHeadersVisible = True
        Me.dgv_cab_Solicitudes.CurrentCell = Nothing
        Me.dgv_cab_Solicitudes.Datasource = Nothing
        DataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle8.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.dgv_cab_Solicitudes.DefaultCellStyle = DataGridViewCellStyle8
        Me.dgv_cab_Solicitudes.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically
        Me.dgv_cab_Solicitudes.GridColor = System.Drawing.SystemColors.ControlDark
        Me.dgv_cab_Solicitudes.Location = New System.Drawing.Point(6, 19)
        Me.dgv_cab_Solicitudes.MultiSelect = True
        Me.dgv_cab_Solicitudes.Name = "dgv_cab_Solicitudes"
        Me.dgv_cab_Solicitudes.ReadOnly = False
        Me.dgv_cab_Solicitudes.RowHeadersVisible = True
        Me.dgv_cab_Solicitudes.RowHeadersWidth = 41
        Me.dgv_cab_Solicitudes.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.EnableResizing
        Me.dgv_cab_Solicitudes.RowTemplate = DataGridViewRow4
        Me.dgv_cab_Solicitudes.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.dgv_cab_Solicitudes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.dgv_cab_Solicitudes.Size = New System.Drawing.Size(898, 202)
        Me.dgv_cab_Solicitudes.TabIndex = 0
        Me.dgv_cab_Solicitudes.TitleBackColor = System.Drawing.Color.Transparent
        Me.dgv_cab_Solicitudes.TitleFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dgv_cab_Solicitudes.TitleForeColor = System.Drawing.SystemColors.ControlText
        Me.dgv_cab_Solicitudes.Titulo = "Solicitudes a enviar"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.BackColor = System.Drawing.Color.Transparent
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lbl_TS_Usuario, Me.lbl_TS_Base, Me.lbl_TS_Version, Me.lbl_TS_Ambiente, Me.lbl_TS_AmbienteAFIP})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 604)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(960, 22)
        Me.StatusStrip1.TabIndex = 2
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'lbl_TS_Usuario
        '
        Me.lbl_TS_Usuario.Name = "lbl_TS_Usuario"
        Me.lbl_TS_Usuario.Size = New System.Drawing.Size(50, 17)
        Me.lbl_TS_Usuario.Text = "Usuario:"
        '
        'lbl_TS_Base
        '
        Me.lbl_TS_Base.Name = "lbl_TS_Base"
        Me.lbl_TS_Base.Size = New System.Drawing.Size(34, 17)
        Me.lbl_TS_Base.Text = "Base:"
        '
        'lbl_TS_Version
        '
        Me.lbl_TS_Version.Name = "lbl_TS_Version"
        Me.lbl_TS_Version.Size = New System.Drawing.Size(49, 17)
        Me.lbl_TS_Version.Text = "Versión:"
        '
        'lbl_TS_Ambiente
        '
        Me.lbl_TS_Ambiente.Name = "lbl_TS_Ambiente"
        Me.lbl_TS_Ambiente.Size = New System.Drawing.Size(62, 17)
        Me.lbl_TS_Ambiente.Text = "Ambiente:"
        '
        'lbl_TS_AmbienteAFIP
        '
        Me.lbl_TS_AmbienteAFIP.Name = "lbl_TS_AmbienteAFIP"
        Me.lbl_TS_AmbienteAFIP.Size = New System.Drawing.Size(89, 17)
        Me.lbl_TS_AmbienteAFIP.Text = "Ambiente AFIP:"
        '
        'MenuStrip1
        '
        Me.MenuStrip1.AccessibleName = ""
        Me.MenuStrip1.AutoSize = False
        Me.MenuStrip1.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_02_go
        Me.MenuStrip1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ArchivoToolStripMenuItem, Me.AyudaToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(960, 47)
        Me.MenuStrip1.TabIndex = 3
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'ArchivoToolStripMenuItem
        '
        Me.ArchivoToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SalirToolStripMenuItem})
        Me.ArchivoToolStripMenuItem.Name = "ArchivoToolStripMenuItem"
        Me.ArchivoToolStripMenuItem.Size = New System.Drawing.Size(60, 43)
        Me.ArchivoToolStripMenuItem.Text = "Archivo"
        '
        'SalirToolStripMenuItem
        '
        Me.SalirToolStripMenuItem.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_03_go
        Me.SalirToolStripMenuItem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.SalirToolStripMenuItem.Image = Global.FacturaElectronicaWS.Resources._Next
        Me.SalirToolStripMenuItem.Name = "SalirToolStripMenuItem"
        Me.SalirToolStripMenuItem.Size = New System.Drawing.Size(96, 22)
        Me.SalirToolStripMenuItem.Text = "Salir"
        '
        'AyudaToolStripMenuItem
        '
        Me.AyudaToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VisorDeLogsToolStripMenuItem, Me.ConfiguraciónToolStripMenuItem})
        Me.AyudaToolStripMenuItem.Name = "AyudaToolStripMenuItem"
        Me.AyudaToolStripMenuItem.Size = New System.Drawing.Size(53, 43)
        Me.AyudaToolStripMenuItem.Text = "Ayuda"
        '
        'VisorDeLogsToolStripMenuItem
        '
        Me.VisorDeLogsToolStripMenuItem.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_03_go
        Me.VisorDeLogsToolStripMenuItem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.VisorDeLogsToolStripMenuItem.Image = Global.FacturaElectronicaWS.Resources.Mediciones
        Me.VisorDeLogsToolStripMenuItem.Name = "VisorDeLogsToolStripMenuItem"
        Me.VisorDeLogsToolStripMenuItem.Size = New System.Drawing.Size(150, 22)
        Me.VisorDeLogsToolStripMenuItem.Text = "Visor de logs"
        '
        'ConfiguraciónToolStripMenuItem
        '
        Me.ConfiguraciónToolStripMenuItem.AccessibleName = ""
        Me.ConfiguraciónToolStripMenuItem.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_03_go
        Me.ConfiguraciónToolStripMenuItem.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ConfiguraciónToolStripMenuItem.Image = Global.FacturaElectronicaWS.Resources.procesos
        Me.ConfiguraciónToolStripMenuItem.Name = "ConfiguraciónToolStripMenuItem"
        Me.ConfiguraciónToolStripMenuItem.Size = New System.Drawing.Size(150, 22)
        Me.ConfiguraciónToolStripMenuItem.Text = "Configuración"
        '
        'cms_solicitudes
        '
        Me.cms_solicitudes.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.btnReprocesar})
        Me.cms_solicitudes.Name = "ContextMenuStrip1"
        Me.cms_solicitudes.Size = New System.Drawing.Size(168, 48)
        '
        'btnReprocesar
        '
        Me.btnReprocesar.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_03_go
        Me.btnReprocesar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnReprocesar.Image = Global.FacturaElectronicaWS.Resources.Refresh_icon_4
        Me.btnReprocesar.Name = "btnReprocesar"
        Me.btnReprocesar.Size = New System.Drawing.Size(167, 22)
        Me.btnReprocesar.Text = "Asignar a Magma"
        '
        'Frm_ObtenerCAE
        '
        Me.AccessibleName = "FacturaElectroWS"
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.LightGoldenrodYellow
        Me.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(960, 626)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Controls.Add(Me.TabControl1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Frm_ObtenerCAE"
        Me.Text = "Factura Electrónica Web Service"
        Me.grp_cab_botones.ResumeLayout(False)
        Me.TabControl1.ResumeLayout(False)
        Me.tbPrincipal.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.cms_solicitudes.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents grp_cab_botones As System.Windows.Forms.GroupBox
    Friend WithEvents btn_cab_actualizar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents btnProcesar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents btnConsultarCbtes As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents tbPrincipal As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents dgv_cab_Solicitudes As Fonseca_lib_controles.DataGridView_titulo
    Friend WithEvents lbl_cab_mensaje As System.Windows.Forms.Label
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents lbl_TS_Usuario As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_TS_Base As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_TS_Version As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_TS_Ambiente As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_TS_AmbienteAFIP As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents dgv_cab_observaciones As Fonseca_lib_controles.DataGridView_titulo
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents ArchivoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SalirToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AyudaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VisorDeLogsToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ConfiguraciónToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents cms_solicitudes As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents btnReprocesar As System.Windows.Forms.ToolStripMenuItem
End Class
