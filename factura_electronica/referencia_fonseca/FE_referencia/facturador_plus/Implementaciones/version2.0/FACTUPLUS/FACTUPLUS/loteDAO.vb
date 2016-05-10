Imports fonseca_libDatos

Public Class loteDAO

    'Public [error] As String
    'Public listalotes As New ArrayList
    'Public loteBuscado As lote
    Private _loteBuscado As lote
    Public ReadOnly Property LoteBuscado() As lote
        Get
            Return _loteBuscado
        End Get
    End Property

    Private _listalotes As ArrayList
    Public ReadOnly Property Listalotes() As ArrayList
        Get
            Return _listalotes
        End Get
    End Property

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Public Function obtenerLote(ByVal plote As Campo) As Boolean
        Dim Sql As String
        Dim un_lote As lote
        obtenerLote = False
        Log.Logger("info", "loteDAO - obtenerLote")
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Try
            If Not _listalotes Is Nothing Then
                _listalotes.Clear()
            End If


            ' obtenemos el detalle de la liuidacion 
            Sql = " select "
            Sql = Sql + " lote, "
            Sql = Sql + " fecha "
            Sql = Sql + " from lote "
            Sql = Sql + " where lote = " + SQLAdapter.formatValuetoSQL(plote)

            Log.Logger("debug", Sql)

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Exit Try
            End If

            _listalotes = New ArrayList

            If objAdmConexiones.rsSQLFE.HasRows Then
                Do While objAdmConexiones.rsSQLFE.Read
                    un_lote = New lote()
                    Me.rsto_lote(un_lote, objAdmConexiones.rsSQLFE)
                    _listalotes.Add(un_lote)
                    _loteBuscado = un_lote
                    obtenerLote = True
                Loop
            Else
                Me._error = "No existen registros para procesar en ct_articulos. "
                Log.Logger("error", Me._error)
                Exit Try
            End If

        Catch ex As Exception
            obtenerLote = False
            Me._error = "No existen registros para procesar en ct_articulos. " + ex.Message
            Log.Logger("error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try
    End Function



    Private Function rsto_lote(ByVal plote As lote, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        rsto_lote = True
        Log.Logger("info", "loteDAO - rsto_lote")
        Try
            plote.lote.Valor = rs("lote")
            plote.fecha.Valor = rs("fecha")

            plote.lote.Tipo = rs("lote").GetType
            plote.fecha.Tipo = rs("fecha").GetType
        Catch ex As Exception
            rsto_lote = False
            Me._error = ex.Message
            Log.Logger("error", ex.Message)
        End Try

    End Function


    Public Function obtenerproximoLote() As Campo
        Dim sql As String
        Dim un_campo As New Campo
        Log.Logger("info", "loteDAO - obtenerproximoLote")
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Try

            objAdmConexiones.CerrarDataReaderSQL()
            objAdmConexiones = AdmConexiones.getInstancia()

            sql = "select isnull(max(lote)+1,1)  as maxID from  lote "

            Log.Logger("debug", sql)

            objAdmConexiones.EjecutarQuerySQLFE(sql)
            If objAdmConexiones.rsSQLFE.HasRows Then
                obtenerproximoLote = un_campo
                While objAdmConexiones.rsSQLFE.Read()
                    un_campo.Tipo = objAdmConexiones.rsSQLFE("maxID").GetType
                    un_campo.Valor = objAdmConexiones.rsSQLFE("maxID").ToString
                    obtenerproximoLote = un_campo
                End While
            Else
                obtenerproximoLote = un_campo
            End If

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("error", ex.Message)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
            obtenerproximoLote = un_campo
        End Try
    End Function


    Public Function insertar(ByVal plote As lote) As Boolean

        Dim sql As String
        Dim un_campo As New Campo
        Log.Logger("info", "loteDAO - insertar")
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        insertar = False
        Try

            sql = " INSERT INTO dbo.lote ( "
            sql = sql + " 	lote	,"
            sql = sql + " 	fecha	"
            sql = sql + "   )  VALUES ( "
            sql = sql + SQLAdapter.formatValuetoSQL(plote.lote) + SQLAdapter.COMA
            sql = sql + SQLAdapter.formatValuetoSQL(plote.fecha)
            sql = sql + ")"

            Log.Logger("debug", sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Exit Try
            End If

            insertar = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try
    End Function





End Class
