Imports System.ComponentModel

'Public Enum Ambientes
'    <Description("PRODUCCION")> PRODUCCION
'    <Description("DESARROLLO")> DESARROLLO
'    <Description("PRUEBA")> PRUEBA
'End Enum

Public Class Propiedades

    Private _propiedad As String
    Private _valor As String
    Private _descripcion As String

    Public Property Propiedad() As String
        Get
            Return _propiedad
        End Get
        Set(ByVal value As String)
            _propiedad = value
        End Set
    End Property
    Public Property Valor() As String
        Get
            Return _valor
        End Get
        Set(ByVal value As String)
            _valor = value
        End Set
    End Property
    Public Property Descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
        End Set
    End Property

    Sub New()

    End Sub

    Sub New(ByVal pPropiedad As String, ByVal pValor As String, ByVal pDescripcion As String)
        _propiedad = pPropiedad
        _valor = pValor
        _descripcion = pDescripcion
    End Sub

    Public Overrides Function ToString() As String
        Return _valor
    End Function

    Public Function PropToString() As String
        Return _propiedad
    End Function

End Class

Public Class Configuraciones

    Private _listaPropiedades As List(Of Propiedades)

    Public Property ListaPropiedades() As List(Of Propiedades)
        Get
            Return _listaPropiedades
        End Get
        Set(ByVal value As List(Of Propiedades))
            _listaPropiedades = value
        End Set
    End Property

    Sub New()

    End Sub

    Sub New(ByVal pListaPropiedades As List(Of Propiedades))
        _listaPropiedades = pListaPropiedades
    End Sub

    Public Sub RemovePropiedad(pPropiedad As String)
        Try

            For Each elemento As Propiedades In _listaPropiedades
                If elemento.Propiedad.ToUpper.Equals(pPropiedad.ToUpper) Then
                    _listaPropiedades.Remove(elemento)
                End If
            Next

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

End Class

