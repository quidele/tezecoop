Imports fonseca_libDatos
Imports Fonseca_libFunciones

Public Class frm_logViewer

    Private _listaLog As List(Of String)

    Private Sub frm_logViewer_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            Console.WriteLine(Me.Name + "_Load")
            Me.Icon = Resources.Documento_ico
            ConfigurarDGV()
            'TextBoxesFunciones.MakeReadOnlyTextBox(txt_consulta)
            txt_consulta.ReadOnly = True
            pnl_ampliar.MaximumSize = pnl_ampliar.Size
            pnl_ampliar.MinimumSize = pnl_ampliar.Size
            pnl_ampliar.Visible = False
            grp_Filtros.Enabled = True
            grp_gridViewer.Enabled = True
            GrpFunciones.CentrarObjetosEnPantalla(Me)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub


  
    Private Sub ConfigurarDGV()
        Try
            With dgv_logViewer
                .Columns.Add("hora", "Hora")
                .Columns.Add("usuario_mod", "Usuario")
                .Columns.Add("tipo", "Tipo")
                .Columns.Add("descripcion", "Descripcion")

                .Columns("descripcion").AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill
            End With

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub ProcesarCadena(ByVal pCadena As String())
        Try
            'If pCadena.Length < 5 Then
            '    Exit Sub
            'End If
            If Not IsDate(pCadena(0)) Then
                Exit Sub
            End If
            Dim colHora As String = CDate(Trim(pCadena(0))).ToLongTimeString
            Dim colUser As String = Trim(Replace(Replace(pCadena(1), "[", String.Empty), "]", String.Empty))
            Dim colTipo As String = Trim(Replace(Replace(pCadena(2), "[", String.Empty), "]", String.Empty))
            Dim colDesc As String = Trim(pCadena(3))

            If (colTipo.ToUpper.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Debug).ToUpper) AndAlso chk_debug.Checked = True) OrElse _
                (colTipo.ToUpper.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Check).ToUpper) AndAlso chk_Check.Checked = True) OrElse _
                (colTipo.ToUpper.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Error).ToUpper) AndAlso chk_error.Checked = True) OrElse _
                (colTipo.ToUpper.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Info).ToUpper) AndAlso chk_info.Checked = True) OrElse _
                (colTipo.ToUpper.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Warn).ToUpper) AndAlso chk_warn.Checked = True) Then

                dgv_logViewer.Rows.Add(colHora, colUser, colTipo, colDesc)
            End If

            lbl_cantidadRegistros.Text = dgv_logViewer.Rows.Count.ToString + " Registro(s)."
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub ProcesarFilas()
        Try

            For Each fila As DataGridViewRow In dgv_logViewer.Rows
                If fila.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Check)) Then
                    fila.DefaultCellStyle.BackColor = Color.FromArgb(200, 255, 182)
                    fila.DefaultCellStyle.ForeColor = Color.Green
                ElseIf fila.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Error)) Then
                    fila.DefaultCellStyle.BackColor = Color.Red
                    fila.DefaultCellStyle.ForeColor = Color.White
                ElseIf fila.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Info)) Then
                    fila.DefaultCellStyle.BackColor = Color.LightGray
                    fila.DefaultCellStyle.ForeColor = Color.Black
                ElseIf fila.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Warn)) Then
                    fila.DefaultCellStyle.BackColor = Color.LightYellow
                    fila.DefaultCellStyle.ForeColor = Color.Black
                ElseIf fila.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Debug)) Then
                    fila.DefaultCellStyle.BackColor = Color.LightCyan
                    fila.DefaultCellStyle.ForeColor = Color.DarkBlue
                Else
                    fila.DefaultCellStyle.BackColor = Color.White
                    fila.DefaultCellStyle.ForeColor = Color.Black
                End If
            Next



        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub btn_buscar_Click(sender As Object, e As EventArgs) Handles btn_buscar.Click
        Buscar()
    End Sub

    Private Sub btn_cerrarPanel_Click(sender As Object, e As EventArgs) Handles btn_cerrarPanel.Click
        pnl_ampliar.ResetText()
        pnl_ampliar.Visible = False
        grp_Filtros.Enabled = True
        grp_gridViewer.Enabled = True
        btn_cerrarPanel.Enabled = False
    End Sub

    Private Sub dgv_logViewer_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgv_logViewer.CellDoubleClick
        If dgv_logViewer.CurrentRow Is Nothing Then
            Exit Sub
        End If
        If dgv_logViewer.CurrentRow.Cells("tipo").FormattedValue.Equals(FuncionesEnumeradores.EnumDescription(tipoLogging.Debug)) Then
            AmpliarTexto(dgv_logViewer.CurrentRow.Cells("descripcion").FormattedValue.ToString)
        End If
    End Sub
    Private Sub AmpliarTexto(pTexto As String)
        Try
            GrpFunciones.CentrarObjetosEnPantalla(pnl_ampliar)
            grp_Filtros.Enabled = False
            grp_gridViewer.Enabled = False
            txt_consulta.Text = pTexto
            pnl_ampliar.Visible = True
            btn_cerrarPanel.Enabled = True

        Catch ex As Exception
            Throw ex
        End Try
    End Sub
   
    Private Sub btn_copiar_Click(sender As Object, e As EventArgs) Handles btn_copiar.Click
        Clipboard.SetText(txt_consulta.Text)
    End Sub

    Private Sub btn_abrirArchivo_Click(sender As Object, e As EventArgs) Handles btn_abrirArchivo.Click
        Try
            AbrirArchivoLog()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado.", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ''' <summary>
    ''' Busca el el log local. Versrion_6.3
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub Buscar()
        Try
            Dim objLista As New List(Of String)

            'La clase de Log leerá el log local correspondiente a la fecha pasada por parametro.
            objLista = Log.Leer_Log(dtp_fecha.Value)

            'Asignamos a una variable global del formulario la lista para que esté disponible en todo momento.
            _listaLog = objLista

            'Leemos la lista obtenida.
            LeerLista(objLista)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    ''' <summary>
    ''' Busca en una ubicacion indicada por la ruta pasada por parametro.
    ''' </summary>
    ''' <param name="pPathOfFile"></param>
    ''' <remarks></remarks>
    Private Sub Buscar(ByVal pPathOfFile As String)
        Try
            Dim objLista As New List(Of String)
            Dim objTextReaderWriter As New TextReaderWriter

            'La clase que maneja la lectura de textos leerá el archivo pasado por parámetro.
            objLista = objTextReaderWriter.Leer_Archivo(pPathOfFile)
            'Asignamos a una variable global del formulario la lista para que esté disponible en todo momento.
            _listaLog = objLista

            'Leemos la lista obtenida.
            LeerLista(objLista)

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Private Sub LeerLista(pObjLista As List(Of String))
        Try
            dgv_logViewer.Rows.Clear()

            For Each elemento As String In pObjLista
                ProcesarCadena(elemento.Split(CChar("|")))
            Next

            ProcesarFilas()

        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Private Sub AbrirArchivoLog()
        Try

            Me.OpenFileDialog1.Filter = "ArchivosLog (*.Log)|*.LOG"

            ' Allow the user to select multiple images. 
            Me.OpenFileDialog1.Multiselect = False
            Me.OpenFileDialog1.Title = "Archivos de .log"
            Me.OpenFileDialog1.FileName = String.Empty

            If OpenFileDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
                Buscar(OpenFileDialog1.FileNames(0).ToString)
            End If

        Catch ex As Exception
            Throw ex
        End Try
    End Sub


    Private Sub chk_CheckedChanged(sender As Object, e As EventArgs) Handles chk_error.CheckedChanged, chk_debug.CheckedChanged, chk_Check.CheckedChanged, chk_info.CheckedChanged, chk_warn.CheckedChanged
        Try
            If _listaLog Is Nothing Then
                Exit Sub
            End If
            If _listaLog.Count = 0 Then
                Exit Sub
            End If
            LeerLista(_listaLog)
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    




    Private Sub Object_DragEnter(ByVal sender As Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles btn_abrirArchivo.DragEnter, Me.DragEnter, dgv_logViewer.DragEnter
        If e.Data.GetDataPresent(DataFormats.FileDrop) Then
            e.Effect = DragDropEffects.All
        End If
    End Sub

    Private Sub Object_DragDrop(ByVal sender As Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles btn_abrirArchivo.DragDrop, Me.DragDrop, dgv_logViewer.DragDrop
        If e.Data.GetDataPresent(DataFormats.FileDrop) Then
            Dim MyFiles() As String
            Dim i As Integer

            ' Assign the files to an array.
            MyFiles = CType(e.Data.GetData(DataFormats.FileDrop), String())
            ' Loop through the array and add the files to the list.
            For i = 0 To MyFiles.Length - 1
                Buscar(MyFiles(i).ToString)
            Next

        End If
    End Sub


    Private Sub IrAlProximoIndice(pStringBuscado As String)
        Try

            Dim i As Integer = 0
            Dim registrosTotales As Integer = 0
            Dim nuevoIndice As Integer = 1
            Dim indiceActual As Integer = 1

            indiceActual = dgv_logViewer.SelectedRows(0).Index
            registrosTotales = dgv_logViewer.Rows.Count - 1

            Dim coincidencias As Integer = (From elemento In dgv_logViewer.Rows() Where DirectCast(elemento, DataGridViewRow).Cells("descripcion").FormattedValue.ToString.ToUpper.Contains(pStringBuscado.ToUpper.Trim)).ToList.Count

            For i = dgv_logViewer.InnerDGV.FirstDisplayedScrollingRowIndex + 1 To registrosTotales
                If dgv_logViewer.Rows(i).Cells("descripcion").FormattedValue.ToString.ToUpper.Contains(pStringBuscado.ToUpper) Then
                    nuevoIndice = dgv_logViewer.Rows(i).Index

                    If indiceActual = nuevoIndice And coincidencias > 1 Then
                        Continue For
                    End If

                    Exit For
                End If

                If i = registrosTotales And coincidencias > 0 Then
                    i = 0
                End If
            Next

            'If indiceActual = nuevoIndice Then
            '    nuevoIndice = 0
            'End If

            dgv_logViewer.ClearSelection()
            dgv_logViewer.InnerDGV.FirstDisplayedScrollingRowIndex = nuevoIndice
            dgv_logViewer.Rows(nuevoIndice).Selected = True

        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error inesperado", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btn_irSiguiente_Click(sender As Object, e As EventArgs) Handles btn_irSiguiente.Click
        IrAlProximoIndice(txt_search.Text)
    End Sub
End Class