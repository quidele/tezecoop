<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmDatosCbte
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
        Me.grpDatosCbte = New System.Windows.Forms.GroupBox
        Me.lblPtoVta = New System.Windows.Forms.Label
        Me.txtPtoVta = New System.Windows.Forms.TextBox
        Me.txtTipoCbte = New System.Windows.Forms.TextBox
        Me.lblTipoCbtes = New System.Windows.Forms.Label
        Me.txtNroCbtes = New System.Windows.Forms.TextBox
        Me.lblNroCbtes = New System.Windows.Forms.Label
        Me.btnCerrar = New System.Windows.Forms.Button
        Me.btnAceptar = New System.Windows.Forms.Button
        Me.grpDatosCbte.SuspendLayout()
        Me.SuspendLayout()
        '
        'grpDatosCbte
        '
        Me.grpDatosCbte.Controls.Add(Me.lblPtoVta)
        Me.grpDatosCbte.Controls.Add(Me.txtPtoVta)
        Me.grpDatosCbte.Controls.Add(Me.txtTipoCbte)
        Me.grpDatosCbte.Controls.Add(Me.lblTipoCbtes)
        Me.grpDatosCbte.Controls.Add(Me.txtNroCbtes)
        Me.grpDatosCbte.Controls.Add(Me.lblNroCbtes)
        Me.grpDatosCbte.Location = New System.Drawing.Point(12, 12)
        Me.grpDatosCbte.Name = "grpDatosCbte"
        Me.grpDatosCbte.Size = New System.Drawing.Size(229, 178)
        Me.grpDatosCbte.TabIndex = 1
        Me.grpDatosCbte.TabStop = False
        Me.grpDatosCbte.Text = "Datos del comprobante"
        '
        'lblPtoVta
        '
        Me.lblPtoVta.AutoSize = True
        Me.lblPtoVta.Location = New System.Drawing.Point(6, 125)
        Me.lblPtoVta.Name = "lblPtoVta"
        Me.lblPtoVta.Size = New System.Drawing.Size(86, 13)
        Me.lblPtoVta.TabIndex = 5
        Me.lblPtoVta.Text = "Punto de venta: "
        '
        'txtPtoVta
        '
        Me.txtPtoVta.Location = New System.Drawing.Point(9, 141)
        Me.txtPtoVta.Name = "txtPtoVta"
        Me.txtPtoVta.Size = New System.Drawing.Size(206, 20)
        Me.txtPtoVta.TabIndex = 4
        '
        'txtTipoCbte
        '
        Me.txtTipoCbte.Location = New System.Drawing.Point(9, 94)
        Me.txtTipoCbte.Name = "txtTipoCbte"
        Me.txtTipoCbte.Size = New System.Drawing.Size(206, 20)
        Me.txtTipoCbte.TabIndex = 3
        '
        'lblTipoCbtes
        '
        Me.lblTipoCbtes.AutoSize = True
        Me.lblTipoCbtes.Location = New System.Drawing.Point(6, 78)
        Me.lblTipoCbtes.Name = "lblTipoCbtes"
        Me.lblTipoCbtes.Size = New System.Drawing.Size(111, 13)
        Me.lblTipoCbtes.TabIndex = 2
        Me.lblTipoCbtes.Text = "Tipo de comprobante:"
        '
        'txtNroCbtes
        '
        Me.txtNroCbtes.Location = New System.Drawing.Point(9, 47)
        Me.txtNroCbtes.Name = "txtNroCbtes"
        Me.txtNroCbtes.Size = New System.Drawing.Size(206, 20)
        Me.txtNroCbtes.TabIndex = 1
        '
        'lblNroCbtes
        '
        Me.lblNroCbtes.AutoSize = True
        Me.lblNroCbtes.Location = New System.Drawing.Point(6, 31)
        Me.lblNroCbtes.Name = "lblNroCbtes"
        Me.lblNroCbtes.Size = New System.Drawing.Size(102, 13)
        Me.lblNroCbtes.TabIndex = 0
        Me.lblNroCbtes.Text = "N° de comprobante:"
        '
        'btnCerrar
        '
        Me.btnCerrar.Location = New System.Drawing.Point(166, 196)
        Me.btnCerrar.Name = "btnCerrar"
        Me.btnCerrar.Size = New System.Drawing.Size(75, 23)
        Me.btnCerrar.TabIndex = 2
        Me.btnCerrar.Text = "Cerrar"
        Me.btnCerrar.UseVisualStyleBackColor = True
        '
        'btnAceptar
        '
        Me.btnAceptar.Location = New System.Drawing.Point(12, 196)
        Me.btnAceptar.Name = "btnAceptar"
        Me.btnAceptar.Size = New System.Drawing.Size(75, 23)
        Me.btnAceptar.TabIndex = 1
        Me.btnAceptar.Text = "Aceptar"
        Me.btnAceptar.UseVisualStyleBackColor = True
        '
        'frmDatosCbte
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(255, 224)
        Me.Controls.Add(Me.btnCerrar)
        Me.Controls.Add(Me.btnAceptar)
        Me.Controls.Add(Me.grpDatosCbte)
        Me.Name = "frmDatosCbte"
        Me.ShowIcon = False
        Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.grpDatosCbte.ResumeLayout(False)
        Me.grpDatosCbte.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents grpDatosCbte As System.Windows.Forms.GroupBox
    Friend WithEvents btnCerrar As System.Windows.Forms.Button
    Friend WithEvents lblPtoVta As System.Windows.Forms.Label
    Friend WithEvents btnAceptar As System.Windows.Forms.Button
    Friend WithEvents txtPtoVta As System.Windows.Forms.TextBox
    Friend WithEvents txtTipoCbte As System.Windows.Forms.TextBox
    Friend WithEvents lblTipoCbtes As System.Windows.Forms.Label
    Friend WithEvents txtNroCbtes As System.Windows.Forms.TextBox
    Friend WithEvents lblNroCbtes As System.Windows.Forms.Label
End Class
