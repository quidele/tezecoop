Public Class frm_seleccionModo

    Private _posicion As System.Drawing.Point
    Public Property Posicion() As System.Drawing.Point
        Get
            Return _posicion
        End Get
        Set(ByVal value As System.Drawing.Point)
            Me._posicion = value
        End Set
    End Property


    Private _modoElegido As String
    Public ReadOnly Property ModoElegido() As String
        Get
            Return _modoElegido
        End Get
    End Property

    Private Sub frm_seleccionModo_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.MaximumSize = Me.Size
        Me.MinimumSize = Me.Size
        Me.Icon = My.Resources.Factuplus
        Me.Location = _posicion
    End Sub




    Sub New(ByVal ParentForm As Form)
        InitializeComponent()

        Me.Owner = ParentForm
        Dim punto As New System.Drawing.Point()
        punto.X = (Me.Owner.Width / 2) - (Me.Width / 2)
        punto.Y = (Me.Owner.Height / 2) - (Me.Height / 2)

        _posicion = New System.Drawing.Point()
        _posicion = punto

    End Sub

    Private Sub btnEnvio_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEnvio.Click
        Me._modoElegido = "Factuplus_envio"
        Me.DialogResult = Windows.Forms.DialogResult.OK
    End Sub

    Private Sub btnRecepcion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRecepcion.Click
        Me._modoElegido = "Factuplus_recepcion"
        Me.DialogResult = Windows.Forms.DialogResult.OK
    End Sub
End Class