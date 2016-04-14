Imports fonseca_libDatos

Public Class plantillas_excelDAO


    Private _objPlantilla As plantillas_excel
    Public ReadOnly Property ObjPlantilla() As plantillas_excel
        Get
            Return _objPlantilla
        End Get
    End Property

    Private _columnas As Integer
    Public ReadOnly Property Columnas() As Integer
        Get
            Return _columnas
        End Get
    End Property

    Private _filas As Integer
    Public ReadOnly Property Filas() As Integer
        Get
            Return _filas
        End Get
    End Property

    Private _error As String
    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property


    Public Function TraerCantidadColumnas(ByVal pNombreArchivo As String, ByVal pNombreHoja As String) As Boolean
        TraerCantidadColumnas = False
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Try
            Sql = "SELECT columnas FROM plantillas_excel WHERE "
            Sql = Sql + " nombre = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreArchivo)) + SQLAdapter.OPERADOR_AND
            Sql = Sql + " hoja_xls = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreHoja))
            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If Not objAdmConexiones.EjecutarScalarRRHH(Sql) Then
                Exit Function
            End If

            If objAdmConexiones.RsSQL_Scalar Is Nothing Then
                Exit Function
            End If

            _columnas = CType(objAdmConexiones.RsSQL_Scalar, Integer)

            TraerCantidadColumnas = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderRRHH()
            objAdmConexiones = Nothing
        End Try
    End Function

    Public Function TraerCantidadFilas(ByVal pNombreArchivo As String, ByVal pNombreHoja As String) As Boolean
        TraerCantidadFilas = False
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Try
            Sql = "SELECT filas FROM plantillas_excel WHERE "
            Sql = Sql + " nombre = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreArchivo)) + SQLAdapter.OPERADOR_AND
            Sql = Sql + " hoja_xls = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreHoja))
            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If Not objAdmConexiones.EjecutarScalarRRHH(Sql) Then
                Exit Function
            End If

            If objAdmConexiones.RsSQL_Scalar Is Nothing Then
                Exit Function
            End If

            _filas = CType(objAdmConexiones.RsSQL_Scalar, Integer)

            TraerCantidadFilas = True
        Catch ex As Exception
            Me._error = ex.Message
            Log.Logger("Error", Me._error)
        Finally
            objAdmConexiones.CerrarDataReaderRRHH()
            objAdmConexiones = Nothing
        End Try
    End Function


    Public Function TraerPlanillaExcel(ByVal pNombreArchivo As String, ByVal pNombreHoja As String) As Boolean
        TraerPlanillaExcel = False
        Dim Sql As String
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Try
            Sql = "SELECT * FROM plantillas_excel "
            Sql = Sql + " WHERE nombre = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreArchivo)) + SQLAdapter.OPERADOR_AND
            Sql = Sql + " hoja_xls = " + SQLAdapter.formatValuetoSQL(Campo.ToCampo(pNombreHoja))

            objAdmConexiones.AbrirConexionRRHH_SQL()
            Log.Logger("Debug", Sql)
            If Not objAdmConexiones.EjecutarQueryRRHH(Sql) Then
                Exit Function
            End If

            If objAdmConexiones.rsSQL.HasRows Then
                With objAdmConexiones

                    While .rsSQL.Read()
                        _objPlantilla = New plantillas_excel(Campo.ToCampo(.rsSQL("id").ToString), Campo.ToCampo(.rsSQL("aplicacion").ToString), _
                                                          Campo.ToCampo(.rsSQL("nombre").ToString), Campo.ToCampo(.rsSQL("hoja_xls").ToString), _
                                                          Campo.ToCampo(.rsSQL("ruta_archivo").ToString), Campo.ToCampo(.rsSQL("fila_datos").ToString), _
                                                          Campo.ToCampo(.rsSQL("columnas").ToString), Campo.ToCampo(.rsSQL("filas").ToString), _
                                                          Campo.ToCampo(.rsSQL("base_destino").ToString), Campo.ToCampo(.rsSQL("procedimiento").ToString), _
                                                          Campo.ToCampo(.rsSQL("carp_archivo_tmp").ToString), Campo.ToCampo(.rsSQL("separador").ToString))

                        Exit While
                    End While
                End With
                TraerPlanillaExcel = True
            Else
                Me._error = "No existe una definición en la base de datos que corresponda con el archivo y/o la hoja a importar. Consulte con el proveedor del sistema."
                TraerPlanillaExcel = False
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
