VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ABMNivelAcceso 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Maestro de Nivel de Acceso"
   ClientHeight    =   7230
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9540
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMNivelAcceso.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   9540
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   9540
      _ExtentX        =   16828
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMNiveldeAcceso"
      HotImageList    =   "imgABMNiveldeAccesoResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Usuario"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Usuario deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Usuario"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageIndex      =   9
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageIndex      =   10
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ABMNivelAcceso.frx":030A
      Begin MSComctlLib.ImageList imgABMNiveldeAccesoResaltado 
         Left            =   5850
         Top             =   885
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   10
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMNiveldeAcceso 
         Left            =   7800
         Top             =   15
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   10
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMNiveldeAcceso 
      BorderStyle     =   0  'None
      Height          =   6630
      Left            =   -75
      TabIndex        =   8
      Top             =   705
      Width           =   9570
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   6255
         Left            =   345
         ScaleHeight     =   6225
         ScaleWidth      =   9165
         TabIndex        =   9
         Top             =   120
         Width           =   9195
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   225
            TabIndex        =   18
            Tag             =   "tpNivelAcceso"
            Top             =   375
            Width           =   3045
         End
         Begin MSComctlLib.ListView lstOpcionesMenu 
            Height          =   5010
            Left            =   225
            TabIndex        =   16
            Top             =   1020
            Width           =   8790
            _ExtentX        =   15505
            _ExtentY        =   8837
            View            =   3
            LabelEdit       =   1
            MultiSelect     =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            OLEDragMode     =   1
            OLEDropMode     =   1
            Checkboxes      =   -1  'True
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            OLEDragMode     =   1
            OLEDropMode     =   1
            NumItems        =   3
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Object.Tag             =   "dsOpcionMenu"
               Text            =   "Opción de Menú"
               Object.Width           =   9525
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Object.Tag             =   "tpNivelJerarquico"
               Text            =   "Nivel Jerárquico"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Object.Tag             =   "IdOpcionMenu"
               Text            =   "Cod. de Menu"
               Object.Width           =   0
            EndProperty
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Menues/Opciones de Sistema"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   1
            Left            =   225
            TabIndex        =   17
            Top             =   765
            Width           =   4215
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Tipo de Acceso"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   10
            Top             =   150
            Width           =   1995
         End
      End
   End
   Begin VB.Frame fraBusqNiveldeAcceso 
      BorderStyle     =   0  'None
      Height          =   6645
      Left            =   0
      TabIndex        =   4
      Top             =   585
      Width           =   9495
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2190
         TabIndex        =   11
         Top             =   2250
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   330
            TabIndex        =   12
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   15
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   14
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   13
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4275
         TabIndex        =   0
         Top             =   315
         Width           =   5175
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
               Picture         =   "Frm_ABMNivelAcceso.frx":334A
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":345C
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":356E
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":3680
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":3792
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMNivelAcceso.frx":38A4
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2520
         TabIndex        =   3
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
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5700
         Left            =   135
         TabIndex        =   1
         Top             =   750
         Width           =   9300
         _ExtentX        =   16404
         _ExtentY        =   10054
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
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "tpNivelAcceso"
            Text            =   "Tipo de Nivel de Acceso"
            Object.Width           =   8819
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   105
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   120
         TabIndex        =   5
         Top             =   105
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4260
         TabIndex        =   6
         Top             =   90
         Width           =   1755
      End
   End
End
Attribute VB_Name = "Frm_ABMNivelAcceso"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl


Const CONST_IDOPCIONMENU = 2
Const CONST_OPERACAJA = 4


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



Private Sub cmdResetear_Click()

    ObtenerCampo("dsPassword") = objbasededatos.hashCadena("1234")
    
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
    End Select


End Sub

Private Sub Form_Load()

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    cargarcamposdebusqueda
    
    Me.cmbCampos.ListIndex = 0
        
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_NivelAcceso"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_NivelAcceso")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_NivelAcceso")
    Loop
    Me.cmbCampos.ListIndex = 0

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_NivelAcceso", Me.cmbCampos.Text
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

Private Sub lstBusqueda_DblClick()
Dim Control As Control
Dim Valor   As Variant


    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    ObjTablasIO.nmTabla = "TB_NivelAcceso"
    ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", _
    "=", Me.lstBusqueda.SelectedItem.Text
    
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            
            End If
        End If
    Next
    ObjTablasIO.Seleccionar
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_NivelAcceso", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    
    Me.lstOpcionesMenu.ListItems.Clear
    
    objSPs.nmStoredProcedure = "sco_AccesosOpcionesMenu"
    objSPs.setearCampoValor "@p_tpNivelAcceso", ObtenerCampo("tpNivelAcceso")
    
    If Not objSPs.ExecSP() Then
        MsgBox "No se pudieron obtener las opciones de Menu.", vbInformation, "Seguridad"
    Else
       CargarListView_SG_Checked objSPs.rs_resultados, Me.lstOpcionesMenu, 0, "flAcceso", "nrNivelHoja"
    End If
    
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub


'*************************************'
Private Function CargarListView_SG_Checked _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer, _
  pnmCampoChecked As String, pnmCampoTag As String) As Integer
  Dim i, j             As Integer
  Dim Valor            As String
  Dim elemList         As ListItem
  
  i = 1
  
  'cargar el control listview
  Do Until rs_registros.EOF
    Valor = CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), ""))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
         Valor = ReemplazarPalabra(Valor, "Falso", "NO")
     On Error Resume Next
   
     Valor = Space(rs_registros("nrNivelHoja") * 10) + Valor
     
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
     
     elemList.Checked = rs_registros("flAcceso")
     
     If Err Then
        Exit Function
     End If
     On Error GoTo 0
     
     For j = 2 To lst_lista.ColumnHeaders.Count
         Valor = ""
         If Not IsNull(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag))) Then
           Valor = CStr(AdaptarNulos(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag)), ""))
            Valor = ReemplazarPalabra(Valor, "True", "SI")
            Valor = ReemplazarPalabra(Valor, "False", "NO")
            Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
            Valor = ReemplazarPalabra(Valor, "Falso", "NO")
            elemList.SubItems(j - 1) = Valor
         End If
     Next
     rs_registros.MoveNext
     i = i + 1
  Loop
  
End Function
'*******************************************'



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
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"

            limpiarControles
            Me.lstOpcionesMenu.ListItems.Clear
            objSPs.nmStoredProcedure = "sco_AccesosOpcionesMenu"
            objSPs.setearCampoValor "@p_tpNivelAcceso", ObtenerCampo("tpNivelAcceso")
            If Not objSPs.ExecSP() Then
                MsgBox "No se pudieron obtener las opciones de Menu.", vbInformation, "Seguridad"
            Else
                CargarListView_SG_Checked objSPs.rs_resultados, Me.lstOpcionesMenu, 0, "flAcceso", "nrNivelHoja"
            End If
           EstadoABM = alta
           limpiarControles
           PresentarPantalla Button
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
           If Guardarregistro(EstadoABM) Then
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub


Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        
        objbasededatos.BeginTrans
        
        If Not EliminarNiveldeAccesoOpcionesdeMenu() Then
            objbasededatos.RollBackTrans
            MsgBox "Error: no se pudo eliminar el registro. " + _
            ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
            EliminarRegistro = False
            Exit Function
        End If
        
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_NivelAcceso"
        ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", "=", ObtenerCampo("tpNivelAcceso").Text
        
        If ObjTablasIO.Eliminar() Then
            objbasededatos.CommitTrans
            
            MsgBox "Se ha eliminado con exito el registro", vbInformation, "Atención"
            EliminarRegistro = True
        Else
            objbasededatos.RollBackTrans
            MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
        End If
    End If
    
End Function


Private Sub ExportaraExcel()
Dim strError  As String

    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    

    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", _
    True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_NivelAcceso") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    objbasededatos.BeginTrans
    
    ObjTablasIO.nmTabla = "TB_NivelAcceso"
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            strPrefijo = Mid(Control.Tag, 1, 3)
            If Not strPrefijo = "lbl" Then
                If Not Control.Tag = "" Then
                    strtag = Mid(Control.Tag, 1, 2)
                        If strtag = "fl" Then
                            ObjTablasIO.setearCampoOperadorValor _
                            Control.Tag, _
                            "<-", Control.value
                        Else
                            ObjTablasIO.setearCampoOperadorValor _
                            Control.Tag, _
                            "<-", Trim(Control.Text)
                        End If
                End If
             End If
        End If
    Next

    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", _
            "=", ObtenerCampo("tpNivelAcceso").Text
            If Not ObjTablasIO.Actualizar() Then
                objbasededatos.RollBackTrans
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                If Not ActualizarNiveldeAccesoOpcionesdeMenu() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: no se pudo insertar el registro. " + _
                    ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                    Guardarregistro = False
                    Exit Function
                End If
                ' todo estuvo ok comiteamos la transaccion
                objbasededatos.CommitTrans
    
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                objbasededatos.RollBackTrans
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
            
                If Not GuardarNiveldeAccesoOpcionesdeMenu() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: no se pudo insertar el registro. " + _
                    ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                    Guardarregistro = False
                    Exit Function
                End If
                
                ' todo estuvo ok comiteamos la transaccion
                objbasededatos.CommitTrans
    
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    End Select

End Function


Private Function GuardarNiveldeAccesoOpcionesdeMenu() As Boolean
Dim stridOpcionMenu  As String
Dim strtpNivelAcceso    As String
Dim i                   As Integer
Dim flAcceso            As Integer

    GuardarNiveldeAccesoOpcionesdeMenu = False

    For i = 1 To Me.lstOpcionesMenu.ListItems.Count
        
        flAcceso = Me.lstOpcionesMenu.ListItems(i).Checked
        stridOpcionMenu = Me.lstOpcionesMenu.ListItems(i).SubItems(CONST_IDOPCIONMENU)
        strtpNivelAcceso = ObtenerCampo("tpNivelAcceso")
    
        ObjTablasIO.nmTabla = "TB_NivelAccesoOpcionesMenu"
        ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", "<-", strtpNivelAcceso, " AND "
        ObjTablasIO.setearCampoOperadorValor "idOpcionMenu", "<-", stridOpcionMenu
        ObjTablasIO.setearCampoOperadorValor "flAcceso", "<-", CStr(flAcceso)
        
        If Not ObjTablasIO.Insertar() Then
            Exit Function
        End If
        
    Next i

    GuardarNiveldeAccesoOpcionesdeMenu = True
    
    
End Function



Private Function EliminarNiveldeAccesoOpcionesdeMenu() As Boolean
Dim stridOpcionMenu  As String
Dim strtpNivelAcceso    As String
Dim i                   As Integer
Dim flAcceso            As Integer

    EliminarNiveldeAccesoOpcionesdeMenu = False

    For i = 1 To Me.lstOpcionesMenu.ListItems.Count
        
        flAcceso = Me.lstOpcionesMenu.ListItems(i).Checked
        stridOpcionMenu = Me.lstOpcionesMenu.ListItems(i).SubItems(CONST_IDOPCIONMENU)
        strtpNivelAcceso = ObtenerCampo("tpNivelAcceso")
    
        ObjTablasIO.nmTabla = "TB_NivelAccesoOpcionesMenu"
        ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", "=", strtpNivelAcceso, " AND "
        ObjTablasIO.setearCampoOperadorValor "idOpcionMenu", "=", stridOpcionMenu
        ObjTablasIO.setearCampoOperadorValor "flAcceso", "->", CStr(flAcceso)
        
        If Not ObjTablasIO.Eliminar Then
            Exit Function
        End If
        
    Next i

    EliminarNiveldeAccesoOpcionesdeMenu = True
    
    
End Function


Private Function ActualizarNiveldeAccesoOpcionesdeMenu() As Boolean
Dim stridOpcionMenu  As String
Dim strtpNivelAcceso    As String
Dim i                   As Integer
Dim flAcceso            As Integer

    ActualizarNiveldeAccesoOpcionesdeMenu = False

    For i = 1 To Me.lstOpcionesMenu.ListItems.Count
        
        flAcceso = Me.lstOpcionesMenu.ListItems(i).Checked
        stridOpcionMenu = Me.lstOpcionesMenu.ListItems(i).SubItems(CONST_IDOPCIONMENU)
        strtpNivelAcceso = ObtenerCampo("tpNivelAcceso")
    
        ObjTablasIO.nmTabla = "TB_NivelAccesoOpcionesMenu"
        ObjTablasIO.setearCampoOperadorValor "tpNivelAcceso", "=", strtpNivelAcceso, " AND "
        ObjTablasIO.setearCampoOperadorValor "idOpcionMenu", "=", stridOpcionMenu
        ObjTablasIO.setearCampoOperadorValor "flAcceso", "<-", CStr(flAcceso)
        
        If Not ObjTablasIO.Actualizar() Then
            Exit Function
        End If
        
    Next i

    ActualizarNiveldeAccesoOpcionesdeMenu = True
    
End Function






Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqNiveldeAcceso.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMNiveldeAcceso.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "tpNivelAcceso", False
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqNiveldeAcceso.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMNiveldeAcceso.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
           HabilitarCampos "tpNivelAcceso", True
           ObtenerCampo("tpNivelAcceso").SetFocus
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMNiveldeAcceso.Visible = False
           Me.fraBusqNiveldeAcceso.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMNiveldeAcceso.Visible = False
           Me.fraBusqNiveldeAcceso.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMNiveldeAcceso.Visible = False
           Me.fraBusqNiveldeAcceso.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    
    If Me.fraBusqNiveldeAcceso.Visible Then
        Me.fraBusqNiveldeAcceso.Visible = True
          Me.txtBusqueda.SetFocus
    End If
    

End Sub


Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    'habilitar = True Habilita
    'habilitar = False Deshabilita
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

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
         ObjTablasIO.nmTabla = "TB_NivelAcceso"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_NivelAcceso", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, "", "ASC"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_NivelAcceso", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_NivelAcceso"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_NivelAcceso", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_NivelAcceso", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
'    objDiccionariodeDatos.FormatearCampoControl "TB_NivelAcceso", _
'                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
'            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_NivelAcceso", _
'                                Me.txtFields(Index), KeyAscii)
    End If
    
End Sub




Private Sub ValidTextBox1_Click()

End Sub

Private Sub txtFields_LostFocus(Index As Integer)
    
'    objDiccionariodeDatos.FormatearCampoControl "TB_NivelAcceso", _
'                              Me.txtFields(Index), "LostFocus"
End Sub
