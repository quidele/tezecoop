<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmPrincipal
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
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmPrincipal))
        Me.ofDialog = New System.Windows.Forms.OpenFileDialog
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip
        Me.progressBar = New System.Windows.Forms.ToolStripProgressBar
        Me.lbl_ts_Log = New System.Windows.Forms.ToolStripStatusLabel
        Me.lbl_ts_Version = New System.Windows.Forms.ToolStripStatusLabel
        Me.lbl_ts_BaseActiva = New System.Windows.Forms.ToolStripStatusLabel
        Me.lbl_ts_Usuario = New System.Windows.Forms.ToolStripStatusLabel
        Me.dgvDatos = New System.Windows.Forms.DataGridView
        Me.DataGridView1 = New System.Windows.Forms.DataGridView
        Me.tabPrincipal = New System.Windows.Forms.TabControl
        Me.tab_hoja_1 = New System.Windows.Forms.TabPage
        Me.lblRechazados = New System.Windows.Forms.Label
        Me.lstRechazados = New System.Windows.Forms.ListBox
        Me.lstHojas = New System.Windows.Forms.ListBox
        Me.lblRuta = New System.Windows.Forms.Label
        Me.txtRuta = New System.Windows.Forms.TextBox
        Me.btnBuscar = New System.Windows.Forms.Button
        Me.cmbHojas = New System.Windows.Forms.ComboBox
        Me.lblHoja = New System.Windows.Forms.Label
        Me.ErrorProvider1 = New System.Windows.Forms.ErrorProvider(Me.components)
        Me.tstBarraSuperior = New System.Windows.Forms.ToolStrip
        Me.btnAbrir = New System.Windows.Forms.ToolStripButton
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator
        Me.btnEjecutar = New System.Windows.Forms.ToolStripButton
        Me.picBox = New System.Windows.Forms.PictureBox
        Me.TabControl1 = New System.Windows.Forms.TabControl
        Me.TabTablaErr = New System.Windows.Forms.TabPage
        Me.tabDatos = New System.Windows.Forms.TabPage
        Me.tabReport = New System.Windows.Forms.TabPage
        Me.txtReporte = New System.Windows.Forms.TextBox
        Me.bgw = New System.ComponentModel.BackgroundWorker
        Me.StatusStrip1.SuspendLayout()
        CType(Me.dgvDatos, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.tabPrincipal.SuspendLayout()
        Me.tab_hoja_1.SuspendLayout()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.tstBarraSuperior.SuspendLayout()
        CType(Me.picBox, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.TabTablaErr.SuspendLayout()
        Me.tabDatos.SuspendLayout()
        Me.tabReport.SuspendLayout()
        Me.SuspendLayout()
        '
        'ofDialog
        '
        Me.ofDialog.DereferenceLinks = False
        Me.ofDialog.FileName = "ofDialog"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.progressBar, Me.lbl_ts_Log, Me.lbl_ts_Version, Me.lbl_ts_BaseActiva, Me.lbl_ts_Usuario})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 378)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.RightToLeft = System.Windows.Forms.RightToLeft.Yes
        Me.StatusStrip1.Size = New System.Drawing.Size(657, 24)
        Me.StatusStrip1.TabIndex = 10
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'progressBar
        '
        Me.progressBar.Name = "progressBar"
        Me.progressBar.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.progressBar.Size = New System.Drawing.Size(100, 18)
        '
        'lbl_ts_Log
        '
        Me.lbl_ts_Log.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.lbl_ts_Log.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter
        Me.lbl_ts_Log.Name = "lbl_ts_Log"
        Me.lbl_ts_Log.Size = New System.Drawing.Size(28, 19)
        Me.lbl_ts_Log.Text = "Log"
        '
        'lbl_ts_Version
        '
        Me.lbl_ts_Version.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.lbl_ts_Version.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.lbl_ts_Version.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter
        Me.lbl_ts_Version.Name = "lbl_ts_Version"
        Me.lbl_ts_Version.Size = New System.Drawing.Size(46, 19)
        Me.lbl_ts_Version.Text = "Version"
        '
        'lbl_ts_BaseActiva
        '
        Me.lbl_ts_BaseActiva.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.lbl_ts_BaseActiva.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter
        Me.lbl_ts_BaseActiva.Name = "lbl_ts_BaseActiva"
        Me.lbl_ts_BaseActiva.Size = New System.Drawing.Size(64, 19)
        Me.lbl_ts_BaseActiva.Text = "BaseActiva"
        '
        'lbl_ts_Usuario
        '
        Me.lbl_ts_Usuario.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.lbl_ts_Usuario.BorderStyle = System.Windows.Forms.Border3DStyle.SunkenOuter
        Me.lbl_ts_Usuario.Name = "lbl_ts_Usuario"
        Me.lbl_ts_Usuario.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.lbl_ts_Usuario.Size = New System.Drawing.Size(47, 19)
        Me.lbl_ts_Usuario.Text = "Usuario"
        '
        'dgvDatos
        '
        Me.dgvDatos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvDatos.Location = New System.Drawing.Point(9, 6)
        Me.dgvDatos.Name = "dgvDatos"
        Me.dgvDatos.Size = New System.Drawing.Size(604, 164)
        Me.dgvDatos.TabIndex = 7
        '
        'DataGridView1
        '
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Location = New System.Drawing.Point(9, 6)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(253, 108)
        Me.DataGridView1.TabIndex = 0
        '
        'tabPrincipal
        '
        Me.tabPrincipal.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.tabPrincipal.Controls.Add(Me.tab_hoja_1)
        Me.tabPrincipal.Location = New System.Drawing.Point(12, 81)
        Me.tabPrincipal.Name = "tabPrincipal"
        Me.tabPrincipal.SelectedIndex = 0
        Me.tabPrincipal.Size = New System.Drawing.Size(633, 284)
        Me.tabPrincipal.TabIndex = 12
        Me.tabPrincipal.TabStop = False
        '
        'tab_hoja_1
        '
        Me.tab_hoja_1.Controls.Add(Me.TabControl1)
        Me.tab_hoja_1.Controls.Add(Me.lblRechazados)
        Me.tab_hoja_1.Controls.Add(Me.lstRechazados)
        Me.tab_hoja_1.Controls.Add(Me.lstHojas)
        Me.tab_hoja_1.Controls.Add(Me.lblRuta)
        Me.tab_hoja_1.Controls.Add(Me.txtRuta)
        Me.tab_hoja_1.Controls.Add(Me.btnBuscar)
        Me.tab_hoja_1.Controls.Add(Me.cmbHojas)
        Me.tab_hoja_1.Controls.Add(Me.lblHoja)
        Me.tab_hoja_1.Location = New System.Drawing.Point(4, 22)
        Me.tab_hoja_1.Name = "tab_hoja_1"
        Me.tab_hoja_1.Padding = New System.Windows.Forms.Padding(3)
        Me.tab_hoja_1.Size = New System.Drawing.Size(625, 258)
        Me.tab_hoja_1.TabIndex = 0
        Me.tab_hoja_1.Text = "Datos"
        Me.tab_hoja_1.UseVisualStyleBackColor = True
        '
        'lblRechazados
        '
        Me.lblRechazados.AutoSize = True
        Me.lblRechazados.Location = New System.Drawing.Point(177, 58)
        Me.lblRechazados.Name = "lblRechazados"
        Me.lblRechazados.Size = New System.Drawing.Size(67, 13)
        Me.lblRechazados.TabIndex = 14
        Me.lblRechazados.Text = "Rechazados"
        Me.lblRechazados.Visible = False
        '
        'lstRechazados
        '
        Me.lstRechazados.FormattingEnabled = True
        Me.lstRechazados.Location = New System.Drawing.Point(180, 74)
        Me.lstRechazados.Name = "lstRechazados"
        Me.lstRechazados.Size = New System.Drawing.Size(151, 147)
        Me.lstRechazados.TabIndex = 13
        Me.lstRechazados.Visible = False
        '
        'lstHojas
        '
        Me.lstHojas.FormattingEnabled = True
        Me.lstHojas.Location = New System.Drawing.Point(9, 74)
        Me.lstHojas.Name = "lstHojas"
        Me.lstHojas.SelectionMode = System.Windows.Forms.SelectionMode.MultiSimple
        Me.lstHojas.Size = New System.Drawing.Size(165, 173)
        Me.lstHojas.TabIndex = 12
        '
        'lblRuta
        '
        Me.lblRuta.AutoSize = True
        Me.lblRuta.Location = New System.Drawing.Point(6, 18)
        Me.lblRuta.Name = "lblRuta"
        Me.lblRuta.Size = New System.Drawing.Size(101, 13)
        Me.lblRuta.TabIndex = 5
        Me.lblRuta.Text = "Seleccione archivo "
        '
        'txtRuta
        '
        Me.txtRuta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtRuta.Location = New System.Drawing.Point(9, 34)
        Me.txtRuta.Name = "txtRuta"
        Me.txtRuta.Size = New System.Drawing.Size(519, 20)
        Me.txtRuta.TabIndex = 1
        '
        'btnBuscar
        '
        Me.btnBuscar.BackgroundImage = Global.WindowsApplication1.My.Resources.Resources.abrir_2
        Me.btnBuscar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center
        Me.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnBuscar.Location = New System.Drawing.Point(550, 34)
        Me.btnBuscar.Name = "btnBuscar"
        Me.btnBuscar.Size = New System.Drawing.Size(27, 22)
        Me.btnBuscar.TabIndex = 6
        Me.btnBuscar.UseVisualStyleBackColor = True
        '
        'cmbHojas
        '
        Me.cmbHojas.BackColor = System.Drawing.SystemColors.Window
        Me.cmbHojas.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.cmbHojas.FormattingEnabled = True
        Me.cmbHojas.Location = New System.Drawing.Point(460, 7)
        Me.cmbHojas.Name = "cmbHojas"
        Me.cmbHojas.Size = New System.Drawing.Size(153, 21)
        Me.cmbHojas.TabIndex = 2
        '
        'lblHoja
        '
        Me.lblHoja.AutoSize = True
        Me.lblHoja.Location = New System.Drawing.Point(6, 58)
        Me.lblHoja.Name = "lblHoja"
        Me.lblHoja.Size = New System.Drawing.Size(34, 13)
        Me.lblHoja.TabIndex = 6
        Me.lblHoja.Text = "Hojas"
        '
        'ErrorProvider1
        '
        Me.ErrorProvider1.ContainerControl = Me
        '
        'tstBarraSuperior
        '
        Me.tstBarraSuperior.AutoSize = False
        Me.tstBarraSuperior.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.tstBarraSuperior.BackgroundImage = Global.WindowsApplication1.My.Resources.Resources.barraMenu
        Me.tstBarraSuperior.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.tstBarraSuperior.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden
        Me.tstBarraSuperior.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.btnAbrir, Me.ToolStripSeparator1, Me.btnEjecutar})
        Me.tstBarraSuperior.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.HorizontalStackWithOverflow
        Me.tstBarraSuperior.Location = New System.Drawing.Point(0, 50)
        Me.tstBarraSuperior.Name = "tstBarraSuperior"
        Me.tstBarraSuperior.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional
        Me.tstBarraSuperior.Size = New System.Drawing.Size(657, 25)
        Me.tstBarraSuperior.Stretch = True
        Me.tstBarraSuperior.TabIndex = 5
        '
        'btnAbrir
        '
        Me.btnAbrir.Image = Global.WindowsApplication1.My.Resources.Resources.abrir_2
        Me.btnAbrir.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.btnAbrir.Name = "btnAbrir"
        Me.btnAbrir.Size = New System.Drawing.Size(50, 22)
        Me.btnAbrir.Text = "Abrir"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'btnEjecutar
        '
        Me.btnEjecutar.Image = Global.WindowsApplication1.My.Resources.Resources.Ejecutar
        Me.btnEjecutar.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.btnEjecutar.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.btnEjecutar.Name = "btnEjecutar"
        Me.btnEjecutar.Size = New System.Drawing.Size(67, 22)
        Me.btnEjecutar.Text = "Ejecutar"
        '
        'picBox
        '
        Me.picBox.BackgroundImage = Global.WindowsApplication1.My.Resources.Resources.BarraSuperior
        Me.picBox.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.picBox.Dock = System.Windows.Forms.DockStyle.Top
        Me.picBox.Location = New System.Drawing.Point(0, 0)
        Me.picBox.Name = "picBox"
        Me.picBox.Size = New System.Drawing.Size(657, 50)
        Me.picBox.TabIndex = 8
        Me.picBox.TabStop = False
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabTablaErr)
        Me.TabControl1.Controls.Add(Me.tabDatos)
        Me.TabControl1.Controls.Add(Me.tabReport)
        Me.TabControl1.Location = New System.Drawing.Point(337, 74)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(276, 147)
        Me.TabControl1.TabIndex = 13
        Me.TabControl1.Visible = False
        '
        'TabTablaErr
        '
        Me.TabTablaErr.Controls.Add(Me.DataGridView1)
        Me.TabTablaErr.Location = New System.Drawing.Point(4, 22)
        Me.TabTablaErr.Name = "TabTablaErr"
        Me.TabTablaErr.Padding = New System.Windows.Forms.Padding(3)
        Me.TabTablaErr.Size = New System.Drawing.Size(268, 121)
        Me.TabTablaErr.TabIndex = 0
        Me.TabTablaErr.Text = "Table Errores"
        Me.TabTablaErr.UseVisualStyleBackColor = True
        '
        'tabDatos
        '
        Me.tabDatos.Controls.Add(Me.dgvDatos)
        Me.tabDatos.Location = New System.Drawing.Point(4, 22)
        Me.tabDatos.Name = "tabDatos"
        Me.tabDatos.Padding = New System.Windows.Forms.Padding(3)
        Me.tabDatos.Size = New System.Drawing.Size(619, 176)
        Me.tabDatos.TabIndex = 1
        Me.tabDatos.Text = "Datos"
        Me.tabDatos.UseVisualStyleBackColor = True
        '
        'tabReport
        '
        Me.tabReport.Controls.Add(Me.txtReporte)
        Me.tabReport.Location = New System.Drawing.Point(4, 22)
        Me.tabReport.Name = "tabReport"
        Me.tabReport.Padding = New System.Windows.Forms.Padding(3)
        Me.tabReport.Size = New System.Drawing.Size(619, 176)
        Me.tabReport.TabIndex = 2
        Me.tabReport.Text = "Reporte"
        Me.tabReport.UseVisualStyleBackColor = True
        '
        'txtReporte
        '
        Me.txtReporte.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.txtReporte.Location = New System.Drawing.Point(9, 6)
        Me.txtReporte.Multiline = True
        Me.txtReporte.Name = "txtReporte"
        Me.txtReporte.ReadOnly = True
        Me.txtReporte.Size = New System.Drawing.Size(604, 164)
        Me.txtReporte.TabIndex = 0
        '
        'frmPrincipal
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(657, 402)
        Me.Controls.Add(Me.tabPrincipal)
        Me.Controls.Add(Me.tstBarraSuperior)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.picBox)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "frmPrincipal"
        Me.Text = "Formulario"
        Me.TransparencyKey = System.Drawing.Color.DarkRed
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        CType(Me.dgvDatos, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.tabPrincipal.ResumeLayout(False)
        Me.tab_hoja_1.ResumeLayout(False)
        Me.tab_hoja_1.PerformLayout()
        CType(Me.ErrorProvider1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.tstBarraSuperior.ResumeLayout(False)
        Me.tstBarraSuperior.PerformLayout()
        CType(Me.picBox, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.TabTablaErr.ResumeLayout(False)
        Me.tabDatos.ResumeLayout(False)
        Me.tabReport.ResumeLayout(False)
        Me.tabReport.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ofDialog As System.Windows.Forms.OpenFileDialog
    Friend WithEvents picBox As System.Windows.Forms.PictureBox
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents tstBarraSuperior As System.Windows.Forms.ToolStrip
    Friend WithEvents ToolStripSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents btnEjecutar As System.Windows.Forms.ToolStripButton
    Friend WithEvents progressBar As System.Windows.Forms.ToolStripProgressBar
    Friend WithEvents lbl_ts_Log As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents dgvDatos As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents tabPrincipal As System.Windows.Forms.TabControl
    Friend WithEvents btnAbrir As System.Windows.Forms.ToolStripButton
    Friend WithEvents ErrorProvider1 As System.Windows.Forms.ErrorProvider
    Friend WithEvents lbl_ts_Version As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_ts_BaseActiva As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lbl_ts_Usuario As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabTablaErr As System.Windows.Forms.TabPage
    Friend WithEvents tabDatos As System.Windows.Forms.TabPage
    Friend WithEvents tabReport As System.Windows.Forms.TabPage
    Friend WithEvents txtReporte As System.Windows.Forms.TextBox
    Friend WithEvents bgw As System.ComponentModel.BackgroundWorker
    Friend WithEvents tab_hoja_1 As System.Windows.Forms.TabPage
    Friend WithEvents lblRechazados As System.Windows.Forms.Label
    Friend WithEvents lstRechazados As System.Windows.Forms.ListBox
    Friend WithEvents lstHojas As System.Windows.Forms.ListBox
    Friend WithEvents lblRuta As System.Windows.Forms.Label
    Friend WithEvents txtRuta As System.Windows.Forms.TextBox
    Friend WithEvents btnBuscar As System.Windows.Forms.Button
    Friend WithEvents cmbHojas As System.Windows.Forms.ComboBox
    Friend WithEvents lblHoja As System.Windows.Forms.Label

End Class
