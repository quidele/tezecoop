Public Class ConfiguracionFE

    Private _nombre As String
    Private _ambiente As String
    Private _mercado As String
    Private _valor As String

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property
    Public Property Ambiente() As String
        Get
            Return _ambiente
        End Get
        Set(ByVal value As String)
            _ambiente = value
        End Set
    End Property
    Public Property Mercado() As String
        Get
            Return _mercado
        End Get
        Set(ByVal value As String)
            _mercado = value
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


    Sub New()

    End Sub

    Sub New(ByVal pNombre As String, ByVal pAmbiente As String, ByVal pMercado As String, ByVal pValor As String)
        _nombre = pNombre
        _ambiente = pAmbiente
        _mercado = pMercado
        _valor = pValor
    End Sub


    Public Shared Function ObtenerValor(ByVal pListaConfiguraciones As List(Of ConfiguracionFE), ByVal pAmbiente As String, ByVal pMercado As String, ByVal pNombre As String) As String
        Try
            Dim objConfiguracionFE As ConfiguracionFE

            'Utilizamos LINQ para obtener los datos de ConfiguracionFE correspondientes
            objConfiguracionFE = (From item In pListaConfiguraciones Where item.Nombre.ToUpper.Equals(pNombre.ToUpper) _
                            AndAlso item.Mercado.ToUpper.Equals(pMercado.ToUpper) _
                            AndAlso item.Ambiente.ToUpper.Equals(pAmbiente.ToUpper) _
                            Select New ConfiguracionFE(item.Nombre, item.Ambiente, item.Mercado, item.Valor)).First


            Return objConfiguracionFE.Valor

        Catch ex As Exception
            Throw ex
        End Try
    End Function

End Class
