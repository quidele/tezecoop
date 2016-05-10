<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmConfiguracion
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
        Me.TabControl1 = New System.Windows.Forms.TabControl
        Me.TabPage1 = New System.Windows.Forms.TabPage
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.rdoLogSi = New System.Windows.Forms.RadioButton
        Me.rdoLogNo = New System.Windows.Forms.RadioButton
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.rdoEX = New System.Windows.Forms.RadioButton
        Me.rdoML = New System.Windows.Forms.RadioButton
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.rdoPrueba = New System.Windows.Forms.RadioButton
        Me.rdoFacElec = New System.Windows.Forms.RadioButton
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.rdoHomo = New System.Windows.Forms.RadioButton
        Me.rdoProd = New System.Windows.Forms.RadioButton
        Me.TabPage2 = New System.Windows.Forms.TabPage
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.txtTiempoEspera = New System.Windows.Forms.TextBox
        Me.txtCarpetaLog = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.txtTipoCbteML = New System.Windows.Forms.TextBox
        Me.txtPtoVtaML = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.txtTipoCbteEx = New System.Windows.Forms.TextBox
        Me.txtPtoVtaEx = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.btnGuardar = New System.Windows.Forms.Button
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.SuspendLayout()
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Location = New System.Drawing.Point(12, 12)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(218, 265)
        Me.TabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.GroupBox4)
        Me.TabPage1.Controls.Add(Me.GroupBox3)
        Me.TabPage1.Controls.Add(Me.GroupBox2)
        Me.TabPage1.Controls.Add(Me.GroupBox1)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(210, 239)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Basic"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.rdoLogSi)
        Me.GroupBox4.Controls.Add(Me.rdoLogNo)
        Me.GroupBox4.Location = New System.Drawing.Point(4, 6)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(200, 50)
        Me.GroupBox4.TabIndex = 17
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "Guardar en LOG"
        '
        'rdoLogSi
        '
        Me.rdoLogSi.AutoSize = True
        Me.rdoLogSi.CheckAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.rdoLogSi.Location = New System.Drawing.Point(57, 19)
        Me.rdoLogSi.Name = "rdoLogSi"
        Me.rdoLogSi.Size = New System.Drawing.Size(35, 17)
        Me.rdoLogSi.TabIndex = 8
        Me.rdoLogSi.TabStop = True
        Me.rdoLogSi.Text = "SI"
        Me.rdoLogSi.UseVisualStyleBackColor = True
        '
        'rdoLogNo
        '
        Me.rdoLogNo.AutoSize = True
        Me.rdoLogNo.Location = New System.Drawing.Point(98, 19)
        Me.rdoLogNo.Name = "rdoLogNo"
        Me.rdoLogNo.Size = New System.Drawing.Size(41, 17)
        Me.rdoLogNo.TabIndex = 7
        Me.rdoLogNo.TabStop = True
        Me.rdoLogNo.Text = "NO"
        Me.rdoLogNo.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.rdoEX)
        Me.GroupBox3.Controls.Add(Me.rdoML)
        Me.GroupBox3.Location = New System.Drawing.Point(4, 176)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(200, 50)
        Me.GroupBox3.TabIndex = 16
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Tipo de mercado"
        '
        'rdoEX
        '
        Me.rdoEX.AutoSize = True
        Me.rdoEX.CheckAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.rdoEX.Location = New System.Drawing.Point(11, 19)
        Me.rdoEX.Name = "rdoEX"
        Me.rdoEX.Size = New System.Drawing.Size(81, 17)
        Me.rdoEX.TabIndex = 7
        Me.rdoEX.TabStop = True
        Me.rdoEX.Text = "Exportación"
        Me.rdoEX.UseVisualStyleBackColor = True
        '
        'rdoML
        '
        Me.rdoML.AutoSize = True
        Me.rdoML.Location = New System.Drawing.Point(98, 19)
        Me.rdoML.Name = "rdoML"
        Me.rdoML.Size = New System.Drawing.Size(96, 17)
        Me.rdoML.TabIndex = 6
        Me.rdoML.TabStop = True
        Me.rdoML.Text = "Mercado Local"
        Me.rdoML.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.rdoPrueba)
        Me.GroupBox2.Controls.Add(Me.rdoFacElec)
        Me.GroupBox2.Location = New System.Drawing.Point(4, 118)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(200, 50)
        Me.GroupBox2.TabIndex = 15
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Base de datos"
        '
        'rdoPrueba
        '
        Me.rdoPrueba.AutoSize = True
        Me.rdoPrueba.CheckAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.rdoPrueba.Location = New System.Drawing.Point(33, 19)
        Me.rdoPrueba.Name = "rdoPrueba"
        Me.rdoPrueba.Size = New System.Drawing.Size(59, 17)
        Me.rdoPrueba.TabIndex = 5
        Me.rdoPrueba.TabStop = True
        Me.rdoPrueba.Text = "Prueba"
        Me.rdoPrueba.UseVisualStyleBackColor = True
        '
        'rdoFacElec
        '
        Me.rdoFacElec.AutoSize = True
        Me.rdoFacElec.Location = New System.Drawing.Point(98, 19)
        Me.rdoFacElec.Name = "rdoFacElec"
        Me.rdoFacElec.Size = New System.Drawing.Size(70, 17)
        Me.rdoFacElec.TabIndex = 4
        Me.rdoFacElec.TabStop = True
        Me.rdoFacElec.Text = "Fact Elec"
        Me.rdoFacElec.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.rdoHomo)
        Me.GroupBox1.Controls.Add(Me.rdoProd)
        Me.GroupBox1.Location = New System.Drawing.Point(4, 63)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(200, 50)
        Me.GroupBox1.TabIndex = 14
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Modo de operación"
        '
        'rdoHomo
        '
        Me.rdoHomo.AutoSize = True
        Me.rdoHomo.CheckAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.rdoHomo.Location = New System.Drawing.Point(-1, 19)
        Me.rdoHomo.Name = "rdoHomo"
        Me.rdoHomo.Size = New System.Drawing.Size(93, 17)
        Me.rdoHomo.TabIndex = 3
        Me.rdoHomo.TabStop = True
        Me.rdoHomo.Text = "Homologación"
        Me.rdoHomo.UseVisualStyleBackColor = True
        '
        'rdoProd
        '
        Me.rdoProd.AutoSize = True
        Me.rdoProd.Location = New System.Drawing.Point(98, 19)
        Me.rdoProd.Name = "rdoProd"
        Me.rdoProd.Size = New System.Drawing.Size(79, 17)
        Me.rdoProd.TabIndex = 2
        Me.rdoProd.TabStop = True
        Me.rdoProd.Text = "Producción"
        Me.rdoProd.UseVisualStyleBackColor = True
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.Label7)
        Me.TabPage2.Controls.Add(Me.Label5)
        Me.TabPage2.Controls.Add(Me.txtTiempoEspera)
        Me.TabPage2.Controls.Add(Me.txtCarpetaLog)
        Me.TabPage2.Controls.Add(Me.Label6)
        Me.TabPage2.Controls.Add(Me.Label3)
        Me.TabPage2.Controls.Add(Me.txtTipoCbteML)
        Me.TabPage2.Controls.Add(Me.txtPtoVtaML)
        Me.TabPage2.Controls.Add(Me.Label4)
        Me.TabPage2.Controls.Add(Me.Label2)
        Me.TabPage2.Controls.Add(Me.txtTipoCbteEx)
        Me.TabPage2.Controls.Add(Me.txtPtoVtaEx)
        Me.TabPage2.Controls.Add(Me.Label1)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(210, 239)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Default"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(157, 195)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(23, 13)
        Me.Label7.TabIndex = 12
        Me.Label7.Text = "ms."
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(33, 195)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(77, 13)
        Me.Label5.TabIndex = 11
        Me.Label5.Text = "Tiempo espera"
        '
        'txtTiempoEspera
        '
        Me.txtTiempoEspera.Location = New System.Drawing.Point(115, 192)
        Me.txtTiempoEspera.Name = "txtTiempoEspera"
        Me.txtTiempoEspera.Size = New System.Drawing.Size(36, 20)
        Me.txtTiempoEspera.TabIndex = 10
        '
        'txtCarpetaLog
        '
        Me.txtCarpetaLog.Location = New System.Drawing.Point(115, 159)
        Me.txtCarpetaLog.Name = "txtCarpetaLog"
        Me.txtCarpetaLog.Size = New System.Drawing.Size(36, 20)
        Me.txtCarpetaLog.TabIndex = 9
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(33, 162)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(77, 13)
        Me.Label6.TabIndex = 8
        Me.Label6.Text = "Carpeta LOG \"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(33, 129)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(77, 13)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "Tipo Cbte. ML."
        '
        'txtTipoCbteML
        '
        Me.txtTipoCbteML.Location = New System.Drawing.Point(115, 126)
        Me.txtTipoCbteML.Name = "txtTipoCbteML"
        Me.txtTipoCbteML.Size = New System.Drawing.Size(36, 20)
        Me.txtTipoCbteML.TabIndex = 6
        '
        'txtPtoVtaML
        '
        Me.txtPtoVtaML.Location = New System.Drawing.Point(115, 93)
        Me.txtPtoVtaML.Name = "txtPtoVtaML"
        Me.txtPtoVtaML.Size = New System.Drawing.Size(36, 20)
        Me.txtPtoVtaML.TabIndex = 5
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(47, 96)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(63, 13)
        Me.Label4.TabIndex = 4
        Me.Label4.Text = "Pto Vta ML."
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(30, 63)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(80, 13)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Tipo Cbte. Exp."
        '
        'txtTipoCbteEx
        '
        Me.txtTipoCbteEx.Location = New System.Drawing.Point(115, 60)
        Me.txtTipoCbteEx.Name = "txtTipoCbteEx"
        Me.txtTipoCbteEx.Size = New System.Drawing.Size(36, 20)
        Me.txtTipoCbteEx.TabIndex = 2
        '
        'txtPtoVtaEx
        '
        Me.txtPtoVtaEx.Location = New System.Drawing.Point(115, 27)
        Me.txtPtoVtaEx.Name = "txtPtoVtaEx"
        Me.txtPtoVtaEx.Size = New System.Drawing.Size(36, 20)
        Me.txtPtoVtaEx.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(44, 30)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(66, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Pto Vta Exp."
        '
        'btnGuardar
        '
        Me.btnGuardar.Location = New System.Drawing.Point(81, 283)
        Me.btnGuardar.Name = "btnGuardar"
        Me.btnGuardar.Size = New System.Drawing.Size(75, 23)
        Me.btnGuardar.TabIndex = 13
        Me.btnGuardar.Text = "Guardar"
        Me.btnGuardar.UseVisualStyleBackColor = True
        '
        'frmConfiguracion
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(242, 313)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.btnGuardar)
        Me.Name = "frmConfiguracion"
        Me.Text = "Configuración"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox4.PerformLayout()
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox3.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents rdoLogSi As System.Windows.Forms.RadioButton
    Friend WithEvents rdoLogNo As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents rdoEX As System.Windows.Forms.RadioButton
    Friend WithEvents rdoML As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents rdoPrueba As System.Windows.Forms.RadioButton
    Friend WithEvents rdoFacElec As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents rdoHomo As System.Windows.Forms.RadioButton
    Friend WithEvents rdoProd As System.Windows.Forms.RadioButton
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents txtPtoVtaEx As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btnGuardar As System.Windows.Forms.Button
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtTipoCbteEx As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents txtTipoCbteML As System.Windows.Forms.TextBox
    Friend WithEvents txtPtoVtaML As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents txtTiempoEspera As System.Windows.Forms.TextBox
    Friend WithEvents txtCarpetaLog As System.Windows.Forms.TextBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
End Class
