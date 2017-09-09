VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_VentaPasajes 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Venta de Viajes"
   ClientHeight    =   8190
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   11985
   Icon            =   "Frm_VentaPasajes.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8190
   ScaleWidth      =   11985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtItemFactura 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      Height          =   255
      Index           =   12
      Left            =   9570
      Locked          =   -1  'True
      TabIndex        =   100
      Tag             =   "vlRecargoTD"
      Top             =   6795
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Frame fraVentaPasajes 
      Caption         =   "Datos del Comprobate"
      Height          =   7425
      Left            =   15
      TabIndex        =   2
      Top             =   630
      Width           =   11790
      Begin VB.ComboBox cbTipoFacturacion 
         BackColor       =   &H00C0FFFF&
         Height          =   315
         ItemData        =   "Frm_VentaPasajes.frx":030A
         Left            =   9390
         List            =   "Frm_VentaPasajes.frx":0314
         Style           =   2  'Dropdown List
         TabIndex        =   106
         Top             =   405
         Width           =   1890
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   255
         Index           =   15
         Left            =   10710
         Locked          =   -1  'True
         TabIndex        =   105
         Tag             =   "vlRecargoTP"
         Top             =   5385
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   14
         Left            =   10350
         Locked          =   -1  'True
         TabIndex        =   103
         Tag             =   "vlPrecioTP"
         Top             =   3735
         Width           =   1005
      End
      Begin VB.TextBox txtnrCupon 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   255
         Left            =   9660
         Locked          =   -1  'True
         TabIndex        =   102
         Tag             =   "nrCupon"
         Top             =   6930
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   255
         Index           =   13
         Left            =   9570
         Locked          =   -1  'True
         TabIndex        =   101
         Tag             =   "vlRecargoTarjeta"
         Top             =   6525
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   255
         Index           =   11
         Left            =   9555
         Locked          =   -1  'True
         TabIndex        =   99
         Tag             =   "vlRecargoTC"
         Top             =   5805
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   10
         Left            =   9330
         Locked          =   -1  'True
         TabIndex        =   97
         Tag             =   "vlPrecioTD"
         Top             =   3735
         Width           =   1005
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   9
         Left            =   8325
         Locked          =   -1  'True
         TabIndex        =   94
         Tag             =   "vlPrecioTC"
         Top             =   3735
         Width           =   1005
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   16
         Left            =   225
         Locked          =   -1  'True
         TabIndex        =   93
         TabStop         =   0   'False
         Tag             =   "tpComprobante"
         Top             =   450
         Width           =   510
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   4
         Left            =   1785
         Locked          =   -1  'True
         TabIndex        =   91
         TabStop         =   0   'False
         Tag             =   "tpLetra"
         Top             =   465
         Width           =   480
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   255
         Index           =   8
         Left            =   9510
         Locked          =   -1  'True
         TabIndex        =   90
         Tag             =   "cdComision"
         Top             =   5385
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.TextBox txtSaldos 
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
         Index           =   0
         Left            =   6150
         Locked          =   -1  'True
         TabIndex        =   88
         TabStop         =   0   'False
         Tag             =   "vlSaldoReales"
         Text            =   "0"
         Top             =   6615
         Width           =   945
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
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
         Index           =   2
         Left            =   6150
         TabIndex        =   36
         Tag             =   "vlPagoReales"
         Text            =   "0"
         Top             =   6300
         Width           =   945
      End
      Begin VB.TextBox txtTotales 
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
         Index           =   0
         Left            =   6150
         Locked          =   -1  'True
         TabIndex        =   87
         TabStop         =   0   'False
         Tag             =   "vlTotalReales"
         Text            =   "0"
         Top             =   5985
         Width           =   945
      End
      Begin VB.CheckBox flClienteNuevo 
         Caption         =   "Nuevo"
         Height          =   285
         Left            =   4230
         TabIndex        =   85
         Top             =   1335
         Visible         =   0   'False
         Width           =   1050
      End
      Begin VB.CommandButton cmdAgregarCliente 
         Height          =   285
         Left            =   855
         Picture         =   "Frm_VentaPasajes.frx":032C
         Style           =   1  'Graphical
         TabIndex        =   84
         Top             =   1035
         Width           =   285
      End
      Begin VB.TextBox txtLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   2
         Left            =   6795
         Locked          =   -1  'True
         TabIndex        =   82
         Tag             =   "tpFormadePago"
         Top             =   1305
         Width           =   2040
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
         Index           =   121
         Left            =   2985
         Locked          =   -1  'True
         TabIndex        =   81
         TabStop         =   0   'False
         Tag             =   "vlIVA"
         Text            =   "0"
         Top             =   7020
         Width           =   1200
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
         Index           =   120
         Left            =   1170
         Locked          =   -1  'True
         TabIndex        =   79
         TabStop         =   0   'False
         Tag             =   "vlSubtotal"
         Text            =   "0"
         Top             =   7020
         Width           =   1200
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   15
         Left            =   7170
         TabIndex        =   48
         Tag             =   "nrPasajeros"
         Top             =   5400
         Width           =   480
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   14
         Left            =   7950
         TabIndex        =   50
         Tag             =   "nrBultos"
         Top             =   5400
         Width           =   405
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   12
         Left            =   8055
         Locked          =   -1  'True
         TabIndex        =   34
         TabStop         =   0   'False
         Tag             =   "nrCaja"
         Top             =   465
         Width           =   1320
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   11
         Left            =   7425
         Locked          =   -1  'True
         TabIndex        =   33
         TabStop         =   0   'False
         Tag             =   "nrPuesto"
         Top             =   465
         Width           =   600
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   10
         Left            =   5610
         Locked          =   -1  'True
         TabIndex        =   32
         TabStop         =   0   'False
         Tag             =   "nmEmpleado"
         Top             =   465
         Width           =   1800
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   8
         Left            =   120
         TabIndex        =   31
         TabStop         =   0   'False
         Tag             =   "dsLeyenda"
         Top             =   5985
         Width           =   4275
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   0
         ItemData        =   "Frm_VentaPasajes.frx":042C
         Left            =   120
         List            =   "Frm_VentaPasajes.frx":043C
         Style           =   2  'Dropdown List
         TabIndex        =   30
         Tag             =   "cdCondVenta"
         Top             =   5370
         Width           =   1725
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   1
         Left            =   2280
         Locked          =   -1  'True
         TabIndex        =   29
         TabStop         =   0   'False
         Tag             =   "nrTalonario"
         Top             =   450
         Width           =   630
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdComprobante"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   2925
         Locked          =   -1  'True
         TabIndex        =   28
         TabStop         =   0   'False
         Tag             =   "nrComprobante"
         Top             =   450
         Width           =   1350
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
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
         Left            =   4515
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   27
         TabStop         =   0   'False
         Tag             =   "nmLicenciatario"
         Top             =   5400
         Width           =   2625
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   13
         Left            =   3645
         TabIndex        =   26
         Tag             =   "nrLicencia"
         Top             =   5400
         Width           =   810
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
         ForeColor       =   &H000000FF&
         Height          =   285
         Index           =   7
         Left            =   8070
         Locked          =   -1  'True
         TabIndex        =   25
         TabStop         =   0   'False
         Tag             =   "vlTotalGeneral"
         Text            =   "0"
         Top             =   5985
         Width           =   1020
      End
      Begin VB.TextBox txtTotales 
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
         Index           =   20
         Left            =   7110
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "vlTotalDolares"
         Text            =   "0"
         Top             =   5985
         Width           =   945
      End
      Begin VB.TextBox txtTotales 
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
         Index           =   21
         Left            =   5160
         Locked          =   -1  'True
         TabIndex        =   23
         TabStop         =   0   'False
         Tag             =   "vlTotalEuros"
         Text            =   "0"
         Top             =   5985
         Width           =   975
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   2
         Left            =   135
         TabIndex        =   22
         Tag             =   "dsProductoBuscado"
         Top             =   1650
         Width           =   5955
      End
      Begin VB.CommandButton cmdAgregarItemFactura 
         Enabled         =   0   'False
         Height          =   285
         Left            =   11385
         Picture         =   "Frm_VentaPasajes.frx":0476
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   3750
         Width           =   285
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
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
         Left            =   5160
         TabIndex        =   35
         Tag             =   "vlPagoEuros"
         Text            =   "0"
         Top             =   6300
         Width           =   975
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
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
         Left            =   7110
         ScrollBars      =   2  'Vertical
         TabIndex        =   37
         Tag             =   "vlPagoDolares"
         Text            =   "0"
         Top             =   6300
         Width           =   945
      End
      Begin VB.TextBox txtFields 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
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
         Left            =   8070
         ScrollBars      =   2  'Vertical
         TabIndex        =   39
         TabStop         =   0   'False
         Tag             =   "vlPagoPesos"
         Text            =   "0"
         Top             =   6300
         Width           =   1020
      End
      Begin VB.TextBox txtSaldos 
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
         Index           =   21
         Left            =   8070
         Locked          =   -1  'True
         TabIndex        =   19
         TabStop         =   0   'False
         Tag             =   "vlSaldoPesos"
         Text            =   "0"
         Top             =   6615
         Width           =   1020
      End
      Begin VB.TextBox txtSaldos 
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
         Index           =   22
         Left            =   7110
         Locked          =   -1  'True
         TabIndex        =   18
         TabStop         =   0   'False
         Tag             =   "vlSaldoDolares"
         Text            =   "0"
         Top             =   6615
         Width           =   945
      End
      Begin VB.TextBox txtSaldos 
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
         Index           =   24
         Left            =   5160
         Locked          =   -1  'True
         TabIndex        =   17
         TabStop         =   0   'False
         Tag             =   "vlSaldoEuros"
         Text            =   "0"
         Top             =   6615
         Width           =   975
      End
      Begin VB.CommandButton cmdCalcular 
         Height          =   285
         Left            =   9105
         Picture         =   "Frm_VentaPasajes.frx":0576
         Style           =   1  'Graphical
         TabIndex        =   0
         TabStop         =   0   'False
         ToolTipText     =   "Borrar Valores"
         Top             =   6300
         Width           =   285
      End
      Begin VB.CommandButton cmdFacturar 
         Caption         =   "&Facturar"
         Height          =   375
         Left            =   5145
         TabIndex        =   41
         ToolTipText     =   "Imprimir la Factura"
         Top             =   6975
         Width           =   3960
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   5
         Left            =   195
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "cdCliente"
         Top             =   1035
         Width           =   705
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   6
         Left            =   1125
         TabIndex        =   15
         Tag             =   "dsRazonSocial"
         Text            =   "Consumidor Final"
         Top             =   1035
         Width           =   2640
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   50
         Left            =   5865
         TabIndex        =   14
         Tag             =   "dsEmail"
         Top             =   1035
         Width           =   2970
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   3
         Left            =   3750
         TabIndex        =   13
         Tag             =   "nrDoc"
         Top             =   1035
         Width           =   2130
      End
      Begin VB.TextBox txtItemFactura 
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   5
         Left            =   3255
         Locked          =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "cdProducto"
         Top             =   5745
         Visible         =   0   'False
         Width           =   1350
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_VentaPasajes.frx":0668
         Left            =   1890
         List            =   "Frm_VentaPasajes.frx":0675
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Tag             =   "tpComision"
         Top             =   5400
         Width           =   1725
      End
      Begin VB.CommandButton cmdNuevoViaje 
         Appearance      =   0  'Flat
         Caption         =   "Agregar Destino"
         Height          =   315
         Left            =   6180
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   1635
         Width           =   1455
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   4
         Left            =   6300
         Locked          =   -1  'True
         TabIndex        =   9
         Tag             =   "vlKilometros"
         Top             =   3720
         Width           =   780
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   7
         Left            =   5460
         Locked          =   -1  'True
         TabIndex        =   8
         Tag             =   "vlPrecioPeaje"
         Top             =   3720
         Width           =   828
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   6
         Left            =   4392
         Locked          =   -1  'True
         TabIndex        =   7
         Tag             =   "vlPorcentaje"
         Top             =   3720
         Width           =   1050
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   3
         Left            =   3264
         Locked          =   -1  'True
         TabIndex        =   6
         Tag             =   "tpOperacion"
         Top             =   3720
         Width           =   1110
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   1
         Left            =   135
         Locked          =   -1  'True
         TabIndex        =   5
         Tag             =   "dsProducto"
         Top             =   3720
         Width           =   3120
      End
      Begin VB.TextBox txtItemFactura 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   300
         Index           =   0
         Left            =   7104
         Locked          =   -1  'True
         TabIndex        =   4
         Tag             =   "vlPrecioViaje"
         Top             =   3735
         Width           =   1188
      End
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   2
         ItemData        =   "Frm_VentaPasajes.frx":069B
         Left            =   750
         List            =   "Frm_VentaPasajes.frx":06A8
         Style           =   2  'Dropdown List
         TabIndex        =   3
         TabStop         =   0   'False
         Tag             =   "tpIVA"
         Top             =   450
         Width           =   1050
      End
      Begin MSComctlLib.ListView lstItemsFactura 
         Height          =   1065
         Left            =   120
         TabIndex        =   40
         Top             =   4065
         Width           =   11220
         _ExtentX        =   19791
         _ExtentY        =   1879
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
         NumItems        =   14
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
            Object.Width           =   1942
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "vlPorcentaje"
            Object.Tag             =   "vlPorcentaje"
            Text            =   "Porcentaje"
            Object.Width           =   1941
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "vlPrecioPeaje"
            Object.Tag             =   "vlPrecioPeaje"
            Text            =   "Peaje"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "vlKilometros"
            Object.Tag             =   "vlKilometros"
            Text            =   "Kilometros"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Key             =   "vlPrecioViaje"
            Object.Tag             =   "vlPrecioViaje"
            Text            =   "Precio Total"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Key             =   "cdComision"
            Object.Tag             =   "cdComision"
            Text            =   "Codigo de Comision"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Key             =   "vlPrecioTC"
            Object.Tag             =   "vlPrecioTC"
            Text            =   "Precio TC"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Key             =   "vlPrecioTD"
            Object.Tag             =   "vlPrecioTD"
            Text            =   "Precio TD"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Key             =   "vlRecargoTC"
            Object.Tag             =   "vlRecargoTC"
            Text            =   "vlRecargoTC"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Key             =   "vlRecargoTD"
            Object.Tag             =   "vlRecargoTD"
            Text            =   "vlRecargoTD"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Key             =   "vlPrecioTP"
            Object.Tag             =   "vlPrecioTP"
            Text            =   "Precio TP"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Key             =   "vlRecargoTP"
            Object.Tag             =   "vlRecargoTP"
            Text            =   "vlRecargoTP"
            Object.Width           =   0
         EndProperty
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   4275
         TabIndex        =   86
         Top             =   450
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
<<<<<<< HEAD
         Format          =   135397377
=======
         Format          =   113901569
>>>>>>> version4_9_3_post_impl_todopago
         CurrentDate     =   38435
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   23
         Left            =   4275
         Locked          =   -1  'True
         TabIndex        =   20
         TabStop         =   0   'False
         Tag             =   "dtComprobante"
         Top             =   450
         Width           =   1335
      End
      Begin MSComctlLib.ListView lstBusquedaProductos 
         Height          =   1590
         Left            =   135
         TabIndex        =   38
         Top             =   1935
         Width           =   11175
         _ExtentX        =   19711
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
         NumItems        =   14
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
            Object.Width           =   1942
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "vlPorcentaje"
            Object.Tag             =   "vlPorcentaje"
            Text            =   "Porcentaje"
            Object.Width           =   1941
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "vlPrecioPeaje"
            Object.Tag             =   "vlPrecioPeaje"
            Text            =   "Peaje"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "vlKilometros"
            Object.Tag             =   "vlKilometros"
            Text            =   "Kms"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Key             =   "vlPrecioViaje"
            Object.Tag             =   "vlPrecioViaje"
            Text            =   "Efectivo"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Key             =   "cdComision"
            Object.Tag             =   "cdComision"
            Text            =   "Comsion"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Key             =   "vlPrecioTC"
            Object.Tag             =   "vlPrecioTC"
            Text            =   "Precio TC"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Key             =   "vlPrecioTD"
            Object.Tag             =   "vlPrecioTD"
            Text            =   "Precio TD"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Key             =   "vlRecargoTC"
            Object.Tag             =   "vlRecargoTC"
            Text            =   "vlRecargoTC"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Key             =   "vlRecargoTD"
            Object.Tag             =   "vlRecargoTD"
            Text            =   "vlRecargoTD"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Key             =   "vlPrecioTP"
            Object.Tag             =   "vlPrecioTP"
            Text            =   "Precio TP"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Key             =   "vlRecargoTP"
            Object.Tag             =   "vlRecargoTP"
            Text            =   "vlRecargoTP"
            Object.Width           =   2
         EndProperty
      End
      Begin VB.Label Label20 
         Caption         =   "Tipo Facturación"
         Height          =   210
         Left            =   9420
         TabIndex        =   107
         Top             =   225
         Width           =   1455
      End
      Begin VB.Label Label16 
         Caption         =   "Precio TP"
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
         Left            =   10365
         TabIndex        =   104
         Top             =   3510
         Width           =   885
      End
      Begin VB.Label Label17 
         Caption         =   "Precio TD"
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
         Left            =   9390
         TabIndex        =   98
         Top             =   3510
         Width           =   885
      End
      Begin VB.Label Label6 
         Caption         =   "Precio TC"
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
         Left            =   8400
         TabIndex        =   95
         Top             =   3510
         Width           =   885
      End
      Begin VB.Label Label2 
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
         Height          =   225
         Left            =   1815
         TabIndex        =   92
         Top             =   225
         Width           =   495
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Total Real"
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
         Left            =   6150
         TabIndex        =   89
         Top             =   5760
         Width           =   975
      End
      Begin VB.Label Label33 
         Caption         =   "Forma de Pago:"
         Height          =   225
         Left            =   5655
         TabIndex        =   83
         Top             =   1350
         Width           =   1230
      End
      Begin VB.Label Label32 
         Caption         =   "Sub-Total"
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
         Left            =   135
         TabIndex        =   80
         Top             =   7050
         Width           =   900
      End
      Begin VB.Label lblIVA 
         Caption         =   "IVA:"
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
         Left            =   2535
         TabIndex        =   78
         Top             =   7020
         Width           =   435
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
         TabIndex        =   77
         Top             =   5190
         Width           =   945
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
         Left            =   7950
         TabIndex        =   76
         Top             =   5205
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
         Left            =   8025
         TabIndex        =   75
         Top             =   225
         Width           =   870
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
         Left            =   7380
         TabIndex        =   74
         Top             =   225
         Width           =   615
      End
      Begin VB.Label Label10 
         Caption         =   "Cajera"
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
         Left            =   5595
         TabIndex        =   73
         Top             =   225
         Width           =   1785
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
         TabIndex        =   72
         Top             =   5745
         Width           =   4230
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
         Left            =   1005
         TabIndex        =   71
         Top             =   225
         Width           =   570
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
         TabIndex        =   70
         Top             =   5160
         Width           =   1620
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
         Left            =   2160
         TabIndex        =   69
         Top             =   225
         Width           =   780
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
         Left            =   4470
         TabIndex        =   68
         Top             =   255
         Width           =   1050
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
         Left            =   2955
         TabIndex        =   67
         Top             =   225
         Width           =   1170
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
         Left            =   225
         TabIndex        =   66
         Top             =   210
         Width           =   480
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
         TabIndex        =   65
         Top             =   5190
         Width           =   1455
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
         TabIndex        =   64
         Top             =   5190
         Width           =   750
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
         Left            =   8115
         TabIndex        =   63
         Top             =   5760
         Width           =   1080
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
         Left            =   7215
         TabIndex        =   62
         Top             =   5745
         Width           =   945
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
         Left            =   5115
         TabIndex        =   61
         Top             =   5760
         Width           =   1050
      End
      Begin VB.Label lblCotizacionDia 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   390
         Left            =   135
         TabIndex        =   60
         Top             =   6360
         Width           =   4275
      End
      Begin VB.Label Label24 
         Alignment       =   1  'Right Justify
         Caption         =   "A Cobrar"
         Height          =   255
         Left            =   4185
         TabIndex        =   59
         Top             =   6060
         Width           =   915
      End
      Begin VB.Label Label25 
         Alignment       =   1  'Right Justify
         Caption         =   "A Pagar"
         Height          =   255
         Left            =   4200
         TabIndex        =   58
         Top             =   6360
         Width           =   915
      End
      Begin VB.Label Label26 
         Alignment       =   1  'Right Justify
         Caption         =   "Vuelto"
         Height          =   255
         Left            =   4200
         TabIndex        =   57
         Top             =   6675
         Width           =   915
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
         TabIndex        =   56
         Top             =   825
         Width           =   840
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
         TabIndex        =   55
         Top             =   795
         Width           =   2565
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
         TabIndex        =   54
         Top             =   810
         Width           =   930
      End
      Begin VB.Label Label7 
         Caption         =   "CUIT / DNI"
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
         Left            =   3765
         TabIndex        =   53
         Top             =   810
         Width           =   1275
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
         TabIndex        =   52
         Top             =   1350
         Width           =   3000
      End
      Begin VB.Label Label23 
         Caption         =   "Efectivo"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   228
         Left            =   7092
         TabIndex        =   51
         Top             =   3516
         Width           =   1092
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
         Height          =   228
         Left            =   5448
         TabIndex        =   49
         Top             =   3528
         Width           =   528
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
         Height          =   228
         Left            =   4392
         TabIndex        =   47
         Top             =   3528
         Width           =   912
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
         Height          =   228
         Left            =   3276
         TabIndex        =   46
         Top             =   3516
         Width           =   1044
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
         TabIndex        =   45
         Top             =   3510
         Width           =   1455
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
         TabIndex        =   44
         Top             =   5190
         Width           =   1620
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
         Left            =   60
         TabIndex        =   43
         Top             =   6750
         Width           =   1620
      End
      Begin VB.Label Label31 
         Caption         =   "Kms"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   228
         Left            =   6312
         TabIndex        =   42
         Top             =   3516
         Width           =   564
      End
      Begin VB.Label lblRecargoTarjeta 
         Caption         =   "Descuento Efectivo: $ 0,00"
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
         Left            =   1890
         TabIndex        =   96
         Top             =   6735
         Width           =   2715
      End
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11985
      _ExtentX        =   21140
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
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
      MouseIcon       =   "Frm_VentaPasajes.frx":06B8
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
               Picture         =   "Frm_VentaPasajes.frx":081A
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0936
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0A8A
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0B9A
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0C9C
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0DF0
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":0EFC
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":1578
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":16E0
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":1B34
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
               Picture         =   "Frm_VentaPasajes.frx":1F88
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":20A0
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":21F4
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":230C
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":2418
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":256C
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":2674
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":2CF0
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":2E50
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":32A4
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_VentaPasajes.frx":36F8
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
End
Attribute VB_Name = "Frm_VentaPasajes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim EstadoABM         As Byte
Dim objControl        As New CControl

Const const_dsProducto = 1
Const const_tpOperacion = 2
Const Const_vlPorcentaje = 3
Const Const_vlPrecioPeaje = 4
Const const_vlTotalViajes = 6
Const const_vlKilometros = 5
Const const_cdComision = 7

' constantes de la version 4.9
Const const_vlPrecioTC = 8
Const const_vlPrecioTD = 9
Const const_vlPrecioTP = 12   ' /*  OJO ESTA CONSTANTE  */
Const const_vlRecargoTC = 10
Const const_vlRecargoTD = 11
Const const_vlRecargoTP = 13   ' /*  OJO ESTA CONSTANTE  */


Dim lerror            As String
Dim objCliente        As New CCliente
Dim strMotivo         As String
Dim flFacturaCtacte   As Boolean
' variables de la version 4.9
Dim PORC_RECARGO_TD As Single
Dim PORC_RECARGO_TC As Single
Dim PORC_RECARGO_TP As Single





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
    
    Me.lstItemsFactura.ListItems.Clear
    ObtenerCampo("vlTotalGeneral").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"
    ObtenerCampo("vlSaldoPesos").Text = "0,00"
    ObtenerCampo("vlTotalDolares").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"
    ObtenerCampo("vlSaldoDolares").Text = "0,00"
    
    ObtenerCampo("vlTotalReales").Text = "0,00"
    ObtenerCampo("vlPagoReales").Text = "0,00"
    ObtenerCampo("vlSaldoReales").Text = "0,00"
    
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



Private Sub cbTipoFacturacion_Click()
        
        

        objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", Me.cbTipoFacturacion.Text
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
        

End Sub

Private Sub cmdAgregarCliente_Click()
Dim resp As Byte
Dim esUnClienteNuevo As Boolean


    If ObtenerCampo("dsRazonSocial").Text = "" Then
        Exit Sub
    End If
    
    resp = MsgBox("Desea guardar el cliente en el sistema.", vbYesNo + vbInformation, "Atención")
    
    If resp = vbNo Then Exit Sub
        
    
    If objCliente.ExisteCliente(ObtenerCampo("dsRazonSocial").Text) Then
        resp = MsgBox("El cliente '" + ObtenerCampo("dsRazonSocial").Text + "' ya existe en el sistema con el código '" + objCliente.cdCliente + "'. " + vbCrLf + "Desea Guardar los cambios?", vbInformation, "Atención")
        If resp = vbNo Then Exit Sub
    End If
    
    If Not (Trim(ObtenerCampo("cdCliente").Text) = "1" Or Trim(ObtenerCampo("cdCliente").Text) = "") Then
        ' verificar si el cliente
        If objCliente.ObtenerCliente(ObtenerCampo("cdCliente").Text) Then
            esUnClienteNuevo = False
        Else
            esUnClienteNuevo = True
        End If
    Else
             esUnClienteNuevo = True
    End If
    
  
    ' grabamos los datos del nuevo cliente
                
    objCliente.dsRazonSocial = ObtenerCampo("dsRazonSocial")
    objCliente.nrPuesto = ObtenerCampo("nrPuesto")
    objCliente.dsEmail = ObtenerCampo("dsEmail")
    objCliente.tpDoc = "CUIT"
    objCliente.nrDoc = ObtenerCampo("nrDoc")
                   
    Select Case esUnClienteNuevo
    Case True
            ObtenerCampo("cdCliente") = objCliente.ObtenerNuevocdCliente(objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
            objCliente.cdCliente = ObtenerCampo("cdCliente")
            If Not objCliente.insertarCliente() Then
                MsgBox "Se ha producido un error, no se pudo grabar el cliente. " + vbCrLf + "Error extendido: " + objCliente.Error, vbInformation, "Atención"
            Else
                MsgBox "El cliente ha sido guardado con éxito.", vbInformation, "Atención"
            End If
    Case False
            objCliente.cdCliente = ObtenerCampo("cdCliente")
            If Not objCliente.guardarCliente() Then
                MsgBox "Se ha producido un error, no se pudo grabar el cliente. " + vbCrLf + "Error extendido: " + objCliente.Error, vbInformation, "Atención"
            Else
                MsgBox "El cliente ha sido guardado con éxito.", vbInformation, "Atención"
            End If
    End Select
    
               

    ObtenerCampo("dsRazonSocial").SetFocus
    
    ' Me.flClienteNuevo
    Me.flClienteNuevo.value = vbChecked
    
End Sub

Private Sub cmdAgregarItemFactura_Click()
Dim lvlPrecioViaje    As Single
Dim ListItemNuevo     As ListItem
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

    '/* INICIO Agregado en la version 4.3
    If Me.lstItemsFactura.ListItems.Count = 3 Then
        MsgBox "No se puede agregar mas destinos, deberá realizar una nueva factura.", vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    '/* FIN Agregado en la version 4.3
    
    
    If Trim(ObtenerCampo("cdProducto").Text) = "" Then
        ObtenerCampo("cdProducto").BackColor = Rojo
        On Error Resume Next
        ObtenerCampo("cdProducto").SetFocus
        On Error GoTo 0
        Exit Sub
    End If
    
    If Trim(ObtenerCampo("dsProducto").Text) = "" Then
        ObtenerCampo("dsProducto").BackColor = Rojo
        ObtenerCampo("dsProducto").SetFocus
        Exit Sub
    End If
    
    If IsNumeric(ObtenerCampo("vlPrecioViaje").Text) Then
        Select Case ObtenerCampo("tpOperacion").Text
        Case "Descuento Valor"
            lvlPrecioViaje = -Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
        Case "Descuento Porcentaje"
            lvlPrecioViaje = -Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
        Case "Recargo Valor"
            lvlPrecioViaje = Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
        Case "Recargo Porcentaje"
            lvlPrecioViaje = Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
        Case Else
            lvlPrecioViaje = CSng(ObtenerCampo("vlPrecioViaje").Text)
        End Select
        
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
    
    ListItemNuevo.SubItems(const_dsProducto) = ObtenerCampo("dsProducto").Text
    ListItemNuevo.SubItems(const_tpOperacion) = ObtenerCampo("tpOperacion").Text
    ListItemNuevo.SubItems(Const_vlPorcentaje) = ObtenerCampo("vlPorcentaje").Text
    ListItemNuevo.SubItems(Const_vlPrecioPeaje) = ObtenerCampo("vlPrecioPeaje").Text
    ListItemNuevo.SubItems(const_vlKilometros) = ObtenerCampo("vlKilometros").Text
    ListItemNuevo.SubItems(const_vlTotalViajes) = CStr(lvlPrecioViaje)
    ListItemNuevo.SubItems(const_cdComision) = ObtenerCampo("cdComision").Text
    
        ' campos de la version 4.9
    Dim PORC_RECARGO_TC    As Single
    Dim PORC_RECARGO_TD    As Single
    Dim PORC_RECARGO_TP    As Single
        
        
    PORC_RECARGO_TD = objParametros.ObtenerValorBD("PORC_RECARGO_TD")
    PORC_RECARGO_TC = objParametros.ObtenerValorBD("PORC_RECARGO_TC")
    PORC_RECARGO_TP = objParametros.ObtenerValorBD("PORC_RECARGO_TP")
        
        
    ListItemNuevo.SubItems(const_vlPrecioTC) = Round(CSng(lvlPrecioViaje) + (lvlPrecioViaje * PORC_RECARGO_TC / 100), 0)
    ListItemNuevo.SubItems(const_vlPrecioTD) = Round(CSng(lvlPrecioViaje) + (CSng(lvlPrecioViaje) * PORC_RECARGO_TD / 100), 0)
    ListItemNuevo.SubItems(const_vlPrecioTP) = Round(CSng(lvlPrecioViaje) + (CSng(lvlPrecioViaje) * PORC_RECARGO_TP / 100), 0)
    ListItemNuevo.SubItems(const_vlRecargoTC) = Round(CSng(lvlPrecioViaje) * PORC_RECARGO_TC / 100, 0)
    ListItemNuevo.SubItems(const_vlRecargoTD) = Round(CSng(lvlPrecioViaje) * PORC_RECARGO_TD / 100, 0)
    ListItemNuevo.SubItems(const_vlRecargoTP) = Round(CSng(lvlPrecioViaje) * PORC_RECARGO_TP / 100, 0)
                
    setearCondicionVentayComision
    Recalculo_operaciones
    
    If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
       ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" Then
        CalcularSaldos "vlTotalPesos"
    End If
  
    HabilitarCampos "dsProducto", False
    HabilitarCampos "vlPorcentaje", False
    HabilitarCampos "vlPrecioViaje", False
    HabilitarCampos "vlPrecioPeaje", False
    HabilitarCampos "vlKilometros", False
    
    HabilitarCampos "vlPrecioTC", False
    HabilitarCampos "vlPrecioTD", False
    
    
    ObtenerCampo("cdProducto").Text = ""
    ObtenerCampo("dsProducto").Text = ""
    ObtenerCampo("tpOperacion").Text = ""
    ObtenerCampo("vlPorcentaje").Text = ""
    ObtenerCampo("vlPrecioPeaje").Text = ""
    ObtenerCampo("vlPrecioViaje").Text = ""
    ObtenerCampo("vlKilometros").Text = ""
    ObtenerCampo("cdComision").Text = ""
    
    ObtenerCampo("vlPrecioTC").Text = ""
    ObtenerCampo("vlPrecioTD").Text = ""
    ObtenerCampo("vlRecargoTC").Text = ""
    ObtenerCampo("vlRecargoTD").Text = ""
    
    ObtenerCampo("cdCondVenta").SetFocus
    Me.cmdAgregarItemFactura.Enabled = False
    
    
End Sub




' ACA PROGRAMAR
Private Sub Recalculo_operaciones()
Dim i              As Integer
Dim vlTotalViajes  As Single
Dim vlPorcentaje   As Single
Dim strDato        As String
Dim j              As Integer

    vlPorcentaje = 0
    vlTotalViajes = 0
    
    
    If ObtenerCampo("tpcomprobante") = "FA" Then
        j = 1
        For i = 1 To Me.lstItemsFactura.ListItems.Count
            If Me.lstItemsFactura.ListItems.Item(i).SubItems(const_tpOperacion) = "Viaje" Then
                vlTotalViajes = vlTotalViajes + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlTotalViajes))
                If j = 1 Then
                    strDato = ReemplazarPalabra(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_dsProducto), "  (" + CStr(j) + " DESTINO) ", "")
                    Me.lstItemsFactura.ListItems.Item(i).SubItems(const_dsProducto) = strDato + "  (" + CStr(j) + " DESTINO) "
                Else
                    strDato = ReemplazarPalabra(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_dsProducto), "  (" + CStr(j) + " DESTINOS) ", "")
                    Me.lstItemsFactura.ListItems.Item(i).SubItems(const_dsProducto) = strDato + "  (" + CStr(j) + " DESTINOS) "
                End If
                j = j + 1
            End If
        Next
    End If
    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        Select Case Me.lstItemsFactura.ListItems.Item(i).SubItems(const_tpOperacion)
        Case "Descuento %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(Const_vlPorcentaje))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlTotalViajes) = _
             (-Abs((vlTotalViajes * vlPorcentaje) / 100))
        Case "Recargo %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(Const_vlPorcentaje))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlTotalViajes) = _
             (vlTotalViajes * vlPorcentaje) / 100
        End Select
    Next
    
    calcularTotalesFactura
    

End Sub


' Modificado en la version 2.3
Private Sub calcularTotalesFactura()
Dim i            As Integer
Dim vlTotalPesos As Single
Dim vlSubtotal   As Single
Dim vlIVA        As Single
Dim vlKilometros As Long
Dim resp         As Byte
Dim vlRecargoTarjeta As Single
Dim vlDescuentoEfectivo As Single

On Error Resume Next

    vlRecargoTarjeta = 0
    vlDescuentoEfectivo = 0

    If Me.lstItemsFactura.ListItems.Count < 1 Then Exit Sub
    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        Select Case ObtenerCampo("cdCondVenta").Text
        Case "Tarjeta de Débito"
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlPrecioTD))
            vlRecargoTarjeta = vlRecargoTarjeta + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlRecargoTD))
        Case "Tarjeta de Crédito"
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlPrecioTC))
            vlRecargoTarjeta = vlRecargoTarjeta + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlRecargoTC))
        Case "Todo Pago"
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlPrecioTP))
            vlRecargoTarjeta = vlRecargoTarjeta + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlRecargoTP))
        Case Else
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlTotalViajes))
            vlRecargoTarjeta = 0
        End Select
    Next
    
    
    vlDescuentoEfectivo = vlRecargoTarjeta
    
    
    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
            If Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlKilometros) <> "" Then
                vlKilometros = vlKilometros + _
                CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(const_vlKilometros))
            End If
    Next
        
    
    vlIVA = 0
    vlSubtotal = vlTotalPesos
    

    If objAFIP.Supera_KM_IVA_segunMonto(ObtenerCampo("tpIVA"), vlKilometros, vlTotalPesos, ObtenerCampo("tpComprobante")) Then
        ' obtenemos los valores del IVA
        If objAFIP.preguntaOperadora(ObtenerCampo("tpIVA"), vlKilometros, vlTotalPesos) Then
            
            objParametros.GrabarValor "frm_MsgSinBotonporDefecto.mensaje", "¿La distancia del viaje es igual o superior a los " + CStr(objParametros.ObtenerValorBD("KM_IVA")) + " kilometros?"
            frm_MsgSinBotonporDefecto.Show 1
            
            Dim respuesta As String
            
            respuesta = objParametros.ObtenerValor("frm_MsgSinBotonporDefecto.respuesta")
                        
            If respuesta = "SI" Then
                vlIVA = objAFIP.CalcularIVA(ObtenerCampo("tpIVA"), vlTotalPesos, objAFIP.obtenerAlicuotaIVA(ObtenerCampo("tpIVA")))
                vlSubtotal = objAFIP.CalcularSubtotal(ObtenerCampo("tpIVA"), vlTotalPesos, objAFIP.obtenerAlicuotaIVA(ObtenerCampo("tpIVA")))
            End If
        Else
            vlIVA = objAFIP.CalcularIVA(ObtenerCampo("tpIVA"), vlTotalPesos, objAFIP.obtenerAlicuotaIVA(ObtenerCampo("tpIVA")))
            vlSubtotal = objAFIP.CalcularSubtotal(ObtenerCampo("tpIVA"), vlTotalPesos, objAFIP.obtenerAlicuotaIVA(ObtenerCampo("tpIVA")))
        End If
    End If
    
    

    ObtenerCampo("vlIVA").Text = FormatNumber(vlIVA, "2")
    ObtenerCampo("vlSubtotal").Text = FormatNumber(vlSubtotal, "2")
    
    ObtenerCampo("vlTotalDolares").Text = Round(FormatNumber(vlTotalPesos / CSng(CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))), 2))
    ObtenerCampo("vlTotalEuros").Text = Round(FormatNumber(vlTotalPesos / CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro")), 2))
    ObtenerCampo("vlTotalReales").Text = Round(FormatNumber(vlTotalPesos / CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal")), 2))
    ObtenerCampo("vlTotalGeneral").Text = FormatNumber(vlTotalPesos, "2")
    
    ObtenerCampo("vlPagoEuros").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"
    ObtenerCampo("vlPagoReales").Text = "0,00"

    ObtenerCampo("vlSaldoEuros").Text = "0,00"
    ObtenerCampo("vlSaldoPesos").Text = "0,00"
    ObtenerCampo("vlSaldoDolares").Text = "0,00"
    ObtenerCampo("vlSaldoReales").Text = "0,00"
    ObtenerCampo("vlRecargoTarjeta").Text = vlRecargoTarjeta
    
    Me.lblComision.Caption = "Comisión: $ " + FormatNumber(objComision.obtenerComision(vlTotalPesos, ObtenerCampo("cdCondVenta").Text, _
                        ObtenerCampo("tpComision").Text, obtenerGrillaDatosLiquidaComision(), ObtenerCampo("tpComprobante").Text), 2)
    
    If ObtenerCampo("cdCondVenta").Text = "Tarjeta de Débito" Or ObtenerCampo("cdCondVenta").Text = "Tarjeta de Crédito" Or _
       ObtenerCampo("cdCondVenta").Text = "Todo Pago" Then
      Me.lblRecargoTarjeta.Caption = "Descuento Efectivo: $ " + FormatNumber(vlDescuentoEfectivo, 2)
    Else
      Me.lblRecargoTarjeta.Caption = "Descuento Efectivo: $ " + FormatNumber(vlDescuentoEfectivo, 2)
    End If
    
    If Err <> 0 Then
        MsgBox Err.Description
    End If
    
    ' MsgBox "Eulises: sale de calcularTotalesFactura "
On Error GoTo 0

    
End Sub


Private Sub cmdCalcular_Click()

    ObtenerCampo("vlPagoEuros").Text = "0,00"
    ObtenerCampo("vlPagoDolares").Text = "0,00"
    ObtenerCampo("vlPagoPesos").Text = "0,00"

End Sub



Private Sub cmdFacturar_Click()
Dim resp   As Integer
Dim objLicenciatario  As New CLicenciatario


    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion.cajapuesto"
        strMotivo = InputBox("Ingrese el motivo de la corrección.", "Motivo de la Eliminación")
    End Select
        
    DoEvents
    ObtenerCampo("dsProductoBuscado").Text = ""
    ObtenerCampo("dsLeyenda").SetFocus
    DoEvents
    

    Me.Enabled = False
    Me.cmdFacturar.Enabled = False
    
    If ObtenerCampo("cdCliente").Text = "1" And ObtenerCampo("dsRazonSocial").Text = "" Then
        ObtenerCampo("dsRazonSocial").Text = "Consumidor Final"
    End If
    
    If ObtenerCampo("cdCondVenta").Text = "Cuenta Corriente" And _
       Trim(ObtenerCampo("cdCliente").Text) = "1" Then
       MsgBox "No puede asignar un viaje en 'Cuenta Corriente' al cliente '1'," + _
              vbCrLf + "por favor cambie el cliente o la condición de venta.", vbExclamation + vbDefaultButton1, "Atención"
       Me.Enabled = True
       ObtenerCampo("cdCondVenta").SetFocus
       Me.cmdFacturar.Enabled = True
       Exit Sub
    End If
    
        
    If Trim(ObtenerCampo("nrLicencia").Text) = "" Then
        MsgBox "Debe completar la licencia que realizá el viaje", vbInformation, "Atención"
        Me.Enabled = True
        Me.cmdFacturar.Enabled = True
        ObtenerCampo("nrLicencia").SetFocus
        Exit Sub
    End If
    
    If Not IsNumeric(ObtenerCampo("vlTotalGeneral")) Then
        MsgBox "El monto del viaje no es válido.", vbInformation, "Atención"
        Me.Enabled = True
        Me.cmdFacturar.Enabled = True
        Me.lstItemsFactura.SetFocus
        Exit Sub
    End If
    
    
    ' agregado en la version 4.2
    If ObtenerCampo("nrLicencia").Text = "990" And _
        ObtenerCampo("tpFormadePago") <> "Cuenta Corriente" Then
        MsgBox "Solo se puede asignar la licencia 990 para una facturación de Cuenta Corriente.", vbInformation, "Atención"
        Me.Enabled = True
        ObtenerCampo("nrLicencia").SetFocus
        Me.cmdFacturar.Enabled = True
        Exit Sub
    End If
    
    ' inicio Agregado en la version 4.2 evitamos el cálculo de IVA para la lic 990
    If ObtenerCampo("nrLicencia").Text = "990" And _
        objParametros.ObtenerValorBD("CALCULA_IVA_LIC_990") = "N" Then
         ObtenerCampo("vlIVA").Text = FormatNumber(0, "2")
         ObtenerCampo("vlSubtotal").Text = ObtenerCampo("vlTotalGeneral")
    End If
    ' fin Agregado en la version 4.2 evitamos el cálculo de IVA para la lic 990
    
    Dim vlTotalGeneral As Single
    
    vlTotalGeneral = CSng(ObtenerCampo("vlTotalGeneral"))
    
    If esNuevoDestino() Then
        If ObtenerCampo("cdCondVenta").Text <> "Retorno" And objProductos.esValorMontodelViajeunDestinoPredefinido(vlTotalGeneral) Then
            MsgBox "El destino / monto del viaje no es válido. El mismo pertenece a '" + _
                objProductos.dsProducto + "', es viaje '" + objProductos.tpDestino + "' predefinido por la administración.", vbInformation + vbDefaultButton1, "Atención"
                Me.Enabled = True
                Me.cmdFacturar.Enabled = True
                Me.lstItemsFactura.SetFocus
                tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Cancelar")
            Exit Sub
        End If
    
        If ObtenerCampo("cdCondVenta").Text <> "Retorno" And objLicenciatario.esMontoIgualaLicencia(ObtenerCampo("nrLicencia"), vlTotalGeneral) Then
            resp = MsgBox("El monto del viaje coincide con la licencia, esta seguro/a que desea continuar?", vbQuestion + vbYesNo + vbDefaultButton2, "Atención")
            If resp = vbNo Then
                Me.Enabled = True
                Me.cmdFacturar.Enabled = True
                Me.lstItemsFactura.ListItems.Clear
                cmdNuevoViaje_Click
                Exit Sub
            End If
        End If
    End If
    
    objParametros.GrabarValor "cdCondVenta", ObtenerCampo("cdCondVenta").Text
    objParametros.GrabarValor "vlPagoEuros", ObtenerCampo("vlPagoEuros").Text
    objParametros.GrabarValor "vlPagoDolares", ObtenerCampo("vlPagoDolares").Text
    objParametros.GrabarValor "vlPagoPesos", ObtenerCampo("vlPagoPesos").Text
    objParametros.GrabarValor "vlPagoReales", ObtenerCampo("vlPagoReales").Text

    If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
       ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" And _
       ObtenerCampo("cdCondVenta").Text <> "Retorno" And _
       ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Crédito" And _
       ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Débito" And _
       ObtenerCampo("cdCondVenta").Text <> "Todo Pago" Then
        calculaPagodelCliente
    End If
    
    If ObtenerCampo("cdCondVenta").Text = "Cuenta Corriente" Or _
           ObtenerCampo("cdCondVenta").Text = "Cobro en Destino" Or _
           ObtenerCampo("cdCondVenta").Text = "Retorno" Or _
           ObtenerCampo("cdCondVenta").Text = "Tarjeta de Crédito" Or _
           ObtenerCampo("cdCondVenta").Text = "Tarjeta de Débito" Or _
           ObtenerCampo("cdCondVenta").Text <> "Todo Pago" Then
                ObtenerCampo("vlPagoEuros").Text = "0,00"
                ObtenerCampo("vlPagoDolares").Text = "0,00"
                ObtenerCampo("vlPagoPesos").Text = "0,00"
                ObtenerCampo("vlPagoReales").Text = "0,00"
    End If
    
   ' Facturacion tarjetas
   objParametros.GrabarValor "Frm_VentaViajesTotales.cmdAceptar.caption", "Imprimir"
   objParametros.GrabarValor "Frm_VentaViajesTotales.caption", "         Confirme los valores de Pago"
        
        
    Frm_VentaViajesTotales.Show 1
    
    
    If objParametros.ObtenerValor("Facturar") = "NO" Then
        Me.cmdFacturar.Enabled = True
        Me.Enabled = True
        If ObtenerCampo("cdCondVenta").Text = "Contado" Then
            ObtenerCampo("vlPagoEuros").SetFocus
        Else
            ObtenerCampo("cdCondVenta").SetFocus
        End If
        Exit Sub
    End If
        
    If ObtenerCampo("cdCondVenta").Text = "Retorno" Or _
       ObtenerCampo("tpComision").Text = "Retorno" Then
        resp = MsgBox("Esta facturando el viaje como Condición de Venta '" + ObtenerCampo("cdCondVenta").Text + "' y Comisión: '" + ObtenerCampo("tpComision").Text + "'" + vbCrLf + "¿Desea continuar?", vbQuestion + vbYesNo, "Atención")
        If resp = vbNo Then
            Me.Enabled = True
            Me.cmdFacturar.Enabled = True
            ObtenerCampo("cdCondVenta").SetFocus
            Exit Sub
        End If
    End If

    ObtenerCampo("cdCondVenta").Text = objParametros.ObtenerValor("cdCondVenta")
    ObtenerCampo("vlPagoEuros").Text = objParametros.ObtenerValor("vlPagoEuros")
    ObtenerCampo("vlPagoDolares").Text = objParametros.ObtenerValor("vlPagoDolares")
    ObtenerCampo("vlPagoPesos").Text = objParametros.ObtenerValor("vlPagoPesos")
    ObtenerCampo("vlPagoReales").Text = objParametros.ObtenerValor("vlPagoReales")
    
    
    
    If Not validarEntradadedatos() Then
        Me.Enabled = True
        Me.cmdFacturar.Enabled = True
        Exit Sub
    End If
    
    ' Verificar que el monto no sea negativo
    If Not FormadepagoOK() Then
         Me.Enabled = True
         Me.cmdFacturar.Enabled = True
         Exit Sub
    End If

    lerror = ""
        
    
    If Not FacturarBD() Then
        If InStr(1, lerror, "Duplicate Entry", vbTextCompare) > 0 Then
                ' actualizar nrPuesto
                ' Version 1.4
                ' ActualizarNroComprobante
        End If
        Sleep 1000
        If Not FacturarBD() Then
            MsgBox lerror, vbCritical, "Atención"
            Me.cmdFacturar.Enabled = True
            Me.Enabled = True
            Me.cmdFacturar.SetFocus
            Exit Sub
         End If
    End If
    
    ' LOGICA PARA GRABAR DATOS DE TARJETAS
    If ObtenerCampo("cdCondVenta") = "Tarjeta de Débito" Or _
       ObtenerCampo("cdCondVenta") = "Tarjeta de Crédito" Or _
       ObtenerCampo("cdCondVenta") = "Todo Pago" Then
        objParametros.GrabarValor "Frm_VentaViajesTotales.cmdAceptar.caption", "Aceptar"
        objParametros.GrabarValor "Frm_VentaViajesTotales.caption", "         Ingrese los datos de la TARJETA"
        
        Frm_VentaViajesTotales.Show 1
        
        ObjTablasIO.nmTabla = "TB_Comprobantes"
             
        ObjTablasIO.setearCampoOperadorValor "nrTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrTarjeta")
        ObjTablasIO.setearCampoOperadorValor "tpDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.tpDocTarjeta")
        ObjTablasIO.setearCampoOperadorValor "nrDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrDocTarjeta")
        ObjTablasIO.setearCampoOperadorValor "nrCuponPosnet", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrCuponPosnet")
        ObjTablasIO.setearCampoOperadorValor "vlRecargoTarjeta", "<-", ObtenerCampo("vlRecargoTarjeta").Text
           
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", ObtenerCampo("tpLetra"), " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", ObtenerCampo("tpComprobante"), " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", ObtenerCampo("nrTalonario"), " AND "
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", ObtenerCampo("nrComprobante")
      
        If Not ObjTablasIO.Actualizar() Then
            MsgBox "Los datos de la tarjeta no fueron cargados al comprobante, recolectelos en forma manual.", vbInformation, "Atención"
        End If
        
        
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrTarjeta")
        ObjTablasIO.setearCampoOperadorValor "tpDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.tpDocTarjeta")
        ObjTablasIO.setearCampoOperadorValor "nrDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrDocTarjeta")
        ObjTablasIO.setearCampoOperadorValor "nrCuponPosnet", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrCuponPosnet")
        ObjTablasIO.setearCampoOperadorValor "nrCupon", "=", txtnrCupon.Text
      
        If Not ObjTablasIO.Actualizar() Then
            MsgBox "Los datos de la tarjeta no fueron cargados a la cuenta corriente de licenciatario, recolectelos en forma manual.", vbInformation, "Atención"
        End If
 
    End If
    
    
    limpiarControles
    
    '/****************************************************/
    '/* Version 1.9                                      */
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion"
        frm_SeleccionarPuesto.Show vbModal
        ' Seleccionar el numero de puesto
        If objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto") = "" Then
            Unload Me
            Exit Sub
        End If
        objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto")
    End Select
    '/****************************************************/
    
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    EstadoABM = facturar
    Me.cmdFacturar.Enabled = True
    Me.Enabled = True
    
End Sub


' Version 4.7 VERIFICAR EL PROCEDIMIENTO
'Private Sub ActualizarNroComprobante()
'Dim resp As Byte
'Dim strSQL  As String
'Dim nrComprobante As Long
'
'
'    ObjTablasIO.nmTabla = "TB_Puestos"
'    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "=", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
'    ObjTablasIO.setearCampoOperadorValor "nrComprobante_automatico_ult", "->", ""
'
'    If Not ObjTablasIO.Seleccionar() Then Exit Sub
'
'    If ObjTablasIO.rs_resultados.EOF Then Exit Sub
'
'    nrComprobante = ObjTablasIO.rs_resultados("nrComprobante_automatico_ult") + 1
'    ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(CStr(nrComprobante), 8)
'
'    ObjTablasIO.nmTabla = "TB_Puestos"
'    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "=", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
'    ObjTablasIO.setearCampoOperadorValor "nrComprobante_automatico_ult", "<-", CStr(CLng(ObtenerCampo("nrComprobante")))
'    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
'
'    If Not ObjTablasIO.Actualizar() Then
'         Exit Sub
'    End If
'
'End Sub


Private Function FacturarBD() As Boolean

    FacturarBD = False
    
    ' version 4.1
    If Not objCajas.esCajaAbierta(ObtenerCampo("nrCaja").Text) Then
        MsgBox "La caja puesto ' " + ObtenerCampo("nrCaja").Text + "' en la que intenta facturar se encuentra cerrada, el programa se cerrará.", vbCritical + vbDefaultButton1, "Atención"
        End
        Exit Function
    End If
    
    
    
    objbasededatos.BeginTrans

            
    
    ' Finalmente no se quiere guardar los nuevos destinos cargados por las operadoras
    ' If Not GrabarDatosdeProductos() Then
    '     Me.cmdFacturar.Enabled = True
    '     Me.Enabled = True
    '     objbasededatos.RollBackTrans
    '     MsgBox "Se ha producido un error, no se pudo grabar la factura, no se agrgó el nuevo un destino", vbCritical + vbDefaultButton1, "Atención"
    '     Exit Sub
    ' End If
    
'    If Me.flClienteNuevo.value = vbChecked Then
'                ' grabamos los datos del nuevo cliente
'
'                objCliente.dsRazonSocial = ObtenerCampo("dsRazonSocial")
'                objCliente.nrPuesto = ObtenerCampo("nrPuesto")
'                objCliente.dsEmail = ObtenerCampo("dsEmail")
'                objCliente.tpDoc = "CUIT"
'                objCliente.nrDoc = ObtenerCampo("nrDoc")
'
'                If Not objCliente.GrabarDatosdelCliente() Then
'                    objbasededatos.RollBackTrans
'                    lerror = "Se ha producido un error, no se pudo grabar el cliente"
'                    Exit Function
'                End If
'
'    End If
    
    
    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion.cajapuesto", "puesto"
         'Agregado en la version 2.5 ***********************************************************************/
          objComprobante.nrTalonario = ObtenerCampo("nrTalonario").Text
          objComprobante.nrComprobante = ObtenerCampo("nrComprobante").Text
          objComprobante.tpComprobante = ObtenerCampo("tpComprobante").Text
          objComprobante.tpLetra = ObtenerCampo("tpLetra").Text
          objComprobante.nrCierre = objParametros.ObtenerValor("Frm_VentasPasajes.nrCierre")
          ' Borrar Comprobante eliminado logicamente
          ' Si el comprobante fue cargado y posteriomente eliminado por otra caja
          If Not objComprobante.eliminarFisicamenteunComprobanteEliminadoLogicamente() Then
             objbasededatos.RollBackTrans
             lerror = "Error: " + objComprobante.Error
             Exit Function
         End If
         '/***********************************************************************/
    End Select
           
           
    
           
    If Guardarregistro(EstadoABM) Then
           If Not GrabarItemsFactura() Then
                objbasededatos.RollBackTrans
                lerror = "Se ha producido un error, no se pudo grabar el detalle de la factura"
                Exit Function
           End If
           If Not GrabarTabladeCupones() Then
                Me.Enabled = True
                objbasededatos.RollBackTrans
                lerror = "Se ha producido un error, no se pudo grabar el detalle de la factura"
                Exit Function
           End If
           
           
           '/* INICIO  modificado en la version 2.5  */
           '/* ADD Version 4.7 Si es factura actulizamos el saldo de la caja puesto NC y ND no
           If ObtenerCampo("tpComprobante").Text = "FA" Then
            Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
            Case "administracion.cajapuesto"
                 Select Case ObtenerCampo("cdCondVenta").Text
                 Case "Contado"
                     If Not ActualizarCaja() Then
                            objbasededatos.RollBackTrans
                            lerror = "Se ha producido un error, no se pudo grabar la factura." + vbCrLf + _
                                   " la caja no se pudo actualizar, por favor intente nuevamente. o reinicie el sistema."
                           Exit Function
                     End If
                 End Select
            Case Else
                 Select Case objUsuario.tpAcceso
                 Case "Puestos"
                     Select Case ObtenerCampo("cdCondVenta").Text
                     Case "Contado"
                         If Not ActualizarCaja() Then
                                objbasededatos.RollBackTrans
                                lerror = "Se ha producido un error, no se pudo grabar la factura." + vbCrLf + _
                                       " la caja no se pudo actualizar, por favor intente nuevamente. o reinicie el sistema."
                               Exit Function
                         End If
                     End Select
                 End Select
            End Select
           End If
           '/* FIN  modificado en la version 2.5  */
           '**********************************************************
           '* Código creado para Gestión V2
           ' Actualizamos los numeros de talonarios y comprobantes
           If CSng(ObtenerCampo("nrComprobante")) > MAX_VALOR_COMPROBANTE Then
                objbasededatos.RollBackTrans
                lerror = "ERROR: El talonario ha llegado a su fin, por favor de aviso a la administración"
                Exit Function
           End If
            
           Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
           Case "administracion", "administracion.cajapuesto"
                ' no hacemos nada
           Case Else
                ' Version 4.7 VERIFICAR EL PROCEDIMIENTO
               If Not grabarPuesto() Then
                   objbasededatos.RollBackTrans
                   Exit Function
               End If
           End Select
           
           
           ' Codigo agregado en la versión 2.5
           Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
           Case "administracion.cajapuesto"
           
                objComprobante.nrTalonario = ObtenerCampo("nrTalonario").Text
                objComprobante.nrComprobante = ObtenerCampo("nrComprobante").Text
                objComprobante.tpComprobante = ObtenerCampo("tpComprobante").Text
                objComprobante.tpLetra = ObtenerCampo("tpLetra").Text
                objComprobante.nrCierre = objParametros.ObtenerValor("Frm_VentasPasajes.nrCierre")
            
                objComprobante.tpModificacionCajaPuesto = "Agregado"
                objComprobante.dsObservacionCajaPuesto = strMotivo
                ' Grabar el motivo de la Eliminación
                If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                    Exit Function
                End If
                
                objCajas.nrCaja = objParametros.ObtenerValor("Frm_VentaPasajes.nrCaja")
                If Not objCajas.ActualizarDiferenciaSaldoCajaPuesto() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: " + objCajas.Error, vbCritical + vbDefaultButton1, "Atención"
                    Exit Function
                End If
                
            End Select
            
           On Error Resume Next
           objbasededatos.CommitTrans
           If Err Then
               objbasededatos.RollBackTrans
               lerror = "Error: no se pudo insertar el registro, " _
              + ObjTablasIO.Error
               ' si da error salimos
               Exit Function
           End If
           On Error GoTo 0
           If objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion") = "manual" Then
                Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
                Case "administracion.cajapuesto"
                    Frm_DetalleCajaPuesto.cmdCargarDatosCajaPuesto
                End Select
                MsgBox "Factura Manual Cargada.", vbInformation + vbDefaultButton1, "Atención"
           Else
                ImprimirFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante"), ObtenerCampo("tpComprobante"), ObtenerCampo("tpLetra"), objParametros.ObtenerValor("FormatoHoja")
           End If
    Else
         objbasededatos.RollBackTrans
         lerror = "Error: no se pudo insertar el registro, " _
         + ObjTablasIO.Error + "." + vbCrLf + "Repita la acción, en caso de volver a obtener error comuníquese con el administrador."
         ' si da error salimos
         Exit Function
    End If
    
    FacturarBD = True


End Function

' Version 4.7 VERIFICAR EL PROCEDIMIENTO
' MDY Modificado en la version 4.7
Private Function grabarPuesto() As Boolean

        grabarPuesto = False

        '***********************************************************
        objSPs.nmStoredProcedure = "spu_actualizar_puntosdeventa_facturacion_v4_9_71"
        objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
        objSPs.setearCampoValor "@tipo_iva", ObtenerCampo("tpIVA").Text
        objSPs.setearCampoValor "@auto_impresor", IIf(UCase(objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion")) = "MANUAL", "N", "S")
        objSPs.setearCampoValor "@tpFormadePago", ObtenerCampo("tpFormadePago").Text
        objSPs.setearCampoValor "@tpComprobante", ObtenerCampo("tpComprobante").Text
        objSPs.setearCampoValor "@nrComprobante", CStr(CLng(ObtenerCampo("nrComprobante")))
    
        If Not objSPs.ExecSP Then
            MsgBox "No se puedo actualizar el numero de comprobante " + _
                   vbCrLf + " para el puesto o punto de venta que ingresó al sistema.", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        
        grabarPuesto = True
           
End Function

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
'            Select Case ObtenerCampo("tpComision").Text
'            Case "A Empleados"
'                resp = MsgBox("Ha cambiado el tipo de comisión 'A Empleados', este cambio reduce la comisión de la cooperativa." + _
'                       vbCrLf + "Confirma este cambio.", vbQuestion + vbYesNo, "Atención")
'                If resp = vbNo Then
'                    Me.Combox1(Index).ListIndex = 1
'                End If
'                Recalculo_operaciones
'            Case "A Clientes"
'                Recalculo_operaciones
'            Case "Retorno"
'                If ObtenerCampo("cdCondVenta").Text <> "Retorno" Then
'                    ObtenerCampo("cdCondVenta").Text = "Retorno"
'                End If
'            End Select
    Case "cdCondVenta"
       Select Case ObtenerCampo("cdCondVenta").Text
       Case "Retorno"
            ObtenerCampo("tpComision").Text = "Retorno"
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            HabilitarCampos "vlPagoReales", False
            ObtenerCampo("vlPagoReales").Text = "0,00"
       Case "Tarjeta de Débito", "Tarjeta de Crédito", "Todo Pago"
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            HabilitarCampos "vlPagoReales", False
            ObtenerCampo("vlPagoReales").Text = "0,00"
       Case "Cuenta Corriente"
            ObtenerCampo("tpComision").Locked = False
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            HabilitarCampos "vlPagoReales", False
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            ObtenerCampo("vlPagoReales").Text = "0,00"
       Case "Cobro en Destino"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            HabilitarCampos "vlPagoReales", False
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            ObtenerCampo("vlPagoReales").Text = "0,00"
       Case Else
            HabilitarCampos "vlPagoEuros", True
            HabilitarCampos "vlPagoDolares", True
            HabilitarCampos "vlPagoPesos", True
            HabilitarCampos "vlPagoReales", True
        End Select
        ' agregado en la version 4.9
        calcularTotalesFactura
            ' Version 1.4
    Case "tpIVA" ' Alteración de la condición de IVA
        ' CF , RI, NR, MT, EX, OT

    
        obtener_num_Proxima_Factura
        
        Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
        Case "administracion", "administracion.cajapuesto"
            If objParametros.ObtenerValor("Frm_VentaPasajes.numeracion_correlativa") = "NO" Then
                ExisteComprobante
            End If
        End Select

        Select Case ObtenerCampo("tpIVA")
        Case "RI"
            If ObtenerCampo("cdCliente") = "1" Then
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("dsRazonSocial") = ""
                ObtenerCampo("nrDoc") = ""
                ObtenerCampo("dsEmail") = ""
                ObtenerCampo("dsRazonSocial").SetFocus
            Else
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("dsProductoBuscado").SetFocus
            End If
        End Select
        calcularTotalesFactura
        If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
           ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" Then
            CalcularSaldos "vlTotalPesos"
        End If
    End Select

    ' llamada 1
    Me.lblComision.Caption = "Comisión: $ " + FormatNumber(objComision.obtenerComision(CSng(ObtenerCampo("vlTotalGeneral")), ObtenerCampo("cdCondVenta").Text, ObtenerCampo("tpComision").Text, obtenerGrillaDatosLiquidaComision(), ObtenerCampo("tpComprobante").Text), 2)
    
End Sub

' en desuso a partir de la version 4.1
'Private Function obtenerlistadecodigosdestinos() As String
'Dim i            As Integer
'Dim dsCodigosDestinos As String
'
'        dsCodigosDestinos = ""
'        If Me.lstItemsFactura.ListItems.Count > 0 Then
'            For i = 1 To Me.lstItemsFactura.ListItems.Count
'                    If Me.lstItemsFactura.ListItems.Item(i).Text <> "(Nuevo)" Then
'                        dsCodigosDestinos = dsCodigosDestinos + Me.lstItemsFactura.ListItems.Item(i).Text
'                    End If
'            Next
'        End If
'
'        obtenerlistadecodigosdestinos = dsCodigosDestinos
'End Function


'  creado en la version 4.1
Private Function obtenerGrillaDatosLiquidaComision() As String
Dim i            As Integer
Dim strDatosLiquidaComision As String


        If Me.lstItemsFactura.ListItems.Count < 1 Then Exit Function
        
 
        strDatosLiquidaComision = ""
        For i = 1 To Me.lstItemsFactura.ListItems.Count
            strDatosLiquidaComision = strDatosLiquidaComision + "|'" + objControl.buscarListviewValorColumnaIndice(Me.lstItemsFactura, "tpOperacion", i) + "',"
            strDatosLiquidaComision = strDatosLiquidaComision + IIf(objControl.buscarListviewValorColumnaIndice(Me.lstItemsFactura, "cdComision", i) = "", "null", objControl.buscarListviewValorColumnaIndice(Me.lstItemsFactura, "cdComision", i)) + ","
            strDatosLiquidaComision = strDatosLiquidaComision + objbasededatos.FormatearValorSQL(IIf(objControl.buscarListviewValorColumnaIndice(Me.lstItemsFactura, "vlPrecioViaje", i) = "", "null", objControl.buscarListviewValorColumnaIndice(Me.lstItemsFactura, "vlPrecioViaje", i)), "DOUBLE")
            
        Next
    
        obtenerGrillaDatosLiquidaComision = Right(strDatosLiquidaComision, Len(strDatosLiquidaComision) - 1)
        
End Function

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
            If ObtenerCampo("tpComprobante").Text = "FA" Then
                ObtenerCampo("nrLicencia").SetFocus
            Else
                ObtenerCampo("dsLeyenda").SetFocus
            End If
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
Dim strValor  As String

    objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                              Me.Combox1(Index), "LostFocus"

    Select Case Me.Combox1(Index).Tag
    Case "tpComision"
'            Select Case ObtenerCampo("tpComision").Text
'            Case "A Empleados"
'                Recalculo_operaciones
'            Case "A Clientes"
'                Recalculo_operaciones
'            Case "Retorno"
'            End Select
    Case "cdCondVenta"
       Select Case ObtenerCampo("cdCondVenta").Text
       Case "Retorno", "Tarjeta de Débito", "Tarjeta de Crédito", "Todo Pago"
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
       Case "Cuenta Corriente"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
       Case "Cobro en Destino"
            HabilitarCampos "vlPagoEuros", False
            HabilitarCampos "vlPagoDolares", False
            HabilitarCampos "vlPagoPesos", False
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
       Case Else
            HabilitarCampos "vlPagoEuros", True
            HabilitarCampos "vlPagoDolares", True
            HabilitarCampos "vlPagoPesos", True
        End Select
    End Select
    
End Sub


Private Sub Command1_Click()

    ObtenerCampo("cdCliente").Text = "(Nuevo)"
    ObtenerCampo("nmNombre").SetFocus
    
End Sub




Private Sub DTPicker1_KeyDown(KeyCode As Integer, Shift As Integer)

  Select Case KeyCode
  Case vbKeyReturn
        If ObtenerCampo("tpComprobante") = "FA" Then
            ObtenerCampo("cdcliente").SetFocus
        Else
            ObtenerCampo("dsProductoBuscado").SetFocus
        End If
  Case vbKeyBack
    ObtenerCampo("nrComprobante").SetFocus
  End Select
    
End Sub

Private Sub DTPicker1_KeyPress(KeyAscii As Integer)

    
  Select Case KeyAscii
  Case vbKeyReturn
    If ObtenerCampo("tpComprobante") = "FA" Then
        ObtenerCampo("cdcliente").SetFocus
    Else
        ObtenerCampo("dsProductoBuscado").SetFocus
    End If
  Case vbKeyBack
    ObtenerCampo("nrComprobante").SetFocus
  End Select
    
End Sub


Private Sub Form_Activate()

    ' MsgBox "ingreso al Form_Activate"

    If objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion") = "manual" Then
        Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
        Case "puesto"
            If ObtenerCampo("tpComprobante").Text = "FA" Then
                Me.Caption = Me.Caption + " - Carga de Comprobantes MANUALES"
                MsgBox "Desde aquí solo se pueden cargar los comprobantes manuales. " + vbCrLf + "Verifique que la numeración del talonario físico coincida con la que se muestra en pantalla, si no es así no realice la carga.", vbInformation, "Atención"
                Me.BackColor = Rojo
            End If
        End Select
    End If
    
    On Error Resume Next
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "puesto"
        If ObtenerCampo("tpComprobante").Text = "ND" Or ObtenerCampo("tpComprobante").Text = "NC" Then
            ObtenerCampo("cdCliente").SetFocus
        Else
            ObtenerCampo("dsProductoBuscado").SetFocus
        End If
    Case Else
        If ObtenerCampo("tpComprobante").Text = "ND" Or ObtenerCampo("tpComprobante").Text = "NC" Then
            Me.cbTipoFacturacion.Text = objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion")
        End If
        ObtenerCampo("nrComprobante").SetFocus
    End Select
    On Error GoTo 0
    
    
    ' MsgBox "ingreso al Form_Activate"
    
    
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
Dim strSQL     As String
Dim strValor   As String
Dim strSQL_Params As String

    
    
    
    PORC_RECARGO_TD = objParametros.ObtenerValorBD("PORC_RECARGO_TD")
    PORC_RECARGO_TC = objParametros.ObtenerValorBD("PORC_RECARGO_TC")
    PORC_RECARGO_TP = objParametros.ObtenerValorBD("PORC_RECARGO_TP")
        
    objProductos.PORC_RECARGO_TC = PORC_RECARGO_TC
    objProductos.PORC_RECARGO_TD = PORC_RECARGO_TD
    objProductos.PORC_RECARGO_TP = PORC_RECARGO_TP
    
        '-- ADD Version  4.7
    
    Me.Caption = objParametros.ObtenerValor("Frm_VentaPasajes.TituloPrincipal")

    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "puesto"
        Me.DTPicker1.Visible = False
        Me.DTPicker1.Tag = ""
    Case Else
        ObtenerCampo("dtComprobante").Visible = False
        ObtenerCampo("dtComprobante").Tag = ""
        Me.DTPicker1.Visible = True
        Me.DTPicker1.Tag = "dtComprobante"
    End Select
    
    objParametros.GrabarValor "Facturar", "NO"
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.modo")
    Case "Facturar"
        EstadoABM = facturar
    Case Else
        EstadoABM = Consulta
    End Select
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    
    ' traer los datos de tabla a memoria
    objDiccionariodeDatos.ObtenerCampo "TB_Comprobantes", "nrComprobante"
    
    
    limpiarControles
    SelecionarItemCombo
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")

End Sub






Private Sub obtener_num_Proxima_Factura()
Dim strSQL      As String
Dim strValor    As String
    
    
    ObtenerCampo("tpComprobante") = objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante")

    If ObtenerCampo("tpComprobante").Text = "ND" Or ObtenerCampo("tpComprobante").Text = "NC" Then
        Me.cbTipoFacturacion.Locked = False
    Else
        Me.cbTipoFacturacion.Locked = True
    End If
    
     
    '***********************************************************
    ' Modificación version 1.4
    objSPs.nmStoredProcedure = "spu_obtener_puntosdeventa_facturacion_v4_9_71"
    objSPs.setearCampoValor "@nrPuesto_param", CStr(objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    objSPs.setearCampoValor "@tipo_iva", ObtenerCampo("tpIVA").Text
    objSPs.setearCampoValor "@auto_impresor", IIf(UCase(objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion")) = "MANUAL", "N", "S")
    objSPs.setearCampoValor "@tpFormadePago", ObtenerCampo("tpFormadePago").Text
    objSPs.setearCampoValor "@tpComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante")

    If Not objSPs.ExecSP Then
        MsgBox "No se encuentra definido el número de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingresó al sistema." + vbCrLf + " Error extendido: " + objSPs.Error, vbCritical + vbDefaultButton1, "Atención"
        Unload Me
        Exit Sub
    End If
           
    strValor = Trim(objbasededatos.rs_resultados("nrTalonario"))
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrTalonario", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
    strValor = Trim(objbasededatos.rs_resultados("nrComprobante"))
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
    strValor = Trim(objbasededatos.rs_resultados("tpLetra"))
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "tpLetra", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
    
    ' COMENTADO VERSION 4.7
    strValor = objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "tpComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
    
    
    ' agregado en la version 1.8  - autoimpresion Empresas RI
    strValor = Trim(objbasededatos.rs_resultados_valor("nrCAI"))
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrCAI", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
    strValor = Trim(objbasededatos.rs_resultados_valor("dtCAI"))
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "dtVencimiento", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor

    flFacturaCtacte = objbasededatos.rs_resultados_valor("flFacturaCtacte")
    
    ' VERSION 4.7 VERIFICAR LA SIGUIENTE LOGICA DE OBTENCION DE PROXIMO NUMERO
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion", "administracion.cajapuesto"
        If objParametros.ObtenerValor("Frm_VentaPasajes.numeracion_correlativa") = "NO" Then
            ' ObtenerCampo("nrComprobante").Text = ""
        Else
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
        End If
    Case Else
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
    End Select
    
    strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
    
    '/* REM Version 4.7 */
    strValor = objDiccionariodeDatos.ObtenerValorActual("TB_Comprobantes", "tpComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObtenerCampo("tpComprobante").Text = strValor
    
    strValor = objDiccionariodeDatos.ObtenerValorActual("TB_Comprobantes", "tpLetra", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObtenerCampo("tpLetra").Text = strValor
    '***********************************************************
    
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



    HabilitarCampos "dsProducto", False
    HabilitarCampos "vlPorcentaje", False
    HabilitarCampos "vlPrecioViaje", False
    HabilitarCampos "vlPrecioPeaje", False
    HabilitarCampos "vlKilometros", False
    HabilitarCampos "tpOperacion", False
    
            
    ObtenerCampo("dsProducto").Text = ""
    ObtenerCampo("vlPorcentaje").Text = ""
    ObtenerCampo("vlPrecioViaje").Text = ""
    ObtenerCampo("vlPrecioPeaje").Text = ""
    ObtenerCampo("vlKilometros").Text = ""
    ObtenerCampo("tpOperacion").Text = ""
    ObtenerCampo("cdComision").Text = ""
    
    ObtenerCampo("vlPrecioTC").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlPrecioTC)
    ObtenerCampo("vlPrecioTD").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlPrecioTD)
    ObtenerCampo("vlPrecioTP").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlPrecioTP)
    
    ObtenerCampo("vlRecargoTC").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlRecargoTC)
    ObtenerCampo("vlRecargoTD").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlRecargoTD)
    ObtenerCampo("vlRecargoTP").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlRecargoTP)
    
    Me.cmdAgregarItemFactura.Enabled = False
    
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
            setearCondicionVentayComision
            Recalculo_operaciones
        End If
    Case vbKeyBack
        ObtenerCampo("dsProductoBuscado").SetFocus
    Case vbKeyReturn
        ObtenerCampo("cdCondVenta").SetFocus
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
           obtener_num_Proxima_Factura
           
           ' Modificación EZE II - VER LOAD DE FORMULARIO
           ' strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
           'ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
           'strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
           'ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
           
           ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("Frm_VentaPasajes.nrCaja")
           ObtenerCampo("nrPuesto").Text = objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
           ObtenerCampo("nmEmpleado").Text = objUsuario.nmEmpleado
           lblCotizacionDia.Caption = "Cotizaciones del Día: Euro " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro")), 2)) + " "
           lblCotizacionDia.Caption = lblCotizacionDia.Caption + " Dolar " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar")), 2)) + " "
             lblCotizacionDia.Caption = lblCotizacionDia.Caption + " Real " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal")), 2)) + " "
           objProductos.CargarTodalaMatrizdeProductos Me.lstBusquedaProductos
           ' PresentarPantalla Button
           AvisarError "nrLicencia", False
           AvisarError "cdCliente", False
           AvisarError "nrPasajeros", False
           ObtenerCampo("cdCliente").Text = "1"
           ObtenerCampo("dsRazonSocial").Text = "Consumidor Final"
           ObtenerCampo("tpIVA").Text = "CF"
           setearCondicionVentayComision
           ' cargarCondVentas ObtenerCampo("cdCliente").Text
           PresentarPantalla Button
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
         cmdFacturar_Click
    Case "Cancelar"
           Sleep (100)
           If EstadoABM = facturar Then
                EstadoABM = facturar
                '/****************************************************/
                '/* Version 1.9                                      */
                Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
                Case "administracion"
                  frm_SeleccionarPuesto.Show vbModal
                  ' Seleccionar el numero de puesto
                  If objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto") = "" Then
                      Unload Me
                      Exit Sub
                  End If
                  objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto")
                End Select
                '/****************************************************/
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
        Me.lstItemsFactura.ListItems.Item(i).ListSubItems(const_dsProducto).Text
    Next

    ConcatenarDestinos = Mid(strDato, 1, 100)

End Function

         

Private Function FormadepagoOK() As Boolean

    FormadepagoOK = True
         
End Function


Private Function validarEntradadedatos() As Boolean
    
    validarEntradadedatos = True
    
    '/*Agregado en la version 4.1 */
    If ObtenerCampo("cdCondVenta").Text = "Cuenta Corriente" Then
        If Not flFacturaCtacte Then
            MsgBox "El puesto no tiene permiso para facturar en cuenta corriente.", vbCritical, "Atención"
            ObtenerCampo("cdCliente").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
    End If
    

    If ObtenerCampo("nrTalonario") = "0000" Then
        MsgBox "El talonario ingresado no es válido, por favor comuníquese con el administrador del sistema.", vbCritical, "Atención"
        AvisarError "nrTalonario", True
        validarEntradadedatos = False
    End If

    
    If ObtenerCampo("nrComprobante") = "" Or ObtenerCampo("nrComprobante") = "00000000" Or (Not IsNumeric(ObtenerCampo("nrComprobante"))) Then
        MsgBox "El número de comprobnate ingresado no es válido.", vbCritical, "Atención"
        AvisarError "nrComprobante", True
        validarEntradadedatos = False
    End If
    
    
    ' MsgBox "implementar fecha de vencimiento de CAI verificarVencimientoCAI", vbCritical
    
    ' validación incluida en la versión 1.8
    ' validación de talonarios automáticos
    If objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion") = "automatica" Then
        '/* agregado en la version 4.6 */
        If ObtenerCampo("tpLetra").Text <> "X" Then ' modificado v4.7
            If Not objAFIP.verificarCAI(objDiccionariodeDatos.ObtenerValorActual("TB_Comprobantes", "nrCAI", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))) Then
                MsgBox "El número de CAI del talonario no es válido, no se puede realizar la factura, comuníquese con el administrador del sistema.", vbCritical, "Atención"
                validarEntradadedatos = False
                Exit Function
            End If
            
            '/* agregado en la version 4.6 */
            If Not objAFIP.verificarVencimientoCAI(objDiccionariodeDatos.ObtenerValorActual("TB_Comprobantes", "dtVencimiento", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))) Then
                MsgBox "El número de CAI del talonario ha vencido, no se puede realizar la factura, comuníquese con el administrador del sistema.", vbCritical, "Atención"
                validarEntradadedatos = False
                Exit Function
            End If
        End If
        
    End If
    

    If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
       ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" And _
       ObtenerCampo("cdCondVenta").Text <> "Retorno" And _
       ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Débito" And _
       ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Crédito" And _
       ObtenerCampo("cdCondVenta") <> "Todo Pago" Then
        If ObtenerValoresNumericos("vlPagoEuros") + ObtenerValoresNumericos("vlPagoDolares") + ObtenerValoresNumericos("vlPagoPesos") + ObtenerValoresNumericos("vlPagoReales") <= 0 Then
            MsgBox "Debe ingresar los valores de pago.", vbCritical + vbDefaultButton1, "Atención"
            AvisarError "vlPagoPesos", True
            validarEntradadedatos = False
        End If
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
    
    
    If Me.lstItemsFactura.ListItems.Count <= 0 Then
        MsgBox "Debe seleccionar el destino del viaje.", vbInformation + vbDefaultButton1, "Atención"
        Me.lstBusquedaProductos.SetFocus
        validarEntradadedatos = False
    End If

    If ObtenerCampo("tpIVA").Text = "RI" Or ObtenerCampo("tpComprobante").Text = "ND" Or _
                                ObtenerCampo("tpComprobante").Text = "NC" Then
        
        If ObtenerCampo("dsRazonSocial").Text = "" Or _
            ObtenerCampo("dsRazonSocial").Text = "Consumidor Final" Then
            MsgBox "Debe ingresar una razón social.", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "dsRazonSocial", True
            ObtenerCampo("dsRazonSocial").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
        
        If ObtenerCampo("nrDoc").Text = "" Then
            MsgBox "Debe ingresar el CUIT.", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "nrDoc", True
            ObtenerCampo("nrDoc").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
            
    End If
    
    If Me.flClienteNuevo.value = vbChecked Then
    
        If ObtenerCampo("dsRazonSocial").Text = "" Or _
            ObtenerCampo("dsRazonSocial").Text = "Consumidor Final" Then
            MsgBox "Debe ingresar una razón social.", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "dsRazonSocial", True
            ObtenerCampo("dsRazonSocial").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
        
        If ObtenerCampo("nrDoc").Text = "" Then
            MsgBox "Debe ingresar el CUIT.", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "nrDoc", True
            ObtenerCampo("nrDoc").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
        
        ' comentada en la version 3.7
'        If ObtenerCampo("dsEmail").Text = "" Then
'            MsgBox "Debe ingresar el e-mail.", vbInformation + vbDefaultButton1, "Atención"
'            AvisarError "dsEmail", True
'            ObtenerCampo("dsEmail").SetFocus
'            validarEntradadedatos = False
'            Exit Function
'        End If
        
        
    End If
    
    
    
    If CSng(ObtenerCampo("vlPagoPesos").Text) > CSng(objParametros.ObtenerValorBD("MONTO_EXIGE_CUIT_CUIL")) Then
        If ObtenerCampo("nrDoc").Text = "" Then
            MsgBox "El monto de la factura supera los $" + objParametros.ObtenerValorBD("MONTO_EXIGE_CUIT_CUIL") + ". Debe ingresar los datos del cliente y el CUIT o CUIL .", vbInformation + vbDefaultButton1, "Atención"
            AvisarError "nrDoc", True
            ObtenerCampo("nrDoc").SetFocus
            validarEntradadedatos = False
            Exit Function
        End If
    End If
    
    
    Dim strSQL As String
     
    
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion.cajapuesto"
        '/************************************************************************/
        '/* INICIO agregado en la version 4.9.71                                                                 */
        strSQL = "spu_validarNroComprobanteManual_v4_9_71"
        strSQL = strSQL + " @nrTalonario_param   = '" + Trim(ObtenerCampo("nrTalonario")) + "',"
        strSQL = strSQL + "@nrComprobante_param = '" + Trim(ObtenerCampo("nrComprobante")) + "',"
        strSQL = strSQL + "@tpComprobante_param = '" + Trim(ObtenerCampo("tpComprobante")) + "',"
        strSQL = strSQL + "@tpLetra_param = '" + Trim(ObtenerCampo("tpLetra")) + "',"
        strSQL = strSQL + "@dtComprobante_param= '" + CStr(ObtenerCampo("dtComprobante")) + "'"
         
        If Not objbasededatos.ExecStoredProcedures(strSQL) Then
            MsgBox "No se podido validar el comprobante (1), no se puede modificar el comprobante.", vbInformation, "Atención"
            validarEntradadedatos = False
            Exit Function
        End If
        
        If objbasededatos.rs_resultados.EOF Then
                MsgBox "No se podido validar el comprobante (2), no se puede modificar el comprobante.", vbInformation, "Atención"
            validarEntradadedatos = False
            Exit Function
        End If
        
        If objbasededatos.rs_resultados("resultado") = "ERROR" Then
            MsgBox objbasededatos.rs_resultados("DescripcionError"), vbInformation, "Atención"
            validarEntradadedatos = False
            Exit Function
        End If
        objbasededatos.rs_resultados.Close
    End Select
    
End Function




Private Function GrabarItemsFactura() As Boolean
Dim i     As Integer

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        
        ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "<-", ObtenerCampo("tpLetra").Text ' MOD Version 4.7
        ObjTablasIO.setearCampoOperadorValor "nrItem", "<-", CStr(i)
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", IIf(Me.lstItemsFactura.ListItems(i).Text = "(Nuevo)", "null", Me.lstItemsFactura.ListItems(i).Text)
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_dsProducto)
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_tpOperacion)
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(Const_vlPorcentaje)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(Const_vlPrecioPeaje)
        ObjTablasIO.setearCampoOperadorValor "vlKilometros", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlKilometros)
        
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlTotalViajes)
        
        ' campos de la version 4.9
        ObjTablasIO.setearCampoOperadorValor "vlPrecioTC", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlPrecioTC)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioTD", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlPrecioTD)
        ObjTablasIO.setearCampoOperadorValor "vlRecargoTC", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlRecargoTC)
        ObjTablasIO.setearCampoOperadorValor "vlRecargoTD", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlRecargoTD)
        ObjTablasIO.setearCampoOperadorValor "vlRecargoTP", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlRecargoTP)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioTP", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlPrecioTP)
        
        
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Date)
        ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
        ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", ObtenerCampo("nrCaja").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", ObtenerCampo("nrPuesto").Text
        
        If ObjTablasIO.Insertar() Then
            GrabarItemsFactura = True
        Else
            GrabarItemsFactura = False
        End If
    Next

End Function




Private Sub GrabarItemsFactura_Imprime()
Dim i     As Integer

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        
        ObjTablasIO.nmTabla = "TB_ComprobantesDetalle_Imprime"
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "<-", ObtenerCampo("tpLetra").Text  ' MOD version 4.7
        ObjTablasIO.setearCampoOperadorValor "nrItem", "<-", CStr(i)
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", Me.lstItemsFactura.ListItems(i).Text
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_dsProducto)
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_tpOperacion)
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(Const_vlPorcentaje)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(Const_vlPrecioPeaje)
        ObjTablasIO.setearCampoOperadorValor "vlKilometros", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlKilometros)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(const_vlTotalViajes)
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Now)
               
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
        vlComision = objComision.obtenerComision(CSng(ObtenerCampo("vlTotalGeneral").Text), ObtenerCampo("cdCondVenta").Text, ObtenerCampo("tpComision").Text, obtenerGrillaDatosLiquidaComision(), ObtenerCampo("tpComprobante").Text)
        
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "<-", ObtenerCampo("tpLetra").Text  ' MOD Version 4.7
        
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", ObtenerCampo("cdCliente").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", ObtenerCampo("nrPuesto").Text
        ObjTablasIO.setearCampoOperadorValor "nrLicencia", "<-", ObtenerCampo("nrLicencia").Text
        ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "<-", ObtenerCampo("nmLicenciatario").Text
        ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "<-", ObtenerCampo("vlTotalGeneral").Text
        
      
        ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "<-", ObtenerCampo("vlPagoPesos").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "<-", ObtenerCampo("vlPagoDolares").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "<-", ObtenerCampo("vlPagoEuros").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoReales", "<-", ObtenerCampo("vlPagoReales").Text
        
        
        ObjTablasIO.setearCampoOperadorValor "nrCantidadBultos", "<-", ObtenerCampo("nrBultos").Text
        ObjTablasIO.setearCampoOperadorValor "tpCupon", "<-", ObtenerCampo("cdCondVenta").Text
        ObjTablasIO.setearCampoOperadorValor "dsDestino", "<-", ConcatenarDestinos()
        ObjTablasIO.setearCampoOperadorValor "dsHoraViaje", "<-", CStr(Format(Now, "HH:MM"))
        ObjTablasIO.setearCampoOperadorValor "dsLeyenda", "<-", ObtenerCampo("dsLeyenda").Text
              
        Select Case ObtenerCampo("cdCondVenta").Text
        Case "Contado"
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "dtCobradoalCliente", "<-", CStr(Now)
            ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlaFavordelLicenciatario", _
                        "<-", CSng(ObtenerCampo("vlTotalGeneral").Text) - vlComision
            ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlComision", "<-", CStr(vlComision)
        Case "Cuenta Corriente", "Tarjeta de Débito", "Tarjeta de Crédito", "Todo Pago"
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
        
        
        ObjTablasIO.setearCampoOperadorValor "dtCajaCliente", "<-", CStr(Now)
        ObjTablasIO.setearCampoOperadorValor "nrCajaCliente", "<-", ObtenerCampo("nrCaja").Text
        
        
        Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
        Case "puesto"
            ObjTablasIO.setearCampoOperadorValor "dtCupon", "<-", CStr(Now)
        Case Else
            ObjTablasIO.setearCampoOperadorValor "dtCupon", "<-", CStr(ObtenerCampo("dtComprobante")) + " " + Format(Time, "HH:MM:00")
        End Select
        
        ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", objUsuario.dsUsuario
        ObjTablasIO.setearCampoOperadorValor "nrPasajeros", "<-", ObtenerCampo("nrPasajeros").Text
        
        ' para la sincronizacion
        ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
        
        ' para el calculo de IVA
        ObjTablasIO.setearCampoOperadorValor "vlIVA", "<-", ObtenerCampo("vlIVA").Text
        ObjTablasIO.setearCampoOperadorValor "vlSubtotal", "<-", ObtenerCampo("vlSubtotal").Text
        
        
        cdCodBar = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
        cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
        cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrLicencia").Text, 3)
    
        ObjTablasIO.setearCampoOperadorValor "cdCodBar", "<-", cdCodBar
        
        '/* Versión 2.7 */
        objSPs.nmStoredProcedure = "SP_ObtenerMaxnrCupon_v2_7"
        ' version 2.7 objSPs.setearCampoValor "@nrPuesto", objParametros.ObtenerValor("nrPuesto")
        If Not objSPs.ExecSP() Then

            Exit Function
        End If
                
        strValor = CStr(objbasededatos.rs_resultados("nrMaxCupon").value)
        objDiccionariodeDatos.GuardarValorCampo "TB_Cupones", "nrCupon", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"), strValor
        
        strValor = CStr(CDbl(strValor) + 1)
        
        txtnrCupon.Text = strValor
        ObjTablasIO.setearCampoOperadorValor "nrCupon", "<-", strValor
        
        ObjTablasIO.setearCampoOperadorValor "nrTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrTarjeta")
        ObjTablasIO.setearCampoOperadorValor "tpDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.tpDocTarjeta")
        ObjTablasIO.setearCampoOperadorValor "nrDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrDocTarjeta")
        
        ObjTablasIO.setearCampoOperadorValor "vlRecargoTarjeta", "<-", ObtenerCampo("vlRecargoTarjeta").Text
        
        If ObjTablasIO.Insertar() Then
            objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCupon", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
            GrabarTabladeCupones = True
        Else
            GrabarTabladeCupones = False
        End If
        
End Function





Private Function ActualizarCaja() As Boolean
Dim i     As Integer
Dim strValor As String
Dim vlSaldoFinalPesos As Single
Dim vlSaldoFinalDolares As Single
Dim vlSaldoFinalEuros As Single
Dim vlSaldoFinalReales As Single


    ActualizarCaja = False
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalReales", "->", ""
    
    
    If Not ObjTablasIO.Seleccionar Then
        ActualizarCaja = False
        Exit Function
    End If
    
    If Not ObjTablasIO.rs_resultados.EOF Then
            vlSaldoFinalPesos = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalPesos").value, "0")
            vlSaldoFinalDolares = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalDolares").value, "0")
            vlSaldoFinalEuros = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalEuros").value, "0")
            vlSaldoFinalReales = AdaptarNulos(ObjTablasIO.rs_resultados("vlSaldoFinalReales").value, "0")
            
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
            If ObtenerCampo("vlPagoReales").Text = "" Then
                ObtenerCampo("vlPagoReales").Text = "0"
            End If
            vlSaldoFinalPesos = vlSaldoFinalPesos + CSng(ObtenerCampo("vlPagoPesos").Text)
            vlSaldoFinalDolares = vlSaldoFinalDolares + CSng(ObtenerCampo("vlPagoDolares").Text)
            vlSaldoFinalEuros = vlSaldoFinalEuros + CSng(ObtenerCampo("vlPagoEuros").Text)
            vlSaldoFinalReales = vlSaldoFinalReales + CSng(ObtenerCampo("vlPagoReales").Text)
    End If
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "<-", CStr(vlSaldoFinalPesos)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalDolares", "<-", CStr(vlSaldoFinalDolares)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalReales", "<-", CStr(vlSaldoFinalReales)
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalEuros", "<-", CStr(vlSaldoFinalEuros)
    
    If ObjTablasIO.Actualizar Then
        ActualizarCaja = True
    Else
        ActualizarCaja = False
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
            ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).SubItems(const_dsProducto)
            ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).SubItems(const_tpOperacion)
            ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(Const_vlPrecioPeaje)
            ObjTablasIO.setearCampoOperadorValor "vlKilometros", "<-", Me.lstItemsFactura.ListItems(i).SubItems(const_vlKilometros)
            ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(const_vlTotalViajes)
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Productos", "cdProducto", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
            ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", strValor
            ObjTablasIO.Insertar
            
            objProductos.InsertarNuevoItemEnlaMatrizProductos _
                strValor, _
                Me.lstItemsFactura.ListItems(i).SubItems(const_dsProducto), _
                Me.lstItemsFactura.ListItems(i).SubItems(Const_vlPrecioPeaje), _
                Me.lstItemsFactura.ListItems(i).SubItems(const_vlTotalViajes), _
                "0,00", _
                Me.lstItemsFactura.ListItems(i).SubItems(const_tpOperacion), _
                Me.lstItemsFactura.ListItems(i).SubItems(const_vlKilometros)

            objDiccionariodeDatos.GuardarSiguienteValor "TB_Productos", "cdProducto", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
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
        ObjTablasIO.setearCampoOperadorValor "cdComprobante", "=", ObtenerCampo("cdComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
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
Dim strSQL       As String

    ' obtener  el ultimo numero de factura
    obtener_num_Proxima_Factura
    
        
    If UCase(ObtenerCampo("tpLetra").Text) = "X" Then
        ObtenerCampo("tpComprobante").Text = "RE"  ' Recibo
    End If
    
    

    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "puesto"
        ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
    End Select
    
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

    For Each Control In Me.Combox1
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
                
    Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
    Case "administracion", "administracion.cajapuesto"
        ObjTablasIO.setearCampoOperadorValor _
              "dtComprobante", "<-", ObtenerCampo("dtComprobante").value
    End Select
    
    cdCodBarAFIP = ObtenerCodBarrasAFIP()
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional3", "<-", cdCodBarAFIP
    
    cdCodBarLic = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(ObtenerCampo("nrLicencia").Text, 3)
    
    ObjTablasIO.setearCampoOperadorValor _
              "cdCodBar", "<-", cdCodBarLic
    
    ObjTablasIO.setearCampoOperadorValor _
              "dtCaja", "<-", CStr(Now)
    ObjTablasIO.setearCampoOperadorValor _
              "dtInsercion", "<-", CStr(Now)
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional1", "<-", CStr(Format(Now, "HH:MM"))
              

    ' validado en la version 1.8
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "nrCAI", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObjTablasIO.setearCampoOperadorValor _
    "nrCAI", "<-", strValor
    
    ' validado en la version 1.8
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "dtVencimiento", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObjTablasIO.setearCampoOperadorValor _
    "dtVencimiento", "<-", strValor
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaDolar", "<-", objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar")
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaEuro", "<-", objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro")
              
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaReal", "<-", objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal")
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional2", "<-", ConcatenarDestinos()
              
    
    ' REM ObjTablasIO.setearCampoOperadorValor _
    ' REM           "tpLetra", "<-", ObtenerCampo("tpLetra").Text   ' MOD Version 4.7
              
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsUsuario", "<-", objUsuario.dsUsuario
    
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    
    
    If objParametros.ObtenerValor("Frm_VentaPasajes.tipofacturacion") = "automatica" Then
        ObjTablasIO.setearCampoOperadorValor "flManual", "<-", "N"
    Else
        ObjTablasIO.setearCampoOperadorValor "flManual", "<-", "M"
    End If
    
    ObjTablasIO.setearCampoOperadorValor "nrTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrTarjeta")
    ObjTablasIO.setearCampoOperadorValor "tpDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.tpDocTarjeta")
    ObjTablasIO.setearCampoOperadorValor "nrDocTarjeta", "<-", objParametros.ObtenerValor("Frm_VentaViajesTotales.nrDocTarjeta")
    
    ' Datos agregados en la version 4.9
    
    
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
                If ObtenerCampo("tpLetra").Text = "X" Then ' MOD Version 4.7
                    objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
                Else
                    objDiccionariodeDatos.GuardarSiguienteValor "TB_Comprobantes", "nrComprobante", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")
                End If
                Guardarregistro = True
            End If
    End Select

End Function



Private Function Guardarregistro_Imprime(EstadoABM As Byte) As Boolean
Dim Control      As Control
Dim strtag       As String
Dim strPrefijo   As String
Dim cdCodBarLic  As String
Dim cdCodBarAFIP As String
Dim strValor     As String

    ObjTablasIO.nmTabla = "TB_Comprobantes_Imprime"
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

    For Each Control In Me.Combox1
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
            
            
    cdCodBarAFIP = ObtenerCodBarrasAFIP()
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional3", "<-", cdCodBarAFIP
    
    cdCodBarLic = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(ObtenerCampo("nrLicencia").Text, 3)
    
    ObjTablasIO.setearCampoOperadorValor _
              "cdCodBar", "<-", cdCodBarLic
    
    ObjTablasIO.setearCampoOperadorValor _
              "dtCaja", "<-", CStr(Now)
    ObjTablasIO.setearCampoOperadorValor _
              "dtInsercion", "<-", CStr(Now)
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional1", "<-", CStr(Format(Now, "HH:MM"))
              

              
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "nrCAI", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObjTablasIO.setearCampoOperadorValor _
    "nrCAI", "<-", strValor
    
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "dtVencimiento", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    ObjTablasIO.setearCampoOperadorValor _
    "dtVencimiento", "<-", strValor
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaDolar", "<-", objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar")
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaEuro", "<-", objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro")
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional2", "<-", ConcatenarDestinos()
              
    
    ObjTablasIO.setearCampoOperadorValor _
              "tpLetra", "<-", ObtenerCampo("tpLetra").Text  ' MOD Version 4.7
              
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsUsuario", "<-", objUsuario.dsUsuario
    
    Select Case EstadoABM
    Case modificacion, alta, facturar
            If Not ObjTablasIO.Insertar Then
                Guardarregistro_Imprime = False
            Else
                Guardarregistro_Imprime = True
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


    strCodAFIP = objConfig.nrCUIT
    strCodAFIP = strCodAFIP + objAFIP.obtenerTipodeComprobante()
    strCodAFIP = strCodAFIP + CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
    strCodAFIP = strCodAFIP + objDiccionariodeDatos.ObtenerValorActual _
                ("TB_Comprobantes", "nrCAI", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto"))
    
    strCodAFIP = strCodAFIP + Format(objDiccionariodeDatos.ObtenerValorActual _
                ("TB_Comprobantes", "dtVencimiento", objParametros.ObtenerValor("Frm_VentaPasajes.nrPuesto")), "DDMMYYYY")
                
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
           HabilitarCampos "dsRazonSocial", True
           HabilitarCampos "nrDoc", True
           HabilitarCampos "dsEmail", True
           HabilitarCampos "dsProducto", False
           HabilitarCampos "tpOperacion", False
           HabilitarCampos "vlPrecioPeaje", False
           HabilitarCampos "vlKilometros", False
           HabilitarCampos "vlPrecioViaje", False
           cmdAgregarItemFactura.Enabled = False
           ' MODIFICADO en la V4.7
           On Error Resume Next
            Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
            Case "puesto"
                If ObtenerCampo("tpComprobante").Text = "ND" Or ObtenerCampo("tpComprobante").Text = "NC" Then
                    ObtenerCampo("cdCliente").SetFocus
                Else
                ObtenerCampo("dsProductoBuscado").SetFocus
                End If
            Case Else
                ObtenerCampo("nrComprobante").SetFocus
            End Select
           On Error GoTo 0
           Select Case objParametros.ObtenerValor("Frm_VentaPasajes.desde")
           Case "administracion", "administracion.cajapuesto"
                ObtenerCampo("nrComprobante") = ""
                HabilitarCampos "nrComprobante", True
           Case Else
                HabilitarCampos "nrComprobante", False
           End Select
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
            HabilitarCampos "dsRazonSocial", True
            HabilitarCampos "nrDoc", True
            HabilitarCampos "dsEmail", True
            ObtenerCampo("dsRazonSocial").Text = ""
            ObtenerCampo("nrDoc").Text = ""
            ObtenerCampo("dsEmail").Text = ""
        End If
        Me.flClienteNuevo.value = vbUnchecked
    Case "nrLicencia"
        AvisarError "nrLicencia", False
        ObtenerCampo("nrLicencia").BackColor = Blanco
        ObtenerCampo("nmLicenciatario").Text = ""
    Case "vlTotalGeneral", "vlPagoEuros", "vlPagoDolares", "vlPagoReales"
        ' calcularSaldo
    Case "vlPagoPesos"
        AvisarError "vlPagoPesos", False
    Case "nrPasajeros"
        AvisarError "nrPasajeros", False
    Case "nrComprobante"
        AvisarError "nrComprobante", False
    Case "tpComprobante"  ' Agregado en la version 4.7
        Dim strNombreCompleto As String
        If ObtenerCampo("tpComprobante").Text = "NC" Or ObtenerCampo("tpComprobante").Text = "ND" Then
            ObtenerCampo("nrLicencia").Text = "999"
            
        ObjTablasIO.nmTabla = "TB_Proveedores"
        ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
        ObjTablasIO.setearCampoOperadorValor _
        "nrLicencia", "=", ObtenerCampo("nrLicencia").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
        ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").value), "", ObjTablasIO.rs_resultados("nmApellido").value) + " "
            strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").value), "", ObjTablasIO.rs_resultados("nmNombre").value)
            ObtenerCampo("nmLicenciatario").Text = strNombreCompleto
       End If
            HabilitarCampos "nrLicencia", False
            ObtenerCampo("nrLicencia").Enabled = False
            
        End If
    End Select

End Sub


Private Sub calculaPagodelCliente()
Dim vlTotalEuros        As Single
Dim vlTotalDolares      As Single
Dim vlTotalGeneral      As Single
Dim vlTotalReales       As Single
Dim vlPagoEuros         As Single
Dim vlPagoDolares       As Single
Dim vlPagoPesos         As Single
Dim vlPagoReales        As Single
Dim vlSaldoPesos        As Single
Dim vlSaldoEuros        As Single
Dim vlSaldoDolares      As Single
Dim vlSaldoReales       As Single

    
    vlTotalEuros = ObtenerValoresNumericos("vlTotalEuros")
    vlTotalDolares = ObtenerValoresNumericos("vlTotalDolares")
    vlTotalGeneral = ObtenerValoresNumericos("vlTotalGeneral")
    vlTotalReales = ObtenerValoresNumericos("vlTotalReales")
    
    vlPagoEuros = ObtenerValoresNumericos("vlPagoEuros")
    vlPagoDolares = ObtenerValoresNumericos("vlPagoDolares")
    vlPagoPesos = ObtenerValoresNumericos("vlPagoPesos")
    vlPagoReales = ObtenerValoresNumericos("vlPagoReales")
    
    vlSaldoPesos = ObtenerValoresNumericos("vlSaldoPesos")
    vlSaldoEuros = ObtenerValoresNumericos("vlSaldoEuros")
    vlSaldoDolares = ObtenerValoresNumericos("vlSaldoDolares")
    vlSaldoReales = ObtenerValoresNumericos("vlSaldoReales")
    
    objParametros.GrabarValor "vlPagoEuros", "0,00"
    objParametros.GrabarValor "vlPagoDolares", "0,00"
    objParametros.GrabarValor "vlPagoPesos", "0,00"
    objParametros.GrabarValor "vlPagoReales", "0,00"
            
    If vlPagoEuros >= vlTotalEuros Then
        ObtenerCampo("vlPagoDolares").Text = "0,00"
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        ObtenerCampo("vlPagoReales").Text = "0,00"
        objParametros.GrabarValor "vlPagoEuros", CStr(vlTotalEuros)
        objParametros.GrabarValor "vlPagoDolares", "0,00"
        objParametros.GrabarValor "vlPagoPesos", "0,00"
        objParametros.GrabarValor "vlPagoReales", "0,00"
        Exit Sub
    ElseIf vlPagoReales >= vlTotalReales Then
        ObtenerCampo("vlPagoDolares").Text = "0,00"
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        ObtenerCampo("vlPagoReales").Text = "0,00"
        objParametros.GrabarValor "vlPagoReales", CStr(vlTotalReales)
        objParametros.GrabarValor "vlPagoDolares", "0,00"
        objParametros.GrabarValor "vlPagoPesos", "0,00"
        objParametros.GrabarValor "vlPagoEuros", "0,00"
        Exit Sub
    ElseIf vlPagoDolares >= vlTotalDolares Then
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoPesos").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            objParametros.GrabarValor "vlPagoEuros", "0,00"
            objParametros.GrabarValor "vlPagoDolares", CStr(vlTotalDolares)
            objParametros.GrabarValor "vlPagoPesos", "0,00"
            objParametros.GrabarValor "vlPagoReales", "0,00"
            Exit Sub
        ElseIf vlPagoPesos >= vlTotalGeneral Then
            ObtenerCampo("vlPagoEuros").Text = "0,00"
            ObtenerCampo("vlPagoDolares").Text = "0,00"
            ObtenerCampo("vlPagoReales").Text = "0,00"
            objParametros.GrabarValor "vlPagoEuros", "0,00"
            objParametros.GrabarValor "vlPagoDolares", "0,00"
            objParametros.GrabarValor "vlPagoPesos", CStr(vlTotalGeneral)
            objParametros.GrabarValor "vlPagoReales", "0,00"
            Exit Sub
    End If
    
    Dim FaltanteAcum As Single
    objParametros.GrabarValor "vlPagoEuros", CStr(vlPagoEuros)
    objParametros.GrabarValor "vlPagoReales", CStr(vlPagoReales)
    
    '/***************************************************************/
    ' Falta completar logica LOGICA DE REALES
    
    ' obtenemos el faltante en pesos
    FaltanteAcum = vlTotalGeneral - (vlPagoEuros * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro")))
    
    If vlPagoDolares * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar")) >= FaltanteAcum Then
        objParametros.GrabarValor "vlPagoDolares", CStr(Round(FaltanteAcum / CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))))
        FaltanteAcum = 0
    Else
        FaltanteAcum = FaltanteAcum - (vlPagoDolares * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar")))
        objParametros.GrabarValor "vlPagoDolares", CStr(vlPagoDolares)
    End If
    
    ' nueva logico version 3.7
    If vlPagoReales * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal")) >= FaltanteAcum Then
        objParametros.GrabarValor "vlPagoReales", CStr(Round(FaltanteAcum / CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal"))))
        FaltanteAcum = 0
    Else
        FaltanteAcum = FaltanteAcum - (vlPagoReales * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal")))
        objParametros.GrabarValor "vlPagoReales", CStr(vlPagoReales)
    End If
        
    objParametros.GrabarValor "vlPagoPesos", CStr(FaltanteAcum)
    

End Sub



Private Sub CalcularSaldos(pTag As String)
Dim vlaCobrarEuros   As Single
Dim vlaCobrarReales  As Single
Dim vlaCobrarDolares As Single
Dim vlaCobrarPesos   As Single
Dim vlaPagarEuros    As Single
Dim vlaPagarDolares  As Single
Dim vlaPagarPesos    As Single
Dim vlaPagarReales   As Single
Dim vlaVueltoEuros   As Single
Dim vlaVueltoDolares As Single
Dim vlaVueltoPesos   As Single
Dim vlaVueltoReales  As Single
Dim TotalaPagar      As Single


Dim vlTotalEuros As Single
Dim vlPagoEuros As Single
Dim vlTotalReales As Single
Dim vlPagoReales As Single
Dim vlTotalDolares As Single
Dim vlPagoDolares As Single
    
    Select Case pTag
    Case "vlPagoEuros", "vlPagoDolares", "vlPagoReales"
         ObtenerCampo("vlPagoPesos").Text = "0,00"
    End Select
    
    vlaCobrarEuros = ObtenerPesos("vlTotalEuros")
    vlaCobrarReales = ObtenerPesos("vlTotalReales")
    vlaCobrarDolares = ObtenerPesos("vlTotalDolares")
    vlaCobrarPesos = ObtenerPesos("vlTotalGeneral")
    
    vlaPagarEuros = ObtenerPesos("vlPagoEuros")
    vlaPagarDolares = ObtenerPesos("vlPagoDolares")
    vlaPagarPesos = ObtenerPesos("vlPagoPesos")
    vlaPagarReales = ObtenerPesos("vlPagoReales")
        
    vlaVueltoEuros = ObtenerPesos("vlSaldoEuros")
    vlaVueltoDolares = ObtenerPesos("vlSaldoDolares")
    vlaVueltoPesos = ObtenerPesos("vlSaldoPesos")
    vlaVueltoReales = ObtenerPesos("vlSaldoReales")
    
    ' Los valores de Euros,  Dolares y Reales ya se encuentran pesificados
    TotalaPagar = vlaPagarEuros + vlaPagarDolares + vlaPagarPesos + vlaPagarReales
    
    If TotalaPagar >= vlaCobrarPesos Then
        vlaVueltoPesos = TotalaPagar - vlaCobrarPesos
        ObtenerCampo("vlSaldoPesos").Text = FormatNumber(vlaVueltoPesos, 2)
        ObtenerCampo("vlSaldoEuros").Text = FormatNumber(Round(ObtenerEuros("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoDolares").Text = FormatNumber(Round(ObtenerDolares("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoReales").Text = FormatNumber(Round(ObtenerReales("vlSaldoPesos"), 0), 2)
    Else
        vlaPagarPesos = vlaCobrarPesos - TotalaPagar + vlaPagarPesos
        vlaVueltoPesos = 0
        ObtenerCampo("vlPagoPesos").Text = FormatNumber(vlaPagarPesos, 2)
        ObtenerCampo("vlSaldoPesos").Text = FormatNumber(vlaVueltoPesos, 2)
        ObtenerCampo("vlSaldoEuros").Text = FormatNumber(Round(ObtenerEuros("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoDolares").Text = FormatNumber(Round(ObtenerDolares("vlSaldoPesos"), 0), 2)
        ObtenerCampo("vlSaldoReales").Text = FormatNumber(Round(ObtenerReales("vlSaldoPesos"), 0), 2)
    End If
    
    
    If vlaPagarEuros <> 0 And vlaPagarPesos = 0 Then
        vlaVueltoPesos = ObtenerValoresNumericos("vlSaldoEuros") * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro"))
        ObtenerCampo("vlSaldoPesos").Text = vlaVueltoPesos
    End If
    If vlaPagarDolares <> 0 And vlaPagarPesos = 0 Then
        vlaVueltoPesos = ObtenerValoresNumericos("vlSaldoDolares") * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))
        ObtenerCampo("vlSaldoPesos").Text = vlaVueltoPesos
    End If
    If vlaPagarReales <> 0 And vlaPagarPesos = 0 Then
        vlaVueltoPesos = ObtenerValoresNumericos("vlSaldoReales") * CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal"))
        ObtenerCampo("vlSaldoPesos").Text = vlaVueltoPesos
    End If

    
    vlTotalEuros = CSng(ObtenerCampo("vlTotalEuros").Text)
    vlPagoEuros = CSng(ObtenerCampo("vlPagoEuros").Text)
    vlTotalReales = CSng(ObtenerCampo("vlTotalReales").Text)
    vlPagoReales = CSng(ObtenerCampo("vlPagoReales").Text)
    vlTotalDolares = CSng(ObtenerCampo("vlTotalDolares").Text)
    vlPagoDolares = CSng(ObtenerCampo("vlPagoDolares").Text)
    
    If vlTotalEuros = vlPagoEuros Then
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        ' ObtenerCampo("vlSaldoPesos").Text = "0,00"
    End If
    
    If vlTotalReales = vlPagoReales Then
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        ' ObtenerCampo("vlSaldoPesos").Text = "0,00"
    End If
    
    
    If vlTotalDolares = vlPagoDolares Then
        ObtenerCampo("vlPagoPesos").Text = "0,00"
        ' ObtenerCampo("vlSaldoPesos").Text = "0,00"
    End If



    
    
End Sub



Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single
Dim vlDiaReal  As Single

    vlDiaEuro = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))
    vlDiaReal = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal"))

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlPagoEuros", "vlTotalEuros", "vlSaldoEuros"
            ObtenerPesos = ObtenerValoresNumericos(pTag) * vlDiaEuro
        Case "vlPagoDolares", "vlTotalDolares", "vlSaldoDolares"
            ObtenerPesos = ObtenerValoresNumericos(pTag) * vlDiaDolar
        Case "vlPagoReales", "vlTotalReales", "vlSaldoReales"
            ObtenerPesos = ObtenerValoresNumericos(pTag) * vlDiaReal
        Case Else
            ObtenerPesos = ObtenerValoresNumericos(pTag)
        End Select
    End If
    
End Function


Private Function ObtenerDolares(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

    vlDiaEuro = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))

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

    vlDiaEuro = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))
    
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



Private Function ObtenerReales(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single
Dim vlDiaReal As Single


    vlDiaEuro = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaEuro"))
    vlDiaDolar = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaDolar"))
    vlDiaReal = CSng(objParametros.ObtenerValor("Frm_VentasPasajes.vlDiaReal"))
    
    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerReales = 0
    Else
        Select Case pTag
        Case "vlPagoDolares", "vlTotalDolares"
            ObtenerReales = (ObtenerValoresNumericos(pTag) * vlDiaDolar) / vlDiaReal
        Case "vlPagoPesos", "vlTotalPesos", "vlSaldoPesos"
            ObtenerReales = ObtenerValoresNumericos(pTag) / vlDiaReal
        Case "vlPagoReales", "vlTotalReales", "vlSaldoReales"
            ObtenerReales = ObtenerValoresNumericos(pTag)
        Case Else
            ObtenerReales = ObtenerValoresNumericos(pTag)
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
            objParametros.GrabarValor "Frm_Busquedas.nmCampoTipo", "tpFormadePago"
            objParametros.GrabarValor "Frm_Busquedas.nmCampoTipoValorDefecto", "Contado"
            objParametros.GrabarValor "tpCampoBusqueda", "Razón Social"
            Frm_Busquedas.Show 1
            ObtenerCampo("cdCliente").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarcampocliente
        Case UCase("nrLicencia")
                ObtenerCampo("nrLicencia").Text = "(Borrar)"
                objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
                objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
                objParametros.GrabarValor "vlCampoClaveBusqueda", ""
                objParametros.GrabarValor "Frm_Busquedas.nmCampoTipo", "tpCategoria"
                objParametros.GrabarValor "Frm_Busquedas.nmCampoTipoValorDefecto", "Licenciatario"
                objParametros.GrabarValor "tpCampoBusqueda", "Apellido"
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


' versión  1.4
Private Sub buscarcampocliente()
Dim Control As Control
Dim Valor   As Variant
Dim i       As Integer
Dim tpIVA   As String


         If ObtenerCampo("cdCliente").Text = "1" Then
            If ObtenerCampo("tpIVA") = "RI" Then
                ObtenerCampo("dsRazonSocial") = ""
                ObtenerCampo("nrDoc") = ""
                ObtenerCampo("dsEmail") = ""
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("dsRazonSocial").SetFocus
            Else
                ObtenerCampo("dsRazonSocial") = "Consumidor Final"
                ObtenerCampo("nrDoc") = ""
                ObtenerCampo("dsEmail") = ""
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ' On Error Resume Next
                ObtenerCampo("dsProductoBuscado").SetFocus
                ' On Error GoTo 0
            End If
            Exit Sub
         End If

         If ObtenerCampo("cdCliente").Text = "(Nuevo)" Then
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("cdCliente").BackColor = Blanco
                ObtenerCampo("dsRazonSocial").SetFocus
         End If
        
         If Me.flClienteNuevo.value = vbChecked Then
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                ObtenerCampo("cdCliente").BackColor = Blanco
                ObtenerCampo("dsRazonSocial").SetFocus
                Exit Sub
         End If
        

       ObjTablasIO.nmTabla = "TB_Clientes"
       ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
       ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdCliente").Text, " AND ("
       ObjTablasIO.setearCampoOperadorValor "dtBaja", ">", Format(Date, "DD-MM-YYYY"), " OR "
       ObjTablasIO.setearCampoOperadorValor "dtBaja", " IS NULL ", "", " ) "
       ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
       ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
       ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
       ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
       ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
       ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
       ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
       ObjTablasIO.setearCampoOperadorValor "nrTel", "->", ""
       ObjTablasIO.setearCampoOperadorValor "cdPostal", "->", ""
       ObjTablasIO.setearCampoOperadorValor "tpIVA", "->", ""
       ObjTablasIO.setearCampoOperadorValor "tpFormadePago", "->", ""
       
       If Not ObjTablasIO.Seleccionar Then
           HabilitarCampos "dsRazonSocial", False
           HabilitarCampos "nrDoc", False
           HabilitarCampos "dsEmail", False
           AvisarError "cdCliente", True
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
                                       
                                       Select Case Control.Tag
                                       Case "tpIVA" ' para no desplegar sub eventos
                                           tpIVA = Valor
                                       Case Else
                                           On Error Resume Next
                                           Control.Text = Valor
                                           If Err Then
                                               Control.Text = ""
                                           End If
                                           On Error GoTo 0
                                      End Select
                                   End If
                               Next i
                           End If
                       End If
                   End If
           Next
           
           If tpIVA <> "" Then
            ObtenerCampo("tpIVA") = tpIVA
           End If
           
           If ObtenerCampo("cdCliente") <> "1" And ObtenerCampo("tpIVA") = "" Then
               ' Lo consideferamos responsable inscripto
               ObtenerCampo("tpIVA") = "RI"
           End If
           
           If ObtenerCampo("tpIVA") = "" Then
               ' Lo consideferamos Consumidor Final
               ObtenerCampo("tpIVA") = "CF"
           End If
           
           HabilitarCampos "dsRazonSocial", False
           HabilitarCampos "nrDoc", False
           HabilitarCampos "dsEmail", False
           ObtenerCampo("cdCliente").BackColor = Blanco
           ObtenerCampo("dsProductoBuscado").SetFocus
       Else
           HabilitarCampos "dsRazonSocial", False
           HabilitarCampos "nrDoc", False
           HabilitarCampos "dsEmail", False
           ObtenerCampo("cdCliente").BackColor = Rojo
           ObtenerCampo("cdCliente").SetFocus
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
          If ObtenerCampo(nmCampo).Locked Then
                ObtenerCampo(nmCampo).BackColor = Gris
          Else
                ObtenerCampo(nmCampo).BackColor = Blanco
          End If
    End If

End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)



    Select Case KeyAscii
    Case vbKeyReturn
        Select Case Me.txtFields(Index).Tag
        Case "nrComprobante"
            ObtenerCampo("dtComprobante").SetFocus
        Case "cdCliente"
            ' -- agregado en la version 4.9
            If Not ObtenerCampo("cdCliente").Text = "" Then
                buscarcampocliente
            End If
            ObtenerCampo("dsProductoBuscado").SetFocus
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
                ' Comentado en la version 3.2
                ' If buscarlicencia() Then
                '    ObtenerCampo("nrPasajeros").SetFocus
                'Else
                '    AvisarError "nrLicencia", True
                'End If
                ObtenerCampo("nrPasajeros").SetFocus
            End If
        Case "nrPasajeros"
            ObtenerCampo("nrBultos").SetFocus
        Case "nrBultos"
            ObtenerCampo("dsLeyenda").SetFocus
        Case "dsLeyenda"
            ObtenerCampo("vlPagoEuros").SetFocus
        Case "vlPagoEuros"
            ObtenerCampo("vlPagoReales").SetFocus
        Case "vlPagoReales"
            ObtenerCampo("vlPagoDolares").SetFocus
        Case "vlPagoDolares"
            ObtenerCampo("vlPagoPesos").SetFocus
        Case "vlPagoPesos"
            cmdFacturar_Click
        End Select
    Case vbKeyBack
        If Me.txtFields(Index).Text <> "" Then Exit Sub
        
        On Error Resume Next
        
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
        Case "vlPagoReales"
            ObtenerCampo("vlPagoEuros").SetFocus
        Case "vlPagoDolares"
            ObtenerCampo("vlPagoReales").SetFocus
        Case "vlPagoPesos"
            ObtenerCampo("vlPagoDolares").SetFocus
        End Select
        
        On Error GoTo 0
    
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
            ' If Not ObtenerCampo("cdCliente").Text = "" Then
            '     buscarcampocliente
            ' End If
            ' setearCondicionVentayComision
            ' cargarCondVentas ObtenerCampo("cdCliente").Text
        Case "vlTotalGeneral", "vlPagoEuros", "vlPagoDolares", "vlPagoPesos", "vlPagoReales"
            If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
                ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" And _
                ObtenerCampo("cdCondVenta").Text <> "Retorno" And _
                ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Débito" And _
                ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Crédito" And _
                ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Crédito" And _
                ObtenerCampo("cdCondVenta").Text <> "Todo Pago" Then
                CalcularSaldos Me.txtFields(Index).Tag
            End If
        Case "nrComprobante"
            If Not IsNumeric(ObtenerCampo("nrComprobante").Text) Then
                AvisarError "nrComprobante", True
                Exit Sub
            End If
            Me.txtFields(Index).Text = CompletarCerosaIzquierda(Me.txtFields(Index).Text, 8)
            ExisteComprobante
        End Select
        
    End If
    
End Sub

Private Function buscarlicencia() As Boolean
Dim strNombreCompleto As String

    If ObtenerCampo("nrLicencia").Text = "999" Then
        ObtenerCampo("nrLicencia").Text = ""
        ObtenerCampo("nrLicencia").BackColor = Rojo
        ObtenerCampo("nrLicencia").SetFocus
        buscarlicencia = False
        Exit Function
    End If
    
    If ObtenerCampo("nrLicencia").Text = "990" And _
        ObtenerCampo("tpFormadePago") <> "Cuenta Corriente" Then
        ObtenerCampo("nrLicencia").Text = ""
        ObtenerCampo("nrLicencia").BackColor = Rojo
        ObtenerCampo("nrLicencia").SetFocus
        buscarlicencia = False
        Exit Function
    End If
    
    
    ObjTablasIO.nmTabla = "TB_Proveedores"
    ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
    ObjTablasIO.setearCampoOperadorValor _
    "nrLicencia", "=", ObtenerCampo("nrLicencia").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"

    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").value), "", ObjTablasIO.rs_resultados("nmApellido").value) + " "
        strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").value), "", ObjTablasIO.rs_resultados("nmNombre").value)
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
                Case "Viaje", "Recargo+Comi"
                     cmdAgregarItemFactura_Click
                Case "Factura-Comi"
                     HabilitarCampos "vlPrecioViaje", True
                     HabilitarCampos "vlPorcentaje", False
                     ObtenerCampo("vlPrecioViaje").Text = Abs(CSng(ObtenerValoresNumericos("vlPrecioViaje")))
                     ObtenerCampo("vlPrecioViaje").SetFocus
                     Me.cmdAgregarItemFactura.Enabled = True
                End Select
    Else
        Me.cmdAgregarItemFactura.Enabled = True
        ObtenerCampo("tpOperacion").Text = "Viaje"
        ObtenerCampo("vlPorcentaje").Text = "0,00"
        ObtenerCampo("vlPrecioPeaje").Text = "0,00"
        ObtenerCampo("vlKilometros").Text = "0"
        ObtenerCampo("vlPrecioViaje").Text = "0,00"
        HabilitarCampos "dsProducto", True
        HabilitarCampos "vlPrecioPeaje", True
        HabilitarCampos "vlPrecioViaje", True
        HabilitarCampos "vlKilometros", True
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
        Else
            Select Case Me.txtItemFactura(Index).Tag
            Case "dsProductoBuscado"
                HabilitarCampos "dsProducto", False
                HabilitarCampos "vlPorcentaje", False
                HabilitarCampos "vlPrecioViaje", False
                HabilitarCampos "vlPrecioPeaje", False
                HabilitarCampos "vlKilometros", False
                HabilitarCampos "tpOperacion", False
                ObtenerCampo("dsProducto").Text = ""
                ObtenerCampo("vlPorcentaje").Text = ""
                ObtenerCampo("vlPrecioViaje").Text = ""
                ObtenerCampo("vlPrecioPeaje").Text = ""
                ObtenerCampo("vlKilometros").Text = ""
                ObtenerCampo("tpOperacion").Text = ""
                Me.cmdAgregarItemFactura.Enabled = False
            End Select
        End If
        
    Else
        Select Case Me.txtItemFactura(Index).Tag
        Case "dsProductoBuscado"
       
            HabilitarCampos "dsProducto", False
            HabilitarCampos "vlPorcentaje", False
            HabilitarCampos "vlPrecioViaje", False
            HabilitarCampos "vlPrecioPeaje", False
            HabilitarCampos "vlKilometros", False
            HabilitarCampos "tpOperacion", False
            
                    
            ObtenerCampo("dsProducto").Text = ""
            ObtenerCampo("vlPorcentaje").Text = ""
            ObtenerCampo("vlPrecioViaje").Text = ""
            ObtenerCampo("vlPrecioPeaje").Text = ""
            ObtenerCampo("vlKilometros").Text = ""
            ObtenerCampo("tpOperacion").Text = ""
            
            Me.cmdAgregarItemFactura.Enabled = False
            
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
            ObtenerCampo("vlkilometros").SetFocus
        Case "vlKilometros"
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
    ObtenerCampo("dsProducto").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_dsProducto)
    ObtenerCampo("tpOperacion").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_tpOperacion)
    ObtenerCampo("vlPorcentaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(Const_vlPorcentaje)
    ObtenerCampo("vlPrecioPeaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(Const_vlPrecioPeaje)
    ObtenerCampo("vlKilometros").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlKilometros)
    ObtenerCampo("vlPrecioViaje").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlTotalViajes)
    ObtenerCampo("cdComision").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_cdComision)
    ' campos de la version 4.9
    ObtenerCampo("vlPrecioTC").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlPrecioTC)
    ObtenerCampo("vlPrecioTD").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlPrecioTD)
    ObtenerCampo("vlRecargoTC").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlRecargoTC)
    ObtenerCampo("vlRecargoTP").Text = Me.lstBusquedaProductos.SelectedItem.SubItems(const_vlRecargoTP)
    

    buscarPresentarProducto
    
    setearCondicionVentayComision
    
End Sub


Private Function esNuevoDestino() As Boolean
Dim i As Integer

        
    esNuevoDestino = False
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        If Me.lstItemsFactura.ListItems(i).Text = "(Nuevo)" Then
            esNuevoDestino = True
            Exit Function
        End If
    Next
    
    
End Function





Private Sub txtItemFactura_LostFocus(Index As Integer)

    If Me.txtItemFactura(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Productos", _
                                  Me.txtItemFactura(Index), "LostFocus"
           
    End If

End Sub


'////////////////////////////////////////////////////////'
'//         Pasada la prueba borrar este código        //'
Private Function ImprimirFactura_OLD(ByVal pnrTalonario As String, _
ByVal pnrComprobante As String, ByVal tpComprobante As String, ByVal ptpLetra As String, pFormato As String) As Boolean

Dim strCodbarAFIP       As String
Dim strCodbarAFIPI2to5  As String
Dim strValorPromo       As String
Dim cdCodBarLic         As String
        
    strValorPromo = objConfig.vlValorPromo
    
     
    cdCodBarLic = CompletarCerosaIzquierda(Trim(ObtenerCampo("nrTalonario").Text), 4)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(Trim(ObtenerCampo("nrComprobante").Text), 8)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(Trim(ObtenerCampo("nrLicencia").Text), 3)
    cdCodBarLic = objAFIP.StrToI2of5(cdCodBarLic)
    
    
    objbasededatos.Exec_SP_PrepararReimpresiondeComprobante _
    pnrTalonario, pnrComprobante, tpComprobante, ptpLetra, objUsuario.dsUsuario
    strCodbarAFIP = ObtenerCodBarrasAFIP()
    strCodbarAFIPI2to5 = objAFIP.StrToI2of5(strCodbarAFIP)
    strCodbarAFIP = strCodbarAFIP + objAFIP.DigitoVerificador(strCodbarAFIP)
    
    Frm_Principal.LimpiarReporte
    
    Select Case ptpLetra
    Case "X"
        Select Case objConfig.tpImpresion
        Case "BLANCO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime.rpt"
        Case "PREIMPRESO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime_preimpresorpt"
        Case "CONTINUO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime_Continuo_v3_7.rpt"
        End Select
    Case Else
        
        Select Case objConfig.tpImpresion
        Case "BLANCO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_facturaChico_Imprime.rpt"
        Case "PREIMPRESO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_facturaChico_Imprime_preimpreso.rpt"
        Case "CONTINUO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_facturachico_imprime_continuo_v4_9.rpt"
        End Select
        
    End Select

    Frm_Principal.CrystalReport1.Destination = crptToPrinter
    Frm_Principal.CrystalReport1.PrinterStartPage = 1
    Frm_Principal.CrystalReport1.PrinterStopPage = 1
    
    Select Case ptpLetra
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - ORIGINAL"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - ORIGINAL"
    End Select
    
    If objConfig.tpImpresion = "CONTINUO" Then
        Frm_Principal.CrystalReport1.Formulas(0) = "Copia = '" + objConfig.dsleyendaCopia + "'"
    Else
        Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'ORIGINAL'"
    End If
    
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    Frm_Principal.CrystalReport1.Formulas(6) = "cdCodBarLicencia = '" + cdCodBarLic + "'"
    
        
        
    ' Aparece la venta duplicado
    On Error Resume Next
    DoEvents
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            DoEvents
            Sleep (500)
            Frm_Principal.CrystalReport1.Action = 1
         End If
    On Error GoTo 0
    
    
    If objConfig.tpImpresion = "CONTINUO" Then
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        End If
        ImprimirFactura_OLD = True
        Exit Function
    End If
    
    Select Case ptpLetra
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - DUPLICADO"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - DUPLICADO"
    End Select
    
    Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'DUPLICADO'"
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    Frm_Principal.CrystalReport1.Formulas(6) = "cdCodBarLicencia = '" + cdCodBarLic + "'"
    
    ' Aparece la venta duplicado
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.PrintReport
         If Err Then
           DoEvents
            Sleep (500)
            Frm_Principal.CrystalReport1.Action = 1
         End If
    On Error GoTo 0
    
    objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    If Not objSPs.ExecSP Then
        MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        Exit Function
    End If
    
End Function



Private Function ImprimirFactura(ByVal pnrTalonario As String, _
ByVal pnrComprobante As String, ByVal tpComprobante As String, ByVal ptpLetra As String, pFormato As String) As Boolean
Dim strCodbarAFIP       As String
Dim strCodbarAFIPI2to5  As String
Dim strValorPromo       As String
Dim cdCodBarLic         As String
        
    strValorPromo = objConfig.vlValorPromo
    
     
    ImprimirFactura = False

    cdCodBarLic = CompletarCerosaIzquierda(Trim(ObtenerCampo("nrTalonario").Text), 4)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(Trim(ObtenerCampo("nrComprobante").Text), 8)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(Trim(ObtenerCampo("nrLicencia").Text), 3)
    cdCodBarLic = objAFIP.StrToI2of5(cdCodBarLic)
    
    objSPs.nmStoredProcedure = "SP_PrepararReimpresiondeComprobante_v4_9"
    objSPs.setearCampoValor "@nrTalonario", pnrTalonario
    objSPs.setearCampoValor "@nrComprobante", pnrComprobante
    objSPs.setearCampoValor "@tpComprobante", tpComprobante
    objSPs.setearCampoValor "@tpLetra", ptpLetra
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    
    If Not objSPs.ExecSP Then
        MsgBox " Error al intentar imprimir la factura, Functión: SP_PrepararReimpresiondeComprobante_v4_9", vbCritical, "Atención"
        Exit Function
    End If
    
    strCodbarAFIP = ObtenerCodBarrasAFIP()
    strCodbarAFIPI2to5 = objAFIP.StrToI2of5(strCodbarAFIP)
    strCodbarAFIP = strCodbarAFIP + objAFIP.DigitoVerificador(strCodbarAFIP)

    Frm_Principal.LimpiarReporte
    
    Select Case ptpLetra
    Case "X"
        Select Case objConfig.tpImpresion
        Case "BLANCO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_CuponChico_Imprime.rpt"
        Case "PREIMPRESO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_CuponChico_Imprime_preimpreso.rpt"
        Case "CONTINUO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_facturachico_imprime_continuo_v4_9.rpt"
        End Select
    Case Else
        Select Case objConfig.tpImpresion
        Case "BLANCO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_facturaChico_Imprime.rpt"
        Case "PREIMPRESO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_facturaChico_Imprime_preimpreso.rpt"
        Case "CONTINUO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_facturachico_imprime_continuo_v4_9.rpt"
        End Select
    End Select
    
     
    Frm_Principal.CrystalReport1.Destination = crptToPrinter
    Frm_Principal.CrystalReport1.PrinterStartPage = 1
    Frm_Principal.CrystalReport1.PrinterStopPage = 1
    
    Select Case ptpLetra
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - ORIGINAL"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - ORIGINAL"
    End Select
    
    If objConfig.tpImpresion = "CONTINUO" Then
        Frm_Principal.CrystalReport1.Formulas(0) = "Copia = '" + objConfig.dsleyendaCopia + "'"
    Else
        Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'ORIGINAL'"
    End If
    
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    Frm_Principal.CrystalReport1.Formulas(6) = "cdCodBarLicencia = '" + cdCodBarLic + "'"
    Frm_Principal.CrystalReport1.Formulas(7) = "tpComprobante = '" + tpComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(8) = "tpLetra = '" + ptpLetra + "'"
    
        
    ' Aparece la venta duplicado
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
        MsgBox "Error: " + Err.Description + vbCrLf + " Reporte:  " + Frm_Principal.CrystalReport1.WindowTitle, vbCritical, "Atención"
        ImprimirFactura = False
    End If
    On Error GoTo 0
    
    If objConfig.tpImpresion = "CONTINUO" Then
               
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
            Exit Function
        End If
        
        ImprimirFactura = True
        Exit Function
    End If
    
    If objConfig.nrCantidaddeCopias = 1 Then
        
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
            Exit Function
        End If
        
        ImprimirFactura = True
        Exit Function
    End If
    
    Select Case ptpLetra
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - DUPLICADO"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - DUPLICADO"
    End Select
    
    Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'DUPLICADO'"
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    Frm_Principal.CrystalReport1.Formulas(6) = "cdCodBarLicencia = '" + cdCodBarLic + "'"
    Frm_Principal.CrystalReport1.Formulas(7) = "tpComprobante = '" + tpComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(8) = "tpLetra = '" + ptpLetra + "'"
    
    ' Aparece la venta duplicado
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.PrintReport
    On Error GoTo 0
    
    If objConfig.nrCantidaddeCopias = 2 Then
    
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
            Exit Function
        End If
        
        ImprimirFactura = True
        Exit Function
    End If
    
    
    Select Case ptpLetra
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - TRIPLICADO"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - TRIPLICADO"
    End Select
    
    Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'TRIPLICADO'"
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    Frm_Principal.CrystalReport1.Formulas(6) = "cdCodBarLicencia = '" + cdCodBarLic + "'"
    Frm_Principal.CrystalReport1.Formulas(7) = "tpComprobante = '" + tpComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(8) = "tpLetra = '" + ptpLetra + "'"
    
    ' Aparece la venta duplicado
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.PrintReport
    On Error GoTo 0
    
    objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    If Not objSPs.ExecSP Then
        MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        Exit Function
    End If
        
        
    
End Function


Private Sub txtSaldos_Change(Index As Integer)

    If Me.txtSaldos(Index).Text = "" Then
        Me.txtSaldos(Index).Text = FormatNumber(0, 2)
    Else
        Me.txtSaldos(Index).Text = FormatNumber(Me.txtSaldos(Index).Text, 2)
    End If
    
End Sub



Private Sub cargarCondVentas(pcdCliente As String)

    ObtenerCampo("cdCondVenta").Clear
    
    
    ' Las nc y nd deben seran realizadas a contado
    If objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante") = "ND" Or objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante") = "NC" Then
        ObtenerCampo("cdCondVenta").Clear ' Limpiamos opciones
        ObtenerCampo("cdCondVenta").AddItem "Contado"
        Exit Sub
    End If

    Select Case pcdCliente
    Case "1"
        ObtenerCampo("cdCondVenta").AddItem "Contado"
        ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
        ObtenerCampo("cdCondVenta").AddItem "Cobro en Destino"
        ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
        ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
        ObtenerCampo("cdCondVenta").AddItem "Retorno"
        ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
    Case Else
        ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
        ObtenerCampo("cdCondVenta").AddItem "Retorno"
    End Select
    
    
    ObtenerCampo("cdCondVenta").ListIndex = 0
    

End Sub


'/******************************************************/
'/ Configuramos la logica para condicion de ventas y
'/ comisión
Private Sub setearCondicionVentayComision()
Dim ltipo_destino    As String
Dim lcdCondVenta     As String
Dim lcdCliente       As String

    
    
    ' Las nc y nd deben seran realizadas a contado
    If objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante") = "ND" Or objParametros.ObtenerValor("Frm_VentaPasajes.tpComprobante") = "NC" Then
        ObtenerCampo("cdCondVenta").Clear ' Limpiamos opciones
        ObtenerCampo("cdCondVenta").AddItem "Contado"
        ObtenerCampo("cdCondVenta").Text = "Contado"
        Exit Sub
    End If
    
    ltipo_destino = obtenerTipoDestinoComision(ConcatenarDestinos())
    
    lcdCliente = IIf(ObtenerCampo("cdCliente") = "", "1", ObtenerCampo("cdCliente"))
    
    Select Case ltipo_destino
    Case "RETORNO"
            Select Case ObtenerCampo("tpFormadePago")
            Case "Cuenta Corriente"
                ObtenerCampo("cdCondVenta").Clear
                ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
                ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
                ObtenerCampo("tpComision").Clear
                ObtenerCampo("tpComision").AddItem "Retorno"
                ObtenerCampo("cdCondVenta") = "Cuenta Corriente"
                ObtenerCampo("tpComision") = "Retorno"
           Case Else
                ObtenerCampo("cdCondVenta").Clear
                ObtenerCampo("cdCondVenta").AddItem "Retorno"
                ObtenerCampo("tpComision").Clear
                ObtenerCampo("tpComision").AddItem "Retorno"
                ObtenerCampo("cdCondVenta") = "Retorno"
          End Select
    Case "DESCUENTO A EMPLEADOS"
            Select Case ObtenerCampo("tpFormadePago")
            Case "Cuenta Corriente"
                ObtenerCampo("cdCondVenta").Clear
                ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
                ObtenerCampo("cdCondVenta") = "Cuenta Corriente"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
                ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
                ObtenerCampo("tpComision").Clear
                ObtenerCampo("tpComision").AddItem "A Clientes"
                ObtenerCampo("tpComision").Text = "A Clientes"
           Case Else
                ObtenerCampo("cdCondVenta").Clear
                ObtenerCampo("cdCondVenta").AddItem "Contado"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
                ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
                ObtenerCampo("cdCondVenta").AddItem "Cobro en Destino"
                ObtenerCampo("cdCondVenta") = "Contado"
                ObtenerCampo("tpComision").Clear
                ObtenerCampo("tpComision").AddItem "A Empleados"
                ObtenerCampo("tpComision") = "A Empleados"
           End Select
    Case "A CLIENTES"
        Select Case ObtenerCampo("tpFormadePago")
        Case "Cuenta Corriente"
            ObtenerCampo("cdCondVenta").Clear
            ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
            ObtenerCampo("cdCondVenta") = "Cuenta Corriente"
        Case Else
            ObtenerCampo("cdCondVenta").Clear
            ObtenerCampo("cdCondVenta").AddItem "Contado"
            ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
            ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
            ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
            ObtenerCampo("cdCondVenta").AddItem "Cobro en Destino"
            ObtenerCampo("cdCondVenta") = "Contado"
        End Select
        ObtenerCampo("tpComision").Clear
        ObtenerCampo("tpComision").AddItem "A Clientes"
        ObtenerCampo("tpComision").Text = "A Clientes"
   End Select
        
    
End Sub
'/******************************************************/

Private Function obtenerTipoDestinoComision(pdsDestino As String) As String


    
    If InStr(1, obtenerPrimerDestino(), "retorno", vbTextCompare) > 0 Then
        obtenerTipoDestinoComision = "RETORNO"
        Exit Function
    End If

    
    If InStr(1, pdsDestino, "descuento a empleados", vbTextCompare) > 0 Then
        obtenerTipoDestinoComision = "DESCUENTO A EMPLEADOS"
        Exit Function
    End If

    If InStr(1, pdsDestino, "empleados", vbTextCompare) > 0 Then
        obtenerTipoDestinoComision = "DESCUENTO A EMPLEADOS"
        Exit Function
    End If
    
    
    obtenerTipoDestinoComision = "A CLIENTES"
    
End Function


Private Function obtenerPrimerDestino() As String
Dim i     As Integer
Dim strDato   As String

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        strDato = strDato + IIf(i <> 1, " - ", "") + _
        Me.lstItemsFactura.ListItems.Item(i).ListSubItems(const_dsProducto).Text
        Exit For
    Next

    obtenerPrimerDestino = Mid(strDato, 1, 100)

End Function



Private Function ExisteComprobante() As Boolean
Dim ldsUsuario As String
Dim lnrCaja As String

        If ObtenerCampo("nrTalonario").Text = "" Then Exit Function
        If ObtenerCampo("nrComprobante").Text = "" Then Exit Function
        If ObtenerCampo("tpComprobante").Text = "" Then Exit Function
        

        ObjTablasIO.nmTabla = "TB_Comprobantes"
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
        ObjTablasIO.setearCampoOperadorValor "flManual", "=", "M", " AND "
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", ObtenerCampo("nrTalonario").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", ObtenerCampo("nrComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", ObtenerCampo("tpComprobante").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", ObtenerCampo("tpLetra").Text
        ObjTablasIO.setearCampoOperadorValor "flManual", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nrcaja", "->", ""
        
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
             ldsUsuario = ObjTablasIO.rs_resultados("dsUsuario").value
             lnrCaja = ObjTablasIO.rs_resultados("nrCaja").value
            AvisarError "nrComprobante", True
            If frm_SeleccionarPuesto.Visible = False Then
                MsgBox "Este Comprobante ha sido cargado por el usuario " + ldsUsuario + ". Nro de caja. " + lnrCaja, vbInformation + vbDefaultButton1, "Atención"
                ObtenerCampo("nrComprobante").SetFocus
                ExisteComprobante = True
            End If
            ExisteComprobante = True
        Else
            ExisteComprobante = False
        End If

End Function




