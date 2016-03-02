Imports fonseca_libDatos


Public Class plantillas_excel_detalleDAO

    Private _listaDetalles As ArrayList
    Public ReadOnly Property ListaDetalles() As ArrayList
        Get
            Return _listaDetalles
        End Get
    End Property

    Private _listaDetallesDatos As ArrayList
    Public ReadOnly Property ListaDetallesDatos() As ArrayList
        Get
            Return _listaDetallesDatos
        End Get
    End Property

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property


    Public Function TraerDetallesPlantilla(ByVal pId As Campo) As Boolean
        TraerDetallesPlantilla = False
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Dim Sql As String

        Try

            Sql = "SELECT * FROM plantillas_excel_detalle "
            Sql = Sql + " WHERE id = " + pId.Valor.ToString + SQLAdapter.OPERADOR_AND
            Sql = Sql + " tipo_detalle = 'XLS_ENC'"
            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If Not objAdmConexiones.EjecutarQueryRRHH(Sql) Then
                Exit Function
            End If


            If objAdmConexiones.rsSQL.HasRows Then
                _listaDetalles = New ArrayList
                While objAdmConexiones.rsSQL.Read()
                    Dim objPlantillasDetalle As New plantillas_excel_detalle()

                    objPlantillasDetalle.Columna = Campo.ToCampo(objAdmConexiones.rsSQL("columna").ToString)
                    objPlantillasDetalle.Fila = Campo.ToCampo(objAdmConexiones.rsSQL("Fila").ToString)
                    objPlantillasDetalle.Id = Campo.ToCampo(objAdmConexiones.rsSQL("Id").ToString)
                    objPlantillasDetalle.Nombre = Campo.ToCampo(objAdmConexiones.rsSQL("Nombre").ToString)
                    objPlantillasDetalle.Tipo_detalle = Campo.ToCampo(objAdmConexiones.rsSQL("Tipo_detalle").ToString)
                    objPlantillasDetalle.Valor = Campo.ToCampo(objAdmConexiones.rsSQL("Valor").ToString)

                    _listaDetalles.Add(objPlantillasDetalle)
                End While
                TraerDetallesPlantilla = True
            Else
                Me._error = "No se pudo obtener datos de encabezado para esa planilla excel"
            End If
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderRRHH()
            objAdmConexiones = Nothing
        End Try

    End Function


    Public Function TraerDetallesPlantillaDatos(ByVal pId As Campo) As Boolean
        TraerDetallesPlantillaDatos = False
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Dim Sql As String

        Try

            Sql = "SELECT * FROM plantillas_excel_detalle "
            Sql = Sql + " WHERE id = " + pId.Valor.ToString + SQLAdapter.OPERADOR_AND
            Sql = Sql + " tipo_detalle = 'XLS_DATO'"
            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If Not objAdmConexiones.EjecutarQueryRRHH(Sql) Then
                Exit Function
            End If


            If objAdmConexiones.rsSQL.HasRows Then
                _listaDetallesDatos = New ArrayList
                While objAdmConexiones.rsSQL.Read()
                    Dim objPlantillasDetalle As New plantillas_excel_detalle()

                    objPlantillasDetalle.Columna = Campo.ToCampo(objAdmConexiones.rsSQL("columna").ToString)
                    objPlantillasDetalle.Fila = Campo.ToCampo(objAdmConexiones.rsSQL("Fila").ToString)
                    objPlantillasDetalle.Id = Campo.ToCampo(objAdmConexiones.rsSQL("Id").ToString)
                    objPlantillasDetalle.Nombre = Campo.ToCampo(objAdmConexiones.rsSQL("Nombre").ToString)
                    objPlantillasDetalle.Tipo_detalle = Campo.ToCampo(objAdmConexiones.rsSQL("Tipo_detalle").ToString)
                    objPlantillasDetalle.Valor = Campo.ToCampo(objAdmConexiones.rsSQL("Valor").ToString)
                    objPlantillasDetalle.TipoDato = Campo.ToCampo(objAdmConexiones.rsSQL("tipo_dato").ToString)

                    _listaDetallesDatos.Add(objPlantillasDetalle)
                End While
                TraerDetallesPlantillaDatos = True
            End If
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderRRHH()
            objAdmConexiones = Nothing
        End Try

    End Function
End Class
