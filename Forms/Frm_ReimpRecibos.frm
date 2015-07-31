VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form Frm_ReimpRecibos 
   Caption         =   "Búsqueda y  Anulación de Recibos"
   ClientHeight    =   7800
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   9885
   ClipControls    =   0   'False
   Icon            =   "Frm_ReimpRecibos.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7800
   ScaleWidth      =   9885
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraBusqComprobantes 
      BorderStyle     =   0  'None
      Height          =   7020
      Left            =   15
      TabIndex        =   1
      Top             =   720
      Width           =   9825
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   330
         Width           =   2400
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4380
         TabIndex        =   8
         Top             =   315
         Width           =   4845
      End
      Begin VB.CommandButton cmdBuscar 
         Height          =   375
         Left            =   5685
         Picture         =   "Frm_ReimpRecibos.frx":030A
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   735
         Width           =   375
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2115
         TabIndex        =   2
         Top             =   2745
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   300
            TabIndex        =   3
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label20 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   6
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   5
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label25 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   4
            Top             =   375
            Width           =   855
         End
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
               Picture         =   "Frm_ReimpRecibos.frx":040C
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":051E
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0630
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0742
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0854
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0966
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   9
         Top             =   315
         Width           =   1680
         _ExtentX        =   2963
         _ExtentY        =   582
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   14737632
         OLEDropMode     =   1
         Indentation     =   1
         Locked          =   -1  'True
         ImageList       =   "ImgOperadores"
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1410
         TabIndex        =   11
         Tag             =   "dtDesde"
         Top             =   720
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   3915
         TabIndex        =   12
         Tag             =   "dtHasta"
         Top             =   750
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5670
         Left            =   90
         TabIndex        =   17
         Top             =   1170
         Width           =   9555
         _ExtentX        =   16854
         _ExtentY        =   10001
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
         NumItems        =   8
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "IdRecibo"
            Text            =   "Cod. Recibo "
            Object.Width           =   2999
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dtRecibo"
            Text            =   "Fecha Recibo"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "tpRecibo"
            Object.Tag             =   "tpRecibo"
            Text            =   "Tipo de Recibo"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "cdCliente"
            Text            =   "Cliente"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razón Social"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "flAnulado"
            Text            =   "Anulado"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nrCaja"
            Text            =   "Nro. Caja"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   16
         Top             =   105
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   15
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label lblLabels 
         Caption         =   "Hasta"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   3195
         TabIndex        =   14
         Top             =   825
         Width           =   645
      End
      Begin VB.Label lblLabels 
         Caption         =   "Fecha Desde"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   90
         TabIndex        =   13
         Top             =   840
         Width           =   1200
      End
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9885
      _ExtentX        =   17436
      _ExtentY        =   1111
      ButtonWidth     =   2011
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgReimpRecibosResaltado"
      HotImageList    =   "imgReimpRecibosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Comprobante"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Comprobante deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Anular"
            Key             =   "Anular"
            ImageKey        =   "Anular"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (F12)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ReimpRecibos.frx":0A78
      Begin MSComctlLib.ImageList imgReimpRecibosResaltado 
         Left            =   7005
         Top             =   30
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   12
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0CF6
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0E4A
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":0F5A
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":105C
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":11B0
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":12BC
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":1938
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":1AA0
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":1EF4
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2348
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":29C2
               Key             =   "Anular"
               Object.Tag             =   "Anular"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgReimpRecibos 
         Left            =   8100
         Top             =   60
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   12
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2AD2
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2BEA
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2D3E
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2E56
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":2F62
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":30B6
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":31BE
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":383A
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":399A
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":3DEE
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":4242
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ReimpRecibos.frx":48BC
               Key             =   "Anular"
               Object.Tag             =   "Anular"
            EndProperty
         EndProperty
      End
   End
End
Attribute VB_Name = "Frm_ReimpRecibos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl



Public Sub RefrescarProgressbar(pAvance As Long)

    DoEvents
    On Error Resume Next
    Me.ProgressBar.value = pAvance
    Me.lblvlPorcentaje.Caption = CStr(pAvance) + " %"
    On Error GoTo 0
    Me.Visible = True
    DoEvents

End Sub

Private Function limpiarControles()
Dim Control As Object
Dim strtag  As String


    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                If Control.Tag <> "tpIVA" Then
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





Private Sub cmdBuscar_Click()

    txtBusqueda_KeyPress vbKeyReturn

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
        If tlb_ABM.Buttons("Cancelar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
        End If
    Case vbKeyF1
    Case vbKeyF2
        If tlb_ABM.Buttons("Buscar").Visible Then
            If EstadoABM <> facturar Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
            End If
        End If
    Case vbKeyF3
        If tlb_ABM.Buttons("Seleccionar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Seleccionar")
        End If
    Case vbKeyF4
        If tlb_ABM.Buttons("Aceptar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
        End If
    Case vbKeyF5
        If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        End If
    Case vbKeyF8
        If tlb_ABM.Buttons("Imprimir").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Imprimir")
        End If
    Case vbKeyF12
        If tlb_ABM.Buttons("Salir").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
        End If
    Case vbKeyAdd
        
    End Select


End Sub

Private Sub Form_Load()

    EstadoABM = Consulta
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    ObtenerCampo("dtDesde").value = Date
    ObtenerCampo("dtHasta").value = Date
    Me.cmbCampos.ListIndex = 0
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Recibos"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Recibos")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Recibos")
    Loop
    Me.cmbCampos.ListIndex = 0

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Recibos", Me.cmbCampos.Text
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
        ObtenerOperadorAritmetico = "LIKE"
    End Select

End Function



Private Sub Form_Resize()

   objGUI.SizeControls Me, Me.fraBusqComprobantes, Me.lstBusqueda
    
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
Dim Control As Control
Dim Valor   As Variant



    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    If Me.lstBusqueda.SelectedItem.SubItems(5) = "SI" Then
        MsgBox "Este recibo ha sido anulado por el usuario " + Me.lstBusqueda.SelectedItem.SubItems(7) + ".", vbInformation + vbDefaultButton1, "Atención"
    End If
    imprimirPagoLicenciatario Me.lstBusqueda.SelectedItem.Text, Me.lstBusqueda.SelectedItem.SubItems(2)

End Sub



Private Sub imprimirPagoLicenciatario(IdRecibo As String, tpRecibo As String)
    
    Frm_Principal.LimpiarReporte

    Select Case tpRecibo
    Case "Detalle de Cobro a Cta. Cte."
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_DetalleFacturaCtaCte_V1.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Cobro a Cuenta Corriente"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
        Frm_Principal.CrystalReport1.StoredProcParam(1) = 0
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0
    Case "Recibo de Cobranza de Cta. Cte."
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_DetalleFacturaCtaCte_V1.rpt"
        
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Cobro a Cuenta Corriente"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
        Frm_Principal.CrystalReport1.StoredProcParam(1) = 1
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0
    Case Else
    
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_pagolicenciatario_v4_1.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Pago a Licenciatario"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
        Frm_Principal.CrystalReport1.StoredProcParam(1) = ""
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0
    End Select
    

End Sub

Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub






Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           ' PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Imprimir"
          If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
          If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
          If Me.lstBusqueda.SelectedItem.SubItems(5) = "SI" Then
            MsgBox "Este recibo ha sido anulado por el usuario " + Me.lstBusqueda.SelectedItem.SubItems(7) + ".", vbInformation + vbDefaultButton1, "Atención"
          End If
          imprimirPagoLicenciatario Me.lstBusqueda.SelectedItem.Text, Me.lstBusqueda.SelectedItem.SubItems(2)
          ' PresentarPantalla Button
          EstadoABM = Consulta
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           ' PresentarPantalla Button
           EstadoABM = Consulta
    Case "Anular"
            If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
            If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
            Anular_Recibo
    Case "Cancelar"
           If EstadoABM = facturar Then
              EstadoABM = facturar
              tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
           Else
              ' PresentarPantalla Button
              EstadoABM = Consulta
           End If
    End Select
    
End Sub



Private Sub Anular_Recibo()
Dim resp                    As Byte
Dim strSQL                  As String


    If Me.lstBusqueda.SelectedItem.SubItems(6) <> objParametros.ObtenerValor("nrCaja") Then
        MsgBox "No se puede eliminar este recibo ya que no pertenece a la caja de administración abierta, Caja Nro: " + objParametros.ObtenerValor("nrCaja") + ".", vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    If Me.lstBusqueda.SelectedItem.SubItems(5) = "SI" Then
        MsgBox "El recibo " + Me.lstBusqueda.SelectedItem.Text + " ha sido Anulado por el usuario " + Me.lstBusqueda.SelectedItem.SubItems(7), vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    If Me.lstBusqueda.SelectedItem.SubItems(2) = "Detalle de Cobro a Cta. Cte." Then
        MsgBox "No se puede anular un detalle de liquidación  de Cobro a Cta. Cte.", vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
    If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
    
    resp = MsgBox("Esta seguro que desea anular este recibo " + Me.lstBusqueda.SelectedItem.Text + " ?", vbQuestion + vbDefaultButton2 + vbYesNo, "Atención")
        
    
    If resp = vbNo Then Exit Sub
              
    objbasededatos.BeginTrans
    
    strSQL = " SP_AnularRecibo_v3_7 @idReciboParam=" + Me.lstBusqueda.SelectedItem.Text + " , "
    strSQL = strSQL + " @dsUsuario_param='" + objUsuario.dsUsuario + "',"
    strSQL = strSQL + " @dsUsuario_Supervisor_param='" + objParametros.ObtenerValor("dsUsuario_Acceso_Supervisor") + "'"
    

    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
        objbasededatos.RollBackTrans
        MsgBox "Error: " + objbasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    objbasededatos.CommitTrans
    
    MsgBox "El recibo ha sido anulado con éxito.", vbInformation + vbDefaultButton1, "Atención"
    
    'Actualizar la grilla
    txtBusqueda_KeyPress vbKeyReturn
    'lstBusqueda_DblClick
    
        
End Sub

Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Recibos") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Public Function CompletarCerosaIzquierda(pValor As String, nrCantidadCeros As Integer) As String
Dim nI As Integer
Dim i As Integer


    nI = Len(pValor)
    For i = nI To nrCantidadCeros - 1
        pValor = "0" + pValor
    Next
    CompletarCerosaIzquierda = pValor
    
End Function



Private Function FormadepagoOK() As Boolean

    FormadepagoOK = True
         
End Function




Private Function ActualizarCaja() As Boolean
Dim i     As Integer
Dim strValor As String
Dim vlSaldoFinalPesos As Single
Dim vlSaldoFinalDolares As Single
Dim vlSaldoFinalEuros As Single

    ActualizarCaja = False
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "->", ""
    ObjTablasIO.Seleccionar
    
    If Not ObjTablasIO.rs_resultados.EOF Then
            vlSaldoFinalPesos = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalPesos").value, "0")
            vlSaldoFinalDolares = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalDolares").value, "0")
            vlSaldoFinalEuros = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalEuros").value, "0")
            If ObtenerCampo("vlPagoPesos").Text = "" Then
                ObtenerCampo("vlPagoPesos").Text = "0"
            End If
            If ObtenerCampo("vlPagoDolares").Text = "" Then
                ObtenerCampo("vlPagoDolares").Text = "0"
            End If
            If ObtenerCampo("vlPagoEuros").Text = "" Then
                ObtenerCampo("vlPagoEuros").Text = "0"
            End If
            If ObtenerCampo("vlTotalGeneral").Text = "" Then
                ObtenerCampo("vlTotalGeneral").Text = "0"
            End If
            vlSaldoFinalPesos = vlSaldoFinalPesos + CSng(ObtenerCampo("vlPagoPesos").Text)
            vlSaldoFinalDolares = vlSaldoFinalDolares + CSng(ObtenerCampo("vlPagoDolares").Text)
            vlSaldoFinalEuros = vlSaldoFinalEuros + CSng(ObtenerCampo("vlPagoEuros").Text)
            
    End If
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "<-", CStr(vlSaldoFinalPesos)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "<-", CStr(vlSaldoFinalDolares)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "<-", CStr(vlSaldoFinalEuros)
    
    If ObjTablasIO.Actualizar Then
        ActualizarCaja = True
    End If
    
End Function





Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.txtBusqueda.Tag = ""
           Me.lstBusqueda.Visible = False
    Case "Imprimir"
   
           'Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           ' Me.tlb_ABM.Buttons("Aceptar").Visible = False
           ' Me.tlb_ABM.Buttons("Cancelar").Visible = False
           ' Me.tlb_ABM.Buttons("Imprimir").Visible = True
           ' Me.tlb_ABM.Buttons("Exportar").Visible = True
           ' Me.tlb_ABM.Buttons("Raya").Visible = True
           ' Me.tlb_ABM.Buttons("Buscar").Visible = True
           ' Me.tlb_ABM.Buttons("Salir").Visible = True
           ' Me.lstBusqueda.Visible = True
    Case "Agregar"
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           If EstadoABM = facturar Then
                Me.lstBusqueda.Visible = False
                Me.tlb_ABM.Buttons("Buscar").Visible = False
                Me.tlb_ABM.Buttons("Seleccionar").Visible = False
                Me.tlb_ABM.Buttons("Exportar").Visible = False
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = True
                Me.tlb_ABM.Buttons("Cancelar").Visible = True
                ObtenerCampo("cdCliente").SetFocus
           Else
                Me.lstBusqueda.Visible = True
                Me.tlb_ABM.Buttons("Buscar").Visible = True
                Me.tlb_ABM.Buttons("Seleccionar").Visible = True
                Me.tlb_ABM.Buttons("Exportar").Visible = True
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = False
                Me.tlb_ABM.Buttons("Cancelar").Visible = False
                Me.txtBusqueda.SetFocus
          End If
    Case "Cancelar"
        If EstadoABM = facturar Then
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           ObtenerCampo("cdCliente").SetFocus
        Else
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
        End If
    End Select
    

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
         If Me.txtBusqueda.Text = "" Then Exit Sub
         
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Recibos"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Recibos", Me.cmbCampos.Text

         
         ' Filtros por nivel de Acceso
         Select Case objUsuario.tpAcceso
         Case "Puestos"
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
            ' si es un Puesto y usuario Comun FALTA PROGRAMAR
            ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCaja"), " AND "
         Case Else
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End Select
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Recibos", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         
         
         ObjTablasIO.setearCampoOperadorValor "dtRecibo", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtRecibo", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59")
         
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Recibos"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
         End If
    Else
          objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Recibos", Me.cmbCampos.Text
          Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
          KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Recibos", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


