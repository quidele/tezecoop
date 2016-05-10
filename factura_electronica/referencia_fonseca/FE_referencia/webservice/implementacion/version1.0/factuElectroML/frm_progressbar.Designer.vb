<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frm_progressbar
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
Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
Me.ProgressBar1 = New System.Windows.Forms.ProgressBar
Me.SuspendLayout()
'
'Timer1
'
Me.Timer1.Enabled = True
Me.Timer1.Interval = 1
'
'ProgressBar1
'
Me.ProgressBar1.Location = New System.Drawing.Point(23, 31)
Me.ProgressBar1.Maximum = 10
Me.ProgressBar1.Name = "ProgressBar1"
Me.ProgressBar1.Size = New System.Drawing.Size(319, 18)
Me.ProgressBar1.Style = System.Windows.Forms.ProgressBarStyle.Marquee
Me.ProgressBar1.TabIndex = 1
'
'frm_progressbar
'
Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
Me.ClientSize = New System.Drawing.Size(367, 96)
Me.ControlBox = False
Me.Controls.Add(Me.ProgressBar1)
Me.MaximizeBox = False
Me.MinimizeBox = False
Me.Name = "frm_progressbar"
Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
Me.Text = "procesando información espere...."
Me.ResumeLayout(False)

End Sub
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
End Class
