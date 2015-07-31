VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form Frm_ABMParametros 
   Caption         =   "Parametros"
   ClientHeight    =   7230
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   12285
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMParametros.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   12285
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   12285
      _ExtentX        =   21669
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMParametros"
      HotImageList    =   "imgABMParametrosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Parámetro"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Parámetro deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Parámetro"
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
            Object.Visible         =   0   'False
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
      MouseIcon       =   "Frm_ABMParametros.frx":030A
      Begin MSComctlLib.ImageList imgABMParametrosResaltado 
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
               Picture         =   "Frm_ABMParametros.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMParametros 
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
               Picture         =   "Frm_ABMParametros.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMParametros 
      BorderStyle     =   0  'None
      Height          =   6675
      Left            =   -15
      TabIndex        =   10
      Top             =   660
      Width           =   12255
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   4920
         Left            =   1635
         ScaleHeight     =   4890
         ScaleWidth      =   7980
         TabIndex        =   11
         Top             =   855
         Width           =   8010
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            Height          =   1170
            Index           =   0
            Left            =   270
            MaxLength       =   500
            MultiLine       =   -1  'True
            TabIndex        =   31
            Tag             =   "observacion"
            Top             =   3345
            Width           =   7440
         End
         Begin VB.ComboBox cbParametro_abm 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMParametros.frx":334A
            Left            =   285
            List            =   "Frm_ABMParametros.frx":334C
            TabIndex        =   1
            Tag             =   "grupo_parametro"
            Text            =   "Combo1"
            Top             =   420
            Width           =   3090
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   270
            TabIndex        =   24
            Tag             =   "vlParametro"
            Top             =   2280
            Width           =   6390
         End
         Begin VB.TextBox txtLongitud 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   300
            Left            =   2355
            TabIndex        =   23
            Tag             =   "nrTamanio"
            Top             =   1635
            Width           =   1305
         End
         Begin MSComCtl2.UpDown cmdUpDownTamanio 
            Height          =   315
            Left            =   3660
            TabIndex        =   22
            Top             =   1620
            Width           =   240
            _ExtentX        =   450
            _ExtentY        =   556
            _Version        =   393216
            BuddyControl    =   "txtLongitud"
            BuddyDispid     =   196613
            OrigLeft        =   4740
            OrigTop         =   945
            OrigRight       =   4980
            OrigBottom      =   1320
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   -1  'True
         End
         Begin VB.ComboBox cbTipodedato 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMParametros.frx":334E
            Left            =   270
            List            =   "Frm_ABMParametros.frx":3364
            Style           =   2  'Dropdown List
            TabIndex        =   19
            Tag             =   "tpParametro"
            Top             =   1620
            Width           =   2070
         End
         Begin VB.CheckBox Check1 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Editable"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   270
            TabIndex        =   25
            Tag             =   "flEditable"
            Top             =   2670
            Width           =   1980
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   270
            TabIndex        =   2
            Tag             =   "dsParametro"
            Top             =   1035
            Width           =   6390
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Observación"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   270
            Index           =   4
            Left            =   300
            TabIndex        =   30
            Top             =   3030
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Grupo"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   270
            Index           =   3
            Left            =   300
            TabIndex        =   26
            Top             =   150
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Longitud Máxima"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   270
            Index           =   2
            Left            =   2355
            TabIndex        =   21
            Top             =   1350
            Width           =   1545
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Tipo de Dato"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   270
            Index           =   0
            Left            =   270
            TabIndex        =   20
            Top             =   1350
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Valor"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   1
            Left            =   270
            TabIndex        =   13
            Top             =   2010
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Parámetro"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   27
            Left            =   270
            TabIndex        =   12
            Top             =   795
            Width           =   1995
         End
      End
   End
   Begin VB.Frame fraBusqParametros 
      BorderStyle     =   0  'None
      Height          =   6645
      Left            =   15
      TabIndex        =   6
      Top             =   570
      Width           =   12225
      Begin VB.CommandButton cmdBuscar 
         Height          =   375
         Left            =   4320
         Picture         =   "Frm_ABMParametros.frx":339F
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   330
         Width           =   375
      End
      Begin VB.ComboBox cbParametro 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   90
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Top             =   375
         Width           =   4125
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   3405
         TabIndex        =   14
         Top             =   3075
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   15
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
            TabIndex        =   18
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   17
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   16
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4215
         TabIndex        =   0
         Top             =   990
         Width           =   3690
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
               Picture         =   "Frm_ABMParametros.frx":34A1
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":35B3
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":36C5
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":37D7
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":38E9
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMParametros.frx":39FB
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2520
         TabIndex        =   5
         Top             =   1005
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
         Height          =   4935
         Left            =   75
         TabIndex        =   3
         Top             =   1530
         Width           =   12045
         _ExtentX        =   21246
         _ExtentY        =   8705
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
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "dsParametro"
            Text            =   "Parámetro"
            Object.Width           =   7056
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "vlParametro"
            Text            =   "Valor"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "tpParametro"
            Text            =   "Tipo de Dato"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "flEditable"
            Text            =   "Editable"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "grupo_parametro"
            Text            =   "Grupo"
            Object.Width           =   5292
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   105
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   1005
         Width           =   2400
      End
      Begin VB.Label Label5 
         Caption         =   "Grupo"
         Height          =   210
         Left            =   105
         TabIndex        =   28
         Top             =   150
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4230
         TabIndex        =   8
         Top             =   750
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   135
         TabIndex        =   7
         Top             =   750
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_ABMParametros"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const COLUMNA_VALOR = 1
Const COLUMNA_BLOQUEADO = 5
    
Dim EstadoABM As Byte
Dim objControl As New CControl
Dim objDicLocal As New CMySQLDiccDatos
Dim valorAnterior As String



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
    

    Me.cbTipodedato.ListIndex = 0
    
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







Private Sub cbTipodeAcceso_Change()

    
    
    AvisarError "tpAcceso", False
    
    
End Sub

Private Sub cbTipodeAcceso_Click()
    
    AvisarError "tpAcceso", False
    
End Sub

Private Sub cbParametro_abm_GotFocus()

  objDiccionariodeDatos.FormatearCampoControl "TB_Parametros", _
                              Me.cbParametro_abm, "GotFocus"


End Sub

Private Sub cbParametro_abm_LostFocus()

    objDiccionariodeDatos.FormatearCampoControl "TB_Parametros", _
                              Me.cbParametro_abm, "LostFocus"
                              
                              
End Sub

Private Sub cbParametro_Change()


    tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    
End Sub

Private Sub cbParametro_Click()

    tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    
End Sub

Private Sub cbTipodedato_Click()

   ObtenerCampo("nrTamanio") = obtenerTamanioxDefecto(ObtenerCampo("tpParametro"))

    Select Case UCase(ObtenerCampo("tpParametro"))
    Case "S/N", "FECHA CORTA", "FECHA LARGA"
        HabilitarCampos "nrTamanio", False
        cmdUpDownTamanio.Enabled = False
    Case Else
        HabilitarCampos "nrTamanio", True
        cmdUpDownTamanio.Enabled = True
    End Select
    
    
   ObtenerCampo("vlParametro").Text = ""
   
End Sub

Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub





Private Sub cmdBuscar_Click()

    tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    
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
    Me.cmbCampos.ListIndex = 1
    
    objbasededatos.ExecuteSQL (" select distinct grupo_parametro from TB_Parametros where grupo_parametro is not null union select '(Todos)' as grupo_parametro   ")
    objControl.CargarCombo Me.cbParametro, objbasededatos.rs_resultados, objbasededatos.rs_resultados("grupo_parametro")
    
    Me.cbParametro.Text = "(Todos)"
            
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Parametros"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Parametros")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Parametros")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Parametros", Me.cmbCampos.Text
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


    objGUI.SizeControls Me, Me.fraBusqParametros, Me.lstBusqueda
    
    
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
    

    objbasededatos.ExecuteSQL (" select distinct grupo_parametro from TB_Parametros where grupo_parametro is not null union select '(Todos)' as grupo_parametro ")
    objControl.CargarCombo Me.cbParametro_abm, objbasededatos.rs_resultados, objbasededatos.rs_resultados("grupo_parametro")
    
    ObjTablasIO.nmTabla = "TB_Parametros"
    ObjTablasIO.setearCampoOperadorValor "dsParametro", _
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
                            ("TB_Parametros", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
 
 
    
    Valor = objDicLocal.FormatearValorTipo(CStr(AdaptarNulos(ObjTablasIO.rs_resultados("vlParametro"), "")), ObtenerCampo("tpParametro"))
                            
    ObtenerCampo("vlParametro") = Valor
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
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
           PresentarPantalla Button
           objGUI.SizeControls Me, Me.fraBusqParametros, Me.lstBusqueda
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           objbasededatos.ExecuteSQL ("select distinct grupo_parametro from TB_Parametros")
           objControl.CargarCombo Me.cbParametro_abm, objbasededatos.rs_resultados, objbasededatos.rs_resultados("grupo_parametro")
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
           If Not ValidaDatosEntrada() Then
                Exit Sub
           End If
           If Guardarregistro(EstadoABM) Then
                Me.cbParametro.Text = "(Todos)"
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Function ValidaDatosEntrada() As Boolean

    ValidaDatosEntrada = False

    If Trim(ObtenerCampo("dsParametro")) = "" Then
        AvisarError "dsParametro", True
        ObtenerCampo("dsParametro").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("tpParametro")) = "" Then
        AvisarError "tpParametro", True
        ObtenerCampo("tpParametro").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("nrTamanio")) = "" Then
        AvisarError "nrTamanio", True
        ObtenerCampo("nrTamanio").SetFocus
        Exit Function
    End If
    
    
    If Trim(ObtenerCampo("vlParametro")) = "" Then
        AvisarError "vlParametro", True
        ObtenerCampo("vlParametro").SetFocus
        Exit Function
    End If
    
    ValidaDatosEntrada = True


End Function


Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Parametros"
        ObjTablasIO.setearCampoOperadorValor "dsParametro", "=", ObtenerCampo("dsParametro").Text
        
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation, "Atención"
            EliminarRegistro = True
        Else
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
    True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Parametros") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Private Function grabarTabladeAuditoria()


        ' grabamos la tabla de auditorias
        objAuditorias.dsAuditoria = " Modificación del parámetro " + ObtenerCampo("dsParametro").Text + " - "
        objAuditorias.dsAuditoria = objAuditorias.dsAuditoria + " Valor Anterior: " + valorAnterior + " - "
        objAuditorias.dsAuditoria = objAuditorias.dsAuditoria + " Nuevo Valor: " + ObtenerCampo("vlParametro") + " - "
        objAuditorias.dsAuditoria = objAuditorias.dsAuditoria + " Usuario: " + objUsuario.dsUsuario
        objAuditorias.Modulo = "Maestros"
        objAuditorias.funcion = "ABM de Parametros"
        objAuditorias.nrPuesto = objConfig.nrPuesto
        objAuditorias.dsUsuario = objUsuario.dsUsuario
        objAuditorias.nrCaja = ""
        
        objAuditorias.grabarAuditoria


End Function





Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String


    valorAnterior = objParametros.ObtenerValorBD(ObtenerCampo("dsParametro"))
 
    
    
    ObjTablasIO.nmTabla = "TB_Parametros"
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
    
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()


    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "dsParametro", _
            "=", ObtenerCampo("dsParametro").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                grabarTabladeAuditoria
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

 
    
    
    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqParametros.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMParametros.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "dsParametro", False
           On Error Resume Next
           ObtenerCampo("vlParametro").SetFocus
           On Error GoTo 0
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqParametros.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMParametros.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "dsParametro", True
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("grupo_parametro").SetFocus
           HabilitarCampos "nrTamanio", False
           Me.cmdUpDownTamanio.Enabled = False
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
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
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMParametros.Visible = False
           Me.fraBusqParametros.Visible = True
           Me.lstBusqueda.Visible = True
  
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
           
    Case "Aceptar"
    
        Dim txtAux As String
           
           
           objbasededatos.ExecuteSQL ("select distinct grupo_parametro from TB_Parametros")
           objControl.CargarCombo Me.cbParametro, objbasededatos.rs_resultados, objbasededatos.rs_resultados("grupo_parametro")
    
           If Me.cbParametro.ListCount > 0 Then
                Me.cbParametro.ListIndex = 0
           Else
                Me.cbParametro.ListIndex = -1
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
           Me.fraABMParametros.Visible = False
           Me.fraBusqParametros.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
           
 
    Case "Cancelar"
    
 
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMParametros.Visible = False
           Me.fraBusqParametros.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    
    If Me.fraBusqParametros.Visible Then
        Me.fraBusqParametros.Visible = True
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
         ObjTablasIO.nmTabla = "TB_Parametros"
         
         If Me.cbParametro.Text <> "(Todos)" Then
            ObjTablasIO.setearCampoOperadorValor "grupo_parametro", "=", Me.cbParametro.Text, " AND "
         End If
         
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Parametros", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, , "ASC"
         
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Parametros", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
        
         ObjTablasIO.setearCampoOperadorValor "grupo_parametro", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
         
         
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Parametros"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            FormatearParametrosValores
            
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
            
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Parametros", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_Parametros", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


Private Sub colorearParametros()
Dim i As Integer
Dim j As Integer


    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).SubItems(COLUMNA_BLOQUEADO) = "SI" Then
            Me.lstBusqueda.ListItems(i).ForeColor = vbRed
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = vbRed
            Next
        End If
    Next i
    

End Sub



Private Sub FormatearParametrosValores()
Dim i As Integer
Dim j As Integer


    For i = 1 To Me.lstBusqueda.ListItems.Count

        Me.lstBusqueda.ListItems(i).SubItems(COLUMNA_VALOR) = _
        objDicLocal.FormatearValorTipo(Me.lstBusqueda.ListItems(i).SubItems(COLUMNA_VALOR), _
                       objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpParametro", i))
                        
    
    Next i
    

End Sub






Private Sub txtFields_Change(Index As Integer)

    Select Case txtFields(Index).Tag
    Case "dsParametro"
        AvisarError "dsParametro", False
    Case "vlParametro"
        AvisarError "vlParametro", False
    Case "tpParametro"
        AvisarError "tpParametro", False
    End Select
    

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    If txtFields(Index).Tag = "vlParametro" Then
         txtFields(Index).Text = objDicLocal.FormatearValorTipo(txtFields(Index).Text, _
                        ObtenerCampo("tpParametro"), Me.txtFields(Index), "GotFocus")
        Exit Sub
    End If
    DoEvents
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Parametros", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
            If txtFields(Index).Tag = "vlParametro" Then
                KeyAscii = objDicLocal.ValidarEntradaValorTipo(txtFields(Index).Text, obtenerTipoGUIaTipoBD(ObtenerCampo("tpParametro")), ObtenerCampo("nrTamanio"), KeyAscii)
                Exit Sub
            End If
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Parametros", _
                                Me.txtFields(Index), KeyAscii)
    End If
    
End Sub

Private Sub txtFields_LostFocus(Index As Integer)
    
    If txtFields(Index).Tag = "vlParametro" Then
         txtFields(Index).Text = objDicLocal.FormatearValorTipo(txtFields(Index).Text, ObtenerCampo("tpParametro"))
        Exit Sub
    End If
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Parametros", _
                              Me.txtFields(Index), "LostFocus"
End Sub



Private Function obtenerTipoGUIaTipoBD(ptpParamero As String) As String

Select Case UCase(ptpParamero)
    Case "S/N"
        obtenerTipoGUIaTipoBD = "BIT"
    Case "TEXTO"
        obtenerTipoGUIaTipoBD = "VARCHAR"
    Case "FECHA CORTA" ' SMALLDATETIME
        obtenerTipoGUIaTipoBD = "DATETIME"
    Case "FECHA LARGA" ' DateTime
        obtenerTipoGUIaTipoBD = "DATETIME"
    Case "DECIMAL"
        obtenerTipoGUIaTipoBD = "DOUBLE"
    Case "ENTERO"
        obtenerTipoGUIaTipoBD = "INTEGER"
    Case Else
    End Select
    

End Function


Private Function obtenerTamanioxDefecto(ptpParamero As String) As String

obtenerTamanioxDefecto = "0"
        
Select Case UCase(ptpParamero)
    Case "S/N"
        obtenerTamanioxDefecto = "1"
    Case "TEXTO"
        obtenerTamanioxDefecto = "50"
    Case "FECHA CORTA" ' SMALLDATETIME
        obtenerTamanioxDefecto = "10"
    Case "FECHA LARGA" ' DateTime
        obtenerTamanioxDefecto = "16"
    Case "DECIMAL"
        obtenerTamanioxDefecto = "10"
    Case "ENTERO"
        obtenerTamanioxDefecto = "5"
    Case Else
        obtenerTamanioxDefecto = "50"
    End Select
    
End Function

