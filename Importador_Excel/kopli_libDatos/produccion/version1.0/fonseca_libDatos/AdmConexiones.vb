Imports System
Imports System.Data.SqlClient
Imports System.Data.Odbc


Public Class AdmConexiones

    Private _connSQL As Data.SqlClient.SqlConnection
    Private _connSQL_RRHH As Data.SqlClient.SqlConnection

    Private connMFG_Cueros As Data.Odbc.OdbcConnection
    Private connMFG_Ebfonse As Data.Odbc.OdbcConnection

    Private [_error] As String

    Private _oCmdSQL As Data.SqlClient.SqlCommand
    Private _rsSQL As Data.SqlClient.SqlDataReader
    Public _rsSQLFE As Data.SqlClient.SqlDataReader

    Private oCmdMFG_Cueros As System.Data.Odbc.OdbcCommand
    Private oCmdMFG_Ebfonse As System.Data.Odbc.OdbcCommand
    Private _rsMFG_Cueros As Data.Odbc.OdbcDataReader
    Private _rsMFG_Ebfonse As Data.Odbc.OdbcDataReader
    Private _rsMFG_EbFonse_Scalar As Object

    Private _nombre_SQLDatabase As String
    Private _rsSQL_Scalar As Object

    Private transaccionsql As SqlClient.SqlTransaction
    Private transaccionMFG_Cueros As Data.Odbc.OdbcTransaction
    Private transaccionMFG_Ebfonse As Data.Odbc.OdbcTransaction


#Region "   Propiedades ReadOnly"

    Public ReadOnly Property RsSQL_Scalar() As Object
        Get
            Return _rsSQL_Scalar
        End Get
    End Property

    Public ReadOnly Property RsSql_EbFonse_Scalar() As Object
        Get
            Return _rsMFG_EbFonse_Scalar
        End Get
    End Property

    Public ReadOnly Property GetNombre_SQLDatabase() As String
        Get
            Return _nombre_SQLDatabase
        End Get
    End Property

    Public ReadOnly Property RsMFG_Cueros() As Data.Odbc.OdbcDataReader
        Get
            Return _rsMFG_Cueros
        End Get

    End Property

    Public ReadOnly Property RsMFG_Ebfonse() As Data.Odbc.OdbcDataReader
        Get
            Return _rsMFG_Ebfonse
        End Get
    End Property

    Public ReadOnly Property connSQL() As Data.SqlClient.SqlConnection
        Get
            Return _connSQL
        End Get
    End Property

    Public ReadOnly Property [Error]() As String
        Get
            Return [_error]
        End Get
    End Property

    Public ReadOnly Property oCmdSQL() As Data.SqlClient.SqlCommand
        Get
            Return _oCmdSQL
        End Get
    End Property

    Public ReadOnly Property rsSQL() As Data.SqlClient.SqlDataReader
        Get
            Return _rsSQL
        End Get
    End Property

    Public ReadOnly Property rsSQLFE() As Data.SqlClient.SqlDataReader
        Get
            Return _rsSQLFE
        End Get
    End Property

#End Region


#Region "   Abrir Conexiones"

    Public Function AbrirConexionRRHH_SQL() As Boolean
        Dim connectionString As String = ""
        Dim usuario_RRHH As String
        Dim clave_RRHH As String
        Dim clave As String
        Dim objEncriptado As New Encriptado


        If Not (_connSQL_RRHH Is Nothing) Then
            Select Case _connSQL_RRHH.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionRRHH_SQL = True
                    Exit Function
            End Select
        End If

        _connSQL_RRHH = New Data.SqlClient.SqlConnection

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("RRHH").ConnectionString
        usuario_RRHH = Configuration.ConfigurationManager.AppSettings("USUARIO_RRHH")
        clave_RRHH = Configuration.ConfigurationManager.AppSettings("CLAVE_RRHH")

        clave = objEncriptado.DecryptText(clave_RRHH, usuario_RRHH)

        _connSQL_RRHH.ConnectionString = connectionString + ";Uid=" + usuario_RRHH + " ;Pwd=" + clave


        Try
            _connSQL_RRHH.Open()
            AbrirConexionRRHH_SQL = True
        Catch ex As Exception
            AbrirConexionRRHH_SQL = False
            [_error] = ex.Message
        End Try
        _nombre_SQLDatabase = _connSQL_RRHH.Database
    End Function


    'Public Function AbrirConexion(ByVal connectionString As String, ByVal usuario As String, ByVal clave As String) As Boolean

    '    If Not (_connSQL Is Nothing) Then
    '        Select Case _connSQL.State
    '            Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
    '                AbrirConexion = True
    '                Exit Function
    '        End Select
    '    End If

    '    _connSQL.ConnectionString = connectionString + ";Uid=" + usuario + " ;Pwd=" + clave

    '    Try
    '        _connSQL.Open()
    '        AbrirConexion = True
    '    Catch ex As Exception
    '        AbrirConexion = False
    '        _error = ex.Message
    '    End Try

    'End Function

    Public Function AbrirConexionMagmaSQL() As Boolean

        Dim connectionString As String = ""
        Dim usuario_magma As String
        Dim clave_magma As String
        Dim clave As String
        Dim objEncriptado As New Encriptado()

        If Not (_connSQL Is Nothing) Then
            Select Case _connSQL.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionMagmaSQL = True
                    Exit Function
            End Select
        End If

        _connSQL = New Data.SqlClient.SqlConnection

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("MAGMA_ERP").ConnectionString
        usuario_magma = Configuration.ConfigurationManager.AppSettings("usuario_Magma_ERP")
        clave_magma = Configuration.ConfigurationManager.AppSettings("clave_MAGMA_ERP")

        ' ahora se desencripta la clave
        clave = objEncriptado.DecryptText(clave_magma, usuario_magma)

        _connSQL.ConnectionString = connectionString + ";Uid=" + usuario_magma + " ;Pwd=" + clave

        Try
            _connSQL.Open()
            'nombre_SQLDatabase = connSQL.Database
            AbrirConexionMagmaSQL = True
        Catch ex As Exception
            AbrirConexionMagmaSQL = False
            [_error] = ex.Message
        End Try
        _nombre_SQLDatabase = _connSQL.Database
    End Function

    Public Function AbrirConexionFE() As Boolean

        Dim connectionString As String
        Dim usuario_FE As String
        Dim clave_FE As String
        Dim clave As String
        Dim objEncriptado As New Encriptado()

        If Not (_rsSQLFE Is Nothing) Then
            Select Case _connSQL.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionFE = True
                    Exit Function
            End Select
        End If

        _connSQL = New Data.SqlClient.SqlConnection

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("FacturaElectronica").ConnectionString
        usuario_FE = Configuration.ConfigurationManager.AppSettings("usuario_FE")
        clave_FE = Configuration.ConfigurationManager.AppSettings("clave_FE")

        ' ahora se desencripta la clave
        clave = objEncriptado.DecryptText(clave_FE, usuario_FE)

        _connSQL.ConnectionString = connectionString + ";Uid=" + usuario_FE + " ;Pwd=" + clave

        Try
            _connSQL.Open()
            '    _nombre_SQLDatabase = _connSQL.Database
            AbrirConexionFE = True
        Catch ex As Exception
            AbrirConexionFE = False
            [_error] = ex.Message
        End Try

    End Function

    Public Function AbrirConexionMFG_Cueros() As Boolean

        Dim connectionString As String
        Dim usuario_MFG_Cueros As String
        Dim clave_MFG_Cueros As String
        Dim clave As String
        Dim objEncriptado As New Encriptado()

        If Not (connMFG_Cueros Is Nothing) Then
            Select Case connMFG_Cueros.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionMFG_Cueros = True
                    Exit Function
            End Select
        End If


        connMFG_Cueros = New Data.Odbc.OdbcConnection()

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("CUEROS_BD").ConnectionString
        usuario_MFG_Cueros = Configuration.ConfigurationManager.AppSettings("usuario_Cueros_BD")
        clave_MFG_Cueros = Configuration.ConfigurationManager.AppSettings("clave_Cueros_BD")

        ' ahora se desencripta la clave
        clave = objEncriptado.DecryptText(clave_MFG_Cueros, usuario_MFG_Cueros)

        connMFG_Cueros.ConnectionString = connectionString + ";Uid=" + usuario_MFG_Cueros + " ;Pwd=" + clave


        Try
            connMFG_Cueros.Open()
            AbrirConexionMFG_Cueros = True
            [_error] = Nothing
        Catch ex As Exception
            AbrirConexionMFG_Cueros = False
            [_error] = ex.Message
        End Try

    End Function

    Public Function AbrirConexionMFG_Ebfonse() As Boolean

        Dim connectionString As String
        Dim usuario_MFG_Ebfonse As String
        Dim clave_MFG_Ebfonse As String
        Dim clave As String
        Dim objEncriptado As New Encriptado()

        If Not (connMFG_Ebfonse Is Nothing) Then
            Select Case connMFG_Ebfonse.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionMFG_Ebfonse = True
                    Exit Function
            End Select
        End If

        connMFG_Ebfonse = New Data.Odbc.OdbcConnection()

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("EBFONSE_BD").ConnectionString
        usuario_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("usuario_MFG_Ebfonse")
        clave_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("clave_MFG_Ebfonse")

        ' ahora se desencripta la clave
        clave = objEncriptado.DecryptText(clave_MFG_Ebfonse, usuario_MFG_Ebfonse)

        connMFG_Ebfonse.ConnectionString = connectionString + ";Uid=" + usuario_MFG_Ebfonse + " ;Pwd=" + clave


        Try
            connMFG_Ebfonse.Open()
            AbrirConexionMFG_Ebfonse = True
        Catch ex As Exception
            AbrirConexionMFG_Ebfonse = False
            [_error] = ex.Message
        End Try

    End Function

    Public Function AbrirConexionMFG_EbFonse_Uncommited() As Boolean
        Dim connectionString As String
        Dim usuario_MFG_Ebfonse As String
        Dim clave_MFG_Ebfonse As String
        Dim clave As String
        Dim objEncriptado As New Encriptado()

        If Not (connMFG_Ebfonse Is Nothing) Then
            Select Case connMFG_Ebfonse.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    AbrirConexionMFG_EbFonse_Uncommited = True
                    Exit Function
            End Select
        End If

        connMFG_Ebfonse = New Data.Odbc.OdbcConnection()

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("EBFONSE_BD_Unc").ConnectionString
        usuario_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("usuario_MFG_Ebfonse")
        clave_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("clave_MFG_Ebfonse")

        ' ahora se desencripta la clave
        clave = objEncriptado.DecryptText(clave_MFG_Ebfonse, usuario_MFG_Ebfonse)

        connMFG_Ebfonse.ConnectionString = connectionString + ";Uid=" + usuario_MFG_Ebfonse + " ;Pwd=" + clave


        Try
            connMFG_Ebfonse.Open()
            AbrirConexionMFG_EbFonse_Uncommited = True
        Catch ex As Exception
            AbrirConexionMFG_EbFonse_Uncommited = False
            [_error] = ex.Message
        End Try
    End Function

#End Region


#Region "   Execute Scalar"

    Public Function EjecutarScalarSQL(ByVal pSql As String) As Boolean
        CerrarDataReaderSQL()

        AbrirConexionMagmaSQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = CommandType.Text
        _oCmdSQL.CommandText = pSql
        _oCmdSQL.Transaction = transaccionsql
        Try
            _rsSQL_Scalar = _oCmdSQL.ExecuteScalar
            EjecutarScalarSQL = True
        Catch ex As Exception
            EjecutarScalarSQL = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

    Public Function EjecutarScalarRRHH(ByVal pSql As String) As Boolean
        CerrarDataReaderRRHH()

        AbrirConexionRRHH_SQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = CommandType.Text
        _oCmdSQL.CommandText = pSql
        _oCmdSQL.Transaction = transaccionsql
        Try
            _rsSQL_Scalar = _oCmdSQL.ExecuteScalar
            EjecutarScalarRRHH = True
        Catch ex As Exception
            EjecutarScalarRRHH = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

    Public Function EjecutarScalarEbCue(ByVal pSql As String) As Boolean
        CerrarconexionMFG_CuerosODBC()
        AbrirConexionMFG_Cueros()

        oCmdMFG_Cueros = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Cueros.Connection = connMFG_Cueros
        oCmdMFG_Cueros.CommandType = CommandType.Text
        oCmdMFG_Cueros.CommandText = pSql
        oCmdMFG_Cueros.Transaction = transaccionMFG_Cueros

        Try
            _rsMFG_EbFonse_Scalar = New Object
            _rsMFG_EbFonse_Scalar = oCmdMFG_Cueros.ExecuteScalar
            EjecutarScalarEbCue = True
        Catch ex As Exception
            EjecutarScalarEbCue = False
            Me._error = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()
    End Function

    Public Function EjecutarScalarEbFonse(ByVal pSql As String) As Boolean
        CerrarconexionMFG_EbfonseODBC()
        AbrirConexionMFG_Ebfonse()

        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Ebfonse
        oCmdMFG_Ebfonse.CommandType = CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSql
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse

        Try
            _rsMFG_EbFonse_Scalar = New Object
            _rsMFG_EbFonse_Scalar = oCmdMFG_Ebfonse.ExecuteScalar
            EjecutarScalarEbFonse = True
        Catch ex As Exception
            EjecutarScalarEbFonse = False
            Me._error = ex.Message
        End Try

        oCmdMFG_Ebfonse.Dispose()
    End Function

#End Region


#Region "   Execute Query"

    Public Function EjecutarQueryMFG_Cueros(ByVal pSQL As String) As Boolean
        Dim unOdbcParametro As New OdbcParameter

        CerrarDataReaderMFG_Cueros()
        AbrirConexionMFG_Cueros()

        oCmdMFG_Cueros = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Cueros.Connection = connMFG_Cueros
        oCmdMFG_Cueros.CommandType = System.Data.CommandType.Text
        oCmdMFG_Cueros.CommandText = pSQL
        oCmdMFG_Cueros.Transaction = transaccionMFG_Cueros

        Try
            _rsMFG_Cueros = oCmdMFG_Cueros.ExecuteReader()
            EjecutarQueryMFG_Cueros = True
            [_error] = Nothing
        Catch ex As Exception
            EjecutarQueryMFG_Cueros = False
            [_error] = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()

    End Function

    Public Function EjecutarQueryMFG_Ebfonse(ByVal pSQL As String) As Boolean
        Dim unOdbcParametro As New OdbcParameter

        CerrarDataReaderMFG_Ebfonse()
        AbrirConexionMFG_Ebfonse()

        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Ebfonse
        oCmdMFG_Ebfonse.CommandType = System.Data.CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSQL
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse

        Try
            _rsMFG_Ebfonse = oCmdMFG_Ebfonse.ExecuteReader()
            EjecutarQueryMFG_Ebfonse = True
        Catch ex As Exception
            EjecutarQueryMFG_Ebfonse = False
            [_error] = ex.Message
        End Try

        oCmdMFG_Ebfonse.Dispose()

    End Function

    Public Function EjecutarQueryMFG_Ebfonse_uncommited(ByVal pSQL As String) As Boolean
        Dim unOdbcParametro As New OdbcParameter

        CerrarDataReaderMFG_Ebfonse()
        AbrirConexionMFG_EbFonse_Uncommited()

        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Ebfonse
        oCmdMFG_Ebfonse.CommandType = System.Data.CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSQL
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse

        Try
            _rsMFG_Ebfonse = oCmdMFG_Ebfonse.ExecuteReader()
            EjecutarQueryMFG_Ebfonse_uncommited = True
        Catch ex As Exception
            EjecutarQueryMFG_Ebfonse_uncommited = False
            [_error] = ex.Message
        End Try

        oCmdMFG_Ebfonse.Dispose()

    End Function


    Public Function EjecutarQuerySQLFE(ByVal pSQL As String) As Boolean

        CerrarDataReaderSQLFE()

        AbrirConexionFE()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _rsSQLFE = oCmdSQL.ExecuteReader()
            EjecutarQuerySQLFE = True
        Catch ex As Exception
            EjecutarQuerySQLFE = False
            [_error] = ex.Message
        End Try

        oCmdSQL.Dispose()

    End Function

    Public Function EjecutarQuerySQL(ByVal pSQL As String) As Boolean

        CerrarDataReaderSQL()

        AbrirConexionMagmaSQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _rsSQL = _oCmdSQL.ExecuteReader()
            EjecutarQuerySQL = True
        Catch ex As Exception
            EjecutarQuerySQL = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

    Public Function EjecutarQueryRRHH(ByVal pSQL As String) As Boolean

        CerrarDataReaderRRHH()

        AbrirConexionRRHH_SQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL_RRHH

        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _rsSQL = _oCmdSQL.ExecuteReader()
            EjecutarQueryRRHH = True
        Catch ex As Exception
            EjecutarQueryRRHH = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

#End Region


#Region "   Execute NON Query"



    Public Function EjecutarNonQuery(ByVal connectionString As String, ByVal usuario As String, ByVal clave As String, ByVal pSQL As String, Optional ByVal trans As SqlTransaction = Nothing) As Boolean
        Dim _objConexion As SqlConnection = Nothing
        Dim _objCommand As SqlCommand = Nothing
        Try
            _objConexion = New SqlConnection(connectionString + ";Uid=" + usuario + " ;Pwd=" + clave)
            _objConexion.Open()

            _objCommand = New SqlCommand()

            _objCommand.Connection = _objConexion
            _objCommand.CommandType = System.Data.CommandType.Text
            _objCommand.CommandText = pSQL
            _objCommand.Transaction = trans


            _objCommand.ExecuteNonQuery()
            EjecutarNonQuery = True
        Catch ex As Exception
            EjecutarNonQuery = False
            [_error] = ex.Message
        Finally
            _objCommand.Dispose()
            _objConexion.Close()
        End Try


    End Function

    Public Function EjecutarNonQueryMFG_Cueros(ByVal pSQL As String) As Boolean

        CerrarDataReaderMFG_Cueros()
        AbrirConexionMFG_Cueros()


        oCmdMFG_Cueros = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Cueros.Connection = connMFG_Cueros
        oCmdMFG_Cueros.CommandType = System.Data.CommandType.Text
        oCmdMFG_Cueros.CommandText = pSQL
        oCmdMFG_Cueros.Transaction = transaccionMFG_Cueros


        Try
            oCmdMFG_Cueros.ExecuteNonQuery()
            EjecutarNonQueryMFG_Cueros = True
        Catch ex As Exception
            EjecutarNonQueryMFG_Cueros = False
            [_error] = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()

    End Function

    Public Function EjecutarNonQueryMFG_Ebfonse(ByVal pSQL As String) As Boolean

        CerrarDataReaderMFG_Ebfonse()
        AbrirConexionMFG_Ebfonse()


        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Ebfonse
        oCmdMFG_Ebfonse.CommandType = System.Data.CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSQL
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse


        Try
            oCmdMFG_Ebfonse.ExecuteNonQuery()
            EjecutarNonQueryMFG_Ebfonse = True
        Catch ex As Exception
            EjecutarNonQueryMFG_Ebfonse = False
            [_error] = ex.Message
        End Try

        oCmdMFG_Ebfonse.Dispose()

    End Function

    Public Function ejecutarNonQuerySQLFE(ByVal pSQL As String) As Boolean

        CerrarDataReaderSQLFE()
        AbrirConexionFE()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _oCmdSQL.ExecuteNonQuery()
            ejecutarNonQuerySQLFE = True
        Catch ex As Exception
            ejecutarNonQuerySQLFE = False
            [_error] = ex.Message
            Log.EscbribirLinea_Log([_error])
        End Try

        oCmdSQL.Dispose()

    End Function

    
    Public Function EjecutarNonQuerySQL(ByVal pSQL As String) As Boolean

        CerrarDataReaderSQL()
        AbrirConexionMagmaSQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _oCmdSQL.ExecuteNonQuery()
            EjecutarNonQuerySQL = True
        Catch ex As Exception
            EjecutarNonQuerySQL = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

    Public Function EjecutarNonQueryRRHH(ByVal pSQL As String) As Boolean

        CerrarDataReaderRRHH()
        AbrirConexionRRHH_SQL()

        _oCmdSQL = New SqlCommand()
        _oCmdSQL.Connection = _connSQL
        _oCmdSQL.CommandType = System.Data.CommandType.Text
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Transaction = transaccionsql

        Try
            _oCmdSQL.ExecuteNonQuery()
            EjecutarNonQueryRRHH = True
        Catch ex As Exception
            EjecutarNonQueryRRHH = False
            [_error] = ex.Message
        End Try

        _oCmdSQL.Dispose()

    End Function

#End Region


#Region "   Return DataTable NON QUERY"
    ''' <summary>
    ''' Devuelve un DataTable con el resultado de la consulta. El tipoComando por defecto para querys.
    ''' </summary>
    ''' <param name="pSQL"></param>
    ''' <param name="tipoComando"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function EjecutarNonQuerySQL_DT(ByVal pSQL As String, Optional ByVal tipoComando As CommandType = CommandType.Text) As DataTable

        CerrarDataReaderSQL()
        AbrirConexionMagmaSQL()

        _oCmdSQL = New SqlClient.SqlCommand()
        _oCmdSQL.CommandType = tipoComando
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Connection = _connSQL

        Dim miDataTable As New Data.DataTable()

        Dim objAdapter As New SqlClient.SqlDataAdapter()
        objAdapter.SelectCommand = _oCmdSQL
        Try
            '_connSQL.Open()
            objAdapter.Fill(miDataTable)
            _connSQL.Close()
            Return miDataTable

        Catch ex As Exception
            _connSQL.Close()
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

        CerrarDataReaderSQL()
        AbrirConexionMagmaSQL()

        _oCmdSQL = New SqlClient.SqlCommand()
        _oCmdSQL.CommandType = tipoComando
        _oCmdSQL.CommandText = pSQL
        _oCmdSQL.Connection = _connSQL

        Dim miDataSet As New Data.DataSet()

        Dim objAdapter As New SqlClient.SqlDataAdapter()
        objAdapter.SelectCommand = _oCmdSQL
        Try
            '_connSQL.Open()
            objAdapter.Fill(miDataSet)
            _connSQL.Close()
            Return miDataSet

        Catch ex As Exception
            _connSQL.Close()
            Throw (ex)
        End Try

    End Function
#End Region

#Region "   Cerrar conexiones"

    Public Sub CerrarConexionMFG_Cueros()

        Try
            connMFG_Cueros.Dispose()
            connMFG_Cueros.Close()
        Catch ex As Exception
            Me.[_error] = ("Error al cerrar la conexion MFG_Cueros")
        End Try

    End Sub

    Public Sub CerrarconexionMFG_CuerosODBC()

        Try
            OdbcConnection.ReleaseObjectPool()
            GC.Collect()
        Catch ex As Exception
            Me.[_error] = "Error al cerrar la conexion ODBC"
        End Try

    End Sub

    Public Sub CerrarconexionMFG_EbfonseODBC()

        Try
            'connMFG_Ebfonse.ReleaseObjectPool()
            connMFG_Ebfonse = Nothing
            GC.Collect()
        Catch ex As Exception
            Me.[_error] = "Error al cerrar la conexion ODBC"
        End Try

    End Sub

    Public Sub CerrarConexionMFG_Ebfonse()

        Try
            connMFG_Ebfonse.Dispose()
            connMFG_Ebfonse.Close()
        Catch ex As Exception
            Me.[_error] = "Error al cerrar la conexion MFG_Cueros"
        End Try

    End Sub

#End Region


#Region "   Cerrar Data readers"

    Public Sub CerrarDataReaderSQLFE()
        Me._error = Nothing
        Try
            If Not _rsSQLFE.IsClosed Then
                _rsSQLFE.Close()
            End If
        Catch ex As Exception
            Me.[_error] = "Error al cerrar el data reader de SQL"
        End Try

    End Sub

    Public Sub CerrarDataReaderSQL()
        Me._error = Nothing
        Try
            If _rsSQL Is Nothing Then
                Exit Sub
            End If
            If Not _rsSQL.IsClosed Then
                _rsSQL.Close()
            End If
        Catch ex As Exception
            Me.[_error] = "Error al cerrar el data reader de SQL"
        End Try

    End Sub

    Public Sub CerrarDataReaderRRHH()
        Me._error = Nothing
        Try
            If Not _rsSQL.IsClosed Then
                _rsSQL.Close()
            End If
        Catch ex As Exception
            Me.[_error] = "Error al cerrar el data reader de SQL RRHH"
        End Try

    End Sub

    Public Sub CerrarDataReaderMFG_Cueros()
        Me._error = Nothing
        Try
            If Not _rsMFG_Cueros.IsClosed Then
                _rsMFG_Cueros.Close()
            End If
        Catch ex As Exception
            Me.[_error] = "Error al cerrar el data reader de SQL"
        End Try

    End Sub

    Public Sub CerrarDataReaderMFG_Ebfonse()
        Me._error = Nothing
        Try
            If Not _rsMFG_Ebfonse.IsClosed Then
                _rsMFG_Ebfonse.Close()
            End If
        Catch ex As Exception
            Me.[_error] = "Error al cerrar el data reader de SQL"
        End Try

    End Sub



#End Region


#Region "   Begin Transaction"

    Public Function BeginTransSQL() As Boolean

        Me.AbrirConexionMagmaSQL()
        CerrarDataReaderSQL()
        transaccionsql = _connSQL.BeginTransaction()

    End Function

    Public Function BeginTransRRHH() As Boolean

        Me.AbrirConexionRRHH_SQL()
        CerrarDataReaderSQL()
        transaccionsql = _connSQL.BeginTransaction()

    End Function

    Public Function BeginTransMFG_Cueros() As Boolean

        CerrarDataReaderMFG_Cueros()
        transaccionMFG_Cueros = connMFG_Cueros.BeginTransaction


    End Function

    Public Function BeginTransMFG_Ebfonse() As Boolean

        CerrarDataReaderMFG_Ebfonse()
        transaccionMFG_Ebfonse = connMFG_Cueros.BeginTransaction

    End Function

    Public Function BeginTransSQLFE() As Boolean

        CerrarDataReaderSQLFE()
        transaccionsql = _connSQL.BeginTransaction()

    End Function

#End Region


#Region "   Commit Transaction"

    Public Function CommitSQL() As Boolean
        CommitSQL = True
        Try
            CerrarDataReaderSQL()
            transaccionsql.Commit()
            transaccionsql.Dispose()
        Catch ex As Exception
            CommitSQL = False
        End Try
    End Function

    Public Function CommitSQL_RRHH() As Boolean
        CommitSQL_RRHH = True
        Try
            CerrarDataReaderRRHH()
            transaccionsql.Commit()
            transaccionsql.Dispose()
        Catch ex As Exception
            CommitSQL_RRHH = False
        End Try
    End Function

    Public Function CommitSQLFE() As Boolean
        CommitSQLFE = True
        Try
            CerrarDataReaderSQLFE()
            transaccionsql.Commit()
            transaccionsql.Dispose()
        Catch ex As Exception
            CommitSQLFE = False
        End Try
    End Function

    Public Function CommitMFG_Cueros() As Boolean
        CommitMFG_Cueros = True
        Try
            CerrarDataReaderMFG_Cueros()
            transaccionMFG_Cueros.Commit()
            transaccionMFG_Cueros.Dispose()
        Catch ex As Exception
            CommitMFG_Cueros = False
        End Try
    End Function

    Public Function CommitMFG_Ebfonse() As Boolean
        CommitMFG_Ebfonse = True
        Try
            CerrarDataReaderMFG_Ebfonse()
            transaccionMFG_Ebfonse.Commit()
            transaccionMFG_Ebfonse.Dispose()
        Catch ex As Exception
            CommitMFG_Ebfonse = False
        End Try
    End Function

#End Region


#Region "   RollBack Transaction"

    Public Function RollbackSQLFE() As Boolean
        RollbackSQLFE = True
        Try
            CerrarDataReaderSQLFE()
            transaccionsql.Rollback()
            transaccionsql.Dispose()
        Catch ex As Exception
            RollbackSQLFE = False
        End Try
    End Function

    Public Function RollbackSQL() As Boolean
        RollbackSQL = True
        Try
            CerrarDataReaderSQL()
            transaccionsql.Rollback()
            transaccionsql.Dispose()
        Catch ex As Exception
            RollbackSQL = False
        End Try
    End Function

    Public Function RollbackSQL_RRHH() As Boolean
        RollbackSQL_RRHH = True
        Try
            CerrarDataReaderRRHH()
            transaccionsql.Rollback()
            transaccionsql.Dispose()
        Catch ex As Exception
            RollbackSQL_RRHH = False
        End Try
    End Function

    Public Function RollbackMFG_Cueros() As Boolean
        RollbackMFG_Cueros = True
        Try

            CerrarDataReaderMFG_Cueros()
            transaccionMFG_Cueros.Rollback()
            transaccionMFG_Cueros.Dispose()
        Catch ex As Exception
            RollbackMFG_Cueros = False
        End Try
    End Function

    Public Function RollbackMFG_Ebfonse() As Boolean
        RollbackMFG_Ebfonse = True
        Try
            CerrarDataReaderMFG_Ebfonse()
            transaccionMFG_Ebfonse.Rollback()
            transaccionMFG_Ebfonse.Dispose()
        Catch ex As Exception
            RollbackMFG_Ebfonse = False
        End Try
    End Function

#End Region

    ' lo convertimos a singleton
    Private Sub New()
    End Sub

    Private Shared instancia As AdmConexiones = Nothing

    Public Shared Function getInstancia() As AdmConexiones
        If instancia Is Nothing Then
            instancia = New AdmConexiones()
        End If
        Return instancia
    End Function


End Class

