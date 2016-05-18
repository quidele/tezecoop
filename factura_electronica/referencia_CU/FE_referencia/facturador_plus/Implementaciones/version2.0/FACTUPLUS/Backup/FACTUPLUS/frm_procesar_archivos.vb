Imports fonseca_libDatos
Imports System.IO


Public Class frm_procesar_archivos

    Enum modos_factuplus As Integer
        envio
        recepcion
    End Enum

    Public Enum modos_generar As Integer
        real
        simulacion
    End Enum

    Public una_lista_comprobantes_seleccionados As New ArrayList

    Dim modo_factuplus As modos_factuplus
    Dim modo_generar As New modos_generar
    Dim un_AdmFacturaElectronica As New AdmFacturaElectronica
    Dim un_lote As New lote
    Dim un_loteDAO As New loteDAO
    Dim una_simulacion As New Simulacion
    Dim una_simulacionDAO As New SimulacionDAO

    Dim un_comprobante As New Comprobante
    Dim un_comprobanteDAO As New ComprobanteDAO
    Dim un_comprobante_seleccionado As New Comprobante
    Dim un_comprobanteDAO_seleccionado As New ComprobanteDAO


    Dim Fecha As System.DateTime
    Dim FechaPicker As System.DateTime
    Dim NroLote As New loteDAO
    Dim fec As String
    Dim Documento, Numero As String

    Private Sub abrir_archivo()


        With Me.ofd_abrir_archvo
            '.InitialDirectory = Application.StartupPath
            .InitialDirectory = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados"
            'With statement is used to execute statements using a particular object, here,_
            'OpenFileDialog1
            .Filter = "Text files (*.xml)|*.xml|" & "All files|*.*"
            'setting filters so that Text files and All Files choice appears in the Files of Type box
            'in the dialog
            If .ShowDialog() = DialogResult.OK Then
                Me.txtArchivo.Text = .FileName
            End If
            'showDialog method makes the dialog box visible at run time


        End With

    End Sub

    Private Sub guardar_archivo()

        With Me.sfd_guardar_archivo
            '.InitialDirectory = Application.StartupPath
            .InitialDirectory = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados"

            'With statement is used to execute statements using a particular object, here,_
            'OpenFileDialog1
            .Filter = "Text files (*.xml)|*.xml|" & "All files|*.*"
            'setting filters so that Text files and All Files choice appears in the Files of Type box
            'in the dialog
            If .ShowDialog() = DialogResult.OK Then
                Me.txtArchivo.Text = .FileName
            End If
            'showDialog method makes the dialog box visible at run time

        End With

    End Sub


    Private Sub AplicarEstiloDeGrillas(ByVal dgv As DataGridView)
        Dim cs As New System.Windows.Forms.DataGridViewCellStyle
        cs.BackColor = Color.LightBlue
        With dgv

            '.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill
            '.BackgroundColor = Color.FloralWhite
            '.BackgroundColor = Color.LightSteelBlue
            .GridColor = Color.DarkBlue
            .AlternatingRowsDefaultCellStyle = cs

            .CellBorderStyle = DataGridViewCellBorderStyle.Single
        End With

    End Sub


    Private Sub frm_procesar_archivos_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Dim nombre_ejecutable As String
        'Empezamos el log
        Log.StartLog()
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Dim objSeguridad As New seguridad()
        Dim resultado As DialogResult

        If Not Directory.Exists(My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados") Then
            Directory.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados")
        End If

        Me.Icon = My.Resources.Factuplus

        DateTimePicker1().Value = Today

        If Not objSeguridad.esAccesoValido() Then
            MsgBox(objSeguridad.Error + ".", MsgBoxStyle.Critical, "Acceso al Sistema - Fosenca Gestión - Recepciones ... ")
            Application.Exit()
        End If

        modo_generar = modos_generar.real
        objAdmConexiones.AbrirConexionFE()


        'Si está implementado obtenemos la version del servidor. Sino obtenemos la version de la aplicacion.
        Me.lblBaseDatos.Text = "Base Magma: " + objAdmConexiones.GetNombre_SQLDatabase
        If My.Application.IsNetworkDeployed Then
            lblVersion.Text = "Versión: " + My.Application.Deployment.CurrentVersion.ToString()
        Else
            lblVersion.Text = "Versión: " + Application.ProductVersion
        End If
        Me.lblEstado.Text = "Usuario: " + objSeguridad.obtenerUID_Magma


        'nombre_ejecutable = GUIUtilitarios.obtenerNombreEjecutable(Application.ExecutablePath)


        Dim objFrm_seleccionModo As New frm_seleccionModo(Me)
        resultado = objFrm_seleccionModo.ShowDialog()

        If resultado = Windows.Forms.DialogResult.OK Then
            If objFrm_seleccionModo.ModoElegido = "Factuplus_envio" Then
                modo_factuplus = modos_factuplus.envio
                AplicarEstiloDeGrillas(DGV_ComprobantesAEnviar)
            ElseIf objFrm_seleccionModo.ModoElegido = "Factuplus_recepcion" Then
                modo_factuplus = modos_factuplus.recepcion
                AplicarEstiloDeGrillas(DGV_listaComprobantes)
            Else
                Me.Close()
                Exit Sub
            End If
        Else
            Me.Close()
            Exit Sub
        End If

        'If nombre_ejecutable.ToString.ToUpper = "Factuplus_envio.exe".ToUpper Then
        '    modo_factuplus = modos_factuplus.envio
        'Else
        '    modo_factuplus = modos_factuplus.recepcion
        'End If

        Select Case modo_factuplus
            Case modos_factuplus.envio
                InicioPantallaEnv()
                If un_AdmFacturaElectronica.MostrarCptesAEnviar Then
                    CargarGrillaComprobantesAEnviar()
                End If
                RecorridoGrillaInicial() '--NO BORRA EN FORMA PREDETERMINADA UN COMPROBANTE YA ENVIADO
            Case modos_factuplus.recepcion
                'Me.txtArchivo.Text = Application.StartupPath
                Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop
                InicioPantallaRec()
        End Select
    End Sub

    Private Sub InicioPantallaEnv()
        'If modo_generar = modos_generar.real Then
        un_lote.lote = un_loteDAO.obtenerproximoLote() 'Un_lote.lote guarda el lote completo
        'End If
        un_lote.fecha.Valor = Date.Today
        un_lote.fecha.Tipo = SQLAdapter.getTipoDateTime
        Me.grb_envio_recep_comprobantes.Text = "Envio de Archivo"
        fec = un_lote.fecha.Valor.ToString.Replace("/", "-")
        fec = Mid(fec, 1, 10)

        'Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + "_L_" + un_lote.lote.Valor + ".xml"
        Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados\Envio_" + fec + "_L_" + un_lote.lote.Valor + ".xml"

        Me.DGV_listaComprobantes.Visible = False
        Me.DGV_ComprobantesAEnviar.Visible = True
        Label1.Text = "Comprobantes a Enviar:"
        Me.btn_procesar.Enabled = True : Me.Btn_Procesar_Simu.Enabled = True
    End Sub

    Private Sub ReInicioPantallaEnv() '-- Reinicio con muestra de resultados
        un_lote.lote = un_loteDAO.obtenerproximoLote() 'Un_lote.lote guarda el lote completo
        un_lote.fecha.Valor = Date.Today
        'un_lote.fecha.tipo = SQLAdapter.getTipoDateTime
        Me.grb_envio_recep_comprobantes.Text = "Envio de Archivo"
        fec = un_lote.fecha.Valor.ToString.Replace("/", "-")
        fec = Mid(fec, 1, 10)
        'Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + "_L_" + un_lote.lote.valor + ".xml"
        Me.DGV_listaComprobantes.Visible = True
        Me.DGV_ComprobantesAEnviar.Visible = False
        Label1.Text = "Resultado / Errores "
        Me.btn_procesar.Enabled = False : Me.Btn_Procesar_Simu.Enabled = False
        If modo_generar = modos_generar.real Then
            Me.DGV_ComprobantesAEnviar.Rows.Clear()
        End If
    End Sub

    Private Sub InicioPantallaRec()
        Me.grb_envio_recep_comprobantes.Text = "Recepción de Archivo"
        Me.btn_procesar.Text = "Recibir"
        Me.Btn_Procesar_Simu.Text = "Recibir Simulación"
        'Me.Btn_Procesar_Simu.Visible = False
        Me.DGV_ComprobantesAEnviar.Visible = False
        Me.DateTimePicker1.Visible = False : Label3.Visible = False
    End Sub

    Private Sub btn_busca_archivo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_busca_archivo.Click

        Select Case modo_factuplus
            Case modos_factuplus.envio
                guardar_archivo()
            Case modos_factuplus.recepcion
                abrir_archivo()
        End Select

    End Sub

    Private Sub btn_procesar_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click
        Dim un_xmlUtils As New XmlUtils
        modo_generar = modos_generar.real

        Select Case modo_factuplus
            Case modos_factuplus.envio
                If MsgBox("¿Confirma el envío?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Facturar Plus - Envío") = MsgBoxResult.No Then
                    Exit Sub
                End If
                Me.ArmaInicioEnv()
                If una_lista_comprobantes_seleccionados.Count = 0 Then
                    MsgBox("Debe seleccionar los comprobantes a enviar.", MsgBoxStyle.Information, "Atención")
                    Exit Sub
                End If
                btn_procesar.Enabled = False
                Btn_Procesar_Simu.Enabled = False
                'Me.txtArchivo.Text.Replace("_Simu.xml", ".xml")
                If IO.File.Exists(Me.txtArchivo.Text) Then
                    If MsgBox("El archivo ya existe, ¿Desea sobreescribirlo?.", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Atención") = MsgBoxResult.No Then
                        Me.txtArchivo.Focus()
                        btn_procesar.Enabled = True
                        Btn_Procesar_Simu.Enabled = True
                        Exit Sub
                    Else
                        IO.File.Delete(Me.txtArchivo.Text) '-- Eliminamos si desea sobreescribirlo
                    End If
                End If
                If Not IO.Path.HasExtension(Me.txtArchivo.Text) Then
                    MsgBox("El nombre archivo no es válido" + vbCrLf + "Ingrese correctamente el nombre del archivo.", MsgBoxStyle.Information, "Atención")
                    Me.txtArchivo.Focus()
                    btn_procesar.Enabled = True
                    Btn_Procesar_Simu.Enabled = True
                    Exit Sub
                End If
                un_AdmFacturaElectronica.lote = un_lote
                un_AdmFacturaElectronica.listaComprobantesAEnviar = una_lista_comprobantes_seleccionados

                If Not un_AdmFacturaElectronica.generarArchivodeEnviar(Me.txtArchivo.Text, modo_generar, Fecha) Then
                    cargarResultadosProceso()
                    MsgBox("Error: " + un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "Atención")
                    If IO.File.Exists(Me.txtArchivo.Text) Then
                        IO.File.Delete(Me.txtArchivo.Text)
                    End If
                Else
                    cargarResultadosProceso()
                    MsgBox("El archivo ha sido generado con éxito." + vbCrLf + "Nombre de Archivo: " + Me.txtArchivo.Text, MsgBoxStyle.Information, "Atención")
                End If
                ReInicioPantallaEnv()
                If un_AdmFacturaElectronica.MostrarCptesAEnviar Then
                    CargarGrillaComprobantesAEnviar()
                End If
            Case modos_factuplus.recepcion
                If MsgBox("¿Confirma la recepción?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Facturar Plus - Recepción") = MsgBoxResult.No Then
                    Exit Sub
                End If
                btn_procesar.Enabled = False
                Btn_Procesar_Simu.Enabled = False
                If Not IO.File.Exists(Me.txtArchivo.Text) Then
                    MsgBox("El archivo no existe, verifique el nombre ingresado.", MsgBoxStyle.Information, "Atención")
                    Me.txtArchivo.Focus()
                    btn_procesar.Enabled = True
                    Btn_Procesar_Simu.Enabled = True
                    Exit Sub
                End If
                If Not un_AdmFacturaElectronica.procesarArchivoRecibido(Me.txtArchivo.Text, Fecha) Then
                    cargarResultadosProceso()
                    MsgBox("Error al procesar el archivo xml " + un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "Atención")
                Else
                    cargarResultadosProceso()
                    MsgBox("El archivo ha sido procesado con éxito.", MsgBoxStyle.Information, "Atención")
                End If
                'btn_procesar.Enabled = True
                'Btn_Procesar_Simu.Enabled = True
        End Select

    End Sub

    Private Sub Btn_Procesar_Simu_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Procesar_Simu.Click

        Dim un_xmlUtils As New XmlUtils
        modo_generar = modos_generar.simulacion
        FechaPicker = DateTimePicker1.Value.AddDays(5)

        'una_simulacion.nro_simu = una_simulacionDAO.obtenerproximaSimulacion() 'Obtengo el nro una sola vez
        Select Case modo_factuplus
            Case modos_factuplus.envio
                'Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + "_L_" + un_lote.lote.valor + "_SIMU.xml"
                If MsgBox("¿Confirma el envío de la simulación?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Facturar Plus - Envío") = MsgBoxResult.No Then
                    Exit Sub
                End If
                Me.ArmaInicioEnv()
                If una_lista_comprobantes_seleccionados.Count = 0 Then
                    MsgBox("Debe seleccionar los comprobantes a enviar.", MsgBoxStyle.Information, "Atención")
                    Exit Sub
                End If
                btn_procesar.Enabled = False
                Btn_Procesar_Simu.Enabled = False
                If IO.File.Exists(Me.txtArchivo.Text) Then
                    IO.File.Delete(Me.txtArchivo.Text) '-- Eliminamos para que no tenga en regenerar el archivo con el mismo nombre ya que es simulación
                End If
                If Not IO.Path.HasExtension(Me.txtArchivo.Text) Then
                    MsgBox("El nombre archivo no es válido" + vbCrLf + "Ingrese correctamente el nombre del archivo.", MsgBoxStyle.Information, "Atención")
                    Me.txtArchivo.Focus()
                    btn_procesar.Enabled = True
                    Btn_Procesar_Simu.Enabled = True
                    Exit Sub
                End If
                un_AdmFacturaElectronica.lote = un_lote
                un_AdmFacturaElectronica.listaComprobantesAEnviar = una_lista_comprobantes_seleccionados '-- Se pasa la lista directamente a el objeto receptor incluido en un_AdmFacturaElectronica 
                If Not un_AdmFacturaElectronica.generarArchivodeEnviar(Me.txtArchivo.Text, modo_generar, FechaPicker) Then
                    cargarResultadosProceso()
                    MsgBox("Error: " + un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "Atención")
                    If IO.File.Exists(Me.txtArchivo.Text) Then
                        IO.File.Delete(Me.txtArchivo.Text)
                    End If
                    ReInicioPantallaEnv()
                Else
                    cargarResultadosProceso()
                    MsgBox("El archivo de simulación ha sido generado con éxito." + vbCrLf + "Nombre de Archivo: " + Me.txtArchivo.Text, MsgBoxStyle.Information, "Atención")
                    ReInicioPantallaEnv()
                End If
            Case modos_factuplus.recepcion
                If MsgBox("¿Confirma la recepción de la simulación?", MsgBoxStyle.Question + MsgBoxStyle.YesNo, "Facturar Plus - Recepción") = MsgBoxResult.No Then
                    Exit Sub
                End If
                btn_procesar.Enabled = False
                Btn_Procesar_Simu.Enabled = False
                If Not IO.File.Exists(Me.txtArchivo.Text) Then
                    MsgBox("El archivo no existe, verifique el nombre ingresado.", MsgBoxStyle.Information, "Atención")
                    Me.txtArchivo.Focus()
                    btn_procesar.Enabled = True
                    Btn_Procesar_Simu.Enabled = True
                    Exit Sub
                End If
                If Not un_AdmFacturaElectronica.procesarArchivoRecibido(Me.txtArchivo.Text, FechaPicker) Then
                    cargarResultadosProceso()
                    MsgBox("Error al procesar el archivo xml " + un_AdmFacturaElectronica.error, MsgBoxStyle.Information, "Atención")
                Else
                    Me.DGV_listaComprobantes.Visible = True
                    Me.DGV_ComprobantesAEnviar.Visible = False
                    cargarResultadosProceso()
                    MsgBox("El archivo de simulación ha sido procesado con éxito.", MsgBoxStyle.Information, "Atención")
                    InicioPantallaRec()
                End If
        End Select

    End Sub

    Private Sub ArmaInicioEnv()
        RecorrerGrillaComprobantesAEnviar() '(un_comprobante)
        For Each compro As Comprobante In una_lista_comprobantes_seleccionados '-- Siempre habrá sólo 1 pero contempla n
            Documento = "_" + compro.cod_doc.Valor
            Numero = "-" + compro.nro_doc.Valor.ToString
        Next
        If modo_generar = modos_generar.real Then
            'Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + Documento + Numero + ".xml"
            Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados\Envio_" + fec + Documento + Numero + ".xml"
        Else
            'Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + Documento + Numero + "_SIMU.xml"
            Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados\Envio_" + fec + Documento + Numero + "_SIMU.xml"
        End If
    End Sub

    Private Sub cargarResultadosProceso() '-- Carga la grilla con la info de los comprobantes procesados.

        Me.DGV_listaComprobantes.Rows.Clear() '-- Limpia posibles existencias anteriores de comprobantes

        For Each un_Comprobante As Comprobante In un_AdmFacturaElectronica.listaComprobantesProcesados

            Me.DGV_listaComprobantes.Rows.Add(New Object() _
             {un_Comprobante.cod_doc, _
              un_Comprobante.nro_doc, _
              un_Comprobante.nro_trans, _
              un_Comprobante.estado, _
              un_Comprobante.observacion})

        Next
    End Sub

    Private Sub CargarGrillaComprobantesAEnviar() '-- Carga la grilla con la info de los comprobantes procesados.

        For Each un_Comprobante As Comprobante In un_AdmFacturaElectronica.listaComprobantesAEnviar
            un_Comprobante.cod_doc.Valor = un_Comprobante.cod_doc.Valor.ToString.Trim
            un_Comprobante.nom_tit.Valor = un_Comprobante.nom_tit.Valor.ToString.Trim
            un_Comprobante.estado_envio.Valor = un_Comprobante.estado_envio.Valor.ToString.Trim

            Me.DGV_ComprobantesAEnviar.Rows.Add(New Object() _
             {un_Comprobante.cod_doc, _
              un_Comprobante.nro_doc, _
              un_Comprobante.nro_trans, _
              un_Comprobante.nom_tit, _
              un_Comprobante.imp_tot_mo, _
              un_Comprobante.estado_envio})
        Next

    End Sub

    Private Sub RecorrerGrillaComprobantesAEnviar() '(ByRef un_compro As Comprobante) '-- Carga grilla con la info de los comprobantes seleccionados.
        Dim un_comprobante As New Comprobante
        Dim una_solicitudDAO As New SolicitudDAO

        una_lista_comprobantes_seleccionados.Clear()

        For Each fila As DataGridViewRow In Me.DGV_ComprobantesAEnviar.SelectedRows
            un_comprobante = New Comprobante
            un_comprobante.nro_trans = fila.Cells("nro_trans_sel").Value
            If Mid(fila.Cells("estado_envio_sel").Value.ToString, 1, 7) = "Enviado" Then
                ' Bug jodido como lpqlp
                ' una_solicitudDAO.EliminarSolicitud(un_comprobante.nro_trans)
            End If
            un_comprobante.cod_doc = fila.Cells("cod_doc_sel").Value
            un_comprobante.nro_doc = fila.Cells("nro_doc_sel").Value
            un_comprobante.nom_tit = fila.Cells("nom_tit_sel").Value
            un_comprobante.imp_tot_mo = fila.Cells("imp_tot_mo_sel").Value
            un_comprobante.estado_envio = fila.Cells("estado_envio_sel").Value
            una_lista_comprobantes_seleccionados.Add(un_comprobante)
        Next
    End Sub

    Private Sub RecorridoGrillaInicial()

        Dim un_comprobante As New Comprobante
        una_lista_comprobantes_seleccionados.Clear()

        For Each fila As DataGridViewRow In Me.DGV_ComprobantesAEnviar.SelectedRows
            un_comprobante = New Comprobante
            un_comprobante.nro_trans = fila.Cells("nro_trans_sel").Value
            un_comprobante.cod_doc = fila.Cells("cod_doc_sel").Value
            un_comprobante.nro_doc = fila.Cells("nro_doc_sel").Value
            un_comprobante.nom_tit = fila.Cells("nom_tit_sel").Value
            un_comprobante.imp_tot_mo = fila.Cells("imp_tot_mo_sel").Value
            un_comprobante.estado_envio = fila.Cells("estado_envio_sel").Value
            Documento = "_" + un_comprobante.cod_doc.Valor
            Numero = "-" + un_comprobante.nro_doc.Valor.ToString
            una_lista_comprobantes_seleccionados.Add(un_comprobante)
        Next

        'If modo_generar = modos_generar.real Then
        '    Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + Documento + Numero + ".xml"
        'Else
        '    Me.txtArchivo.Text = Application.StartupPath + "\Archivos Enviados\Envio_" + fec + Documento + Numero + "_SIMU.xml"
        'End If

        If Not Directory.Exists(My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados") Then
            Directory.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados")
        End If

        If modo_generar = modos_generar.real Then
            Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados\Envio_" + fec + Documento + Numero + ".xml"
        Else
            Me.txtArchivo.Text = My.Computer.FileSystem.SpecialDirectories.Desktop + "\Archivos Enviados\Envio_" + fec + Documento + Numero + "_SIMU.xml"
        End If
    End Sub

    Private Sub Btn_Recomenzar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Recomenzar.Click
        Select Case modo_factuplus
            Case modos_factuplus.envio
                InicioPantallaEnv()
                Me.ArmaInicioEnv()
            Case modos_factuplus.recepcion
                InicioPantallaRec()
        End Select
        btn_procesar.Enabled = True
        Btn_Procesar_Simu.Enabled = True
    End Sub

    Private Sub DGV_ComprobantesAEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DGV_ComprobantesAEnviar.Click
        modo_generar = modos_generar.real
        Me.RecorridoGrillaInicial()
    End Sub

End Class

