Imports System
Imports System.Data.SqlClient
Imports System.Data.Odbc


Public Class AdmConexiones_new

    Public Shared connSQL As Data.SqlClient.SqlConnection
    Public connMFG_Cueros As Data.Odbc.OdbcConnection
    Public connMFG_Ebfonse As Data.Odbc.OdbcConnection
    Public Shared [error] As String

    Private Shared oCmdSQL As Data.SqlClient.SqlCommand
    Public Shared rsSQL As Data.SqlClient.SqlDataReader

    Private oCmdMFG_Cueros As System.Data.Odbc.OdbcCommand
    Private oCmdMFG_Ebfonse As System.Data.Odbc.OdbcCommand
    Public rsMFG_Cueros As Data.Odbc.OdbcDataReader
    Public rsMFG_Ebfonse As Data.Odbc.OdbcDataReader

    Private Shared transaccionsql As SqlClient.SqlTransaction
    Private transaccionMFG_Cueros As Data.Odbc.OdbcTransaction
    Private transaccionMFG_Ebfonse As Data.Odbc.OdbcTransaction
    Public Shared nombre_SQLDatabase As String

    Public Shared Function abrirConexionMagmaSQL() As Boolean

        If Not (connSQL Is Nothing) Then
            Select Case connSQL.State
                Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                    abrirConexionMagmaSQL = True
                    Exit Function
            End Select
        End If

        connSQL = New Data.SqlClient.SqlConnection



        Dim connectionString As String
        Dim usuario_magma As String
        Dim clave_magma As String
        Dim clave As String

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("MAGMA_ERP").ConnectionString
        usuario_magma = Configuration.ConfigurationManager.AppSettings("usuario_Magma_ERP")
        clave_magma = Configuration.ConfigurationManager.AppSettings("clave_MAGMA_ERP")

        ' ahora se desencripta la clave
        clave = Encriptado.DecryptText(clave_magma, usuario_magma)

        connSQL.ConnectionString = connectionString + ";Uid=" + usuario_magma + " ;Pwd=" + clave

        Try
            connSQL.Open()
            nombre_SQLDatabase = connSQL.Database
            abrirConexionMagmaSQL = True
        Catch ex As Exception
            abrirConexionMagmaSQL = False
            [error] = ex.Message
        End Try

    End Function


    Public Function abrirConexionMFG_Cueros() As Boolean

        If Not (connMFG_Cueros Is Nothing) Then
            Select Case connMFG_Cueros.State
            Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                abrirConexionMFG_Cueros = True
                Exit Function
            End Select
        End If


        connMFG_Cueros = New Data.Odbc.OdbcConnection()


        Dim connectionString As String
        Dim usuario_MFG_Cueros As String
        Dim clave_MFG_Cueros As String
        Dim clave As String

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("CUEROS_BD").ConnectionString
        usuario_MFG_Cueros = Configuration.ConfigurationManager.AppSettings("usuario_Cueros_BD")
        clave_MFG_Cueros = Configuration.ConfigurationManager.AppSettings("clave_Cueros_BD")

        ' ahora se desencripta la clave
        clave = Encriptado.DecryptText(clave_MFG_Cueros, usuario_MFG_Cueros)

        connMFG_Cueros.ConnectionString = connectionString + ";Uid=" + usuario_MFG_Cueros + " ;Pwd=" + clave


        Try
            connMFG_Cueros.Open()
            abrirConexionMFG_Cueros = True
            [error] = Nothing
        Catch ex As Exception
            abrirConexionMFG_Cueros = False
            [error] = ex.Message
        End Try

    End Function



    Public Function abrirConexionMFG_Ebfonse() As Boolean


        If Not (connMFG_Ebfonse Is Nothing) Then
            Select Case connMFG_Ebfonse.State
            Case ConnectionState.Connecting, ConnectionState.Executing, ConnectionState.Fetching, ConnectionState.Open
                abrirConexionMFG_Ebfonse = True
                Exit Function
            End Select
        End If

        connMFG_Ebfonse = New Data.Odbc.OdbcConnection()


        Dim connectionString As String
        Dim usuario_MFG_Ebfonse As String
        Dim clave_MFG_Ebfonse As String
        Dim clave As String

        connectionString = Configuration.ConfigurationManager.ConnectionStrings("EBFONSE_BD").ConnectionString
        usuario_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("usuario_MFG_Ebfonse")
        clave_MFG_Ebfonse = Configuration.ConfigurationManager.AppSettings("clave_MFG_Ebfonse")

        ' ahora se desencripta la clave
        clave = Encriptado.DecryptText(clave_MFG_Ebfonse, usuario_MFG_Ebfonse)

        connMFG_Ebfonse.ConnectionString = connectionString + ";Uid=" + usuario_MFG_Ebfonse + " ;Pwd=" + clave




        Try
            connMFG_Ebfonse.Open()
            abrirConexionMFG_Ebfonse = True
        Catch ex As Exception
            abrirConexionMFG_Ebfonse = False
            [error] = ex.Message
        End Try

    End Function



    Public Function ejecutarQueryMFG_Cueros(ByVal pSQL As String) As Boolean
    Dim unOdbcParametro As New OdbcParameter

        cerrarDataReaderMFG_Cueros()
        abrirConexionMFG_Cueros()

        oCmdMFG_Cueros = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Cueros.Connection = connMFG_Cueros
        oCmdMFG_Cueros.CommandType = System.Data.CommandType.Text
        oCmdMFG_Cueros.CommandText = pSQL
        oCmdMFG_Cueros.Transaction = transaccionMFG_Cueros

        Try
            rsMFG_Cueros = oCmdMFG_Cueros.ExecuteReader()
            ejecutarQueryMFG_Cueros = True
            [error] = Nothing
        Catch ex As Exception
            ejecutarQueryMFG_Cueros = False
            [error] = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()

    End Function



    Public Function ejecutarQueryMFG_Ebfonse(ByVal pSQL As String) As Boolean
    Dim unOdbcParametro As New OdbcParameter

        cerrarDataReaderMFG_Ebfonse()
        abrirConexionMFG_Ebfonse()

        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Ebfonse
        oCmdMFG_Ebfonse.CommandType = System.Data.CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSQL
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse

        Try
            rsMFG_Ebfonse = oCmdMFG_Ebfonse.ExecuteReader()
            ejecutarQueryMFG_Ebfonse = True
        Catch ex As Exception
            ejecutarQueryMFG_Ebfonse = False
            [error] = ex.Message
        End Try

        oCmdMFG_Ebfonse.Dispose()

    End Function


    Public Shared Function ejecutarQuerySQL(ByVal pSQL As String) As Boolean

        cerrarDataReaderSQL()

        abrirConexionMagmaSQL()

        oCmdSQL = New SqlCommand()
        oCmdSQL.Connection = connSQL
        oCmdSQL.CommandType = System.Data.CommandType.Text
        oCmdSQL.CommandText = pSQL
        oCmdSQL.Transaction = transaccionsql

        Try
            rsSQL = oCmdSQL.ExecuteReader()
            ejecutarQuerySQL = True
        Catch ex As Exception
            ejecutarQuerySQL = False
            [error] = ex.Message
        End Try

        oCmdSQL.Dispose()

    End Function




    Public Function ejecutarNonQueryMFG_Cueros(ByVal pSQL As String) As Boolean

        cerrarDataReaderMFG_Cueros()
        abrirConexionMFG_Cueros()


        oCmdMFG_Cueros = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Cueros.Connection = connMFG_Cueros
        oCmdMFG_Cueros.CommandType = System.Data.CommandType.Text
        oCmdMFG_Cueros.CommandText = pSQL
        oCmdMFG_Cueros.Transaction = transaccionMFG_Cueros


        Try
            oCmdMFG_Cueros.ExecuteNonQuery()
            ejecutarNonQueryMFG_Cueros = True
        Catch ex As Exception
            ejecutarNonQueryMFG_Cueros = False
            [error] = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()

    End Function



Public Function ejecutarNonQueryMFG_Ebfonse(ByVal pSQL As String) As Boolean

        cerrarDataReaderMFG_Ebfonse()
        abrirConexionMFG_Ebfonse()


        oCmdMFG_Ebfonse = New System.Data.Odbc.OdbcCommand
        oCmdMFG_Ebfonse.Connection = connMFG_Cueros
        oCmdMFG_Ebfonse.CommandType = System.Data.CommandType.Text
        oCmdMFG_Ebfonse.CommandText = pSQL
        oCmdMFG_Ebfonse.Transaction = transaccionMFG_Ebfonse


        Try
            oCmdMFG_Ebfonse.ExecuteNonQuery()
            ejecutarNonQueryMFG_Ebfonse = True
        Catch ex As Exception
            ejecutarNonQueryMFG_Ebfonse = False
            [error] = ex.Message
        End Try

        oCmdMFG_Cueros.Dispose()

    End Function

    Public Shared Function ejecutarNonQuerySQL(ByVal pSQL As String) As Boolean

        cerrarDataReaderSQL()
        abrirConexionMagmaSQL()

        oCmdSQL = New SqlCommand()
        oCmdSQL.Connection = connSQL
        oCmdSQL.CommandType = System.Data.CommandType.Text
        oCmdSQL.CommandText = pSQL
        oCmdSQL.Transaction = transaccionsql

        Try
            oCmdSQL.ExecuteNonQuery()
            ejecutarNonQuerySQL = True
        Catch ex As Exception
            ejecutarNonQuerySQL = False
            [error] = ex.Message
        End Try

        oCmdSQL.Dispose()

    End Function

    Public Sub cerrarConexionMFG_Cueros()

        Try
            connMFG_Cueros.Dispose()
            connMFG_Cueros.Close()
        Catch ex As Exception
            Console.Write("Error al cerrar la conexion MFG_Cueros")
        End Try

    End Sub

   Public Sub cerrarconexionMFG_CuerosODBC()

       Try
            OdbcConnection.ReleaseObjectPool()
            GC.Collect()
        Catch ex As Exception
            Console.Write("Error al cerrar la conexion ODBC")
        End Try

   End Sub

Public Sub cerrarconexionMFG_EbfonseODBC()

       Try
            'connMFG_Ebfonse.ReleaseObjectPool()
            connMFG_Ebfonse = Nothing
            GC.Collect()
        Catch ex As Exception
            Console.Write("Error al cerrar la conexion ODBC")
        End Try

   End Sub


    Public Sub cerrarConexionMFG_Ebfonse()

        Try
            connMFG_Ebfonse.Dispose()
            connMFG_Ebfonse.Close()
        Catch ex As Exception
            Console.Write("Error al cerrar la conexion MFG_Cueros")
        End Try

    End Sub


    Public Shared Sub cerrarDataReaderSQL()

        Try
            If Not rsSQL.IsClosed Then
                rsSQL.Close()
            End If
        Catch ex As Exception
            Console.Write("Error al cerrar el data reader de SQL")
        End Try

    End Sub


    Public Sub cerrarDataReaderMFG_Cueros()

        Try
            If Not rsMFG_Cueros.IsClosed Then
                rsMFG_Cueros.Close()
            End If
        Catch ex As Exception
            Console.Write("Error al cerrar el data reader de SQL")
        End Try

    End Sub


    Public Sub cerrarDataReaderMFG_Ebfonse()

        Try
            If Not rsMFG_Ebfonse.IsClosed Then
                rsMFG_Ebfonse.Close()
            End If
        Catch ex As Exception
            Console.Write("Error al cerrar el data reader de SQL")
        End Try

    End Sub

    Public Shared Function BeginTransSQL() As Boolean

        cerrarDataReaderSQL()
        transaccionsql = connSQL.BeginTransaction()

    End Function


    Public Function BeginTransMFG_Cueros() As Boolean

        cerrarDataReaderMFG_Cueros()
        transaccionMFG_Cueros = connMFG_Cueros.BeginTransaction


    End Function


    Public Function BeginTransMFG_Ebfonse() As Boolean

        cerrarDataReaderMFG_Ebfonse()
        transaccionMFG_Ebfonse = connMFG_Cueros.BeginTransaction

    End Function

    Public Shared Function CommitSQL() As Boolean


        cerrarDataReaderSQL()
        transaccionsql.Commit()
        transaccionsql.Dispose()

    End Function


    Public Function CommitMFG_Cueros() As Boolean

        cerrarDataReaderMFG_Cueros()
        transaccionMFG_Cueros.Commit()
        transaccionMFG_Cueros.Dispose()

    End Function


    Public Function CommitMFG_Ebfonse() As Boolean

        cerrarDataReaderMFG_Ebfonse()
        transaccionMFG_Ebfonse.Commit()
        transaccionMFG_Ebfonse.Dispose()

    End Function


    Public Shared Function RollbackSQL() As Boolean

        cerrarDataReaderSQL()
        transaccionsql.Rollback()
        transaccionsql.Dispose()

    End Function


    Public Function RollbackMFG_Cueros() As Boolean

        cerrarDataReaderMFG_Cueros()
        transaccionMFG_Cueros.Rollback()
        transaccionMFG_Cueros.Dispose()

    End Function


    Public Function RollbackMFG_Ebfonse() As Boolean

        cerrarDataReaderMFG_Ebfonse()
        transaccionMFG_Ebfonse.Rollback()
        transaccionMFG_Ebfonse.Dispose()

    End Function

End Class

