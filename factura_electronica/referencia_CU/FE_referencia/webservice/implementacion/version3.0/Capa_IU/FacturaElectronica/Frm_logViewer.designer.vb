<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_logViewer
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
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewRow1 As System.Windows.Forms.DataGridViewRow = New System.Windows.Forms.DataGridViewRow()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frm_logViewer))
        Me.grp_gridViewer = New System.Windows.Forms.GroupBox()
        Me.lbl_cantidadRegistros = New System.Windows.Forms.Label()
        Me.dgv_logViewer = New Fonseca_lib_controles.DataGridView_titulo()
        Me.grp_Filtros = New System.Windows.Forms.GroupBox()
        Me.btn_irSiguiente = New Fonseca_lib_controles.Boton_Cristal()
        Me.txt_search = New System.Windows.Forms.TextBox()
        Me.btn_abrirArchivo = New Fonseca_lib_controles.Boton_Cristal()
        Me.chk_Check = New System.Windows.Forms.CheckBox()
        Me.chk_debug = New System.Windows.Forms.CheckBox()
        Me.chk_info = New System.Windows.Forms.CheckBox()
        Me.chk_warn = New System.Windows.Forms.CheckBox()
        Me.chk_error = New System.Windows.Forms.CheckBox()
        Me.dtp_fecha = New System.Windows.Forms.DateTimePicker()
        Me.btn_buscar = New Fonseca_lib_controles.Boton_Cristal()
        Me.pnl_ampliar = New System.Windows.Forms.Panel()
        Me.btn_copiar = New Fonseca_lib_controles.Boton_Cristal()
        Me.btn_cerrarPanel = New Fonseca_lib_controles.Boton_Cristal()
        Me.txt_consulta = New System.Windows.Forms.TextBox()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.grp_gridViewer.SuspendLayout()
        Me.grp_Filtros.SuspendLayout()
        Me.pnl_ampliar.SuspendLayout()
        Me.SuspendLayout()
        '
        'grp_gridViewer
        '
        Me.grp_gridViewer.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.grp_gridViewer.BackColor = System.Drawing.Color.Transparent
        Me.grp_gridViewer.Controls.Add(Me.lbl_cantidadRegistros)
        Me.grp_gridViewer.Controls.Add(Me.dgv_logViewer)
        Me.grp_gridViewer.Location = New System.Drawing.Point(12, 68)
        Me.grp_gridViewer.Name = "grp_gridViewer"
        Me.grp_gridViewer.Size = New System.Drawing.Size(1001, 341)
        Me.grp_gridViewer.TabIndex = 0
        Me.grp_gridViewer.TabStop = False
        '
        'lbl_cantidadRegistros
        '
        Me.lbl_cantidadRegistros.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.lbl_cantidadRegistros.AutoSize = True
        Me.lbl_cantidadRegistros.Location = New System.Drawing.Point(6, 323)
        Me.lbl_cantidadRegistros.Name = "lbl_cantidadRegistros"
        Me.lbl_cantidadRegistros.Size = New System.Drawing.Size(69, 13)
        Me.lbl_cantidadRegistros.TabIndex = 1
        Me.lbl_cantidadRegistros.Text = "0 Registro(s)."
        '
        'dgv_logViewer
        '
        Me.dgv_logViewer.AllowDrop = True
        Me.dgv_logViewer.AllowUserToAddRows = False
        Me.dgv_logViewer.AllowUserToDeleteRows = False
        Me.dgv_logViewer.AllowUserToOrderColumns = False
        Me.dgv_logViewer.AllowUserToResizeColumns = True
        Me.dgv_logViewer.AllowUserToResizeRows = True
        Me.dgv_logViewer.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.dgv_logViewer.AutoScroll = True
        Me.dgv_logViewer.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.None
        Me.dgv_logViewer.BackColor = System.Drawing.Color.Transparent
        Me.dgv_logViewer.BackgroundColor = System.Drawing.SystemColors.AppWorkspace
        Me.dgv_logViewer.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Raised
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dgv_logViewer.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.dgv_logViewer.ColumnHeadersHeight = 18
        Me.dgv_logViewer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgv_logViewer.ColumnHeadersVisible = True
        Me.dgv_logViewer.CurrentCell = Nothing
        Me.dgv_logViewer.Datasource = Nothing
        DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.dgv_logViewer.DefaultCellStyle = DataGridViewCellStyle2
        Me.dgv_logViewer.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically
        Me.dgv_logViewer.GridColor = System.Drawing.SystemColors.ControlDark
        Me.dgv_logViewer.Location = New System.Drawing.Point(6, 19)
        Me.dgv_logViewer.MultiSelect = True
        Me.dgv_logViewer.Name = "dgv_logViewer"
        Me.dgv_logViewer.ReadOnly = False
        Me.dgv_logViewer.RowHeadersVisible = True
        Me.dgv_logViewer.RowHeadersWidth = 41
        Me.dgv_logViewer.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.EnableResizing
        Me.dgv_logViewer.RowTemplate = DataGridViewRow1
        Me.dgv_logViewer.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.dgv_logViewer.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.dgv_logViewer.Size = New System.Drawing.Size(989, 303)
        Me.dgv_logViewer.TabIndex = 0
        Me.dgv_logViewer.TitleBackColor = System.Drawing.Color.Transparent
        Me.dgv_logViewer.TitleFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dgv_logViewer.TitleForeColor = System.Drawing.SystemColors.ControlText
        Me.dgv_logViewer.Titulo = "Log"
        '
        'grp_Filtros
        '
        Me.grp_Filtros.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.grp_Filtros.BackColor = System.Drawing.Color.Transparent
        Me.grp_Filtros.Controls.Add(Me.btn_irSiguiente)
        Me.grp_Filtros.Controls.Add(Me.txt_search)
        Me.grp_Filtros.Controls.Add(Me.btn_abrirArchivo)
        Me.grp_Filtros.Controls.Add(Me.chk_Check)
        Me.grp_Filtros.Controls.Add(Me.chk_debug)
        Me.grp_Filtros.Controls.Add(Me.chk_info)
        Me.grp_Filtros.Controls.Add(Me.chk_warn)
        Me.grp_Filtros.Controls.Add(Me.chk_error)
        Me.grp_Filtros.Controls.Add(Me.dtp_fecha)
        Me.grp_Filtros.Controls.Add(Me.btn_buscar)
        Me.grp_Filtros.Location = New System.Drawing.Point(12, 12)
        Me.grp_Filtros.Name = "grp_Filtros"
        Me.grp_Filtros.Size = New System.Drawing.Size(1001, 50)
        Me.grp_Filtros.TabIndex = 2
        Me.grp_Filtros.TabStop = False
        '
        'btn_irSiguiente
        '
        Me.btn_irSiguiente.BackColor = System.Drawing.Color.Transparent
        Me.btn_irSiguiente.BackgroundImage = CType(resources.GetObject("btn_irSiguiente.BackgroundImage"), System.Drawing.Image)
        Me.btn_irSiguiente.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_irSiguiente.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_irSiguiente.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_irSiguiente.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_irSiguiente.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_irSiguiente.FlatAppearance.BorderSize = 0
        Me.btn_irSiguiente.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_irSiguiente.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_irSiguiente.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_irSiguiente.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_irSiguiente.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_irSiguiente.Location = New System.Drawing.Point(567, 10)
        Me.btn_irSiguiente.Name = "btn_irSiguiente"
        Me.btn_irSiguiente.Size = New System.Drawing.Size(35, 35)
        Me.btn_irSiguiente.TabIndex = 10
        Me.btn_irSiguiente.Text = "Ir"
        Me.btn_irSiguiente.UseVisualStyleBackColor = False
        '
        'txt_search
        '
        Me.txt_search.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txt_search.Location = New System.Drawing.Point(297, 16)
        Me.txt_search.Name = "txt_search"
        Me.txt_search.Size = New System.Drawing.Size(264, 20)
        Me.txt_search.TabIndex = 9
        '
        'btn_abrirArchivo
        '
        Me.btn_abrirArchivo.AllowDrop = True
        Me.btn_abrirArchivo.BackColor = System.Drawing.Color.Transparent
        Me.btn_abrirArchivo.BackgroundImage = CType(resources.GetObject("btn_abrirArchivo.BackgroundImage"), System.Drawing.Image)
        Me.btn_abrirArchivo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_abrirArchivo.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_abrirArchivo.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_abrirArchivo.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_abrirArchivo.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_abrirArchivo.FlatAppearance.BorderSize = 0
        Me.btn_abrirArchivo.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_abrirArchivo.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_abrirArchivo.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_abrirArchivo.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_abrirArchivo.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_abrirArchivo.Location = New System.Drawing.Point(201, 10)
        Me.btn_abrirArchivo.Name = "btn_abrirArchivo"
        Me.btn_abrirArchivo.Size = New System.Drawing.Size(75, 35)
        Me.btn_abrirArchivo.TabIndex = 8
        Me.btn_abrirArchivo.Text = "Abrir"
        Me.btn_abrirArchivo.UseVisualStyleBackColor = False
        '
        'chk_Check
        '
        Me.chk_Check.AutoSize = True
        Me.chk_Check.Checked = True
        Me.chk_Check.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chk_Check.Location = New System.Drawing.Point(870, 18)
        Me.chk_Check.Name = "chk_Check"
        Me.chk_Check.Size = New System.Drawing.Size(57, 17)
        Me.chk_Check.TabIndex = 7
        Me.chk_Check.Text = "Check"
        Me.chk_Check.UseVisualStyleBackColor = True
        '
        'chk_debug
        '
        Me.chk_debug.AutoSize = True
        Me.chk_debug.Checked = True
        Me.chk_debug.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chk_debug.Location = New System.Drawing.Point(937, 18)
        Me.chk_debug.Name = "chk_debug"
        Me.chk_debug.Size = New System.Drawing.Size(58, 17)
        Me.chk_debug.TabIndex = 6
        Me.chk_debug.Text = "Debug"
        Me.chk_debug.UseVisualStyleBackColor = True
        '
        'chk_info
        '
        Me.chk_info.AutoSize = True
        Me.chk_info.Checked = True
        Me.chk_info.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chk_info.Location = New System.Drawing.Point(816, 18)
        Me.chk_info.Name = "chk_info"
        Me.chk_info.Size = New System.Drawing.Size(44, 17)
        Me.chk_info.TabIndex = 5
        Me.chk_info.Text = "Info"
        Me.chk_info.UseVisualStyleBackColor = True
        '
        'chk_warn
        '
        Me.chk_warn.AutoSize = True
        Me.chk_warn.Checked = True
        Me.chk_warn.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chk_warn.Location = New System.Drawing.Point(740, 18)
        Me.chk_warn.Name = "chk_warn"
        Me.chk_warn.Size = New System.Drawing.Size(66, 17)
        Me.chk_warn.TabIndex = 4
        Me.chk_warn.Text = "Warning"
        Me.chk_warn.UseVisualStyleBackColor = True
        '
        'chk_error
        '
        Me.chk_error.AutoSize = True
        Me.chk_error.Checked = True
        Me.chk_error.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chk_error.Location = New System.Drawing.Point(682, 18)
        Me.chk_error.Name = "chk_error"
        Me.chk_error.Size = New System.Drawing.Size(48, 17)
        Me.chk_error.TabIndex = 3
        Me.chk_error.Text = "Error"
        Me.chk_error.UseVisualStyleBackColor = True
        '
        'dtp_fecha
        '
        Me.dtp_fecha.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtp_fecha.Location = New System.Drawing.Point(6, 16)
        Me.dtp_fecha.Name = "dtp_fecha"
        Me.dtp_fecha.Size = New System.Drawing.Size(96, 20)
        Me.dtp_fecha.TabIndex = 2
        '
        'btn_buscar
        '
        Me.btn_buscar.BackColor = System.Drawing.Color.Transparent
        Me.btn_buscar.BackgroundImage = CType(resources.GetObject("btn_buscar.BackgroundImage"), System.Drawing.Image)
        Me.btn_buscar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_buscar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_buscar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_buscar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_buscar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_buscar.FlatAppearance.BorderSize = 0
        Me.btn_buscar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_buscar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_buscar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_buscar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_buscar.Location = New System.Drawing.Point(120, 10)
        Me.btn_buscar.Name = "btn_buscar"
        Me.btn_buscar.Size = New System.Drawing.Size(75, 35)
        Me.btn_buscar.TabIndex = 1
        Me.btn_buscar.Text = "Buscar"
        Me.btn_buscar.UseVisualStyleBackColor = False
        '
        'pnl_ampliar
        '
        Me.pnl_ampliar.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.pnl_ampliar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.pnl_ampliar.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.pnl_ampliar.Controls.Add(Me.btn_copiar)
        Me.pnl_ampliar.Controls.Add(Me.btn_cerrarPanel)
        Me.pnl_ampliar.Controls.Add(Me.txt_consulta)
        Me.pnl_ampliar.Location = New System.Drawing.Point(259, 414)
        Me.pnl_ampliar.Name = "pnl_ampliar"
        Me.pnl_ampliar.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.pnl_ampliar.Size = New System.Drawing.Size(450, 255)
        Me.pnl_ampliar.TabIndex = 1
        '
        'btn_copiar
        '
        Me.btn_copiar.BackColor = System.Drawing.Color.Transparent
        Me.btn_copiar.BackgroundImage = CType(resources.GetObject("btn_copiar.BackgroundImage"), System.Drawing.Image)
        Me.btn_copiar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_copiar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_copiar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_copiar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_copiar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_copiar.FlatAppearance.BorderSize = 0
        Me.btn_copiar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_copiar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_copiar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_copiar.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_copiar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_copiar.Location = New System.Drawing.Point(15, 3)
        Me.btn_copiar.Name = "btn_copiar"
        Me.btn_copiar.Size = New System.Drawing.Size(75, 36)
        Me.btn_copiar.TabIndex = 2
        Me.btn_copiar.Text = "Copiar"
        Me.btn_copiar.UseVisualStyleBackColor = False
        '
        'btn_cerrarPanel
        '
        Me.btn_cerrarPanel.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_cerrarPanel.BackColor = System.Drawing.Color.Transparent
        Me.btn_cerrarPanel.BackgroundImage = CType(resources.GetObject("btn_cerrarPanel.BackgroundImage"), System.Drawing.Image)
        Me.btn_cerrarPanel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btn_cerrarPanel.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btn_cerrarPanel.ColorEnFoco = System.Drawing.Color.Blue
        Me.btn_cerrarPanel.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_cerrarPanel.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btn_cerrarPanel.FlatAppearance.BorderSize = 0
        Me.btn_cerrarPanel.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btn_cerrarPanel.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btn_cerrarPanel.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btn_cerrarPanel.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btn_cerrarPanel.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btn_cerrarPanel.Location = New System.Drawing.Point(359, 3)
        Me.btn_cerrarPanel.Name = "btn_cerrarPanel"
        Me.btn_cerrarPanel.Size = New System.Drawing.Size(75, 36)
        Me.btn_cerrarPanel.TabIndex = 1
        Me.btn_cerrarPanel.Text = "Cerrar"
        Me.btn_cerrarPanel.UseVisualStyleBackColor = False
        '
        'txt_consulta
        '
        Me.txt_consulta.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txt_consulta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txt_consulta.Location = New System.Drawing.Point(15, 45)
        Me.txt_consulta.Multiline = True
        Me.txt_consulta.Name = "txt_consulta"
        Me.txt_consulta.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.txt_consulta.Size = New System.Drawing.Size(419, 192)
        Me.txt_consulta.TabIndex = 0
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'frm_logViewer
        '
        Me.AccessibleName = "LogViewer"
        Me.AllowDrop = True
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1025, 421)
        Me.Controls.Add(Me.pnl_ampliar)
        Me.Controls.Add(Me.grp_Filtros)
        Me.Controls.Add(Me.grp_gridViewer)
        Me.Name = "frm_logViewer"
        Me.Text = "Visor de log"
        Me.grp_gridViewer.ResumeLayout(False)
        Me.grp_gridViewer.PerformLayout()
        Me.grp_Filtros.ResumeLayout(False)
        Me.grp_Filtros.PerformLayout()
        Me.pnl_ampliar.ResumeLayout(False)
        Me.pnl_ampliar.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents grp_gridViewer As System.Windows.Forms.GroupBox
    Friend WithEvents dgv_logViewer As Fonseca_lib_controles.DataGridView_titulo
    Friend WithEvents btn_buscar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents grp_Filtros As System.Windows.Forms.GroupBox
    Friend WithEvents chk_Check As System.Windows.Forms.CheckBox
    Friend WithEvents chk_debug As System.Windows.Forms.CheckBox
    Friend WithEvents chk_info As System.Windows.Forms.CheckBox
    Friend WithEvents chk_warn As System.Windows.Forms.CheckBox
    Friend WithEvents chk_error As System.Windows.Forms.CheckBox
    Friend WithEvents dtp_fecha As System.Windows.Forms.DateTimePicker
    Friend WithEvents pnl_ampliar As System.Windows.Forms.Panel
    Friend WithEvents btn_cerrarPanel As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents txt_consulta As System.Windows.Forms.TextBox
    Friend WithEvents lbl_cantidadRegistros As System.Windows.Forms.Label
    Friend WithEvents btn_copiar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents btn_abrirArchivo As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents btn_irSiguiente As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents txt_search As System.Windows.Forms.TextBox
End Class
