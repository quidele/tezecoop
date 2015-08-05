VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ABMTalonarios 
   Caption         =   "Talonarios"
   ClientHeight    =   7230
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   9960
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMTalonarios.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   9960
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   9960
      _ExtentX        =   17568
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMTalonarios"
      HotImageList    =   "imgABMTalonariosResaltado"
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
      MouseIcon       =   "Frm_ABMTalonarios.frx":030A
      Begin MSComctlLib.ImageList imgABMTalonariosResaltado 
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
               Picture         =   "Frm_ABMTalonarios.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMTalonarios 
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
               Picture         =   "Frm_ABMTalonarios.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraBusqTalonarios 
      BorderStyle     =   0  'None
      Height          =   6645
      Left            =   0
      TabIndex        =   11
      Top             =   570
      Width           =   8160
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1410
         TabIndex        =   19
         Top             =   2250
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   20
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
            TabIndex        =   23
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   22
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   21
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4335
         TabIndex        =   0
         Top             =   330
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
               Picture         =   "Frm_ABMTalonarios.frx":334A
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":345C
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":356E
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":3680
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":3792
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMTalonarios.frx":38A4
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2580
         TabIndex        =   10
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
         Left            =   90
         TabIndex        =   8
         Top             =   765
         Width           =   7950
         _ExtentX        =   14023
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
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrTalonario"
            Text            =   "Talonario"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "tpComprobante"
            Text            =   "Tipo"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "tpLetra"
            Text            =   "Letra"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "flManual"
            Text            =   "cod. Manual"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "flManual"
            Text            =   "Manual"
            Object.Width           =   2646
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   13
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   12
         Top             =   105
         Width           =   795
      End
   End
   Begin VB.Frame fraABMTalonarios 
      BorderStyle     =   0  'None
      Height          =   6735
      Left            =   0
      TabIndex        =   15
      Top             =   630
      Width           =   9915
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   4995
         Left            =   420
         ScaleHeight     =   4965
         ScaleWidth      =   7110
         TabIndex        =   16
         Top             =   375
         Width           =   7140
         Begin VB.TextBox txtAux 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   300
            Index           =   3
            Left            =   3810
            TabIndex        =   39
            Tag             =   "dtFin"
            Top             =   1875
            Width           =   1110
         End
         Begin VB.TextBox txtAux 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   300
            Index           =   1
            Left            =   2445
            TabIndex        =   38
            Tag             =   "dtDesde"
            Top             =   1875
            Width           =   1095
         End
         Begin VB.CommandButton cmdEliminarItemCAI 
            Height          =   285
            Left            =   5535
            Picture         =   "Frm_ABMTalonarios.frx":39B6
            Style           =   1  'Graphical
            TabIndex        =   29
            TabStop         =   0   'False
            ToolTipText     =   "Borrar Valores"
            Top             =   1890
            Width           =   285
         End
         Begin VB.CommandButton cmdAgregarItemCAI 
            Height          =   285
            Left            =   5220
            Picture         =   "Frm_ABMTalonarios.frx":3AA8
            Style           =   1  'Graphical
            TabIndex        =   34
            Top             =   1890
            Width           =   285
         End
         Begin VB.TextBox txtAuxCAI 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   300
            Left            =   210
            TabIndex        =   28
            Tag             =   "nrCAI"
            Top             =   1875
            Width           =   2205
         End
         Begin VB.TextBox lblLabel 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   2340
            Locked          =   -1  'True
            TabIndex        =   3
            Tag             =   "dsTipoComprobante"
            Top             =   495
            Width           =   3735
         End
         Begin VB.ComboBox cbLetra 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMTalonarios.frx":3BA8
            Left            =   6060
            List            =   "Frm_ABMTalonarios.frx":3BBB
            Style           =   2  'Dropdown List
            TabIndex        =   4
            Tag             =   "tpLetra"
            Top             =   480
            Width           =   915
         End
         Begin VB.ComboBox cbManual 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMTalonarios.frx":3BCE
            Left            =   255
            List            =   "Frm_ABMTalonarios.frx":3BD8
            Style           =   2  'Dropdown List
            TabIndex        =   5
            Tag             =   "flManual"
            Top             =   1065
            Width           =   1260
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   0
            Left            =   1515
            TabIndex        =   6
            Tag             =   "nrComprobante"
            Top             =   1080
            Width           =   1545
         End
         Begin VB.ComboBox cbTipoComprobante 
            Appearance      =   0  'Flat
            Height          =   315
            Left            =   1350
            Style           =   2  'Dropdown List
            TabIndex        =   2
            Tag             =   "tpComprobante"
            Top             =   495
            Width           =   1005
         End
         Begin VB.CheckBox Check1 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   3210
            TabIndex        =   7
            Tag             =   "flActivo"
            Top             =   1125
            Width           =   315
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   255
            TabIndex        =   1
            Tag             =   "nrTalonario"
            Top             =   510
            Width           =   1080
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Index           =   0
            Left            =   3525
            TabIndex        =   30
            TabStop         =   0   'False
            Top             =   1860
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   556
            _Version        =   393216
            Format          =   158269441
            CurrentDate     =   38267
         End
         Begin MSComctlLib.ListView lstTalonariosCAIs 
            Height          =   2550
            Left            =   210
            TabIndex        =   33
            Top             =   2220
            Width           =   6675
            _ExtentX        =   11774
            _ExtentY        =   4498
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
            NumItems        =   3
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Object.Tag             =   "nrCAI"
               Text            =   "CAI"
               Object.Width           =   3881
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Object.Tag             =   "dtDesde"
               Text            =   "Inicio"
               Object.Width           =   2205
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Object.Tag             =   "dtFin"
               Text            =   "Fin"
               Object.Width           =   2205
            EndProperty
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Index           =   1
            Left            =   4905
            TabIndex        =   35
            TabStop         =   0   'False
            Top             =   1860
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   556
            _Version        =   393216
            Format          =   158269441
            CurrentDate     =   38267
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Descripción "
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
            Index           =   7
            Left            =   2370
            TabIndex        =   37
            Top             =   255
            Width           =   1065
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fin"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   6
            Left            =   3810
            TabIndex        =   36
            Top             =   1635
            Width           =   1245
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "CAI"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   5
            Left            =   225
            TabIndex        =   32
            Top             =   1620
            Width           =   570
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Inicio"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   14
            Left            =   2430
            TabIndex        =   31
            Top             =   1635
            Width           =   1245
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
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
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   4
            Left            =   6030
            TabIndex        =   27
            Top             =   270
            Width           =   600
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Activo"
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
            Height          =   270
            Index           =   3
            Left            =   3075
            TabIndex        =   26
            Top             =   840
            Width           =   660
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Ult. Número"
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
            Height          =   270
            Index           =   2
            Left            =   1515
            TabIndex        =   25
            Top             =   855
            Width           =   1290
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Manual/Auto"
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
            TabIndex        =   24
            Top             =   855
            Width           =   1110
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
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
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   1
            Left            =   1335
            TabIndex        =   18
            Top             =   270
            Width           =   1065
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Talonario"
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
            Height          =   270
            Index           =   27
            Left            =   285
            TabIndex        =   17
            Top             =   255
            Width           =   1005
         End
      End
   End
End
Attribute VB_Name = "Frm_ABMTalonarios"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const COLUMNA_BLOQUEADO = 5
    
Dim EstadoABM As Byte
Dim objControl As New CControl
Dim objDicLocal As New CMySQLDiccDatos



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

    Me.DTPicker1(0).value = Date
    Me.DTPicker1(1).value = Date
    
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
                    If Control.Tag = "flManual" Then
                    Else
                        Control.value = False
                    End If
                Case "tx"
                    If Not Control.Locked Then
                        AvisarError Control.Tag, False
                    End If
                Case Else
                    On Error Resume Next
                    Control.Text = ""
                    On Error GoTo 0
                End Select
                
            End If
        End If
    Next
    
    Me.cbLetra.ListIndex = -1
    Me.cbManual.ListIndex = -1
    Me.cbTipoComprobante.ListIndex = -1
    Me.lstTalonariosCAIs.ListItems.Clear
    
    AvisarError "dtDesde", False
    AvisarError "dtFin", False
    AvisarError "nrCAI", False
        
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
    ' Debug.Assert "hola"
    
End Function


Private Sub cbLetra_Click()

        AvisarError "tpLetra", False
End Sub

Private Sub cbLetra_GotFocus()


    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbLetra, "GotFocus"
                              
End Sub

Private Sub cbLetra_LostFocus()


    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbLetra, "LostFocus"
                              
End Sub





Private Sub cbManual_Click()

        AvisarError "flManual", False
        
        Select Case Me.cbManual.Text
        Case "Automática"
            Me.DTPicker1(0).Enabled = True
            Me.DTPicker1(1).Enabled = True
            Me.txtAuxCAI.Enabled = True
            Me.cmdAgregarItemCAI.Enabled = True
            Me.cmdEliminarItemCAI.Enabled = True
        Case "Manual"
            Me.DTPicker1(0).Enabled = False
            Me.DTPicker1(1).Enabled = False
            Me.txtAuxCAI.Enabled = False
            Me.lstTalonariosCAIs.ListItems.Clear
            Me.cmdAgregarItemCAI.Enabled = False
            Me.cmdEliminarItemCAI.Enabled = False
            AvisarError "dtDesde", False
            AvisarError "dtFin", False
            AvisarError "nrCAI", False
            ObtenerCampo("dtDesde") = "  /  /    "
            ObtenerCampo("dtFin") = "  /  /    "
            ObtenerCampo("nrCAI") = ""
        Case Else
            Me.DTPicker1(0).Enabled = False
            Me.DTPicker1(1).Enabled = False
            Me.txtAuxCAI.Enabled = False
            Me.lstTalonariosCAIs.ListItems.Clear
            Me.cmdAgregarItemCAI.Enabled = False
            Me.cmdEliminarItemCAI.Enabled = False
            AvisarError "dtDesde", False
            AvisarError "dtFin", False
            AvisarError "nrCAI", False
            ObtenerCampo("dtDesde") = "  /  /    "
            ObtenerCampo("dtFin") = "  /  /    "
            ObtenerCampo("nrCAI") = ""
        End Select
        
End Sub

Private Sub cbManual_GotFocus()


    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbManual, "GotFocus"
                              
End Sub

Private Sub cbManual_LostFocus()

    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbManual, "LostFocus"
                              
End Sub

Private Sub cbTipoComprobante_Click()


         AvisarError "tpComprobante", False
        
         If Me.cbTipoComprobante.Text = "" Then Exit Sub

         ObjTablasIO.nmTabla = "TB_TiposComprobantes"
         ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", Me.cbTipoComprobante.Text
         ObjTablasIO.setearCampoOperadorValor "dsTipoComprobante", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            ObtenerCampo("dsTipoComprobante") = ObjTablasIO.rs_resultados("dsTipoComprobante")
        End If
        
End Sub

Private Sub cbTipoComprobante_GotFocus()

    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbTipoComprobante, "GotFocus"

End Sub

Private Sub cbTipoComprobante_LostFocus()

    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              cbTipoComprobante, "LostFocus"
                              
End Sub

Private Sub Check1_Click()

    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              Check1, "GotFocus"
                              
End Sub

Private Sub Check1_LostFocus()

    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              Check1, "LostFocus"
                              
End Sub

Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub



Private Sub cmdAgregarItemCAI_Click()
Dim ListItemNuevo As ListItem
Dim i             As Integer

     If ObtenerCampo("nrCAI").Text = "" Then
        AvisarError "nrCAI", True
        Exit Sub
     End If
     If ObtenerCampo("dtDesde") = "  /  /    " Then
        AvisarError "dtDesde", True
        Exit Sub
     End If
     If ObtenerCampo("dtFin") = "  /  /    " Then
        AvisarError "dtFin", True
        Exit Sub
     End If
     
     If Me.DTPicker1(0) > Me.DTPicker1(1) Then
        MsgBox "La fecha de inicio no puede superar a la fecha fin.", vbInformation + vbDefaultButton1, "Atención"
        Me.DTPicker1(1).SetFocus
        Exit Sub
     End If
     
    For i = 1 To Me.lstTalonariosCAIs.ListItems.Count
        If Me.lstTalonariosCAIs.ListItems(i).Text = ObtenerCampo("nrCAI").Text Then
            MsgBox "No se puede ingresar un mismo número de CAI.", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "nrCAI", True
            Exit Sub
        End If
    Next
    
     Set ListItemNuevo = Me.lstTalonariosCAIs.ListItems.Add(Me.lstTalonariosCAIs.ListItems.Count + 1, , ObtenerCampo("nrCAI").Text)
    
     ListItemNuevo.SubItems(1) = ObtenerCampo("dtDesde")
     ListItemNuevo.SubItems(2) = ObtenerCampo("dtFin")
     
     ObtenerCampo("nrCAI").Text = ""
     ObtenerCampo("dtDesde") = "  /  /    "
     ObtenerCampo("dtFin") = "  /  /    "
      
End Sub

Private Sub cmdEliminarItemCAI_Click()

    
    If Me.lstTalonariosCAIs.ListItems.Count = 0 Then Exit Sub
    If Me.lstTalonariosCAIs.SelectedItem.Text = "" Then Exit Sub
    
    Me.lstTalonariosCAIs.ListItems.Remove (Me.lstTalonariosCAIs.SelectedItem.Index)

End Sub

Private Sub dtDesde_Change()
    AvisarError "dtDesde", False
End Sub

Private Sub dtFin_Change()

    AvisarError "dtDesde", False
    
End Sub


Private Sub DTPicker1_Change(Index As Integer)
    Select Case Index
    Case 0
        ObtenerCampo("dtDesde") = DTPicker1(Index)
        DTPicker1(Index).SetFocus
    Case 1
        ObtenerCampo("dtFin") = DTPicker1(Index)
        DTPicker1(Index).SetFocus
    End Select
End Sub

Private Sub DTPicker1_Click(Index As Integer)

    Select Case Index
    Case 0
        ObtenerCampo("dtDesde") = DTPicker1(Index)
    Case 1
        ObtenerCampo("dtFin") = DTPicker1(Index)
    End Select
    
    
End Sub

Private Sub DTPicker1_DblClick(Index As Integer)
    Select Case Index
    Case 0
        ObtenerCampo("dtDesde") = DTPicker1(Index)
    Case 1
        ObtenerCampo("dtFin") = DTPicker1(Index)
    End Select
End Sub

Private Sub DTPicker1_LostFocus(Index As Integer)
    Select Case Index
    Case 0
        ObtenerCampo("dtDesde") = DTPicker1(Index)
    Case 1
        ObtenerCampo("dtFin") = DTPicker1(Index)
    End Select
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
    
    '---------------------------------------------------------
    ' version 2.n - carga de tipo de comprobantes
    objSPs.nmStoredProcedure = "sco_TiposComprobantes"
    If Not objSPs.ExecSP() Then
        MsgBox "No se ejecuto el procedimiento " + objSPs.Error, vbCritical, "Atención"
    Else
        objControl.CargarCombo Me.cbTipoComprobante, objSPs.rs_resultados, objSPs.rs_resultados(0)
    End If
    
    
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
    
    
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Talonarios"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Talonarios")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Talonarios")
    Loop
    Me.cmbCampos.ListIndex = 0

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Talonarios", Me.cmbCampos.Text
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

    limpiarControles

    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    ObjTablasIO.nmTabla = "TB_Talonarios"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", Trim(Me.lstBusqueda.SelectedItem.Text), "AND"

    ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
    "=", Trim(Me.lstBusqueda.SelectedItem.SubItems(1)), "AND"
    
    ObjTablasIO.setearCampoOperadorValor "tpLetra", _
    "=", Trim(Me.lstBusqueda.SelectedItem.SubItems(2))
    
    
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            End If
        End If
    Next
    
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flManual", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flActivo", "->", ""

    ObjTablasIO.Seleccionar
    
    ObtenerCampo("nrTalonario").Text = objbasededatos.rs_resultados_valor("nrTalonario")
    ObtenerCampo("tpLetra").Text = objbasededatos.rs_resultados_valor("tpLetra")
    ObtenerCampo("nrComprobante").Text = objbasededatos.rs_resultados_valor("nrComprobante")
    ObtenerCampo("nrTalonario").Text = objbasededatos.rs_resultados_valor("nrTalonario")
    ObtenerCampo("flActivo").value = AdaptarTrueFalse(ObtenerCampo("flActivo"), ObjTablasIO.rs_resultados("flActivo"))
    ObtenerCampo("flManual").Text = obtenerDesctipoFacturacion(objbasededatos.rs_resultados_valor("flmanual"))
    ObtenerCampo("tpComprobante").Text = objbasededatos.rs_resultados_valor("tpComprobante")
    
    obtenerCAIs
    
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub


Private Sub obtenerCAIs()

    Me.lstTalonariosCAIs.ListItems.Clear
    
    ObjTablasIO.nmTabla = "TB_TalonariosCAI"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", ObtenerCampo("nrTalonario").Text, "AND"
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
    "=", ObtenerCampo("tpComprobante").Text, "AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetra", _
    "=", ObtenerCampo("tpLetra").Text
    
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrCAI", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtDesde", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtFin", "->", ""

    ObjTablasIO.Seleccionar
    
    If Not ObjTablasIO.rs_resultados.EOF Then
        objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstTalonariosCAIs, 0, "TB_TalonariosCAI"
    End If

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
           PresentarPantalla Button
           txtBusqueda_KeyPress vbKeyReturn
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
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
           If Not ValidaDatosEntrada() Then
                Exit Sub
           End If
    
           If Guardarregistro(EstadoABM) Then
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Function ValidaDatosEntrada() As Boolean

    ValidaDatosEntrada = False

    If Trim(ObtenerCampo("nrTalonario")) = "" Then
        AvisarError "nrTalonario", True
        ObtenerCampo("nrTalonario").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("tpComprobante")) = "" Then
        AvisarError "tpComprobante", True
        ObtenerCampo("tpComprobante").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("tpletra")) = "" Then
        AvisarError "tpletra", True
        ObtenerCampo("tpletra").SetFocus
        Exit Function
    End If
    
    
    If Trim(ObtenerCampo("flManual")) = "" Then
        AvisarError "flManual", True
        ObtenerCampo("flManual").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("nrComprobante")) = "" Then
        AvisarError "nrComprobante", True
        ObtenerCampo("nrComprobante").SetFocus
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
        
        objbasededatos.BeginTrans
        
        If Not EliminarTalonariosCAIs() Then
            objbasededatos.RollBackTrans
            MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
            Exit Function
        End If
        
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Talonarios"
        
        ' actualizamos por la clave
        ObjTablasIO.setearCampoOperadorValor "tpLetra", _
        "=", ObtenerCampo("tpLetra").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
        "=", ObtenerCampo("tpComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
        "=", ObtenerCampo("nrTalonario").Text
    
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


Private Function EliminarTalonariosCAIs() As Boolean

        EliminarTalonariosCAIs = False

        ' Borrar los numeros de CAI asociados
        ObjTablasIO.nmTabla = "TB_TalonariosCAI"
        ' actualizamos por la clave
        ObjTablasIO.setearCampoOperadorValor "tpLetra", _
        "=", ObtenerCampo("tpLetra").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
        "=", ObtenerCampo("tpComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
        "=", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
        "->", ObtenerCampo("nrTalonario").Text
        
         ObjTablasIO.Seleccionar
         
         If ObjTablasIO.rs_resultados.EOF Then
            ' no hay nada para eliminar
            EliminarTalonariosCAIs = True
            Exit Function
         End If
        
        ' Borrar los numeros de CAI asociados
        ObjTablasIO.nmTabla = "TB_TalonariosCAI"
        ' actualizamos por la clave
        ObjTablasIO.setearCampoOperadorValor "tpLetra", _
        "=", ObtenerCampo("tpLetra").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
        "=", ObtenerCampo("tpComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
        "=", ObtenerCampo("nrTalonario").Text
    
        EliminarTalonariosCAIs = ObjTablasIO.Eliminar()
        
End Function


Private Sub ExportaraExcel()
Dim strError  As String

    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    

    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", _
    True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Talonarios") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    
    objbasededatos.BeginTrans
    
    ObjTablasIO.nmTabla = "TB_Talonarios"
    
    For Each Control In Me.txtFields
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
    
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "<-", Me.cbLetra.Text
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "<-", Me.cbTipoComprobante.Text
    ObjTablasIO.setearCampoOperadorValor "flManual", "<-", obtenertipoFacturacion(Me.cbManual.Text)
    ObjTablasIO.setearCampoOperadorValor "flActivo", "<-", ObtenerCampo("flActivo").value
    
    Select Case EstadoABM
    Case modificacion
    
            ' actualizamos por la clave
            ObjTablasIO.setearCampoOperadorValor "tpLetra", _
            "=", ObtenerCampo("tpLetra").Text, " AND "
            ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
            "=", ObtenerCampo("tpComprobante").Text, " AND "
            ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
            "=", ObtenerCampo("nrTalonario").Text
        
            If Not ObjTablasIO.Actualizar() Then
                ' grabar los numeros de CAI
                objbasededatos.RollBackTrans
                MsgBox "Error: no se pudo actualizar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                
                If Not EliminarTalonariosCAIs() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
                    Exit Function
                End If
                If Not GrabarTalonariosCAIs() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
                    Exit Function
                End If
            
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
            
                If Not EliminarTalonariosCAIs() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
                    Exit Function
                End If
                If Not GrabarTalonariosCAIs() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error " + ObjTablasIO.Error, vbInformation, "Atención"
                    Exit Function
                End If
                
                objbasededatos.CommitTrans
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    End Select

End Function


Private Function GrabarTalonariosCAIs() As Boolean
Dim i As Integer

    GrabarTalonariosCAIs = False

    For i = 1 To Me.lstTalonariosCAIs.ListItems.Count
        
    

        ' Borrar los numeros de CAI asociados
        ObjTablasIO.nmTabla = "TB_TalonariosCAI"
        ' actualizamos por la clave
        ObjTablasIO.setearCampoOperadorValor "tpLetra", _
        "<-", ObtenerCampo("tpLetra").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
        "<-", ObtenerCampo("tpComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
        "<-", ObtenerCampo("nrTalonario").Text
        
        ObjTablasIO.setearCampoOperadorValor "nrCAI", _
        "<-", Me.lstTalonariosCAIs.ListItems(i).Text
        ObjTablasIO.setearCampoOperadorValor "dtDesde", _
        "<-", Me.lstTalonariosCAIs.ListItems(1).SubItems(1)
        ObjTablasIO.setearCampoOperadorValor "dtFin", _
        "<-", Me.lstTalonariosCAIs.ListItems(1).SubItems(2)
        
        If Not ObjTablasIO.Insertar Then Exit Function
        
    Next
    
    GrabarTalonariosCAIs = True

End Function


    

Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqTalonarios.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMTalonarios.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "nrTalonario", False
           HabilitarCampos "tpComprobante", False
           HabilitarCampos "tpLetra", False
           HabilitarCampos "flManual", False
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("nrComprobante").SetFocus
    Case "Agregar"
           Me.fraBusqTalonarios.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMTalonarios.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           ' Habilitamos los campos clave
           HabilitarCampos "nrTalonario", True
           HabilitarCampos "tpComprobante", True
           HabilitarCampos "tpLetra", True
           HabilitarCampos "flManual", True
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("nrTalonario").SetFocus
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
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMTalonarios.Visible = False
           Me.fraBusqTalonarios.Visible = True
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
           Me.fraABMTalonarios.Visible = False
           Me.fraBusqTalonarios.Visible = True
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
           Me.fraABMTalonarios.Visible = False
           Me.fraBusqTalonarios.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    
    If Me.fraBusqTalonarios.Visible Then
        Me.fraBusqTalonarios.Visible = True
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



Private Sub txtAux_LostFocus(Index As Integer)


                              
    Select Case Me.txtAux(Index).Tag
    Case "dtDesde", "dtFin"
        If Me.txtAux(Index).Text <> "" Then
            If Not IsDate(Me.txtAux(Index).Text) Then
                MsgBox "La fecha no es válida.", vbInformation + vbDefaultButton1, "Atención"
                Me.txtAux(Index).SetFocus
            End If
        End If
    End Select


End Sub

Private Sub txtAuxCAI_Change()
       AvisarError "nrCAI", False
End Sub


Private Sub txtAuxCAI_GotFocus()

    DoEvents
    
    objDiccionariodeDatos.FormatearCampoControl "TB_TalonariosCAI", _
                              Me.txtAuxCAI, "GotFocus"

End Sub

Private Sub txtAuxCAI_KeyPress(KeyAscii As Integer)

    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_TalonariosCAI", _
                                Me.txtAuxCAI, KeyAscii)
    End If
    
End Sub

Private Sub txtAuxCAI_LostFocus()

  DoEvents
    
    objDiccionariodeDatos.FormatearCampoControl "TB_TalonariosCAI", _
                              Me.txtAuxCAI, "LostFocus"

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
         ObjTablasIO.nmTabla = "TB_Talonarios"
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Talonarios", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, , "ASC"
         
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Talonarios", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
        
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Talonarios"
            AsignarValoresAutomaticoManual
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Talonarios", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_Talonarios", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


Private Sub colorearTalonarios()
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






Private Sub txtFields_Change(Index As Integer)

    Select Case txtFields(Index).Tag
    Case "nrTalonario"
        AvisarError "nrTalonario", False
    Case "tpComprobante"
        AvisarError "tpComprobante", False
    Case "tpLetra"
        AvisarError "tpLetra", False
    Case "flManual"
        AvisarError "flManual", False
    Case "nrComprobante"
        AvisarError "nrComprobante", False
    End Select
    

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    DoEvents
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)

    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Talonarios", _
                                Me.txtFields(Index), KeyAscii)
    End If
    
End Sub

Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Talonarios", _
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


Private Sub AsignarValoresAutomaticoManual()
Dim i As Integer

    For i = 1 To Me.lstBusqueda.ListItems.Count
    
        Select Case Me.lstBusqueda.ListItems(i).SubItems(3)
        Case "A"
            Me.lstBusqueda.ListItems(i).SubItems(4) = "Automático"
        Case "M"
            Me.lstBusqueda.ListItems(i).SubItems(4) = "Manual"
        End Select
     
    Next i

End Sub

Private Function obtenertipoFacturacion(pValor As String) As String

    Select Case pValor
    Case "Automática"
        obtenertipoFacturacion = "A"
    Case "Manual"
        obtenertipoFacturacion = "M"
    End Select

End Function

Private Function obtenerDesctipoFacturacion(pValor As String) As String

    Select Case pValor
        Case "A"
            obtenerDesctipoFacturacion = "Automática"
        Case "M"
            obtenerDesctipoFacturacion = "Manual"
        End Select
    
End Function



