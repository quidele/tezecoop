Public Class Frm_BusquedaCbtes

    Private _defaultPtoVta As String
    Private _defaultTipoCbte As String
    Private _defaultNroCbtes As String

    Public Property PtoVta() As String
        Get
            Return _defaultPtoVta
        End Get
        Set(ByVal value As String)
            _defaultPtoVta = value
        End Set
    End Property

    Public Property TipoCbte() As String
        Get
            Return _defaultTipoCbte
        End Get
        Set(ByVal value As String)
            _defaultTipoCbte = value
        End Set
    End Property

    Public Property NroCbtes() As String
        Get
            Return _defaultNroCbtes
        End Get
        Set(ByVal value As String)
            _defaultNroCbtes = value
        End Set
    End Property

    Sub New(ByVal pPtoVenta As String, ByVal pTipoCbte As String, ByVal pNroCbte As String)

        ' Llamada necesaria para el diseñador.
        InitializeComponent()

        _defaultPtoVta = pPtoVenta
        _defaultTipoCbte = pTipoCbte
        _defaultNroCbtes = pNroCbte

    End Sub

    Private Sub FrmBusquedaCbtes_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            Me.Icon = Resources.busqueda_ico
            Me.MinimizeBox = False
            Me.MaximizeBox = False
            Me.MinimumSize = Me.Size
            Me.MaximumSize = Me.Size
            Me.FormBorderStyle = Windows.Forms.FormBorderStyle.FixedToolWindow
            Me.txtPtoVta.ForeColor = Color.Gray
            Me.txtPtoVta.Text = _defaultPtoVta
            Me.txtTipoCbte.ForeColor = Color.Gray
            Me.txtTipoCbte.Text = _defaultTipoCbte
            Me.txtNroCbtes.ForeColor = Color.Gray
            Me.txtNroCbtes.Text = _defaultNroCbtes

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Me.DialogResult = Windows.Forms.DialogResult.Cancel
            Me.Close()
        End Try
    End Sub

    Private Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        Try
            Me._defaultNroCbtes = txtNroCbtes.Text
            Me._defaultPtoVta = txtPtoVta.Text
            Me._defaultTipoCbte = txtTipoCbte.Text

            Me.DialogResult = Windows.Forms.DialogResult.OK
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Me.DialogResult = Windows.Forms.DialogResult.Cancel
            Me.Close()
        End Try
    End Sub

    Private Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Me.DialogResult = Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub
End Class