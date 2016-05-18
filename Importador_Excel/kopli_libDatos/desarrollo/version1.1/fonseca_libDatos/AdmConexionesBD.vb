Imports System
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class AdmConexionesBD

    Public Enum TipoProveedorDatos As Byte
        SqlClient = 0
        ODBC = 1
        Indefinido = 255
    End Enum

    Public Sub New(ByVal ProveedorDeDatos As TipoProveedorDatos, ByVal connectionString As String, _
                   ByVal usuario As String, ByVal clave As String)
        _proveedorDeDatos = ProveedorDeDatos
        _connectionString = connectionString
        _usuario = usuario
        _clave = clave
    End Sub

#Region "   Atributos"

    Private _objAdapter As SqlClient.SqlDataAdapter
    Private _connection As IDbConnection
    Private _command As IDbCommand
    Private _dataReader As IDataReader
    Private _transaction As IDbTransaction
    Private _proveedorDeDatos As TipoProveedorDatos = TipoProveedorDatos.Indefinido
    Private _filasAfectadasNonQuery As Integer
    Private _error As String
    Private _nombre_Database As String
    Private _rs_Scalar As Object
    Private _connectionString As String
    Private _usuario As String
    Private _clave As String

#End Region

#Region "   Propiedades"

    Public ReadOnly Property ProveedorDeDatos() As TipoProveedorDatos
        Get
            Return _proveedorDeDatos
        End Get
    End Property

    Private ReadOnly Property ConnectionString() As String
        Get
            Return _connectionString
        End Get
    End Property

    Private ReadOnly Property Usuario() As String
        Get
            Return _usuario
        End Get
    End Property

    Private ReadOnly Property Clave() As String
        Get
            Return _clave
        End Get
    End Property

    Public ReadOnly Property DataReader() As IDataReader
        Get
            Return _dataReader
        End Get
    End Property

    Public ReadOnly Property Rs_Scalar() As Object
        Get
            Return _rs_Scalar
        End Get
    End Property

    Public ReadOnly Property GetNombre_Database() As String
        Get
            Return _nombre_Database
        End Get
    End Property

    Public ReadOnly Property Connection() As IDbConnection
        Get
            Return _connection
        End Get
    End Property

    Public ReadOnly Property Command() As IDbCommand
        Get
            Return _command
        End Get
    End Property

    Public ReadOnly Property [Error]() As String
        Get
            Return [_error]
        End Get
    End Property

    Public ReadOnly Property FilasAfectadasNonQuery() As Integer
        Get
            Return _filasAfectadasNonQuery
        End Get
    End Property


#End Region

    Public Function AbrirConexion() As Boolean

        Dim objEncriptado As New Encriptado()
        Dim claveDesEncriptada As String

        If Not (_connection Is Nothing) Then
            Select Case _connection.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexion = True
                    Exit Function
            End Select
        End If

        If _proveedorDeDatos = TipoProveedorDatos.SqlClient Then
            _connection = New SqlConnection
        ElseIf _proveedorDeDatos = TipoProveedorDatos.ODBC Then
            _connection = New OdbcConnection()
        Else
            Throw New Exception("Error en fonseca_libDatos: El proveedor de datos no esta definido.")
        End If


        'Desencriptar la clave
        claveDesEncriptada = objEncriptado.DecryptText(Clave, Usuario)

        _connection.ConnectionString = _connectionString + ";Uid=" + Usuario + " ;Pwd=" + claveDesEncriptada

        Try
            _connection.Open()
            AbrirConexion = True
        Catch ex As Exception
            AbrirConexion = False
            [_error] = ex.Message
        End Try

        _nombre_Database = _connection.Database

    End Function

    Public Sub CerrarConexion()

        Try
            _connection.Close()
            _connection.Dispose()
        Catch ex As Exception
            Me._error = ("Error al cerrar la conexion")
        End Try

    End Sub

    'Public Sub CerrarconexionODBC()

    '    Try
    '        OdbcConnection.ReleaseObjectPool()
    '        GC.Collect()
    '    Catch ex As Exception
    '        Me._error = "Error al cerrar la conexion ODBC"
    '    End Try

    'End Sub

    Public Sub CerrarDataReader()
        Me._error = Nothing
        Try
            If _dataReader Is Nothing Then
                Exit Sub
            End If
            If Not _dataReader.IsClosed Then
                _dataReader.Close()
            End If
        Catch ex As Exception
            Me._error = "Error al cerrar el data reader"
        End Try
    End Sub


    Public Function EjecutarScalar(ByVal sql As String) As Boolean

        CerrarDataReader()

        AbrirConexion()

        If _proveedorDeDatos = TipoProveedorDatos.SqlClient Then
            _command = New SqlCommand()
        ElseIf _proveedorDeDatos = TipoProveedorDatos.ODBC Then
            _command = New OdbcCommand
        Else
            Throw New Exception("Error en fonseca_libDatos: El proveedor de datos no esta definido.")
        End If

        _command.Connection = _connection
        _command.CommandType = CommandType.Text
        _command.CommandText = sql
        _command.Transaction = _transaction

        Try
            _rs_Scalar = New Object
            _rs_Scalar = _command.ExecuteScalar
            EjecutarScalar = True
        Catch ex As Exception
            EjecutarScalar = False
            [_error] = ex.Message
        End Try

        _command.Dispose()

    End Function

    Public Function EjecutarQuery(ByVal sql As String) As Boolean

        CerrarDataReader()

        AbrirConexion()

        If _proveedorDeDatos = TipoProveedorDatos.SqlClient Then
            _command = New SqlCommand()
        ElseIf _proveedorDeDatos = TipoProveedorDatos.ODBC Then
            _command = New OdbcCommand
        Else
            Throw New Exception("Error en fonseca_libDatos: El proveedor de datos no esta definido.")
        End If

        _command.Connection = _connection
        _command.CommandType = System.Data.CommandType.Text
        _command.CommandText = sql
        _command.Transaction = _transaction

        Try
            _dataReader = _command.ExecuteReader
            EjecutarQuery = True
        Catch ex As Exception
            EjecutarQuery = False
            [_error] = ex.Message
        End Try

        _command.Dispose()

    End Function

    Public Function EjecutarNonQuery(ByVal sql As String) As Boolean

        CerrarDataReader()
        AbrirConexion()

        If _proveedorDeDatos = TipoProveedorDatos.SqlClient Then
            _command = New SqlCommand()
        ElseIf _proveedorDeDatos = TipoProveedorDatos.ODBC Then
            _command = New OdbcCommand
        Else
            Throw New Exception("Error en fonseca_libDatos: El proveedor de datos no esta definido.")
        End If

        _command.Connection = _connection
        _command.CommandType = System.Data.CommandType.Text
        _command.CommandText = sql
        _command.Transaction = _transaction


        Try
            _filasAfectadasNonQuery = _command.ExecuteNonQuery
            EjecutarNonQuery = True
        Catch ex As Exception
            EjecutarNonQuery = False
            [_error] = ex.Message
        End Try

        _command.Dispose()

    End Function


#Region "   Return DataTable NON QUERY"
    ''' <summary>
    ''' Devuelve un DataTable con el resultado de la consulta. El tipoComando por defecto para querys.
    ''' </summary>
    ''' <param name="pSQL"></param>
    ''' <param name="tipoComando"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function EjecutarNonQuerySQL_DT(ByVal pSQL As String, Optional ByVal tipoComando As CommandType = CommandType.Text) As DataTable

        CerrarDataReader()
        AbrirConexion()

        _command = New SqlClient.SqlCommand()
        _command.CommandType = tipoComando
        _command.CommandText = pSQL
        _command.Connection = _connection

        Dim miDataTable As New Data.DataTable()

        _objAdapter = New SqlClient.SqlDataAdapter()

        _objAdapter.SelectCommand = CType(_command, System.Data.SqlClient.SqlCommand)

        Try
            _objAdapter.Fill(miDataTable)
            _connection.Close()
            Return miDataTable

        Catch ex As Exception
            _connection.Close()
            Throw (ex)
        End Try

    End Function

#End Region


#Region "   Return DataSet NON QUERY"
    ''' <summary>
    ''' Devuelve un DataSet con el resultado de la consulta. El tipoComando por defecto para querys.
    ''' </summary>
    ''' <param name="pSQL"></param>
    ''' <param name="tipoComando"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function EjecutarNonQuerySQL_DS(ByVal pSQL As String, Optional ByVal tipoComando As CommandType = CommandType.Text) As DataSet

        CerrarDataReader()
        AbrirConexion()


        _command = New SqlCommand()

        _command.Connection = CType(_connection, System.Data.SqlClient.SqlConnection)
        _command.CommandType = tipoComando
        _command.CommandText = pSQL

        Dim miDataSet As New Data.DataSet()
        _objAdapter = New SqlClient.SqlDataAdapter()

        _objAdapter.SelectCommand = CType(_command, System.Data.SqlClient.SqlCommand)

        Try

            _objAdapter.Fill(miDataSet)
            _connection.Close()
            Return miDataSet

        Catch ex As Exception
            _connection.Close()
            Throw (ex)
        End Try

    End Function

    
#End Region

 
    Public Function EjecutarNonQuerySQL_DT_Update(ByVal pSQL As String, ByVal dt As DataTable) As Boolean

        EjecutarNonQuerySQL_DT_Update = False
        CerrarDataReader()
        AbrirConexion()

        _command = New SqlCommand()

        _command.Connection = CType(_connection, System.Data.SqlClient.SqlConnection)
        _command.CommandType = CommandType.Text
        _command.CommandText = pSQL

        If _objAdapter Is Nothing Then
            Exit Function
        End If

        _objAdapter.SelectCommand = CType(_command, System.Data.SqlClient.SqlCommand)


        Dim cmdBuilder As SqlCommandBuilder

        cmdBuilder = New SqlCommandBuilder(_objAdapter)

        Dim cambios = dt.GetChanges()

        Try
            If Not cambios Is Nothing Then
                _objAdapter.Update(cambios)
            End If
        Catch ex As Exception
            _connection.Close()
            Throw (ex)
        End Try

    End Function

#Region "   Transaction"

    Public Function Begin_Transaction() As Boolean
        Begin_Transaction = True
        Try
            Me.AbrirConexion()
            CerrarDataReader()
            _transaction = _connection.BeginTransaction()
        Catch ex As Exception
            Begin_Transaction = False
            Me._error = ex.Message
        End Try

    End Function

    Public Function Commit_Transaction() As Boolean
        Commit_Transaction = True
        Try
            CerrarDataReader()
            _transaction.Commit()
            _transaction.Dispose()
        Catch ex As Exception
            Commit_Transaction = False
            Me._error = ex.Message
        End Try
    End Function

    Public Function Rollback_Transaction() As Boolean
        Rollback_Transaction = True
        Try
            CerrarDataReader()
            _transaction.Rollback()
            _transaction.Dispose()
        Catch ex As Exception
            Rollback_Transaction = False
            Me._error = ex.Message
        End Try

    End Function


#End Region


End Class






