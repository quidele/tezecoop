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
        Dim DataGridViewCellStyle4 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle5 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle6 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Me.ofd_abrir_archvo = New System.Windows.Forms.OpenFileDialog
        Me.sfd_guardar_archivo = New System.Windows.Forms.SaveFileDialog
        Me.grb_envio_recep_comprobantes = New System.Windows.Forms.GroupBox
        Me.Btn_Recomenzar = New System.Windows.Forms.Button
        Me.DGV_ComprobantesAEnviar = New System.Windows.Forms.DataGridView
        Me.Label3 = New System.Windows.Forms.Label
        Me.DateTimePicker1 = New System.Windows.Forms.DateTimePicker
        Me.Btn_Procesar_Simu = New System.Windows.Forms.Button
        Me.StatusStrip = New System.Windows.Forms.StatusStrip
        Me.lblEstado = New System.Windows.Forms.ToolStripStatusLabel
        Me.lblBaseDatos = New System.Windows.Forms.ToolStripStatusLabel
        Me.Label1 = New System.Windows.Forms.Label
        Me.DGV_listaComprobantes = New System.Windows.Forms.DataGridView
        Me.cod_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.serie_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nro_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.remito = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.estado_ire = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.btn_busca_archivo = New System.Windows.Forms.Button
        Me.btn_procesar = New System.Windows.Forms.Button
        Me.Label2 = New System.Windows.Forms.Label
        Me.txtArchivo = New System.Windows.Forms.TextBox
        Me.lblVersion = New System.Windows.Forms.ToolStripStatusLabel
        Me.cod_doc_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nro_doc_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nro_trans_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nom_tit_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.imp_tot_mo_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.estado_envio_sel = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.grb_envio_recep_comprobantes.SuspendLayout()
        CType(Me.DGV_ComprobantesAEnviar, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.StatusStrip.SuspendLayout()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).BeginInit()
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
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.Btn_Recomenzar)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.DGV_ComprobantesAEnviar)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.Label3)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.DateTimePicker1)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.Btn_Procesar_Simu)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.StatusStrip)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.Label1)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.DGV_listaComprobantes)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.btn_busca_archivo)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.btn_procesar)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.Label2)
        Me.grb_envio_recep_comprobantes.Controls.Add(Me.txtArchivo)
        Me.grb_envio_recep_comprobantes.Location = New System.Drawing.Point(12, 11)
        Me.grb_envio_recep_comprobantes.Name = "grb_envio_recep_comprobantes"
        Me.grb_envio_recep_comprobantes.Size = New System.Drawing.Size(876, 645)
        Me.grb_envio_recep_comprobantes.TabIndex = 5
        Me.grb_envio_recep_comprobantes.TabStop = False
        Me.grb_envio_recep_comprobantes.Text = "Envío de Comprobantes"
        '
        'Btn_Recomenzar
        '
        Me.Btn_Recomenzar.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.Btn_Recomenzar.Location = New System.Drawing.Point(574, 64)
        Me.Btn_Recomenzar.Name = "Btn_Recomenzar"
        Me.Btn_Recomenzar.Size = New System.Drawing.Size(126, 25)
        Me.Btn_Recomenzar.TabIndex = 17
        Me.Btn_Recomenzar.Text = "Recomenzar"
        Me.Btn_Recomenzar.UseVisualStyleBackColor = False
        '
        'DGV_ComprobantesAEnviar
        '
        Me.DGV_ComprobantesAEnviar.AllowUserToAddRows = False
        Me.DGV_ComprobantesAEnviar.AllowUserToDeleteRows = False
        Me.DGV_ComprobantesAEnviar.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_ComprobantesAEnviar.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.DGV_ComprobantesAEnviar.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DGV_ComprobantesAEnviar.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.cod_doc_sel, Me.nro_doc_sel, Me.nro_trans_sel, Me.nom_tit_sel, Me.imp_tot_mo_sel, Me.estado_envio_sel})
        DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_ComprobantesAEnviar.DefaultCellStyle = DataGridViewCellStyle2
        Me.DGV_ComprobantesAEnviar.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_ComprobantesAEnviar.Location = New System.Drawing.Point(22, 140)
        Me.DGV_ComprobantesAEnviar.MultiSelect = False
        Me.DGV_ComprobantesAEnviar.Name = "DGV_ComprobantesAEnviar"
        DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_ComprobantesAEnviar.RowHeadersDefaultCellStyle = DataGridViewCellStyle3
        Me.DGV_ComprobantesAEnviar.RowTemplate.ReadOnly = True
        Me.DGV_ComprobantesAEnviar.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.DGV_ComprobantesAEnviar.Size = New System.Drawing.Size(837, 462)
        Me.DGV_ComprobantesAEnviar.TabIndex = 16
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(306, 70)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(94, 13)
        Me.Label3.TabIndex = 15
        Me.Label3.Text = "Fecha Simulación "
        '
        'DateTimePicker1
        '
        Me.DateTimePicker1.CalendarForeColor = System.Drawing.Color.Navy
        Me.DateTimePicker1.CalendarMonthBackground = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.DateTimePicker1.CalendarTitleBackColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.DateTimePicker1.CalendarTrailingForeColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.DateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DateTimePicker1.Location = New System.Drawing.Point(406, 64)
        Me.DateTimePicker1.Name = "DateTimePicker1"
        Me.DateTimePicker1.Size = New System.Drawing.Size(97, 20)
        Me.DateTimePicker1.TabIndex = 14
        Me.DateTimePicker1.Tag = "fechadesde"
        '
        'Btn_Procesar_Simu
        '
        Me.Btn_Procesar_Simu.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.Btn_Procesar_Simu.Location = New System.Drawing.Point(165, 64)
        Me.Btn_Procesar_Simu.Name = "Btn_Procesar_Simu"
        Me.Btn_Procesar_Simu.Size = New System.Drawing.Size(126, 25)
        Me.Btn_Procesar_Simu.TabIndex = 13
        Me.Btn_Procesar_Simu.Text = "Generar Simulación"
        Me.Btn_Procesar_Simu.UseVisualStyleBackColor = False
        '
        'StatusStrip
        '
        Me.StatusStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lblEstado, Me.lblBaseDatos, Me.lblVersion})
        Me.StatusStrip.Location = New System.Drawing.Point(3, 620)
        Me.StatusStrip.Name = "StatusStrip"
        Me.StatusStrip.Size = New System.Drawing.Size(870, 22)
        Me.StatusStrip.TabIndex = 12
        Me.StatusStrip.Text = "StatusStrip"
        '
        'lblEstado
        '
        Me.lblEstado.Name = "lblEstado"
        Me.lblEstado.Size = New System.Drawing.Size(42, 17)
        Me.lblEstado.Text = "Estado"
        '
        'lblBaseDatos
        '
        Me.lblBaseDatos.Name = "lblBaseDatos"
        Me.lblBaseDatos.Size = New System.Drawing.Size(79, 17)
        Me.lblBaseDatos.Text = "base de datos"
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
        'DGV_listaComprobantes
        '
        Me.DGV_listaComprobantes.AllowUserToAddRows = False
        Me.DGV_listaComprobantes.AllowUserToDeleteRows = False
        Me.DGV_listaComprobantes.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        DataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_listaComprobantes.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle4
        Me.DGV_listaComprobantes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DGV_listaComprobantes.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.cod_doc, Me.serie_doc, Me.nro_doc, Me.remito, Me.estado_ire})
        DataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_listaComprobantes.DefaultCellStyle = DataGridViewCellStyle5
        Me.DGV_listaComprobantes.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_listaComprobantes.Location = New System.Drawing.Point(22, 116)
        Me.DGV_listaComprobantes.MultiSelect = False
        Me.DGV_listaComprobantes.Name = "DGV_listaComprobantes"
        DataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle6.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle6.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle6.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle6.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle6.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_listaComprobantes.RowHeadersDefaultCellStyle = DataGridViewCellStyle6
        Me.DGV_listaComprobantes.RowTemplate.ReadOnly = True
        Me.DGV_listaComprobantes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.DGV_listaComprobantes.Size = New System.Drawing.Size(837, 486)
        Me.DGV_listaComprobantes.TabIndex = 10
        '
        'cod_doc
        '
        Me.cod_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
        Me.cod_doc.HeaderText = "Documento"
        Me.cod_doc.Name = "cod_doc"
        Me.cod_doc.Width = 87
        '
        'serie_doc
        '
        Me.serie_doc.HeaderText = "Serie"
        Me.serie_doc.Name = "serie_doc"
        '
        'nro_doc
        '
        Me.nro_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
        Me.nro_doc.HeaderText = "Número"
        Me.nro_doc.Name = "nro_doc"
        Me.nro_doc.Width = 69
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
        Me.estado_ire.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.estado_ire.HeaderText = "Observación"
        Me.estado_ire.Name = "estado_ire"
        Me.estado_ire.Width = 92
        '
        'btn_busca_archivo
        '
        Me.btn_busca_archivo.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_busca_archivo.Location = New System.Drawing.Point(832, 63)
        Me.btn_busca_archivo.Name = "btn_busca_archivo"
        Me.btn_busca_archivo.Size = New System.Drawing.Size(27, 20)
        Me.btn_busca_archivo.TabIndex = 8
        Me.btn_busca_archivo.Text = "..."
        Me.btn_busca_archivo.UseVisualStyleBackColor = True
        '
        'btn_procesar
        '
        Me.btn_procesar.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.btn_procesar.Location = New System.Drawing.Point(22, 64)
        Me.btn_procesar.Name = "btn_procesar"
        Me.btn_procesar.Size = New System.Drawing.Size(127, 25)
        Me.btn_procesar.TabIndex = 7
        Me.btn_procesar.Text = "Generar"
        Me.btn_procesar.UseVisualStyleBackColor = False
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
        Me.txtArchivo.Size = New System.Drawing.Size(837, 20)
        Me.txtArchivo.TabIndex = 5
        '
        'lblVersion
        '
        Me.lblVersion.Name = "lblVersion"
        Me.lblVersion.Size = New System.Drawing.Size(46, 17)
        Me.lblVersion.Text = "Version"
        '
        'cod_doc_sel
        '
        Me.cod_doc_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.cod_doc_sel.HeaderText = "Documento"
        Me.cod_doc_sel.Name = "cod_doc_sel"
        Me.cod_doc_sel.Width = 87
        '
        'nro_doc_sel
        '
        Me.nro_doc_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.nro_doc_sel.HeaderText = "Número"
        Me.nro_doc_sel.Name = "nro_doc_sel"
        Me.nro_doc_sel.Width = 69
        '
        'nro_trans_sel
        '
        Me.nro_trans_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.nro_trans_sel.HeaderText = "Solicitud"
        Me.nro_trans_sel.Name = "nro_trans_sel"
        Me.nro_trans_sel.Width = 72
        '
        'nom_tit_sel
        '
        Me.nom_tit_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.nom_tit_sel.HeaderText = "Cliente"
        Me.nom_tit_sel.Name = "nom_tit_sel"
        '
        'imp_tot_mo_sel
        '
        Me.imp_tot_mo_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.imp_tot_mo_sel.HeaderText = "Importe"
        Me.imp_tot_mo_sel.Name = "imp_tot_mo_sel"
        Me.imp_tot_mo_sel.Width = 67
        '
        'estado_envio_sel
        '
        Me.estado_envio_sel.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells
        Me.estado_envio_sel.HeaderText = "Estado"
        Me.estado_envio_sel.Name = "estado_envio_sel"
        Me.estado_envio_sel.Width = 65
        '
        'frm_procesar_archivos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(892, 668)
        Me.Controls.Add(Me.grb_envio_recep_comprobantes)
        Me.Name = "frm_procesar_archivos"
        Me.Text = "Facturar Plus - Factura Electrónica"
        Me.grb_envio_recep_comprobantes.ResumeLayout(False)
        Me.grb_envio_recep_comprobantes.PerformLayout()
        CType(Me.DGV_ComprobantesAEnviar, System.ComponentModel.ISupportInitialize).EndInit()
        Me.StatusStrip.ResumeLayout(False)
        Me.StatusStrip.PerformLayout()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ofd_abrir_archvo As System.Windows.Forms.OpenFileDialog
    Friend WithEvents sfd_guardar_archivo As System.Windows.Forms.SaveFileDialog
    Friend WithEvents grb_envio_recep_comprobantes As System.Windows.Forms.GroupBox
    Friend WithEvents btn_busca_archivo As System.Windows.Forms.Button
    Friend WithEvents btn_procesar As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtArchivo As System.Windows.Forms.TextBox
    Friend WithEvents DGV_listaComprobantes As System.Windows.Forms.DataGridView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents StatusStrip As System.Windows.Forms.StatusStrip
    Friend WithEvents lblEstado As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lblBaseDatos As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents Btn_Procesar_Simu As System.Windows.Forms.Button
    Friend WithEvents DateTimePicker1 As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents DGV_ComprobantesAEnviar As System.Windows.Forms.DataGridView
    Friend WithEvents Btn_Recomenzar As System.Windows.Forms.Button
    Friend WithEvents cod_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents serie_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nro_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents remito As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents estado_ire As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents lblVersion As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents cod_doc_sel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nro_doc_sel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nro_trans_sel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nom_tit_sel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents imp_tot_mo_sel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents estado_envio_sel As System.Windows.Forms.DataGridViewTextBoxColumn

End Class
