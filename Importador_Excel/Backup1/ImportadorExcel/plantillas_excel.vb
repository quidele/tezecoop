Imports fonseca_libDatos
Public Class plantillas_excel

    Private _id As campo
    Private _aplicacion As Campo
    Private _nombre As Campo
    Private _hoja_xls As Campo
    Private _ruta_archivo As Campo
    Private _fila_datos As Campo
    Private _columas As Campo
    Private _filas As Campo
    Private _base_destino As Campo
    Private _procedimiento As Campo
    Private _carp_archivo_tmp As Campo
    Private _separador As Campo



    Public Property Id() As Campo
        Get
            Return _id
        End Get
        Set(ByVal value As Campo)
            _id = value
        End Set
    End Property

    Public Property aplicacion() As Campo
        Get
            Return _aplicacion
        End Get
        Set(ByVal value As Campo)
            _aplicacion = value
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

    Public Property Hoja_xls() As Campo
        Get
            Return _hoja_xls
        End Get
        Set(ByVal value As Campo)
            _hoja_xls = value
        End Set
    End Property

    Public Property Ruta_archivo() As Campo
        Get
            Return _ruta_archivo
        End Get
        Set(ByVal value As Campo)
            _ruta_archivo = value
        End Set
    End Property

    Public Property Fila_datos() As Campo
        Get
            Return _fila_datos
        End Get
        Set(ByVal value As Campo)
            _fila_datos = value
        End Set
    End Property

    Public Property Columas() As Campo
        Get
            Return _columas
        End Get
        Set(ByVal value As Campo)
            _columas = value
        End Set
    End Property

    Public Property Filas() As Campo
        Get
            Return _filas
        End Get
        Set(ByVal value As Campo)
            _filas = value
        End Set
    End Property

    Public Property Base_destino() As Campo
        Get
            Return _base_destino
        End Get
        Set(ByVal value As Campo)
            _base_destino = value
        End Set
    End Property

    Public Property Procedimiento() As Campo
        Get
            Return _procedimiento
        End Get
        Set(ByVal value As Campo)
            _procedimiento = value
        End Set
    End Property

    Public Property Carp_archivo_tmp() As Campo
        Get
            Return _carp_archivo_tmp
        End Get
        Set(ByVal value As Campo)
            _carp_archivo_tmp = value
        End Set
    End Property

    Public Property Separador() As Campo
        Get
            Return _separador
        End Get
        Set(ByVal value As Campo)
            _separador = value
        End Set
    End Property


    Sub New()
        _id = New Campo
        _aplicacion = New Campo
        _nombre = New Campo
        _hoja_xls = New Campo
        _ruta_archivo = New Campo
        _fila_datos = New Campo
        _columas = New Campo
        _filas = New Campo
        _base_destino = New Campo
        _procedimiento = New Campo
        _carp_archivo_tmp = New Campo
        _separador = New Campo
    End Sub


    Sub New(ByVal id As Campo, ByVal aplicación As Campo, ByVal nombre As Campo, _
       ByVal hoja_xls As Campo, ByVal ruta_archivo As Campo, ByVal fila_datos As Campo, _
       ByVal columas As Campo, ByVal filas As Campo, ByVal base_destino As Campo, _
       ByVal procedimiento As Campo, ByVal carp_archivo_tmp As Campo, ByVal separador As Campo)

        Me._id = id
        Me._aplicacion = aplicación
        Me._nombre = nombre
        Me._hoja_xls = hoja_xls
        Me._ruta_archivo = ruta_archivo
        Me._fila_datos = fila_datos
        Me._columas = columas
        Me._filas = filas
        Me._base_destino = base_destino
        Me._procedimiento = procedimiento
        Me._carp_archivo_tmp = carp_archivo_tmp
        Me._separador = separador

    End Sub

End Class
