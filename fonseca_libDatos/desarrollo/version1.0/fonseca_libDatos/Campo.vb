Imports System.IO
Imports System.Reflection

Public Class Campo
    Implements IComparable

    Private _valor As System.Object

    Public Property Valor() As System.Object
        Get
            Return _valor
        End Get
        Set(ByVal value As System.Object)
            _valor = value
        End Set
    End Property

    Private _tipo As System.Type
    Public Property Tipo() As System.Type
        Get
            Return _tipo
        End Get
        Set(ByVal value As System.Type)
            _tipo = value
        End Set
    End Property

    Private _formato As String
    Public Property Formato() As String
        Get
            Return _formato
        End Get
        Set(ByVal value As String)
            _formato = value
        End Set
    End Property




    Public ReadOnly Property esNulo() As Boolean
        Get
            Try
                If Valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try
        End Get
    End Property

    Public ReadOnly Property estipo_odbc() As Boolean
        Get

            Try
                If Valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try


        End Get
    End Property

    Public ReadOnly Property estipo_db() As Boolean
        Get
            Try
                If Valor.ToString.Trim().Length = 0 Then
                    Return True
                Else
                    Return False
                End If
            Catch ex As Exception
                Return True
            End Try
        End Get
    End Property

    Public Overrides Function ToString() As String
        Try
            Return Me.Valor.ToString()
        Catch ex As Exception
            Return String.Empty
        End Try

    End Function


    Public Shared Function ToCampo(Of T)(ByVal param As T) As Campo
        Try



            Dim newCampo As New Campo()

            If param Is Nothing Then
                newCampo.Valor = Nothing
                newCampo.Tipo = GetType(DBNull)
            Else
                newCampo.Tipo = param.GetType
                newCampo.Valor = param

            End If


            Return newCampo
        Catch ex As NullReferenceException
            Throw New Exception("El paramatro que se quiere convertir a Campo es nulo. No es posible convertir.")
        Catch ex As Exception
            Throw ex
        End Try
    End Function


    Public Function ToCampoExtendido() As CampoExtendido


        Dim newCampo As New CampoExtendido()
        newCampo.Tipo = _tipo
        newCampo.Valor = _valor
        newCampo.Nombre = ""
        Return newCampo

    End Function

    Public Shared Operator =(ByVal a As Campo, ByVal b As Campo) As Boolean

        'Para casos en que una de las dos variables sean null
        If a Is Nothing And b Is Nothing Then
            Return True
        End If

        If a Is Nothing OrElse b Is Nothing Then
            Return False
        End If
        'If a Is Nothing And Not b Is Nothing Then
        '    Return False
        'End If
        'If Not a Is Nothing And b Is Nothing Then
        '    Return False
        'End If

        'Llegamos aca si ninguna de las variables es null'
        If a.Valor.ToString.ToLower = b.Valor.ToString.ToLower Then
            Return True
        Else
            Return False
        End If
    End Operator

    Public Shared Operator <>(ByVal a As Campo, ByVal b As Campo) As Boolean
        Return Not (a = b)
    End Operator




    Public Sub New()

    End Sub

    Public Function CompareTo(ByVal obj As Object) As Integer Implements System.IComparable.CompareTo
        If obj Is Nothing Then Return 1

        Dim pCampo As Campo = TryCast(obj, Campo)

        If pCampo IsNot Nothing Then

            Return pCampo.Valor.ToString.CompareTo(Me.Valor.ToString)

        Else
            Throw New ArgumentException("Error comparando campos. ")
        End If
    End Function
End Class
