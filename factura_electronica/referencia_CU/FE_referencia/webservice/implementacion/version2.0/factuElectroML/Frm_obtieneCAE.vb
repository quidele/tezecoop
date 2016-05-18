Imports System.Threading

Public Class Frm_obtieneCAE

    Dim un_AdmFacturaElectronica As AdmFacturaElectronica
    Dim un_comprobantes_mlDAO As Comprobantes_mlDAO
    Public objFrmConfig As New frmConfiguracion

    Private Sub DGV_comprobantes_CellDoubleClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DGV_listaComprobantes.CellDoubleClick
        btn_procesar_Click(sender, e)
    End Sub

    Private Sub btn_procesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click

        un_AdmFacturaElectronica = New AdmFacturaElectronica
        un_comprobantes_mlDAO = New Comprobantes_mlDAO
        Dim objProgressBar As New frm_progressbar
        If DGV_listaComprobantes.SelectedRows.Count = 0 Then Exit Sub

        Dim numeroCbte As Integer = CType(DGV_listaComprobantes.SelectedRows(0).Cells(3).Value.ToString, Integer)

        If MessageBox.Show("Ha solicitado el envío del comprobante N° " & numeroCbte.ToString & vbCrLf & _
                           "¿Está seguro de que desea enviar esa información a AFIP? ", "Confirmación de envío", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) = Windows.Forms.DialogResult.No Then
            Exit Sub
        End If
        Me.Enabled = False
        btn_procesar.Enabled = False
        objProgressBar.UseWaitCursor = True
        objProgressBar.MaximumSize = objProgressBar.Size
        objProgressBar.crearHilo()

        Dim idSolicitud As New Campo
        idSolicitud.valor = CType(DGV_listaComprobantes.SelectedRows(0).Cells(0).Value.ToString, Integer)
        idSolicitud.tipo = SQLAdapter.getTipoInteger

        Log.EscbribirLinea_Log("----------- INICIO -----------")
        Log.EscbribirLinea_Log("Comprobante N°: " + numeroCbte.ToString)
        Log.EscbribirLinea_Log("Id Solicitud: " + idSolicitud.valor.ToString)
        Log.EscbribirLinea_Log("Cliente: " + DGV_listaComprobantes.SelectedRows(0).Cells(1).Value.ToString)
        Log.EscbribirLinea_Log(ToolStripStatusLabel6.Text) 'Escribe el nombre del usuario
        Log.EscbribirLinea_Log("Nombre del equipo: " + My.Computer.Name)

        Log.EscbribirLinea_Log("Insertando comprobantes en Base FE")

        If Not un_comprobantes_mlDAO.InsertarComprobantesMLFE(idSolicitud) Then
            objProgressBar.paraHilo()
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
            MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        CargarGrillaObservaciones(idSolicitud) '<--- Actualiza la grilla de observaciones
        Log.EscbribirLinea_Log("Chequeando resultados de FE")
        ' Me.ToolStripStatusLabel7.Text = "Chequeando resultados de FE"
        If un_comprobantes_mlDAO.un_resultadoSP.resultado.ToString <> "OK" Then
            objProgressBar.paraHilo()
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)
            MsgBox(un_comprobantes_mlDAO.error, MsgBoxStyle.Information, "ERROR: Solicitud  de CAE")
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Obtener Comprobantes")
        ' Me.ToolStripStatusLabel7.Text = "Obtener Comprobantes"
        If Not un_comprobantes_mlDAO.ObtenerComprobante(idSolicitud) Then
            objProgressBar.paraHilo()
            Log.EscbribirLinea_Log(un_comprobantes_mlDAO.error)

            MessageBox.Show(un_comprobantes_mlDAO.error, "ERROR: Solicitud de CAE", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Me.Enabled = True
            btn_procesar.Enabled = True
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Iniciando el proceso de solicitud de CAE")
        'Me.ToolStripStatusLabel7.Text = "Solicitando CAE a AFIP"
        If Not un_AdmFacturaElectronica.solicitarCAE(un_comprobantes_mlDAO.ComprobanteBuscado, Me) Then
            Log.EscbribirLinea_Log(un_AdmFacturaElectronica.error)
            objProgressBar.paraHilo()

            MessageBox.Show(un_AdmFacturaElectronica.error, "ERROR: Solicitud de CAE", MessageBoxButtons.OK, MessageBoxIcon.Information)
            CargarGrillaObservaciones(idSolicitud)
            CargarGrillaSolicitudesAEnviar()
            Me.Enabled = True
            btn_procesar.Enabled = True
            Me.BringToFront()
            Exit Sub
        End If
        Log.EscbribirLinea_Log("Obtención de CAE exitosa")
        'Me.ToolStripStatusLabel7.Text = "Obtención de CAE exitosa"
        objProgressBar.paraHilo()
        Log.EscbribirLinea_Log("La operación finalizó correctamente")
        MessageBox.Show("La operación finalizó correctamente.", "Operación finalizada", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Me.Enabled = True
        btn_procesar.Enabled = True
        CargarGrillaSolicitudesAEnviar()
        CargarGrillaObservaciones(idSolicitud)

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

    End Sub

    Private Sub Frm_obtieneCAE_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        AdmConexiones.abrirConexionFE()

        Me.ToolStripStatusLabel7.Text = "Modo: " + Configuration.ConfigurationManager.AppSettings("MODO_OPERACION").ToString
        Me.ToolStripStatusLabel5.Text = "Base Magma: " + AdmConexiones.nombre_SQLDatabase + " Version: " + Application.ProductVersion
        Me.ToolStripStatusLabel6.Text = "Usuario: " + seguridad.obtenerUID_Magma
        Me.BringToFront()

        Me.TopLevel = True

        Me.Text = "Factura Electrónica - Mercado local - WebService"


        Try

            un_AdmFacturaElectronica = New AdmFacturaElectronica


            If Not un_AdmFacturaElectronica.MostrarSoldesAEnviar() Then
                MessageBox.Show(un_AdmFacturaElectronica.error, "Factura Electrónica ML")
                Me.btn_procesar.Enabled = False
            End If

            CargarGrillaSolicitudesAEnviar()

            EjecutarThread_DCAFIP()


        Catch ex As Exception
            MessageBox.Show(ex.Message + " Error capturado con Try Catch", "Factura Electrónica ML")
        End Try
    End Sub

 

    
  
    Private Sub btnActualizar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnActualizar.Click
        un_AdmFacturaElectronica = New AdmFacturaElectronica
        un_AdmFacturaElectronica.MostrarSoldesAEnviar()
        CargarGrillaSolicitudesAEnviar()

        If btn_procesar.Enabled = False And DGV_listaComprobantes.RowCount > 0 Then
            btn_procesar.Enabled = True
        End If

        If btn_procesar.Enabled = True And DGV_listaComprobantes.RowCount = 0 Then
            btn_procesar.Enabled = False
        End If

    End Sub

    
   
    Private Sub btnConsultarCbtes_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConsultarCbtes.Click
        Dim objFrmDatosCbte As New frmDatosCbte()
        objFrmDatosCbte.ShowDialog()


    End Sub

    
    
    Protected Overrides Function ProcessCmdKey(ByRef msg As System.Windows.Forms.Message, ByVal keyData As System.Windows.Forms.Keys) As Boolean
        Dim teclas As Boolean
        Select Case keyData
            Case 458819
                teclas = True
            Case Else
                teclas = False

        End Select
        If teclas = True Then
            Dim resultado As DialogResult = objFrmConfig.ShowDialog()
            If resultado = Windows.Forms.DialogResult.OK Then
                MsgBox("La aplicación se cerrará para guardar los cambios")

                objFrmConfig.GuardarConfiguracion()

                Me.Close()
            End If
            teclas = False
        End If


    End Function


    Public Sub EjecutarThread_DCAFIP()
        Try

        
            ' Creamos una variable del tipo Thread
            Dim mThreadFic As Thread

            ' Creamos una variable de la clase en la que está el Sub que se usará en el Thread
            Dim mProcesarFic As New HiloDC

            ' Asignamos el Sub que queremos usar al crear una nueva instancia de la clase del tipo Thread
            mThreadFic = New Thread(New ThreadStart(AddressOf mProcesarFic.Ejecutar_DcAfip))

            ' Para que se ejecute el Thread, hay que indicarselo de forma explícita
            mThreadFic.Start()
        Catch ex As Exception
            Throw ex
        End Try


    End Sub
  
End Class