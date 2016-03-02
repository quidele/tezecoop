
Option Strict Off
'Imports fonseca_libDatos
Imports Excel
Imports System.Data.OleDb
Imports System.IO
Imports fonseca_libDatos
Imports System.Runtime.InteropServices

Public Class admPlanillasExcel
    Implements IDisposable

    Private obj_Excel As Object
    Private obj_Workbook As Object
    Private obj_Worksheet As Object

    Private _error As String

    Private objPlantillas_excel As plantillas_excel
    Private objPlantillas_excelDAO As plantillas_excelDAO
    Private objPlantillas_excel_detalleDAO As plantillas_excel_detalleDAO

    Private _rutaExportado As String
    Private _nombreArchivo As String
    Private _nombreHoja As String
    Private _rutaArchivo As String
    Private _ambiente As String
    Private _version As String
    Private _ejercicio As String
    Private _usuario_mod As String




    Private _listaErrores As ArrayList
    Public ReadOnly Property ListaErrores() As ArrayList
        Get
            Return _listaErrores
        End Get
    End Property

    Public ReadOnly Property RutaExportado() As String
        Get
            Return _rutaExportado
        End Get
    End Property

    Public ReadOnly Property [Error]() As String
        Get
            Return _error
        End Get
    End Property

    Public ReadOnly Property NombreHoja() As String
        Get
            Return _nombreHoja
        End Get
    End Property


    Public Overrides Function ToString() As String
        Return _nombreHoja
    End Function

    Public Sub Dispose() Implements IDisposable.Dispose
        Try

            If Not obj_Excel Is Nothing Then
                obj_Excel.Quit()
            End If

            obj_Excel = Nothing
            obj_Worksheet = Nothing
            GC.Collect()
            GC.Collect(1, GCCollectionMode.Forced)
        Catch ex As NullReferenceException

        Catch ex As COMException
            Log.Logger("WARN", ex.Message + ". COMException.")
        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    ''' <summary>
    ''' Compara la planilla seleccionada con su definicion en la base de datos
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub CompararPlanillaDefinicion()

        Dim _listaDetalles As ArrayList

        Try
            'Traemos la planilla excel
            If objPlantillas_excelDAO.TraerPlanillaExcel(_nombreArchivo, _nombreHoja) Then

                objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla()
                'Con el ID traemos los detalles
                If objPlantillas_excel_detalleDAO.TraerDetallesPlantilla(objPlantillas_excel.Id) Then
                    'Traemos la lista con los objetos detalles
                    _listaDetalles = objPlantillas_excel_detalleDAO.ListaDetalles

                    If Not obj_Worksheet Is Nothing Then
                        _listaErrores = New ArrayList
                        For i As Integer = 0 To _listaDetalles.Count - 1
                            Dim objDet As New plantillas_excel_detalle()
                            Dim objDet2 As New plantillas_excel_detalle()

                            'variable i - para cada columna
                            objDet = _listaDetalles.Item(i)
                            'primer columna con datos -- valor fijo para el caso de errores
                            Dim menorCol As Integer = 10000
                            For Each unDetalle As plantillas_excel_detalle In _listaDetalles
                                If unDetalle.Tipo_detalle.Valor.ToString = "XLS_ENC" Then
                                    If CType(unDetalle.Columna.Valor.ToString, Integer) < menorCol Then
                                        menorCol = CType(unDetalle.Columna.Valor.ToString, Integer)
                                    End If
                                End If
                            Next

                            objDet2 = _listaDetalles.Item(menorCol)


                            Dim fila As Integer = Integer.Parse(objDet.Fila.Valor)
                            Dim column As Integer = Integer.Parse(objDet.Columna.Valor)
                            'If objDet.Columna.Valor = 31 Then
                            '    Console.Write("")
                            'End If
                            'Comparamos la celda con la que esta definida. Si no se encuentra pasamos las coordenadas a la lista de errores
                            If obj_Worksheet.cells(fila, column).value Is Nothing Then
                                Throw New Exception("Fila " + fila.ToString + " y columna " + column.ToString + " está vacia. Revise la definición de la planilla. ")
                            End If
                            If Not obj_Worksheet.cells(fila, column).value.ToString = objDet.Nombre.Valor.ToString Then
                                'A las filas le restamos 1 y a las columnas les restamos la primer columna con datos
                                _listaErrores.Add(New Coordenadas(fila - 1, objDet.Columna.Valor - menorCol, objDet.Nombre.Valor))
                                '_listaErrores.Add(New Coordenadas(fila - 1, objDet.Columna.Valor, objDet.Nombre.Valor))
                            End If
                        Next
                    End If
                End If
            Else
                Throw New Exception(objPlantillas_excelDAO.Error)
            End If

        Catch ex As NullReferenceException
            Throw New Exception("Hubo un problema con el archivo que se desea importar. " + ex.Message)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    ''' <summary>
    ''' Compara la planilla seleccionada con su definicion en la base de datos
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub CompararPlanillaDefinicion_Multi()

        Dim _listaDetalles As ArrayList

        Try
            'Traemos la planilla excel
            If objPlantillas_excelDAO.TraerPlanillaExcel(_nombreArchivo, _nombreHoja) Then

                objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla()
                'Con el ID traemos los detalles
                If objPlantillas_excel_detalleDAO.TraerDetallesPlantilla(objPlantillas_excel.Id) Then
                    'Traemos la lista con los objetos detalles
                    _listaDetalles = objPlantillas_excel_detalleDAO.ListaDetalles

                    If Not obj_Worksheet Is Nothing Then
                        _listaErrores = New ArrayList
                        For i As Integer = 0 To _listaDetalles.Count - 1
                            Dim objDet As New plantillas_excel_detalle()
                            Dim objDet2 As New plantillas_excel_detalle()

                            'variable i - para cada columna
                            objDet = _listaDetalles.Item(i)
                            'primer columna con datos -- valor fijo para el caso de errores
                            objDet2 = _listaDetalles.Item(0)


                            Dim fila As Integer = Integer.Parse(objDet.Fila.Valor)
                            Dim column As Integer = Integer.Parse(objDet.Columna.Valor)
                            'If objDet.Columna.Valor = 31 Then
                            '    Console.Write("")
                            'End If
                            'Comparamos la celda con la que esta definida. Si no se encuentra pasamos las coordenadas a la lista de errores
                            If Not obj_Worksheet.cells(fila, column).value.ToString = objDet.Nombre.Valor.ToString Then

                                _listaErrores.Add(New Coordenadas(fila - 1, objDet.Columna.Valor, objDet.Nombre.Valor))
                            End If
                        Next
                    End If
                End If
            Else
                Throw New Exception(objPlantillas_excelDAO.Error)
            End If

        Catch ex As NullReferenceException
            Throw New Exception("Hubo un problema con el archivo que se desea importar. " + ex.Message)
        Catch ex As Exception
            Throw ex
        End Try
    End Sub


    Public Shared Function ExportarAExcel(ByVal objDT As System.Data.DataTable, ByVal pRutaArchivo As String) As Boolean
        Dim horaComienzo As DateTime = Date.Now
        Dim Excel As Object = CreateObject("Excel.Application")
        Dim strFilename As String = ""
        Dim intCol, intRow As Integer
        Dim strPath As String = pRutaArchivo



        Try
            If Excel Is Nothing Then
                ExportarAExcel = False
                Throw New Exception("Esta operación requiere que MS Excel sea instalado previamente.")
            End If

            With Excel
                .SheetsInNewWorkbook = 1
                .Workbooks.Add()
                .Worksheets(1).Select()

                '.cells(1, 1).value = "Heading" 'Heading of the excel file
                '.cells(1, 1).EntireRow.Font.Bold = True


                'Dim intI As Integer = 1
                Dim intI As Integer = 1
                For intCol = 0 To objDT.Columns.Count - 1
                    '.cells(2, intI).value = objDT.Columns(intCol).ColumnName
                    '.cells(2, intI).EntireRow.Font.Bold = True
                    .cells(1, intI).value = objDT.Columns(intCol).ColumnName
                    .cells(1, intI).EntireRow.Font.Bold = True
                    intI += 1
                Next

                'intI = 3
                intI = 2
                Dim porc As Integer = 75
                Dim prom As Integer = objDT.Rows.Count / 20

                Dim intK As Integer = 1
                For intCol = 0 To objDT.Columns.Count - 1
                    'intI = 3
                    intI = 2
                    For intRow = 0 To objDT.Rows.Count - 1
                        .Cells(intI, intK).Value = objDT.Rows(intRow).ItemArray(intCol)
                        intI += 1

                        If intRow Mod prom = 0 And porc < 100 Then
                            porc = porc + 1

                        End If
                    Next
                    intK += 1

                Next

                If Mid$(strPath, strPath.Length, 1) <> "\" Then
                    strPath = strPath & "\"
                End If
                strFilename = strPath '& "Excel.xls"

                If strFilename.EndsWith("\") Then
                    strFilename = strFilename.Remove(strFilename.Length - 1)
                End If

                .ActiveCell.Worksheet.SaveAs(strFilename)
            End With

            Excel.QUIT()
            Excel = Nothing
            System.Runtime.InteropServices.Marshal.ReleaseComObject(Excel)
            System.GC.Collect(3, GCCollectionMode.Forced)

        Catch ex As Exception
            Throw ex
        End Try

        ' strFilename = strFilename.Replace("F:", "\\192.1.1.205")
        ' strFilename = strFilename.Replace("f:", "\\192.1.1.205")

        'Dim inicioProceso As New ProcessStartInfo
        'inicioProceso.FileName = "Excel"
        'inicioProceso.Arguments = strFilename
        'inicioProceso.WindowStyle = ProcessWindowStyle.Maximized


        'Dim myProcess As Process = Process.Start(inicioProceso)


        'The excel is created and opened for insert value. We most close this excel using this system
        'Dim pro() As Process = System.Diagnostics.Process.GetProcessesByName("EXCEL")
        'For Each i As Process In pro
        '    If i.StartTime.ToString = horaComienzo.ToString Then
        '        i.Kill()
        '    End If

        'Next
    End Function



    Public Function TraerDatosTabla() As System.Data.DataTable

        Dim _listaDetallesDatos As ArrayList = Nothing
        Dim dtDatos As New System.Data.DataTable
        Dim pFilas As Integer
        Dim pColumnas As Integer
        Dim huboError As Boolean = False


        Try

            If objPlantillas_excelDAO.TraerPlanillaExcel(_nombreArchivo, _nombreHoja) Then
                objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla()


                If objPlantillas_excel_detalleDAO.TraerDetallesPlantillaDatos(objPlantillas_excel.Id) Then
                    _listaDetallesDatos = objPlantillas_excel_detalleDAO.ListaDetallesDatos
                End If


                pFilas = objPlantillas_excel.Filas.Valor
                pColumnas = objPlantillas_excel.Columas.Valor

                'Creamos un dataTable
                dtDatos = New System.Data.DataTable

                'Creamos una columna por cada columna que hay declarada en la base de datos
                For i As Integer = 1 To pColumnas
                    Dim columna As New DataColumn(i.ToString)
                    dtDatos.Columns.Add(columna)
                Next

                'Por cada fila declarada en la base de datos
                For i As Integer = objPlantillas_excel.Fila_datos.Valor To pFilas - 1
                    'Creamos una fila de nuestro dataTable
                    Dim fila As DataRow = dtDatos.NewRow()
                    'Ponemos nuestro contador en 0
                    Dim k As Integer = 0

                    _error = ""
                    'Cada item es una columna definida en la base de datos
                    For Each item As plantillas_excel_detalle In _listaDetallesDatos

                        If ValidarValoresDefinidos(item, obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value) Then
                            'A la columna K de nuestro dt le asignamos el valor de las coordenadas definidas en la BD
                            fila(k) = obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value
                            If IsDBNull(fila(k)) Then
                                fila(k) = ""
                            End If
                        Else
                            huboError = True
                            _error = _error + obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value.ToString + " no es del tipo " + item.TipoDato.Valor.ToString + vbCrLf
                            'MessageBox.Show(obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value.ToString + " no es del tipo " + item.TipoDato.Valor.ToString)
                        End If


                        If huboError = True Then
                            Throw New Exception(_error)
                        End If

                        'A la columna K de nuestro dt le asignamos el valor de las coordenadas definidas en la BD
                        'fila(k) = obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value
                        'Si llegamos al maximo de columnas reseteamos el contador y continuamos con el for
                        If k = pColumnas - 1 Then
                            k = 0
                            Continue For
                        End If
                        'Suma 1 al contador de vueltas
                        k += 1

                    Next
                    'Agregamos la fila
                    dtDatos.Rows.Add(fila)
                Next

            End If
            Return dtDatos
        Catch ex As Exception
            Throw ex
        End Try

    End Function

    ''' <summary>
    ''' Devuelve un arrayList con los nombres de las hojas en la planilla
    ''' </summary>
    ''' <param name="pPath"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function TraerListaHojas(ByVal pPath As String) As ArrayList

        Dim listaHojas As New ArrayList
        Dim objExcelDAO As New ExcelDAO

        If objExcelDAO.TraerNombresHojas(pPath) Then
            listaHojas = objExcelDAO.ListaHojas
            Return listaHojas
        Else
            Throw New Exception(objExcelDAO.Error)
        End If

    End Function

    ''' <summary>
    ''' Devuelve un Datatable con el contenido de la planilla Excel con encabezados
    ''' </summary>
    ''' <returns>Datatable</returns>
    ''' <remarks></remarks>
    Public Function TraerTodoTabla() As System.Data.DataTable


        Dim listaDetalles As ArrayList
        'Creamos un dataTable
        Dim dtExcel As New System.Data.DataTable

        Dim pFilas As Integer
        Dim pColumnas As Integer
        Try

            If Not objPlantillas_excelDAO.TraerPlanillaExcel(_nombreArchivo, _nombreHoja) Then
                _error = objPlantillas_excelDAO.Error
                Throw New Exception(_error)
            End If

            objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla

            If Not objPlantillas_excel_detalleDAO.TraerDetallesPlantilla(objPlantillas_excel.Id) Then
                _error = objPlantillas_excel_detalleDAO.Error
                Throw New Exception(_error)
            End If


            listaDetalles = objPlantillas_excel_detalleDAO.ListaDetalles

            pFilas = objPlantillas_excel.Filas.Valor
            pColumnas = objPlantillas_excel.Columas.Valor



            'Creamos una columna por cada columna que hay declarada en la base de datos
            For i As Integer = 1 To pColumnas
                Dim columna As New DataColumn(i.ToString)
                dtExcel.Columns.Add(columna)
            Next


            'Por cada fila declarada en la base de datos
            For i As Integer = 1 To pFilas
                'Creamos una fila de nuestro dataTable
                Dim fila As DataRow = dtExcel.NewRow()
                'Ponemos nuestro contador en 1
                Dim k As Integer = 1
                'Cada item es una columna definida en la base de datos

                For Each item As plantillas_excel_detalle In listaDetalles

                    'A la columna K de nuestro dt le asignamos el valor de las coordenadas definidas en la BD

                    'If Not obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value = "" Then

                    '    If ComprobarExistencia(i, k, obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value.ToString, listaDetalles) Then
                    '        fila(k - 1) = obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value
                    '    End If

                    'End If

                    fila(CType(item.Columna.Valor, Integer) - 1) = obj_Worksheet.cells(i, CType(item.Columna.Valor, Integer)).Value
                    k = CType(item.Columna.Valor, Integer)
                    'Si llegamos al maximo de columnas reseteamos el contador y continuamos con el for
                    If k = pColumnas Then
                        k = 1
                        Exit For
                    End If
                    'Suma 1 al contador de vueltas
                    k += 1

                Next
                'Agregamos la fila
                dtExcel.Rows.Add(fila)
            Next
            Return dtExcel
        Catch ex As Exception
            Throw ex
        End Try


    End Function

    Public Function ComprobarExistencia(ByVal pFila As Integer, ByVal pColumna As Integer, ByVal pValor As String, ByVal pListaDetalles As ArrayList) As Boolean
        ComprobarExistencia = False

        For Each item As plantillas_excel_detalle In pListaDetalles
            If Not item.Tipo_detalle.Valor.ToString = "XLS_ENC" Then
                Continue For
            End If
            If item.Columna.Valor = pColumna AndAlso item.Fila.Valor = pFila Then
                If item.Nombre.Valor = pValor Then
                    ComprobarExistencia = True
                    Exit Function
                End If
            End If

        Next



    End Function

    Public Function GenerarArchivo(ByVal tabla As System.Data.DataTable) As Boolean
        GenerarArchivo = True
        'Dim objPlantillas_excel As plantillas_excel
        'Dim objPlantillas_excelDAO As New plantillas_excelDAO()

        If objPlantillas_excelDAO.TraerPlanillaExcel(_nombreArchivo, _nombreHoja) Then
            objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla
        Else
            Throw New Exception("No se pudo encontrar la plantilla a la que hace mención. ")
        End If

        Dim fec As String = Now.Year.ToString + "-" + Now.Month.ToString + "-" + Now.Day.ToString


        _rutaExportado = objPlantillas_excel.Carp_archivo_tmp.Valor.ToString + "\" + fec + "_" + objPlantillas_excel.aplicacion.Valor.ToString + ".txt"


        'Si el archivo existe lo borramos
        If File.Exists(_rutaExportado) Then
            File.Delete(_rutaExportado)
            Log.Logger("Info", "Archivo " + _rutaExportado + " ya existe. El archivo se borra antes de volver a escribir.")
        End If
        Dim sw As New StreamWriter(_rutaExportado, True)
        Dim nro_fila As Integer = 0
        Dim nro_column As Integer = 0
        Try
            For Each fila As DataRow In tabla.Rows
                If nro_fila = 800 Then
                    MsgBox("linea 880")
                    Console.WriteLine("asa")
                End If
                nro_fila += 1
                nro_column = 0
                Dim cadena As String = ""

                If TypeOf (fila.ItemArray(0)) Is DBNull Or fila.ItemArray(0) = "" Then
                    Exit For
                End If

                For Each item As String In fila.ItemArray
                    If Not IsDBNull(item) Then
                        cadena = cadena + item + objPlantillas_excel.Separador.Valor.ToString
                    Else
                        cadena = cadena + "" + objPlantillas_excel.Separador.Valor.ToString
                    End If
                    nro_column += 1
                Next
                If cadena.EndsWith(objPlantillas_excel.Separador.Valor.ToString) Then
                    cadena = Mid(cadena, 1, cadena.Length - 1)
                End If
                sw.WriteLine(cadena)
            Next
            Log.Logger("Info", "Archivo " + RutaExportado + " generado. ")
        Catch ex As FileNotFoundException
            _error = ex.Message
            GenerarArchivo = False
        Catch ex As System.InvalidCastException
            _error = ex.Message + ". Error en la fila " + nro_fila.ToString + " columna " + nro_column.ToString
            GenerarArchivo = False
        Catch ex As Exception
            _error = ex.Message
            GenerarArchivo = False
        Finally
            sw.Close()
            Log.Logger("Info", "")
        End Try




    End Function

    Private Sub CrearPlantillas(ByVal pNombreArhivo As String, ByVal pnombreHoja As String)

        objPlantillas_excelDAO = New plantillas_excelDAO

        If objPlantillas_excelDAO.TraerPlanillaExcel(pNombreArhivo, pnombreHoja) Then
            objPlantillas_excel = objPlantillas_excelDAO.ObjPlantilla()
        End If

        objPlantillas_excel_detalleDAO = New plantillas_excel_detalleDAO()

    End Sub

    Private Function ValidarValoresDefinidos(Of T)(ByVal pObjPlantillas_excel_detalle As plantillas_excel_detalle, ByVal valor As T) As Boolean

        If valor Is Nothing Then
            ValidarValoresDefinidos = True
            Exit Function
        End If
        Select Case pObjPlantillas_excel_detalle.TipoDato.Valor.ToString.ToLower

            Case "numerico"
                If IsNumeric(valor) Then
                    ValidarValoresDefinidos = True
                Else
                    ValidarValoresDefinidos = False
                End If
            Case "cadena"
                ValidarValoresDefinidos = True
            Case "fecha"
                If IsDate(valor) Then
                    ValidarValoresDefinidos = True
                Else
                    ValidarValoresDefinidos = False
                End If

        End Select



    End Function

    Private Function AbreExcel(ByVal pSheetName As String, ByVal pPath As String) As Boolean

        AbreExcel = True
        Dim objExcelDAO As New ExcelDAO
        Try

            ' -- Comproba si existe l archivo
            If Len(Dir(pPath)) = 0 Then
                Me._error = "No se ha encontrado el archivo: " & pPath
                AbreExcel = False
                Exit Function
            End If

            ' -- crea rnueva instancia de Excel
            obj_Excel = CreateObject("Excel.Application")

            ' -- Abrir el libro
            obj_Workbook = obj_Excel.Workbooks.Open(pPath)
            ' -- referencia la Hoja, por defecto la hoja activa
            If pSheetName = vbNullString Then
                obj_Worksheet = obj_Workbook.ActiveSheet
            Else
                obj_Worksheet = obj_Workbook.Sheets(pSheetName)
            End If

        Catch ex As Exception
            AbreExcel = False
            Throw ex
        End Try

    End Function

    Public Function EjecutarProcedimiento() As Boolean
        EjecutarProcedimiento = False
        Dim objConexionDAO As New ConexionDAO
        Dim objConexion As New Conexion
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        If Not objConexionDAO.ObtenerConexion(_ambiente, objPlantillas_excel.Base_destino) Then
            Exit Function
        End If

        objConexion = objConexionDAO.ObjConexion

        If objPlantillas_excel.Procedimiento.Valor = "" Then
            Me._error = "No existe un procedimiento definido para la planilla [" + _nombreHoja + "]"
            Exit Function
        End If

        Dim Sql As String
        Sql = " EXEC " + objPlantillas_excel.Procedimiento.Valor.ToString + " "
        Sql = Sql + SQLAdapter.formatValuetoSQL(Campo.ToCampo(_rutaExportado)) + SQLAdapter.COMA
        Sql = Sql + objPlantillas_excel.Id.Valor.ToString + SQLAdapter.COMA
        Sql = Sql + SQLAdapter.formatValuetoSQL(Campo.ToCampo(objPlantillas_excel.Separador.Valor.ToString)) + SQLAdapter.COMA
        Sql = Sql + SQLAdapter.formatValuetoSQL(Campo.ToCampo(_ejercicio)) + SQLAdapter.COMA
        Sql = Sql + SQLAdapter.formatValuetoSQL(Campo.ToCampo(_version)) + SQLAdapter.COMA
        Sql = Sql + SQLAdapter.formatValuetoSQL(Campo.ToCampo(_usuario_mod))

        Log.Logger("Debug", Sql)
        If Not objAdmConexiones.EjecutarNonQuery(objConexion.url.Valor.ToString, objConexion.usuario.Valor.ToString, objConexion.password.Valor.ToString, Sql) Then
            Me._error = objAdmConexiones.Error
            Exit Function
        End If
        EjecutarProcedimiento = True
    End Function

    Public Sub New(ByVal pSheetName As String, ByVal pPath As String, ByVal pEjercicio As String, ByVal pVersion As String, ByVal pUsuario As String)
        _nombreHoja = pSheetName
        _rutaArchivo = pPath
        _ambiente = Configuration.ConfigurationManager.AppSettings("AMBIENTE").ToString
        _ejercicio = pEjercicio
        _version = pVersion
        _usuario_mod = pUsuario
        _nombreArchivo = "definicion tablas_v3_2_5"
        AbreExcel(_nombreHoja, _rutaArchivo)
        CrearPlantillas(_nombreArchivo, _nombreHoja)
    End Sub



End Class

