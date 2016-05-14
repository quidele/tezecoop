
Public Class CampoExtendido
    Inherits Campo


    Private _nombre As System.Object

    Public Property Nombre() As System.Object
        Get
            Return _nombre
        End Get
        Set(ByVal value As System.Object)
            _nombre = value
        End Set
    End Property

    Public Sub New()
        Me.Tipo = SQLAdapter.getTipoString ' por defecto configuramos el tipo string
    End Sub



    Public Function ToInteger() As Integer
        Try
            toInteger = Integer.Parse(Me.Valor.ToString())
        Catch ex As Exception
        End Try


    End Function

    Public Overloads Shared Operator =(ByVal a As CampoExtendido, ByVal b As Campo) As CampoExtendido
        a.Valor = b.Valor
        a.Tipo = b.Tipo
        a.Nombre = ""
        Return a
    End Operator



    Public Overloads Shared Operator <>(ByVal a As CampoExtendido, ByVal b As Campo) As CampoExtendido
        Return a
    End Operator


End Class

