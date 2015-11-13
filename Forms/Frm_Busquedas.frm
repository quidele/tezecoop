VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form Frm_Busquedas 
   Caption         =   "Busqueda"
   ClientHeight    =   6495
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9885
   ClipControls    =   0   'False
   Icon            =   "Frm_Busquedas.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   9885
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraBusqClientes 
      BorderStyle     =   0  'None
      Height          =   6360
      Left            =   90
      TabIndex        =   4
      Top             =   105
      Width           =   9645
      Begin VB.ComboBox tpTipo 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   345
         Width           =   2265
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   6240
         TabIndex        =   0
         Top             =   330
         Width           =   3375
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   7215
         Top             =   1560
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483648
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   6
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":0442
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":0554
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":0666
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":0778
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":088A
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_Busquedas.frx":099C
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   5040
         TabIndex        =   3
         Top             =   330
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   582
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   14737632
         OLEDropMode     =   1
         Indentation     =   1
         Locked          =   -1  'True
         ImageList       =   "ImgOperadores"
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5445
         Left            =   120
         TabIndex        =   1
         Top             =   720
         Width           =   9495
         _ExtentX        =   16748
         _ExtentY        =   9604
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   0
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   2400
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   345
         Width           =   2640
      End
      Begin VB.Label Label3 
         Caption         =   "Tipo"
         Height          =   210
         Left            =   135
         TabIndex        =   8
         Top             =   90
         Width           =   1365
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   6225
         TabIndex        =   6
         Top             =   105
         Width           =   4275
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   2400
         TabIndex        =   5
         Top             =   90
         Width           =   1545
      End
   End
End
Attribute VB_Name = "Frm_Busquedas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM    As Byte
Dim objControl   As New CControl
Dim nmTabla      As String
Dim nmCampoClave As String
Dim nmCampoTipo  As String
Dim nmCampoTipoValorDefecto  As String




Private Function limpiarControles()
Dim Control As Object
Dim strtag  As String


    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                strtag = Mid(Control.Tag, 1, 2)
                Select Case strtag
                Case "dt"
                    On Error Resume Next
                    Control.Text = ""
                    On Error GoTo 0
                Case "fl"
                    Control.value = False
                Case Else
                    On Error Resume Next
                    Control.Text = ""
                    On Error GoTo 0
                End Select
            End If
        End If
    Next
        
End Function

Private Function ObtenerCampo(pstrtag As String) As Control
Dim Control As Object

    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If UCase(Control.Tag) = UCase(pstrtag) Then
               Set ObtenerCampo = Control
               Exit Function
            End If
        End If
    Next
    Debug.Assert "hola"
    
End Function


Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub


Private Sub Form_Activate()

    Me.txtBusqueda.SetFocus
    Me.lstBusqueda.ListItems.Clear
    txtBusqueda_KeyPress 13
    
    
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
    Case vbKeyEscape
        Unload Me
    End Select
    
End Sub

Private Sub Form_Load()
   
    objParametros.GrabarValor "vlCampoClaveBusqueda", ""
    nmCampoClave = objParametros.ObtenerValor("nmCampoClaveBusqueda")
    nmTabla = objParametros.ObtenerValor("nmTablaBusqueda")
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    Me.lstBusqueda.ColumnHeaders.Clear
    cargarcamposdebusqueda
    cargarEncabezadosListView
    If objParametros.ObtenerValor("tpCampoBusqueda") <> "" Then
      Me.cmbCampos.Text = objParametros.ObtenerValor("tpCampoBusqueda")
    Else
        If nmTabla = "TB_Clientes" Then
           Me.cmbCampos.ListIndex = 2
        Else
           Me.cmbCampos.ListIndex = 1
        End If
    End If
    cargarCampoTipo

 
    
    
End Sub


Private Sub cargarCampoTipo()
Dim sql As String

    Me.tpTipo.Clear
    
    nmCampoTipo = objParametros.ObtenerValor("Frm_Busquedas.nmCampoTipo")
    nmCampoTipoValorDefecto = objParametros.ObtenerValor("Frm_Busquedas.nmCampoTipoValorDefecto")
    
    Dim nmCampoTipoDefecto  As String

    sql = "select " + nmCampoTipo + " from " + nmTabla + " group by  " + nmCampoTipo
    objbasededatos.ExecuteSQL (sql)
    
    Do Until objbasededatos.rs_resultados.EOF
        If Not IsNull(objbasededatos.rs_resultados(nmCampoTipo)) Then
            Me.tpTipo.AddItem objbasededatos.rs_resultados(nmCampoTipo)
        End If
        objbasededatos.rs_resultados.MoveNext
    Loop
    
    Me.tpTipo.AddItem "Todos"
    
    ' Me.tpTipo.ListIndex = 0
    Me.tpTipo.Text = nmCampoTipoValorDefecto
    

End Sub


' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()


    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla nmTabla
    Do Until objDiccionariodeDatos.FindeCampos(nmTabla)
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        objDiccionariodeDatos.ObtenerSiguienteCampo (nmTabla)
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub

' Eulises: Nueva Funcion
Private Sub cargarEncabezadosListView()
Dim n As Integer

    objDiccionariodeDatos.ObtenerCampo nmTabla, nmCampoClave
    Me.lstBusqueda.ColumnHeaders.Add 1, , objDiccionariodeDatos.nmCampoExterno
    Me.lstBusqueda.ColumnHeaders.Item(1).Tag = objDiccionariodeDatos.nmCampo
    Me.lstBusqueda.ColumnHeaders.Item(1).Width = obtenerTamanio(objDiccionariodeDatos.nrTamanio)
        
    
    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla nmTabla
    n = 2
    Do Until objDiccionariodeDatos.FindeCampos(nmTabla)
        If Not objDiccionariodeDatos.nmCampo = nmCampoClave Then
            Me.lstBusqueda.ColumnHeaders.Add n, , objDiccionariodeDatos.nmCampoExterno
            Me.lstBusqueda.ColumnHeaders.Item(n).Tag = objDiccionariodeDatos.nmCampo
            Me.lstBusqueda.ColumnHeaders.Item(n).Width = obtenerTamanio(objDiccionariodeDatos.nrTamanio)
            n = n + 1
        End If
        objDiccionariodeDatos.ObtenerSiguienteCampo (nmTabla)
    Loop

End Sub


Private Function obtenerTamanio(nrTamanio As Integer) As Integer
    
    Select Case nrTamanio
    Case Is > 20
        obtenerTamanio = nrTamanio * 40
    Case 10 To 20
        obtenerTamanio = nrTamanio * 100
    Case Is <= 10
        obtenerTamanio = nrTamanio * 300
    End Select
    
End Function


Private Sub CargarOperadoresAritmeticos()

    Me.ImageCombo1.ComboItems.Clear
    objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.Text
    Select Case UCase(objDiccionariodeDatos.tpTipo)
    Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
    Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar"
        Me.ImageCombo1.ComboItems.Add 2, "Igual", "Igual", "Igual", "Igual"
        Me.ImageCombo1.ComboItems.Add 3, "Menor", "Menor", "Menor"
        Me.ImageCombo1.ComboItems.Add 4, "Mayor", "Mayor", "Mayor"
        Me.ImageCombo1.ComboItems.Add 5, "MayoroIgual", "Mayor o Igual", "MayoroIgual"
        Me.ImageCombo1.ComboItems.Add 6, "MenoroIgual", "Menor o Igual", "MenoroIgual"
    Case "DATETIME":
        Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar"
        Me.ImageCombo1.ComboItems.Add 2, "Igual", "Igual", "Igual", "Igual"
        Me.ImageCombo1.ComboItems.Add 3, "Menor", "Menor", "Menor"
        Me.ImageCombo1.ComboItems.Add 4, "Mayor", "Mayor", "Mayor"
        Me.ImageCombo1.ComboItems.Add 5, "MayoroIgual", "Mayor o Igual", "MayoroIgual"
        Me.ImageCombo1.ComboItems.Add 6, "MenoroIgual", "Menor o Igual", "MenoroIgual"
    Case Else ' Esta el Varchar incluido
        Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
    End Select
    Me.ImageCombo1.ComboItems(1).Selected = True
    
End Sub


Private Function ObtenerOperadorAritmetico() As String

    Select Case Me.ImageCombo1.SelectedItem.Text
    Case "Igual"
        ObtenerOperadorAritmetico = "="
    Case "Menor"
        ObtenerOperadorAritmetico = "<"
    Case "Mayor"
        ObtenerOperadorAritmetico = ">"
    Case "MayoroIgual"
        ObtenerOperadorAritmetico = ">="
    Case "MenoroIgual"
        ObtenerOperadorAritmetico = "<="
    Case "Similar"
        If InStr(1, Me.txtBusqueda.Text, "*", vbTextCompare) > 0 Or _
            InStr(1, Me.txtBusqueda.Text, "%", vbTextCompare) > 0 Then
            ObtenerOperadorAritmetico = "LIKE"
        Else
            ObtenerOperadorAritmetico = "LIKE DER"
        End If
    End Select

End Function



Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqClientes, Me.lstBusqueda
    
    
End Sub

Private Sub lstBusqueda_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)


    If lstBusqueda.SortKey = ColumnHeader.Index - 1 Then
        If lstBusqueda.SortOrder = lvwAscending And lstBusqueda.Sorted Then
            lstBusqueda.SortOrder = lvwDescending
        Else
            lstBusqueda.SortOrder = lvwAscending
        End If
        lstBusqueda.SortKey = ColumnHeader.Index - 1
    Else
       lstBusqueda.SortOrder = lvwAscending
       lstBusqueda.SortKey = ColumnHeader.Index - 1
    End If
    ' lstBusqueda.Refresh
    lstBusqueda.Sorted = True
    
    
End Sub

Private Sub lstBusqueda_DblClick()
Dim Control      As Control
Dim Valor        As Variant



    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    
    If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flBloqueado", Me.lstBusqueda.SelectedItem.Index) = "SI" Then
         Exit Sub
    End If
    
    
    objParametros.GrabarValor "vlCampoClaveBusqueda", Me.lstBusqueda.SelectedItem.Text
    Unload Me
    EstadoABM = modificacion
    
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub




Private Sub tpTipo_Click()
    txtBusqueda_KeyPress vbKeyReturn
End Sub

Private Sub txtBusqueda_GotFocus()

    
    Me.txtBusqueda.Text = Trim(Me.txtBusqueda.Text)
    Me.txtBusqueda.SelStart = Len(Trim(Me.txtBusqueda.Text))
    
    
End Sub

Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n As Integer
Dim strBuscada As String

    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         
         ObjTablasIO.nmTabla = nmTabla
         
         ' agregado version 1.8
         
         
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         ' filtramos por el campo tipo
         If Me.tpTipo.Text <> "Todos" Then
            ObjTablasIO.setearCampoOperadorValor nmCampoTipo, "=", Me.tpTipo.Text, " AND "
         End If
         
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
        ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0"
            
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, nmTabla
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
         End If
         
         '/****************************************************************/'
         '/* agregado en la version 3.6 */
         ObjTablasIO.nmTabla = nmTabla
           ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         ' filtramos por el campo tipo
         If Me.tpTipo.Text <> "Todos" Then
            ObjTablasIO.setearCampoOperadorValor nmCampoTipo, "=", Me.tpTipo.Text, " AND "
         End If
         
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
        ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "1"
            
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, nmTabla, Me.lstBusqueda.ListItems.Count + 1
         End If
         '/****************************************************************/'
         
         ColorearLineasyResaltarBloqueado
         
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico nmTabla, Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada(nmTabla, Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


Private Sub ColorearLineasyResaltarBloqueado()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count

        ' marcamos los viajes con factura manual
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flBloqueado", i) = "SI" Then
           Me.lstBusqueda.ListItems(i).ForeColor = Rojo
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = "registro bloqueado"
            Next
        End If
        
    Next i
    objGUI.refrescarGrilla Me.lstBusqueda

End Sub
