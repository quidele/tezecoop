<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_procesar_archivos
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
Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
Me.ofd_abrir_archvo = New System.Windows.Forms.OpenFileDialog
Me.sfd_guardar_archivo = New System.Windows.Forms.SaveFileDialog
Me.grb_envio_recep_comprobantes = New System.Windows.Forms.GroupBox
Me.Label1 = New System.Windows.Forms.Label
Me.DGV_listaIREs = New System.Windows.Forms.DataGridView
Me.fecha_ire = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.Serie = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.num_ire = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.remito = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.estado_ire = New System.Windows.Forms.DataGridViewTextBoxColumn
Me.btn_busca_archivo = New System.Windows.Forms.Button
Me.btn_procesar = New System.Windows.Forms.Button
Me.Label2 = New System.Windows.Forms.Label
Me.txtArchivo = New System.Windows.Forms.TextBox
Me.Button1 = New System.Windows.Forms.Button
Me.grb_envio_recep_comprobantes.SuspendLayout()
CType(Me.DGV_listaIREs, System.ComponentModel.ISupportInitialize).BeginInit()
Me.SuspendLayout()
'
'ofd_abrir_archvo
'
Me.ofd_abrir_archvo.FileName = "OpenFileDialog1"
'
'grb_envio_recep_comprobantes
'
Me.grb_envio_recep_comprobantes.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.Button1)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.Label1)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.DGV_listaIREs)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.btn_busca_archivo)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.btn_procesar)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.Label2)
Me.grb_envio_recep_comprobantes.Controls.Add(Me.txtArchivo)
Me.grb_envio_recep_comprobantes.Location = New System.Drawing.Point(12, 11)
Me.grb_envio_recep_comprobantes.Name = "grb_envio_recep_comprobantes"
Me.grb_envio_recep_comprobantes.Size = New System.Drawing.Size(624, 333)
Me.grb_envio_recep_comprobantes.TabIndex = 5
Me.grb_envio_recep_comprobantes.TabStop = False
Me.grb_envio_recep_comprobantes.Text = "Envío de Comprobantes"
'
'Label1
'
Me.Label1.AutoSize = True
Me.Label1.Location = New System.Drawing.Point(19, 100)
Me.Label1.Name = "Label1"
Me.Label1.Size = New System.Drawing.Size(99, 13)
Me.Label1.TabIndex = 11
Me.Label1.Text = "Resultado / Errores"
'
'DGV_listaIREs
'
Me.DGV_listaIREs.AllowUserToAddRows = False
Me.DGV_listaIREs.AllowUserToDeleteRows = False
Me.DGV_listaIREs.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
Me.DGV_listaIREs.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
Me.DGV_listaIREs.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
Me.DGV_listaIREs.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.fecha_ire, Me.Serie, Me.num_ire, Me.remito, Me.estado_ire})
DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
Me.DGV_listaIREs.DefaultCellStyle = DataGridViewCellStyle2
Me.DGV_listaIREs.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
Me.DGV_listaIREs.Location = New System.Drawing.Point(22, 116)
Me.DGV_listaIREs.MultiSelect = False
Me.DGV_listaIREs.Name = "DGV_listaIREs"
DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
DataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control
DataGridViewCellStyle3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
DataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText
DataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight
DataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText
DataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
Me.DGV_listaIREs.RowHeadersDefaultCellStyle = DataGridViewCellStyle3
Me.DGV_listaIREs.RowTemplate.ReadOnly = True
Me.DGV_listaIREs.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
Me.DGV_listaIREs.Size = New System.Drawing.Size(585, 211)
Me.DGV_listaIREs.TabIndex = 10
'
'fecha_ire
'
Me.fecha_ire.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
Me.fecha_ire.HeaderText = "Documeto"
Me.fecha_ire.Name = "fecha_ire"
Me.fecha_ire.Width = 81
'
'Serie
'
Me.Serie.HeaderText = "Serie"
Me.Serie.Name = "Serie"
'
'num_ire
'
Me.num_ire.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
Me.num_ire.HeaderText = "Número"
Me.num_ire.Name = "num_ire"
Me.num_ire.Width = 69
'
'remito
'
Me.remito.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
Me.remito.HeaderText = "Estado"
Me.remito.Name = "remito"
Me.remito.Width = 65
'
'estado_ire
'
Me.estado_ire.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
Me.estado_ire.HeaderText = "Observación"
Me.estado_ire.Name = "estado_ire"
Me.estado_ire.Width = 92
'
'btn_busca_archivo
'
Me.btn_busca_archivo.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
Me.btn_busca_archivo.Location = New System.Drawing.Point(580, 38)
Me.btn_busca_archivo.Name = "btn_busca_archivo"
Me.btn_busca_archivo.Size = New System.Drawing.Size(27, 20)
Me.btn_busca_archivo.TabIndex = 8
Me.btn_busca_archivo.Text = "..."
Me.btn_busca_archivo.UseVisualStyleBackColor = True
'
'btn_procesar
'
Me.btn_procesar.Location = New System.Drawing.Point(22, 64)
Me.btn_procesar.Name = "btn_procesar"
Me.btn_procesar.Size = New System.Drawing.Size(121, 25)
Me.btn_procesar.TabIndex = 7
Me.btn_procesar.Text = "Generar"
Me.btn_procesar.UseVisualStyleBackColor = True
'
'Label2
'
Me.Label2.AutoSize = True
Me.Label2.Location = New System.Drawing.Point(19, 22)
Me.Label2.Name = "Label2"
Me.Label2.Size = New System.Drawing.Size(103, 13)
Me.Label2.TabIndex = 6
Me.Label2.Text = "Nombre del Archivo "
'
'txtArchivo
'
Me.txtArchivo.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
Me.txtArchivo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
Me.txtArchivo.Location = New System.Drawing.Point(22, 38)
Me.txtArchivo.Name = "txtArchivo"
Me.txtArchivo.Size = New System.Drawing.Size(562, 20)
Me.txtArchivo.TabIndex = 5
'
'Button1
'
Me.Button1.Location = New System.Drawing.Point(185, 68)
Me.Button1.Name = "Button1"
Me.Button1.Size = New System.Drawing.Size(144, 32)
Me.Button1.TabIndex = 12
Me.Button1.Text = "Button1"
Me.Button1.UseVisualStyleBackColor = True
'
'frm_procesar_archivos
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(648, 356)
Me.Controls.Add(Me.grb_envio_recep_comprobantes)
Me.Name = "frm_procesar_archivos"
Me.Text = "Facturar Plus - Factura Electrónica"
Me.grb_envio_recep_comprobantes.ResumeLayout(False)
Me.grb_envio_recep_comprobantes.PerformLayout()
CType(Me.DGV_listaIREs, System.ComponentModel.ISupportInitialize).EndInit()
Me.ResumeLayout(False)

End Sub
    Friend WithEvents ofd_abrir_archvo As System.Windows.Forms.OpenFileDialog
    Friend WithEvents sfd_guardar_archivo As System.Windows.Forms.SaveFileDialog
    Friend WithEvents grb_envio_recep_comprobantes As System.Windows.Forms.GroupBox
    Friend WithEvents btn_busca_archivo As System.Windows.Forms.Button
    Friend WithEvents btn_procesar As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtArchivo As System.Windows.Forms.TextBox
    Friend WithEvents DGV_listaIREs As System.Windows.Forms.DataGridView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents fecha_ire As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Serie As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents num_ire As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents remito As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents estado_ire As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Button1 As System.Windows.Forms.Button

End Class
