<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_Config
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
        Me.rdoLogOn = New System.Windows.Forms.RadioButton
        Me.rdoLogOff = New System.Windows.Forms.RadioButton
        Me.cmbTipoLog = New System.Windows.Forms.ComboBox
        Me.txtRutaLog = New System.Windows.Forms.TextBox
        Me.btnExaminar = New System.Windows.Forms.Button
        Me.fbdDialog = New System.Windows.Forms.FolderBrowserDialog
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.tabConfiguracion = New System.Windows.Forms.TabControl
        Me.tabLog = New System.Windows.Forms.TabPage
        Me.grpLogOpciones = New System.Windows.Forms.GroupBox
        Me.grpLogActivado = New System.Windows.Forms.GroupBox
        Me.btnGuardar = New System.Windows.Forms.Button
        Me.tabConfiguracion.SuspendLayout()
        Me.tabLog.SuspendLayout()
        Me.grpLogOpciones.SuspendLayout()
        Me.grpLogActivado.SuspendLayout()
        Me.SuspendLayout()
        '
        'rdoLogOn
        '
        Me.rdoLogOn.AutoSize = True
        Me.rdoLogOn.Location = New System.Drawing.Point(35, 19)
        Me.rdoLogOn.Name = "rdoLogOn"
        Me.rdoLogOn.Size = New System.Drawing.Size(87, 17)
        Me.rdoLogOn.TabIndex = 0
        Me.rdoLogOn.TabStop = True
        Me.rdoLogOn.Text = "Log activado"
        Me.rdoLogOn.UseVisualStyleBackColor = True
        '
        'rdoLogOff
        '
        Me.rdoLogOff.AutoSize = True
        Me.rdoLogOff.Location = New System.Drawing.Point(262, 19)
        Me.rdoLogOff.Name = "rdoLogOff"
        Me.rdoLogOff.Size = New System.Drawing.Size(104, 17)
        Me.rdoLogOff.TabIndex = 1
        Me.rdoLogOff.TabStop = True
        Me.rdoLogOff.Text = "Log desactivado"
        Me.rdoLogOff.UseVisualStyleBackColor = True
        '
        'cmbTipoLog
        '
        Me.cmbTipoLog.FormattingEnabled = True
        Me.cmbTipoLog.Location = New System.Drawing.Point(35, 82)
        Me.cmbTipoLog.Name = "cmbTipoLog"
        Me.cmbTipoLog.Size = New System.Drawing.Size(260, 21)
        Me.cmbTipoLog.TabIndex = 2
        '
        'txtRutaLog
        '
        Me.txtRutaLog.Location = New System.Drawing.Point(35, 32)
        Me.txtRutaLog.Name = "txtRutaLog"
        Me.txtRutaLog.Size = New System.Drawing.Size(357, 20)
        Me.txtRutaLog.TabIndex = 3
        '
        'btnExaminar
        '
        Me.btnExaminar.Location = New System.Drawing.Point(412, 30)
        Me.btnExaminar.Name = "btnExaminar"
        Me.btnExaminar.Size = New System.Drawing.Size(75, 23)
        Me.btnExaminar.TabIndex = 4
        Me.btnExaminar.Text = "Examinar"
        Me.btnExaminar.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(32, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 13)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Ruta del log"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(32, 66)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(64, 13)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Tipo de Log"
        '
        'tabConfiguracion
        '
        Me.tabConfiguracion.Controls.Add(Me.tabLog)
        Me.tabConfiguracion.Location = New System.Drawing.Point(12, 12)
        Me.tabConfiguracion.Name = "tabConfiguracion"
        Me.tabConfiguracion.SelectedIndex = 0
        Me.tabConfiguracion.Size = New System.Drawing.Size(540, 248)
        Me.tabConfiguracion.TabIndex = 7
        '
        'tabLog
        '
        Me.tabLog.Controls.Add(Me.grpLogOpciones)
        Me.tabLog.Controls.Add(Me.grpLogActivado)
        Me.tabLog.Location = New System.Drawing.Point(4, 22)
        Me.tabLog.Name = "tabLog"
        Me.tabLog.Padding = New System.Windows.Forms.Padding(3)
        Me.tabLog.Size = New System.Drawing.Size(532, 222)
        Me.tabLog.TabIndex = 0
        Me.tabLog.Text = "Log"
        Me.tabLog.UseVisualStyleBackColor = True
        '
        'grpLogOpciones
        '
        Me.grpLogOpciones.Controls.Add(Me.Label1)
        Me.grpLogOpciones.Controls.Add(Me.btnExaminar)
        Me.grpLogOpciones.Controls.Add(Me.txtRutaLog)
        Me.grpLogOpciones.Controls.Add(Me.Label2)
        Me.grpLogOpciones.Controls.Add(Me.cmbTipoLog)
        Me.grpLogOpciones.Location = New System.Drawing.Point(18, 65)
        Me.grpLogOpciones.Name = "grpLogOpciones"
        Me.grpLogOpciones.Size = New System.Drawing.Size(493, 140)
        Me.grpLogOpciones.TabIndex = 8
        Me.grpLogOpciones.TabStop = False
        '
        'grpLogActivado
        '
        Me.grpLogActivado.Controls.Add(Me.btnGuardar)
        Me.grpLogActivado.Controls.Add(Me.rdoLogOn)
        Me.grpLogActivado.Controls.Add(Me.rdoLogOff)
        Me.grpLogActivado.Location = New System.Drawing.Point(18, 6)
        Me.grpLogActivado.Name = "grpLogActivado"
        Me.grpLogActivado.Size = New System.Drawing.Size(493, 53)
        Me.grpLogActivado.TabIndex = 7
        Me.grpLogActivado.TabStop = False
        '
        'btnGuardar
        '
        Me.btnGuardar.Location = New System.Drawing.Point(396, 16)
        Me.btnGuardar.Name = "btnGuardar"
        Me.btnGuardar.Size = New System.Drawing.Size(91, 23)
        Me.btnGuardar.TabIndex = 2
        Me.btnGuardar.Text = "Guardar y cerrar"
        Me.btnGuardar.UseVisualStyleBackColor = True
        '
        'frm_Config
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(563, 267)
        Me.Controls.Add(Me.tabConfiguracion)
        Me.Name = "frm_Config"
        Me.Text = "frm_Config"
        Me.tabConfiguracion.ResumeLayout(False)
        Me.tabLog.ResumeLayout(False)
        Me.grpLogOpciones.ResumeLayout(False)
        Me.grpLogOpciones.PerformLayout()
        Me.grpLogActivado.ResumeLayout(False)
        Me.grpLogActivado.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents rdoLogOn As System.Windows.Forms.RadioButton
    Friend WithEvents rdoLogOff As System.Windows.Forms.RadioButton
    Friend WithEvents cmbTipoLog As System.Windows.Forms.ComboBox
    Friend WithEvents txtRutaLog As System.Windows.Forms.TextBox
    Friend WithEvents btnExaminar As System.Windows.Forms.Button
    Friend WithEvents fbdDialog As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents tabConfiguracion As System.Windows.Forms.TabControl
    Friend WithEvents tabLog As System.Windows.Forms.TabPage
    Friend WithEvents grpLogOpciones As System.Windows.Forms.GroupBox
    Friend WithEvents grpLogActivado As System.Windows.Forms.GroupBox
    Friend WithEvents btnGuardar As System.Windows.Forms.Button
End Class
