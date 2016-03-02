Public Class Conexion


    Private _nombre As String
    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Private _stringConection As String
    Public Property StringConection() As String
        Get
            Return _stringConection
        End Get
        Set(ByVal value As String)
            _stringConection = value
        End Set
    End Property

    Private _clave As String
    Public Property Clave() As String
        Get
            Return _clave
        End Get
        Set(ByVal value As String)
            _clave = value
        End Set
    End Property

    Private _usuario As String
    Public Property Usuario() As String
        Get
            Return _usuario
        End Get
        Set(ByVal value As String)
            _usuario = value
        End Set
    End Property

    Private _ambiente As String
    Public Property Ambiente() As String
        Get
            Return _ambiente
        End Get
        Set(ByVal value As String)
            _ambiente = value
        End Set
    End Property

    Private _base As String
    Public Property Base() As String
        Get
            Return _base
        End Get
        Set(ByVal value As String)
            _base = value
        End Set
    End Property

    Private _tipoProveedorDatos As Integer
    Public Property TipoProveedorDatos() As Integer
        Get
            Return _tipoProveedorDatos
        End Get
        Set(ByVal value As Integer)
            _tipoProveedorDatos = value
        End Set
    End Property

    Sub New()

    End Sub

    Sub New(ByVal pNombre As String, ByVal PStringConection As String, _
            ByVal pClave As String, ByVal pUsuario As String, _
            ByVal pAmbiente As String, ByVal pBase As String, _
            ByVal pTipoProveedorDatos As Integer)

        Me._ambiente = pAmbiente
        Me._base = pBase
        Me._clave = pClave
        Me._nombre = pNombre
        Me._stringConection = PStringConection
        Me._usuario = pUsuario
        Me._tipoProveedorDatos = pTipoProveedorDatos

    End Sub
End Class
