VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#4.6#0"; "CRYSTL32.OCX"
Begin VB.Form Frm_AnularComprobantesHojaA4 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Anular Comprobantes"
   ClientHeight    =   7575
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9570
   ClipControls    =   0   'False
   Icon            =   "Frm_AnularComprobantesHojaA4.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7575
   ScaleWidth      =   9570
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   36
      Top             =   0
      Width           =   9570
      _ExtentX        =   16880
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgReimpComprobantesResaltado"
      HotImageList    =   "imgReimpComprobantesResaltado"
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
            Caption         =   "Anular(F3)"
            Key             =   "Anular"
            ImageKey        =   "Anular"
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
      MouseIcon       =   "Frm_AnularComprobantesHojaA4.frx":030A
      Begin Crystal.CrystalReport CrystalReport1 
         Left            =   7665
         Top             =   180
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   262150
         WindowControlBox=   -1  'True
         WindowMaxButton =   -1  'True
         WindowMinButton =   -1  'True
      End
      Begin MSComctlLib.ImageList imgReimpComprobantesResaltado 
         Left            =   7005
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
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":1BDA
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":2254
               Key             =   "Anular"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgReimpComprobantes 
         Left            =   8160
         Top             =   60
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
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":2364
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":247C
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":25D0
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":26E8
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":27F4
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":2948
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":2A50
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":30CC
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":322C
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":3680
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":3AD4
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":414E
               Key             =   "Anular"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraReimpComprobantes 
      BorderStyle     =   0  'None
      Height          =   6840
      Left            =   -60
      TabIndex        =   0
      Top             =   645
      Width           =   9285
      Begin VB.Frame Frame2 
         Caption         =   "Datos de la Factura"
         Height          =   4815
         Left            =   255
         TabIndex        =   45
         Top             =   1920
         Width           =   8895
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   2
            ItemData        =   "Frm_AnularComprobantesHojaA4.frx":425E
            Left            =   240
            List            =   "Frm_AnularComprobantesHojaA4.frx":4274
            Style           =   2  'Dropdown List
            TabIndex        =   68
            Tag             =   "cdCondVenta"
            Top             =   1170
            Width           =   3510
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   21
            Left            =   2340
            Locked          =   -1  'True
            TabIndex        =   67
            Tag             =   "dsOpcional3"
            Top             =   4365
            Visible         =   0   'False
            Width           =   4425
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   18
            Left            =   7470
            Locked          =   -1  'True
            TabIndex        =   28
            TabStop         =   0   'False
            Tag             =   "vlPagoPesos"
            Top             =   4005
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   17
            Left            =   6345
            Locked          =   -1  'True
            TabIndex        =   27
            Tag             =   "vlPagoDolares"
            Top             =   4005
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   9
            Left            =   5175
            Locked          =   -1  'True
            TabIndex        =   26
            Tag             =   "vlPagoEuros"
            Top             =   4005
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   23
            Left            =   3975
            Locked          =   -1  'True
            TabIndex        =   15
            TabStop         =   0   'False
            Tag             =   "dtComprobante"
            Top             =   645
            Width           =   1365
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
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
            ForeColor       =   &H000000FF&
            Height          =   285
            Index           =   7
            Left            =   7470
            Locked          =   -1  'True
            TabIndex        =   25
            TabStop         =   0   'False
            Tag             =   "vlTotalGeneral"
            Top             =   4320
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   13
            Left            =   3795
            Locked          =   -1  'True
            TabIndex        =   19
            Tag             =   "nrLicencia"
            Top             =   1185
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
            TabIndex        =   20
            TabStop         =   0   'False
            Tag             =   "nmLicenciatario"
            Top             =   1185
            Width           =   2535
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdComprobante"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1770
            Locked          =   -1  'True
            TabIndex        =   13
            TabStop         =   0   'False
            Tag             =   "nrComprobante"
            Top             =   660
            Width           =   1350
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   1
            ItemData        =   "Frm_AnularComprobantesHojaA4.frx":42D5
            Left            =   3135
            List            =   "Frm_AnularComprobantesHojaA4.frx":42DF
            Locked          =   -1  'True
            Style           =   2  'Dropdown List
            TabIndex        =   14
            TabStop         =   0   'False
            Tag             =   "tpComprobante"
            Top             =   645
            Width           =   855
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   975
            Locked          =   -1  'True
            TabIndex        =   12
            TabStop         =   0   'False
            Tag             =   "nrTalonario"
            Top             =   660
            Width           =   780
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
            Text            =   "Exento"
            Top             =   660
            Width           =   720
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   8
            Left            =   210
            Locked          =   -1  'True
            TabIndex        =   24
            Tag             =   "dsLeyenda"
            Top             =   4005
            Width           =   4965
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
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   14
            Left            =   7095
            Locked          =   -1  'True
            TabIndex        =   21
            Tag             =   "nrBultos"
            Text            =   "1"
            Top             =   1170
            Width           =   405
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   15
            Left            =   7740
            Locked          =   -1  'True
            TabIndex        =   22
            Tag             =   "nrPasajeros"
            Text            =   "1"
            Top             =   1185
            Width           =   435
         End
         Begin MSComctlLib.ListView lstItemsFactura 
            Height          =   2145
            Left            =   225
            TabIndex        =   23
            Top             =   1560
            Width           =   8355
            _ExtentX        =   14737
            _ExtentY        =   3784
            View            =   3
            LabelEdit       =   1
            Sorted          =   -1  'True
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
            NumItems        =   4
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Key             =   "nrItem"
               Object.Tag             =   "nrItem"
               Text            =   "Nro. Item"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Key             =   "cdProducto"
               Object.Tag             =   "cdProducto"
               Text            =   "C�digo"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Key             =   "dsProducto"
               Object.Tag             =   "dsProducto"
               Text            =   "Descripci�n"
               Object.Width           =   7921
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Key             =   "vlPrecioViaje"
               Object.Tag             =   "vlPrecioViaje"
               Text            =   "Precio Unitario"
               Object.Width           =   2858
            EndProperty
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
            Left            =   240
            TabIndex        =   65
            Top             =   4335
            Width           =   4950
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
            TabIndex        =   62
            Top             =   3765
            Width           =   1170
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
            Left            =   6315
            TabIndex        =   61
            Top             =   3735
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
            Left            =   7440
            TabIndex        =   60
            Top             =   3735
            Width           =   1170
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
            TabIndex        =   59
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
            TabIndex        =   58
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
            TabIndex        =   57
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
            TabIndex        =   56
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
            TabIndex        =   55
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
            TabIndex        =   54
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
            TabIndex        =   53
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
            TabIndex        =   52
            Top             =   225
            Width           =   690
         End
         Begin VB.Label Label9 
            Caption         =   "Observaci�n"
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
            Left            =   195
            TabIndex        =   51
            Top             =   3735
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
            TabIndex        =   50
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
            TabIndex        =   49
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
            TabIndex        =   48
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
            TabIndex        =   47
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
            TabIndex        =   46
            Top             =   945
            Width           =   945
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Datos del Cliente"
         Height          =   1875
         Left            =   255
         TabIndex        =   37
         Top             =   15
         Width           =   8910
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   20
            Left            =   3615
            Locked          =   -1  'True
            TabIndex        =   6
            Tag             =   "cdPostal"
            Top             =   990
            Width           =   1530
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   16
            Left            =   5145
            Locked          =   -1  'True
            TabIndex        =   7
            Tag             =   "nmLocalidad"
            Top             =   990
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
            TabIndex        =   10
            Tag             =   "nrTel"
            Top             =   1500
            Width           =   4185
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   5
            Left            =   270
            Locked          =   -1  'True
            TabIndex        =   1
            Tag             =   "cdCliente"
            Top             =   450
            Width           =   1635
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   6
            Left            =   1920
            Locked          =   -1  'True
            TabIndex        =   2
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
            Left            =   270
            Locked          =   -1  'True
            TabIndex        =   5
            Tag             =   "dsDomicilio"
            Top             =   990
            Width           =   3330
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   3
            Left            =   7155
            Locked          =   -1  'True
            TabIndex        =   8
            Tag             =   "nrDoc"
            Top             =   1005
            Width           =   1560
         End
         Begin VB.TextBox txtDatosClientes 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   1
            Left            =   4515
            Locked          =   -1  'True
            TabIndex        =   3
            Tag             =   "nmApellido"
            Top             =   450
            Width           =   1710
         End
         Begin VB.TextBox txtDatosClientes 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   2
            Left            =   6225
            Locked          =   -1  'True
            TabIndex        =   4
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
            TabIndex        =   9
            Tag             =   "dsEmail"
            Top             =   1485
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
            Left            =   3600
            TabIndex        =   66
            Top             =   735
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
            Left            =   5145
            TabIndex        =   64
            Top             =   735
            Width           =   1860
         End
         Begin VB.Label Label23 
            Caption         =   "Tel�fono"
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
            TabIndex        =   63
            Top             =   1260
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
            TabIndex        =   44
            Top             =   195
            Width           =   1140
         End
         Begin VB.Label Label5 
            Caption         =   "Raz�n Social "
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
            Left            =   1905
            TabIndex        =   43
            Top             =   195
            Width           =   2595
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
            Left            =   270
            TabIndex        =   42
            Top             =   720
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
            Left            =   7170
            TabIndex        =   41
            Top             =   735
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
            TabIndex        =   40
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
            Left            =   6225
            TabIndex        =   39
            Top             =   195
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
            TabIndex        =   38
            Top             =   1275
            Width           =   930
         End
      End
   End
   Begin VB.Frame fraBusqComprobantes 
      BorderStyle     =   0  'None
      Height          =   6885
      Left            =   -15
      TabIndex        =   33
      Top             =   675
      Width           =   9330
      Begin VB.TextBox txtBusqueda 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4320
         TabIndex        =   29
         Top             =   330
         Width           =   4845
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
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":42E9
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":43FB
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":450D
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":461F
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":4731
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_AnularComprobantesHojaA4.frx":4843
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   32
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
         Height          =   5940
         Left            =   105
         TabIndex        =   30
         Top             =   720
         Width           =   9075
         _ExtentX        =   16007
         _ExtentY        =   10478
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
         NumItems        =   9
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrComprobante"
            Text            =   "Comprobante"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "nrTalonario"
            Text            =   "Talonario"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "dtComprobante"
            Text            =   "Fecha "
            Object.Width           =   2293
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "cdCondVenta"
            Text            =   "Cond. Venta"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "cdCliente"
            Text            =   "Cliente"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razon Social"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "nrCaja"
            Text            =   "Caja"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   31
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   35
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   34
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_AnularComprobantesHojaA4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl

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
    
    If lvlPrecioViaje <= 0 Then
        ObtenerCampo("vlPrecioViaje").BackColor = Rojo
        ObtenerCampo("vlPrecioViaje").SetFocus
        Exit Sub
    End If
    
    Set ListItemNuevo = Me.lstItemsFactura.ListItems.Add(, , ObtenerCampo("cdProducto").Text)

    ListItemNuevo.SubItems(1) = ObtenerCampo("dsProducto").Text
    ListItemNuevo.SubItems(2) = ObtenerCampo("vlPrecioPeaje").Text
    ListItemNuevo.SubItems(3) = ObtenerCampo("vlPrecioViaje").Text
    
    calcularTotalesFactura
    
    ObtenerCampo("cdProducto").Text = ""
    ObtenerCampo("cdProducto").SetFocus
    HabilitarCampos "dsProducto", False
    HabilitarCampos "vlPrecioPeaje", False
    HabilitarCampos "vlPrecioViaje", False
    
       
        
End Sub


Private Sub calcularTotalesFactura()
Dim i            As Integer
Dim vlTotalPesos As Single


    For i = 1 To Me.lstItemsFactura.ListItems.Count
            vlTotalPesos = vlTotalPesos + _
            CSng(Me.lstItemsFactura.ListItems.Item(i).SubItems(3))
    Next
    
    ObtenerCampo("vlTotalDolares").Text = FormatNumber(vlTotalPesos / CSng(objConfig.vlDiaDolar), 2)
    ObtenerCampo("vlTotalEuros").Text = FormatNumber(vlTotalPesos / CSng(objConfig.vlDiaEuro), 2)
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
        If tlb_ABM.Buttons("Anular").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Anular")
        End If
    Case vbKeyF4
        If tlb_ABM.Buttons("Aceptar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
        End If
    Case vbKeyF5
        If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
        End If
    Case vbKeyF8
        If tlb_ABM.Buttons("Imprimir").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Imprimir")
        End If
    Case vbKeyF12
        If tlb_ABM.Buttons("Salir").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
        End If
    Case vbKeyAdd
        
    End Select


End Sub

Private Sub Form_Load()

    Select Case objParametros.ObtenerValor("Frm_AnularComprobantesHojaA4.modo")
    Case "Facturar"
        EstadoABM = facturar
    Case Else
        EstadoABM = Consulta
    End Select
    

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    SelecionarItemCombo
    cargarcamposdebusqueda
    Me.cmbCampos.ListIndex = 0
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
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
    "=", Me.lstBusqueda.SelectedItem.Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(1)
    
    ObjTablasIO.setearCampoOperadorValor "dsLeyenda", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlTotalGeneral", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpMoneda", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
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
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCodBar", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCondVenta", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmLicenciatario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsOpcional3", "->", ""

    ObjTablasIO.Seleccionar
    
    For Each Control In Me.Controls
        Valor = ""
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Comprobantes", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    Control.Locked = True
                    If Err Then
                        Control.Value = Valor
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    ObtenerItemsFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante")
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
           PresentarPantalla Button
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           EstadoABM = Consulta
    Case "Anular"
           EstadoABM = Consulta
           ' Pasar datos
           ' lstBusqueda_DblClick
           AnularComprobante
           PresentarPantalla Me.tlb_ABM.Buttons("Aceptar")
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
           If Not EstadoABM = facturar Then
            EstadoABM = alta
           End If
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrComprobante", objConfig.nrPuesto)
           ObtenerCampo("nrComprobante").Text = CompletarCerosaIzquierda(strValor, 8)
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Comprobantes", "nrTalonario", objConfig.nrPuesto)
           ObtenerCampo("nrTalonario").Text = CompletarCerosaIzquierda(strValor, 4)
           ObtenerCampo("dtComprobante") = Format(Date, "dd/MM/YYYY")
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("nrCaja")
           ObtenerCampo("nrPuesto").Text = objParametros.ObtenerValor("nrPuesto")
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           lblCotizacionDia.Caption = "Cotizaciones del D�a: Euro " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("vlDiaEuro")), 2)) + " "
           lblCotizacionDia.Caption = lblCotizacionDia.Caption + " Dolar " + _
           CStr(FormatNumber(CSng(objParametros.ObtenerValor("vlDiaDolar")), 2))
           
           ObtenerCampo("nrBultos").Text = "1"
           ObtenerCampo("nrPasajeros").Text = "1"
           
           PresentarPantalla Button
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                PresentarPantalla Button
           End If
    Case "Imprimir"
           ImprimirFactura ObtenerCampo("nrTalonario"), ObtenerCampo("nrComprobante"), ObtenerCampo("tpComprobante")
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           PresentarPantalla Button
           EstadoABM = Consulta
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


' Reliza la anulacion de un comprobante
' Esta anulaci�n no genera una nota de cr�dito ya que taxis ezeiza
' trabaja con Facturas C
Private Sub AnularComprobante()
Dim resp     As Byte

    If ObtenerCampo("nrComprobante") = "" Then Exit Sub
    
    resp = MsgBox("Esta seguro de desea anular el comprobante " + ObtenerCampo("nrComprobante") + ".", _
           vbQuestion + vbYesNo, "Atenci�n")

    If resp = vbNo Then Exit Sub
    
    objbasededatos.Basededatos.BeginTrans
    If AnularCupon() Then
   
         ObjTablasIO.nmTabla = "TB_Comprobantes"
         ObjTablasIO.setearCampoOperadorValor "nrComprobante", _
         "=", ObtenerCampo("nrComprobante"), " AND "
         ObjTablasIO.setearCampoOperadorValor "nrTalonario", _
         "=", ObtenerCampo("nrTalonario")
         ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "1"
         ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", CStr(Now())
         If ObjTablasIO.Actualizar() Then
             Select Case ObtenerCampo("cdCondVenta").Text
                Case "Contado"
                     If ActualizarCaja() Then
                         objbasededatos.Basededatos.CommitTrans
                         MsgBox "El Comprobante se ha anulado con �xito.", vbInformation + vbDefaultButton1, "Atenci�n"
                         Me.lstBusqueda.ListItems.Remove Me.lstBusqueda.SelectedItem.Index
                     Else
                         objbasededatos.Basededatos.RollbackTrans
                         MsgBox "Error: " + ObjTablasIO.Error, vbInformation + vbYesNo, "Atenci�n"
                     End If
                 Case Else
                     objbasededatos.Basededatos.CommitTrans
                 End Select
         Else
             objbasededatos.Basededatos.RollbackTrans
             MsgBox "Error: " + ObjTablasIO.Error, vbInformation + vbYesNo, "Atenci�n"
         End If
    Else
        objbasededatos.Basededatos.RollbackTrans
         MsgBox " No se puede anular este comprobante ", vbInformation + vbYesNo, "Atenci�n"
    End If

End Sub

Private Function AnularCupon() As Boolean

    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", _
    "=", ObtenerCampo("nrComprobante"), " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", _
    "=", ObtenerCampo("nrTalonario")
        
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "dtAnulado", "<-", CStr(Now())
    
    If ObjTablasIO.Actualizar() Then
       AnularCupon = True
    Else
       AnularCupon = False
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
            vlSaldoFinalPesos = vlSaldoFinalPesos - CSng(ObtenerCampo("vlPagoPesos").Text)
            vlSaldoFinalDolares = vlSaldoFinalDolares - CSng(ObtenerCampo("vlPagoDolares").Text)
            vlSaldoFinalEuros = vlSaldoFinalEuros - CSng(ObtenerCampo("vlPagoEuros").Text)
            
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


Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Not objExportar.aExcel_FromListView(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda) Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atenci�n"
        Exit Sub
    End If
    
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



Private Function FormadepagoOK() As Boolean

    FormadepagoOK = True
         
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
        
        MsgBox "Debe Ingresar una 'Razon Social' o un 'Apellido, Nombre'", vbCritical + vbDefaultButton1, "Atenci�n"
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
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(2)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "vlTotalItem", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Date)
               
        ObjTablasIO.Insertar
        
    Next

End Sub

Private Function ObtenerItemsFactura(pnrTanario As String, _
pnrComprobante As String) As Boolean
Dim i     As Integer


    ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", pnrTanario, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", pnrComprobante
    ObjTablasIO.setearCampoOperadorValor "nrItem", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdProducto", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsProducto", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlTotalItem", "->", ""
        
    ObjTablasIO.Seleccionar
    
    If Not ObjTablasIO.rs_resultados.EOF Then
       lstItemsFactura.ListItems.Clear
       objControl.CargarListView_SG ObjTablasIO.rs_resultados, _
       Me.lstItemsFactura, 0, "TB_ComprobantesDetalle"
       Me.lstBusqueda.ListItems.Item(1).Selected = True
       Me.lstBusqueda.SetFocus
    End If


End Function



Private Function GrabarTabladeCupones() As Boolean
Dim i     As Integer
Dim strValor As String
Dim cdCodBar As String
Dim vlComision As Single
        
        GrabarTabladeCupones = False
        
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
        
        vlComision = obtenerComision(CSng(ObtenerCampo("vlTotalGeneral").Text))
        
        ' FALTA PROGRAMAR
        ' Deber: lo que debe
        ' Haber: ganancia en el haber
        
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
    obtenerComision = 5
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
            ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).SubItems(2)
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
        MsgBox "Debe ingresar el destino", vbInformation, "Atenci�n"
        AvisarError "cdProducto", True
        GrabarDatosdeProductos = False
    End If
         
           
End Function



Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbCritical + vbYesNo, "Atenci�n")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Comprobantes"
        ObjTablasIO.setearCampoOperadorValor "cdComprobante", "=", ObtenerCampo("cdComprobante").Text
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atenci�n"
            EliminarRegistro = True
        End If
    End If
    
End Function


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim cdCodBar    As String
Dim strValor    As String

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
            
            
            
    cdCodBar = AgregarCaracteresAIzq(ObtenerCampo("nrTalonario").Text, 3, "0")
    cdCodBar = cdCodBar + AgregarCaracteresAIzq(ObtenerCampo("nrComprobante").Text, 8, "0")
    cdCodBar = cdCodBar + AgregarCaracteresAIzq(ObtenerCampo("nrLicencia").Text, 3, "0")
    
    ObjTablasIO.setearCampoOperadorValor _
              "cdCodBar", "<-", cdCodBar
    ObjTablasIO.setearCampoOperadorValor _
              "dtCaja", "<-", CStr(Now)
    ObjTablasIO.setearCampoOperadorValor _
              "dtInsercion", "<-", CStr(Now)
              
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



Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraReimpComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Anular"
           Me.fraBusqComprobantes.Visible = False
           Me.fraReimpComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraReimpComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraReimpComprobantes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.fraReimpComprobantes.Visible = False
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           If EstadoABM = facturar Then
                Me.fraBusqComprobantes.Visible = False
                Me.lstBusqueda.Visible = False
                Me.fraReimpComprobantes.Visible = True
                Me.tlb_ABM.Buttons("Buscar").Visible = False
                Me.tlb_ABM.Buttons("Seleccionar").Visible = False
                Me.tlb_ABM.Buttons("Exportar").Visible = False
                Me.tlb_ABM.Buttons("Anular").Visible = False
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = True
                Me.tlb_ABM.Buttons("Cancelar").Visible = True
                ObtenerCampo("cdCliente").SetFocus
           Else
                txtBusqueda_KeyPress vbKeyReturn
                Me.fraBusqComprobantes.Visible = True
                Me.lstBusqueda.Visible = True
                Me.fraReimpComprobantes.Visible = False
                Me.tlb_ABM.Buttons("Buscar").Visible = True
                Me.tlb_ABM.Buttons("Seleccionar").Visible = True
                Me.tlb_ABM.Buttons("Exportar").Visible = True
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Anular").Visible = False
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = False
                Me.tlb_ABM.Buttons("Cancelar").Visible = False
                Me.txtBusqueda.SetFocus
          End If
    Case "Cancelar"
        If EstadoABM = facturar Then
            Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraReimpComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           ObtenerCampo("cdCliente").SetFocus
        Else
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraReimpComprobantes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
        End If
    End Select
    
    ' Me.lstBusqueda.ListItems.Clear

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
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Comprobantes"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico _
         "TB_Comprobantes", Me.cmbCampos.Text
         
         
         ' Control de Filtros
         Select Case objUsuario.tpAcceso
         Case "Puestos"
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
                ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0", " AND "
               ' si es un Puesto y usuario Com�n
               ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCaja")
         Case "Administraci�n"
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
                ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0", ""
         Case "Contabilidad"
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
                ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0", ""
         Case Else
         End Select
         
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
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la seleci�n", vbInformation, "Atenci�n"
         End If
    Else
          objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.Text
          Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
          KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", Me.txtBusqueda, KeyAscii)
    End If
    
End Sub


Private Sub calcularSaldo()
Dim vlPagoPesos     As Single
Dim vlPagoDolares   As Single
Dim vlPagoEuros     As Single
Dim vlDiaEuro       As Single
Dim vlDiaDolar      As Single
Dim vlTotalGeneral  As Single
    
    If ObtenerCampo("vlPagoPesos").Text = "" Then
        vlPagoPesos = 0
    Else
        vlPagoPesos = CSng(ObtenerCampo("vlPagoPesos").Text)
    End If
    If ObtenerCampo("vlPagoDolares").Text = "" Then
        vlPagoDolares = 0
    Else
        vlPagoDolares = CSng(ObtenerCampo("vlPagoDolares").Text)
    End If
    If ObtenerCampo("vlPagoEuros").Text = "" Then
        vlPagoEuros = 0
    Else
        vlPagoEuros = CSng(ObtenerCampo("vlPagoEuros").Text)
    End If
    If ObtenerCampo("vlTotalGeneral").Text = "" Then
        vlTotalGeneral = 0
    Else
        vlTotalGeneral = CSng(ObtenerCampo("vlTotalGeneral").Text)
    End If
    If objConfig.vlDiaEuro = "" Then
        vlDiaEuro = 0
    Else
        vlDiaEuro = CSng(objParametros.ObtenerValor("vlDiaEuro"))
    End If
    If objConfig.vlDiaDolar = "" Then
        vlDiaDolar = 0
    Else
        vlDiaDolar = CSng(objParametros.ObtenerValor("vlDiaDolar"))
    End If


    vlPagoPesos = vlTotalGeneral - ((vlPagoDolares * vlDiaDolar) + (vlPagoEuros * vlDiaEuro))

    ObtenerCampo("vlPagoPesos").Text = FormatNumber(vlPagoPesos, 2)

End Sub


Private Sub txtFields_GotFocus(Index As Integer)

    
    DoEvents
    
    If Me.txtFields(Index).Tag <> "" And Me.txtFields(Index).Text <> "" Then
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
            ObtenerCampo("nrLicencia").Text = ""
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarlicencia
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
        strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").Value), "", ObjTablasIO.rs_resultados("nmApellido").Value) + ", "
        strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").Value), "", ObjTablasIO.rs_resultados("nmNombre").Value)
        ObtenerCampo("nmLicenciatario").Text = strNombreCompleto
    Else
        ObtenerCampo("nrLicencia").BackColor = Rojo
        ObtenerCampo("nrLicencia").SetFocus
    End If
         
End Sub
            
Private Sub buscarProducto()
Dim strNombreCompleto As String

    If Not ObtenerCampo("cdProducto").Text = "(Nuevo)" Then
        ObjTablasIO.nmTabla = "TB_Productos"
        ObjTablasIO.setearCampoOperadorValor _
        "cdProducto", "=", ObtenerCampo("cdProducto").Text
        ObjTablasIO.setearCampoOperadorValor "cdProducto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsProducto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "->", ""
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "->", ""
        
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
           ObtenerCampo("dsProducto").Text = ObjTablasIO.rs_resultados("dsProducto").Value
           ObtenerCampo("vlPrecioViaje").Text = AdaptarNulos(ObjTablasIO.rs_resultados("vlPrecioViaje").Value, "")
           ObtenerCampo("vlPrecioPeaje").Text = AdaptarNulos(ObjTablasIO.rs_resultados("vlPrecioPeaje").Value, "")
            HabilitarCampos "dsProducto", False
            HabilitarCampos "vlPrecioViaje", False
            HabilitarCampos "vlPrecioPeaje", False
        Else
           HabilitarCampos "dsProducto", False
           HabilitarCampos "vlPrecioViaje", False
           HabilitarCampos "vlPrecioPeaje", False
           ObtenerCampo("cdProducto").BackColor = Rojo
           ObtenerCampo("cdProducto").SetFocus
        End If
    Else
        HabilitarCampos "dsProducto", True
        HabilitarCampos "vlPrecioViaje", True
        HabilitarCampos "vlPrecioPeaje", True
        ObtenerCampo("dsProducto").SetFocus
    End If
    
             
End Sub
                    
           

Private Function ImprimirFactura(pnrTanario As String, _
pnrComprobante As String, tpComprobante) As Boolean
Dim strCodbarAFIP       As String
Dim objAFIP             As New CAFIP
Dim strCodbarAFIPI2to5  As String

    strCodbarAFIP = ObtenerCampo("dsOpcional3").Text
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
