VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ResumenMovimientosContables 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Resumen Movimientos Contables"
   ClientHeight    =   7755
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10275
   ClipControls    =   0   'False
   Icon            =   "Frm_ResumenMovimientosContables.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7755
   ScaleWidth      =   10275
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2910
      TabIndex        =   12
      Top             =   3435
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   13
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   16
         Top             =   390
         Width           =   510
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1140
         TabIndex        =   15
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   14
         Top             =   375
         Width           =   855
      End
   End
   Begin VB.ComboBox cmbCampos 
      BackColor       =   &H00E0E0E0&
      Height          =   315
      ItemData        =   "Frm_ResumenMovimientosContables.frx":030A
      Left            =   135
      List            =   "Frm_ResumenMovimientosContables.frx":030C
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   900
      Width           =   2400
   End
   Begin VB.TextBox txtBusqueda 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   330
      Left            =   4320
      TabIndex        =   2
      Top             =   900
      Width           =   5850
   End
   Begin VB.CommandButton cmdBuscar 
      Height          =   375
      Left            =   5700
      Picture         =   "Frm_ResumenMovimientosContables.frx":030E
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1320
      Width           =   375
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10275
      _ExtentX        =   18124
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgMovimientosContables"
      DisabledImageList=   "imgResaltado"
      HotImageList    =   "imgResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Movimiento Contable"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Movimiento Contable deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Movimiento Contable"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Reporte(F6)"
            Key             =   "Reporte"
            ImageKey        =   "Reporte"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ResumenMovimientosContables.frx":0410
      Begin MSComctlLib.ImageList imgResaltado 
         Left            =   6840
         Top             =   870
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":0572
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":068E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":07E2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":08F2
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":09F4
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":0B48
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":0C54
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":12D0
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":1438
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":188C
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":1CE0
               Key             =   "Reporte"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgMovimientosContables 
         Left            =   8010
         Top             =   15
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":1DF2
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":1F0A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":205E
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":2176
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":2282
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":23D6
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":24DE
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":2B5A
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":2CBA
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":310E
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenMovimientosContables.frx":3562
               Key             =   "Reporte"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   5790
      Left            =   105
      TabIndex        =   3
      Top             =   1845
      Width           =   10065
      _ExtentX        =   17754
      _ExtentY        =   10213
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDragMode     =   1
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
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
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "tpConcepto"
         Text            =   "Tipo"
         Object.Width           =   2469
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "tpOperacion"
         Text            =   "Operación"
         Object.Width           =   2822
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "dsConcepto"
         Text            =   "Concepto"
         Object.Width           =   5292
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlSumaPesos"
         Text            =   "Pesos"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "vlSumaDolares"
         Text            =   "Dolares"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "vlSumaEuros"
         Text            =   "Euros"
         Object.Width           =   2117
      EndProperty
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   360
      Index           =   0
      Left            =   1440
      TabIndex        =   5
      Tag             =   "dtDesde"
      Top             =   1305
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
      Left            =   3945
      TabIndex        =   6
      Tag             =   "dtHasta"
      Top             =   1320
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   609
      _Version        =   393216
      Format          =   111935489
      CurrentDate     =   38267
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   2130
      Top             =   15
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
            Picture         =   "Frm_ResumenMovimientosContables.frx":3674
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3786
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3898
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":39AA
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3ABC
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3BCE
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   7440
      Top             =   1455
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
            Picture         =   "Frm_ResumenMovimientosContables.frx":3CE0
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3DF2
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":3F04
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":4016
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":4128
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenMovimientosContables.frx":423A
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageCombo ImageCombo1 
      Height          =   330
      Left            =   2580
      TabIndex        =   11
      Top             =   900
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
   Begin VB.Label Label1 
      Caption         =   "Campo"
      Height          =   210
      Left            =   120
      TabIndex        =   10
      Top             =   660
      Width           =   795
   End
   Begin VB.Label Label2 
      Caption         =   "Valor para la busqueda"
      Height          =   210
      Left            =   4335
      TabIndex        =   9
      Top             =   660
      Width           =   1755
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
      Index           =   12
      Left            =   135
      TabIndex        =   8
      Top             =   1410
      Width           =   1200
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
      Index           =   13
      Left            =   3225
      TabIndex        =   7
      Top             =   1395
      Width           =   645
   End
End
Attribute VB_Name = "Frm_ResumenMovimientosContables"
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


Private Sub cmdBuscar_Click()

        txtBusqueda_KeyPress vbKeyReturn

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
            If EstadoABM = Consulta Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
            Else
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
            End If
    Case vbKeyF1
    Case vbKeyF2
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case vbKeyF3
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Seleccionar")
    Case vbKeyF4
        If EstadoABM = Consulta Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Agregar")
        Else
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
        End If
    Case vbKeyF5
        If EstadoABM = Consulta Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        Else
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
        End If
    Case vbKeyF6
        If tlb_ABM.Buttons("Reporte").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        End If
    End Select


End Sub

Private Sub Form_Load()

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    cargarcamposdebusqueda
    Me.cmbCampos.ListIndex = 1
    ObtenerCampo("dtDesde").value = "01/" + CStr(Month(Date)) + "/" + CStr(Year(Date))
    ObtenerCampo("dtHasta").value = Date
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
    
End Sub


' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_ResumenMovimientosContables"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_ResumenMovimientosContables")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_ResumenMovimientosContables")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_ResumenMovimientosContables", Me.cmbCampos.Text
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



Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

End Sub





Private Sub lstBusqueda_DblClick()


    If Me.lstBusqueda.ListItems.Count < 1 Then Exit Sub
    objParametros.GrabarValor "Precede_Resumen", "SI"
    objParametros.GrabarValor "dsConcepto", Me.lstBusqueda.SelectedItem.SubItems(2)
    objParametros.GrabarValor "tpConcepto", Me.lstBusqueda.SelectedItem.Text
    objParametros.GrabarValor "tpOperacion", Me.lstBusqueda.SelectedItem.SubItems(1)
    objParametros.GrabarValor "dtDesde", ObtenerCampo("dtDesde").value
    objParametros.GrabarValor "dtHasta", ObtenerCampo("dtHasta").value
        
    Frm_BusquedaMovimientosContables.Show vbModal
        
End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           limpiarControles
           ' Pasar datos
           ' lstBusqueda_DblClick
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCaja", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           strValor = objbasededatos.SP_ObtenerMaxIDMovimiento()
           ObtenerCampo("IdMovimiento").Text = strValor
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("nrCaja")
           ObtenerCampo("dsUsuario").Text = objUsuario.dsUsuario
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCaja", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
           PresentarPantalla Button
           ObtenerCampo("dtMovimiento").Text = Now
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                PresentarPantalla Button
           End If
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
    Case "Reporte"
         MostrarReporte
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Sub MostrarReporte()
Dim strSQL As String

        strSQL = " SP_SumarMovimientosContablesporPeriodo_v3_3 "
        strSQL = strSQL + "'" + Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00") + "',"
        strSQL = strSQL + "'" + Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59") + "',"
        strSQL = strSQL + "'" + objUsuario.dsUsuario + "',"
                
        If Trim(Me.txtBusqueda.Text) = "" Then
        
        Else
                objDiccionariodeDatos.ObtenerNombredeCampoFisico _
                "TB_ResumenMovimientosContables", Me.cmbCampos.Text
                
                Select Case objDiccionariodeDatos.nmCampo
                Case "tpConcepto"
                    strSQL = strSQL + "'" + ReemplazarPalabra(Me.txtBusqueda.Text, "*", "%") + "'"
                Case "tpOperacion"
                    strSQL = strSQL + "null,'" + ReemplazarPalabra(Me.txtBusqueda.Text, "*", "%") + "'"
                Case "dsConcepto"
                    strSQL = strSQL + "null,null,'" + ReemplazarPalabra(Me.txtBusqueda.Text, "*", "%") + "'"
                End Select
        End If
    
        objbasededatos.ExecStoredProcedures strSQL
        
        Frm_Principal.LimpiarReporte
        
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_ResumenMovimientoContable.rpt"
        
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Resumen de Mov. de Caja de la Administración "
        Frm_Principal.CrystalReport1.Formulas(1) = "FechaDesde='" + CStr(ObtenerCampo("dtDesde").value) + "'"
        Frm_Principal.CrystalReport1.Formulas(2) = "FechaHasta='" + CStr(ObtenerCampo("dtHasta").value) + "'"
        Frm_Principal.CrystalReport1.Formulas(3) = "dsUsuario='" + objUsuario.dsUsuario + "'"
        
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0

End Sub




Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    ' Ojo Verificar para cuando se cambie el valor del Dolar
    vlDiaEuro = CSng(objCajas.vlDiaEuro)
    vlDiaDolar = CSng(objCajas.vlDiaDolar)

    Select Case pTag
    Case "vlTotalSaldoRealFinal"
        ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
    Case "vlTotalSaldoCierre"
        ObtenerPesos = ObtenerValoresNumericos("vlCierreEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierreDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierrePesos")
    Case "vlTotalSaldoInicial"
        ObtenerPesos = ObtenerValoresNumericos("vlSaldoInicialEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoInicialDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoInicialPesos")
    End Select

    
End Function




Private Function ValidarEntrada() As Boolean

    ValidarEntrada = True
    
    

    If ObtenerValoresNumericos("vlEuros") + _
       ObtenerValoresNumericos("vlDolares") + _
       ObtenerValoresNumericos("vlPesos") <= 0 Then
        MsgBox "Debe ingresar los valores del Movimiento.", vbInformation + vbDefaultButton1, "Atención"
        AvisarError "vlPesos", True
        ValidarEntrada = False
    End If
    
    If Trim(ObtenerCampo("cdConcepto").Text) = "" Then
        MsgBox "De elegir el concepto.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dsConceptoBuscado").SetFocus
        ValidarEntrada = False
        Exit Function
    End If


    If Trim(ObtenerCampo("cdConcepto").Text) = "" Then
        MsgBox "De elegir el concepto.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dsConceptoBuscado").SetFocus
        ValidarEntrada = False
        Exit Function
    End If
    

End Function



Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


    Private Function ObtenerValoresNumericos(pTag As String) As Single

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
    End Function




Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbCritical + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_MovimientosContables"
        ObjTablasIO.setearCampoOperadorValor "IdMovimiento", "=", ObtenerCampo("IdMovimiento").Text
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function


Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_ResumenMovimientosContables") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
End Sub





Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           If objCajas.puedeOperar(ObtenerCampo("nrCaja"), ObtenerCampo("cdConcepto")) Then
                Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Enabled = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("dsConceptoBuscado").SetFocus
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           If objParametros.ObtenerValor("CajaAbierta") = "SI" Then
                Me.tlb_ABM.Buttons("Agregar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Agregar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
             Me.tlb_ABM.Buttons("Agregar").Visible = False
           Else
             Me.tlb_ABM.Buttons("Agregar").Visible = True
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
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
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         
         
         objbasededatos.SP_SumarMovimientosContablesporPeriodo _
            Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), _
            Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59"), _
            objUsuario.dsUsuario
         
         Screen.ActiveForm.MousePointer = vbHourglass
         
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_ResumenMovimientosContables"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_ResumenMovimientosContables", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", ""
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_ResumenMovimientosContables", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         
         ObjTablasIO.setearCampoOperadorValor "vlSumaPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSumaDolares", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSumaEuros", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSumaEuros", "->", objUsuario.dsUsuario
         ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", objUsuario.dsUsuario
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_ResumenMovimientosContables"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            ' Me.lstBusqueda.ListItems.Item(1).Selected = True
            Me.lstBusqueda.SortKey = 0
            Me.lstBusqueda.SortOrder = lvwAscending
            Me.lstBusqueda.Sorted = True
            ColorearLineas
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            ' MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_ResumenMovimientosContables", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_MovimientosContables", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault

    
End Sub



Private Sub ColorearLineas()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
            If j = 1 Then
                If Me.lstBusqueda.ListItems(i).SubItems(1) = "Salida de Dinero" Then
                     Me.lstBusqueda.ListItems(i).ForeColor = Rojo
                     Me.lstBusqueda.ListItems(i).Bold = True
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(3).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(3).Text))
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(4).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(4).Text))
                     Me.lstBusqueda.ListItems(i).ListSubItems.Item(5).Text = -Abs(CSng(Me.lstBusqueda.ListItems(i).ListSubItems.Item(5).Text))
                Else
                     Me.lstBusqueda.ListItems(i).ForeColor = Azul
                     Me.lstBusqueda.ListItems(i).Bold = False
                End If
            End If
            If Me.lstBusqueda.ListItems(i).SubItems(1) = "Salida de Dinero" Then
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = True
            Else
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Azul
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = False
            End If
        Next j
        
    Next i

End Sub





