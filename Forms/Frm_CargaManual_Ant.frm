VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{00025600-0000-0000-C000-000000000046}#4.6#0"; "crystl32.ocx"
Begin VB.Form Frm_CargaManual 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Carga Manual de Facturas"
   ClientHeight    =   7695
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9270
   Icon            =   "Frm_CargaManual.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7695
   ScaleWidth      =   9270
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   40
      Top             =   0
      Width           =   9270
      _ExtentX        =   16351
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgCargaManual"
      HotImageList    =   "imgCargaManualResaltado"
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
      MouseIcon       =   "Frm_CargaManual.frx":030A
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
      Begin MSComctlLib.ImageList imgCargaManualResaltado 
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
               Picture         =   "Frm_CargaManual.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgCargaManual 
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
               Picture         =   "Frm_CargaManual.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":2EF6
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":334A
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraCargaManual 
      BorderStyle     =   0  'None
      Height          =   6960
      Left            =   -60
      TabIndex        =   0
      Top             =   645
      Width           =   9285
      Begin VB.Frame Frame2 
         Caption         =   "Datos de la Factura"
         Height          =   4875
         Left            =   255
         TabIndex        =   49
         Top             =   2070
         Width           =   8895
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
            Left            =   6225
            Locked          =   -1  'True
            TabIndex        =   71
            TabStop         =   0   'False
            Tag             =   "vlTotalDolares"
            Text            =   "0"
            Top             =   3855
            Width           =   1110
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
            Left            =   5100
            Locked          =   -1  'True
            TabIndex        =   70
            TabStop         =   0   'False
            Tag             =   "vlTotalEuros"
            Text            =   "0"
            Top             =   3855
            Width           =   1110
         End
         Begin VB.TextBox txtItemFactura 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   0
            Left            =   4065
            Locked          =   -1  'True
            TabIndex        =   69
            Tag             =   "tpOperacion"
            Top             =   1590
            Width           =   1455
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   23
            Left            =   3975
            TabIndex        =   15
            Tag             =   "dtComprobante"
            Top             =   645
            Width           =   1365
         End
         Begin VB.CommandButton cmdAgregarItemFactura 
            Enabled         =   0   'False
            Height          =   285
            Left            =   8325
            Picture         =   "Frm_CargaManual.frx":39C4
            Style           =   1  'Graphical
            TabIndex        =   29
            Top             =   1605
            Width           =   285
         End
         Begin VB.TextBox txtItemFactura 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   4
            Left            =   6675
            Locked          =   -1  'True
            TabIndex        =   28
            Tag             =   "vlPrecioViaje"
            Top             =   1590
            Width           =   1590
         End
         Begin VB.TextBox txtItemFactura 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   3
            Left            =   5520
            Locked          =   -1  'True
            TabIndex        =   27
            Tag             =   "vlPorcentaje"
            Top             =   1590
            Width           =   1155
         End
         Begin VB.TextBox txtItemFactura 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   1035
            Locked          =   -1  'True
            TabIndex        =   26
            Tag             =   "dsProducto"
            Top             =   1590
            Width           =   3045
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            BackColor       =   &H00FFFFFF&
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
            ForeColor       =   &H000000FF&
            Height          =   285
            Index           =   7
            Left            =   7365
            TabIndex        =   32
            TabStop         =   0   'False
            Tag             =   "vlTotalGeneral"
            Text            =   "0"
            Top             =   3855
            Width           =   1230
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   2
            ItemData        =   "Frm_CargaManual.frx":3AC4
            Left            =   2370
            List            =   "Frm_CargaManual.frx":3AD1
            Style           =   2  'Dropdown List
            TabIndex        =   20
            Tag             =   "tpMoneda"
            Top             =   1185
            Width           =   1395
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   13
            Left            =   3795
            TabIndex        =   21
            Tag             =   "nrLicencia"
            Top             =   1200
            Width           =   750
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
            Left            =   4530
            Locked          =   -1  'True
            TabIndex        =   22
            TabStop         =   0   'False
            Tag             =   "nmLicenciatario"
            Top             =   1185
            Width           =   2535
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            DataField       =   "cdComprobante"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1755
            TabIndex        =   13
            Tag             =   "nrComprobante"
            Top             =   660
            Width           =   1350
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   1
            ItemData        =   "Frm_CargaManual.frx":3AEC
            Left            =   3135
            List            =   "Frm_CargaManual.frx":3AF9
            Locked          =   -1  'True
            Style           =   2  'Dropdown List
            TabIndex        =   14
            TabStop         =   0   'False
            Tag             =   "tpComprobante"
            Top             =   645
            Width           =   855
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   975
            TabIndex        =   12
            Tag             =   "nrTalonario"
            Top             =   660
            Width           =   780
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   0
            ItemData        =   "Frm_CargaManual.frx":3B09
            Left            =   255
            List            =   "Frm_CargaManual.frx":3B16
            Style           =   2  'Dropdown List
            TabIndex        =   19
            Tag             =   "cdCondVenta"
            Top             =   1170
            Width           =   2070
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   4
            Left            =   255
            Locked          =   -1  'True
            TabIndex        =   11
            TabStop         =   0   'False
            Tag             =   "tpIVA"
            Text            =   "Exento"
            Top             =   660
            Width           =   720
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   8
            Left            =   240
            TabIndex        =   31
            Tag             =   "dsLeyenda"
            Top             =   3810
            Width           =   4470
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   10
            Left            =   5340
            Locked          =   -1  'True
            TabIndex        =   16
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   645
            Width           =   1800
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   11
            Left            =   7155
            Locked          =   -1  'True
            TabIndex        =   17
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   645
            Width           =   600
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   12
            Left            =   7785
            Locked          =   -1  'True
            TabIndex        =   18
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   645
            Width           =   825
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   14
            Left            =   7080
            TabIndex        =   23
            Tag             =   "nrBultos"
            Text            =   "1"
            Top             =   1170
            Width           =   405
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   15
            Left            =   7740
            TabIndex        =   24
            Tag             =   "nrPasajeros"
            Text            =   "1"
            Top             =   1185
            Width           =   435
         End
         Begin MSComctlLib.ListView lstItemsFactura 
            Height          =   1590
            Left            =   225
            TabIndex        =   30
            Top             =   1935
            Width           =   8355
            _ExtentX        =   14737
            _ExtentY        =   2805
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
            NumItems        =   5
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Key             =   "cdProducto"
               Object.Tag             =   "cdProducto"
               Text            =   "Código"
               Object.Width           =   1385
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Key             =   "dsProducto"
               Object.Tag             =   "dsProducto"
               Text            =   "Descripción"
               Object.Width           =   6174
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Key             =   "tpOperacion"
               Text            =   "Operación"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Key             =   "vlPorcentaje"
               Object.Tag             =   "vlPorcentaje"
               Text            =   "Porcentaje"
               Object.Width           =   2047
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Key             =   "vlPrecioUnitario"
               Object.Tag             =   "vlPrecioUnitario"
               Text            =   "Precio Unitario"
               Object.Width           =   2858
            EndProperty
         End
         Begin VB.TextBox txtItemFactura 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   270
            TabIndex        =   25
            Tag             =   "cdProducto"
            Top             =   1590
            Width           =   780
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
            Left            =   6210
            TabIndex        =   73
            Top             =   3630
            Width           =   1170
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
            Left            =   5010
            TabIndex        =   72
            Top             =   3630
            Width           =   1170
         End
         Begin VB.Label Label8 
            Alignment       =   2  'Center
            Caption         =   "Total Factura"
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
            Left            =   7335
            TabIndex        =   65
            Top             =   3630
            Width           =   1170
         End
         Begin VB.Label Label20 
            Caption         =   "Moneda"
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
            Left            =   2370
            TabIndex        =   64
            Top             =   945
            Width           =   1350
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
            Left            =   3750
            TabIndex        =   63
            Top             =   945
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
            Left            =   4545
            TabIndex        =   62
            Top             =   945
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
            Left            =   3105
            TabIndex        =   61
            Top             =   405
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
            Left            =   1770
            TabIndex        =   60
            Top             =   405
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
            Left            =   3990
            TabIndex        =   59
            Top             =   435
            Width           =   1050
         End
         Begin VB.Label Label3 
            Caption         =   "Nro. Talonario"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   465
            Left            =   945
            TabIndex        =   58
            Top             =   225
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
            Left            =   240
            TabIndex        =   57
            Top             =   945
            Width           =   2100
         End
         Begin VB.Label lblLabels 
            Caption         =   "Tipo de IVA"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   435
            Index           =   3
            Left            =   210
            TabIndex        =   56
            Top             =   225
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
            Left            =   240
            TabIndex        =   55
            Top             =   3600
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
            Left            =   5325
            TabIndex        =   54
            Top             =   405
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
            Left            =   7110
            TabIndex        =   53
            Top             =   405
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
            Left            =   7755
            TabIndex        =   52
            Top             =   405
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
            Left            =   7095
            TabIndex        =   51
            Top             =   945
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
            Left            =   7740
            TabIndex        =   50
            Top             =   945
            Width           =   945
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Datos del Cliente"
         Height          =   1995
         Left            =   255
         TabIndex        =   41
         Top             =   30
         Width           =   8910
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   20
            Left            =   3645
            Locked          =   -1  'True
            TabIndex        =   8
            Tag             =   "cdPostal"
            Top             =   1515
            Width           =   1530
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   16
            Left            =   5175
            Locked          =   -1  'True
            TabIndex        =   9
            Tag             =   "nmLocalidad"
            Top             =   1515
            Width           =   2010
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   51
            Left            =   4515
            Locked          =   -1  'True
            TabIndex        =   6
            Tag             =   "nrTel"
            Top             =   975
            Width           =   4215
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   5
            Left            =   270
            TabIndex        =   1
            Tag             =   "cdCliente"
            Top             =   450
            Width           =   1620
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   6
            Left            =   6135
            Locked          =   -1  'True
            TabIndex        =   4
            Tag             =   "dsRazonSocial"
            Top             =   450
            Width           =   2595
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   2
            Left            =   300
            Locked          =   -1  'True
            TabIndex        =   7
            Tag             =   "dsDomicilio"
            Top             =   1515
            Width           =   3330
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   3
            Left            =   7185
            Locked          =   -1  'True
            TabIndex        =   10
            Tag             =   "nrDoc"
            Top             =   1515
            Width           =   1560
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   101
            Left            =   4425
            Locked          =   -1  'True
            TabIndex        =   3
            Tag             =   "nmApellido"
            Top             =   450
            Width           =   1710
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   100
            Left            =   1920
            Locked          =   -1  'True
            TabIndex        =   2
            Tag             =   "nmNombre"
            Top             =   450
            Width           =   2505
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   50
            Left            =   285
            Locked          =   -1  'True
            TabIndex        =   5
            Tag             =   "dsEmail"
            Top             =   975
            Width           =   4215
         End
         Begin VB.Label Label6 
            Caption         =   "Cod. Postal"
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
            Left            =   3630
            TabIndex        =   68
            Top             =   1275
            Width           =   1260
         End
         Begin VB.Label Label6 
            Caption         =   "Localidad"
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
            Left            =   5175
            TabIndex        =   67
            Top             =   1275
            Width           =   1860
         End
         Begin VB.Label Label23 
            Caption         =   "Teléfono"
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
            Left            =   4515
            TabIndex        =   66
            Top             =   750
            Width           =   1830
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
            Left            =   300
            TabIndex        =   48
            Top             =   195
            Width           =   1140
         End
         Begin VB.Label Label5 
            Caption         =   "Razón Social "
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
            Left            =   6120
            TabIndex        =   47
            Top             =   195
            Width           =   2565
         End
         Begin VB.Label Label6 
            Caption         =   "Domicilio"
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
            Left            =   285
            TabIndex        =   46
            Top             =   1275
            Width           =   2580
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
            Left            =   7185
            TabIndex        =   45
            Top             =   1290
            Width           =   1275
         End
         Begin VB.Label Label16 
            Caption         =   "Apellido"
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
            Left            =   4605
            TabIndex        =   44
            Top             =   195
            Width           =   795
         End
         Begin VB.Label Label17 
            Caption         =   "Nombre"
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
            Left            =   1965
            TabIndex        =   43
            Top             =   210
            Width           =   795
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
            Left            =   285
            TabIndex        =   42
            Top             =   765
            Width           =   930
         End
      End
   End
   Begin VB.Frame fraBusqComprobantes 
      BorderStyle     =   0  'None
      Height          =   6990
      Left            =   -15
      TabIndex        =   37
      Top             =   675
      Width           =   9240
      Begin VB.TextBox txtBusqueda 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4290
         TabIndex        =   33
         Top             =   315
         Width           =   3705
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
               Picture         =   "Frm_CargaManual.frx":3B47
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":3C59
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":3D6B
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":3E7D
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":3F8F
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CargaManual.frx":40A1
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   36
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
         Height          =   6060
         Left            =   105
         TabIndex        =   34
         Top             =   735
         Width           =   7905
         _ExtentX        =   13944
         _ExtentY        =   10689
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "cdComprobante"
            Text            =   "Comprobante"
            Object.Width           =   1412
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "nmApellido"
            Text            =   "Apellido "
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nmNombre"
            Text            =   "Nombre"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razón Social"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "nrDoc"
            Text            =   "Doc. Nro."
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dsDomicilio"
            Text            =   "Domicilio"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nmLocalidad"
            Text            =   "Localidad"
            Object.Width           =   2470
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   35
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   39
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   38
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_CargaManual"
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
    Me.lstBusqueda.ListItems.Clear
    ObtenerCampo("vlTotalGeneral").Text = "0,00"
    ObtenerCampo("nrPasajeros").Text = "1"
    ObtenerCampo("nrBultos").Text = "1"
    
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
    ListItemNuevo.SubItems(4) = ObtenerCampo("vlPrecioViaje").Text
    
    Recalculo_operaciones
    
    ObtenerCampo("cdProducto").Text = ""
    ObtenerCampo("cdProducto").SetFocus
    HabilitarCampos "dsProducto", False
    HabilitarCampos "vlPorcentaje", False
    HabilitarCampos "vlPrecioViaje", False
    
       
        
End Sub




' ACA PROGRAMAR
Private Sub Recalculo_operaciones()
Dim i             As Integer
Dim vlTotalViajes As Single
Dim vlPorcentaje As Single

    vlPorcentaje = 0
    vlTotalViajes = 0
    For i = 1 To Me.lstItemsFactura.ListItems.Count
        If Me.lstItemsFactura.ListItems.Item(i).SubItems(2) = "Viaje" Then
            vlTotalViajes = vlTotalViajes + CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(4))
        End If
    Next
    
    
    For i = 1 To Me.lstItemsFactura.ListItems.Count
    
        Select Case Me.lstItemsFactura.ListItems.Item(i).SubItems(2)
        Case "Descuento %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(3))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(4) = _
             (-Abs((vlTotalViajes * vlPorcentaje) / 100))
        Case "Recargo %"
             vlPorcentaje = CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(3))
             Me.lstItemsFactura.ListItems.Item(i).SubItems(4) = _
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
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(4))
    Next
    
    ObtenerCampo("vlTotalGeneral").Text = FormatNumber(vlTotalPesos, "2")

End Sub


Private Sub Combox1_GotFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                              Me.Combox1(Index), "GotFocus"

End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

  
    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                            Me.Combox1(Index), KeyAscii)
    End If
    

End Sub

Private Sub Combox1_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                              Me.Combox1(Index), "LostFocus"


End Sub





Private Sub Command1_Click()

    ObtenerCampo("cdCliente").Text = "(Nuevo)"
    ObtenerCampo("nmNombre").SetFocus
    
End Sub

Private Sub Form_Activate()


    Me.lstBusqueda.ListItems.Clear
    
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
        If tlb_ABM.Buttons("Agregar").Visible Or tlb_ABM.Buttons("Aceptar") Then
            If EstadoABM = Consulta Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Agregar")
            Else
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
                
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

    Select Case objParametros.ObtenerValor("Frm_CargaManual.modo")
    Case "Facturar"
        EstadoABM = facturar
    Case Else
        EstadoABM = Consulta
    End Select
    

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    SelecionarItemCombo
    cargarcamposdebusqueda
    Me.cmbCampos.ListIndex = 1
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Comprobantes"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Comprobantes")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Comprobantes")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.Text
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


Private Sub SelecionarItemCombo()
    Dim i As Integer
    
    For i = Combox1.LBound To Combox1.UBound
        If Combox1(i).ListCount > 0 Then
            Combox1(i).ListIndex = 0
        End If
    Next i
    
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
    
    ObjTablasIO.nmTabla = "TB_Comprobantes"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", _
    "=", Me.lstBusqueda.SelectedItem.Text
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(1)
    
    ObjTablasIO.setearCampoOperadorValor "dsLeyenda", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlTotalGeneral", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpMoneda", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdPostal", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtVencimiento", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrBultos", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPasajeros", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrTel", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlDiaEuro", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCodBar", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCondVenta", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    

    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub







Private Sub lstItemsFactura_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyDelete Then
        If Not Me.lstItemsFactura.ListItems.Count > 0 Then Exit Sub
        If Me.lstItemsFactura.SelectedItem.Checked = True Then
            Me.lstItemsFactura.ListItems.Remove (Me.lstItemsFactura.SelectedItem.Index)
            Recalculo_operaciones
        End If
    End If


End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
           PresentarPantalla Button
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
           If Not EstadoABM = facturar Then
            EstadoABM = alta
           End If
           limpiarControles
           strValor = ""
           ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
           strValor = ""
           ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
           ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("nrCaja")
           ObtenerCampo("nrPuesto").Text = objParametros.ObtenerValor("nrPuesto")
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           PresentarPantalla Button
           ObtenerCampo("cdCliente").Text = "(Nuevo)"
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
    
         If Not validarEntradadedatos() Then Exit Sub
         
         ' Verificar que el monto no sea negativo
         If Not FormadepagoOK() Then Exit Sub
         objbasededatos.Basededatos.BeginTrans
         If Not GrabarDatosdelCliente() Then
            objbasededatos.Basededatos.RollbackTrans
            Exit Sub
         End If
         If Not GrabarDatosdeProductos() Then
            objbasededatos.Basededatos.RollbackTrans
            Exit Sub
         End If
    
         
         If Guardarregistro(EstadoABM) Then
                GrabarItemsFactura
                GrabarTabladeCupones
                ' ActualizarCaja
                ' Vamos Por Aca
                On Error Resume Next
                objbasededatos.Basededatos.CommitTrans
                If Err Then
                    MsgBox "Error: no se pudo insertar el registro, " _
                   + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                    objbasededatos.Basededatos.RollbackTrans
                    Exit Sub
                End If
                On Error GoTo 0
                ' ImprimirFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante")
                If EstadoABM = facturar Then
                    limpiarControles
                    PresentarPantalla Button
                    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
                    EstadoABM = facturar
                Else
                    PresentarPantalla Button
                    EstadoABM = Consulta
                End If
               MsgBox "El registro ha sido guardado con éxito.", _
                   vbInformation + vbDefaultButton1, "Atención"
           Else
                objbasededatos.Basededatos.RollbackTrans
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
           End If
    Case "Cancelar"
           If EstadoABM = facturar Then
              EstadoABM = facturar
              tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
              ObtenerCampo("cdCliente").SetFocus
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
Dim strdato   As String

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        strdato = strdato + IIf(i <> 1, " - ", "") + _
        Me.lstItemsFactura.ListItems.Item(i).ListSubItems(1).Text
    Next

    ConcatenarDestinos = Mid(strdato, 1, 100)

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
    
    If Trim(ObtenerCampo("nrLicencia").Text) = "" Or Trim(ObtenerCampo("nmLicenciatario").Text) = "" Then
        MsgBox "Debe Ingresar una 'Licencia'", vbCritical, "Atención"
        AvisarError "nrLicencia", True
        validarEntradadedatos = False
    End If
    
    
End Function

Private Function GrabarDatosdelCliente() As Boolean
Dim strValor As String

    GrabarDatosdelCliente = True
    If ObtenerCampo("dsRazonSocial").Text <> "" Or _
       (ObtenerCampo("nmApellido").Text <> "" And _
       ObtenerCampo("nmNombre").Text <> "") Then
        
        ObjTablasIO.nmTabla = "TB_Clientes"
        ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", ObtenerCampo("dsRazonSocial").Text
        ObjTablasIO.setearCampoOperadorValor "nmApellido", "<-", ObtenerCampo("nmApellido").Text
        ObjTablasIO.setearCampoOperadorValor "nmNombre", "<-", ObtenerCampo("nmNombre").Text
        ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "<-", ObtenerCampo("dsDomicilio").Text
        ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "<-", ObtenerCampo("nmLocalidad").Text
        ObjTablasIO.setearCampoOperadorValor "nrDoc", "<-", ObtenerCampo("nrDoc").Text
        ObjTablasIO.setearCampoOperadorValor "dsEmail", "<-", ObtenerCampo("dsEmail").Text
        ObjTablasIO.setearCampoOperadorValor "nrTel", "<-", ObtenerCampo("nrTel").Text
        ObjTablasIO.setearCampoOperadorValor "cdPostal", "<-", ObtenerCampo("cdPostal").Text
        
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
        
        ObjTablasIO.setearCampoOperadorValor "nrItem", "<-", CStr(i)
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", Me.lstItemsFactura.ListItems(i).Text
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(1)
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(4)
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
        
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", ObtenerCampo("cdCliente").Text
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<-", objConfig.nrPuesto
        ObjTablasIO.setearCampoOperadorValor "nrLicencia", "<-", ObtenerCampo("nrLicencia").Text
        ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "<-", ObtenerCampo("nmLicenciatario").Text
        ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "<-", ObtenerCampo("vlTotalGeneral").Text
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
        Case "Cobro en Destino"
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
    ObjTablasIO.Seleccionar
    
    If Not ObjTablasIO.rs_resultados.EOF Then
        obtenerComision = ObjTablasIO.rs_resultados("vlComision").Value
    Else
        obtenerComision = 0
    End If
    
    
End Function



Private Function AgregarCaracteresAIzq(pdato As String, _
CantCar As Integer, Caracter As String) As String
Dim nrTamanio        As Integer
Dim nI               As Integer

    AgregarCaracteresAIzq = pdato
    nrTamanio = Len(pdato)
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
            ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(2)
            ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(3)
            strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Productos", "cdProducto", objConfig.nrPuesto)
            ObjTablasIO.setearCampoOperadorValor "cdProducto", "<-", strValor
            ObjTablasIO.Insertar
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
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Comprobantes", "nrComprobante", objConfig.nrPuesto
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
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraCargaManual.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraCargaManual.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraCargaManual.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
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
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraCargaManual.Visible = False
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           If EstadoABM = facturar Then
                Me.fraBusqComprobantes.Visible = False
                Me.lstBusqueda.Visible = False
                Me.fraCargaManual.Visible = True
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
                Me.fraBusqComprobantes.Visible = True
                Me.lstBusqueda.Visible = True
                Me.fraCargaManual.Visible = False
                Me.tlb_ABM.Buttons("Buscar").Visible = True
                Me.tlb_ABM.Buttons("Seleccionar").Visible = True
                Me.tlb_ABM.Buttons("Agregar").Visible = True
                Me.tlb_ABM.Buttons("Exportar").Visible = True
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = False
                Me.tlb_ABM.Buttons("Cancelar").Visible = False
                Me.txtBusqueda.SetFocus
          End If
    Case "Cancelar"
        If EstadoABM = facturar Then
            Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraCargaManual.Visible = True
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
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraCargaManual.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
        End If
    End Select
    Me.lstBusqueda.ListItems.Clear

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
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Comprobantes"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, "ASC"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Comprobantes"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            Me.lstBusqueda.SetFocus
         Else
            MsgBox "No existe datos para la seleción", vbInformation, "Atención"
         End If
    Else
          objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.Text
          Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
          KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", Me.txtBusqueda, KeyAscii)
    End If
    
End Sub



Private Sub txtFields_Change(Index As Integer)

    Select Case txtFields(Index).Tag
    Case "cdCliente"
        If txtFields(Index).Text = "" Then
            ObtenerCampo("cdCliente").BackColor = Blanco
            HabilitarCampos "dsRazonSocial", False
            HabilitarCampos "nmApellido", False
            HabilitarCampos "nmNombre", False
            HabilitarCampos "dsDomicilio", False
            HabilitarCampos "nmLocalidad", False
            HabilitarCampos "nrDoc", False
            HabilitarCampos "dsEmail", False
            HabilitarCampos "nrTel", False
            HabilitarCampos "cdPostal", False
            ObtenerCampo("dsRazonSocial").Text = ""
            ObtenerCampo("nmApellido").Text = ""
            ObtenerCampo("nmNombre").Text = ""
            ObtenerCampo("dsDomicilio").Text = ""
            ObtenerCampo("nmLocalidad").Text = ""
            ObtenerCampo("nrDoc").Text = ""
            ObtenerCampo("dsEmail").Text = ""
            ObtenerCampo("nrTel").Text = ""
            ObtenerCampo("cdPostal").Text = ""
        End If
    Case "nrLicencia"
        ObtenerCampo("nrLicencia").BackColor = Blanco
        ObtenerCampo("nmLicenciatario").Text = ""
    End Select

End Sub



Private Sub txtFields_GotFocus(Index As Integer)

    
    DoEvents
    
    If Me.txtFields(Index).Tag <> "" And Me.txtFields(Index).Text <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                      Me.txtFields(Index), "GotFocus"
        Select Case Me.txtFields(Index).Tag
        Case "cdCliente"
            Me.txtFields(Index).SelStart = 0
            Me.txtFields(Index).SelLength = Len(Me.txtFields(Index).Text)
        Case "dsRazonSocial"
            If ObtenerCampo("nmApellido").Text <> "" And ObtenerCampo("nmNombre") <> "" Then
                ObtenerCampo("dsRazonSocial").Text = _
                ObtenerCampo("nmApellido").Text + ", " + ObtenerCampo("nmNombre")
            Else
                If ObtenerCampo("nmApellido").Text <> "" Then
                    ObtenerCampo("dsRazonSocial").Text = _
                    ObtenerCampo("nmApellido").Text
                Else
                    ObtenerCampo("dsRazonSocial").Text = _
                    ObtenerCampo("nmNombre")
                End If
            End If
        End Select
    End If
    
    If Me.txtFields(Index).Tag <> "" Then
        If ObtenerCampo("nmApellido").Text <> "" And ObtenerCampo("nmNombre") <> "" Then
            ObtenerCampo("dsRazonSocial").Text = _
            ObtenerCampo("nmApellido").Text + ", " + ObtenerCampo("nmNombre")
        Else
            If ObtenerCampo("nmApellido").Text <> "" Then
                ObtenerCampo("dsRazonSocial").Text = _
                ObtenerCampo("nmApellido").Text
            Else
                ObtenerCampo("dsRazonSocial").Text = _
                ObtenerCampo("nmNombre")
            End If
        End If
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
            ObtenerCampo("nrLicencia").Text = ""
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            If UCase(ObtenerCampo("nrLicencia").Text) = UCase("(Nuevo)") Then
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
                
                ObjTablasIO.Seleccionar
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
                    HabilitarCampos "nmApellido", True
                    HabilitarCampos "nmNombre", True
                    HabilitarCampos "dsDomicilio", True
                    HabilitarCampos "nmLocalidad", True
                    HabilitarCampos "nrDoc", True
                    HabilitarCampos "dsEmail", True
                    HabilitarCampos "nrTel", True
                    HabilitarCampos "cdPostal", True
                    
                    ObtenerCampo("cdCliente").BackColor = Blanco
                Else
                    HabilitarCampos "dsRazonSocial", False
                    HabilitarCampos "nmApellido", False
                    HabilitarCampos "nmNombre", False
                    HabilitarCampos "dsDomicilio", False
                    HabilitarCampos "nmLocalidad", False
                    HabilitarCampos "nrDoc", False
                    HabilitarCampos "dsEmail", False
                    HabilitarCampos "nrTel", False
                    HabilitarCampos "cdPostal", False
                    
                    ObtenerCampo("cdCliente").BackColor = Rojo
                    ObtenerCampo("cdCliente").SetFocus
                End If
            Else
                HabilitarCampos "dsRazonSocial", True
                HabilitarCampos "nmApellido", True
                HabilitarCampos "nmNombre", True
                HabilitarCampos "dsDomicilio", True
                HabilitarCampos "nmLocalidad", True
                HabilitarCampos "nrDoc", True
                HabilitarCampos "dsEmail", True
                HabilitarCampos "nrTel", True
                HabilitarCampos "cdPostal", True
                ObtenerCampo("cdCliente").BackColor = Blanco
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
          ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)

    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                                Me.txtFields(Index), KeyAscii)
    Else
        txtFields_LostFocus Index
    End If
    
End Sub

Private Sub txtFields_LostFocus(Index As Integer)


    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                  Me.txtFields(Index), "LostFocus"
                                
        ' Validar entrada del licenciatario
        Select Case Me.txtFields(Index).Tag
        Case "nrLicencia"
            If Not ObtenerCampo("nrLicencia").Text = "" Then
                buscarlicencia
            End If
        Case "cdCliente"
            If Not ObtenerCampo("cdCliente").Text = "" Then
                buscarcampocliente
            End If
        End Select
        
    End If
    
End Sub

Private Sub buscarlicencia()
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
    Else
        ObtenerCampo("nrLicencia").BackColor = Rojo
        ObtenerCampo("nrLicencia").SetFocus
    End If
         
End Sub
            
Private Sub buscarProducto()
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single


    If Not ObtenerCampo("cdProducto").Text = "(Nuevo)" Then
        ObjTablasIO.nmTabla = "TB_Productos"
        ObjTablasIO.setearCampoOperadorValor _
        "cdProducto", "=", ObtenerCampo("cdProducto").Text
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "->", ""
        ObjTablasIO.setearCampoOperadorValor "vlPorcentaje", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
        
        
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
           ObtenerCampo("dsProducto").Text = ObjTablasIO.rs_resultados("dsProducto").Value
           ObtenerCampo("vlPrecioViaje").Text = AdaptarNulos(ObjTablasIO.rs_resultados("vlPrecioViaje").Value, "")
           ObtenerCampo("vlPorcentaje").Text = AdaptarNulos(ObjTablasIO.rs_resultados("vlPorcentaje").Value, "")
           ObtenerCampo("tpOperacion").Text = AdaptarNulos(ObjTablasIO.rs_resultados("tpOperacion").Value, "")
           
     
               Select Case ObtenerCampo("tpOperacion").Text
                Case "Recargo %"
                    HabilitarCampos "dsProducto", False
                    HabilitarCampos "vlPrecioViaje", False
                    HabilitarCampos "vlPorcentaje", False
                     ' vlPorcentaje = Abs(CInt(ObtenerCampo("vlPorcentaje").Text))
                     ' vlTotalGeneral = CInt(ObtenerCampo("vlTotalGeneral").Text)
                     ' vlPrecioViaje = (vlTotalGeneral * vlPorcentaje) / 100
                     ObtenerCampo("vlPrecioViaje").Text = CStr(vlPrecioViaje)
                     cmdAgregarItemFactura_Click
                Case "Descuento %"
                     HabilitarCampos "dsProducto", False
                     HabilitarCampos "vlPrecioViaje", False
                     HabilitarCampos "vlPorcentaje", False
                     ' vlPorcentaje = Abs(CInt(ObtenerCampo("vlPorcentaje").Text))
                     ' vlTotalGeneral = CInt(ObtenerCampo("vlTotalGeneral").Text)
                     ' vlPrecioViaje = (vlTotalGeneral * vlPorcentaje) / 100
                     ' ObtenerCampo("vlPrecioViaje").Text = CStr(-vlPrecioViaje)
                     cmdAgregarItemFactura_Click
                Case "Recargo Valor"
                    HabilitarCampos "vlPrecioViaje", True
                    HabilitarCampos "vlPorcentaje", False
                    ObtenerCampo("vlPrecioViaje").Text = Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
                    Exit Sub
                Case "Descuento Valor"
                    HabilitarCampos "vlPrecioViaje", True
                    HabilitarCampos "vlPorcentaje", False
                    ObtenerCampo("vlPrecioViaje").Text = -Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
                    Exit Sub
                Case "Viaje"
                     cmdAgregarItemFactura_Click
                Case "Servicio"
                    HabilitarCampos "vlPrecioViaje", True
                    HabilitarCampos "vlPorcentaje", False
                    ObtenerCampo("vlPrecioViaje").Text = Abs(CSng(ObtenerCampo("vlPrecioViaje").Text))
                    Exit Sub
                End Select
           Me.cmdAgregarItemFactura.Enabled = True
        Else
           HabilitarCampos "dsProducto", False
           HabilitarCampos "vlPrecioViaje", False
           HabilitarCampos "vlPorcentaje", False
           Me.cmdAgregarItemFactura.Enabled = False
           ObtenerCampo("cdProducto").BackColor = Rojo
           ObtenerCampo("cdProducto").SetFocus
        End If
    Else
        HabilitarCampos "dsProducto", True
        HabilitarCampos "vlPrecioViaje", True
        HabilitarCampos "vlPorcentaje", True
        Me.cmdAgregarItemFactura.Enabled = True
        ObtenerCampo("dsProducto").SetFocus
    End If
    
             
End Sub
                    
            
Private Sub txtItemFactura_Change(Index As Integer)

    Select Case txtItemFactura(Index).Tag
    Case "cdProducto"
        ObtenerCampo("cdProducto").BackColor = Blanco
        ObtenerCampo("dsProducto").Text = ""
        ObtenerCampo("vlPrecioViaje").Text = ""
        ObtenerCampo("vlPorcentaje").Text = ""
        ObtenerCampo("tpOperacion").Text = ""
    End Select
    
    
End Sub

Private Sub txtItemFactura_GotFocus(Index As Integer)
    
    If Me.txtItemFactura(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Productos", _
                                  Me.txtItemFactura(Index), "LostFocus"
    End If


End Sub

Private Sub txtItemFactura_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

   Select Case txtItemFactura(Index).Tag
   Case "cdProducto"
        Select Case KeyCode
        Case vbKeyF1
            ObtenerCampo("cdProducto").Text = ""
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Productos"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "cdProducto"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("cdProducto").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarProducto
        End Select
   End Select
   

End Sub
Private Sub txtItemFactura_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

 
    If Not KeyAscii = vbKeyReturn Then
        If Me.txtItemFactura(Index).Tag <> "" Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Productos", _
                                Me.txtItemFactura(Index), KeyAscii)
        End If
    Else
        Select Case Me.txtItemFactura(Index).Tag
        Case "cdProducto"
            If Not ObtenerCampo("cdProducto").Text = "" Then
                buscarProducto
            End If
        Case "vlPrecioViaje"
            cmdAgregarItemFactura_Click
        End Select
    End If
    
End Sub

Private Sub txtItemFactura_LostFocus(Index As Integer)

    If Me.txtItemFactura(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Productos", _
                                  Me.txtItemFactura(Index), "LostFocus"
           Select Case Me.txtItemFactura(Index).Tag
            Case "cdProducto"
                If Not ObtenerCampo("cdProducto").Text = "" Then
                    buscarProducto
                End If
            End Select
    End If

End Sub


Private Function ImprimirFactura(pnrTanario As String, _
pnrComprobante As String) As Boolean
Dim objAFIP             As New CAFIP
Dim strCodbarAFIP       As String
Dim strCodbarAFIPI2to5  As String


    strCodbarAFIP = ObtenerCodBarrasAFIP()
    strCodbarAFIPI2to5 = objAFIP.StrToI2of5(strCodbarAFIP)
    strCodbarAFIP = strCodbarAFIP + objAFIP.DigitoVerificador(strCodbarAFIP)
    
    CrystalReport1.ReportFileName = App.Path & "\rpt_Factura.rpt"
    CrystalReport1.Connect = "DSN=" + objConfig.dsDSN + ";UID=sa;PWD=filcardanica;DSQ=dbSG2000"
    CrystalReport1.WindowState = crptMaximized
    CrystalReport1.Destination = crptToWindow
    CrystalReport1.WindowTitle = "Factura a Imprimir - ORIGINAL"
    CrystalReport1.Formulas(0) = "Copia = 'ORIGINAL'"
    CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    
    ' CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    CrystalReport1.Action = 1
    
    CrystalReport1.WindowTitle = "Factura a Imprimir - DUPLICADO"
    CrystalReport1.Formulas(0) = "Copia = 'DUPLICADO'"
    CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    
    ' Aparece la venta duplicado
    CrystalReport1.Action = 1

End Function


