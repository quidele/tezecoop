VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_IVAVentas 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "IVA Ventas"
   ClientHeight    =   7335
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10575
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   Icon            =   "Frm_IVAVentas.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7335
   ScaleWidth      =   10575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10575
      _ExtentX        =   18653
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgResumenLicenciatarios"
      DisabledImageList=   "imgResumenLicenciatarios"
      HotImageList    =   "imgResumenLicenciatarios"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Caja"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Caja deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Caja"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Reporte"
            Key             =   "Reporte"
            ImageKey        =   "Reporte"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_IVAVentas.frx":030A
      Begin MSComctlLib.ImageList imgResumenLicenciatariosResaltado 
         Left            =   1770
         Top             =   945
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
               Picture         =   "Frm_IVAVentas.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":1BDA
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":2254
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgResumenLicenciatarios 
         Left            =   8175
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
               Picture         =   "Frm_IVAVentas.frx":2366
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":247E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":25D2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":26EA
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":27F6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":294A
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":2A52
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":30CE
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":322E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":3682
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":3AD6
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4150
               Key             =   "Reporte"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   7305
      Left            =   -60
      TabIndex        =   1
      Top             =   615
      Width           =   10305
      Begin VB.ComboBox cbotpComprobante 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_IVAVentas.frx":4262
         Left            =   1980
         List            =   "Frm_IVAVentas.frx":4275
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Tag             =   "tpComprobante"
         Top             =   360
         Width           =   840
      End
      Begin VB.ComboBox cbotpLetra 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_IVAVentas.frx":428F
         Left            =   2880
         List            =   "Frm_IVAVentas.frx":42A5
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Tag             =   "tpLetra"
         Top             =   360
         Width           =   840
      End
      Begin VB.ComboBox cboFacturacion 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_IVAVentas.frx":42BE
         Left            =   3750
         List            =   "Frm_IVAVentas.frx":42CB
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Tag             =   "tpComprobante"
         Top             =   360
         Width           =   1320
      End
      Begin VB.ComboBox cboAnio 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_IVAVentas.frx":42E6
         Left            =   990
         List            =   "Frm_IVAVentas.frx":4341
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Tag             =   "tpComprobante"
         Top             =   360
         Width           =   975
      End
      Begin VB.ComboBox cboMes 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         ItemData        =   "Frm_IVAVentas.frx":43F3
         Left            =   150
         List            =   "Frm_IVAVentas.frx":441B
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Tag             =   "tpComprobante"
         Top             =   360
         Width           =   825
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2790
         TabIndex        =   2
         Top             =   3045
         Visible         =   0   'False
         Width           =   5340
         Begin VB.CommandButton cmdCancelar 
            Caption         =   "&Cancelar"
            Height          =   420
            Left            =   2160
            TabIndex        =   16
            Top             =   1110
            Width           =   1065
         End
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   3
            Top             =   615
            Width           =   4650
            _ExtentX        =   8202
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label2 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4485
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
         Begin VB.Label Label1 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   4
            Top             =   360
            Width           =   855
         End
      End
      Begin VB.CommandButton cmdBuscar 
         Height          =   330
         Left            =   5085
         Picture         =   "Frm_IVAVentas.frx":444F
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   345
         Width           =   375
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   5985
         Top             =   105
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483648
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   7
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4551
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4663
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4775
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4887
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4999
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4AAB
               Key             =   "Menor"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_IVAVentas.frx":4BBD
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5820
         Left            =   168
         TabIndex        =   13
         Top             =   780
         Width           =   9996
         _ExtentX        =   17621
         _ExtentY        =   10266
         View            =   3
         LabelEdit       =   1
         MultiSelect     =   -1  'True
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
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   11
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "Fecha"
            Text            =   "FECHA"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "TIPO"
            Text            =   "TIPO"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "Nro COMP"
            Text            =   "Nro COMP"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "RAZON_SOCIAL"
            Text            =   "RAZON_SOCIAL"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "CAT_IVA"
            Text            =   "CAT_IVA"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "CUIT/DNI"
            Text            =   "CUIT/DNI"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "EXENTO"
            Text            =   "EXENTO"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "GRAVADO"
            Text            =   "GRAVADO"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "IVA"
            Text            =   "IVA"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "IMPORTE"
            Text            =   "IMPORTE"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "ANULADO"
            Text            =   "ANULADO"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.Label lblLabels 
         Caption         =   "Letra"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   2895
         TabIndex        =   19
         Top             =   135
         Width           =   645
      End
      Begin VB.Label lblLabels 
         Caption         =   "Facturación"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   3750
         TabIndex        =   15
         Top             =   120
         Width           =   1290
      End
      Begin VB.Label lblLabels 
         Caption         =   "Tipo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   1
         Left            =   1980
         TabIndex        =   9
         Top             =   120
         Width           =   816
      End
      Begin VB.Label Label4 
         Caption         =   "Año"
         Height          =   300
         Left            =   1035
         TabIndex        =   8
         Top             =   105
         Width           =   825
      End
      Begin VB.Label Label3 
         Caption         =   "Mes"
         Height          =   300
         Left            =   150
         TabIndex        =   7
         Top             =   105
         Width           =   825
      End
   End
End
Attribute VB_Name = "Frm_IVAVentas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM    As Byte
Dim objControl   As New CControl
Dim bExportando  As Boolean

Public Sub RefrescarProgressbar(pAvance As Long)

    DoEvents
    On Error Resume Next
    Me.ProgressBar.value = pAvance
    Me.lblvlPorcentaje.Caption = CStr(pAvance) + " %"
    On Error GoTo 0
    Me.Visible = True
    DoEvents

End Sub




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

Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Sub ColorearLineasyResaltarObservacion()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        If Me.lstBusqueda.ListItems(i).SubItems(16) <> "" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 7
            ItemList.CreateDragImage
    
        
        End If
    
    Next i

End Sub


Private Sub cmdBuscar_Click()
Dim strSQL As String
Dim rs     As Object


    Me.lstBusqueda.ListItems.Clear
    strSQL = "SP_ObtenerIVAVentas__v4_9_71"
    
    If Trim(Me.cboMes.Text) = "" Then
        MsgBox "Por favor complete el mes.", vbInformation, "Atención"
        Me.cboMes.SetFocus
        Exit Sub
    Else
        strSQL = strSQL + " @nrMes_param=" + Me.cboMes.Text + ","
    End If
    If Trim(Me.cboAnio.Text) = "" Then
        MsgBox "Por favor complete el Año.", vbInformation, "Atención"
        Me.cboAnio.SetFocus
        Exit Sub
    Else
        strSQL = strSQL + "@nrAnio_param=" + Me.cboAnio.Text + ","
    End If
       
    Select Case Me.cbotpComprobante.Text
    Case "Todo", ""
        strSQL = strSQL + "@tpComprobante_param=null,"
    Case Else
            strSQL = strSQL + "@tpComprobante_param='" + Me.cbotpComprobante.Text + "',"
    End Select
    
    Select Case Me.cboFacturacion.Text
    Case "Todo", ""
        strSQL = strSQL + "@tpFacturacion_param=null,"
    Case "Manual"
            strSQL = strSQL + "@tpFacturacion_param='M',"
    Case "Sistema"
            strSQL = strSQL + "@tpFacturacion_param='N',"
    End Select
    
    Select Case Me.cbotpLetra.Text
    Case "Todo", ""
        strSQL = strSQL + "@tpLetra_param=null"
    Case Else
        strSQL = strSQL + "@tpLetra_param='" + Me.cbotpLetra.Text + "'"
    End Select

    HabilitarDeshabilitar_Controles False
    
    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
        HabilitarDeshabilitar_Controles True
        MsgBox "Error: " + objbasededatos.Error, vbCritical, "Atención"
        Exit Sub
    End If

    objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstBusqueda, 0, "SP_ObtenerIVAVentas_v2_1"
    
    objbasededatos.rs_resultados.Close

    If Me.lstBusqueda.ListItems.Count = 0 Then
        MsgBox "No hay datos para disponibles.", vbInformation, "Atención"
        Me.Visible = True
    End If
    
    HabilitarDeshabilitar_Controles True
    
End Sub


'*************************************'
Public Function CargarListView_SG_ControlaSaltosdeFacturacionInsertaLineaenBlanco _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer) As Integer
  Dim i, j                  As Integer
  Dim Valor                 As String
  Dim elemList              As ListItem
  Dim nrComprobanteAnterior As Double
  Dim haySalto              As Boolean
  Dim haySaltoAnterior      As Boolean
  i = 1
  
  
  nrComprobanteAnterior = CLng(0)
  haySaltoAnterior = False
  'cargar el control listview
  Do Until rs_registros.EOF
    
    haySalto = False
    
    
     ' Hay Salto de facturacion
     If nrComprobanteAnterior <> 0 _
        And nrComprobanteAnterior <> CDbl(rs_registros(1).value) - 1 And _
        Not haySaltoAnterior Then
        haySalto = True
        Set elemList = lst_lista.ListItems.Add(i, , "SALTO", , img)
        elemList.ForeColor = vbRed
        i = i + 1
        haySaltoAnterior = True
     Else
        haySaltoAnterior = False
     End If
     
     
    Valor = CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), ""))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
         Valor = ReemplazarPalabra(Valor, "Falso", "NO")
     On Error Resume Next
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
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
            
            ' If haySalto Then
            ' elemList.ListSubItems(j - 1).ForeColor = vbRed
            ' End If
            
         End If
     Next
     
     nrComprobanteAnterior = CDbl(rs_registros(1).value)
     rs_registros.MoveNext
     i = i + 1
  Loop
  
  
End Function
'*******************************************'




'*************************************'
Public Function CargarListView_SG_ControlaSaltosdeFacturacion _
 (rs_registros As Object, _
  lst_lista As ListView, img As Integer) As Integer
  Dim i, j                  As Integer
  Dim Valor                 As String
  Dim elemList              As ListItem
  Dim nrComprobanteAnterior As Long
  Dim haySalto              As Boolean
  
  i = 1
  
  
  nrComprobanteAnterior = CLng(0)
  
  'cargar el control listview
  Do Until rs_registros.EOF
    
    haySalto = False
    
    Valor = CStr(AdaptarNulos(rs_registros(lst_lista.ColumnHeaders.Item(1).Tag), ""))
         Valor = ReemplazarPalabra(Valor, "True", "SI")
         Valor = ReemplazarPalabra(Valor, "False", "NO")
         Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
         Valor = ReemplazarPalabra(Valor, "Falso", "NO")
     On Error Resume Next
     Set elemList = lst_lista.ListItems.Add(i, , Valor, , img)
     If Err Then
        Exit Function
     End If
     On Error GoTo 0
     
     ' Hay Salto de facturacion
     If Resto(i, 2) = 0 Then
        haySalto = True
        elemList.ForeColor = vbBlue
     End If
     
     For j = 2 To lst_lista.ColumnHeaders.Count
         Valor = ""
         If Not IsNull(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag))) Then
           Valor = CStr(AdaptarNulos(rs_registros(Trim(lst_lista.ColumnHeaders.Item(j).Tag)), ""))
            Valor = ReemplazarPalabra(Valor, "True", "SI")
            Valor = ReemplazarPalabra(Valor, "False", "NO")
            Valor = ReemplazarPalabra(Valor, "Verdadero", "SI")
            Valor = ReemplazarPalabra(Valor, "Falso", "NO")
            elemList.SubItems(j - 1) = Valor
            If haySalto Then
            elemList.ListSubItems(j - 1).ForeColor = vbBlue
            End If
         End If
     Next
     
     nrComprobanteAnterior = CLng(rs_registros(5).value)
     rs_registros.MoveNext
     i = i + 1
  Loop
  
  
End Function
'*******************************************'


Public Function Resto(ByVal Dividendo As Long, ByVal Divisor As Long) As Long

    While Dividendo > Divisor
        Dividendo = Dividendo - Divisor
    Wend
    Resto = Dividendo
    
End Function

Public Sub HabilitarDeshabilitar_Controles(pbbloquear As Boolean)

    Me.cboAnio.Enabled = pbbloquear
    Me.cboFacturacion.Enabled = pbbloquear
    Me.cboMes.Enabled = pbbloquear
    Me.cbotpComprobante.Enabled = pbbloquear
    Me.cmdBuscar.Enabled = pbbloquear
    
End Sub




Private Sub cmdCancelar_Click()
Dim resp   As Byte

    resp = MsgBox("Esta seguro que desea cancelar la exportación", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        objExportar.bCancelar = True
    End If
    
End Sub

Private Sub Form_Activate()

    If Len(Month(Date)) = 1 Then
        Me.cboMes.Text = "0" + CStr(Month(Date))
    Else
        Me.cboMes.Text = CStr(Month(Date))
    End If
    If Len(Year(Date)) = 2 Then
        Me.cboAnio.Text = "20" + CStr(Year(Date))
    Else
        Me.cboAnio.Text = Year(Date)
    End If
    Me.cbotpComprobante.ListIndex = 0
    Me.cbotpLetra.ListIndex = 0
    Me.cboFacturacion.ListIndex = 0
    Me.cboMes.SetFocus
    Me.Visible = True
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
    Case vbKeyEscape
            If EstadoABM = Consulta Then
                If tlb_ABM.Buttons("Salir").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
                End If
            Else
                If tlb_ABM.Buttons("Cancelar").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
                End If
            End If
    Case vbKeyF2
            If tlb_ABM.Buttons("Buscar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
            End If
    Case vbKeyF5
        If EstadoABM = Consulta Then
            If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
            End If
        Else
            If tlb_ABM.Buttons("Eliminar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
            End If
        End If
    End Select


End Sub

Private Sub Form_Load()

    
    
    
    Me.cbotpComprobante.Clear
    
    Me.cbotpComprobante.AddItem ("Todo")
    Me.cbotpComprobante.AddItem ("A")
    Me.cbotpComprobante.AddItem ("B")
    Me.cbotpComprobante.AddItem ("B1")
    Me.cbotpComprobante.AddItem ("C")
    Me.cbotpComprobante.AddItem ("E")
    Me.cbotpComprobante.AddItem ("FA")
    Me.cbotpComprobante.AddItem ("M")
    Me.cbotpComprobante.AddItem ("NC")
    Me.cbotpComprobante.AddItem ("RE")
    Me.cbotpComprobante.AddItem ("X")
    
    
    Me.cbotpLetra.Clear
    Me.cbotpLetra.AddItem ("Todo")
    Me.cbotpLetra.AddItem ("A")
    Me.cbotpLetra.AddItem ("B")
    Me.cbotpLetra.AddItem ("B1")
    Me.cbotpLetra.AddItem ("C")
    Me.cbotpLetra.AddItem ("E")
    Me.cbotpLetra.AddItem ("M")
    Me.cbotpLetra.AddItem ("X")
    
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Aceptar")
    
    
End Sub




Private Sub BusquedaporClave(pClave As String)
Dim Control As Control
Dim Valor   As Variant
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave
    
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
                            ("TB_Cupones", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub





Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    If bExportando Then
        Cancel = 1
    End If
    
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
          cmdBuscar_Click
          PresentarPantalla Button
           ' buscar en la base de datos
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
    Case "Imprimir"
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Reporte"
        ' generar el reporte
        cmdGenerarReporte
    Case "Cancelar"
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Resumen"
    End Select
    
End Sub


Private Sub cmdGenerarReporte()
Dim tpComprobante As String
Dim tpFacturacion As String
Dim nrMes         As String
Dim nrAnio         As String
    
    If Trim(Me.cboMes.Text) = "" Then
        MsgBox "Por favor complete el mes.", vbInformation, "Atención"
        Me.cboMes.SetFocus
        Exit Sub
    Else
        nrMes = Me.cboMes.Text
    End If
    If Trim(Me.cboAnio.Text) = "" Then
        MsgBox "Por favor complete el Año.", vbInformation, "Atención"
        Me.cboAnio.SetFocus
        Exit Sub
    Else
        nrAnio = Me.cboAnio.Text
    End If
       
    Select Case Me.cbotpComprobante.Text
    Case "Todo", ""
        tpComprobante = " "
    Case Else
        tpComprobante = Me.cbotpComprobante.Text
    End Select
    
    Select Case Me.cboFacturacion.Text
    Case "Todo", ""
        tpFacturacion = ""
    Case "Manual"
        tpFacturacion = "M"
    Case "Automática"
        tpFacturacion = "N"
    End Select

    HabilitarDeshabilitar_Controles False
    
    
    ImprimirReporteIVAventas nrMes, nrAnio, tpComprobante, tpFacturacion, False


    HabilitarDeshabilitar_Controles True


End Sub



Private Sub ImprimirReporteIVAventas(pnrMes, pnrAnio, ptpComprobante, ptpFacturación, pSalidaImpresora As Boolean)

        
        Frm_Principal.LimpiarReporte
        
        
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_ivaventas_v2_1.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        If pSalidaImpresora Then
            Frm_Principal.CrystalReport1.Destination = crptToPrinter
        Else
            Frm_Principal.CrystalReport1.Destination = crptToWindow
        End If
        
        Frm_Principal.CrystalReport1.WindowTitle = "Reporte IVA ventas - Mes:" + pnrMes + " - Año:" + pnrAnio
        
        Frm_Principal.CrystalReport1.StoredProcParam(0) = pnrMes
        Frm_Principal.CrystalReport1.StoredProcParam(1) = pnrAnio
        Frm_Principal.CrystalReport1.StoredProcParam(2) = ptpComprobante
        Frm_Principal.CrystalReport1.StoredProcParam(3) = ptpFacturación
        
        
        
        Frm_Principal.CrystalReport1.Formulas(1) = "@Mes=" + pnrMes
        Frm_Principal.CrystalReport1.Formulas(2) = "@Anio=" + pnrAnio
        
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0
        
    
End Sub

Private Sub ExportaraExcel()
Dim strError  As String

    
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub

    objExportar.ConProgressBar = True
    Me.tlb_ABM.Enabled = False
    Me.lstBusqueda.Enabled = False
    bExportando = True
    HabilitarDeshabilitar_Controles False
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", _
    True, "Plantilla.xls", strError, Me.lstBusqueda, "SP_ObtenerIVAVentas_v2_1") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Screen.MousePointer = vbDefault
        HabilitarDeshabilitar_Controles True
        Me.fra_ProgressBar.Visible = False
        bExportando = False
        Me.tlb_ABM.Enabled = True
        Me.lstBusqueda.Enabled = True
        Exit Sub
    End If
    HabilitarDeshabilitar_Controles True
    Screen.MousePointer = vbDefault
    Me.fra_ProgressBar.Visible = False
    bExportando = False
    Me.tlb_ABM.Enabled = True
    Me.lstBusqueda.Enabled = True
    
End Sub







Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Buscar"
           fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Reporte").Visible = True
    Case "Seleccionar"
           fraBusqCajas.Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
    Case "Aceptar"
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Reporte").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.lstBusqueda.Visible = True
    Case "Cancelar"
           fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
    End Select
    
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
