Imports System.Threading

Public Class Frm_obtieneCAE

    'Dim un_AdmFacturaElectronica As AdmFacturaElectronica
    'Dim un_comprobantes_mlDAO As Comprobantes_mlDAO
    'Public objFrmConfig As New frmConfiguracion

    ''<<Version 2.1.3>>
    'Private Sub AplicarEstiloDeGrillas(ByVal dgv As DataGridView)
    '    Dim cs As New System.Windows.Forms.DataGridViewCellStyle
    '    cs.BackColor = Color.LightBlue
    '    With dgv

    '        '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
    '        '.BackgroundColor = Color.FloralWhite
    '        '.BackgroundColor = Color.LightSteelBlue
    '        .GridColor = Color.DarkBlue
    '        .AlternatingRowsDefaultCellStyle = cs

    '        .CellBorderStyle = DataGridViewCellBorderStyle.Single
    '    End With




    'End Sub

    'Private Sub DGV_comprobantes_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DGV_listaComprobantes.CellDoubleClick
    '    btn_procesar_Click(sender, e)
    'End Sub

    ' ''' <summary>
    ' ''' Valida que el comprobante a enviar sea el del menor numero.
    ' ''' </summary>
    ' ''' <param name="pDgvRow"></param>
    ' ''' <returns></returns>
    ' ''' <remarks></remarks>
    'Private Function ValidarValorMinimoComprobanteAEnviar(ByVal pDgvRow As DataGridViewRow) As Boolean
    '    ValidarValorMinimoComprobanteAEnviar = True

    '    For Each fila As DataGridViewRow In DGV_listaComprobantes.Rows()

    '        If fila.Cells("cod_doc").Value = pDgvRow.Cells("cod_doc").Value Then

    '            If CInt(fila.Cells("nro_doc").Value.ToString) < CInt(pDgvRow.Cells("nro_doc").Value.ToString) Then
    '                ValidarValorMinimoComprobanteAEnviar = False
    '                Exit Function
    '            End If

    '        End If

    '    Next


    'End Function

    ' ''' <summary>
    ' ''' Valida que el comprobante a enviar tenga la menor fecha de la grilla.
    ' ''' </summary>
    ' ''' <param name="pDgvRow"></param>
    ' ''' <returns></returns>
    ' ''' <remarks></remarks>
    'Private Function ValidarFechaMinimaComprobanteAEnviar(ByVal pDgvRow As DataGridViewRow) As Boolean

    '    ValidarFechaMinimaComprobanteAEnviar = True

    '    For Each fila As DataGridViewRow In DGV_listaComprobantes.Rows()

    '        If fila.Cells("cod_doc").Value = pDgvRow.Cells("cod_doc").Value Then

    '            If Date.Compare(CDate(fila.Cells("fec_doc").Value.ToString).Date, CDate(pDgvRow.Cells("fec_doc").Value.ToString)) < 0 Then
    '                ValidarFechaMinimaComprobanteAEnviar = False
    '                Exit Function
    '            End If

    '        End If
    '    Next

    'End Function


    'Private Sub btn_procesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click

    '    un_AdmFacturaElectronica = New AdmFacturaElectronica
    '    un_comprobantes_mlDAO = New Comprobantes_mlDAO
    '    Dim objProgressBar As New frm_progressbar
    '    If DGV_listaComprobantes.SelectedRows.Count = 0 Then Exit Sub

    '    Dim numeroCbte As Integer = CType(DGV_listaComprobantes.SelectedRows(0).Cells("nro_doc").Value.ToString, Integer)
    '    Dim tipoCbte As String = DGV_listaComprobantes.SelectedRows(0).Cells("cod_doc").Value.ToString

    '    ' << validacion ingresada en la <<version_2.1.2.0>> No sirve
    '    'If Not ValidarValorMinimoComprobanteAEnviar(DGV_listaComprobantes.SelectedRows(0)) Then
    '    'MessageBox.Show("ERROR: El documento '" + tipoCbte + "' Nº '" + CStr(numeroCbte) + " no se puede procesar ya que exiten documentos anteriores sin enviar a AFIP.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
    '    'Exit Sub
    '    'End If

    '    '<< validacion ingresada en la <<version_2.1.2.0>> No sirve
    '    If Not ValidarFechaMinimaComprobanteAEnviar(DGV_listaComprobantes.SelectedRows(0)) Then
    '        MessageBox.Show("ERROR: El documento '" + tipoCbte + "' Nº '" + CStr(numeroCbte) + " no se puede procesar ya que exiten documentos con fecha anterior sin enviar a AFIP.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
    '        Exit Sub
    '    End If


    '    ' << validacion ingresada en la <<version_2.1.1.0>>
    '    If DGV_listaComprobantes.SelectedRows(0).Cells("estado").Value.ToString = "AfecConta" Then
    '        MessageBox.Show("ERROR: La factura esta afectada por contaduria, por favor debe desafectarla.", "Confirmación de envío", MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1)
    '        Exit Sub
    '    End If


    '    If DGV_listaComprobantes.SelectedRows(0).Cells("estado").Value.ToString = "No Asignado" Then
    '        If MessageBox.Show("ADVERTENCIA: La factura está en estado ""No Asignado"". Es probable que ya exista en AFIP. Consulte los comprobantes existentes en AFIP para mayor seguridad. ¿Desea continuar de todas formas?", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) = Windows.Forms.DialogResult.No Then
    '            Exit Sub
    '        End If
    '    End If

    '    If MessageBox.Show("Ha solicitado el envío del comprobante N° " & numeroCbte.ToString & vbCrLf & _
    '                       "¿Está seguro de que desea enviar esa información a AFIP? ", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) = Windows.Forms.DialogResult.No Then
    '        Exit Sub
    '    End If
    '    Me.Enabled = False
    '    btn_procesar.Enabled = False
    '    objProgressBar.UseWaitCursor = True
    '    objProgressBar.MaximumSize = objProgressBar.Size
    '    objProgressBar.crearHilo()

    '    Dim idSolicitud As New Campo
    '    idSolicitud.Valor = CType(DGV_listaComprobantes.SelectedRows(0).Cells("solicitud_doc").Value.ToString, Integer)
    '    idSolicitud.Tipo = SQLAdapter.getTipoInteger

    '    Log.EscbribirLinea_Log("----------- INICIO -----------")
    '    Log.EscbribirLinea_Log("Comprobante N°: " + numeroCbte.ToString)
    '    Log.EscbribirLinea_Log("Id Solicitud: " + idSolicitud.Valor.ToString)
    '    Log.EscbribirLinea_Log("Cliente: " + DGV_listaComprobantes.SelectedRows(0).Cells("nom_tit").Value.ToString)
    '    Log.EscbribirLinea_Log(ToolStripStatusLabel6.Text) 'Escribe el nombre del usuario
    '    Log.EscbribirLinea_Log("Nombre del equipo: " + My.Computer.Name)

    '    Log.EscbribirLinea_Log("Insertando comprobantes en Base FE")

    '    If Not un_comprobantes_mlDAO.InsertarComprobantesMLFE(idSolicitud) Then
    '        objProgressBar.paraHilo()
    '        Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
    '        MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Exit Sub
    '    End If
    '    CargarGrillaObservaciones(idSolicitud) '<--- Actualiza la grilla de observaciones
    '    Log.EscbribirLinea_Log("Chequeando resultados de FE")
    '    ' Me.ToolStripStatusLabel7.Text = "Chequeando resultados de FE"
    '    If un_comprobantes_mlDAO.un_resultadoSP.resultado.ToString <> "OK" Then
    '        objProgressBar.paraHilo()
    '        Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
    '        MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Exit Sub
    '    End If
    '    Log.EscbribirLinea_Log("Obtener Comprobantes")
    '    ' Me.ToolStripStatusLabel7.Text = "Obtener Comprobantes"
    '    If Not un_comprobantes_mlDAO.ObtenerComprobante(idSolicitud) Then
    '        objProgressBar.paraHilo()
    '        Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)

    '        MessageBox.Show(un_comprobantes_mlDAO.error, "ERROR: Solicitud de CAE", MessageBoxButtons.OK, MessageBoxIcon.Information)
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Exit Sub
    '    End If
    '    Log.EscbribirLinea_Log("Iniciando el proceso de solicitud de CAE")
    '    'Me.ToolStripStatusLabel7.Text = "Solicitando CAE a AFIP"
    '    If Not un_AdmFacturaElectronica.solicitarCAE(un_comprobantes_mlDAO.ComprobanteBuscado, Me) Then
    '        Log.EscbribirLinea_Log(un_AdmFacturaElectronica.error)
    '        objProgressBar.paraHilo()

    '        MessageBox.Show(un_AdmFacturaElectronica.error, "ERROR: Solicitud de CAE", MessageBoxButtons.OK, MessageBoxIcon.Information)
    '        CargarGrillaObservaciones(idSolicitud)
    '        CargarGrillaSolicitudesAEnviar()
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Me.BringToFront()
    '        Exit Sub
    '    End If
    '    Log.EscbribirLinea_Log("Obtención de CAE exitosa")
    '    'Me.ToolStripStatusLabel7.Text = "Obtención de CAE exitosa"
    '    objProgressBar.paraHilo()
    '    Log.EscbribirLinea_Log("La operación finalizó correctamente")
    '    MessageBox.Show("La operación finalizó correctamente.", "Operación finalizada", MessageBoxButtons.OK, MessageBoxIcon.Information)
    '    Me.Enabled = True
    '    btn_procesar.Enabled = True
    '    CargarGrillaSolicitudesAEnviar()
    '    CargarGrillaObservaciones(idSolicitud)

    '    Me.BringToFront()

    'End Sub




    'Private Sub CargarGrillaObservaciones(ByVal idSolicitud As Campo)
    '    DGV_Observaciones.Rows.Clear()
    '    Dim una_observacionDAO As New ObservacionesDAO()
    '    una_observacionDAO.obtenerObservaciones(idSolicitud)
    '    Log.EscbribirLinea_Log("Observaciones: ")
    '    For Each una_observacion As Observaciones In una_observacionDAO.listaObservaciones
    '        DGV_Observaciones.Rows.Add(una_observacion.Code, una_observacion.Msg)
    '        Log.EscbribirLinea_Log(una_observacion.Code.ToString + " " + una_observacion.Msg.ToString)
    '    Next
    '    With Me.DGV_Observaciones
    '        .AutoResizeColumns()
    '        .Columns(1).AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
    '        .AllowUserToResizeColumns = False
    '        .AllowUserToResizeRows = False
    '    End With
    'End Sub

    'Private Sub CargarGrillaSolicitudesAEnviar() '-- Carga la grilla con la info de las solicitudes procesadas.

    '    DGV_listaComprobantes.Rows.Clear()


    '    un_AdmFacturaElectronica.MostrarSoldesAEnviar()

    '    For Each una_Solicitud As SolicitudML In un_AdmFacturaElectronica.listaSolicitudesAEnviar

    '        DGV_listaComprobantes.Rows.Add(una_Solicitud.idsolicitud, _
    '                                       una_Solicitud.cod_doc, _
    '                                        una_Solicitud.nom_tit, _
    '                                        una_Solicitud.serie_doc, _
    '                                        una_Solicitud.nro_doc, _
    '                                        una_Solicitud.imp_tot_mo, _
    '                                        una_Solicitud.estado_envio, _
    '                                        una_Solicitud.fec_doc)

    '    Next

    '    With Me.DGV_listaComprobantes
    '        .RowHeadersVisible = False
    '        '            .AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
    '        '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells
    '        .AutoResizeColumns()
    '        .AllowUserToResizeRows = False
    '    End With



    '    DGV_listaComprobantes.Sort(DGV_listaComprobantes.Columns("nro_doc"), System.ComponentModel.ListSortDirection.Ascending)
    'End Sub

    'Private Sub Frm_obtieneCAE_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    '    AdmConexiones.abrirConexionFE()

    '    Me.ToolStripStatusLabel7.Text = "Modo: " + Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString
    '    Me.ToolStripStatusLabel5.Text = "Base Magma: " + AdmConexiones.nombre_SQLDatabase + " Version: " + Application.ProductVersion
    '    Me.ToolStripStatusLabel6.Text = "Usuario: " + seguridad.obtenerUID_Magma
    '    Me.BringToFront()

    '    Me.TopLevel = True

    '    Me.Text = "Factura Electrónica - Mercado local - WebService"


    '    Try

    '        un_AdmFacturaElectronica = New AdmFacturaElectronica


    '        If Not un_AdmFacturaElectronica.MostrarSoldesAEnviar() Then
    '            MessageBox.Show(un_AdmFacturaElectronica.error, "Factura Electrónica ML")
    '            Me.btn_procesar.Enabled = False
    '        End If

    '        CargarGrillaSolicitudesAEnviar()

    '        EjecutarThread_DCAFIP()

    '        AplicarEstiloDeGrillas(DGV_listaComprobantes)
    '        AplicarEstiloDeGrillas(DGV_Observaciones)
    '    Catch ex As Exception
    '        MessageBox.Show(ex.Message + " Error capturado con Try Catch", "Factura Electrónica ML")
    '    End Try
    'End Sub





    'Private Sub btnActualizar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnActualizar.Click
    '    un_AdmFacturaElectronica = New AdmFacturaElectronica
    '    un_AdmFacturaElectronica.MostrarSoldesAEnviar()
    '    CargarGrillaSolicitudesAEnviar()

    '    If btn_procesar.Enabled = False And DGV_listaComprobantes.RowCount > 0 Then
    '        btn_procesar.Enabled = True
    '    End If

    '    If btn_procesar.Enabled = True And DGV_listaComprobantes.RowCount = 0 Then
    '        btn_procesar.Enabled = False
    '    End If

    'End Sub



    'Private Sub btnConsultarCbtes_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConsultarCbtes.Click
    '    Dim objFrmDatosCbte As New frmDatosCbte()
    '    objFrmDatosCbte.ShowDialog()
    'End Sub



    'Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
    '    Dim teclas As Boolean
    '    Select Case keyData
    '        Case 458819
    '            teclas = True
    '        Case Else
    '            teclas = False

    '    End Select
    '    If teclas = True Then
    '        Dim resultado As DialogResult = objFrmConfig.ShowDialog()
    '        If resultado = Windows.Forms.DialogResult.OK Then
    '            MsgBox("La aplicación se cerrará para guardar los cambios")

    '            objFrmConfig.GuardarConfiguracion()

    '            Me.Close()
    '        End If
    '        teclas = False
    '    End If


    'End Function


    'Public Sub EjecutarThread_DCAFIP()
    '    Try


    '        ' Creamos una variable del tipo Thread
    '        Dim mThreadFic As Thread

    '        ' Creamos una variable de la clase en la que está el Sub que se usará en el Thread
    '        Dim mProcesarFic As New HiloDC

    '        ' Asignamos el Sub que queremos usar al crear una nueva instancia de la clase del tipo Thread
    '        mThreadFic = New Thread(New ThreadStart(AddressOf mProcesarFic.Ejecutar_DcAfip))

    '        ' Para que se ejecute el Thread, hay que indicarselo de forma explícita
    '        mThreadFic.Start()
    '    Catch ex As Exception
    '        Throw ex
    '    End Try


    'End Sub

    'Private Sub DGV_listaComprobantes_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DGV_listaComprobantes.CellContentClick

    'End Sub



    ''<<Version 2.1.3>>
    'Private Sub DGV_listaComprobantes_SortCompare(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewSortCompareEventArgs) Handles DGV_listaComprobantes.SortCompare
    '    Dim a As DataGridViewColumn = CType(e.Column, DataGridViewColumn)
    '    Dim dgv As DataGridView = CType(sender, DataGridView)

    '    For Each col As DataGridViewColumn In dgv.Columns
    '        col.DefaultCellStyle.BackColor = Color.White
    '    Next
    '    a.DefaultCellStyle.BackColor = Color.FloralWhite

    '    If e.CellValue1 Is Nothing Or e.CellValue2 Is Nothing Then
    '        Exit Sub
    '    End If

    '    If IsNumeric(e.CellValue1.ToString) Then
    '        e.SortResult = DgvFunciones.ComparaNumeros(e)
    '        e.Handled = True
    '        Exit Sub
    '    End If

    '    If IsDate(e.CellValue1.ToString) Then
    '        e.SortResult = DgvFunciones.ComparaFechas(e)
    '        e.Handled = True
    '        Exit Sub
    '    End If








    'End Sub

   
End Class