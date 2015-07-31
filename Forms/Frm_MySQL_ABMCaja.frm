VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frm_ABMCaja 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Manejo de Cajas"
   ClientHeight    =   7305
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10080
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "Frm_ABMCaja.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7305
   ScaleWidth      =   10080
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   6600
      Left            =   -30
      TabIndex        =   8
      Top             =   660
      Width           =   10050
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2505
         TabIndex        =   28
         Top             =   1995
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   29
            Top             =   615
            Width           =   4575
            _ExtentX        =   8096
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.Label Label3 
            BackColor       =   &H80000009&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   32
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H80000009&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   31
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H80000009&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   30
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   5535
         TabIndex        =   4
         Top             =   330
         Width           =   4395
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   9330
         Top             =   4560
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
               Picture         =   "Frm_ABMCaja.frx":030A
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":041C
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":052E
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0640
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0752
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0864
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   3390
         TabIndex        =   7
         Top             =   330
         Width           =   2070
         _ExtentX        =   3651
         _ExtentY        =   582
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   14737632
         OLEDropMode     =   1
         Indentation     =   1
         Locked          =   -1  'True
         ImageList       =   "ImgOperadores"
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   330
         Width           =   3135
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5490
         Left            =   150
         TabIndex        =   5
         Top             =   675
         Width           =   9810
         _ExtentX        =   17304
         _ExtentY        =   9684
         View            =   3
         LabelEdit       =   1
         SortOrder       =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
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
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrCaja"
            Text            =   "Caja"
            Object.Width           =   2205
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dtApertura"
            Text            =   "Fecha Apertura"
            Object.Width           =   3705
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "dtCierre"
            Text            =   "Fecha Cierre"
            Object.Width           =   3705
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "nrPuesto"
            Text            =   "Puesto"
            Object.Width           =   1413
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2647
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "vlSaldoInicialPesos"
            Text            =   "Sdo Inicial"
            Object.Width           =   1942
         EndProperty
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   5550
         TabIndex        =   13
         Top             =   75
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   9
         Top             =   105
         Width           =   795
      End
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   10080
      _ExtentX        =   17780
      _ExtentY        =   1111
      ButtonWidth     =   2593
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMCajas"
      HotImageList    =   "imgABMCajasResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
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
            Caption         =   "&Detalle Viajes(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
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
      MouseIcon       =   "Frm_ABMCaja.frx":0976
      Begin MSComctlLib.ImageList imgABMCajasResaltado 
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
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0AD8
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0BF4
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0D48
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0E58
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0F5A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":10AE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":11BA
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":1836
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":199E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":1DF2
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2246
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMCajas 
         Left            =   7620
         Top             =   -15
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
               Picture         =   "Frm_ABMCaja.frx":28C0
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":29D8
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2B2C
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2C44
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2D50
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2EA4
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2FAC
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":3628
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":3788
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":3BDC
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":4030
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMCajas 
      BorderStyle     =   0  'None
      Height          =   6540
      Left            =   0
      TabIndex        =   0
      Top             =   720
      Width           =   10020
      Begin VB.Frame fra_valores 
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   0  'None
         Height          =   2412
         Left            =   2364
         TabIndex        =   33
         Top             =   2556
         Width           =   6360
         Begin VB.CommandButton cmdImprimirTotales 
            Caption         =   "Imprimir Totales"
            Height          =   468
            Left            =   5304
            TabIndex        =   64
            Top             =   444
            Width           =   852
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   10
            Left            =   708
            TabIndex        =   11
            Tag             =   "vlSaldoInicialDolares"
            Top             =   780
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   9
            Left            =   708
            TabIndex        =   10
            Tag             =   "vlSaldoInicialPesos"
            Top             =   456
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   11
            Left            =   708
            TabIndex        =   12
            Tag             =   "vlSaldoInicialEuros"
            Top             =   1104
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   201
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   47
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalDolares"
            Top             =   768
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   200
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   46
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalPesos"
            Top             =   444
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   13
            Left            =   96
            Locked          =   -1  'True
            TabIndex        =   45
            TabStop         =   0   'False
            Tag             =   "dsDiferenciaDeCierre"
            Top             =   1992
            Width           =   3975
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   208
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   44
            TabStop         =   0   'False
            Tag             =   "vlCierrePesos"
            Top             =   444
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   209
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   43
            TabStop         =   0   'False
            Tag             =   "vlCierreDolares"
            Top             =   768
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   202
            Left            =   1848
            TabIndex        =   42
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalEuros"
            Top             =   1092
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   210
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "vlCierreEuros"
            Top             =   1092
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   207
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   40
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinalReal"
            Top             =   1392
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   206
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   39
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalRealEuros"
            Top             =   1092
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   205
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   38
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalRealDolares"
            Top             =   768
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   204
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   37
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalRealPesos"
            Top             =   444
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   203
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   36
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinal"
            Top             =   1392
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   21
            Left            =   4164
            Locked          =   -1  'True
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "vlDiferenciaDeCierre"
            Top             =   1992
            Width           =   1080
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   211
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   34
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoCierre"
            Top             =   1380
            Width           =   1100
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Saldo"
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
            Left            =   84
            TabIndex        =   63
            Top             =   240
            Width           =   588
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Euros"
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
            Index           =   6
            Left            =   84
            TabIndex        =   62
            Top             =   1176
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "U$s"
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
            Index           =   5
            Left            =   84
            TabIndex        =   61
            Top             =   828
            Width           =   588
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Pesos"
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
            Index           =   9
            Left            =   84
            TabIndex        =   60
            Top             =   504
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Inicial"
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
            Index           =   1
            Left            =   684
            TabIndex        =   59
            Top             =   228
            Width           =   1128
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Motivo en Diferencia de Cierre"
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
            Index           =   7
            Left            =   132
            TabIndex        =   53
            Top             =   1716
            Width           =   2880
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Diferencia"
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
            Index           =   8
            Left            =   4164
            TabIndex        =   52
            Top             =   1752
            Width           =   1128
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Sup."
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
            Index           =   2
            Left            =   1872
            TabIndex        =   51
            Top             =   216
            Width           =   1080
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Cierre"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   10
            Left            =   4200
            TabIndex        =   50
            Top             =   216
            Width           =   1056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Real"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   11
            Left            =   3060
            TabIndex        =   49
            Top             =   216
            Width           =   1056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Totales Pesificados"
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
            Index           =   15
            Left            =   84
            TabIndex        =   48
            Top             =   1428
            Width           =   1716
         End
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00FFC0C0&
         Height          =   6400
         Left            =   1060
         ScaleHeight     =   6345
         ScaleWidth      =   7710
         TabIndex        =   15
         Top             =   60
         Width           =   7770
         Begin VB.Frame fra_comentarios 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   1416
            Left            =   1308
            TabIndex        =   54
            Top             =   5004
            Width           =   5328
            Begin VB.TextBox txtFields 
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   24
               Left            =   1260
               Locked          =   -1  'True
               TabIndex        =   56
               TabStop         =   0   'False
               Tag             =   "dtObservacion"
               Top             =   948
               Width           =   3945
            End
            Begin VB.TextBox txtFields 
               BackColor       =   &H00E0E0E0&
               Height          =   765
               Index           =   25
               Left            =   1284
               Locked          =   -1  'True
               MultiLine       =   -1  'True
               ScrollBars      =   2  'Vertical
               TabIndex        =   55
               TabStop         =   0   'False
               Tag             =   "dsObservacion"
               Top             =   48
               Width           =   3945
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Ultima Modif."
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
               Index           =   16
               Left            =   48
               TabIndex        =   58
               Top             =   996
               Width           =   1212
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Observación"
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
               Index           =   17
               Left            =   48
               TabIndex        =   57
               Top             =   108
               Width           =   1212
            End
         End
         Begin VB.CheckBox Check1 
            Caption         =   "Check1"
            Height          =   405
            Left            =   450
            TabIndex        =   27
            Top             =   5790
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   23
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   960
            Width           =   5130
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   22
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   390
            Width           =   2445
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   6
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "dtCierre"
            Top             =   1500
            Width           =   2445
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   8
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   20
            TabStop         =   0   'False
            Tag             =   "vlDiaEuro"
            Top             =   2100
            Width           =   2430
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   7
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   3
            TabStop         =   0   'False
            Tag             =   "vlDiaDolar"
            Top             =   2100
            Width           =   2550
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   5
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   2
            TabStop         =   0   'False
            Tag             =   "dtApertura"
            Top             =   1512
            Width           =   2580
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   1
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   390
            Width           =   2550
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Usuario"
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
            Index           =   28
            Left            =   1308
            TabIndex        =   26
            Top             =   708
            Width           =   4056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fecha de Cierre"
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
            Index           =   13
            Left            =   3996
            TabIndex        =   25
            Top             =   1272
            Width           =   1980
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Euros"
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
            Index           =   4
            Left            =   3996
            TabIndex        =   24
            Top             =   1872
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Dolar u$s"
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
            Index           =   3
            Left            =   1308
            TabIndex        =   19
            Top             =   1848
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fecha de Apertura"
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
            Index           =   12
            Left            =   1308
            TabIndex        =   18
            Top             =   1272
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Nro. de Caja"
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
            Left            =   1290
            TabIndex        =   17
            Top             =   150
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Nro. de Puesto"
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
            Index           =   27
            Left            =   3990
            TabIndex        =   16
            Top             =   135
            Width           =   1965
         End
      End
   End
End
Attribute VB_Name = "frm_ABMCaja"
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
    Me.ProgressBar.Value = pAvance
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
                    Control.Value = False
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


Private Sub imprimirCajaTotales(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = App.Path & "\rpt_cierredecaja_imprimev1.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Cierre de Caja"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = ObtenerCampo("nrCaja").Text
    
    ' Aparece la venta original
    On Error Resume Next
    ' hacer dinamica la cantidad de copias
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
End Sub







Private Sub cmdImprimirTotales_Click()
    imprimirCajaTotales True
End Sub

Private Sub Form_Activate()


    Select Case EstadoABM
    Case alta
        ObtenerCampo("vlSaldoInicialPesos").SetFocus
    Case Else
        Select Case objParametros.ObtenerValor("frm_ABMCaja")
        Case "CajaSinCerrar"
        Case "CerrarCaja"
            HabilitarCampos "dsDiferenciaDeCierre", True
            HabilitarCampos "vlSaldoFinalRealPesos", True
            HabilitarCampos "vlSaldoFinalRealDolares", True
            HabilitarCampos "vlSaldoFinalRealEuros", True
        Case Else
            Me.txtBusqueda.SetFocus
        End Select
    End Select
    
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

    Me.Caption = Me.Caption + " - (" + objUsuario.dsUsuario + ") "
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    
    Select Case objParametros.ObtenerValor("frm_ABMCaja")
    Case "Alta"
        EstadoABM = alta
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    Case "CerrarCaja"
        EstadoABM = CerrarCaja
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Seleccionar")
    Case "CajaSinCerrar"
        EstadoABM = cajasincerrar
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Seleccionar")
    Case Else
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
        EstadoABM = Consulta
        Me.cmbCampos.ListIndex = 1
    End Select
    
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Cajas"
    Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
    objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cajas")
    Do Until objDiccionariodeDatos.FindeCampos("TB_Cajas")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cajas")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

    Me.ImageCombo1.ComboItems.Clear
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.Text
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
        ObtenerOperadorAritmetico = "LIKE"
    End Select

End Function





Private Sub BusquedaporClave(pClave As String)
Dim Control As Control
Dim Valor   As Variant
    
    ObjTablasIO.nmTabla = "TB_Cajas"
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
    
    ObjTablasIO.setearCampoOperadorValor "flEstado", _
    "->", ""
    
    ObjTablasIO.Seleccionar
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cajas", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.Value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    objParametros.GrabarValor "flEstado", ObjTablasIO.rs_resultados("flEstado").Value
    Me.Check1.Value = IIf(ObjTablasIO.rs_resultados("flEstado").Value = True, vbChecked, vbUnchecked)
    
    If ObjTablasIO.rs_resultados("flEstado").Value = False Then
        If objCajas.SumarCajaPuestos(ObjTablasIO.rs_resultados("nrCaja").Value) Then
            objCajas.vlPesos = objCajas.vlPesos + ObtenerValoresNumericos("vlSaldoInicialPesos")
            objCajas.vlDolares = objCajas.vlDolares + ObtenerValoresNumericos("vlSaldoInicialDolares")
            objCajas.vlEuros = objCajas.vlEuros + ObtenerValoresNumericos("vlSaldoInicialEuros")
            ObtenerCampo("vlSaldoFinalPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalPesos", objCajas.vlPesos)
            ObtenerCampo("vlSaldoFinalDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalDolares", objCajas.vlDolares)
            ObtenerCampo("vlSaldoFinalEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalEuros", objCajas.vlEuros)
        End If
        ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerValoresNumericos("vlSaldoFinalPesos")
        ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerValoresNumericos("vlSaldoFinalDolares")
        ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerValoresNumericos("vlSaldoFinalEuros")
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
        CalcularDiferencia
    End If

    ' EULISES
    If objParametros.ObtenerValor("Frm_ABMCaja") = "CerrarCaja" Or _
       objParametros.ObtenerValor("Frm_ABMCaja") = "CajaSinCerrar" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
               

    End If
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub



Private Sub Frame1_DragDrop(Source As Control, X As Single, Y As Single)

End Sub

Private Sub lstBusqueda_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    If lstBusqueda.SortKey = ColumnHeader.Index - 1 Then
        If lstBusqueda.SortOrder = lvwAscending Then
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
    
                
    Screen.ActiveForm.MousePointer = vbHourglass
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
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
    ObjTablasIO.setearCampoOperadorValor "flEstado", _
    "->", ""
    ObjTablasIO.Seleccionar
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cajas", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.Value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    Me.Check1.Value = IIf(ObjTablasIO.rs_resultados("flEstado").Value = True, vbChecked, vbUnchecked)
    
    ' Verificar el estado de la caja
    If ObjTablasIO.rs_resultados("flEstado").Value = False Then
        If objCajas.SumarCajaPuestos(ObjTablasIO.rs_resultados("nrCaja").Value) Then
            objCajas.vlPesos = objCajas.vlPesos + ObtenerValoresNumericos("vlSaldoInicialPesos")
            objCajas.vlDolares = objCajas.vlDolares + ObtenerValoresNumericos("vlSaldoInicialDolares")
            objCajas.vlEuros = objCajas.vlEuros + ObtenerValoresNumericos("vlSaldoInicialEuros")
            ObtenerCampo("vlSaldoFinalPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalPesos", objCajas.vlPesos)
            ObtenerCampo("vlSaldoFinalDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalDolares", objCajas.vlDolares)
            ObtenerCampo("vlSaldoFinalEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalEuros", objCajas.vlEuros)
        End If
        ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerValoresNumericos("vlSaldoFinalPesos")
        ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerValoresNumericos("vlSaldoFinalDolares")
        ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerValoresNumericos("vlSaldoFinalEuros")
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
        CalcularDiferencia
    End If
    
    If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                ObtenerCampo("dsObservacion").Locked = False
                ObtenerCampo("dsObservacion").BackColor = Blanco
                objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
    End If
    
    If objParametros.ObtenerValor("Frm_ABMCaja") = "Consulta" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
    End If
    
  
    If StrComp(objUsuario.tpAcceso, "Puestos", vbTextCompare) = 0 Then
          fra_comentarios.Top = fra_valores.Top
          fra_valores.Visible = False
          fra_comentarios.Visible = True
    Else
          fra_comentarios.Visible = True
          fra_valores.Visible = True
    End If
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    Screen.ActiveForm.MousePointer = vbDefault
    
    
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    objParametros.GrabarValor "Cancela", "SI"
    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
            Select Case objParametros.ObtenerValor("frm_ABMCaja")
            Case "CerrarCaja"
                BusquedaporClave objParametros.ObtenerValor("nrCaja")
                EstadoABM = CerrarCaja
                PresentarPantalla Button
            Case "CajaSinCerrar"
                BusquedaporClave objParametros.ObtenerValor("nrCaja")
                EstadoABM = cajasincerrar
                PresentarPantalla Button
            Case Else
                EstadoABM = Consulta
                ' Pasar datos
                lstBusqueda_DblClick
            End Select
            
            If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                  ObtenerCampo("dsObservacion").Locked = False
                  ObtenerCampo("dsObservacion").BackColor = Blanco
                  objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
            End If
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cajas", "nrCaja", objConfig.nrPuesto)
           ObtenerCampo("nrCaja").Text = strValor
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
           ObtenerCampo("vlDiaDolar").Text = objConfig.vlDiaDolar
           ObtenerCampo("vlDiaEuro").Text = objConfig.vlDiaEuro
           ObtenerCampo("dtApertura").Text = Now()
           PresentarPantalla Button
           If Not objConfig.AbreCaja = "SI" Then
              ObtenerCampo("vlSaldoInicialPesos").SetFocus
           End If
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
            If EstadoABM = CerrarCaja Then
                ObtenerCampo("dtCierre").Text = Now
                objParametros.GrabarValor "Cancela", "NO"
                If objParametros.ObtenerValor("dsObservacion") <> ObtenerCampo("dsObservacion").Text Then ObtenerCampo("dtObservacion").Text = Now()
            Else
                
                If objParametros.ObtenerValor("dsObservacion") <> ObtenerCampo("dsObservacion").Text And _
                   ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                    ActualizarObservacionCaja
                End If
                If ObtenerCampo("dtCierre").Text <> "" Or objUsuario.tpAcceso = "Administración" Then
                    Unload Me
                    Exit Sub
                End If
                If Not ObtenerCampo("vlSaldoFinalPesos").Text > ObtenerCampo("vlSaldoInicialPesos").Text Then
                    ObtenerCampo("vlSaldoFinalPesos").Text = ObtenerCampo("vlSaldoInicialPesos").Text
                End If
                If Not ObtenerCampo("vlSaldoFinalEuros").Text > ObtenerCampo("vlSaldoInicialEuros").Text Then
                    ObtenerCampo("vlSaldoFinalEuros").Text = ObtenerCampo("vlSaldoInicialEuros").Text
                End If
                If Not ObtenerCampo("vlSaldoFinalDolares").Text > ObtenerCampo("vlSaldoInicialDolares").Text Then
                    ObtenerCampo("vlSaldoFinalDolares").Text = ObtenerCampo("vlSaldoInicialDolares").Text
                End If
                objParametros.GrabarValor "vlDiaDolar", ObtenerCampo("vlDiaDolar").Text
                objParametros.GrabarValor "vlDiaEuro", ObtenerCampo("vlDiaEuro").Text
           End If
           If Guardarregistro(EstadoABM) Then
                If objConfig.AbreCaja = "SI" Then
                    objParametros.GrabarValor "CajaAbierta", "SI"
                    objParametros.GrabarValor "nrCaja", ObtenerCampo("nrCaja").Text
                    Unload Me
                    Exit Sub
                End If
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            Select Case objParametros.ObtenerValor("Frm_ABMCaja")
            Case "Alta"
                objParametros.GrabarValor "CajaAbierta", "NO"
                Unload Me
                Exit Sub
            Case "CajaSinCerrar"
                objParametros.GrabarValor "CajaAbierta", "NO"
                Unload Me
                Exit Sub
            Case "CerrarCaja"
                objParametros.GrabarValor "Cancela", "SI"
                Unload Me
            Case Else
                PresentarPantalla Button
                EstadoABM = Consulta
            End Select
    Case "Imprimir"
        If Me.Check1.Value = vbUnchecked Then
           Guardarregistro modificacion
        End If
        imprimirCaja True
    End Select
    
End Sub



Private Sub imprimirCaja(porpantalla As Boolean)

    If ObtenerCampo("nrCaja").Text = "" Then
        MsgBox "Debe seleccionar una caja", vbCritical, "Atención"
    End If

    objbasededatos.Exec_SP_ObtenerResumenCajaPuesto ObtenerCampo("nrCaja").Text
    
    Frm_Principal.LimpiarReporte
    
    Select Case objUsuario.tpAcceso
    Case "Puestos"
        Frm_Principal.CrystalReport1.ReportFileName = App.Path & "\rpt_CierredeCaja_Imprime.rpt"
    Case Else
        Frm_Principal.CrystalReport1.ReportFileName = App.Path & "\rpt_cierredecaja_imprime_valores.rpt"
    End Select
    
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Movimiento de una Caja"
    Frm_Principal.CrystalReport1.Formulas(0) = "nrCajaManual = '" + ObtenerCampo("nrCaja").Text + "'"
    
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.CopiesToPrinter = 2
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
End Sub


Private Sub ExportaraExcel()
Dim strError  As String

    
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Cajas") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbCritical + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Cajas"
        ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As String

    

    If EstadoABM = alta Then
        strValor = objbasededatos.SP_ObtenerMaxnrCaja(objParametros.ObtenerValor("nrPuesto"))
        objDiccionariodeDatos.GuardarValorCampo _
                "TB_Cajas", "nrCaja", _
                ObtenerCampo("nrPuesto").Text, strValor
        ObtenerCampo("nrCaja").Text = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
    End If
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            strPrefijo = Mid(Control.Tag, 1, 3)
            If Not strPrefijo = "lbl" Then
                If Not Control.Tag = "" Then
                    strtag = Mid(Control.Tag, 1, 2)
                        If strtag = "fl" Then
                            ObjTablasIO.setearCampoOperadorValor _
                            Control.Tag, _
                            "<-", Control.Value
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
    Case cajasincerrar, modificacion
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                Guardarregistro = True
            End If
    Case alta
            
            ObjTablasIO.setearCampoOperadorValor "hrApertura", _
            "=", CStr(Format(Now, "HH:MM"))
            
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cajas", "nrCaja", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case CerrarCaja
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            ObjTablasIO.setearCampoOperadorValor "flEstado", _
            "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "hrCierre", _
            "<-", CStr(Format(Now, "HH:MM"))
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "La caja se ha cerrado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                    Sleep (6000)
                imprimirCaja False
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           If objParametros.ObtenerValor("frm_ABMCaja") = "CerrarCaja" Then
              Me.tlb_ABM.Buttons("Imprimir").Visible = True
              Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMCajas.Visible = False
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Cancelar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
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
        
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)

         If objConfig.nrPuesto = "9" Then
            ObjTablasIO.nmTabla = "VW_CajasPuestos"
            ' ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9", "AND"
         Else
            ObjTablasIO.nmTabla = "VWCajasPuestosdesdelosPuetos"
         End If
         
         
         ObjTablasIO.setearCampoOperadorValor "tpAcceso", "=", "Puestos", "AND"
         
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "VW_CajasPuestos", Me.cmbCampos.Text
         ' Filtros por nivel de Acceso
         Select Case objUsuario.tpAcceso
         Case "Puestos"
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND "
            ' si es un Puesto y usuario Comun FALTA PROGRAMAR
            ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", objUsuario.dsUsuario
         Case Else
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, ""
         End Select
        
         For n = 0 To Me.cmbCampos.ListCount - 1
                
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.List(n)
                If objDiccionariodeDatos.nmCampo = "dtApertura" Then
                    ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, "->", "", , "DESC"
                Else
                    ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                    "->", ""
                End If
         Next
         
         ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
         
         ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "->", ""
         
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cajas"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", Me.txtBusqueda, KeyAscii)
    End If
    
    Screen.ActiveForm.MousePointer = vbDefault

    
End Sub

Private Sub CalcularDiferencia()
Dim vlTotalSaldoFinal     As Single
Dim vlTotalSaldoFinalReal As Single

    
    ObtenerCampo("vlTotalSaldoFinal").Text = ObtenerPesos("vlTotalSaldoFinal")
    ObtenerCampo("vlTotalSaldoFinalReal").Text = ObtenerPesos("vlTotalSaldoFinalReal")
    ObtenerCampo("vlTotalSaldoFinal").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlTotalSaldoFinal", ObtenerCampo("vlTotalSaldoFinal").Text)
    ObtenerCampo("vlTotalSaldoFinalReal").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlTotalSaldoFinalReal", ObtenerCampo("vlTotalSaldoFinalReal").Text)
    vlTotalSaldoFinal = ObtenerValoresNumericos("vlTotalSaldoFinal")
    vlTotalSaldoFinalReal = ObtenerValoresNumericos("vlTotalSaldoFinalReal")
    ObtenerCampo("vlTotalSaldoCierre").Text = ObtenerPesos("vlTotalSaldoCierre")
    ObtenerCampo("vlDiferenciaDeCierre").Text = vlTotalSaldoFinal - vlTotalSaldoFinalReal
    ObtenerCampo("vlDiferenciaDeCierre").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlDiferenciaDeCierre", ObtenerCampo("vlDiferenciaDeCierre").Text)
    ObtenerCampo("vlCierrePesos").Text = ObtenerValoresNumericos("vlSaldoFinalRealPesos") - ObtenerValoresNumericos("vlSaldoInicialPesos")
    ObtenerCampo("vlCierreDolares").Text = ObtenerValoresNumericos("vlSaldoFinalRealDolares") - ObtenerValoresNumericos("vlSaldoInicialDolares")
    ObtenerCampo("vlCierreEuros").Text = ObtenerValoresNumericos("vlSaldoFinalRealEuros") - ObtenerValoresNumericos("vlSaldoInicialEuros")
    ObtenerCampo("vlCierrePesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierrePesos", ObtenerCampo("vlCierrePesos").Text)
    ObtenerCampo("vlCierreDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreDolares", ObtenerCampo("vlCierreDolares").Text)
    ObtenerCampo("vlCierreEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreEuros", ObtenerCampo("vlCierreEuros").Text)
    


End Sub



Private Function ObtenerValoresNumericos(pTag As String) As Single

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
End Function


Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = CSng(ObtenerCampo("vlDiaEuro").Text)
    vlDiaDolar = CSng(ObtenerCampo("vlDiaDolar").Text)

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlTotalSaldoFinalReal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
        Case "vlTotalSaldoFinal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalPesos")
        Case "vlTotalSaldoCierre"
            ObtenerPesos = ObtenerValoresNumericos("vlCierreEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierreDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierrePesos")
        End Select
    End If
    
End Function

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                                  Me.txtFields(Index), "GotFocus"
        CalcularDiferencia
    End If


End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
       If Me.txtFields(Index).Tag <> "" Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", _
                            Me.txtFields(Index), KeyAscii)
       End If
    End If
    
End Sub



Private Sub txtFields_LostFocus(Index As Integer)
    
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                              Me.txtFields(Index), "LostFocus"
    End If

End Sub

Private Sub ActualizarObservacionCaja()

    ObtenerCampo("dtObservacion").Text = Now()
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", ObtenerCampo("dsObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "dtObservacion", "<-", ObtenerCampo("dtObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.Actualizar
    
   
End Sub

