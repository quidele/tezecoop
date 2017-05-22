VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form Frm_FacturaCtaCte 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Facturar la Cta. Cte."
   ClientHeight    =   5925
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9840
   Icon            =   "Frm_FacturaCtaCte.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   5925
   ScaleWidth      =   9840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   9840
      _ExtentX        =   17357
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
      MouseIcon       =   "Frm_FacturaCtaCte.frx":030A
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
               Picture         =   "Frm_FacturaCtaCte.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":1786
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
               Picture         =   "Frm_FacturaCtaCte.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":2EF6
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_FacturaCtaCte.frx":334A
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraVentaPasajes 
      Caption         =   "Datos de la Factura"
      Height          =   5055
      Left            =   75
      TabIndex        =   7
      Top             =   705
      Width           =   8970
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdComprobante"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   25
         Left            =   2985
         Locked          =   -1  'True
         TabIndex        =   41
         TabStop         =   0   'False
         Tag             =   "tpComprobante"
         Top             =   480
         Width           =   585
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdComprobante"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   26
         Left            =   3555
         Locked          =   -1  'True
         TabIndex        =   40
         TabStop         =   0   'False
         Tag             =   "tpLetra"
         Top             =   480
         Width           =   405
      End
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   2
         ItemData        =   "Frm_FacturaCtaCte.frx":39C4
         Left            =   120
         List            =   "Frm_FacturaCtaCte.frx":39DA
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   39
         TabStop         =   0   'False
         Tag             =   "tpIVA"
         Top             =   480
         Width           =   780
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
         Left            =   4845
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   35
         TabStop         =   0   'False
         Tag             =   "nmLicenciatario"
         Text            =   "Coop. Taxi Ezeiza"
         Top             =   4485
         Visible         =   0   'False
         Width           =   2475
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   13
         Left            =   4020
         TabIndex        =   34
         Tag             =   "nrLicencia"
         Text            =   "999"
         Top             =   4485
         Visible         =   0   'False
         Width           =   795
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_FacturaCtaCte.frx":39F6
         Left            =   1890
         List            =   "Frm_FacturaCtaCte.frx":3A03
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "tpComision"
         Top             =   3330
         Width           =   1725
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   3
         Left            =   3750
         TabIndex        =   8
         Tag             =   "nrDoc"
         Top             =   1035
         Width           =   2100
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   50
         Left            =   5880
         TabIndex        =   10
         Tag             =   "dsEmail"
         Top             =   1035
         Width           =   2925
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   6
         Left            =   1080
         TabIndex        =   6
         Tag             =   "dsRazonSocial"
         Text            =   "Consumidor Final"
         Top             =   1035
         Width           =   2640
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   5
         Left            =   150
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "cdCliente"
         Top             =   1035
         Width           =   900
      End
      Begin VB.CommandButton cmdFacturar 
         Caption         =   "&Facturar"
         Height          =   375
         Left            =   165
         TabIndex        =   3
         ToolTipText     =   "Imprimir la Factura"
         Top             =   4485
         Width           =   2940
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   23
         Left            =   3945
         Locked          =   -1  'True
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "dtComprobante"
         Top             =   480
         Width           =   1335
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
         Left            =   165
         Locked          =   -1  'True
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "vlTotalGeneral"
         Text            =   "0"
         Top             =   4005
         Width           =   1020
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdComprobante"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   1725
         Locked          =   -1  'True
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "nrComprobante"
         Top             =   480
         Width           =   1320
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   1
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "nrTalonario"
         Top             =   480
         Width           =   765
      End
      Begin VB.ComboBox Combox1 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   0
         ItemData        =   "Frm_FacturaCtaCte.frx":3A29
         Left            =   120
         List            =   "Frm_FacturaCtaCte.frx":3A3F
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "cdCondVenta"
         Top             =   3345
         Width           =   1725
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   8
         Left            =   3645
         TabIndex        =   2
         TabStop         =   0   'False
         Tag             =   "dsLeyenda"
         Top             =   3345
         Width           =   5130
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   10
         Left            =   5295
         Locked          =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "nmEmpleado"
         Top             =   480
         Width           =   1800
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   11
         Left            =   7110
         Locked          =   -1  'True
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "nrPuesto"
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   12
         Left            =   7740
         Locked          =   -1  'True
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "nrCaja"
         Top             =   480
         Width           =   1080
      End
      Begin MSComctlLib.ListView lstItemsFactura 
         Height          =   1350
         Left            =   135
         TabIndex        =   33
         Top             =   1680
         Width           =   8640
         _ExtentX        =   15240
         _ExtentY        =   2381
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
            Size            =   9
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
            Object.Width           =   12171
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "tpOperacion"
            Object.Tag             =   "tpOperacion"
            Text            =   "Operación"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "vlPorcentaje"
            Object.Tag             =   "vlPorcentaje"
            Text            =   "Porcentaje"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "vlPrecioPeaje"
            Object.Tag             =   "vlPrecioPeaje"
            Text            =   "Peaje"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "vlPrecioViaje"
            Object.Tag             =   "vlPrecioViaje"
            Text            =   "Precio Total"
            Object.Width           =   2558
         EndProperty
      End
      Begin VB.Label lblLabels 
         Caption         =   "Doc"
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
         Index           =   8
         Left            =   2970
         TabIndex        =   43
         Top             =   240
         Width           =   375
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
         Index           =   7
         Left            =   3465
         TabIndex        =   42
         Top             =   240
         Width           =   465
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
         Index           =   4
         Left            =   90
         TabIndex        =   38
         Top             =   240
         Width           =   690
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
         Left            =   4860
         TabIndex        =   37
         Top             =   4245
         Visible         =   0   'False
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
         Left            =   4005
         TabIndex        =   36
         Top             =   4245
         Visible         =   0   'False
         Width           =   750
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
         TabIndex        =   32
         Top             =   3105
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
         TabIndex        =   31
         Top             =   1440
         Width           =   1455
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
         TabIndex        =   30
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
         TabIndex        =   29
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
         TabIndex        =   28
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
         TabIndex        =   27
         Top             =   825
         Width           =   1140
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
         Left            =   135
         TabIndex        =   26
         Top             =   3750
         Width           =   1080
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
         TabIndex        =   25
         Top             =   240
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
         TabIndex        =   24
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
         Left            =   825
         TabIndex        =   23
         Top             =   255
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
         TabIndex        =   22
         Top             =   3090
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
         TabIndex        =   21
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
         Left            =   3660
         TabIndex        =   20
         Top             =   3120
         Width           =   4230
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
         Left            =   5280
         TabIndex        =   19
         Top             =   240
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
         TabIndex        =   18
         Top             =   240
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
         TabIndex        =   17
         Top             =   240
         Width           =   870
      End
   End
End
Attribute VB_Name = "Frm_FacturaCtaCte"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

 
Dim EstadoABM         As Byte
Dim objControl        As New CControl
Dim vlparametro_PUESTO_FACTURACION_CTA_CTE As String
' V4.6
Dim objServicePrinter As Object


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
    Me.Combox1(0).ListIndex = 0
    
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
    
    ListItemNuevo.SubItems(1) = ObtenerCampo("dsProducto").Text
    ListItemNuevo.SubItems(2) = ObtenerCampo("tpOperacion").Text
    ListItemNuevo.SubItems(3) = ObtenerCampo("vlPorcentaje").Text
    ListItemNuevo.SubItems(4) = ObtenerCampo("vlPrecioPeaje").Text
    ListItemNuevo.SubItems(5) = CStr(lvlPrecioViaje)
    
    
    Recalculo_operaciones
    
    If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
       ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" Then
        CalcularSaldos "vlTotalPesos"
    End If
  
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
    
    ObtenerCampo("cdCondVenta").SetFocus
    
    
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

End Sub


Private Sub cmdFacturar_Click()
Dim resp   As Integer


    Me.cmdFacturar.Enabled = False
    If Not validarEntradadedatos() Then
        Me.cmdFacturar.Enabled = True
        Exit Sub
    End If
    
    ' Verificar que el monto no sea negativo
    If Not FormadepagoOK() Then
         Me.cmdFacturar.Enabled = True
         Exit Sub
    End If
    
    objbasededatos.BeginTrans
    
    If Guardarregistro(EstadoABM) Then
           If Not GrabarItemsFactura() Then
                objbasededatos.RollBackTrans
                MsgBox "No se Podido grabar los items de la factura, por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
                Me.cmdFacturar.Enabled = True
                Exit Sub
           End If
           If Not GrabarTabladeCupones() Then
                objbasededatos.RollBackTrans
                MsgBox "No se Podido grabar en la cuenta del Licenciatario, por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
                Me.cmdFacturar.Enabled = True
                Exit Sub
           End If
           
           Select Case objUsuario.tpAcceso
           Case "Puestos"
               Select Case ObtenerCampo("cdCondVenta").Text
               Case "Contado"
                   ActualizarCaja
               End Select
           End Select
           
           
           '**********************************************************
           '* Código creado para Gestión V2
           ' Actualizamos los numeros de talonarios y comprobantes
           If CLng(ObtenerCampo("nrComprobante")) > MAX_VALOR_COMPROBANTE Then
                objbasededatos.RollBackTrans
                MsgBox "ERROR: El talonario ha llegado a su fin, por favor de aviso a la administración", vbInformation + vbDefaultButton1, "Atención"
                Exit Sub
           End If
                        
                        
           If UCase(objParametros.ObtenerValor("FacturarCtaCte.tipofacturacion")) <> "MANUAL" Then
                '**********************************************************
                ' Version 4.7 VERIFICAR EL PROCEDIMIENTO
                 If Not grabarPuesto() Then
                     objbasededatos.RollBackTrans
                     MsgBox "ERROR: " + objbasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
                     Exit Sub
                 End If
                '**********************************************************
           End If
           
           On Error Resume Next
           objbasededatos.CommitTrans
           If Err Then
               objbasededatos.RollBackTrans
               MsgBox "Error: no se pudo insertar el registro, " _
              + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
               Me.cmdFacturar.Enabled = True
               Exit Sub
           End If
           On Error GoTo 0
           ImprimirFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante"), ObtenerCampo("tpComprobante"), ObtenerCampo("tpLetra")
           objParametros.GrabarValor "FacturarCtaCte.Facturado", "SI"
           Sleep (8000)
           Unload Me
    Else
         objbasededatos.RollBackTrans
         MsgBox "Error: no se pudo insertar el registro, " _
         + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
         Me.cmdFacturar.Enabled = True
    End If
    
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
            Case "Retorno"
            End Select
    Case "cdCondVenta"
       Select Case ObtenerCampo("cdCondVenta").Text
       Case "Retorno", "Tarjeta de Débito", "Tarjeta de Crédito"
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
            ObtenerCampo("tpComprobante") = "C"
       Case "Cuenta Corriente"
            ObtenerCampo("tpComprobante") = "X"
            ObtenerCampo("tpComision").Text = "A Clientes"
            ObtenerCampo("tpComision").Locked = False
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Recibos", "IdRecibo", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
       Case "Cobro en Destino"
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            ObtenerCampo("tpComprobante") = "C"
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
        Case Else
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
            strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
            ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
            ObtenerCampo("tpComprobante") = "C"
        End Select
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
            ObtenerCampo("dsLeyenda").SetFocus
        End Select
    Case vbKeyBack, vbKeyLeft
        Select Case Me.Combox1(Index).Tag
        Case "cdCondVenta"
            Me.lstItemsFactura.SetFocus
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
        'If Me.cmdAgregarItemFactura.Enabled Then
        '    cmdAgregarItemFactura_Click
        'End If
    End Select


End Sub

Private Sub Form_Load()
Dim strSQL     As String
Dim strValor   As String

    
        ' v4.6
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.ServicePrinter"
    Set objServicePrinter = CreateObject("SGLibrary.ServicePrinter")
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.ServicePrinter OK "
    
    ' Eulises: obtener parametro PUESTO_FACTURACION_CTA_CTE
    vlparametro_PUESTO_FACTURACION_CTA_CTE = objParametros.ObtenerValorBD("PUESTO_FACTURACION_CTA_CTE")

    objParametros.GrabarValor "Facturar", "NO"
    
    
    EstadoABM = facturar
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    SelecionarItemCombo

    
    
    strValor = objParametros.ObtenerValor("FacturarCtaCte.nrTalonario")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrTalonario", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
    strValor = objParametros.ObtenerValor("FacturarCtaCte.nrComprobante")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
    ObtenerCampo("tpComprobante").Text = "FA"
    
    strValor = objParametros.ObtenerValor("FacturarCtaCte.tpLetra")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "tpLetra", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
    
  
      ObtenerCampo("tpLetra").Text = objParametros.ObtenerValor("FacturarCtaCte.tpLetra")
    '***********************************************************
    ' Agregado en la version 1.8  - autoimpresion Empresas RI
    ' hasta que se habiliten la facturacion en la adm se setean el null
    strValor = objParametros.ObtenerValor("FacturarCtaCte.nrCAI")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "nrCAI", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
    strValor = objParametros.ObtenerValor("FacturarCtaCte.dtVencimiento")
    objDiccionariodeDatos.GuardarValorCampo "TB_Comprobantes", "dtVencimiento", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
    '***********************************************************

    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    
    
End Sub


' Version 4.7 VERIFICAR EL PROCEDIMIENTO
' MDY Modificado en la version 4.7
Private Function grabarPuesto() As Boolean

        grabarPuesto = False

        '***********************************************************
        objSPs.nmStoredProcedure = "spu_actualizar_puntosdeventa_facturacion_v4_7"
        objSPs.setearCampoValor "@nrPuesto_param", vlparametro_PUESTO_FACTURACION_CTA_CTE
        objSPs.setearCampoValor "@tipo_iva", ObtenerCampo("tpIVA").Text
        objSPs.setearCampoValor "@auto_impresor", IIf(UCase(objParametros.ObtenerValor("FacturarCtaCte.tipofacturacion")) = "MANUAL", "N", "S")
        objSPs.setearCampoValor "@tpComprobante", ObtenerCampo("tpComprobante").Text
        objSPs.setearCampoValor "@nrComprobante", CStr(CLng(ObtenerCampo("nrComprobante")))
    
        If Not objSPs.ExecSP Then
            MsgBox "No se puedo actualizar el numero de comprobante " + _
                   vbCrLf + " para el puesto o punto de venta que ingresó al sistema.", vbCritical + vbDefaultButton1, "Atención"
            End
        End If
        
        grabarPuesto = True
           
End Function




Private Sub SelecionarItemCombo()
    Dim i As Integer
    
    For i = Combox1.LBound To Combox1.UBound
        If Combox1(i).ListCount > 0 Then
            Combox1(i).ListIndex = 0
        End If
    Next i
    
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim ItemList    As ListItem

    Select Case Button.Key
    Case "Agregar"
           If Not EstadoABM = facturar Then
            EstadoABM = alta
           End If
           limpiarControles
           
           objParametros.GrabarValor "FacturarCtaCte.Facturado", "NO"
           
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE)
           ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
           strValor = objDiccionariodeDatos.ObtenerValorFijo("TB_Comprobantes", "nrTalonario", vlparametro_PUESTO_FACTURACION_CTA_CTE)
           ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
           ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("FacturarCtaCte.nrCaja")
           ObtenerCampo("nrPuesto").Text = objParametros.ObtenerValor("nrPuesto")
           ObtenerCampo("nmEmpleado").Text = objUsuario.nmEmpleado
           ObtenerCampo("vlTotalGeneral").Text = objParametros.ObtenerValor("FacturarCtaCte.vlTotal")
           ObtenerCampo("cdCliente").Text = objParametros.ObtenerValor("FacturarCtaCte.cdCliente")
           ObtenerCampo("dsRazonSocial").Text = objParametros.ObtenerValor("FacturarCtaCte.dsRazonSocial")
           ObtenerCampo("nrDoc").Text = objParametros.ObtenerValor("FacturarCtaCte.nrDoc")
           ObtenerCampo("dsEmail").Text = objParametros.ObtenerValor("FacturarCtaCte.dsEmail")
           ObtenerCampo("tpComprobante").Text = objParametros.ObtenerValor("FacturarCtaCte.tpComprobante")
           ObtenerCampo("tpLetra").Text = objParametros.ObtenerValor("FacturarCtaCte.tpLetra")
           
           ' version 1.4
           If objParametros.ObtenerValor("FacturarCtaCte.tpIVA") = "" Then
                ObtenerCampo("tpIVA").Text = "CF"
           Else
                ObtenerCampo("tpIVA").Text = objParametros.ObtenerValor("FacturarCtaCte.tpIVA")
           End If
           
           Set ItemList = lstItemsFactura.ListItems.Add(1, , "999")
           ItemList.SubItems(1) = objParametros.ObtenerValor("FacturarCtaCte.dsDetalle")
           ItemList.SubItems(5) = objParametros.ObtenerValor("FacturarCtaCte.vlTotal")
           ObtenerCampo("nrLicencia").Text = "999"
           ObtenerCampo("nmLicenciatario").Text = "Coop. Taxi Ezeiza"
           HabilitarCampos "cdCliente", False
           HabilitarCampos "dsRazonSocial", False
           HabilitarCampos "nrDoc", False
           HabilitarCampos "dsEmail", False
           
           If objParametros.ObtenerValor("FacturarCtaCte.TipoFacturacion") = "Manual" Then
            HabilitarCampos "nrComprobante", True
           End If
               
           PresentarPantalla Button
           
    Case "Salir"
           Unload Me
    Case "Aceptar"
         cmdFacturar_Click
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
    
    If Trim(ObtenerCampo("cdCliente").Text) = "" Then
        MsgBox "Debe ingresar un 'Cliente'", vbCritical + vbDefaultButton1, "Atención"
        AvisarError "cdCliente", True
        validarEntradadedatos = False
    End If
    
    
    validarEntradadedatos = Not ExisteComprobante()
    




End Function


    
Private Function ExisteComprobante() As Boolean
Dim ldsUsuario As String
Dim lnrCaja As String

        If ObtenerCampo("nrTalonario").Text = "" Then Exit Function
        If ObtenerCampo("nrComprobante").Text = "" Then Exit Function
        If ObtenerCampo("tpComprobante").Text = "" Then Exit Function
        

        ObjTablasIO.nmTabla = "TB_Comprobantes"
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

Private Function GrabarDatosdelCliente() As Boolean
Dim strValor As String

    GrabarDatosdelCliente = True
    If ObtenerCampo("dsRazonSocial").Text <> "" Then
        
        ObjTablasIO.nmTabla = "TB_Clientes"
        ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", ObtenerCampo("dsRazonSocial").Text
        ObjTablasIO.setearCampoOperadorValor "nrDoc", "<-", ObtenerCampo("nrDoc").Text
        ObjTablasIO.setearCampoOperadorValor "dsEmail", "<-", ObtenerCampo("dsEmail").Text
      
        If UCase(ObtenerCampo("cdCliente").Text) = UCase("(Nuevo)") Then
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Clientes", "cdCliente", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", strValor
            ObjTablasIO.Insertar
            objDiccionariodeDatos.GuardarSiguienteValor "TB_Clientes", "cdCliente", vlparametro_PUESTO_FACTURACION_CTA_CTE
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



Private Function GrabarItemsFactura()
Dim i     As Integer

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        
        ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobante", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetra", "<-", ObtenerCampo("tpLetra").Text
        ObjTablasIO.setearCampoOperadorValor "nrItem", "<-", CStr(i)
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", Me.lstItemsFactura.ListItems(i).Text
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(1)
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(2)
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(4)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(5)
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Date)
        ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", ObtenerCampo("nrCaja").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", vlparametro_PUESTO_FACTURACION_CTA_CTE
        
        
        If ObjTablasIO.Insertar() Then
            GrabarItemsFactura = True
        Else
            GrabarItemsFactura = False
        End If
    Next

End Function


Private Function GrabarTabladeCupones() As Boolean
Dim i             As Integer
Dim strValor      As String
Dim cdCodBar      As String
Dim vlComision    As Single
        
        
        GrabarTabladeCupones = False
        
        ' obtener la comision
        vlComision = 0
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "<-", ObtenerCampo("nrTalonario").Text
        ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "<-", ObtenerCampo("nrComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "<-", ObtenerCampo("tpComprobante").Text
        ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "<-", ObtenerCampo("tpLetra").Text
        
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", ObtenerCampo("cdCliente").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", vlparametro_PUESTO_FACTURACION_CTA_CTE
        ObjTablasIO.setearCampoOperadorValor "nrLicencia", "<-", ObtenerCampo("nrLicencia").Text
        ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "<-", ObtenerCampo("nmLicenciatario").Text
        ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "<-", ObtenerCampo("vlTotalGeneral").Text
        
        ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "<-", ObtenerCampo("vlTotalGeneral").Text
        ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "<-", "0"
        ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "<-", "0"
        
        ObjTablasIO.setearCampoOperadorValor "nrCantidadBultos", "<-", "0"
        ObjTablasIO.setearCampoOperadorValor "tpCupon", "<-", ObtenerCampo("cdCondVenta").Text
            
        
        Select Case ObtenerCampo("cdCondVenta").Text
        Case "Contado"
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "dtCobradoalCliente", "<-", CStr(Now)
            ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "0"
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
        
        ObjTablasIO.setearCampoOperadorValor "dtCajaCliente", "<-", CStr(Now)
        ObjTablasIO.setearCampoOperadorValor "nrCajaCliente", "<-", ObtenerCampo("nrCaja").Text
        ObjTablasIO.setearCampoOperadorValor "dtCupon", "<-", CStr(Now)
        ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", objUsuario.dsUsuario
        ObjTablasIO.setearCampoOperadorValor "nrPasajeros", "<-", "0"
        
        cdCodBar = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
        cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
        cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrLicencia").Text, 3)
    
        ObjTablasIO.setearCampoOperadorValor "cdCodBar", "<-", cdCodBar
        
    
        ObjTablasIO.setearCampoOperadorValor "dsDestino", "<-", ConcatenarDestinos()
        ObjTablasIO.setearCampoOperadorValor "dsHoraViaje", "<-", CStr(Format(Now, "HH:MM"))
        
        
        ' strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cupones", "nrCupon", vlparametro_PUESTO_FACTURACION_CTA_CTE)
        
        objSPs.nmStoredProcedure = "SP_ObtenerMaxnrCupon_v1_3"
        objSPs.setearCampoValor "@nrPuesto", vlparametro_PUESTO_FACTURACION_CTA_CTE
        If Not objSPs.ExecSP() Then
            Exit Function
        End If
        
        strValor = CStr(objbasededatos.rs_resultados("nrMaxCupon").value)
        objDiccionariodeDatos.GuardarValorCampo "TB_Cupones", "nrCupon", vlparametro_PUESTO_FACTURACION_CTA_CTE, strValor
        
        strValor = CStr(CDbl(strValor) + 1)
        ObjTablasIO.setearCampoOperadorValor "nrCupon", "<-", strValor

        If ObjTablasIO.Insertar Then
            GrabarTabladeCupones = True
            objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCupon", vlparametro_PUESTO_FACTURACION_CTA_CTE
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
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Productos", "cdProducto", vlparametro_PUESTO_FACTURACION_CTA_CTE)
            ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", strValor
            ObjTablasIO.Insertar
            
            objProductos.InsertarNuevoItemEnlaMatrizProductos _
                strValor, _
                Me.lstItemsFactura.ListItems(i).SubItems(1), _
                Me.lstItemsFactura.ListItems(i).SubItems(4), _
                Me.lstItemsFactura.ListItems(i).SubItems(6), _
                "0,00", _
                Me.lstItemsFactura.ListItems(i).SubItems(2), _
                Me.lstItemsFactura.ListItems(i).SubItems(5)

            objDiccionariodeDatos.GuardarSiguienteValor "TB_Productos", "cdProducto", vlparametro_PUESTO_FACTURACION_CTA_CTE
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
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
        If ObjTablasIO.Actualizar() Then
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



'    strValor = ""
'    strSQL = " SP_ObtenerMaxNroComprobanteporTalonario "
'                        strSQL = strSQL + "@nrTalonario='" + ObtenerCampo("nrTalonario").Text + "',"
'                        strSQL = strSQL + "@tpLetra='" + ObtenerCampo("tpComprobante").Text + "',"
'                        strSQL = strSQL + "@tpComprobante='" + ObtenerCampo("tpComprobante").Text + "'"
'
'    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
'        Guardarregistro = False
'        Exit Function
'    End If
'
'    strValor = CStr(objbasededatos.rs_resultados(0).value)
'
'    If ObtenerCampo("tpComprobante").Text = "C" Then
'        objDiccionariodeDatos.GuardarValorCampo _
'            "TB_Comprobantes", "nrComprobante", _
'            ObtenerCampo("nrPuesto").Text, strValor
'    End If
'
'    strValor = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
'    ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
    
    

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
            
            
    cdCodBarAFIP = ObtenerCodBarrasAFIP()
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional3", "<-", cdCodBarAFIP
    
    cdCodBarLic = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
    cdCodBarLic = cdCodBarLic + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
    cdCodBarLic = cdCodBarLic + "999"
    
    ObjTablasIO.setearCampoOperadorValor _
              "cdCodBar", "<-", cdCodBarLic
    
    ObjTablasIO.setearCampoOperadorValor _
              "dtCaja", "<-", CStr(Now)
    ObjTablasIO.setearCampoOperadorValor _
              "dtInsercion", "<-", CStr(Now)
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional1", "<-", CStr(Format(Now, "HH:MM"))
              
    ObjTablasIO.setearCampoOperadorValor "IdReciboCtaCte", "<-", objParametros.ObtenerValor("FacturarCtaCte.IdRecibo")

              
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "nrCAI", vlparametro_PUESTO_FACTURACION_CTA_CTE)
    ObjTablasIO.setearCampoOperadorValor _
    "nrCAI", "<-", strValor
    
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "dtVencimiento", vlparametro_PUESTO_FACTURACION_CTA_CTE)
    ObjTablasIO.setearCampoOperadorValor _
    "dtVencimiento", "<-", strValor
    
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlPagoPesos", "<-", ObtenerCampo("vlTotalGeneral").Text
    
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaDolar", "<-", objParametros.ObtenerValor("vlDiaDolar")
    
    ObjTablasIO.setearCampoOperadorValor _
              "vlDiaEuro", "<-", objParametros.ObtenerValor("vlDiaEuro")
              
    
              
    ObjTablasIO.setearCampoOperadorValor _
              "dsOpcional2", "<-", ConcatenarDestinos()
              
    
    ' ObjTablasIO.setearCampoOperadorValor _
    '           "tpLetra", "<-", ObtenerCampo("tpComprobante").Text
              
    
    ObjTablasIO.setearCampoOperadorValor _
              "dsUsuario", "<-", objUsuario.dsUsuario
    
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
                    objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", vlparametro_PUESTO_FACTURACION_CTA_CTE
                Else
                    If ObtenerCampo("tpComprobante").Text = "X" Then
                        objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", vlparametro_PUESTO_FACTURACION_CTA_CTE
                    Else
                        objDiccionariodeDatos.GuardarSiguienteValor "TB_Comprobantes", "nrComprobante", vlparametro_PUESTO_FACTURACION_CTA_CTE
                    End If
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
    ("TB_Comprobantes", "nrCAI", vlparametro_PUESTO_FACTURACION_CTA_CTE)
    ObjTablasIO.setearCampoOperadorValor _
    "nrCAI", "<-", strValor
    
    strValor = objDiccionariodeDatos.ObtenerValorActual _
    ("TB_Comprobantes", "dtVencimiento", vlparametro_PUESTO_FACTURACION_CTA_CTE)
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
                ("TB_Comprobantes", "nrCAI", vlparametro_PUESTO_FACTURACION_CTA_CTE)
    
    strCodAFIP = strCodAFIP + Format(objDiccionariodeDatos.ObtenerValorActual _
                ("TB_Comprobantes", "dtVencimiento", vlparametro_PUESTO_FACTURACION_CTA_CTE), "DDMMYYYY")
                
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
    Case "vlTotalGeneral"
        ' calcularSaldo
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
    
    If vlaPagarEuros <> 0 And vlaPagarPesos = 0 Then
        vlaVueltoPesos = ObtenerValoresNumericos("vlSaldoEuros") * objConfig.vlDiaEuro
        ObtenerCampo("vlSaldoPesos").Text = vlaVueltoPesos
           If vlaPagarDolares = 0 Then
            ' ObtenerCampo("vlSaldoDolares").Text = FormatNumber(Round((ObtenerValoresNumericos("vlSaldoEuros") * objConfig.vlDiaEuro) / objConfig.vlDiaDolar, 0), 2)
            ObtenerCampo("vlSaldoDolares").Text = FormatNumber(0, 2)
        End If
    End If
    If vlaPagarDolares <> 0 And vlaPagarPesos = 0 Then
        vlaVueltoPesos = ObtenerValoresNumericos("vlSaldoDolares") * objConfig.vlDiaDolar
        ObtenerCampo("vlSaldoPesos").Text = vlaVueltoPesos
        If vlaPagarEuros = 0 Then
            ' ObtenerCampo("vlSaldoEuros").Text = FormatNumber(Round((ObtenerValoresNumericos("vlSaldoDolares") * objConfig.vlDiaDolar) / objConfig.vlDiaEuro, 0), 2)
            ObtenerCampo("vlSaldoEuros").Text = FormatNumber(0, 2)
        End If
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
                ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdCliente").Text, " AND "
                ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
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
                    HabilitarCampos "dsRazonSocial", False
                    HabilitarCampos "nrDoc", False
                    HabilitarCampos "dsEmail", False
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
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)


    Select Case KeyAscii
    Case vbKeyReturn
        Select Case Me.txtFields(Index).Tag
        Case "dsLeyenda"
            Me.cmdFacturar.SetFocus
        End Select
    Case vbKeyBack
        Select Case Me.txtFields(Index).Tag
        Case "dsLeyenda"
            If Not (Len(Me.txtFields(Index).Text) > 1) Then ObtenerCampo("tpComision").SetFocus
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
        Case "cdCliente"
            If Not ObtenerCampo("cdCliente").Text = "" Then
                buscarcampocliente
            End If
        Case "vlTotalGeneral", "vlPagoEuros", "vlPagoDolares", "vlPagoPesos"
            If ObtenerCampo("cdCondVenta").Text <> "Cuenta Corriente" And _
                ObtenerCampo("cdCondVenta").Text <> "Cobro en Destino" And _
                ObtenerCampo("cdCondVenta").Text <> "Retorno" And _
                ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Débito" And _
                ObtenerCampo("cdCondVenta").Text <> "Tarjeta de Crédito" Then
                CalcularSaldos Me.txtFields(Index).Tag
            End If
        End Select
        
    End If
    
End Sub

Private Function buscarlicencia() As Boolean
Dim strNombreCompleto As String

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
            
            
Private Function ImprimirFactura(ByVal pnrTalonario As String, _
ByVal pnrComprobante As String, ByVal tpComprobante As String, ByVal ptpLetra As String) As Boolean
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
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime_preimpreso.rpt"
        Case "CONTINUO"
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime_Continuo.rpt"
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
    

    '/******************************************************
    '/* Version 4.6  Solicitamos la impreso en la cual se desea imprimir
    ' MsgBox "SELECCIONE LA IMPRESORA"
    objServicePrinter.ConfigPrinter "impresion de la factura"
    '/*  Cierrre Version 4.6
    '/******************************************************
    
    
    
    Frm_Principal.CrystalReport1.Destination = crptToPrinter  ' crptToPrinter , crptToWindow
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
    DoEvents
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
            Exit Function
        End If
        MsgBox "Error al facturar la cta cte. " + Err.Description + " Nombre del archivo : " + Frm_Principal.CrystalReport1.ReportFileName
    End If
    On Error GoTo 0
    

    Sleep (5)
    ' MsgBox "antes de RollbackPrinter "
    objServicePrinter.RollbackPrinter
    
    objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    If Not objSPs.ExecSP Then
    
        objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
        objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
        If Not objSPs.ExecSP Then
            MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
            Exit Function
        End If
        MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        Exit Function
    End If
    
    Exit Function
    
    
   objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    If Not objSPs.ExecSP Then
        MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        Exit Function
    End If
    
'    Siempre Imprimiremos Original y duplicado
'    If objConfig.tpImpresion = "CONTINUO" Then
'        ImprimirFactura = True
'        Exit Function
'    End If

    ' IMPRESION DEL DUPLICADO
    
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
         If Err Then
           DoEvents
            Sleep (500)
            Frm_Principal.CrystalReport1.Action = 1
            objParametros.GrabarValor "Frm_FacturaCtaCte.Error", Err.Description + " Nombre del archivo : " + Frm_Principal.CrystalReport1.ReportFileName
         End If
    On Error GoTo 0
    
    ImprimirFactura = True
    
End Function


