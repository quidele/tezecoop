<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm_obtieneCAE
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
        Me.DGV_Observaciones = New System.Windows.Forms.DataGridView
        Me.codigo_observ = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.descripcion_observ = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.DGV_listaComprobantes = New System.Windows.Forms.DataGridView
        Me.solicitud_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.cod_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.serie_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nro_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.importe_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.remito = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.gpbObtieneCAE = New System.Windows.Forms.GroupBox
        Me.btnConsultarCbtes = New System.Windows.Forms.Button
        Me.Splitter1 = New System.Windows.Forms.Splitter
        Me.btnActualizar = New System.Windows.Forms.Button
        Me.lblObservaciones = New System.Windows.Forms.Label
        Me.btn_procesar = New System.Windows.Forms.Button
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel2 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel3 = New System.Windows.Forms.ToolStripStatusLabel
        Me.StatusStrip = New System.Windows.Forms.StatusStrip
        Me.ToolStripStatusLabel5 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel6 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel7 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel4 = New System.Windows.Forms.ToolStripStatusLabel
        CType(Me.DGV_Observaciones, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gpbObtieneCAE.SuspendLayout()
        Me.StatusStrip.SuspendLayout()
        Me.SuspendLayout()
        '
        'DGV_Observaciones
        '
        Me.DGV_Observaciones.AllowUserToAddRows = False
        Me.DGV_Observaciones.AllowUserToDeleteRows = False
        Me.DGV_Observaciones.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_Observaciones.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.DGV_Observaciones.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DGV_Observaciones.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.codigo_observ, Me.descripcion_observ})
        DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_Observaciones.DefaultCellStyle = DataGridViewCellStyle2
        Me.DGV_Observaciones.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_Observaciones.Location = New System.Drawing.Point(9, 432)
        Me.DGV_Observaciones.MultiSelect = False
        Me.DGV_Observaciones.Name = "DGV_Observaciones"
        DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_Observaciones.RowHeadersDefaultCellStyle = DataGridViewCellStyle3
        Me.DGV_Observaciones.RowTemplate.ReadOnly = True
        Me.DGV_Observaciones.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.DGV_Observaciones.Size = New System.Drawing.Size(799, 165)
        Me.DGV_Observaciones.TabIndex = 17
        '
        'codigo_observ
        '
        Me.codigo_observ.HeaderText = "Código"
        Me.codigo_observ.Name = "codigo_observ"
        '
        'descripcion_observ
        '
        Me.descripcion_observ.HeaderText = "Descripción"
        Me.descripcion_observ.Name = "descripcion_observ"
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
        Me.DGV_listaComprobantes.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.solicitud_doc, Me.cod_doc, Me.serie_doc, Me.nro_doc, Me.importe_doc, Me.remito})
        DataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_listaComprobantes.DefaultCellStyle = DataGridViewCellStyle5
        Me.DGV_listaComprobantes.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_listaComprobantes.Location = New System.Drawing.Point(9, 84)
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
        Me.DGV_listaComprobantes.Size = New System.Drawing.Size(799, 330)
        Me.DGV_listaComprobantes.TabIndex = 18
        '
        'solicitud_doc
        '
        Me.solicitud_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.solicitud_doc.HeaderText = "Solicitud"
        Me.solicitud_doc.Name = "solicitud_doc"
        '
        'cod_doc
        '
        Me.cod_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.cod_doc.HeaderText = "Documento"
        Me.cod_doc.Name = "cod_doc"
        '
        'serie_doc
        '
        Me.serie_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
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
        'importe_doc
        '
        Me.importe_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.importe_doc.HeaderText = "Importe"
        Me.importe_doc.Name = "importe_doc"
        '
        'remito
        '
        Me.remito.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.remito.HeaderText = "Estado"
        Me.remito.Name = "remito"
        '
        'gpbObtieneCAE
        '
        Me.gpbObtieneCAE.Controls.Add(Me.btnConsultarCbtes)
        Me.gpbObtieneCAE.Controls.Add(Me.Splitter1)
        Me.gpbObtieneCAE.Controls.Add(Me.btnActualizar)
        Me.gpbObtieneCAE.Controls.Add(Me.lblObservaciones)
        Me.gpbObtieneCAE.Controls.Add(Me.btn_procesar)
        Me.gpbObtieneCAE.Controls.Add(Me.DGV_Observaciones)
        Me.gpbObtieneCAE.Controls.Add(Me.DGV_listaComprobantes)
        Me.gpbObtieneCAE.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gpbObtieneCAE.Location = New System.Drawing.Point(0, 0)
        Me.gpbObtieneCAE.Name = "gpbObtieneCAE"
        Me.gpbObtieneCAE.Size = New System.Drawing.Size(820, 622)
        Me.gpbObtieneCAE.TabIndex = 19
        Me.gpbObtieneCAE.TabStop = False
        Me.gpbObtieneCAE.Text = "Envío de comprobantes"
        '
        'btnConsultarCbtes
        '
        Me.btnConsultarCbtes.Location = New System.Drawing.Point(90, 55)
        Me.btnConsultarCbtes.Name = "btnConsultarCbtes"
        Me.btnConsultarCbtes.Size = New System.Drawing.Size(135, 23)
        Me.btnConsultarCbtes.TabIndex = 23
        Me.btnConsultarCbtes.Text = "Consultar comprobantes"
        Me.btnConsultarCbtes.UseVisualStyleBackColor = True
        '
        'Splitter1
        '
        Me.Splitter1.Location = New System.Drawing.Point(3, 16)
        Me.Splitter1.Name = "Splitter1"
        Me.Splitter1.Size = New System.Drawing.Size(3, 603)
        Me.Splitter1.TabIndex = 22
        Me.Splitter1.TabStop = False
        '
        'btnActualizar
        '
        Me.btnActualizar.Location = New System.Drawing.Point(9, 55)
        Me.btnActualizar.Name = "btnActualizar"
        Me.btnActualizar.Size = New System.Drawing.Size(75, 23)
        Me.btnActualizar.TabIndex = 21
        Me.btnActualizar.Text = "Actualizar"
        Me.btnActualizar.UseVisualStyleBackColor = True
        '
        'lblObservaciones
        '
        Me.lblObservaciones.Anchor = System.Windows.Forms.AnchorStyles.Left
        Me.lblObservaciones.AutoSize = True
        Me.lblObservaciones.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblObservaciones.Location = New System.Drawing.Point(9, 416)
        Me.lblObservaciones.Name = "lblObservaciones"
        Me.lblObservaciones.Size = New System.Drawing.Size(81, 13)
        Me.lblObservaciones.TabIndex = 20
        Me.lblObservaciones.Text = "Observaciones:"
        '
        'btn_procesar
        '
        Me.btn_procesar.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_procesar.BackColor = System.Drawing.Color.Transparent
        Me.btn_procesar.Location = New System.Drawing.Point(681, 16)
        Me.btn_procesar.Name = "btn_procesar"
        Me.btn_procesar.Size = New System.Drawing.Size(127, 25)
        Me.btn_procesar.TabIndex = 19
        Me.btn_procesar.Text = "Enviar a A F I P"
        Me.btn_procesar.UseVisualStyleBackColor = False
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(121, 17)
        Me.ToolStripStatusLabel1.Text = "ToolStripStatusLabel1"
        '
        'ToolStripStatusLabel2
        '
        Me.ToolStripStatusLabel2.Name = "ToolStripStatusLabel2"
        Me.ToolStripStatusLabel2.Size = New System.Drawing.Size(121, 17)
        Me.ToolStripStatusLabel2.Text = "ToolStripStatusLabel2"
        '
        'ToolStripStatusLabel3
        '
        Me.ToolStripStatusLabel3.Name = "ToolStripStatusLabel3"
        Me.ToolStripStatusLabel3.Size = New System.Drawing.Size(121, 17)
        Me.ToolStripStatusLabel3.Text = "ToolStripStatusLabel3"
        '
        'StatusStrip
        '
        Me.StatusStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel5, Me.ToolStripStatusLabel6, Me.ToolStripStatusLabel7})
        Me.StatusStrip.Location = New System.Drawing.Point(0, 598)
        Me.StatusStrip.Name = "StatusStrip"
        Me.StatusStrip.Size = New System.Drawing.Size(820, 24)
        Me.StatusStrip.TabIndex = 20
        Me.StatusStrip.Text = "StatusStrip"
        '
        'ToolStripStatusLabel5
        '
        Me.ToolStripStatusLabel5.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel5.Name = "ToolStripStatusLabel5"
        Me.ToolStripStatusLabel5.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel5.Text = "ToolStripStatusLabel1"
        '
        'ToolStripStatusLabel6
        '
        Me.ToolStripStatusLabel6.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel6.Name = "ToolStripStatusLabel6"
        Me.ToolStripStatusLabel6.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel6.Text = "ToolStripStatusLabel6"
        '
        'ToolStripStatusLabel7
        '
        Me.ToolStripStatusLabel7.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel7.Name = "ToolStripStatusLabel7"
        Me.ToolStripStatusLabel7.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel7.Text = "ToolStripStatusLabel7"
        '
        'ToolStripStatusLabel
        '
        Me.ToolStripStatusLabel.Name = "ToolStripStatusLabel"
        Me.ToolStripStatusLabel.Size = New System.Drawing.Size(42, 17)
        Me.ToolStripStatusLabel.Text = "Estado"
        '
        'ToolStripStatusLabel4
        '
        Me.ToolStripStatusLabel4.Name = "ToolStripStatusLabel4"
        Me.ToolStripStatusLabel4.Size = New System.Drawing.Size(79, 17)
        Me.ToolStripStatusLabel4.Text = "base de datos"
        '
        'Frm_obtieneCAE
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink
        Me.ClientSize = New System.Drawing.Size(820, 622)
        Me.Controls.Add(Me.StatusStrip)
        Me.Controls.Add(Me.gpbObtieneCAE)
        Me.MinimumSize = New System.Drawing.Size(253, 473)
        Me.Name = "Frm_obtieneCAE"
        Me.Text = "Factura electrónica - Mercado local"
        CType(Me.DGV_Observaciones, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gpbObtieneCAE.ResumeLayout(False)
        Me.gpbObtieneCAE.PerformLayout()
        Me.StatusStrip.ResumeLayout(False)
        Me.StatusStrip.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DGV_Observaciones As System.Windows.Forms.DataGridView
    Friend WithEvents DGV_listaComprobantes As System.Windows.Forms.DataGridView
    Friend WithEvents gpbObtieneCAE As System.Windows.Forms.GroupBox
    Friend WithEvents lblObservaciones As System.Windows.Forms.Label
    Friend WithEvents codigo_observ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents descripcion_observ As System.Windows.Forms.DataGridViewTextBoxColumn
    Public WithEvents btn_procesar As System.Windows.Forms.Button
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents btnActualizar As System.Windows.Forms.Button
    Friend WithEvents ToolStripStatusLabel2 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel3 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel4 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents Splitter1 As System.Windows.Forms.Splitter
    Friend WithEvents solicitud_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents cod_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents serie_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nro_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents importe_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents remito As System.Windows.Forms.DataGridViewTextBoxColumn
    Public WithEvents StatusStrip As System.Windows.Forms.StatusStrip
    Public WithEvents ToolStripStatusLabel5 As System.Windows.Forms.ToolStripStatusLabel
    Public WithEvents ToolStripStatusLabel6 As System.Windows.Forms.ToolStripStatusLabel
    Public WithEvents ToolStripStatusLabel7 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents btnConsultarCbtes As System.Windows.Forms.Button
End Class
