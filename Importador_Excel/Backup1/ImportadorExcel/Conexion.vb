Imports fonseca_libDatos
Public Class Conexion

    Private _id_conexion As Campo
    Private _plataforma As Campo
    Private _ambiente As Campo
    Private _nombre As Campo
    Private _driver As Campo
    Private _url As Campo
    Private _usuario As Campo
    Private _password As Campo


    Public Property id_conexion() As Campo
        Get
            Return _id_conexion
        End Get
        Set(ByVal value As Campo)
            _id_conexion = value
        End Set
    End Property

    Public Property plataforma() As Campo
        Get
            Return _plataforma
        End Get
        Set(ByVal value As Campo)
            _plataforma = value
        End Set
    End Property

    Public Property ambiente() As Campo
        Get
            Return _ambiente
        End Get
        Set(ByVal value As Campo)
            _ambiente = value
        End Set
    End Property

    Public Property nombre() As Campo
        Get
            Return _nombre
        End Get
        Set(ByVal value As Campo)
            _nombre = value
        End Set
    End Property

    Public Property driver() As Campo
        Get
            Return _driver
        End Get
        Set(ByVal value As Campo)
            _driver = value
        End Set
    End Property

    Public Property url() As Campo
        Get
            Return _url
        End Get
        Set(ByVal value As Campo)
            _url = value
        End Set
    End Property

    Public Property usuario() As Campo
        Get
            Return _usuario
        End Get
        Set(ByVal value As Campo)
            _usuario = value
        End Set
    End Property

    Public Property password() As Campo
        Get
            Return _password
        End Get
        Set(ByVal value As Campo)
            _password = value
        End Set
    End Property




    Public Sub New()
        _id_conexion = New Campo
        _plataforma = New Campo
        _ambiente = New Campo
        _nombre = New Campo
        _driver = New Campo
        _url = New Campo
        _usuario = New Campo
        _password = New Campo
    End Sub

    Public Sub New(ByVal id_conexion As Campo, ByVal plataforma As Campo, ByVal ambiente As Campo, _
                ByVal nombre As Campo, ByVal driver As Campo, ByVal url As Campo, ByVal usuario As Campo, ByVal password As Campo)

        _id_conexion = id_conexion
        _plataforma = plataforma
        _ambiente = ambiente
        _nombre = nombre
        _driver = driver
        _url = url
        _usuario = usuario
        _password = password

    End Sub


End Class
