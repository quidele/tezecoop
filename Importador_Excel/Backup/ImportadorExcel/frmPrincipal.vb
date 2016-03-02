Option Strict Off
'Imports fonseca_libDatos
Imports Excel
Imports System.Data.OleDb
Imports fonseca_libDatos
Imports System.Runtime.InteropServices

Public Class frmPrincipal

    Private objAdmPlanillasExcel As admPlanillasExcel
    Private objFrmConfiguracion As frm_Config

    Private _error As String
    'Es para un reporte de tareas finalizadas correctamente (NO ERROR)
    Private _informe As String
    Private _usuario As String

    Private _nomAplicacion As String

    Private _listaCorrectos As List(Of admPlanillasExcel)
    Private _lista_excel_Incorrectos As List(Of admPlanillasExcel)

    '-------------
    'Ambas listas deberian estar sincronizadas, una contiene el nombre de la planilla mientras que la otra la lista de coordenadas de los campos con errores.
    Private _listaListaErrores As List(Of ArrayList)
    Private _listaListaNombres As ArrayList
    '-------------
    'Estas listas se aplican para colorear la datagridview cargada a partir de las tablas de la siguiente lista
    Private _lista_dt_Incorrectos As List(Of System.Data.DataTable)
    '-------------
    Private _correBarra As Boolean

    Dim hiloProgress As Threading.Thread

    Private Sub CorrerProgressBar()
        progressBar = New ToolStripProgressBar()


        progressBar.Style = ProgressBarStyle.Continuous
        progressBar.Visible = True
        progressBar.Enabled = True
        'Dim band As Boolean = True
        While hiloProgress.IsAlive

            While _correBarra = True

                If progressBar.Value = 100 Then
                    progressBar.Value = 0
                Else
                    progressBar.Value = progressBar.Value + 1
                End If

            End While

            If _correBarra = False Then

                progressBar.Value = 0
            End If

        End While

    End Sub


    Private Sub Ejecutar_Multiples()


        _error = 0

        Try

            progressBar.Value = 5
            If Not validaCampos() Then
                MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Me._error = ""
                progressBar.Value = 0
                Exit Sub
            End If

            progressBar.Value = 10
            If lstHojas.SelectedItems.Count = 0 Then
                Me._error = "Debe seleccionar al menos una planilla excel."
                ErrorProvider1.SetError(lstHojas, "Debe seleccionar al menos una planilla excel.")
                MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Me._error = ""
                progressBar.Value = 0
                Exit Sub
            End If

            _informe = ""

            Dim _listaPlanillas As New List(Of admPlanillasExcel)


            progressBar.Value = 15

            'Creamos objetos planillas por cada item seleccionado en la lista
            For Each elemento As String In lstHojas.SelectedItems
                'Destinamos 20 puntos al progressbar
                progressBar.Value = progressBar.Value + CType((20 / lstHojas.Items.Count), Integer)
                Dim objPlanilla As New admPlanillasExcel(elemento, txtRuta.Text, "", "", _usuario)
                _listaPlanillas.Add(objPlanilla)

            Next

            'listaCorrectos contiene las planillas que van a ser procesadas
            _listaCorrectos = New List(Of admPlanillasExcel)
            _lista_excel_Incorrectos = New List(Of admPlanillasExcel)
            _lista_dt_Incorrectos = New List(Of System.Data.DataTable)
            _listaListaErrores = New List(Of ArrayList)
            _listaListaNombres = New ArrayList()


            For Each planillas As admPlanillasExcel In _listaPlanillas
                Try
                    'Destinamos 20 puntos al progressbar
                    progressBar.Value = progressBar.Value + CType((20 / lstHojas.Items.Count), Integer)
                    'Compara las planillas de la lista con su definicion
                    planillas.CompararPlanillaDefinicion()
                    'Si no tira una excepcion entonces la planilla existe definida en la base de datos
                    _listaCorrectos.Add(planillas)

                Catch ex As Exception

                    Me._error = Me._error + vbCrLf + "* [" + planillas.NombreHoja + "] - No tiene una definicion en la base de datos. " + ex.Message

                    'eliminamos las planillas que no estan ni siquiera cargadas en la bas de datos.
                    planillas.Dispose()
                End Try


            Next


            'En listaCorrectos me quedan las planillas que tienen definicion en la basse de datos
            'Ahora hay que ver que correspondan a esa definicion.
            For Each planillas As admPlanillasExcel In _listaCorrectos
                'Destinamos 20 puntos al progressbar
                progressBar.Value = progressBar.Value + CType((20 / lstHojas.Items.Count), Integer)
                Dim dtTablaCab As New System.Data.DataTable(planillas.NombreHoja.ToString)


                dtTablaCab = planillas.TraerTodoTabla()

                If Not planillas.ListaErrores Is Nothing Then
                    If planillas.ListaErrores.Count > 0 Then
                        Log.Logger("Warn", "Hubo errores de compatibilidad con el archivo EXCEL en [" + planillas.NombreHoja + "]")
                        _lista_excel_Incorrectos.Add(planillas)
                        dtTablaCab.TableName = planillas.NombreHoja.ToString
                        _lista_dt_Incorrectos.Add(dtTablaCab)
                        _listaListaErrores.Add(planillas.ListaErrores)
                        _listaListaNombres.Add(planillas.NombreHoja)
                    End If
                End If
            Next

            'Eliminamos de la listaCorrectos aquellas planillas que esten en conflicto con la definicion en la base de datos
            For Each planilla As admPlanillasExcel In _lista_excel_Incorrectos
                _listaCorrectos.Remove(planilla)
            Next

            For Each planillas As admPlanillasExcel In _listaCorrectos
                'Se me ocurrio volver a crear la planilla excel... a ver que pasa.
                Dim objPlanilla As New admPlanillasExcel(planillas.NombreHoja, txtRuta.Text, "", "", _usuario)

                Dim dtDatos As System.Data.DataTable = objPlanilla.TraerDatosTabla()
                'Dim dtDatos As System.Data.DataTable = planillas.TraerDatosTabla()

                'If planillas.GenerarArchivo(dtDatos) Then
                If objPlanilla.GenerarArchivo(dtDatos) Then
                    'MessageBox.Show("Archivo exportado correctamente a " + objAdmPlanillasExcel.RutaExportado, "Operación exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    Log.Logger("info", "Archivo exportado correctamente a " + planillas.RutaExportado)
                Else
                    Me._error = Me._error + vbCrLf + planillas.Error
                    Log.Logger("Error", planillas.Error)
                    'MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    Throw New Exception(Me._error)
                    Exit Try
                End If

                'If Not planillas.EjecutarProcedimiento() Then
                If Not objPlanilla.EjecutarProcedimiento() Then
                    Me._error = Me._error + vbCrLf + planillas.Error + ". " + objPlanilla.Error
                    Log.Logger("Error", planillas.Error)
                    'MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    'Exit Try
                Else
                    'Informar que se ejecuto correctamente'
                    _informe = _informe + planillas.NombreHoja + " se cargo correctamente" + vbCrLf
                    Log.Logger("Info", planillas.NombreHoja + " se cargo correctamente")
                End If

                'planillas.Dispose()
                objPlanilla.Dispose()
                GC.Collect()


            Next

            lstRechazados.DataSource() = _lista_excel_Incorrectos


            For Each planilla As admPlanillasExcel In _lista_excel_Incorrectos
                'Destinamos 20 puntos al progressbar
                progressBar.Value = progressBar.Value + CType((20 / lstHojas.Items.Count), Integer)
                If Not planilla.ListaErrores Is Nothing Then
                    If planilla.ListaErrores.Count > 0 Then


                        Dim listaDeErrores As ArrayList = planilla.ListaErrores
                        For Each item As Coordenadas In listaDeErrores

                            Me._error = Me._error + vbCrLf + "'" + item.Nombre + "' en fila " + (item.Eje_X + 1).ToString + " columna " + (item.Eje_Y + 1).ToString + " no es igual a la definición en la base de datos en [" + planilla.NombreHoja + "]. " + vbCrLf
                        Next

                    End If
                End If

            Next

            For Each planilla As admPlanillasExcel In _lista_excel_Incorrectos
                planilla.Dispose()
            Next

            progressBar.Value = 100

            If _informe.Count > 0 Then
                MessageBox.Show(_informe, "Ejecutados correctamente", MessageBoxButtons.OK, MessageBoxIcon.Information)
                txtReporte.Text = txtReporte.Text + vbCrLf + _informe
            End If
            If _error.Count > 0 Then

                Throw New Exception(Me._error)
            End If

            'For Each planillas As admPlanillasExcel In _listaPlanillas
            '    'Dim dtDatos As System.Data.DataTable = objAdmPlanillasExcel.TraerDatosTabla()
            '    Dim dtDatos As System.Data.DataTable = planillas.TraerDatosTabla()
            '    planillas.GenerarArchivo(dtDatos)
            'Next

        Catch ex As COMException

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            txtReporte.Text = txtReporte.Text + vbCrLf + ex.Message
            For Each planillas As admPlanillasExcel In _listaCorrectos
                planillas.Dispose()
                GC.Collect()
            Next
        Finally
            progressBar.Value = 0
            'Forzamos la eliminacion 
            EliminarProcesosExcel()
        End Try
    End Sub

    Private Sub Ejecutar_Simple()

        'Validamos que todos los campos esten completos
        If Not validaCampos() Then
            MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Me._error = ""
            Exit Sub
        End If

        Try
            'Creamos un objeto de tipo AdmPlanillasExcel -- un objeto es igual a una sola planilla (Worksheet)
            objAdmPlanillasExcel = New admPlanillasExcel(cmbHojas.Text, txtRuta.Text, "", "", _usuario)

            'nombre si extencion
            'Dim nombre As String = Mid(ofDialog.SafeFileName, 1, InStr(ofDialog.SafeFileName, ".") - 1)


            progressBar.PerformStep()

            'Metodo que compara la definicion con la planilla
            objAdmPlanillasExcel.CompararPlanillaDefinicion()

            Dim dtDatos As System.Data.DataTable = objAdmPlanillasExcel.TraerDatosTabla()
            dgvDatos.DataSource = dtDatos


            Dim dt As System.Data.DataTable = objAdmPlanillasExcel.TraerTodoTabla()

            progressBar.PerformStep()
            DataGridView1.DataSource = dt

            For Each fila As DataRow In dt.Rows
                Console.WriteLine("")
            Next

            DataGridView1.ColumnHeadersHeight = 100
            DataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells
            dgvDatos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells


            progressBar.PerformStep()
            If Not objAdmPlanillasExcel.ListaErrores Is Nothing Then
                If objAdmPlanillasExcel.ListaErrores.Count > 0 Then

                    'Me._error = ""
                    Log.Logger("Warn", "Hubo errores de compatibilidad con el archivo EXCEL")
                    Dim listaDeErrores As ArrayList = objAdmPlanillasExcel.ListaErrores
                    For Each item As Coordenadas In listaDeErrores
                        Log.Logger("Warn", "Fila = " + item.Eje_X.ToString + " | Columna = " + item.Eje_Y.ToString)
                        DataGridView1.Rows(item.Eje_X).Cells(item.Eje_Y).Style.BackColor = Color.Red
                        Me._error = Me._error + vbCrLf + "'" + item.Nombre + "' en fila " + (item.Eje_X + 1).ToString + " columna " + (item.Eje_Y + 1).ToString + " no es igual a la definición en la base de datos. " + vbCrLf
                    Next
                    Me._error = Me._error + vbCrLf + "La operación no pudo completarse. Corrija el archivo que desea importar e intente nuevamente."
                    MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    Log.Logger("Error", Me._error)
                    Exit Sub
                End If
            End If
            progressBar.PerformStep()


            If objAdmPlanillasExcel.GenerarArchivo(dtDatos) Then
                'MessageBox.Show("Archivo exportado correctamente a " + objAdmPlanillasExcel.RutaExportado, "Operación exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Log.Logger("info", "Archivo exportado correctamente a " + objAdmPlanillasExcel.RutaExportado)
            Else
                Me._error = objAdmPlanillasExcel.Error
                Log.Logger("Error", Me._error)
                MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Try
            End If
            progressBar.PerformStep()
            If Not objAdmPlanillasExcel.EjecutarProcedimiento() Then
                Me._error = Me._error + vbCrLf + objAdmPlanillasExcel.Error
                Log.Logger("Error", Me._error)
                MessageBox.Show(Me._error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Try
            End If

            objAdmPlanillasExcel.Dispose()
            GC.Collect()

            MessageBox.Show("Operación finalizada correctamente!", "Finalizacion correcta", MessageBoxButtons.OK, MessageBoxIcon.Information)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Log.Logger("Error", ex.Message)
        Finally


            objAdmPlanillasExcel.Dispose()
            GC.Collect()
            progressBar.Value = 0
            'Forzamos la eliminacion 
            EliminarProcesosExcel()
        End Try

    End Sub

    Private Sub btnEjecutar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEjecutar.Click
        txtReporte.Text = ""


        'progressBar.Style = ProgressBarStyle.Marquee

        'progressBar.Style = ProgressBarStyle.Marquee
        'progressBar.MarqueeAnimationSpeed = 20
        'bgw.WorkerSupportsCancellation = True
        'bgw.WorkerReportsProgress = True

        'If Not bgw.IsBusy = True Then
        '    bgw.RunWorkerAsync()
        'End If

        'If Not BuscarProcesosExcel() Then
        'Exit Sub
        'End If

        dgvDatos = New DataGridView()
        Dim dt As New System.Data.DataTable
        dgvDatos.DataSource = dt


        Ejecutar_Multiples()

        EliminarProcesosExcel()

        'bgw.CancelAsync()
        'Ejecutar_Simple()

        'progressBar.MarqueeAnimationSpeed = 0

    End Sub

    Private Sub EliminarProcesosExcel()
        Dim procesos() As Process = Process.GetProcessesByName("excel")
        Dim contador As Integer = 0
        If procesos.Count > 0 Then
            For i As Integer = 0 To procesos.Count - 1 Step 1
                procesos(i).CloseMainWindow()
                If procesos(i).HasExited = False Then
                    procesos(i).Kill()
                    procesos(i).Close()
                End If
                contador = contador + 1
            Next
        End If
    End Sub

    Private Function BuscarProcesosExcel() As Boolean

        Dim procesos() As Process = Process.GetProcessesByName("excel")

        If Not procesos.Count = 0 Then
            Dim resultado As DialogResult

            resultado = MessageBox.Show("Tiene procesos o planillas EXCEL abiertas que debe cerrar antes de continuar. ¿Desea que el programa las cierre por usted?", "Atención", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button3)

            If resultado = System.Windows.Forms.DialogResult.Yes Then
                BuscarProcesosExcel = True
            ElseIf resultado = System.Windows.Forms.DialogResult.No Or resultado = System.Windows.Forms.DialogResult.Cancel Then
                BuscarProcesosExcel = False
            End If

        Else
            ' Si no hay procesoss entonces el resultado del metodo es verdadero
            BuscarProcesosExcel = True
        End If

    End Function



    Private Function validaCampos() As Boolean
        validaCampos = False

        ErrorProvider1.Clear()

        Me._error = ""
        If Not txtRuta.Text.Count > 0 Then
            Me._error = Me._error + " Debe indicar un archivo origen." + vbCrLf
            Log.Logger("Warn", "Debe indicar un archivo origen.")
            ErrorProvider1.SetError(txtRuta, "Debe indicar un archivo origen.")
        End If



        'If Not cmbHojas.Text.Count > 0 Then
        '    Me._error = Me._error + " Debe indicar una hoja archivo origen." + vbCrLf
        '    Log.Logger("Warn", "Debe indicar una hoja archivo origen.")
        '    ErrorProvider1.SetError(cmbHojas, "Debe indicar una hoja archivo origen.")
        'End If

        
        
        If Me._error <> "" Then
            Exit Function
        End If
        validaCampos = True
    End Function

    Private Sub btnBuscar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBuscar.Click
        ofDialog.Multiselect = False
        ofDialog.Filter = "Planillas Excel (*.xls)|*.xls"
        ofDialog.FileName = ""
        ofDialog.Title = "Buscar planillas EXCEL"

        If txtRuta.Text <> "" Then
            ofDialog.InitialDirectory = txtRuta.Text

        Else
            ofDialog.InitialDirectory = Application.ExecutablePath
        End If

        Log.Logger("Info", "Iniciando busqueda de XLS en " + ofDialog.InitialDirectory)

        If ofDialog.ShowDialog() <> System.Windows.Forms.DialogResult.OK Then
            txtRuta.Clear()
            cmbHojas.Items.Clear()
            cmbHojas.Text = ""
        End If

    End Sub

    Private Sub ofDialog_FileOk(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ofDialog.FileOk

        Try

            'Traemos las hojas de la planilla al comboBox y mostramos la ruta del archivo seleccionado
            txtRuta.Text = ofDialog.FileName
            Dim lista As ArrayList = admPlanillasExcel.TraerListaHojas(ofDialog.FileName)
            cmbHojas.Items.Clear()
            lstHojas.Items.Clear()
            For Each linea As String In lista
                cmbHojas.Items.Add(linea)
                lstHojas.Items.Add(linea)
            Next
        Catch ex As Exception
            MessageBox.Show(ex.Message)

        End Try

    End Sub

    Private Sub frmPrincipal_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing

        If Not objAdmPlanillasExcel Is Nothing Then
            objAdmPlanillasExcel.Dispose()
            GC.Collect()
        End If

        'For Each plantilla As admPlanillasExcel In listaCorrectos
        '    plantilla.Dispose()
        'Next
        'For Each plantilla As admPlanillasExcel In listaIncorrectos
        '    plantilla.Dispose()
        'Next


    End Sub

    Private Sub ConfigurarBarraDeEstado()
        Dim objSeguridad As New seguridad
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()

        lbl_ts_Version.Text = "Versión: " + My.Application.Info.Version.ToString
        lbl_ts_Usuario.Text = "Usuario: " + objSeguridad.obtenerUID_Magma

        ' objAdmConexiones.AbrirConexionMagmaSQL()
        ' lbl_ts_BaseActiva.Text = "Base Magma: " + objAdmConexiones.GetNombre_SQLDatabase

        Log.Logger("Info", lbl_ts_Usuario.Text)
        Log.Logger("Info", lbl_ts_Version.Text)
        Log.Logger("Info", lbl_ts_BaseActiva.Text)
        objSeguridad = Nothing
        objAdmConexiones = Nothing
    End Sub


    Private Sub frmPrincipal_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        progressBar.Step = 20
        objFrmConfiguracion = New frm_Config()
        lbl_ts_Log.Text = "Log = " + objFrmConfiguracion.LogHabilitado
        Log.StartLog(objFrmConfiguracion.LogHabilitado, objFrmConfiguracion.TipoLog, objFrmConfiguracion.RutaLog)

        ConfigurarBarraDeEstado()

        _nomAplicacion = Configuration.ConfigurationManager.AppSettings("NOM_APLICACION")

        ConfigurarIU(_nomAplicacion)



        'hiloProgress = New Threading.Thread(AddressOf CorrerProgressBar)
        '_correBarra = True
        'hiloProgress.Start()

    End Sub

    Private Sub ConfigurarIU(ByVal pNombreAplicacion As String)

        Select Case pNombreAplicacion.ToLower
            Case "presupuestos"
                picBox.Image = My.Resources.BarraSuperior_3_2
                Me.Text = "Presupuestos"
                tab_hoja_1.Text = "Presupuesto"
            Case "importador"
                picBox.Image = My.Resources.BarraSuperior
                Me.Text = "Importador de XLS"
                tab_hoja_1.Text = "Planillas"
        End Select

        cmbHojas.Hide()

        Dim listaSectores As New ArrayList
        listaSectores.Add("SIST")
        
        Me.MaximumSize = Me.Size
        Me.MinimumSize = Me.Size



    End Sub



    Private Sub btnAbrir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbrir.Click
        btnBuscar_Click(sender, e)
    End Sub




    ''' <summary>
    ''' Compara los sectores x usuario.
    ''' </summary>
    ''' <param name="pSectores"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function esAccesoValidoXsectores(ByVal pSectores As ArrayList) As Boolean
        esAccesoValidoXsectores = False

        Dim objSeguridad As New seguridad
        Dim un_ct_sectoresDAO As New ct_sectoresDAO
        Dim sector As String

        _usuario = objSeguridad.obtenerUID_Magma()

        un_ct_sectoresDAO.obtenerSectoresxUsuario(Campo.ToCampo(_usuario))

        For Each un_ct_sectores In un_ct_sectoresDAO.listaSectores
            sector = un_ct_sectores.cod_sector.valor.ToString.Trim

            For Each linea As String In pSectores
                If linea = sector Then
                    esAccesoValidoXsectores = True
                    Exit Function
                End If
            Next

        Next


    End Function

    Private Sub txtRuta_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles txtRuta.KeyDown
        If e.KeyCode = Keys.F9 Then
            btnBuscar_Click(sender, e)
        End If

        If e.KeyCode = Keys.Return Then
            GetNextControl(txtRuta, True).Focus()
            Exit Sub
        End If
    End Sub





    Private Sub lbl_ts_Log_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lbl_ts_Log.Click
        If objFrmConfiguracion Is Nothing Then
            Exit Sub
        End If

        objFrmConfiguracion.ShowDialog()
        lbl_ts_Log.Text = "Log = " + objFrmConfiguracion.LogHabilitado
        Log.StartLog(objFrmConfiguracion.LogHabilitado, objFrmConfiguracion.TipoLog, objFrmConfiguracion.RutaLog)
    End Sub

    Private Sub ListBox2_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstRechazados.SelectedIndexChanged

        'For Each tabla As System.Data.DataTable In listaIncorrectos_2
        '    If tabla.TableName = lstRechazados.SelectedItems(0).ToString Then

        '        DataGridView1.DataSource = tabla

        '        For Each planilla As admPlanillasExcel In listaIncorrectos
        '            If planilla.NombreHoja = tabla.TableName Then
        '                If Not planilla.ListaErrores Is Nothing Then
        '                    If planilla.ListaErrores.Count > 0 Then

        '                        Dim listaDeErrores As ArrayList = planilla.ListaErrores
        '                        For Each item As Coordenadas In listaDeErrores
        '                            DataGridView1.Rows(item.Eje_X).Cells(item.Eje_Y).Style.BackColor = Color.Red

        '                        Next
        '                        Exit Sub
        '                    End If
        '                End If
        '            End If
        '        Next


        '    End If
        'Next



        For Each tabla As System.Data.DataTable In _lista_dt_Incorrectos
            If tabla.TableName = lstRechazados.SelectedItems(0).ToString Then

                DataGridView1.DataSource = tabla

                For Each item As String In _listaListaNombres
                    If item = tabla.TableName Then
                        Dim indice As Integer = _listaListaNombres.IndexOf(item)
                        'If Not planilla.ListaErrores Is Nothing Then
                        'If planilla.ListaErrores.Count > 0 Then



                        Dim listaDeErrores As ArrayList = _listaListaErrores.Item(indice)
                        For Each element As Coordenadas In listaDeErrores
                            DataGridView1.Rows(element.Eje_X).Cells(element.Eje_Y).Style.BackColor = Color.Red

                        Next
                        Exit Sub
                        'End If
                        'End If
                    End If
                Next


            End If
        Next
    End Sub

    'Private Sub bgw_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles bgw.DoWork
    '    'progressBar = New ToolStripProgressBar()
    '    'progressBar.Style = ProgressBarStyle.Marquee
    '    'progressBar.MarqueeAnimationSpeed = 20
    '    'If tab_hoja_1.InvokeRequired Then
    '    '    tab_hoja_1
    '    'End If
    '    bgw.ReportProgress(0)
    '    While bgw.CancellationPending = False
    '        bgw.ReportProgress(40)
    '    End While
    '    bgw.ReportProgress(100)
    'End Sub

    'Private Sub bgw_RunWorkerCompleted(ByVal sender As System.Object, ByVal e As System.ComponentModel.RunWorkerCompletedEventArgs) Handles bgw.RunWorkerCompleted

    '    'Console.WriteLine("Termino")
    '    'progressBar.MarqueeAnimationSpeed = 0
    '    'progressBar.Style = ProgressBarStyle.Blocks
    '    'bgw.Dispose()


    'End Sub

    'Private Sub bgw_ProgressChanged(ByVal sender As System.Object, ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles bgw.ProgressChanged

    '    If e.ProgressPercentage = 0 Then

    '        progressBar.MarqueeAnimationSpeed = 20
    '    ElseIf e.ProgressPercentage < 100 Then

    '    Else
    '        progressBar.MarqueeAnimationSpeed = 0
    '        progressBar.Style = ProgressBarStyle.Blocks

    '    End If


    'End Sub

    Private Sub cmbHojas_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbHojas.SelectedIndexChanged

    End Sub

    
    Private Sub tab_hoja_1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tab_hoja_1.Click

    End Sub

    Private Sub lbl_ts_Usuario_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lbl_ts_Usuario.Click

    End Sub
End Class
