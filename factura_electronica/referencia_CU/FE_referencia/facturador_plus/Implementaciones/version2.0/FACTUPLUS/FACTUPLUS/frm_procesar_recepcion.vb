

Public Class frm_procesar_archivos

    Enum modos_factuplus As Integer
          envio
          recepcion
    End Enum


    Dim modo_factuplus As modos_factuplus


    Private Sub abrir_archivo()


      With Me.ofd_abrir_archvo

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

    Private Sub frm_procesar_archivos_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    Dim nombre_ejecutable As String

        Me.txtArchivo.Text = Application.StartupPath

        nombre_ejecutable = GUIUtilitarios.obtenerNombreEjecutable(Application.ExecutablePath)

        If nombre_ejecutable.ToString.ToUpper = "Factuplus_envio.exe".ToUpper Then
            modo_factuplus = modos_factuplus.envio
        Else
            modo_factuplus = modos_factuplus.recepcion
        End If

        Select Case modo_factuplus
        Case modos_factuplus.envio
            Me.grb_envio_recep_comprobantes.Text = "Envio de Archivo"
        Case modos_factuplus.recepcion
            Me.grb_envio_recep_comprobantes.Text = "Recepción de Archivo"
        End Select

    End Sub

Private Sub btn_procesar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim un_solicitudDAO As New SolicitudDAO

        Dim idSolicitud As New Campo
        idSolicitud.valor = 1011111199
        idSolicitud.tipo = SQLAdapter.getTipoLong
        un_solicitudDAO.obtenerXMLSolicitudaEnviar(idSolicitud)
        MsgBox(un_solicitudDAO.xml_solicitud)
End Sub

Private Sub grb_envio_comprobantes_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles grb_envio_recep_comprobantes.Enter

End Sub

Private Sub btn_procesar_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_procesar.Click

End Sub

Private Sub btn_busca_archivo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_busca_archivo.Click

    Select Case modo_factuplus
    Case modos_factuplus.envio
        guardar_archivo()
    Case modos_factuplus.recepcion
        abrir_archivo()
    End Select

End Sub

Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

    MsgBox("Say us dollars " + RegionalUtils.ImporteEnLetras(120313.39, "EN"))


End Sub
End Class
