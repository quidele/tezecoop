Imports fonseca_libDatos


Public Class Frm_ObtieneCAE_EX
    'Dim un_AdmFacturaElectronica As AdmFacturaElectronica
    'Dim un_v_comprobantes_exDAO As v_Comprobantes_EXDAO
    'Public objFrmConfig As New frmConfiguracion

    'Private Sub DGV_comprobantes_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DGV_listaComprobantes.CellDoubleClick
    '    btn_procesar_Click(sender, e)

    'End Sub

    'Private Sub btn_procesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click

    '    Dim numeroCbte As Integer = CType(DGV_listaComprobantes.SelectedRows(0).Cells(2).Value.ToString, Integer)
    '    Dim idSolicitud As New Campo

    '    idSolicitud.Valor = CType(DGV_listaComprobantes.SelectedRows(0).Cells(1).Value.ToString, Integer)
    '    idSolicitud.Tipo = SQLAdapter.getTipoInteger
    '    un_v_comprobantes_exDAO = New v_Comprobantes_EXDAO

    '    Dim objProgressBar As New frm_progressbar
    '    If DGV_listaComprobantes.SelectedRows.Count = 0 Then Exit Sub

    '    REM si responde negativamente a la pregunta sale del metodo
    '    If MessageBox.Show("Ha solicitado el envío del comprobante N° " & numeroCbte.ToString & vbCrLf & _
    '                       "¿Está seguro de que desea enviar esa información a AFIP? ", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) = Windows.Forms.DialogResult.No Then
    '        Exit Sub
    '    End If

    '    Me.Enabled = False
    '    btn_procesar.Enabled = False
    '    objProgressBar.UseWaitCursor = True
    '    objProgressBar.MaximumSize = objProgressBar.Size
    '    objProgressBar.crearHilo()

    '    System.Diagnostics.Log.EscbribirLinea_Log("----------- INICIO -----------")
    '    System.Diagnostics.Log.EscbribirLinea_Log(numeroCbte.ToString)
    '    System.Diagnostics.Log.EscbribirLinea_Log(DGV_listaComprobantes.SelectedRows(0).Cells(1).Value.ToString)
    '    System.Diagnostics.Log.EscbribirLinea_Log(ToolStripStatusLabel1.Text) 'Escribe el nombre del usuario
    '    System.Diagnostics.Log.EscbribirLinea_Log("Nombre del equipo: " + My.Computer.Name)


    '    System.Diagnostics.Log.EscbribirLinea_Log("Insertando comprobantes en FE")
    '    'Me.ToolStripStatusLabel3.Text = "Insertando comprobantes en FE"
    '    If Not un_v_comprobantes_exDAO.InsertarComprobantesEXFE(idSolicitud) Then
    '        objProgressBar.paraHilo()
    '        Me.Visible = True
    '        System.Diagnostics.Log.EscbribirLinea_Log(un_v_comprobantes_exDAO.error)
    '        MsgBox(un_v_comprobantes_exDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        'Me.ToolStripStatusLabel3.Text = ""

    '        Exit Sub
    '    End If

    '    CargarGrillaObservaciones(idSolicitud) '<--- Actualiza la grilla de observaciones

    '    System.Diagnostics.Log.EscbribirLinea_Log("Chequeando resultados de FE")

    '    'Me.ToolStripStatusLabel3.Text = "Chequeando resultados de FE"

    '    If un_v_comprobantes_exDAO.un_resultadoSP.resultado.ToString <> "OK" Then
    '        objProgressBar.paraHilo()
    '        'Application.DoEvents()
    '        'Me.TopMost = True
    '        'Me.Show()
    '        'Application.DoEvents()
    '        System.Diagnostics.Log.EscbribirLinea_Log(un_v_comprobantes_exDAO.error)
    '        MsgBox(un_v_comprobantes_exDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        'Me.ToolStripStatusLabel3.Text = ""
    '        Exit Sub
    '    End If


    '    System.Diagnostics.Log.EscbribirLinea_Log("Obtener Comprobantes")
    '    'Me.ToolStripStatusLabel3.Text = "Obtener Comprobantes"
    '    If Not un_v_comprobantes_exDAO.obtenerV_Comprobantes_EX(idSolicitud) Then
    '        objProgressBar.paraHilo()
    '        System.Diagnostics.Log.EscbribirLinea_Log(un_v_comprobantes_exDAO.error)
    '        MsgBox(un_v_comprobantes_exDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")

    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Exit Sub
    '    End If


    '    System.Diagnostics.Log.EscbribirLinea_Log("Solicitando CAE a AFIP")
    '    'Me.ToolStripStatusLabel3.Text = "Solicitando CAE a AFIP"
    '    If Not un_AdmFacturaElectronica.solicitarCAE_ex(un_v_comprobantes_exDAO.v_Comprobantes_EXBuscado, Me) Then
    '        System.Diagnostics.Log.EscbribirLinea_Log(un_AdmFacturaElectronica.error)
    '        objProgressBar.paraHilo()
    '        MsgBox(un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
    '        CargarGrillaObservaciones(idSolicitud)
    '        Me.Enabled = True
    '        btn_procesar.Enabled = True
    '        Exit Sub
    '    End If

    '    System.Diagnostics.Log.EscbribirLinea_Log("Obtención de CAE exitosa")
    '    objProgressBar.paraHilo()
    '    MessageBox.Show("La operación finalizó correctamente.", "Operación finalizada", MessageBoxButtons.OK, MessageBoxIcon.Information)
    '    Me.Enabled = True
    '    btn_procesar.Enabled = True
    '    btnActualizar_Click(sender, e)
    '    CargarGrillaObservaciones(idSolicitud)
    'End Sub

    'Private Sub Frm_ObtieneCAE_EX_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    '    un_AdmFacturaElectronica = New AdmFacturaElectronica
    '    un_AdmFacturaElectronica.MostrarSoldesAEnviarEx()

    '    CargarGrillaSolicitudesAEnviar()

    '    AdmConexiones.AbrirConexionFE()

    '    Me.ToolStripStatusLabel3.Text = "Modo: " + Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString
    '    Me.ToolStripStatusLabel2.Text = "Base Magma: " + AdmConexiones.nombre_SQLDatabase + " version: " + Application.ProductVersion
    '    Me.ToolStripStatusLabel1.Text = "Usuario: " + Seguridad.obtenerUID_Magma
    '    Me.BringToFront()
    '    Me.Text = "Factura Electrónica - Exportación - WebService"

    '    Me.TopLevel = True

    '    Try

    '        un_AdmFacturaElectronica = New AdmFacturaElectronica


    '        If Not un_AdmFacturaElectronica.MostrarSoldesAEnviarEx() Then
    '            MessageBox.Show(un_AdmFacturaElectronica.error, "Factura Electrónica EX")
    '            Me.btn_procesar.Enabled = False
    '        End If

    '        CargarGrillaSolicitudesAEnviar()


    '    Catch ex As Exception
    '        MessageBox.Show(ex.Message + " Error capturado con Try Catch", "Factura Electrónica EX")
    '    End Try

    'End Sub

    'Private Sub CargarGrillaSolicitudesAEnviar()
    '    DGV_listaComprobantes.Rows.Clear()


    '    un_AdmFacturaElectronica.MostrarSoldesAEnviarEx()

    '    For Each una_Solicitud As SolicitudEX In un_AdmFacturaElectronica.listaSolicitudesAEnviar

    '        DGV_listaComprobantes.Rows.Add(una_Solicitud.cod_doc, _
    '                                        una_Solicitud.nro_trans, _
    '                                        una_Solicitud.nro_doc, _
    '                                        una_Solicitud.serie_doc, _
    '                                        una_Solicitud.nom_tit, _
    '                                        una_Solicitud.imp_tot_mo, _
    '                                        una_Solicitud.estado_envio)

    '    Next

    '    With Me.DGV_listaComprobantes
    '        .RowHeadersVisible = False
    '        '            .AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
    '        '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells
    '        .AutoResizeColumns()
    '        .AllowUserToResizeRows = False
    '    End With

    'End Sub

    'Private Sub CargarGrillaObservaciones(ByVal idSolicitud As Campo)
    '    DGV_Observaciones.Rows.Clear()
    '    Dim una_observacionDAO As New ObservacionesDAO()
    '    una_observacionDAO.obtenerObservaciones(idSolicitud)
    '    System.Diagnostics.Log.EscbribirLinea_Log("Observaciones: ")
    '    For Each una_observacion As Observaciones In una_observacionDAO.listaObservaciones
    '        DGV_Observaciones.Rows.Add(una_observacion.code, una_observacion.msg)
    '        System.Diagnostics.Log.EscbribirLinea_Log(una_observacion.code.ToString + " " + una_observacion.msg.ToString)
    '    Next
    '    With Me.DGV_Observaciones
    '        .AutoResizeColumns()
    '        .Columns(1).AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
    '        .AllowUserToResizeColumns = False
    '        .AllowUserToResizeRows = False
    '    End With
    'End Sub

    'Private Sub btnActualizar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnActualizar.Click
    '    un_AdmFacturaElectronica = New AdmFacturaElectronica
    '    un_AdmFacturaElectronica.MostrarSoldesAEnviarEx()
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


End Class




