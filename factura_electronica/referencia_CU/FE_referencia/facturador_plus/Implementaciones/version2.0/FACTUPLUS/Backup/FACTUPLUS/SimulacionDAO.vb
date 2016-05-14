Imports fonseca_libDatos

Public Class SimulacionDAO

    Private _simulacionBuscada As Simulacion
    Private _listasimulaciones As ArrayList
    Private _error As String

    Public ReadOnly Property SimulacionBuscada() As Simulacion
        Get
            Return _simulacionBuscada
        End Get
    End Property
    Public ReadOnly Property Listasimulaciones() As ArrayList
        Get
            Return _listasimulaciones
        End Get
    End Property
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Public Function obtenerSimulacion(ByVal psimulacion As Campo) As Boolean
        Log.Logger(tipoLogging.Info, "SimulacionDAO - obtenerSimulacion")
        obtenerSimulacion = True

        Dim Sql As String
        Dim una_simulacion As Simulacion
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Me._error = String.Empty

        Try

            If Not _listasimulaciones Is Nothing Then
                _listasimulaciones.Clear()
            End If

            ' obtenemos el detalle de la liuidacion 
            Sql = " SELECT * FROM Simulacion "
            Log.Logger(tipoLogging.Debug, Sql)

            If Not objAdmConexiones.EjecutarQuerySQLFE(Sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
                Exit Function
            End If

            If objAdmConexiones.rsSQLFE.HasRows Then

                _listasimulaciones = New ArrayList

                Do While objAdmConexiones.rsSQLFE.Read
                    una_simulacion = New Simulacion()
                    Me.rsto_simulacion(una_simulacion, objAdmConexiones.rsSQLFE)
                    _listasimulaciones.Add(una_simulacion)
                    _simulacionBuscada = una_simulacion
                Loop
            Else
                Me._error = "No existen registros para procesar en Simulación. "
                Log.Logger(tipoLogging.Error, Me._error)
                obtenerSimulacion = False
                Exit Function
            End If


        Catch ex As Exception
            Me._error = "No existen registros para procesar en Simulación. " + ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
            obtenerSimulacion = False
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try

    End Function



    Private Function rsto_simulacion(ByVal psimulacion As Simulacion, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean
        Log.Logger(tipoLogging.Info, "SimulacionDAO - rsto_simulacion")
        rsto_simulacion = True

        Me._error = String.Empty
        Try
            psimulacion.nro_simu.Valor = rs("nro_simu")
            psimulacion.nro_simu.Tipo = rs("nro_simu").GetType
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
            rsto_simulacion = False
        End Try

    End Function


    Public Function obtenerproximaSimulacion() As Campo
        Log.Logger(tipoLogging.Info, "SimulacionDAO - obtenerproximaSimulacion")

        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Me._error = String.Empty

        Try

            sql = " SELECT * FROM simulacion "
            Log.Logger(tipoLogging.Debug, sql)

            objAdmConexiones.EjecutarQuerySQLFE(sql)

            If objAdmConexiones.rsSQLFE.HasRows Then
                While objAdmConexiones.rsSQLFE.Read()
                    un_campo.Tipo = objAdmConexiones.rsSQLFE("nro_simu").GetType
                    un_campo.Valor = objAdmConexiones.rsSQLFE("nro_simu")
                    obtenerproximaSimulacion = un_campo
                    Exit Try
                End While
            Else
                obtenerproximaSimulacion = un_campo
            End If

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
            obtenerproximaSimulacion = un_campo
        End Try
    End Function


    Public Function insertarSimulacion(ByVal psimulacion As Simulacion) As Boolean
        Log.Logger(tipoLogging.Info, "SimulacionDAO - insertarSimulacion")
        insertarSimulacion = False
        Dim sql As String
        Dim un_campo As New Campo

        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Me._error = String.Empty

        Try
            sql = " INSERT INTO dbo.simulacion ( "
            sql = sql + " 	nro_simu	,"
            sql = sql + "   )  VALUES ( "
            sql = sql + SQLAdapter.formatValuetoSQL(psimulacion.nro_simu) + SQLAdapter.COMA
            sql = sql + ")"

            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Exit Try
            End If
            insertarSimulacion = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try

    End Function


    Public Function actualizarSimulacion(ByVal una_simulacion As Simulacion) As Boolean
        Log.Logger(tipoLogging.Info, "SimulacionDAO - actualizarSimulacion")
        actualizarSimulacion = False

        Dim sql As String
        Dim un_campo As New Campo
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        Me._error = String.Empty
        Try

            una_simulacion.nro_simu.Valor = una_simulacion.nro_simu.Valor + 1

            sql = " UPDATE dbo.simulacion SET "
            sql = sql + " nro_simu = " + SQLAdapter.formatValuetoSQL(una_simulacion.nro_simu)

            Log.Logger(tipoLogging.Debug, sql)

            If Not objAdmConexiones.ejecutarNonQuerySQLFE(sql) Then
                Me._error = objAdmConexiones.Error
                Log.Logger(tipoLogging.Error, Me._error)
            End If

            actualizarSimulacion = True

        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger(tipoLogging.Error, Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderSQLFE()
        End Try

    End Function

End Class
