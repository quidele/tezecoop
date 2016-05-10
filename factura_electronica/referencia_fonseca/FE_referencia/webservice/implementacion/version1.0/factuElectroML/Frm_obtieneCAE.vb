

Public Class Frm_obtieneCAE

    Dim un_AdmFacturaElectronica As AdmFacturaElectronica
    Dim un_comprobantes_mlDAO As Comprobantes_mlDAO

    Private Sub DGV_comprobantes_DobleClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DGV_listaComprobantes.DoubleClick
        btn_procesar_Click(sender, e)
    End Sub

    Private Sub btn_procesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click

        un_AdmFacturaElectronica = New AdmFacturaElectronica
        un_comprobantes_mlDAO = New Comprobantes_mlDAO

        If DGV_listaComprobantes.SelectedRows.Count = 0 Then Exit Sub

        Dim numero As Integer = CType(DGV_listaComprobantes.SelectedRows(0).Cells(0).Value.ToString, Integer)

        If MessageBox.Show("Ha solicitado el envío del comprobante N° " & numero.ToString & vbCrLf & _
                           "¿Está seguro de que desea enviar esa información a AFIP? ", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) = Windows.Forms.DialogResult.No Then
            Exit Sub
        End If
        Me.Enabled = False
        btn_procesar.Enabled = False
        frm_progressbar.UseWaitCursor = True
        frm_progressbar.MaximumSize = frm_progressbar.Size
        frm_progressbar.crearHilo()


        Dim idSolicitud As New Campo
        Log.EscbribirLinea_Log("----------- INICIO -----------")
        Log.EscbribirLinea_Log(numero.ToString)
        Log.EscbribirLinea_Log(DGV_listaComprobantes.SelectedRows(0).Cells(1).Value.ToString)
        Log.EscbribirLinea_Log(ToolStripStatusLabel6.Text) 'Escribe el nombre del usuario
        Log.EscbribirLinea_Log("Nombre del equipo: " + My.Computer.Name)
        idSolicitud.valor = numero
        idSolicitud.tipo = SQLAdapter.getTipoInteger

        Log.EscbribirLinea_Log("Insertando comprobantes en FE")
        Me.ToolStripStatusLabel7.Text = "Insertando comprobantes en FE"
        If Not un_comprobantes_mlDAO.InsertarComprobantesMLFE(idSolicitud) Then
            frm_progressbar.abortar = True
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
            MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        CargarGrillaObservaciones(idSolicitud) '<--- Actualiza la grilla de observaciones
        Log.EscbribirLinea_Log("Chequeando resultados de FE")
        Me.ToolStripStatusLabel7.Text = "Chequeando resultados de FE"
        If un_comprobantes_mlDAO.un_resultadoSP.resultado.ToString <> "OK" Then
            frm_progressbar.abortar = True
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
            MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Obtener Comprobantes")
        Me.ToolStripStatusLabel7.Text = "Obtener Comprobantes"
        If Not un_comprobantes_mlDAO.ObtenerComprobante(idSolicitud) Then
            frm_progressbar.abortar = True
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
            MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")

            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Solicitando CAE a AFIP")
        Me.ToolStripStatusLabel7.Text = "Solicitando CAE a AFIP"
        If Not un_AdmFacturaElectronica.solicitarCAE(un_comprobantes_mlDAO.ComprobanteBuscado, Me) Then
            Log.EscbribirLinea_Log(un_AdmFacturaElectronica.error)
            frm_progressbar.paraHilo()
            MsgBox(un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
            CargarGrillaObservaciones(idSolicitud)
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Obtención de CAE exitosa")
        Me.ToolStripStatusLabel7.Text = "Obtención de CAE exitosa"
        frm_progressbar.paraHilo()
        Log.EscbribirLinea_Log("La operación finalizó correctamente")
        MessageBox.Show("La operación finalizó correctamente.", "Operación finalizada", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Me.Enabled = True
        btn_procesar.Enabled = True
        CargarGrillaSolicitudesAEnviar()
        CargarGrillaObservaciones(idSolicitud)
        Me.ToolStripStatusLabel7.Text = ""

        Me.BringToFront()
    End Sub




    Private Sub CargarGrillaObservaciones(ByVal idSolicitud As Campo)
        DGV_Observaciones.Rows.Clear()
        Dim una_observacionDAO As New ObservacionesDAO()
        una_observacionDAO.obtenerObservaciones(idSolicitud)
        Log.EscbribirLinea_Log("Observaciones: ")
        For Each una_observacion As Observaciones In una_observacionDAO.listaObservaciones
            DGV_Observaciones.Rows.Add(una_observacion.Code, una_observacion.Msg)
            Log.EscbribirLinea_Log(una_observacion.Code.ToString + " " + una_observacion.Msg.ToString)
        Next
        With Me.DGV_Observaciones
            .AutoResizeColumns()
            .Columns(1).AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            .AllowUserToResizeColumns = False
            .AllowUserToResizeRows = False
        End With
    End Sub

    Private Sub CargarGrillaSolicitudesAEnviar() '-- Carga la grilla con la info de las solicitudes procesadas.

        DGV_listaComprobantes.Rows.Clear()


        un_AdmFacturaElectronica.MostrarSoldesAEnviar()

        For Each una_Solicitud As SolicitudML In un_AdmFacturaElectronica.listaSolicitudesAEnviar

            DGV_listaComprobantes.Rows.Add(una_Solicitud.idsolicitud, _
                                            una_Solicitud.nom_tit, _
                                            una_Solicitud.serie_doc, _
                                            una_Solicitud.nro_doc, _
                                            una_Solicitud.imp_tot_mo, _
                                            una_Solicitud.estado_envio)

        Next

        With Me.DGV_listaComprobantes
            .RowHeadersVisible = False
            '            .AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
            '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells
            .AutoResizeColumns()
            .AllowUserToResizeRows = False
        End With
        Me.ToolStripStatusLabel7.Text = ""
    End Sub

    Private Sub Frm_obtieneCAE_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        un_AdmFacturaElectronica = New AdmFacturaElectronica
        un_AdmFacturaElectronica.MostrarSoldesAEnviar()
        CargarGrillaSolicitudesAEnviar()
        AdmConexiones.abrirConexionFE()
        Me.ToolStripStatusLabel7.Text = ""
        Me.ToolStripStatusLabel5.Text = "Base Magma: " + AdmConexiones.nombre_SQLDatabase + " version: " + Application.ProductVersion
        Me.ToolStripStatusLabel6.Text = "Usuario: " + seguridad.obtenerUID_Magma
        Me.BringToFront()
    End Sub

 

    
  
    Private Sub btnActualizar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnActualizar.Click
        un_AdmFacturaElectronica = New AdmFacturaElectronica
        un_AdmFacturaElectronica.MostrarSoldesAEnviar()
        CargarGrillaSolicitudesAEnviar()
        Me.ToolStripStatusLabel7.Text = ""

    End Sub

    
   
End Class