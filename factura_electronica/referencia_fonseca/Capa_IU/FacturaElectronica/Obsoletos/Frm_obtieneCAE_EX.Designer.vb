<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm_ObtieneCAE_EX
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
        Dim DataGridViewCellStyle7 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle8 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle9 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle10 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle11 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Dim DataGridViewCellStyle12 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle
        Me.gpbObtieneCAE = New System.Windows.Forms.GroupBox
        Me.btnConsultarCbtes = New System.Windows.Forms.Button
        Me.btnActualizar = New System.Windows.Forms.Button
        Me.lblObservaciones = New System.Windows.Forms.Label
        Me.btn_procesar = New System.Windows.Forms.Button
        Me.DGV_Observaciones = New System.Windows.Forms.DataGridView
        Me.codigo_observ = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.descripcion_observ = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.DGV_listaComprobantes = New System.Windows.Forms.DataGridView
        Me.cod_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.solicitud_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nro_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.serie_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.nom_cliente = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.importe_doc = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.remito = New System.Windows.Forms.DataGridViewTextBoxColumn
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip
        Me.ToolStripStatusLabel1 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel2 = New System.Windows.Forms.ToolStripStatusLabel
        Me.ToolStripStatusLabel3 = New System.Windows.Forms.ToolStripStatusLabel
        Me.gpbObtieneCAE.SuspendLayout()
        CType(Me.DGV_Observaciones, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.StatusStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'gpbObtieneCAE
        '
        Me.gpbObtieneCAE.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.gpbObtieneCAE.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink
        Me.gpbObtieneCAE.Controls.Add(Me.btnConsultarCbtes)
        Me.gpbObtieneCAE.Controls.Add(Me.btnActualizar)
        Me.gpbObtieneCAE.Controls.Add(Me.lblObservaciones)
        Me.gpbObtieneCAE.Controls.Add(Me.btn_procesar)
        Me.gpbObtieneCAE.Controls.Add(Me.DGV_Observaciones)
        Me.gpbObtieneCAE.Controls.Add(Me.DGV_listaComprobantes)
        Me.gpbObtieneCAE.Location = New System.Drawing.Point(0, 0)
        Me.gpbObtieneCAE.Name = "gpbObtieneCAE"
        Me.gpbObtieneCAE.Size = New System.Drawing.Size(820, 713)
        Me.gpbObtieneCAE.TabIndex = 20
        Me.gpbObtieneCAE.TabStop = False
        Me.gpbObtieneCAE.Text = "Envío de comprobantes"
        '
        'btnConsultarCbtes
        '
        Me.btnConsultarCbtes.Location = New System.Drawing.Point(90, 55)
        Me.btnConsultarCbtes.Name = "btnConsultarCbtes"
        Me.btnConsultarCbtes.Size = New System.Drawing.Size(139, 23)
        Me.btnConsultarCbtes.TabIndex = 24
        Me.btnConsultarCbtes.Text = "Consultar comprobantes"
        Me.btnConsultarCbtes.UseVisualStyleBackColor = True
        '
        'btnActualizar
        '
        Me.btnActualizar.Location = New System.Drawing.Point(5, 55)
        Me.btnActualizar.Name = "btnActualizar"
        Me.btnActualizar.Size = New System.Drawing.Size(79, 23)
        Me.btnActualizar.TabIndex = 21
        Me.btnActualizar.Text = "Actualizar"
        Me.btnActualizar.UseVisualStyleBackColor = True
        '
        'lblObservaciones
        '
        Me.lblObservaciones.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblObservaciones.Location = New System.Drawing.Point(6, 422)
        Me.lblObservaciones.Name = "lblObservaciones"
        Me.lblObservaciones.Size = New System.Drawing.Size(81, 13)
        Me.lblObservaciones.TabIndex = 20
        Me.lblObservaciones.Text = "Observaciones:"
        '
        'btn_procesar
        '
        Me.btn_procesar.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btn_procesar.BackColor = System.Drawing.SystemColors.Control
        Me.btn_procesar.Location = New System.Drawing.Point(683, 19)
        Me.btn_procesar.Name = "btn_procesar"
        Me.btn_procesar.Size = New System.Drawing.Size(131, 25)
        Me.btn_procesar.TabIndex = 19
        Me.btn_procesar.Text = "Enviar a A F I P"
        Me.btn_procesar.UseVisualStyleBackColor = True
        '
        'DGV_Observaciones
        '
        Me.DGV_Observaciones.AllowUserToAddRows = False
        Me.DGV_Observaciones.AllowUserToDeleteRows = False
        Me.DGV_Observaciones.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        DataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle7.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_Observaciones.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle7
        Me.DGV_Observaciones.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DGV_Observaciones.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.codigo_observ, Me.descripcion_observ})
        DataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle8.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_Observaciones.DefaultCellStyle = DataGridViewCellStyle8
        Me.DGV_Observaciones.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_Observaciones.Location = New System.Drawing.Point(6, 438)
        Me.DGV_Observaciones.MultiSelect = False
        Me.DGV_Observaciones.Name = "DGV_Observaciones"
        DataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle9.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle9.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle9.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle9.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle9.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_Observaciones.RowHeadersDefaultCellStyle = DataGridViewCellStyle9
        Me.DGV_Observaciones.RowTemplate.ReadOnly = True
        Me.DGV_Observaciones.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.DGV_Observaciones.Size = New System.Drawing.Size(808, 146)
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
        DataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle10.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle10.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle10.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle10.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle10.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle10.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_listaComprobantes.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle10
        Me.DGV_listaComprobantes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DGV_listaComprobantes.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.cod_doc, Me.solicitud_doc, Me.nro_doc, Me.serie_doc, Me.nom_cliente, Me.importe_doc, Me.remito})
        DataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle11.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle11.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle11.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle11.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle11.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.DGV_listaComprobantes.DefaultCellStyle = DataGridViewCellStyle11
        Me.DGV_listaComprobantes.EditMode = System.Windows.Forms.DataGridViewEditMode.EditOnEnter
        Me.DGV_listaComprobantes.Location = New System.Drawing.Point(6, 84)
        Me.DGV_listaComprobantes.MultiSelect = False
        Me.DGV_listaComprobantes.Name = "DGV_listaComprobantes"
        DataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle12.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle12.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle12.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle12.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle12.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle12.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DGV_listaComprobantes.RowHeadersDefaultCellStyle = DataGridViewCellStyle12
        Me.DGV_listaComprobantes.RowTemplate.ReadOnly = True
        Me.DGV_listaComprobantes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.DGV_listaComprobantes.Size = New System.Drawing.Size(808, 335)
        Me.DGV_listaComprobantes.TabIndex = 18
        '
        'cod_doc
        '
        Me.cod_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.cod_doc.HeaderText = "Documento"
        Me.cod_doc.Name = "cod_doc"
        '
        'solicitud_doc
        '
        Me.solicitud_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.solicitud_doc.HeaderText = "Solicitud"
        Me.solicitud_doc.Name = "solicitud_doc"
        '
        'nro_doc
        '
        Me.nro_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.ColumnHeader
        Me.nro_doc.HeaderText = "Número"
        Me.nro_doc.Name = "nro_doc"
        Me.nro_doc.Width = 69
        '
        'serie_doc
        '
        Me.serie_doc.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
        Me.serie_doc.HeaderText = "Serie"
        Me.serie_doc.Name = "serie_doc"
        '
        'nom_cliente
        '
        Me.nom_cliente.HeaderText = "Cliente"
        Me.nom_cliente.Name = "nom_cliente"
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
        'StatusStrip1
        '
        Me.StatusStrip1.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripStatusLabel1, Me.ToolStripStatusLabel2, Me.ToolStripStatusLabel3})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 598)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(820, 24)
        Me.StatusStrip1.TabIndex = 21
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'ToolStripStatusLabel1
        '
        Me.ToolStripStatusLabel1.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel1.Name = "ToolStripStatusLabel1"
        Me.ToolStripStatusLabel1.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel1.Text = "ToolStripStatusLabel1"
        '
        'ToolStripStatusLabel2
        '
        Me.ToolStripStatusLabel2.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel2.Name = "ToolStripStatusLabel2"
        Me.ToolStripStatusLabel2.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel2.Text = "ToolStripStatusLabel2"
        '
        'ToolStripStatusLabel3
        '
        Me.ToolStripStatusLabel3.BorderSides = CType((((System.Windows.Forms.ToolStripStatusLabelBorderSides.Left Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Top) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Right) _
                    Or System.Windows.Forms.ToolStripStatusLabelBorderSides.Bottom), System.Windows.Forms.ToolStripStatusLabelBorderSides)
        Me.ToolStripStatusLabel3.Name = "ToolStripStatusLabel3"
        Me.ToolStripStatusLabel3.Size = New System.Drawing.Size(125, 19)
        Me.ToolStripStatusLabel3.Text = "ToolStripStatusLabel3"
        '
        'Frm_ObtieneCAE_EX
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink
        Me.ClientSize = New System.Drawing.Size(820, 622)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.gpbObtieneCAE)
        Me.KeyPreview = True
        Me.MinimumSize = New System.Drawing.Size(253, 473)
        Me.Name = "Frm_ObtieneCAE_EX"
        Me.Text = "Frm_ObtieneCAE_EX"
        Me.gpbObtieneCAE.ResumeLayout(False)
        CType(Me.DGV_Observaciones, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DGV_listaComprobantes, System.ComponentModel.ISupportInitialize).EndInit()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents gpbObtieneCAE As System.Windows.Forms.GroupBox
    Friend WithEvents btnActualizar As System.Windows.Forms.Button
    Friend WithEvents lblObservaciones As System.Windows.Forms.Label
    Friend WithEvents DGV_Observaciones As System.Windows.Forms.DataGridView
    Friend WithEvents codigo_observ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents descripcion_observ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DGV_listaComprobantes As System.Windows.Forms.DataGridView
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents ToolStripStatusLabel1 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel2 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents ToolStripStatusLabel3 As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents cod_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents solicitud_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nro_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents serie_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents nom_cliente As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents importe_doc As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents remito As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents btnConsultarCbtes As System.Windows.Forms.Button
    Friend WithEvents btn_procesar As System.Windows.Forms.Button
End Class
