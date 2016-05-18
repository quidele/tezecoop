Imports fonseca_libDatos

Public Class Simulacion


    Private _nro_simu As Campo
    Public Property nro_simu() As Campo
        Get
            Return _nro_simu
        End Get
        Set(ByVal value As Campo)
            _nro_simu = value
        End Set
    End Property

End Class
