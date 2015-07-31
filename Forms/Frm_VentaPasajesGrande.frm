VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#4.6#0"; "CRYSTL32.OCX"
Begin VB.Form Frm_VentaPasajesGrande 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Venta de Viajes"
   ClientHeight    =   8160
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9450
   Icon            =   "Frm_VentaPasajesGrande.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8160
   ScaleWidth      =   9450
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraVentaPasajes 
      Caption         =   "Datos de la Factura"
      Height          =   7425
      Left            =   60
      TabIndex        =   20
      Top             =   660
      Width           =   9090
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   2
         ItemData        =   "Frm_VentaPasajesGrande.frx":030A
         Left            =   1890
         List            =   "Frm_VentaPasajesGrande.frx":0317
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Tag             =   "tpComision"
         Top             =   5400
         Width           =   1725
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   7
         Left            =   5805
         Locked          =   -1  'True
         TabIndex        =   68
         Tag             =   "vlPrecioPeaje"
         Top             =   3720
         Width           =   1005
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   6
         Left            =   4680
         Locked          =   -1  'True
         TabIndex        =   66
         Tag             =   "vlPorcentaje"
         Top             =   3720
         Width           =   1140
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   5
         Left            =   150
         Locked          =   -1  'True
         TabIndex        =   0
         TabStop         =   0   'False
         Tag             =   "cdProducto"
         Top             =   7260
         Visible         =   0   'False
         Width           =   1350
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   3
         Left            =   3285
         Locked          =   -1  'True
         TabIndex        =   64
         Tag             =   "tpOperacion"
         Top             =   3720
         Width           =   1380
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   1
         Left            =   135
         Locked          =   -1  'True
         TabIndex        =   63
         Tag             =   "dsProducto"
         Top             =   3720
         Width           =   3120
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   0
         Left            =   6810
         Locked          =   -1  'True
         TabIndex        =   70
         Tag             =   "vlPrecioViaje"
         Top             =   3720
         Width           =   1470
      End
      Begin VB.CommandButton cmdNuevoViaje 
         Caption         =   "Agregar Destino"
         Height          =   315
         Left            =   3360
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   1545
         Width           =   1455
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   3
         Left            =   3750
         TabIndex        =   21
         Tag             =   "nrDoc"
         Top             =   1035
         Width           =   2100
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   50
         Left            =   5865
         TabIndex        =   23
         Tag             =   "dsEmail"
         Top             =   1020
         Width           =   2970
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   6
         Left            =   1080
         TabIndex        =   19
         Tag             =   "dsRazonSocial"
         Text            =   "Consumidor Final"
         Top             =   1035
         Width           =   2640
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   5
         Left            =   180
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "cdCliente"
         Top             =   1035
         Width           =   900
      End
      Begin VB.CommandButton cmdFacturar 
         Caption         =   "&Facturar"
         Height          =   375
         Left            =   5265
         TabIndex        =   15
         ToolTipText     =   "Imprimir la Factura"
         Top             =   6975
         Width           =   3330
      End
      Begin VB.CommandButton cmdCalcular 
         Height          =   285
         Left            =   8610
         Picture         =   "Frm_VentaPasajesGrande.frx":033D
         Style           =   1  'Graphical
         TabIndex        =   1
         TabStop         =   0   'False
         ToolTipText     =   "Borrar Valores"
         Top             =   6315
         Width           =   285
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
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
         Index           =   24
         Left            =   5355
         Locked          =   -1  'True
         TabIndex        =   36
         TabStop         =   0   'False
         Tag             =   "vlSaldoEuros"
         Text            =   "0"
         Top             =   6615
         Width           =   1020
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
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
         Index           =   22
         Left            =   6480
         Locked          =   -1  'True
         TabIndex        =   35
         TabStop         =   0   'False
         Tag             =   "vlSaldoDolares"
         Text            =   "0"
         Top             =   6615
         Width           =   1020
      End
      Begin VB.TextBox txtSaldos 
         Alignment       =   2  'Center
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
         Index           =   21
         Left            =   7605
         Locked          =   -1  'True
         TabIndex        =   34
         TabStop         =   0   'False
         Tag             =   "vlSaldoPesos"
         Text            =   "0"
         Top             =   6615
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
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
         Left            =   7605
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "vlPagoPesos"
         Text            =   "0"
         Top             =   6285
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
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
         Left            =   6480
         TabIndex        =   13
         Tag             =   "vlPagoDolares"
         Text            =   "0"
         Top             =   6285
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
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
         Left            =   5340
         TabIndex        =   12
         Tag             =   "vlPagoEuros"
         Text            =   "0"
         Top             =   6285
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   23
         Left            =   3930
         Locked          =   -1  'True
         TabIndex        =   33
         TabStop         =   0   'False
         Tag             =   "dtComprobante"
         Top             =   465
         Width           =   1365
      End
      Begin VB.CommandButton cmdAgregarItemFactura 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8310
         Picture         =   "Frm_VentaPasajesGrande.frx":042F
         Style           =   1  'Graphical
         TabIndex        =   72
         Top             =   3705
         Width           =   285
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   2
         Left            =   165
         TabIndex        =   3
         Tag             =   "dsProductoBuscado"
         Top             =   1575
         Width           =   3120
      End
      Begin VB.TextBox txtTotales 
         Alignment       =   2  'Center
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
         Index           =   21
         Left            =   5355
         Locked          =   -1  'True
         TabIndex        =   32
         TabStop         =   0   'False
         Tag             =   "vlTotalEuros"
         Text            =   "0"
         Top             =   5985
         Width           =   1020
      End
      Begin VB.TextBox txtTotales 
         Alignment       =   2  'Center
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
         Index           =   20
         Left            =   6480
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   31
         TabStop         =   0   'False
         Tag             =   "vlTotalDolares"
         Text            =   "0"
         Top             =   5985
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
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
         ForeColor       =   &H000000FF&
         Height          =   285
         Index           =   7
         Left            =   7620
         Locked          =   -1  'True
         TabIndex        =   30
         TabStop         =   0   'False
         Tag             =   "vlTotalGeneral"
         Text            =   "0"
         Top             =   6000
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   13
         Left            =   3660
         TabIndex        =   8
         Tag             =   "nrLicencia"
         Top             =   5415
         Width           =   795
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   19
         Left            =   4485
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         TabStop         =   0   'False
         Tag             =   "nmLicenciatario"
         Top             =   5415
         Width           =   2475
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdComprobante"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   1710
         Locked          =   -1  'True
         TabIndex        =   29
         TabStop         =   0   'False
         Tag             =   "nrComprobante"
         Top             =   480
         Width           =   1350
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_VentaPasajesGrande.frx":052F
         Left            =   3090
         List            =   "Frm_VentaPasajesGrande.frx":0539
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   28
         TabStop         =   0   'False
         Tag             =   "tpComprobante"
         Top             =   465
         Width           =   855
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   1
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   27
         TabStop         =   0   'False
         Tag             =   "nrTalonario"
         Top             =   480
         Width           =   780
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   0
         ItemData        =   "Frm_VentaPasajesGrande.frx":0543
         Left            =   150
         List            =   "Frm_VentaPasajesGrande.frx":0559
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Tag             =   "cdCondVenta"
         Top             =   5400
         Width           =   1725
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   4
         Left            =   210
         Locked          =   -1  'True
         TabIndex        =   26
         TabStop         =   0   'False
         Tag             =   "tpIVA"
         Text            =   "Exento"
         Top             =   480
         Width           =   720
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   8
         Left            =   120
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "dsLeyenda"
         Top             =   5985
         Width           =   4125
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   10
         Left            =   5295
         Locked          =   -1  'True
         TabIndex        =   25
         TabStop         =   0   'False
         Tag             =   "dsUsuario"
         Top             =   465
         Width           =   1800
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   11
         Left            =   7110
         Locked          =   -1  'True
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "nrPuesto"
         Top             =   465
         Width           =   600
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   12
         Left            =   7740
         Locked          =   -1  'True
         TabIndex        =   22
         TabStop         =   0   'False
         Tag             =   "nrCaja"
         Top             =   465
         Width           =   1080
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   14
         Left            =   7950
         TabIndex        =   10
         Tag             =   "nrBultos"
         Top             =   5400
         Width           =   405
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   15
         Left            =   7170
         TabIndex        =   9
         Tag             =   "nrPasajeros"
         Top             =   5400
         Width           =   480
      End
      Begin MSComctlLib.ListView lstBusquedaProductos 
         Height          =   1590
         Left            =   150
         TabIndex        =   4
         Top             =   1890
         Width           =   8430
         _ExtentX        =   14870
         _ExtentY        =   2805
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
         OLEDropMode     =   1
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "cdProducto"
            Object.Tag             =   "cdProducto"
            Text            =   "Código"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "dsProducto"
            Object.Tag             =   "dsProducto"
            Text            =   "Descripción"
            Object.Width           =   5468
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "tpOperacion"
            Object.Tag             =   "tpOperacion"
            Text            =   "Operación"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "vlPorcentaje"
            Object.Tag             =   "vlPorcentaje"
            Text            =   "Porcentaje"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "vlPrecioPeaje"
            Object.Tag             =   "vlPrecioPeaje"
            Text            =   "Peaje"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "vlPrecioViaje"
            Object.Tag             =   "vlPrecioViaje"
            Text            =   "Precio Total"
            Object.Width           =   2469
         EndProperty
      End
      Begin MSComctlLib.ListView lstItemsFactura 
         Height          =   1140
         Left            =   120
         TabIndex        =   5
         Top             =   4035
         Width           =   8445
         _ExtentX        =   14896
         _ExtentY        =   2011
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         HideColumnHeaders=   -1  'True
         OLEDropMode     =   1
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDropMode     =   1
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "cdProducto"
            Object.Tag             =   "cdProducto"
            Text            =   "Código"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "dsProducto"
            Object.Tag             =   "dsProducto"
            Text            =   "Descripción"
            Object.Width           =   5468
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "tpOperacion"
            Object.Tag             =   "tpOperacion"
            Text            =   "Operación"
            Object.Width           =   2469
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "vlPorcentaje"
            Object.Tag             =   "vlPorcentaje"
            Text            =   "Porcentaje"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "vlPrecioPeaje"
            Object.Tag             =   "vlPrecioPeaje"
            Text            =   "Peaje"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "vlPrecioViaje"
            Object.Tag             =   "vlPrecioViaje"
            Text            =   "Precio Total"
            Object.Width           =   2469
         EndProperty
      End
      Begin VB.Label lblComision 
         Caption         =   "Comisión: $ 0,00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   150
         TabIndex        =   81
         Top             =   6810
         Width           =   4050
      End
      Begin VB.Label lblLabels 
         Caption         =   "Comisión"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   5
         Left            =   1920
         TabIndex        =   80
         Top             =   5175
         Width           =   1620
      End
      Begin VB.Label Label30 
         Caption         =   "Descripción"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   165
         TabIndex        =   79
         Top             =   3510
         Width           =   1455
      End
      Begin VB.Label Label29 
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
         Height          =   225
         Left            =   3315
         TabIndex        =   78
         Top             =   3510
         Width           =   1290
      End
      Begin VB.Label Label28 
         Caption         =   "Porcentaje"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   4665
         TabIndex        =   77
         Top             =   3510
         Width           =   1125
      End
      Begin VB.Label Label27 
         Caption         =   "Peaje"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   5805
         TabIndex        =   76
         Top             =   3510
         Width           =   840
      End
      Begin VB.Label Label23 
         Caption         =   "Precio Total"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   6810
         TabIndex        =   75
         Top             =   3510
         Width           =   1380
      End
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   6345
         TabIndex        =   74
         Top             =   6360
         Width           =   165
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7455
         TabIndex        =   73
         Top             =   6360
         Width           =   165
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   6345
         TabIndex        =   71
         Top             =   6030
         Width           =   165
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7455
         TabIndex        =   69
         Top             =   6030
         Width           =   165
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   7455
         TabIndex        =   67
         Top             =   6645
         Width           =   165
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "ó"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   6345
         TabIndex        =   65
         Top             =   6645
         Width           =   165
      End
      Begin VB.Label lblLabels 
         Caption         =   "Ingrese el Destino"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   4
         Left            =   180
         TabIndex        =   62
         Top             =   1350
         Width           =   3000
      End
      Begin VB.Label Label7 
         Caption         =   "CUIT / DNI"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3765
         TabIndex        =   61
         Top             =   810
         Width           =   1275
      End
      Begin VB.Label Label18 
         Caption         =   "E-Mail"
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
         Left            =   5865
         TabIndex        =   60
         Top             =   810
         Width           =   930
      End
      Begin VB.Label Label5 
         Caption         =   "Razón Social / Nombre"
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
         Left            =   1095
         TabIndex        =   59
         Top             =   795
         Width           =   2565
      End
      Begin VB.Label Label4 
         Caption         =   "Cliente"
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
         Left            =   210
         TabIndex        =   58
         Top             =   825
         Width           =   1140
      End
      Begin VB.Label Label26 
         Alignment       =   1  'Right Justify
         Caption         =   "Vuelto"
         Height          =   255
         Left            =   4350
         TabIndex        =   57
         Top             =   6660
         Width           =   915
      End
      Begin VB.Label Label25 
         Alignment       =   1  'Right Justify
         Caption         =   "A Pagar"
         Height          =   255
         Left            =   4350
         TabIndex        =   56
         Top             =   6360
         Width           =   915
      End
      Begin VB.Label Label24 
         Alignment       =   1  'Right Justify
         Caption         =   "A Cobrar"
         Height          =   255
         Left            =   4350
         TabIndex        =   55
         Top             =   6060
         Width           =   915
      End
      Begin VB.Label lblCotizacionDia 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   360
         Left            =   135
         TabIndex        =   54
         Top             =   6465
         Width           =   4050
      End
      Begin VB.Label Label22 
         Alignment       =   2  'Center
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
         Left            =   5355
         TabIndex        =   53
         Top             =   5775
         Width           =   1050
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
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
         Left            =   6495
         TabIndex        =   52
         Top             =   5745
         Width           =   945
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
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
         Left            =   7590
         TabIndex        =   51
         Top             =   5745
         Width           =   1080
      End
      Begin VB.Label Label13 
         Caption         =   "Licencia"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   3645
         TabIndex        =   50
         Top             =   5175
         Width           =   750
      End
      Begin VB.Label Label19 
         Caption         =   "Licenciatario"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   4500
         TabIndex        =   49
         Top             =   5175
         Width           =   1455
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
         Height          =   255
         Index           =   1
         Left            =   3060
         TabIndex        =   48
         Top             =   225
         Width           =   810
      End
      Begin VB.Label lblLabels 
         Caption         =   "Comprobante"
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
         Left            =   1740
         TabIndex        =   47
         Top             =   225
         Width           =   1170
      End
      Begin VB.Label lblLabels 
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
         Height          =   225
         Index           =   12
         Left            =   3945
         TabIndex        =   46
         Top             =   255
         Width           =   1050
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         Caption         =   "Talón"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   930
         TabIndex        =   45
         Top             =   240
         Width           =   780
      End
      Begin VB.Label lblLabels 
         Caption         =   "Cond. de Venta"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   2
         Left            =   135
         TabIndex        =   44
         Top             =   5160
         Width           =   1620
      End
      Begin VB.Label lblLabels 
         Caption         =   " IVA"
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
         Index           =   3
         Left            =   180
         TabIndex        =   43
         Top             =   240
         Width           =   690
      End
      Begin VB.Label Label9 
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
         Height          =   255
         Left            =   135
         TabIndex        =   42
         Top             =   5745
         Width           =   4230
      End
      Begin VB.Label Label10 
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
         Left            =   5280
         TabIndex        =   41
         Top             =   225
         Width           =   1785
      End
      Begin VB.Label Label11 
         Caption         =   "Puesto"
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
         Left            =   7065
         TabIndex        =   40
         Top             =   225
         Width           =   615
      End
      Begin VB.Label Label12 
         Caption         =   "Nro. Caja"
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
         Left            =   7710
         TabIndex        =   39
         Top             =   225
         Width           =   870
      End
      Begin VB.Label Label14 
         Caption         =   "Bultos"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   7905
         TabIndex        =   38
         Top             =   5190
         Width           =   615
      End
      Begin VB.Label Label15 
         Caption         =   "Pasajeros"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   7005
         TabIndex        =   37
         Top             =   5175
         Width           =   945
      End
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   9450
      _ExtentX        =   16669
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgVentaPasajes"
      HotImageList    =   "imgVentaPasajesResaltado"
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
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Comprobante deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Comprobante"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
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
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
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
      MouseIcon       =   "Frm_VentaPasajesGrande.frx":05BA
      Begin Crystal.CrystalReport CrystalReport1 
         Left            =   7620
         Top             =   45
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   262150
         WindowControlBox=   -1  'True
         WindowMaxButton =   -1  'True
         WindowMinButton =   -1  'True
      End
      Begin MSComctlLib.ImageList imgVentaPasajesResaltado 
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
               Picture         =   "Frm_VentaPasajesGrande.frx":071C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":0838
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":098C
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":0A9C
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":0B9E
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":0CF2
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":0DFE
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":147A
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":15E2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":1A36
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgVentaPasajes 
         Left            =   8400
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
               Picture         =   "Frm_VentaPasajesGrande.frx":1E8A
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":1FA2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":20F6
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":220E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":231A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":246E
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":2576
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":2BF2
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":2D52
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":31A6
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajesGrande.frx":35FA
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
End
Attribute VB_Name = "Frm_VentaPasajesGrande"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



 
Dim EstadoABM         As Byte
Dim objControl        As New CControl





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
                        Control.Value = False
                    Case Else
                        On Error Resume Next
                        Control.Text = ""
                        On Error GoTo 0
                    End Select
                 End If
            End If
        End If
    Next
    
    Me.lstItemsFactura.ListItems.Clear
    ObtenerCampo("vlTotalGeneral").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"
    ObtenerCampo("vlSaldoPesos").Text = "0,00"
    ObtenerCampo("vlTotalDolares").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"
    ObtenerCampo("vlSaldoDolares").Text = "0,00"
    ObtenerCampo("vlTotalEuros").Text = "0,00"
    ObtenerCampo("vlPagoEuros").Text = "0,00"
    ObtenerCampo("vlSaldoEuros").Text = "0,00"
    Me.Combox1(0).ListIndex = 0
    ObtenerCampo("nrPasajeros").Text = ""
    ObtenerCampo("nrBultos").Text = ""
    
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










Private Sub cmdAgregarItemFactura_Click()
Dim lvlPrecioViaje    As Single
Dim ListItemNuevo     As ListItem
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

    If Trim(ObtenerCampo("cdProducto").Text) = "" Then
        ObtenerCampo("cdProducto").BackColor = Rojo
        ObtenerCampo("cdProducto").SetFocus
        Exit Sub
    End If
    
    If Trim(ObtenerCampo("dsProducto").Text) = "" Then
        ObtenerCampo("dsProducto").BackColor = Rojo
        ObtenerCampo("dsProducto").SetFocus
        Exit Sub
    End If
    
    If IsNumeric(ObtenerCampo("vlPrecioViaje").Text) Then
        lvlPrecioViaje = CSng(ObtenerCampo("vlPrecioViaje").Text)
    Else
        ObtenerCampo("vlPrecioViaje").BackColor = Rojo
        ObtenerCampo("vlPrecioViaje").SetFocus
        Exit Sub
    End If
    
    If IsNumeric(ObtenerCampo("vlPorcentaje").Text) Then
        vlPorcentaje = CSng(ObtenerCampo("vlPorcentaje").Text)
    Else
        vlPorcentaje = 0
    End If
    

    Set ListItemNuevo = Me.lstItemsFactura.ListItems.Add(Me.lstItemsFactura.ListItems.Count + 1, , ObtenerCampo("cdProducto").Text)

    
    ListItemNuevo.SubItems(1) = ObtenerCampo("dsProducto").Text
    ListItemNuevo.SubItems(2) = ObtenerCampo("tpOperacion").Text
    ListItemNuevo.SubItems(3) = ObtenerCampo("vlPorcentaje").Text
    ListItemNuevo.SubItems(4) = ObtenerCampo("vlPrecioPeaje").Text
    ListItemNuevo.SubItems(5) = ObtenerCampo("vlPrecioViaje").Text
    
    Recalculo_operaciones
    CalcularSaldos "vlTotalPesos"
    
  
    HabilitarCampos "dsProducto", False
    HabilitarCampos "vlPorcentaje", False
    HabilitarCampos "vlPrecioViaje", False
    HabilitarCampos "vlPrecioPeaje", False
       
    ObtenerCampo("cdProducto").Text = ""
    ObtenerCampo("dsProducto").Text = ""
    ObtenerCampo("tpOperacion").Text = ""
    ObtenerCampo("vlPorcentaje").Text = ""
    ObtenerCampo("vlPrecioPeaje").Text = ""
    ObtenerCampo("vlPrecioViaje").Text = ""
    Me.cmdAgregarItemFactura.Enabled = False
    
    
    ObtenerCampo("cdCondVenta").SetFocus
    
    
End Sub




' ACA PROGRAMAR
Private Sub Recalculo_operaciones()
Dim i              As Integer
Dim vlTotalViajes  As Single
Dim vlPorcentaje   As Single
Dim primerDestino  As Boolean
Dim strDato        As String
Dim j              As Integer

    vlPorcentaje = 0
    vlTotalViajes = 0
    
    j = 1
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        If Me.lstItemsFactura.ListItems.Item(i).SubItems(2) = "Viaje" Then
            vlTotalViajes = vlTotalViajes + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(5))
            If j = 1 Then
                strDato = ReemplazarPalabra(Me.lstItemsFactura.ListItems.Item(i).SubItems(1), "  (" + CStr(j) + " DESTINO) ", "")
                Me.lstItemsFactura.ListItems.Item(i).SubItems(1) = strDato + "  (" + CStr(j) + " DESTINO) "
            Else
                strDato = ReemplazarPalabra(Me.lstItemsFactura.ListItems.Item(i).SubItems(1), "  (" + CStr(j) + " DESTINOS) ", "")
                Me.lstItemsFactura.ListItems.Item(i).SubItems(1) = strDato + "  (" + CStr(j) + " DESTINOS) "
            End If
            j = j + 1
        End If
    Next

    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
    
        Select Case Me.lstItemsFactura.ListItems.Item(i).SubItems(2)
        Case "Descuento %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(3))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(5) = _
             (-Abs((vlTotalViajes * vlPorcentaje) / 100))
        Case "Recargo %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(3))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(5) = _
             (vlTotalViajes * vlPorcentaje) / 100
        End Select
    Next
    
    calcularTotalesFactura
    

End Sub

Private Sub calcularTotalesFactura()
Dim i            As Integer
Dim vlTotalPesos As Single


    For i = 1 To Me.lstItemsFactura.ListItems.Count
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(5))
    Next
    
    ObtenerCampo("vlTotalDolares").Text = Round(FormatNumber(vlTotalPesos / CSng(objConfig.vlDiaDolar), 2))
    ObtenerCampo("vlTotalEuros").Text = Round(FormatNumber(vlTotalPesos / CSng(objConfig.vlDiaEuro), 2))
    ObtenerCampo("vlTotalGeneral").Text = FormatNumber(vlTotalPesos, "2")
    
    ObtenerCampo("vlPagoEuros").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"

    ObtenerCampo("vlSaldoEuros").Text = "0,00"
    ObtenerCampo("vlSaldoPesos").Text = "0,00"
    ObtenerCampo("vlSaldoDolares").Text = "0,00"
    
    Me.lblComision.Caption = "Comisión: $ " + FormatNumber(obtenerComision(vlTotalPesos), 2)
    
End Sub


Private Sub cmdCalcular_Click()

    ObtenerCampo("vlPagoEuros").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"

End Sub

Private Sub cmdFacturar_Click()

    If Trim(ObtenerCampo("nrLicencia").Text) = "" Then
        MsgBox "Debe completar la licencia que realizá el viaje", vbInformation, "Atención"
        ObtenerCampo("nrLicencia").SetFocus
        Exit Sub
    End If
    
    DoEvents
    ObtenerCampo("vlSaldoPesos").SetFocus
    DoEvents
    calculaPagodelCliente
    
    
    
    objParametros.GrabarValor "cdCondVenta", ObtenerCampo("cdCondVenta").Text
    
    Frm_VentaViajesTotales.Show 1
   
    If objParametros.ObtenerValor("Facturar") = "NO" Then Exit Sub
    
    ObtenerCampo("cdCondVenta").Text = objParametros.ObtenerValor("cdCondVenta")
    ObtenerCampo("vlPagoEuros").Text = objParametros.ObtenerValor("vlPagoEuros")
    ObtenerCampo("vlPagoDolares").Text = objParametros.ObtenerValor("vlPagoDolares")
    ObtenerCampo("vlPagoPesos").Text = objParametros.ObtenerValor("vlPagoPesos")
    
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Aceptar")
   
End Sub

Private Sub cmdNuevoViaje_Click()

    ObtenerCampo("cdProducto").Text = "(Nuevo)"
    ObtenerCampo("dsProducto").Text = ObtenerCampo("dsProductoBuscado").Text
    buscarPresentarProducto
    
End Sub

Private Sub Combox1_Click(Index As Integer)
Dim resp      As Byte
Dim strValor  As String

    Select Case Me.Combox1(Index).Tag
    Case "tpComision"
            Select Case ObtenerCampo("tpComision").Text
            Case "A Empleados"
                resp = MsgBox("Ha cambiado el tipo de comisión 'A Empleados', este cambio reduce la comisión de la cooperativa." + _
                       vbCrLf + "Confirma este cambio.", vbQuestion + vbYesNo, "Atención")
                If resp = vbNo Then
                    Me.Combox1(Index).ListIndex = 1
                End If
                Recalculo_operaciones
            Case "A Clientes"
                Recalculo_operaciones
            End Select
    Case "cdCondVenta"
       If ObtenerCampo("cdCondVenta").Text = "Retorno" Then
            ObtenerCampo("tpComision").Text = "Retorno"
            Me.lblComision.Caption = "Comisión: $ 0,00"
       End If
       If ObtenerCampo("cdCondVenta").Text = "Cuenta Corriente" Then
            ObtenerCampo("tpComprobante") = "X"
            ObtenerCampo("tpComision").Text = "A Clientes"
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Recibos", "IdRecibo", objConfig.nrPuesto)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda("1", 4)
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
       Else
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objConfig.nrPuesto)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", objConfig.nrPuesto)
            ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
            ObtenerCampo("tpComprobante") = "C"
       End If
    End Select
            
End Sub

Private Sub Combox1_GotFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                              Me.Combox1(Index), "GotFocus"
    
End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    Select Case KeyAscii
    Case vbKeyReturn, vbKeyRight
        Select Case Me.Combox1(Index).Tag
        Case "cdCondVenta"
            ObtenerCampo("tpComision").SetFocus
        Case "tpComision"
            ObtenerCampo("nrLicencia").SetFocus
        End Select
    Case vbKeyBack, vbKeyLeft
        Select Case Me.Combox1(Index).Tag
        Case "cdCondVenta"
            ObtenerCampo("dsProductoBuscado").SetFocus
        Case "tpComision"
            ObtenerCampo("cdCondVenta").SetFocus
        End Select
    Case Else
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                            Me.Combox1(Index), KeyAscii)
    End Select

End Sub

Private Sub Combox1_LostFocus(Index As Integer)
Dim resp As Byte

    objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                              Me.Combox1(Index), "LostFocus"

    
End Sub





Private Sub Command1_Click()

    ObtenerCampo("cdCliente").Text = "(Nuevo)"
    ObtenerCampo("nmNombre").SetFocus
    
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
        If tlb_ABM.Buttons("Agregar").Visible Or tlb_ABM.Buttons("Aceptar").Visible Then
            If EstadoABM = Consulta Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Agregar")
            Else
                ' tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
                cmdFacturar_Click
            End If
        End If
    Case vbKeyF5
        If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        End If
    Case vbKeyF12
        If tlb_ABM.Buttons("Salir").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
        End If
    Case vbKeyAdd
        If Me.cmdAgregarItemFactura.Enabled Then
            cmdAgregarItemFactura_Click
        End If
    End Select


End Sub

Private Sub Form_Load()

    objParametros.GrabarValor "Facturar", "NO"
    Select Case objParametros.ObtenerValor("Frm_VentaPasajesGrande.modo")
    Case "Facturar"
        EstadoABM = facturar
    Case Else
        EstadoABM = Consulta
    End Select
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    SelecionarItemCombo
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    
    
    
End Sub

Private Sub SelecionarItemCombo()
    Dim i As Integer
    
    For i = Combox1.LBound To Combox1.UBound
        If Combox1(i).ListCount > 0 Then
            Combox1(i).ListIndex = 0
        End If
    Next i
    
End Sub

Private Sub lstBusquedaProductos_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    If Me.lstBusquedaProductos.SortKey = ColumnHeader.Index - 1 Then
        If lstBusquedaProductos.SortOrder = lvwAscending And lstBusquedaProductos.Sorted Then
            lstBusquedaProductos.SortOrder = lvwDescending
        Else
            lstBusquedaProductos.SortOrder = lvwAscending
        End If
        lstBusquedaProductos.SortKey = ColumnHeader.Index - 1
    Else
       lstBusquedaProductos.SortOrder = lvwAscending
       lstBusquedaProductos.SortKey = ColumnHeader.Index - 1
    End If
    ' lstBusqueda.Refresh
    lstBusquedaProductos.Sorted = True
    
End Sub

Private Sub lstBusquedaProductos_DblClick()

    If Me.lstBusquedaProductos.ListItems.Count < 1 Then Exit Sub
    PasarItems
    

End Sub

Private Sub lstBusquedaProductos_KeyPress(KeyAscii As Integer)

    
    Select Case KeyAscii
    Case vbKeyReturn
        If Me.lstBusquedaProductos.ListItems.Count < 1 Then Exit Sub
        PasarItems
    Case vbKeyBack
        ObtenerCampo("dsProductoBuscado").SetFocus
    End Select
    
End Sub

Private Sub lstItemsFactura_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
    Case vbKeyDelete
        If Not Me.lstItemsFactura.ListItems.Count > 0 Then Exit Sub
        If Me.lstItemsFactura.SelectedItem.Checked = True Then
            Me.lstItemsFactura.ListItems.Remove (Me.lstItemsFactura.SelectedItem.Index)
            Recalculo_operaciones
        End If
    Case vbKeyBack
        ObtenerCampo("dsProductoBuscado").SetFocus
    End Select



End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
           PresentarPantalla Button
           ' buscar en la base de datos
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
    Case "Agregar"
           If Not EstadoABM = facturar Then
            EstadoABM = alta
           End If
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objConfig.nrPuesto)
           ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
           strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", objConfig.nrPuesto)
           ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
           ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("nrCaja")
           ObtenerCampo("nrPuesto").Text = objParametros.ObtenerValor("nrPuesto")
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           lblCotizacionDia.Caption = "Cotizaciones del Día: Euro " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("vlDiaEuro")), 2)) + " "
           lblCotizacionDia.Caption = lblCotizacionDia.Caption + " Dolar " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("vlDiaDolar")), 2))
           objProductos.CargarTodalaMatrizdeProductos Me.lstBusquedaProductos
           PresentarPantalla Button
           AvisarError "nrLicencia", False
           AvisarError "cdCliente", False
           AvisarError "nrPasajeros", False
           ObtenerCampo("tpComision").Text = "A Clientes"
           ObtenerCampo("cdCliente").Text = "1"
           ObtenerCampo("dsRazonSocial").Text = "Consumidor Final"
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                PresentarPantalla Button
           End If
    Case "Exportar"
           EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"

         If objParametros.ObtenerValor("Facturar") = "NO" Then Exit Sub
         DoEvents
         ObtenerCampo("vlSaldoPesos").SetFocus
         DoEvents
         
         If Not validarEntradadedatos() Then Exit Sub
         ' Verificar que el monto no sea negativo
         If Not FormadepagoOK() Then Exit Sub
         
         objbasededatos.Basededatos.BeginTrans
         
         If Not GrabarDatosdeProductos() Then
            objbasededatos.Basededatos.RollbackTrans
            Exit Sub
         End If
         
         If Guardarregistro(EstadoABM) Then
                GrabarItemsFactura
                GrabarTabladeCupones
                Select Case objUsuario.tpAcceso
                Case "Puestos"
                    Select Case ObtenerCampo("cdCondVenta").Text
                    Case "Contado"
                        ActualizarCaja
                    End Select
                End Select
                
                On Error Resume Next
                objbasededatos.Basededatos.CommitTrans
                If Err Then
                    MsgBox "Error: no se pudo insertar el registro, " _
                   + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                    objbasededatos.Basededatos.RollbackTrans
                    Exit Sub
                End If
                On Error GoTo 0
                ImprimirFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante"), ObtenerCampo("tpComprobante")
                If EstadoABM = facturar Then
                    limpiarControles
                    PresentarPantalla Button
                    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
                    EstadoABM = facturar
                Else
                    PresentarPantalla Button
                    EstadoABM = Consulta
                End If
           Else
                objbasededatos.Basededatos.RollbackTrans
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
           End If
    Case "Cancelar"
           If EstadoABM = facturar Then
              EstadoABM = facturar
              tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
           Else
              PresentarPantalla Button
              EstadoABM = Consulta
           End If
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

Private Function ConcatenarDestinos() As String
Dim i     As Integer
Dim strDato   As String

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        strDato = strDato + IIf(i <> 1, " - ", "") + _
        Me.lstItemsFactura.ListItems.Item(i).ListSubItems(1).Text
    Next

    ConcatenarDestinos = Mid(strDato, 1, 100)

End Function

         

Private Function FormadepagoOK() As Boolean

    FormadepagoOK = True
         
End Function


Private Function validarEntradadedatos() As Boolean
    
    validarEntradadedatos = True

    If ObtenerValoresNumericos("vlPagoEuros") + ObtenerValoresNumericos("vlPagoDolares") + ObtenerValoresNumericos("vlPagoPesos") <= 0 Then
        MsgBox "Debe ingresar los valores de pago.", vbCritical + vbDefaultButton1, "Atención"
        AvisarError "vlPagoPesos", True
        validarEntradadedatos = False
    End If
    
    
    If Trim(ObtenerCampo("cdCliente").Text) = "" Then
        MsgBox "Debe ingresar un 'Cliente'", vbCritical + vbDefaultButton1, "Atención"
        AvisarError "cdCliente", True
        validarEntradadedatos = False
    End If
    
    If Trim(ObtenerCampo("nrLicencia").Text) = "" Or Trim(ObtenerCampo("nmLicenciatario").Text) = "" Then
        MsgBox "Debe Ingresar una 'Licencia'", vbCritical, "Atención"
        AvisarError "nrLicencia", True
        validarEntradadedatos = False
    End If
    
    
End Function

Private Function GrabarDatosdelCliente() As Boolean
Dim strValor As String

    GrabarDatosdelCliente = True
    If ObtenerCampo("dsRazonSocial").Text <> "" Then
        
        ObjTablasIO.nmTabla = "TB_Clientes"
        ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", ObtenerCampo("dsRazonSocial").Text
        ObjTablasIO.setearCampoOperadorValor "nrDoc", "<-", ObtenerCampo("nrDoc").Text
        ObjTablasIO.setearCampoOperadorValor "dsEmail", "<-", ObtenerCampo("dsEmail").Text
      
        If UCase(ObtenerCampo("cdCliente").Text) = UCase("(Nuevo)") Then
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Clientes", "cdCliente", objConfig.nrPuesto)
            ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", strValor
            ObjTablasIO.Insertar
            objDiccionariodeDatos.GuardarSiguienteValor "TB_Clientes", "cdCliente", objConfig.nrPuesto
            ObtenerCampo("cdCliente").Text = strValor
        Else
            ObjTablasIO.setearCampoOperadorValor "cdCliente", _
                "=", ObtenerCampo("cdCliente").Text
            ObjTablasIO.Actualizar
        End If
        
    Else
        
        MsgBox "Debe Ingresar una 'Razon Social' o un 'Apellido, Nombre'", vbCritical + vbDefaultButton1, "Atención"
        If ObtenerCampo("dsRazonSocial").Locked Then
            AvisarError "dsRazonSocial", True
        Else
            AvisarError "cdCliente", True
        End If
        GrabarDatosdelCliente = False
    End If
    
End Function



Private Sub GrabarItemsFactura()
Dim i     As Integer

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        
        ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "<-", ObtenerCampo("tpComprobante").Text
        
        ObjTablasIO.setearCampoOperadorValor "nrItem", "<-", CStr(i)
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", Me.lstItemsFactura.ListItems(i).Text
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(1)
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(2)
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(4)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(5)
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Date)
               
        ObjTablasIO.Insertar
        
    Next

End Sub


Private Function GrabarTabladeCupones() As Boolean
Dim i             As Integer
Dim strValor      As String
Dim cdCodBar      As String
Dim vlComision    As Single
        
        GrabarTabladeCupones = False
        
        ' obtener la comision
        vlComision = obtenerComision(CSng(ObtenerCampo("vlTotalGeneral").Text))
        
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "<-", ObtenerCampo("tpComprobante").Text
        
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", ObtenerCampo("cdCliente").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", objConfig.nrPuesto
        ObjTablasIO.setearCampoOperadorValor "nrLicencia", "<-", ObtenerCampo("nrLicencia").Text
        ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "<-", ObtenerCampo("nmLicenciatario").Text
        ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "<-", ObtenerCampo("vlTotalGeneral").Text
        
        ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "<-", ObtenerCampo("vlPagoPesos").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "<-", ObtenerCampo("vlPagoDolares").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "<-", ObtenerCampo("vlPagoEuros").Text
        
        ObjTablasIO.setearCampoOperadorValor "nrCantidadBultos", "<-", ObtenerCampo("nrBultos").Text
        ObjTablasIO.setearCampoOperadorValor "tpCupon", "<-", ObtenerCampo("cdCondVenta").Text
        
              
        Select Case ObtenerCampo("cdCondVenta").Text
        Case "Contado"
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "dtCobradoalCliente", "<-", CStr(Now)
            ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlaFavordelLicenciatario", _
                        "<-", CSng(ObtenerCampo("vlTotalGeneral").Text) - vlComision
            ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlComision", "<-", CStr(vlComision)
        Case "Cuenta Corriente"
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlaFavordelLicenciatario", _
                        "<-", CSng(ObtenerCampo("vlTotalGeneral").Text) - vlComision
            ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlComision", "<-", CStr(vlComision)
        Case "Cobro en Destino", "Retorno"
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlaFavordelLicenciatario", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "<-", CStr(vlComision)
            ObjTablasIO.setearCampoOperadorValor "vlComision", "<-", CStr(vlComision)
        End Select
        
        
        ObjTablasIO.setearCampoOperadorValor "dtCajaCliente", "<-", CStr(Date)
        ObjTablasIO.setearCampoOperadorValor "nrCajaCliente", "<-", ObtenerCampo("nrCaja").Text
        ObjTablasIO.setearCampoOperadorValor "dtCupon", "<-", CStr(Now)
        ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", ObtenerCampo("dsUsuario").Text
        ObjTablasIO.setearCampoOperadorValor "nrPasajeros", "<-", ObtenerCampo("nrPasajeros").Text
        
        cdCodBar = AgregarCaracteresAIzq(ObtenerCampo("nrTalonario").Text, 3, "0")
        cdCodBar = cdCodBar + AgregarCaracteresAIzq(ObtenerCampo("nrComprobante").Text, 8, "0")
        cdCodBar = cdCodBar + AgregarCaracteresAIzq(ObtenerCampo("nrLicencia").Text, 3, "0")
    
        ObjTablasIO.setearCampoOperadorValor "cdCodBar", "<-", cdCodBar
        

        strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cupones", "nrCupon", objConfig.nrPuesto)
        ObjTablasIO.setearCampoOperadorValor "nrCupon", "<-", strValor
        ObjTablasIO.Insertar
        objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCupon", objConfig.nrPuesto
    

        GrabarTabladeCupones = True

End Function


Private Function obtenerComision(pvlTotalGeneral As Single) As Single

    ObjTablasIO.nmTabla = "TB_Comisiones"
    ObjTablasIO.setearCampoOperadorValor "vlMontoMinimo", "<=", CStr(pvlTotalGeneral), " AND "
    ObjTablasIO.setearCampoOperadorValor "vlMontoMaximo", ">=", CStr(pvlTotalGeneral)
    ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlComisionEmpleados", "->", ""
    ObjTablasIO.Seleccionar
    
    If Not ObjTablasIO.rs_resultados.EOF Then
        Select Case ObtenerCampo("tpComision").Text
        Case "A Empleados"
            obtenerComision = ObjTablasIO.rs_resultados("vlComisionEmpleados").Value
        Case "A Clientes"
            obtenerComision = ObjTablasIO.rs_resultados("vlComision").Value
        Case Else
            obtenerComision = 0
        End Select
    Else
        obtenerComision = 0
    End If
    
    
End Function



Private Function AgregarCaracteresAIzq(pDato As String, _
CantCar As Integer, Caracter As String) As String
Dim nrTamanio        As Integer
Dim nI               As Integer

    AgregarCaracteresAIzq = pDato
    nrTamanio = Len(pDato)
    For nI = nrTamanio To CantCar - 1
     AgregarCaracteresAIzq = Caracter + AgregarCaracteresAIzq
    Next
    

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
            vlSaldoFinalPesos = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalPesos").Value, "0")
            vlSaldoFinalDolares = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalDolares").Value, "0")
            vlSaldoFinalEuros = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalEuros").Value, "0")
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


Private Function GrabarDatosdeProductos() As Boolean
Dim strValor   As String
Dim i          As Integer
Dim bHayItems As Boolean

    GrabarDatosdeProductos = True
    bHayItems = False
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        If UCase(Me.lstItemsFactura.ListItems(i).Text) = UCase("(Nuevo)") Then
            ObjTablasIO.nmTabla = "TB_Productos"
            ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).SubItems(1)
            ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).SubItems(2)
            ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(4)
            ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(5)
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Productos", "cdProducto", objConfig.nrPuesto)
            ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", strValor
            ObjTablasIO.Insertar
            
            objProductos.InsertarNuevoItemEnlaMatrizProductos _
                strValor, _
                Me.lstItemsFactura.ListItems(i).SubItems(1), _
                Me.lstItemsFactura.ListItems(i).SubItems(4), _
                Me.lstItemsFactura.ListItems(i).SubItems(5), _
                "0,00", _
                Me.lstItemsFactura.ListItems(i).SubItems(2)

            
            objDiccionariodeDatos.GuardarSiguienteValor "TB_Productos", "cdProducto", objConfig.nrPuesto
            Me.lstItemsFactura.ListItems(i).Text = strValor
            
            
        End If
        bHayItems = True
    Next i
    
    If Not bHayItems Then
        MsgBox "Debe ingresar el destino", vbInformation, "Atención"
        AvisarError "cdProducto", True
        GrabarDatosdeProductos = False
    End If
         
           
End Function



Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbCritical + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Comprobantes"
        ObjTablasIO.setearCampoOperadorValor "cdComprobante", "=", ObtenerCampo("cdComprobante").Text
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control      As Control
Dim strtag       As String
Dim strPrefijo   As String
Dim cdCodBarLic  As String
Dim cdCodBarAFIP As String
Dim strValor     As String

    ObjTablasIO.nmTabla = "TB_Comprobantes"
    For Each Control In Me.txtFields
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

    For Each Control In Me.Combox1
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
            
            
    cdCodBarAFIP = ObtenerCodBarrasAFIP()
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional3", "<-", cdCodBarAFIP
    
    cdCodBarLic = AgregarCaracteresAIzq(ObtenerCampo("nrTalonario").Text, 3, "0")
    cdCodBarLic = cdCodBarLic + AgregarCaracteresAIzq(ObtenerCampo("nrComprobante").Text, 8, "0")
    cdCodBarLic = cdCodBarLic + AgregarCaracteresAIzq(ObtenerCampo("nrLicencia").Text, 3, "0")
    
    ObjTablasIO.setearCampoOperadorValor _
              "cdCodBar", "<-", cdCodBarLic
    
    ObjTablasIO.setearCampoOperadorValor _
              "dtCaja", "<-", CStr(Now)
    ObjTablasIO.setearCampoOperadorValor _
              "dtInsercion", "<-", CStr(Now)
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional1", "<-", CStr(Format(Now, "HH:MM"))
              

              
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "nrCAI", objConfig.nrPuesto)
    ObjTablasIO.setearCampoOperadorValor _
    "nrCAI", "<-", strValor
    
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "dtVencimiento", objConfig.nrPuesto)
    ObjTablasIO.setearCampoOperadorValor _
    "dtVencimiento", "<-", strValor
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaDolar", "<-", objParametros.ObtenerValor("vlDiaDolar")
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaEuro", "<-", objParametros.ObtenerValor("vlDiaEuro")
              
    
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional2", "<-", ConcatenarDestinos()
              
    
    ObjTablasIO.setearCampoOperadorValor _
              "tpLetra", "<-", ObtenerCampo("tpComprobante").Text
              
    
    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "cdComprobante", _
            "=", ObtenerCampo("cdComprobante").Text
            If Not ObjTablasIO.Actualizar() Then
                Guardarregistro = False
            Else
                Guardarregistro = True
            End If
    Case alta, facturar
            If Not ObjTablasIO.Insertar Then
                Guardarregistro = False
            Else
                If ObtenerCampo("tpComprobante").Text = "X" Then
                    objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", objConfig.nrPuesto
                Else
                    objDiccionariodeDatos.GuardarSiguienteValor "TB_Comprobantes", "nrComprobante", objConfig.nrPuesto
                End If
                Guardarregistro = True
            End If
    End Select

End Function


Public Function ObtenerCodBarrasAFIP() As String
' - C.U.I.T. (Clave Unica de Identificación Tributaria) del emisor (11 caracteres).
' - Código de tipo de comprobante (2 caracteres).
' - Punto de venta (4 caracteres).
' - Código de Autorización de Impresión (14 caracteres).
' - Fecha de vencimiento (8 caracteres).
' - Dígito verificador (1 carácter).
Dim strCodAFIP   As String
Dim objAFIP      As New CAFIP

    strCodAFIP = objConfig.nrCUIT
    strCodAFIP = strCodAFIP + objAFIP.obtenerTipodeComprobante()
    strCodAFIP = strCodAFIP + AgregarCaracteresAIzq(ObtenerCampo("nrTalonario").Text, 3, "0")
    strCodAFIP = strCodAFIP + objDiccionariodeDatos.ObtenerValorActual _
                ("TB_Comprobantes", "nrCAI", objConfig.nrPuesto)
    
    strCodAFIP = strCodAFIP + Format(objDiccionariodeDatos.ObtenerValorActual _
                ("TB_Comprobantes", "dtVencimiento", objConfig.nrPuesto), "DDMMYYYY")
                
   ObtenerCodBarrasAFIP = strCodAFIP

End Function



Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraVentaPasajes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
    
    Case "Agregar"
           Me.fraVentaPasajes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           On Error Resume Next
           ObtenerCampo("dsProductoBuscado").SetFocus
           On Error GoTo 0
    Case "Eliminar"
           Me.fraVentaPasajes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraVentaPasajes.Visible = False
    Case "Aceptar"
           If EstadoABM = facturar Then
                Me.fraVentaPasajes.Visible = True
                Me.tlb_ABM.Buttons("Buscar").Visible = False
                Me.tlb_ABM.Buttons("Seleccionar").Visible = False
                Me.tlb_ABM.Buttons("Agregar").Visible = False
                Me.tlb_ABM.Buttons("Exportar").Visible = False
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = True
                Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Else
                Me.fraVentaPasajes.Visible = False
                Me.tlb_ABM.Buttons("Buscar").Visible = True
                Me.tlb_ABM.Buttons("Seleccionar").Visible = True
                Me.tlb_ABM.Buttons("Agregar").Visible = True
                Me.tlb_ABM.Buttons("Exportar").Visible = True
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = False
                Me.tlb_ABM.Buttons("Cancelar").Visible = False
          End If
    Case "Cancelar"
        If EstadoABM = facturar Then
           Me.fraVentaPasajes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           ObtenerCampo("cdCliente").SetFocus
        Else
           Me.fraVentaPasajes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
        End If
    End Select

End Sub




Private Sub txtFields_Change(Index As Integer)

    Select Case txtFields(Index).Tag
    Case "cdCliente"
        If txtFields(Index).Text = "" Then
            ObtenerCampo("cdCliente").BackColor = Blanco
            ObtenerCampo("dsRazonSocial").Text = ""
            ObtenerCampo("nrDoc").Text = ""
            ObtenerCampo("dsEmail").Text = ""
        End If
    Case "nrLicencia"
        AvisarError "nrLicencia", False
        ObtenerCampo("nrLicencia").BackColor = Blanco
        ObtenerCampo("nmLicenciatario").Text = ""
    Case "vlTotalGeneral", "vlPagoEuros", "vlPagoDolares"
        ' calcularSaldo
    Case "vlPagoPesos"
        AvisarError "vlPagoPesos", False
    Case "nrPasajeros"
        AvisarError "nrPasajeros", False
    End Select

End Sub


Private Sub calculaPagodelCliente()
Dim vlTotalEuros        As Single
Dim vlTotalDolares      As Single
Dim vlTotalGeneral      As Single
Dim vlPagoEuros         As Single
Dim vlPagoDolares       As Single
Dim vlPagoPesos         As Single
Dim vlSaldoPesos        As Single
Dim vlSaldoEuros        As Single
Dim vlSaldoDolares      As Single
    
    vlTotalEuros = ObtenerValoresNumericos("vlTotalEuros")
    vlTotalDolares = ObtenerValoresNumericos("vlTotalDolares")
    vlTotalGeneral = ObtenerValoresNumericos("vlTotalGeneral")
    
    vlPagoEuros = ObtenerValoresNumericos("vlPagoEuros")
    vlPagoDolares = ObtenerValoresNumericos("vlPagoDolares")
    vlPagoPesos = ObtenerValoresNumericos("vlPagoPesos")
    
    vlSaldoPesos = ObtenerValoresNumericos("vlSaldoPesos")
    vlSaldoEuros = ObtenerValoresNumericos("vlSaldoEuros")
    vlSaldoDolares = ObtenerValoresNumericos("vlSaldoDolares")
    
    objParametros.GrabarValor "vlPagoEuros", "0,00"
    objParametros.GrabarValor "vlPagoDolares", "0,00"
    objParametros.GrabarValor "vlPagoPesos", "0,00"
            
    If vlPagoEuros >= vlTotalEuros Then
        ObtenerCampo("vlPagoDolares").Text = "0,00"
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        objParametros.GrabarValor "vlPagoEuros", CStr(vlTotalEuros)
        objParametros.GrabarValor "vlPagoDolares", "0,00"
        objParametros.GrabarValor "vlPagoPesos", "0,00"
        Exit Sub
    ElseIf vlPagoDolares >= vlTotalDolares Then
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            objParametros.GrabarValor "vlPagoEuros", "0,00"
            objParametros.GrabarValor "vlPagoDolares", CStr(vlTotalDolares)
            objParametros.GrabarValor "vlPagoPesos", "0,00"
            Exit Sub
        ElseIf vlPagoPesos >= vlTotalGeneral Then
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            objParametros.GrabarValor "vlPagoEuros", "0,00"
            objParametros.GrabarValor "vlPagoDolares", "0,00"
            objParametros.GrabarValor "vlPagoPesos", CStr(vlTotalGeneral)
            Exit Sub
    End If
    
    Dim FaltanteAcum As Single
    objParametros.GrabarValor "vlPagoEuros", CStr(vlPagoEuros)
    
    FaltanteAcum = vlTotalGeneral - (vlPagoEuros * objConfig.vlDiaEuro)
    If vlPagoDolares * objConfig.vlDiaDolar >= FaltanteAcum Then
        objParametros.GrabarValor "vlPagoDolares", CStr(Round(FaltanteAcum / objConfig.vlDiaDolar))
        objParametros.GrabarValor "vlPagoPesos", "0,00"
    Else
        FaltanteAcum = FaltanteAcum - (vlPagoDolares * objConfig.vlDiaDolar)
        objParametros.GrabarValor "vlPagoDolares", CStr(vlPagoDolares)
        objParametros.GrabarValor "vlPagoPesos", CStr(FaltanteAcum)
    End If
    

End Sub




Private Sub CalcularSaldos(pTag As String)
Dim vlaCobrarEuros   As Single
Dim vlaCobrarDolares As Single
Dim vlaCobrarPesos   As Single
Dim vlaPagarEuros    As Single
Dim vlaPagarDolares  As Single
Dim vlaPagarPesos    As Single
Dim vlaVueltoEuros   As Single
Dim vlaVueltoDolares As Single
Dim vlaVueltoPesos   As Single
Dim TotalaPagar      As Single


    Select Case pTag
    Case "vlPagoEuros", "vlPagoDolares"
         ObtenerCampo("vlPagoPesos").Text = "0,00"
    End Select
    
    vlaCobrarEuros = ObtenerPesos("vlTotalEuros")
    vlaCobrarDolares = ObtenerPesos("vlTotalDolares")
    vlaCobrarPesos = ObtenerPesos("vlTotalGeneral")
    
    vlaPagarEuros = ObtenerPesos("vlPagoEuros")
    vlaPagarDolares = ObtenerPesos("vlPagoDolares")
    vlaPagarPesos = ObtenerPesos("vlPagoPesos")
    
    vlaVueltoEuros = ObtenerPesos("vlSaldoEuros")
    vlaVueltoDolares = ObtenerPesos("vlSaldoDolares")
    vlaVueltoPesos = ObtenerPesos("vlSaldoPesos")
    
    
    TotalaPagar = vlaPagarEuros + vlaPagarDolares + vlaPagarPesos
    
    If TotalaPagar >= vlaCobrarPesos Then
        vlaVueltoPesos = TotalaPagar - vlaCobrarPesos
        ObtenerCampo("vlSaldoPesos").Text = FormatNumber(vlaVueltoPesos, 2)
        ObtenerCampo("vlSaldoEuros").Text = FormatNumber(Round(ObtenerEuros("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoDolares").Text = FormatNumber(Round(ObtenerDolares("vlSaldoPesos"), 0), 2)
    Else
        vlaPagarPesos = vlaCobrarPesos - TotalaPagar + vlaPagarPesos
        vlaVueltoPesos = 0
        ObtenerCampo("vlPagoPesos").Text = FormatNumber(vlaPagarPesos, 2)
        ObtenerCampo("vlSaldoPesos").Text = FormatNumber(vlaVueltoPesos, 2)
        ObtenerCampo("vlSaldoEuros").Text = FormatNumber(Round(ObtenerEuros("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoDolares").Text = FormatNumber(Round(ObtenerDolares("vlSaldoPesos"), 0), 2)
    End If
    
    
End Sub




Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = CSng(objParametros.ObtenerValor("vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("vlDiaDolar"))

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlPagoEuros", "vlTotalEuros", "vlSaldoEuros"
            ObtenerPesos = ObtenerValoresNumericos(pTag) * vlDiaEuro
        Case "vlPagoDolares", "vlTotalDolares", "vlSaldoDolares"
            ObtenerPesos = ObtenerValoresNumericos(pTag) * vlDiaDolar
        Case Else
            ObtenerPesos = ObtenerValoresNumericos(pTag)
        End Select
    End If
    
End Function


Private Function ObtenerDolares(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = CSng(objParametros.ObtenerValor("vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("vlDiaDolar"))

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerDolares = 0
    Else
        Select Case pTag
        Case "vlPagoEuros", "vlTotalEuros"
            ObtenerDolares = (ObtenerValoresNumericos(pTag) * vlDiaEuro) / vlDiaDolar
        Case "vlPagoPesos", "vlTotalPesos", "vlSaldoPesos"
            ObtenerDolares = ObtenerValoresNumericos(pTag) / vlDiaDolar
        Case Else
            ObtenerDolares = ObtenerValoresNumericos(pTag)
        End Select
    End If
    
End Function


Private Function ObtenerEuros(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = CSng(objParametros.ObtenerValor("vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("vlDiaDolar"))

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerEuros = 0
    Else
        Select Case pTag
        Case "vlPagoDolares", "vlTotalDolares"
            ObtenerEuros = (ObtenerValoresNumericos(pTag) * vlDiaDolar) / vlDiaEuro
        Case "vlPagoPesos", "vlTotalPesos", "vlSaldoPesos"
            ObtenerEuros = ObtenerValoresNumericos(pTag) / vlDiaEuro
        Case Else
            ObtenerEuros = ObtenerValoresNumericos(pTag)
        End Select
    End If
    
End Function
Private Function ObtenerValoresNumericos(pTag As String) As Single

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
End Function




Private Sub txtFields_GotFocus(Index As Integer)

    
    DoEvents
    
    If Me.txtFields(Index).Tag <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                      Me.txtFields(Index), "GotFocus"
    End If
    
End Sub

Private Sub txtFields_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
Dim Control As Control
Dim Valor   As Variant

    Select Case KeyCode
    Case vbKeyF1
        Select Case UCase(txtFields(Index).Tag)
        Case UCase("cdCliente")
            ObtenerCampo("cdCliente").Text = ""
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Clientes"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "cdCliente"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("cdCliente").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarcampocliente
            Case UCase("nrLicencia")
                ObtenerCampo("nrLicencia").Text = "(Borrar)"
                objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
                objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
                objParametros.GrabarValor "vlCampoClaveBusqueda", ""
                Frm_Busquedas.Show 1
                ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
                If Trim(ObtenerCampo("nrLicencia").Text) = "(Nuevo)" Then
                    ObtenerCampo("nrLicencia").Text = ""
                Else
                    buscarlicencia
                End If
        End Select
    End Select

End Sub

Private Sub buscarcampocliente()
Dim Control As Control
Dim Valor   As Variant
Dim i       As Integer


         If Not ObtenerCampo("cdCliente").Text = "(Nuevo)" Then
                ObjTablasIO.nmTabla = "TB_Clientes"
                ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdCliente").Text
                ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrTel", "->", ""
                ObjTablasIO.setearCampoOperadorValor "cdPostal", "->", ""
                
                If Not ObjTablasIO.Seleccionar Then
                    MsgBox "El cliente no existe, por favor ingrese un nuevo valor.", vbInformation + vbDefaultButton1, "Atención"
                    Exit Sub
                End If
                
                If Not ObjTablasIO.rs_resultados.EOF Then
                    For Each Control In Me.Controls
                        If Not IsMissing(Control.Tag) Then
                            If Not Control.Tag = "" Then
                                    If Control.Tag <> "cdCliente" Then
                                        For i = 0 To ObjTablasIO.rs_resultados.Fields.Count - 1
                                            If Control.Tag = ObjTablasIO.rs_resultados.Fields(i).Name Then
                                                Valor = objDiccionariodeDatos.FormatearCampoValor _
                                                        ("TB_Clientes", Control.Tag, _
                                                        CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                                                Control.Text = Valor
                                            End If
                                        Next i
                                    End If
                                End If
                            End If
                    Next
                    HabilitarCampos "dsRazonSocial", True
                    HabilitarCampos "nrDoc", True
                    HabilitarCampos "dsEmail", True
                    ObtenerCampo("cdCliente").BackColor = Blanco
                Else
                    HabilitarCampos "dsRazonSocial", True
                    HabilitarCampos "nrDoc", True
                    HabilitarCampos "dsEmail", True
                    ObtenerCampo("cdCliente").BackColor = Rojo
                    ObtenerCampo("cdCliente").SetFocus
                End If
            Else
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("cdCliente").BackColor = Blanco
                ObtenerCampo("dsRazonSocial").SetFocus
                
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

Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)


    
    Select Case KeyAscii
    Case vbKeyReturn, vbKeyRight, vbKeyDown
        Select Case Me.txtFields(Index).Tag
        Case "cdCliente"
            ObtenerCampo("dsRazonSocial").SetFocus
        Case "dsRazonSocial"
            ObtenerCampo("nrDoc").SetFocus
        Case "nrDoc"
            ObtenerCampo("dsEmail").SetFocus
        Case "dsEmail"
            ObtenerCampo("dsProductoBuscado").SetFocus
        Case "nrLicencia"
            If Trim(ObtenerCampo("nrLicencia").Text) = "" Then
                    AvisarError "nrLicencia", True
            Else
                If buscarlicencia() Then
                    ObtenerCampo("nrPasajeros").SetFocus
                Else
                    AvisarError "nrLicencia", True
                End If
            End If
        Case "nrPasajeros"
            ObtenerCampo("nrBultos").SetFocus
        Case "nrBultos"
            ObtenerCampo("vlPagoEuros").SetFocus
        Case "vlPagoEuros"
            ObtenerCampo("vlPagoDolares").SetFocus
        Case "vlPagoDolares"
            ObtenerCampo("vlPagoPesos").SetFocus
        Case "vlPagoPesos"
            cmdFacturar_Click
        End Select
    Case vbKeyBack, vbKeyLeft, vbKeyUp
        If Me.txtFields(Index).Text <> "" Then Exit Sub
        Select Case Me.txtFields(Index).Tag
        Case "cdCliente"
            ObtenerCampo("dsRazonSocial").SetFocus
        Case "nrDoc"
            ObtenerCampo("dsRazonSocial").SetFocus
        Case "dsEmail"
            ObtenerCampo("nrDoc").SetFocus
        Case "dsProductoBuscado"
            ObtenerCampo("dsEmail").SetFocus
        Case "nrLicencia"
            ObtenerCampo("tpComision").SetFocus
        Case "nrPasajeros"
            ObtenerCampo("nrLicencia").SetFocus
        Case "nrBultos"
            ObtenerCampo("nrPasajeros").SetFocus
        Case "dsLeyenda"
            ObtenerCampo("nrBultos").SetFocus
        Case "vlPagoEuros"
            ObtenerCampo("dsLeyenda").SetFocus
        Case "vlPagoDolares"
            ObtenerCampo("vlPagoEuros").SetFocus
        Case "vlPagoPesos"
            ObtenerCampo("vlPagoDolares").SetFocus
        End Select
    
    Case Else
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                            Me.txtFields(Index), KeyAscii)

    End Select
    
End Sub

Private Sub txtFields_LostFocus(Index As Integer)


    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                  Me.txtFields(Index), "LostFocus"
        ' Validar entrada del licenciatario
        Select Case Me.txtFields(Index).Tag
        Case "nrLicencia"
            Select Case ObtenerCampo("nrLicencia").Text
            Case ""
                AvisarError "nrLicencia", True
            Case "(Borrar)"
            Case Else
                buscarlicencia
            End Select
        Case "cdCliente"
            If Not ObtenerCampo("cdCliente").Text = "" Then
                buscarcampocliente
            End If
        Case "vlTotalGeneral", "vlPagoEuros", "vlPagoDolares", "vlPagoPesos"
            CalcularSaldos Me.txtFields(Index).Tag
        End Select
        
    End If
    
End Sub

Private Function buscarlicencia() As Boolean
Dim strNombreCompleto As String

    ObjTablasIO.nmTabla = "TB_Proveedores"
    ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
    ObjTablasIO.setearCampoOperadorValor _
    "nrLicencia", "=", ObtenerCampo("nrLicencia").Text
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").Value), "", ObjTablasIO.rs_resultados("nmApellido").Value) + " "
        strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").Value), "", ObjTablasIO.rs_resultados("nmNombre").Value)
        ObtenerCampo("nmLicenciatario").Text = strNombreCompleto
        buscarlicencia = True
    Else
        ObtenerCampo("nrLicencia").BackColor = Rojo
        ObtenerCampo("nrLicencia").SetFocus
        buscarlicencia = False
    End If
         
End Function
            
Private Sub buscarPresentarProducto()
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single


    If Not ObtenerCampo("cdProducto").Text = "(Nuevo)" Then
               Select Case ObtenerCampo("tpOperacion").Text
                Case "Recargo %"
                     HabilitarCampos "dsProducto", False
                     HabilitarCampos "vlPrecioViaje", False
                     HabilitarCampos "vlPorcentaje", False
                     ObtenerCampo("vlPrecioViaje").Text = CStr(vlPrecioViaje)
                     cmdAgregarItemFactura_Click
                Case "Descuento %"
                     HabilitarCampos "dsProducto", False
                     HabilitarCampos "vlPrecioViaje", False
                     HabilitarCampos "vlPorcentaje", False
                     cmdAgregarItemFactura_Click
                Case "Recargo Valor"
                     HabilitarCampos "vlPrecioViaje", True
                     HabilitarCampos "vlPorcentaje", False
                     ObtenerCampo("vlPrecioViaje").Text = Abs(CSng(ObtenerValoresNumericos("vlPrecioViaje")))
                     ObtenerCampo("vlPrecioViaje").SetFocus
                     Me.cmdAgregarItemFactura.Enabled = True
                Case "Descuento Valor"
                     HabilitarCampos "vlPrecioViaje", True
                     HabilitarCampos "vlPorcentaje", False
                     ObtenerCampo("vlPrecioViaje").Text = -Abs(CSng(ObtenerValoresNumericos("vlPrecioViaje")))
                     ObtenerCampo("vlPrecioViaje").SetFocus
                     Me.cmdAgregarItemFactura.Enabled = True
                Case "Viaje"
                     cmdAgregarItemFactura_Click
                End Select
    Else
        Me.cmdAgregarItemFactura.Enabled = True
        ObtenerCampo("tpOperacion").Text = "Viaje"
        ObtenerCampo("vlPorcentaje").Text = "0,00"
        ObtenerCampo("vlPrecioPeaje").Text = "0,00"
        ObtenerCampo("vlPrecioViaje").Text = "0,00"
        HabilitarCampos "dsProducto", True
        HabilitarCampos "vlPrecioPeaje", True
        HabilitarCampos "vlPrecioViaje", True
        ' HabilitarCampos "vlPorcentaje", True
        Me.cmdAgregarItemFactura.Enabled = True
        ObtenerCampo("dsProducto").SetFocus
    End If
    
             
End Sub
                    
                    
            
Private Sub txtItemFactura_Change(Index As Integer)

    Select Case txtItemFactura(Index).Tag
    Case "dsProducto"
       '   BuscarListviewSinOrden txtItemFactura(Index).Text, 1
    End Select
    
    
End Sub

'*******************************************************
Public Sub BuscarListviewSinOrden _
     (strDato As String, _
      nColumna As Integer)
  Dim nI                    As Integer
  Dim nPos                  As Long
  Dim strAux                As String
  Dim nTamanioDato          As Integer
  Dim Salir                 As Boolean
  Dim Item                  As ListItem
  Dim i                     As Integer
  
            
     nTamanioDato = Len(strDato)
     nI = 1
     Salir = False
     
     Do Until Salir Or (nI > Me.lstBusquedaProductos.ListItems.Count)
        strAux = Left(lstBusquedaProductos.ListItems(nI).SubItems(nColumna), nTamanioDato)
        nPos = InStr(1, strAux, strDato, vbTextCompare)
        If nPos > 0 Then
             
            lstBusquedaProductos.ListItems(nI).Bold = True
            ' lstBusquedaProductos.ListItems(nI).ForeColor = vbRed
            lstBusquedaProductos.ListItems(nI).EnsureVisible
            lstBusquedaProductos.ListItems(nI).Selected = True
            For i = 1 To lstBusquedaProductos.ListItems(nI).ListSubItems.Count
                ' lstBusquedaProductos.ListItems(nI).ListSubItems(i).ForeColor = vbRed
                lstBusquedaProductos.ListItems(nI).ListSubItems(i).Bold = True
    
            Next
            Set lstBusquedaProductos.SelectedItem = lstBusquedaProductos.ListItems(nI)
            lstBusquedaProductos.SelectedItem.Top = 1
            lstBusquedaProductos.SelectedItem.Left = 1
            lstBusquedaProductos.GetFirstVisible
            lstBusquedaProductos.Refresh
            Exit Do
        End If
        nI = nI + 1
     Loop
     
End Sub
' ***********************************************************





Private Sub txtItemFactura_GotFocus(Index As Integer)
    
    If Me.txtItemFactura(Index).Tag <> "" Then
         objDiccionariodeDatos.FormatearCampoControl "TB_Productos", _
                                  Me.txtItemFactura(Index), "GotFocus"
    End If

End Sub

Private Sub txtItemFactura_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer
Dim strDato     As String
 
    If Not KeyAscii = vbKeyReturn Then
        If Me.txtItemFactura(Index).Tag <> "" Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Productos", _
                                Me.txtItemFactura(Index), KeyAscii)
        End If
    Else
        Select Case Me.txtItemFactura(Index).Tag
        Case "dsProductoBuscado"
            If Trim(Me.txtItemFactura(Index).Text) = "*" Or Trim(Me.txtItemFactura(Index).Text) = "" Then
                objProductos.CargarTodalaMatrizdeProductos Me.lstBusquedaProductos
                ' Me.lstBusquedaProductos.SetFocus
            Else
                If InStr(1, Me.txtItemFactura(Index).Text, "*", vbTextCompare) > 0 Then
                    strDato = ReemplazarPalabra(Me.txtItemFactura(Index).Text, "*", "")
                    If objProductos.buscarenlaMatrizdeProductoslike(Trim(Me.txtItemFactura(Index).Text), Me.lstBusquedaProductos) Then
                        Me.lstBusquedaProductos.SetFocus
                    End If
                Else
                
                   If objProductos.buscarenlaMatrizdeProductos(Trim(Me.txtItemFactura(Index).Text), Me.lstBusquedaProductos) Then
                      Me.lstBusquedaProductos.SetFocus
                   End If
                End If
            End If
        Case "dsProducto"
            ObtenerCampo("vlPrecioPeaje").SetFocus
        Case "vlPrecioPeaje"
            ObtenerCampo("vlPrecioViaje").SetFocus
        Case "vlPrecioViaje"
            cmdAgregarItemFactura_Click
        End Select
    End If
    
End Sub


Private Sub PasarItems()
Dim Item As ListItem
Dim i    As Integer


    ' Me.lstBusquedaProductos.SelectedItem.Text
    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        If Me.lstBusquedaProductos.SelectedItem.Text = Me.lstItemsFactura.ListItems(i).Text Then Exit Sub
    Next
    
    ObtenerCampo("cdproducto").Text = Me.lstBusquedaProductos.SelectedItem.Text
    ObtenerCampo("dsProducto").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(1)
    ObtenerCampo("tpOperacion").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(2)
    ObtenerCampo("vlPorcentaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(3)
    ObtenerCampo("vlPrecioPeaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(4)
    ObtenerCampo("vlPrecioViaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(5)
    
    buscarPresentarProducto
    
End Sub




Private Sub txtItemFactura_LostFocus(Index As Integer)

    If Me.txtItemFactura(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Productos", _
                                  Me.txtItemFactura(Index), "LostFocus"
           
    End If

End Sub


Private Function ImprimirFactura(pnrTanario As String, _
pnrComprobante As String, tpComprobante As String) As Boolean
Dim objAFIP             As New CAFIP
Dim strCodbarAFIP       As String
Dim strCodbarAFIPI2to5  As String


    strCodbarAFIP = ObtenerCodBarrasAFIP()
    strCodbarAFIPI2to5 = objAFIP.StrToI2of5(strCodbarAFIP)
    strCodbarAFIP = strCodbarAFIP + objAFIP.DigitoVerificador(strCodbarAFIP)
    
    Select Case tpComprobante
    Case "X"
        CrystalReport1.ReportFileName = App.Path & "\rpt_CuponGrande.rpt"
    Case Else
        CrystalReport1.ReportFileName = App.Path & "\rpt_FacturaGrande.rpt"
    End Select
    CrystalReport1.Connect = "DSN=" + objConfig.dsDSN + ";UID=sa;PWD=filcardanica;DSQ=dbSG2000"
    CrystalReport1.WindowState = crptMaximized
    CrystalReport1.Destination = crptToWindow
    
    Select Case tpComprobante
    Case "X"
        CrystalReport1.WindowTitle = "Cupon a Imprimir - ORIGINAL"
    Case Else
        CrystalReport1.WindowTitle = "Factura a Imprimir - ORIGINAL"
    End Select
    
    CrystalReport1.Formulas(0) = "Copia = 'ORIGINAL'"
    CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTanario + "'"
    
    ' CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    On Error Resume Next
    CrystalReport1.Action = 1
    On Error GoTo 0
    
    
    Select Case tpComprobante
    Case "X"
        CrystalReport1.WindowTitle = "Cupon a Imprimir - DUPLICADO"
    Case Else
        CrystalReport1.WindowTitle = "Factura a Imprimir - DUPLICADO"
    End Select
    
    CrystalReport1.Formulas(0) = "Copia = 'DUPLICADO'"
    CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTanario + "'"
    
    ' Aparece la venta duplicado
    On Error Resume Next
    CrystalReport1.Action = 1
    On Error GoTo 0

End Function

Private Sub txtSaldos_Change(Index As Integer)

    If Me.txtSaldos(Index).Text = "" Then
        Me.txtSaldos(Index).Text = FormatNumber(0, 2)
    Else
        Me.txtSaldos(Index).Text = FormatNumber(Me.txtSaldos(Index).Text, 2)
    End If
    
End Sub

