Public Class Coordenadas

    Private _x As Integer
    Public Property Eje_X() As Integer
        Get
            Return _x
        End Get
        Set(ByVal value As Integer)
            _x = value
        End Set
    End Property




    Private _y As Integer
    Public Property Eje_Y() As Integer
        Get
            Return _y
        End Get
        Set(ByVal value As Integer)
            _y = value
        End Set
    End Property


    Private _nombre As String
    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property


    Public Sub New()

    End Sub


    Public Sub New(ByVal ejeX As Integer, ByVal ejeY As Integer, Optional ByVal nombre As String = Nothing)
        _x = ejeX
        _y = ejeY
        _nombre = nombre
    End Sub
End Class
