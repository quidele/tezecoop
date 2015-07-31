
Public Class NoRowsException
    Inherits Exception

    Dim _mensaje As String



    Public Overrides ReadOnly Property Message() As String
        Get
            Return _mensaje
        End Get
    End Property

    Public Overrides Function ToString() As String
        Return MyBase.ToString()
    End Function

    Public Sub New()
        _mensaje = "No se obtuvieron filas desde el origen de datos. "
    End Sub

    Public Sub New(ByVal message As String)
        Me.New()
        _mensaje = vbCrLf + message
    End Sub


End Class
