VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_BusquedaMovimientosContables 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Busqueda Movimientos Contables"
   ClientHeight    =   8100
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   11805
   ClipControls    =   0   'False
   Icon            =   "Frm_BusquedaMovimientosContables.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8100
   ScaleWidth      =   11805
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   11805
      _ExtentX        =   20823
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgToolbar"
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
            Caption         =   "Reporte"
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
      MouseIcon       =   "Frm_BusquedaMovimientosContables.frx":030A
      Begin MSComctlLib.ImageList imgMovimientosContablesResaltado 
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
               Picture         =   "Frm_BusquedaMovimientosContables.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgToolbar 
         Left            =   8025
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
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":2EF6
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":334A
               Key             =   "Reporte"
               Object.Tag             =   "Reporte"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraBusqContables 
      BorderStyle     =   0  'None
      Height          =   7140
      Left            =   0
      TabIndex        =   15
      Top             =   570
      Width           =   10290
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2805
         TabIndex        =   46
         Top             =   3195
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   47
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   50
            Top             =   375
            Width           =   855
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   49
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   48
            Top             =   390
            Width           =   510
         End
      End
      Begin VB.CommandButton cmdBuscar 
         Height          =   375
         Left            =   5700
         Picture         =   "Frm_BusquedaMovimientosContables.frx":345C
         Style           =   1  'Graphical
         TabIndex        =   41
         Top             =   705
         Width           =   375
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4305
         TabIndex        =   0
         Top             =   300
         Width           =   5850
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
               Picture         =   "Frm_BusquedaMovimientosContables.frx":355E
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":3670
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":3782
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":3894
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":39A6
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_BusquedaMovimientosContables.frx":3AB8
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2580
         TabIndex        =   14
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
         Height          =   5835
         Left            =   135
         TabIndex        =   12
         Top             =   1215
         Width           =   10065
         _ExtentX        =   17754
         _ExtentY        =   10292
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
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   15
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "IdMovimiento"
            Text            =   "Codigo"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "tpOperacion"
            Text            =   "Operación"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "vlPesos"
            Text            =   "Pesos"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "vlDolares"
            Text            =   "Dolares"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "vlEuros"
            Text            =   "Euros"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dsConcepto"
            Text            =   "Concepto"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "tpConcepto"
            Text            =   "Tipo Concepto"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "dsMovimiento"
            Text            =   "Descripción"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "dtMovimiento"
            Text            =   "Fecha"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "nrRecibo"
            Text            =   "Recibo"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "nrFactura"
            Text            =   "Factura"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Object.Tag             =   "dsProveedor"
            Text            =   "Des. Proveedor"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Object.Tag             =   "nrCaja"
            Text            =   "Caja"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(15) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   14
            Object.Tag             =   "dsObservacion"
            Text            =   "Observación"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   330
         Width           =   2400
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1440
         TabIndex        =   42
         Tag             =   "dtDesde"
         Top             =   720
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   158466049
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   3945
         TabIndex        =   43
         Tag             =   "dtHasta"
         Top             =   735
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   158466049
         CurrentDate     =   38267
      End
      Begin VB.Label lblLabels 
         Caption         =   "Fecha Desde"
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
         Index           =   12
         Left            =   135
         TabIndex        =   45
         Top             =   825
         Width           =   1200
      End
      Begin VB.Label lblLabels 
         Caption         =   "Hasta"
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
         Index           =   13
         Left            =   3225
         TabIndex        =   44
         Top             =   810
         Width           =   645
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   17
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   16
         Top             =   105
         Width           =   795
      End
   End
   Begin VB.Frame fraMovimientosContables 
      BorderStyle     =   0  'None
      Height          =   7245
      Left            =   75
      TabIndex        =   19
      Top             =   585
      Width           =   10770
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   4980
         Left            =   960
         ScaleHeight     =   4950
         ScaleWidth      =   8340
         TabIndex        =   20
         Top             =   1095
         Width           =   8370
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   990
            Index           =   20
            Left            =   330
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   52
            TabStop         =   0   'False
            Tag             =   "dsObservacion"
            Top             =   3510
            Width           =   7605
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   12
            Left            =   4335
            Locked          =   -1  'True
            TabIndex        =   39
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   420
            Width           =   2310
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   11
            Left            =   2355
            Locked          =   -1  'True
            TabIndex        =   37
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   420
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   10
            Left            =   6675
            Locked          =   -1  'True
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "dtMovimiento"
            Top             =   420
            Width           =   1245
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   9
            Left            =   345
            TabIndex        =   8
            Tag             =   "vlEuros"
            Text            =   "0"
            Top             =   2985
            Width           =   1020
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   17
            Left            =   1485
            TabIndex        =   9
            Tag             =   "vlDolares"
            Text            =   "0"
            Top             =   2985
            Width           =   1020
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   18
            Left            =   2640
            ScrollBars      =   2  'Vertical
            TabIndex        =   10
            TabStop         =   0   'False
            Tag             =   "vlPesos"
            Text            =   "0"
            Top             =   2985
            Width           =   2070
         End
         Begin VB.CommandButton cmdLimpiar 
            Height          =   285
            Left            =   6750
            Picture         =   "Frm_BusquedaMovimientosContables.frx":3BCA
            Style           =   1  'Graphical
            TabIndex        =   11
            TabStop         =   0   'False
            ToolTipText     =   "Borrar Valores"
            Top             =   2775
            Visible         =   0   'False
            Width           =   285
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Index           =   6
            Left            =   2400
            Locked          =   -1  'True
            TabIndex        =   7
            TabStop         =   0   'False
            Tag             =   "tpOperacion"
            Top             =   1620
            Width           =   2640
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   5
            Left            =   375
            Locked          =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   6
            TabStop         =   0   'False
            Tag             =   "tpConcepto"
            Top             =   1635
            Width           =   1980
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   4
            Left            =   345
            Locked          =   -1  'True
            TabIndex        =   5
            TabStop         =   0   'False
            Tag             =   "dsConcepto"
            Top             =   1035
            Width           =   7575
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   5400
            Locked          =   -1  'True
            TabIndex        =   4
            TabStop         =   0   'False
            Tag             =   "cdConcepto"
            Top             =   3015
            Visible         =   0   'False
            Width           =   870
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   2
            Left            =   5835
            TabIndex        =   3
            Tag             =   "nrRecibo"
            Top             =   2295
            Width           =   2100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   345
            Locked          =   -1  'True
            TabIndex        =   23
            TabStop         =   0   'False
            Tag             =   "IdMovimiento"
            Top             =   420
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   8
            Left            =   3285
            TabIndex        =   2
            Tag             =   "nrFactura"
            Top             =   2295
            Width           =   2535
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            IMEMode         =   3  'DISABLE
            Index           =   1
            Left            =   375
            TabIndex        =   1
            Tag             =   "dsProveedor"
            Top             =   2295
            Width           =   2895
         End
         Begin MSComctlLib.ListView lstBusquedaConceptos 
            Height          =   432
            Left            =   336
            TabIndex        =   51
            Top             =   4524
            Visible         =   0   'False
            Width           =   7596
            _ExtentX        =   13388
            _ExtentY        =   767
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
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
            OLEDropMode     =   1
            NumItems        =   4
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Key             =   "cdConcepto"
               Object.Tag             =   "cdConcepto"
               Text            =   "Código"
               Object.Width           =   0
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Key             =   "dsConcepto"
               Object.Tag             =   "dsConcepto"
               Text            =   "Descripción"
               Object.Width           =   5292
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Object.Tag             =   "tpConcepto"
               Text            =   "Tipo "
               Object.Width           =   3263
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Key             =   "tpOperacion"
               Object.Tag             =   "tpOperacion"
               Text            =   "Operación"
               Object.Width           =   2822
            EndProperty
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
            Height          =   255
            Index           =   11
            Left            =   4335
            TabIndex        =   40
            Top             =   195
            Width           =   1995
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
            Index           =   10
            Left            =   2370
            TabIndex        =   38
            Top             =   195
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fecha"
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
            Index           =   9
            Left            =   6690
            TabIndex        =   36
            Top             =   195
            Width           =   855
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Descripción del Movimiento"
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
            Left            =   345
            TabIndex        =   34
            Top             =   795
            Width           =   3015
         End
         Begin VB.Label Label8 
            Alignment       =   2  'Center
            BackColor       =   &H00FFC0C0&
            Caption         =   "Total Pesos"
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
            Left            =   2595
            TabIndex        =   33
            Top             =   2730
            Width           =   1080
         End
         Begin VB.Label Label21 
            Alignment       =   2  'Center
            BackColor       =   &H00FFC0C0&
            Caption         =   "Total u$s"
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
            Left            =   1545
            TabIndex        =   32
            Top             =   2745
            Width           =   945
         End
         Begin VB.Label Label22 
            Alignment       =   2  'Center
            BackColor       =   &H00FFC0C0&
            Caption         =   "Total Euros"
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
            Left            =   360
            TabIndex        =   31
            Top             =   2745
            Width           =   1050
         End
         Begin VB.Label Label17 
            Alignment       =   2  'Center
            BackColor       =   &H00FFC0C0&
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   2490
            TabIndex        =   30
            Top             =   3015
            Width           =   165
         End
         Begin VB.Label Label20 
            Alignment       =   2  'Center
            BackColor       =   &H00FFC0C0&
            Caption         =   "+"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   195
            Left            =   1335
            TabIndex        =   29
            Top             =   3030
            Width           =   165
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Operación"
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
            Index           =   8
            Left            =   2400
            TabIndex        =   28
            Top             =   1410
            Width           =   1470
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Tipo "
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
            Left            =   390
            TabIndex        =   27
            Top             =   1395
            Width           =   660
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Concepto"
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
            Index           =   5
            Left            =   6375
            TabIndex        =   26
            Top             =   4245
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Número de Recibo"
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
            Index           =   3
            Left            =   5850
            TabIndex        =   25
            Top             =   2085
            Width           =   1785
         End
         Begin VB.Label lblLabels 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Número de Factura"
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
            Index           =   2
            Left            =   3285
            TabIndex        =   24
            Top             =   2085
            Width           =   1770
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Proveedor"
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
            Index           =   1
            Left            =   345
            TabIndex        =   22
            Top             =   2040
            Width           =   1995
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Código"
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
            Left            =   375
            TabIndex        =   21
            Top             =   195
            Width           =   1995
         End
      End
   End
End
Attribute VB_Name = "Frm_BusquedaMovimientosContables"
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
                ' HabilitarCampos Control.Tag, True
            End If
        End If
    Next
    
    ObtenerCampo("vlPesos").Text = "0,00"
    ObtenerCampo("vlDolares").Text = "0,00"
    ObtenerCampo("vlEuros").Text = "0,00"
    
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

Private Sub cmdLimpiar_Click()

    ObtenerCampo("vlPesos").Text = "0,00"
    ObtenerCampo("vlDolares").Text = "0,00"
    ObtenerCampo("vlEuros").Text = "0,00"
    
End Sub

Private Sub cmdFacturar_Click()

    tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
    
    
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
    buscarTodoslosConceptos
    Me.cmbCampos.ListIndex = 1
    ObtenerCampo("dtDesde").value = "01/" + CStr(Month(Date)) + "/" + CStr(Year(Date))
    ObtenerCampo("dtHasta").value = Date
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    If objParametros.ObtenerValor("Precede_Resumen") = "SI" Then
        ObtenerCampo("dtDesde").value = objParametros.ObtenerValor("dtDesde")
        ObtenerCampo("dtHasta").value = objParametros.ObtenerValor("dtHasta")
        desglozardesdeResumendeMovimientosContables
    End If
    
    
End Sub


Private Sub desglozardesdeResumendeMovimientosContables()
Dim n As Integer

         Screen.ActiveForm.MousePointer = vbHourglass
         ObjTablasIO.nmTabla = "TB_MovimientosContables"
         ObjTablasIO.setearCampoOperadorValor "dsConcepto", "=", objParametros.ObtenerValor("dsConcepto"), " AND "
         If Not objParametros.ObtenerValor("dsConcepto") = "" Then
            ObjTablasIO.setearCampoOperadorValor "dsMovimiento", "=", objParametros.ObtenerValor("dsMovimiento"), " AND "
         End If
         ObjTablasIO.setearCampoOperadorValor "tpConcepto", "=", objParametros.ObtenerValor("tpConcepto"), " AND "
         ' comentado en la version 3.3
         '--ObjTablasIO.setearCampoOperadorValor "tpOperacion", "=", objParametros.ObtenerValor("tpOperacion"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtMovimiento", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtMovimiento", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59")
         ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_MovimientosContables"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            Me.lstBusqueda.SortKey = 0
            Me.lstBusqueda.SortOrder = lvwAscending
            Me.lstBusqueda.Sorted = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         End If
         Screen.ActiveForm.MousePointer = vbDefault
            
End Sub







Private Sub buscarTodoslosConceptos()
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

        Me.lstBusquedaConceptos.ListItems.Clear
        ObjTablasIO.nmTabla = "TB_Conceptos"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "->", "", "ASC"
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", "AND"
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<>", "Neutro", "AND"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1027", "AND"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1028", ""
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusquedaConceptos, 0, "TB_Conceptos"
        End If
        
End Sub

Private Function buscarConceptos(pDato As String) As Boolean
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

        ObjTablasIO.nmTabla = "TB_Conceptos"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", "", , "ASC"
        ObjTablasIO.setearCampoOperadorValor "tpConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", "AND"
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<>", "Neutro", "AND"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1027", "AND"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1028", "AND"
        
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "Like", pDato
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            Me.lstBusquedaConceptos.ListItems.Clear
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusquedaConceptos, 0, "TB_Conceptos"
            buscarConceptos = True
        Else
            buscarConceptos = False
        End If
        
End Function

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_MovimientosContables"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_MovimientosContables")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_MovimientosContables")
    Loop
    Me.cmbCampos.ListIndex = 1


End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
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
    
    
    ObjTablasIO.nmTabla = "TB_MovimientosContables"
    ObjTablasIO.setearCampoOperadorValor "IdMovimiento", _
    "=", Me.lstBusqueda.SelectedItem.Text
    
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            
            End If
        End If
    Next
    ObjTablasIO.Seleccionar
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_MovimientosContables", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                            
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    ' Version 2.9
    Dim puedeOperar As Boolean
    puedeOperar = objCajas.puedeOperar(ObtenerCampo("nrCaja"), ObtenerCampo("cdConcepto"))
    For Each Control In Me.txtFields
        If Not puedeOperar Then
            HabilitarCampos Control.Tag, False
        Else
            HabilitarCampos Control.Tag, True
        End If
    Next
    
        
    Me.cmdLimpiar.Enabled = False
    Me.lstBusquedaConceptos.Enabled = False
                 
    EstadoABM = Consulta
    
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
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

Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub





Private Sub lstBusquedaConceptos_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)


    If Me.lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1 Then
        If lstBusquedaConceptos.SortOrder = lvwAscending And lstBusquedaConceptos.Sorted Then
            lstBusquedaConceptos.SortOrder = lvwDescending
        Else
            lstBusquedaConceptos.SortOrder = lvwAscending
        End If
        lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1
    Else
       lstBusquedaConceptos.SortOrder = lvwAscending
       lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1
    End If
    ' lstBusqueda.Refresh
    lstBusquedaConceptos.Sorted = True
    
End Sub

Private Sub lstBusquedaConceptos_DblClick()



    If Me.lstBusquedaConceptos.ListItems.Count < 1 Then Exit Sub
    PasarItems
    

End Sub


Private Sub PasarItems()
    
    ObtenerCampo("cdConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.Text
    ObtenerCampo("dsConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(1)
    ObtenerCampo("tpConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(2)
    ObtenerCampo("tpOperacion").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(3)
    ObtenerCampo("vlPesos").SetFocus
    
End Sub


Private Sub lstBusquedaConceptos_KeyPress(KeyAscii As Integer)

    Select Case KeyAscii
    Case vbKeyReturn
        If Me.lstBusquedaConceptos.ListItems.Count < 1 Then Exit Sub
        PasarItems
    Case vbKeyBack
        ObtenerCampo("dsConceptoBuscado").SetFocus
    End Select
    
End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           limpiarControles
           ' Pasar datos
           lstBusqueda_DblClick
           PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
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
           Me.lstBusquedaConceptos.Enabled = True
           Me.cmdLimpiar.Enabled = True
           buscarTodoslosConceptos
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
    Case "Reporte"
         ImprimirReporte
    Case "Salir", "Aceptar"
           Unload Me
     Case "Cancelar"
            'ActualizarSaldos
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub


Private Sub ImprimirReporte()
Dim strSQL As String

    If ObjTablasIO.strUltimoWhere = "" Then Exit Sub
    
    strSQL = ReemplazarPalabra(ObjTablasIO.strUltimoWhere, "'", "''")
    strSQL = ReemplazarPalabra(strSQL, "TB_MovimientosContables.", " ")
    
    Frm_Principal.LimpiarReporte
    
    If objbasededatos.ExecStoredProcedures("SP_TB_MovimientosContables_Qry @strSQL_param='" + strSQL + "' , @dsUsuario_param='" + objUsuario.dsUsuario + "'") Then
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_MovimientosContables_v1.rpt"
        
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Movimientos Contables - Gastos"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = "Reporte"
        Frm_Principal.CrystalReport1.StoredProcParam(1) = objUsuario.dsUsuario
        
        Frm_Principal.CrystalReport1.Formulas(1) = "FechaDesde='" + CStr(ObtenerCampo("dtDesde").value) + "'"
        Frm_Principal.CrystalReport1.Formulas(2) = "FechaHasta='" + CStr(ObtenerCampo("dtHasta").value) + "'"
        
        ' Frm_Principal.CrystalReport1.RetrieveDataFile
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
        End If
        On Error GoTo 0
    End If
        
End Sub


Private Sub ActualizarSaldos()
           
           objCajas.ObtenerSaldosdeInicioyValores objParametros.ObtenerValor("nrCaja")
           
           ObtenerCampo("vlSaldoInicialPesos").Text = objCajas.vlSaldoInicialPesos
           ObtenerCampo("vlSaldoInicialDolares").Text = objCajas.vlSaldoInicialDolares
           ObtenerCampo("vlSaldoInicialEuros").Text = objCajas.vlSaldoInicialEuros
           
           objCajas.SumarCajaADM objParametros.ObtenerValor("nrCaja"), "CA", ""
           
           ObtenerCampo("vlCierrePesos").Text = FormatNumber(objCajas.vlPesos, 2)
           ObtenerCampo("vlCierreDolares").Text = FormatNumber(objCajas.vlDolares, 2)
           ObtenerCampo("vlCierreEuros").Text = FormatNumber(objCajas.vlEuros, 2)
           
           ObtenerCampo("vlSaldoFinalRealPesos").Text = FormatNumber(ObtenerValoresNumericos("vlCierrePesos") + ObtenerValoresNumericos("vlSaldoInicialPesos"), 2)
           ObtenerCampo("vlSaldoFinalRealDolares").Text = FormatNumber(ObtenerValoresNumericos("vlCierreDolares") + ObtenerValoresNumericos("vlSaldoInicialDolares"), 2)
           ObtenerCampo("vlSaldoFinalRealEuros").Text = FormatNumber(ObtenerValoresNumericos("vlCierreEuros") + ObtenerValoresNumericos("vlSaldoInicialEuros"), 2)
           
           ObtenerCampo("vlTotalSaldoInicial").Text = FormatNumber(ObtenerPesos("vlTotalSaldoInicial"), 2)
           ObtenerCampo("vlTotalSaldoCierre").Text = FormatNumber(ObtenerPesos("vlTotalSaldoCierre"), 2)
           ObtenerCampo("vlTotalSaldoRealFinal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoRealFinal"), 2)
           
           HabilitarCampos "vlCierrePesos", False
           HabilitarCampos "vlCierreDolares", False
           HabilitarCampos "vlCierreEuros", False
           HabilitarCampos "vlSaldoInicialPesos", False
           HabilitarCampos "vlSaldoInicialDolares", False
           HabilitarCampos "vlSaldoInicialEuros", False
           HabilitarCampos "vlSaldoFinalRealPesos", False
           HabilitarCampos "vlSaldoFinalRealDolares", False
           HabilitarCampos "vlSaldoFinalRealEuros", False
           
           HabilitarCampos "vlTotalSaldoInicial", False
           HabilitarCampos "vlTotalSaldoCierre", False
           HabilitarCampos "vlTotalSaldoRealFinal", False
           
           
           
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
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_MovimientosContables") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
End Sub

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_MovimientosContables"
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
        
    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "IdMovimiento", _
            "=", ObtenerCampo("IdMovimiento").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_MovimientosContables", "IdMovimiento", objConfig.nrPuesto
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqContables.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraMovimientosContables.Visible = True
           Me.tlb_ABM.Buttons("Reporte").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCaja", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
           HabilitarCampos "dsProveedor", False
           HabilitarCampos "nrFactura", False
           HabilitarCampos "nrRecibo", False
           HabilitarCampos "vlEuros", False
           HabilitarCampos "vlDolares", False
           HabilitarCampos "vlPesos", False
           HabilitarCampos "dsObservacion", False
           Me.tlb_ABM.Enabled = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.tlb_ABM.Buttons("Reporte").Visible = False
           Me.fraBusqContables.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraMovimientosContables.Visible = True
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
           Me.tlb_ABM.Buttons("Reporte").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraMovimientosContables.Visible = False
           Me.fraBusqContables.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Reporte").Visible = True
           Me.fraMovimientosContables.Visible = False
           Me.fraBusqContables.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraMovimientosContables.Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Reporte").Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.fraBusqContables.Visible = True
           
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    
    If Me.fraBusqContables.Visible Then
        Me.fraBusqContables.Visible = True
          Me.txtBusqueda.SetFocus
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
         If Me.txtBusqueda.Text = "" Then Exit Sub
         If Me.txtBusqueda.Text = "*" Or Me.txtBusqueda.Text = "%" Then
            Me.txtBusqueda.Text = "*"
            ' MsgBox "Por favor ingrese la palabra o parte de ella, la cual busca.", vbInformation + vbDefaultButton1, "Atención"
            ' Exit Sub
         End If
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_MovimientosContables"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         
         ObjTablasIO.setearCampoOperadorValor "dtMovimiento", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtMovimiento", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59")
         
         ' ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCaja")
         ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
       
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_MovimientosContables"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            Me.lstBusqueda.SortKey = 0
            Me.lstBusqueda.SortOrder = lvwAscending
            Me.lstBusqueda.Sorted = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            ' MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_MovimientosContables", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_MovimientosContables", _
                                Me.txtFields(Index), KeyAscii)
    End If
    
End Sub



Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "LostFocus"
End Sub


