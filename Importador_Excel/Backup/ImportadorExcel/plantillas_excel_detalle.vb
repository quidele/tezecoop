Imports fonseca_libDatos
Public Class plantillas_excel_detalle

    Private _id As campo
    Private _tipo_detalle As campo
    Private _nombre As campo
    Private _fila As campo
    Private _columna As campo
    Private _valor As campo

    Private _tipoDato As Campo
    

    Public Property Id() As Campo
        Get
            Return _id
        End Get
        Set(ByVal value As Campo)
            _id = value
        End Set
    End Property

    Public Property Tipo_detalle() As Campo
        Get
            Return _tipo_detalle
        End Get
        Set(ByVal value As Campo)
            _tipo_detalle = value
        End Set
    End Property

    Public Property Nombre() As Campo
        Get
            Return _nombre
        End Get
        Set(ByVal value As Campo)
            _nombre = value
        End Set
    End Property

    Public Property Fila() As Campo
        Get
            Return _fila
        End Get
        Set(ByVal value As Campo)
            _fila = value
        End Set
    End Property

    Public Property Columna() As Campo
        Get
            Return _columna
        End Get
        Set(ByVal value As Campo)
            _columna = value
        End Set
    End Property

    Public Property Valor() As Campo
        Get
            Return _valor
        End Get
        Set(ByVal value As Campo)
            _valor = value
        End Set
    End Property

    Public Property TipoDato() As Campo
        Get
            Return _tipoDato
        End Get
        Set(ByVal value As Campo)
            _tipoDato = value
        End Set
    End Property

    Sub New()
        Me._id = New Campo
        Me._tipo_detalle = New Campo
        Me._nombre = New Campo
        Me._fila = New Campo
        Me._columna = New Campo
        Me._valor = New Campo
        Me._tipoDato = New Campo
    End Sub

    Sub New(ByVal Id As Campo, ByVal Tipo_detalle As Campo, ByVal Nombre As Campo, _
        ByVal Fila As Campo, ByVal Columna As Campo, ByVal valor As Campo, ByVal tipo_dato As Campo)
        Me._id = Id
        Me._tipo_detalle = Tipo_detalle
        Me._nombre = Nombre
        Me._fila = Fila
        Me._columna = Columna
        Me._valor = valor
        Me._tipoDato = tipo_dato
    End Sub


End Class
