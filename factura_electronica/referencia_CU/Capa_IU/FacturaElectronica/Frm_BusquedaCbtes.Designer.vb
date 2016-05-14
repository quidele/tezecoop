<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm_BusquedaCbtes
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Frm_BusquedaCbtes))
        Me.grpDatosCbte = New System.Windows.Forms.GroupBox()
        Me.lblPtoVta = New System.Windows.Forms.Label()
        Me.txtPtoVta = New System.Windows.Forms.TextBox()
        Me.txtTipoCbte = New System.Windows.Forms.TextBox()
        Me.lblTipoCbtes = New System.Windows.Forms.Label()
        Me.txtNroCbtes = New System.Windows.Forms.TextBox()
        Me.lblNroCbtes = New System.Windows.Forms.Label()
        Me.btnCancelar = New Fonseca_lib_controles.Boton_Cristal()
        Me.btnAceptar = New Fonseca_lib_controles.Boton_Cristal()
        Me.grpDatosCbte.SuspendLayout()
        Me.SuspendLayout()
        '
        'grpDatosCbte
        '
        Me.grpDatosCbte.BackColor = System.Drawing.Color.Transparent
        Me.grpDatosCbte.Controls.Add(Me.lblPtoVta)
        Me.grpDatosCbte.Controls.Add(Me.txtPtoVta)
        Me.grpDatosCbte.Controls.Add(Me.txtTipoCbte)
        Me.grpDatosCbte.Controls.Add(Me.lblTipoCbtes)
        Me.grpDatosCbte.Controls.Add(Me.txtNroCbtes)
        Me.grpDatosCbte.Controls.Add(Me.lblNroCbtes)
        Me.grpDatosCbte.Location = New System.Drawing.Point(12, 12)
        Me.grpDatosCbte.Name = "grpDatosCbte"
        Me.grpDatosCbte.Size = New System.Drawing.Size(229, 178)
        Me.grpDatosCbte.TabIndex = 2
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
        Me.txtPtoVta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtPtoVta.Location = New System.Drawing.Point(9, 141)
        Me.txtPtoVta.Name = "txtPtoVta"
        Me.txtPtoVta.Size = New System.Drawing.Size(206, 20)
        Me.txtPtoVta.TabIndex = 4
        '
        'txtTipoCbte
        '
        Me.txtTipoCbte.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
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
        Me.txtNroCbtes.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
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
        'btnCancelar
        '
        Me.btnCancelar.BackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.BackgroundImage = CType(resources.GetObject("btnCancelar.BackgroundImage"), System.Drawing.Image)
        Me.btnCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnCancelar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnCancelar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnCancelar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnCancelar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnCancelar.FlatAppearance.BorderSize = 0
        Me.btnCancelar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnCancelar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnCancelar.Location = New System.Drawing.Point(170, 196)
        Me.btnCancelar.Name = "btnCancelar"
        Me.btnCancelar.Size = New System.Drawing.Size(75, 35)
        Me.btnCancelar.TabIndex = 4
        Me.btnCancelar.Text = "Cancelar"
        Me.btnCancelar.UseVisualStyleBackColor = False
        '
        'btnAceptar
        '
        Me.btnAceptar.BackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.BackgroundImage = CType(resources.GetObject("btnAceptar.BackgroundImage"), System.Drawing.Image)
        Me.btnAceptar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnAceptar.ColorBoton = Fonseca_lib_controles.Boton_Cristal.ColoresBoton.Verde
        Me.btnAceptar.ColorEnFoco = System.Drawing.Color.Blue
        Me.btnAceptar.ColorFuente = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnAceptar.ColorMouseEnter = System.Drawing.Color.WhiteSmoke
        Me.btnAceptar.FlatAppearance.BorderSize = 0
        Me.btnAceptar.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent
        Me.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAceptar.ForeColor = System.Drawing.SystemColors.GradientInactiveCaption
        Me.btnAceptar.Location = New System.Drawing.Point(12, 196)
        Me.btnAceptar.Name = "btnAceptar"
        Me.btnAceptar.Size = New System.Drawing.Size(75, 35)
        Me.btnAceptar.TabIndex = 3
        Me.btnAceptar.Text = "Aceptar"
        Me.btnAceptar.UseVisualStyleBackColor = False
        '
        'Frm_BusquedaCbtes
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackgroundImage = Global.FacturaElectronicaWS.Resources.barra_01_go
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(257, 232)
        Me.Controls.Add(Me.btnCancelar)
        Me.Controls.Add(Me.btnAceptar)
        Me.Controls.Add(Me.grpDatosCbte)
        Me.Name = "Frm_BusquedaCbtes"
        Me.Text = "Búsqueda"
        Me.grpDatosCbte.ResumeLayout(False)
        Me.grpDatosCbte.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents grpDatosCbte As System.Windows.Forms.GroupBox
    Friend WithEvents lblPtoVta As System.Windows.Forms.Label
    Friend WithEvents txtPtoVta As System.Windows.Forms.TextBox
    Friend WithEvents txtTipoCbte As System.Windows.Forms.TextBox
    Friend WithEvents lblTipoCbtes As System.Windows.Forms.Label
    Friend WithEvents txtNroCbtes As System.Windows.Forms.TextBox
    Friend WithEvents lblNroCbtes As System.Windows.Forms.Label
    Friend WithEvents btnAceptar As Fonseca_lib_controles.Boton_Cristal
    Friend WithEvents btnCancelar As Fonseca_lib_controles.Boton_Cristal
End Class
