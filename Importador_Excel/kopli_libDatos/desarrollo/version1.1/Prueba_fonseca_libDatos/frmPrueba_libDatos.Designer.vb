<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmPrueba_libDatos
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
        Me.ListBox1 = New System.Windows.Forms.ListBox
        Me.btnEjecutarQuery = New System.Windows.Forms.Button
        Me.cmbBases = New System.Windows.Forms.ComboBox
        Me.txtSQL = New System.Windows.Forms.TextBox
        Me.Button1 = New System.Windows.Forms.Button
        Me.btnEjecutarScalar = New System.Windows.Forms.Button
        Me.btnEjecutarNonQuery = New System.Windows.Forms.Button
        Me.btnClear = New System.Windows.Forms.Button
        Me.DataGridView1 = New System.Windows.Forms.DataGridView
        Me.btnDataSet = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.btn_Actualizar = New System.Windows.Forms.Button
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ListBox1
        '
        Me.ListBox1.FormattingEnabled = True
        Me.ListBox1.Location = New System.Drawing.Point(12, 12)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(172, 212)
        Me.ListBox1.TabIndex = 0
        '
        'btnEjecutarQuery
        '
        Me.btnEjecutarQuery.Location = New System.Drawing.Point(202, 80)
        Me.btnEjecutarQuery.Name = "btnEjecutarQuery"
        Me.btnEjecutarQuery.Size = New System.Drawing.Size(129, 49)
        Me.btnEjecutarQuery.TabIndex = 1
        Me.btnEjecutarQuery.Text = "EjecutarQuery"
        Me.btnEjecutarQuery.UseVisualStyleBackColor = True
        '
        'cmbBases
        '
        Me.cmbBases.FormattingEnabled = True
        Me.cmbBases.Items.AddRange(New Object() {"Magma", "MFG", "RRHH", "MySQL", "FacturaElectronica"})
        Me.cmbBases.Location = New System.Drawing.Point(202, 12)
        Me.cmbBases.Name = "cmbBases"
        Me.cmbBases.Size = New System.Drawing.Size(121, 21)
        Me.cmbBases.TabIndex = 2
        '
        'txtSQL
        '
        Me.txtSQL.Location = New System.Drawing.Point(202, 39)
        Me.txtSQL.Name = "txtSQL"
        Me.txtSQL.Size = New System.Drawing.Size(417, 20)
        Me.txtSQL.TabIndex = 4
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(202, 265)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 5
        Me.Button1.Text = "Error"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'btnEjecutarScalar
        '
        Me.btnEjecutarScalar.Location = New System.Drawing.Point(202, 145)
        Me.btnEjecutarScalar.Name = "btnEjecutarScalar"
        Me.btnEjecutarScalar.Size = New System.Drawing.Size(129, 49)
        Me.btnEjecutarScalar.TabIndex = 6
        Me.btnEjecutarScalar.Text = "EjecutarScalar"
        Me.btnEjecutarScalar.UseVisualStyleBackColor = True
        '
        'btnEjecutarNonQuery
        '
        Me.btnEjecutarNonQuery.Location = New System.Drawing.Point(202, 210)
        Me.btnEjecutarNonQuery.Name = "btnEjecutarNonQuery"
        Me.btnEjecutarNonQuery.Size = New System.Drawing.Size(129, 49)
        Me.btnEjecutarNonQuery.TabIndex = 7
        Me.btnEjecutarNonQuery.Text = "EjecutarNonQuery"
        Me.btnEjecutarNonQuery.UseVisualStyleBackColor = True
        '
        'btnClear
        '
        Me.btnClear.Location = New System.Drawing.Point(12, 230)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(75, 23)
        Me.btnClear.TabIndex = 8
        Me.btnClear.Text = "Clear"
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'DataGridView1
        '
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Location = New System.Drawing.Point(337, 80)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(282, 272)
        Me.DataGridView1.TabIndex = 9
        '
        'btnDataSet
        '
        Me.btnDataSet.Location = New System.Drawing.Point(202, 303)
        Me.btnDataSet.Name = "btnDataSet"
        Me.btnDataSet.Size = New System.Drawing.Size(129, 49)
        Me.btnDataSet.TabIndex = 10
        Me.btnDataSet.Text = "Ejecutar DataSet"
        Me.btnDataSet.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(467, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(152, 13)
        Me.Label1.TabIndex = 11
        Me.Label1.Text = "TMP_Prueba_AdmConexiones"
        '
        'btn_Actualizar
        '
        Me.btn_Actualizar.Location = New System.Drawing.Point(625, 303)
        Me.btn_Actualizar.Name = "btn_Actualizar"
        Me.btn_Actualizar.Size = New System.Drawing.Size(84, 49)
        Me.btn_Actualizar.TabIndex = 12
        Me.btn_Actualizar.Text = "Actualizar"
        Me.btn_Actualizar.UseVisualStyleBackColor = True
        '
        'frmPrueba_libDatos
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(713, 364)
        Me.Controls.Add(Me.btn_Actualizar)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnDataSet)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.btnClear)
        Me.Controls.Add(Me.btnEjecutarNonQuery)
        Me.Controls.Add(Me.btnEjecutarScalar)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.txtSQL)
        Me.Controls.Add(Me.cmbBases)
        Me.Controls.Add(Me.btnEjecutarQuery)
        Me.Controls.Add(Me.ListBox1)
        Me.Name = "frmPrueba_libDatos"
        Me.Text = "frmPrueba_libDatos"
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents btnEjecutarQuery As System.Windows.Forms.Button
    Friend WithEvents cmbBases As System.Windows.Forms.ComboBox
    Friend WithEvents txtSQL As System.Windows.Forms.TextBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents btnEjecutarScalar As System.Windows.Forms.Button
    Friend WithEvents btnEjecutarNonQuery As System.Windows.Forms.Button
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents btnDataSet As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btn_Actualizar As System.Windows.Forms.Button

End Class
