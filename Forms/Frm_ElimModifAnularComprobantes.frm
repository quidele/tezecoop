VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Begin VB.Form Frm_ElimModifAnularComprobantes 
   Caption         =   "Corregir o Eliminar un Comprobante mal Cargado"
   ClientHeight    =   7740
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10095
   ClipControls    =   0   'False
   Icon            =   "Frm_ElimModifAnularComprobantes.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7740
   ScaleWidth      =   10095
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   32
      Top             =   0
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   1164
      ButtonWidth     =   2117
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgReimpComprobantesResaltado"
      HotImageList    =   "imgReimpComprobantesResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   12
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Comprobante"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Comprobante deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Eliminar"
            Key             =   "Eliminar"
            ImageKey        =   "Anular"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Anular"
            Key             =   "Anular"
            ImageKey        =   "Anular"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "Desanular"
            Key             =   "Desanular"
            ImageKey        =   "desanular"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "Deseliminar"
            Key             =   "Deseliminar"
            ImageKey        =   "deseliminar"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Corregir(F4)"
            Key             =   "Aceptar"
            Object.ToolTipText     =   "Corrige fecha, talonario o nro de comprobante"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (F12)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ElimModifAnularComprobantes.frx":030A
      Begin MSComctlLib.ImageList imgReimpComprobantesResaltado 
         Left            =   7935
         Top             =   30
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   13
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":06DC
               Key             =   "deseliminar"
               Object.Tag             =   "deseliminar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":1BDA
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":2254
               Key             =   "Anular"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":2364
               Key             =   "desanular"
               Object.Tag             =   "desanular"
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
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":2466
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":257E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":26D2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":27EA
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":28F6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":2A4A
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":2B52
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":31CE
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":332E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":3782
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":3BD6
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":4250
               Key             =   "Anular"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraVistaDetalleComprobantes 
      BorderStyle     =   0  'None
      Height          =   7065
      Left            =   30
      TabIndex        =   0
      Top             =   630
      Width           =   9525
      Begin VB.Frame Frame2 
         Caption         =   "Datos de la Factura"
         Height          =   5025
         Left            =   45
         TabIndex        =   41
         Top             =   2070
         Width           =   9165
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Enabled         =   0   'False
            Height          =   285
            Index           =   30
            Left            =   4005
            Locked          =   -1  'True
            TabIndex        =   90
            Tag             =   "dtComprobante"
            Top             =   645
            Width           =   1350
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   29
            Left            =   3585
            Locked          =   -1  'True
            TabIndex        =   88
            TabStop         =   0   'False
            Tag             =   "tpLetra"
            Top             =   645
            Width           =   435
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Enabled         =   0   'False
            Height          =   285
            Index           =   28
            Left            =   3045
            Locked          =   -1  'True
            TabIndex        =   87
            Tag             =   "tpComprobante"
            Top             =   645
            Width           =   555
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   27
            Left            =   5790
            Locked          =   -1  'True
            TabIndex        =   86
            Tag             =   "vlPagoReales"
            Top             =   4005
            Width           =   1065
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   9
            Left            =   4755
            Locked          =   -1  'True
            TabIndex        =   85
            Tag             =   "vlPagoEuros"
            Top             =   4005
            Width           =   1065
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Enabled         =   0   'False
            Height          =   285
            Index           =   26
            Left            =   3375
            Locked          =   -1  'True
            TabIndex        =   83
            Tag             =   "cdCliente"
            Top             =   90
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Enabled         =   0   'False
            Height          =   285
            Index           =   25
            Left            =   2760
            Locked          =   -1  'True
            TabIndex        =   82
            Tag             =   "tpFormadePago"
            Top             =   90
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H80000000&
            DataField       =   "flBloqueado"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   80
            Tag             =   "flEliminar"
            Top             =   4635
            Width           =   285
         End
         Begin VB.ComboBox Combox1 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   1
            ItemData        =   "Frm_ElimModifAnularComprobantes.frx":4360
            Left            =   1980
            List            =   "Frm_ElimModifAnularComprobantes.frx":436D
            Style           =   2  'Dropdown List
            TabIndex        =   77
            Tag             =   "tpComision"
            Top             =   1155
            Width           =   2190
         End
         Begin VB.ComboBox Combox1 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   0
            ItemData        =   "Frm_ElimModifAnularComprobantes.frx":4393
            Left            =   210
            List            =   "Frm_ElimModifAnularComprobantes.frx":43A3
            Style           =   2  'Dropdown List
            TabIndex        =   76
            Tag             =   "cdCondVenta"
            Top             =   1155
            Width           =   1725
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
            Index           =   23
            Left            =   4440
            Locked          =   -1  'True
            TabIndex        =   73
            TabStop         =   0   'False
            Tag             =   "flManual"
            Top             =   4275
            Width           =   1920
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H80000000&
            DataField       =   "flBloqueado"
            Enabled         =   0   'False
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   25
            Left            =   240
            TabIndex        =   71
            Tag             =   "flAnulado"
            Top             =   4335
            Width           =   285
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
            Index           =   24
            Left            =   5970
            Locked          =   -1  'True
            TabIndex        =   70
            TabStop         =   0   'False
            Tag             =   "IdReciboCtaCte"
            Top             =   4425
            Visible         =   0   'False
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Enabled         =   0   'False
            Height          =   285
            Index           =   22
            Left            =   8355
            Locked          =   -1  'True
            TabIndex        =   63
            Tag             =   "tpLetra"
            Top             =   4590
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   21
            Left            =   3555
            Locked          =   -1  'True
            TabIndex        =   62
            Tag             =   "dsOpcional3"
            Top             =   4620
            Visible         =   0   'False
            Width           =   4425
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   18
            Left            =   7950
            Locked          =   -1  'True
            TabIndex        =   25
            TabStop         =   0   'False
            Tag             =   "vlPagoPesos"
            Top             =   4005
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            Height          =   285
            Index           =   17
            Left            =   6825
            Locked          =   -1  'True
            TabIndex        =   24
            Tag             =   "vlPagoDolares"
            Top             =   4005
            Width           =   1155
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
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
            ForeColor       =   &H000000FF&
            Height          =   285
            Index           =   7
            Left            =   7950
            Locked          =   -1  'True
            TabIndex        =   23
            TabStop         =   0   'False
            Tag             =   "vlTotalGeneral"
            Top             =   4260
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   13
            Left            =   4170
            Locked          =   -1  'True
            TabIndex        =   17
            Tag             =   "nrLicencia"
            Top             =   1170
            Width           =   750
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
            Left            =   4905
            Locked          =   -1  'True
            TabIndex        =   18
            TabStop         =   0   'False
            Tag             =   "nmLicenciatario"
            Top             =   1170
            Width           =   2550
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "cdComprobante"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1755
            TabIndex        =   13
            TabStop         =   0   'False
            Tag             =   "nrComprobante"
            Top             =   645
            Width           =   1350
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   1
            Left            =   960
            TabIndex        =   12
            TabStop         =   0   'False
            Tag             =   "nrTalonario"
            Top             =   645
            Width           =   825
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
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
            Top             =   645
            Width           =   720
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   8
            Left            =   210
            Locked          =   -1  'True
            TabIndex        =   22
            Tag             =   "dsLeyenda"
            Top             =   4005
            Width           =   4560
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   10
            Left            =   5340
            Locked          =   -1  'True
            TabIndex        =   14
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   645
            Width           =   1800
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   11
            Left            =   7155
            Locked          =   -1  'True
            TabIndex        =   15
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   645
            Width           =   600
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   12
            Left            =   7785
            Locked          =   -1  'True
            TabIndex        =   16
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   645
            Width           =   1200
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   14
            Left            =   7635
            Locked          =   -1  'True
            TabIndex        =   19
            Tag             =   "nrBultos"
            Text            =   "1"
            Top             =   1170
            Width           =   405
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   15
            Left            =   8325
            Locked          =   -1  'True
            TabIndex        =   20
            Tag             =   "nrPasajeros"
            Text            =   "1"
            Top             =   1170
            Width           =   435
         End
         Begin MSComctlLib.ListView lstItemsFactura 
            Height          =   2145
            Left            =   240
            TabIndex        =   21
            Top             =   1575
            Width           =   8745
            _ExtentX        =   15425
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
               Text            =   "Código"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Key             =   "dsProducto"
               Object.Tag             =   "dsProducto"
               Text            =   "Descripción"
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
         Begin VB.Label Label28 
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
            Left            =   3600
            TabIndex        =   89
            Top             =   435
            Width           =   495
         End
         Begin VB.Label Label27 
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
            Left            =   5745
            TabIndex        =   84
            Top             =   3765
            Width           =   975
         End
         Begin VB.Label Label26 
            Caption         =   "Comprobante Eliminado"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   540
            TabIndex        =   81
            Top             =   4650
            Width           =   2610
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
            Left            =   2010
            TabIndex        =   79
            Top             =   945
            Width           =   1620
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
            Left            =   225
            TabIndex        =   78
            Top             =   930
            Width           =   1620
         End
         Begin VB.Label Label25 
            Caption         =   "Facturado:"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   3480
            TabIndex        =   75
            Top             =   4335
            Width           =   930
         End
         Begin VB.Label Label24 
            Caption         =   "Comprobante Anulado"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   540
            TabIndex        =   72
            Top             =   4350
            Width           =   1980
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
            Left            =   255
            TabIndex        =   60
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
            Left            =   4635
            TabIndex        =   57
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
            Left            =   6795
            TabIndex        =   56
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
            Left            =   7920
            TabIndex        =   55
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
            Left            =   4170
            TabIndex        =   54
            Top             =   930
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
            Left            =   4965
            TabIndex        =   53
            Top             =   930
            Width           =   1455
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
            Index           =   1
            Left            =   3105
            TabIndex        =   52
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
            TabIndex        =   51
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
            Left            =   4155
            TabIndex        =   50
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
            TabIndex        =   49
            Top             =   225
            Width           =   780
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
            TabIndex        =   48
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
            Left            =   195
            TabIndex        =   47
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
            TabIndex        =   46
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
            TabIndex        =   45
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
            TabIndex        =   44
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
            Left            =   7515
            TabIndex        =   43
            Top             =   960
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
            Left            =   8160
            TabIndex        =   42
            Top             =   945
            Width           =   945
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Datos del Cliente"
         Height          =   1875
         Left            =   75
         TabIndex        =   33
         Top             =   90
         Width           =   9120
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   20
            Left            =   3585
            Locked          =   -1  'True
            TabIndex        =   6
            Tag             =   "cdPostal"
            Top             =   990
            Width           =   1575
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
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
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   51
            Left            =   5115
            Locked          =   -1  'True
            TabIndex        =   10
            Tag             =   "nrTel"
            Top             =   1485
            Width           =   3585
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
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
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   6
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   2
            Tag             =   "dsRazonSocial"
            Top             =   450
            Width           =   2640
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
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
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   3
            Left            =   7140
            Locked          =   -1  'True
            TabIndex        =   8
            Tag             =   "nrDoc"
            Top             =   990
            Width           =   1575
         End
         Begin VB.TextBox txtDatosClientes 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   1
            Left            =   4500
            Locked          =   -1  'True
            TabIndex        =   3
            Tag             =   "nmApellido"
            Top             =   450
            Width           =   1725
         End
         Begin VB.TextBox txtDatosClientes 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "dsRazonSocial"
            Height          =   285
            Index           =   2
            Left            =   6210
            Locked          =   -1  'True
            TabIndex        =   4
            Tag             =   "nmNombre"
            Top             =   450
            Width           =   2505
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
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
            Width           =   4845
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
            TabIndex        =   61
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
            TabIndex        =   59
            Top             =   735
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
            Left            =   5115
            TabIndex        =   58
            Top             =   1290
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
            TabIndex        =   40
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
            Left            =   1905
            TabIndex        =   39
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
            TabIndex        =   38
            Top             =   720
            Width           =   2580
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
            Left            =   7170
            TabIndex        =   37
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
            TabIndex        =   36
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
            Left            =   6210
            TabIndex        =   35
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
            TabIndex        =   34
            Top             =   1275
            Width           =   930
         End
      End
   End
   Begin VB.Frame fraBusqComprobantes 
      BorderStyle     =   0  'None
      Height          =   7005
      Left            =   30
      TabIndex        =   29
      Top             =   705
      Width           =   9375
      Begin VB.CommandButton cmdBuscar 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   5730
         Picture         =   "Frm_ElimModifAnularComprobantes.frx":43DD
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   750
         Width           =   375
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4335
         TabIndex        =   26
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
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":44DF
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":45F1
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":4703
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":4815
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":4927
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ElimModifAnularComprobantes.frx":4A39
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   28
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
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Top             =   330
         Width           =   2400
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1470
         TabIndex        =   65
         Tag             =   "dtDesde"
         Top             =   735
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   135069697
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   3960
         TabIndex        =   66
         Tag             =   "dtHasta"
         Top             =   750
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   135069697
         CurrentDate     =   38267
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5445
         Left            =   120
         TabIndex        =   69
         Top             =   1155
         Width           =   9075
         _ExtentX        =   16007
         _ExtentY        =   9604
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
         NumItems        =   12
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
            Object.Tag             =   "tpComprobante"
            Text            =   "Letra"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dtComprobante"
            Text            =   "Fecha "
            Object.Width           =   2293
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "flManual"
            Text            =   "Facturado"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "cdCondVenta"
            Text            =   "Cond. Venta"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "cdCliente"
            Text            =   "Cliente"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razon Social"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "nrCaja"
            Text            =   "Caja"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Object.Tag             =   "tpLetra"
            Text            =   "tpLetra"
            Object.Width           =   2
         EndProperty
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
         Index           =   10
         Left            =   135
         TabIndex        =   68
         Top             =   840
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
         Index           =   9
         Left            =   3240
         TabIndex        =   67
         Top             =   825
         Width           =   645
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   31
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   30
         Top             =   105
         Width           =   795
      End
   End
   Begin VB.Label Label20 
      Caption         =   "Comprobante Anulado"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   0
      TabIndex        =   74
      Top             =   0
      Width           =   1965
   End
End
Attribute VB_Name = "Frm_ElimModifAnularComprobantes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Pasar form a la versión 1.3
Option Explicit

Const const_dsProducto = 2

Dim EstadoABM As Byte
Dim objControl As New CControl

Dim nrTalonarioMaximo    As Integer

Dim nrTalonario_anterior   As String
Dim nrComprobante_anterior As String
Dim tpComprobante_anterior As String
Dim tpLetra_anterior       As String
Dim dtComprobante_anterior As String
Dim cdCondVenta_anterior   As String
Dim tpComision_anterior    As String


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
                        On Error Resume Next
                        Control.value = False
                        On Error GoTo 0
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


Private Sub cmdBuscar_Click()

    txtBusqueda_KeyPress vbKeyReturn
    
End Sub

Private Sub Combox1_Change(Index As Integer)

    Select Case Me.Combox1(Index).Tag
    Case "cdCondVenta"
            setearCondicionVentayComision
    End Select
    

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



Private Sub Form_Activate()
    
    ' codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Anulacion", "administracion.Eliminacion"
            Me.txtBusqueda.Text = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
            txtBusqueda_KeyPress vbKeyReturn
            lstBusqueda_DblClick
            PresentarPantalla Me.tlb_ABM.Buttons("Anular")
    Case "administracion.modificacion"
            Me.txtBusqueda.Text = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
            txtBusqueda_KeyPress vbKeyReturn
            lstBusqueda_DblClick
            PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    Case "administracion.consulta"
            Me.txtBusqueda.Text = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
            txtBusqueda_KeyPress vbKeyReturn
            lstBusqueda_DblClick
            PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    End Select
    
End Sub



Private Sub habilitarDeshabilitarControlesModif(pbHabil As Boolean)
    
    If pbHabil Then
           If ObtenerCampo("flManual").Text = "Manualmente" Then
                ' si el comprobante fue fatura por manualmente
                HabilitarCampos "nrComprobante", pbHabil
                HabilitarCampos "tpComprobante", pbHabil
                ObtenerCampo("dtComprobante").Enabled = pbHabil
                HabilitarCampos "nrTalonario", pbHabil
                '------
                HabilitarCampos "cdCondVenta", pbHabil
                HabilitarCampos "tpComision", pbHabil
                
           Else
                ' si el comprobante fue fatura por sistema
                HabilitarCampos "nrComprobante", Not pbHabil
                HabilitarCampos "tpComprobante", Not pbHabil
                ObtenerCampo("dtComprobante").Enabled = Not pbHabil
                HabilitarCampos "nrTalonario", Not pbHabil
                '------
                HabilitarCampos "cdCondVenta", pbHabil
                HabilitarCampos "tpComision", pbHabil
           End If
    Else
        HabilitarCampos "nrComprobante", pbHabil
        HabilitarCampos "tpComprobante", pbHabil
        ObtenerCampo("dtComprobante").Enabled = pbHabil
        HabilitarCampos "nrTalonario", pbHabil
        HabilitarCampos "cdCondVenta", pbHabil
        HabilitarCampos "tpComision", pbHabil
    End If
    
End Sub






' procedure agregado en la versión 2.5
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode
    Case vbKeyEscape
        If tlb_ABM.Buttons("Cancelar").Visible Then
           ' Código agregado en la versión 2.5
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                Unload Me
                Exit Sub
            Case Else
            End Select
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
        If tlb_ABM.Buttons("Eliminar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
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

    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "Facturar"
        EstadoABM = facturar
    Case Else
        EstadoABM = Consulta
    End Select
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    SelecionarItemCombo
    cargarcamposdebusqueda
    ObtenerCampo("dtDesde").value = Date
    ObtenerCampo("dtHasta").value = Date
    Me.cmbCampos.ListIndex = 1
    
    ' codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
        Me.fraVistaDetalleComprobantes.Visible = True
    Case Else
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    End Select
    
    If objbasededatos.ExecStoredProcedures(" SP_ObtenerTalonarioMaximo_v1_4 ") Then
        nrTalonarioMaximo = objbasededatos.rs_resultados("nrTalonarioMaximo").value + 1
    Else
        nrTalonarioMaximo = 100
    End If

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
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(1), " AND "
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(9), " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", _
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(11), " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", _
    "=", Me.lstBusqueda.SelectedItem.ListSubItems(2)
    
    
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
    ObjTablasIO.setearCampoOperadorValor "IdReciboCtaCte", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flAnulado", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "->", ""
    ObjTablasIO.setearCampoOperadorValor "flManual", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpComision", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlPagoReales", "->", ""
    
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
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    ObtenerCampo("nrTalonario") = Trim(ObtenerCampo("nrTalonario"))
    ObtenerCampo("nrComprobante") = Trim(ObtenerCampo("nrComprobante"))
    
    nrTalonario_anterior = ObtenerCampo("nrTalonario")
    nrComprobante_anterior = ObtenerCampo("nrComprobante")
    tpComprobante_anterior = Trim(ObjTablasIO.rs_resultados("tpComprobante"))
    tpLetra_anterior = Trim(ObjTablasIO.rs_resultados("tpLetra"))
    dtComprobante_anterior = Trim(ObjTablasIO.rs_resultados("dtComprobante"))
    tpComprobante_anterior = Trim(ObjTablasIO.rs_resultados("tpComprobante"))
    
    cdCondVenta_anterior = Trim(ObjTablasIO.rs_resultados("cdCondVenta"))
    tpComision_anterior = Trim(ObjTablasIO.rs_resultados("tpComision"))
    
    If CStr(AdaptarNulos(ObjTablasIO.rs_resultados("flManual"), "")) = "M" Then
        ObtenerCampo("flManual").Text = "Manualmente"
    Else
        ObtenerCampo("flManual").Text = "Por Sistema"
    End If

    ObtenerItemsFactura ObtenerCampo("nrTalonario"), _
                        ObtenerCampo("nrComprobante"), _
                        ObjTablasIO.rs_resultados("tpComprobante"), _
                        ObjTablasIO.rs_resultados("tpLetra")
                         
    ' la fiorma de pago se utiliza para la Condicion de venta
    objCliente.ObtenerCliente ObtenerCampo("cdCliente").Text
    ObtenerCampo("tpFormadePago") = objCliente.tpFormadePago


    ' código agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion"
        ObtenerCampo("nrTalonario").Locked = True
        ObtenerCampo("nrComprobante").Locked = True
        ObtenerCampo("tpComprobante").Locked = True
        setearCondicionVentayComision
        ObtenerCampo("cdCondVenta") = cdCondVenta_anterior
        ObtenerCampo("tpComision") = tpComision_anterior
    Case "administracion.consulta"
        habilitarDeshabilitarControlesModif False
    Case Else
        ObtenerCampo("nrTalonario").Locked = False
        ObtenerCampo("nrComprobante").Locked = False
        ObtenerCampo("tpComprobante").Locked = False
        EstadoABM = modificacion
        PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
        On Error Resume Next
        ObtenerCampo("nrTalonario").SetFocus
        On Error GoTo 0
    End Select
    
    
    
    
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
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                ' Código agregado en la versión 2.5
                Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
                Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                    Unload Me
                    Exit Sub
                Case Else
                End Select
                txtBusqueda_KeyPress vbKeyReturn
                PresentarPantalla Button
           End If
    Case "Anular"
            If AnularComprobante() Then
                ' Código agregado en la versión 2.5
                Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
                Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                    Unload Me
                    Exit Sub
                Case Else
                End Select
                PresentarPantalla Button
            End If
    Case "Imprimir"
           ImprimirFactura ObtenerCampo("nrTalonario"), _
                           ObtenerCampo("nrComprobante"), _
                           ObtenerCampo("tpComprobante"), ObtenerCampo("tpComprobante"), objParametros.ObtenerValor("FormatoHoja")
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
            Unload Me
    Case "Aceptar"
           If CorrigeErrores() = False Then Exit Sub
           PresentarPantalla Button
           EstadoABM = Consulta
           ' Código agregado en la versión 2.5
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                Unload Me
            Case Else
            End Select
    Case "Cancelar"
           If EstadoABM = facturar Then
              EstadoABM = facturar
              tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
           Else
              PresentarPantalla Button
              EstadoABM = Consulta
           End If
           ' Código agregado en la versión 2.5
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                Unload Me
                Exit Sub
            Case Else
            End Select
    Case "Desanular"
        If cmdDesanular() Then
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                Unload Me
                Exit Sub
            Case Else
            End Select
        End If
    Case "Deseliminar"
        If cmdDeseliminar() Then
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
                Unload Me
                Exit Sub
            Case Else
            End Select
        End If
    End Select
    
End Sub


Private Function cmdDesanular() As Boolean
Dim resp        As Byte
Dim strMotivo   As String


        cmdDesanular = False

        If ObtenerCampo("flAnulado") = 0 Then
            MsgBox "El comprobante no se encuentra anulado.", vbCritical + vbDefaultButton1, "Atención"
            Exit Function
        End If

        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
            strMotivo = InputBox("Ingrese el motivo de dicha desanulación.", "Motivo de la Eliminación")
        End Select
        
        resp = MsgBox("Esta seguro que desea 'Anular' este comprobante.", vbQuestion + vbYesNo, "Atención")
        
        If resp = vbNo Then Exit Function
        
        ' Transaccionamos
        objbasededatos.BeginTrans
        
        objComprobante.nrTalonario = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrTalonario")
        objComprobante.nrComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
        objComprobante.tpComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpComprobante")
        objComprobante.tpLetra = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpLetra")
        objComprobante.nrCierre = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrCierre")
        objComprobante.IdReciboCtaCte = ObtenerCampo("IdReciboCtaCte")
        objComprobante.CondVenta = ObtenerCampo("cdCondVenta")
        objComprobante.nrCaja = ObtenerCampo("nrCaja")
        objComprobante.vlPesos = ObtenerCampo("vlPagoPesos")
        objComprobante.vlDolares = ObtenerCampo("vlPagoDolares")
        objComprobante.vlEuros = ObtenerCampo("vlPagoEuros")
 
        objComprobante.vlDiaDolar = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaDolar")
        objComprobante.vlDiaEuro = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaEuro")
        objComprobante.vlReales = ObtenerCampo("vlPagoReales")
        objComprobante.vlDiaReal = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaReal")
               
       
        If Not objComprobante.desanularComprobante Then
            objbasededatos.RollBackTrans
            MsgBox "Error: " + objComprobante.Error, vbDefaultButton1 + vbCritical, "Atención"
            Exit Function
        End If
        
        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
               objComprobante.tpModificacionCajaPuesto = "Desanulado"
               objComprobante.dsObservacionCajaPuesto = strMotivo
            ' Grabar el motivo de la Eliminación
            If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
                objbasededatos.RollBackTrans
                MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                Exit Function
            End If
        End Select

        ' comitiamos y persistimos los cambios
        objbasededatos.CommitTrans

        ObtenerCampo("flAnulado") = 0
        
        MsgBox "El comprobante ha sido 'desanulado' con éxito", vbDefaultButton1 + vbInformation, "Atención"
    
        cmdDesanular = True
    
        
End Function


Private Function cmdDeseliminar() As Boolean
Dim resp        As Byte
Dim strMotivo   As String


        cmdDeseliminar = False

        If ObtenerCampo("flEliminar") = 0 Then
            MsgBox "El comprobante no se encuentra anulado.", vbCritical + vbDefaultButton1, "Atención"
            Exit Function
        End If

        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
            strMotivo = InputBox("Ingrese el motivo de dicha deseliminacion.", "Motivo de la Eliminación")
        End Select
        
        resp = MsgBox("Esta seguro que desea 'Deseliminar' este comprobante.", vbQuestion + vbYesNo, "Atención")
        
        If resp = vbNo Then Exit Function
        
        ' Transaccionamos
        objbasededatos.BeginTrans
        objComprobante.nrTalonario = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrTalonario")
        objComprobante.nrComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
        objComprobante.tpComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpComprobante")
        objComprobante.tpLetra = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpLetra")
        objComprobante.nrCierre = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrCierre")
        objComprobante.IdReciboCtaCte = ObtenerCampo("IdReciboCtaCte")
        objComprobante.CondVenta = ObtenerCampo("cdCondVenta")
        objComprobante.nrCaja = ObtenerCampo("nrCaja")
        objComprobante.vlPesos = ObtenerCampo("vlPagoPesos")
        objComprobante.vlDolares = ObtenerCampo("vlPagoDolares")
        objComprobante.vlEuros = ObtenerCampo("vlPagoEuros")
        objComprobante.vlDiaDolar = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaDolar")
        objComprobante.vlDiaEuro = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaEuro")
        objComprobante.vlReales = ObtenerCampo("vlPagoReales")
        objComprobante.vlDiaReal = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaReal")
               


        objComprobante.flAnulado = ObtenerCampo("flAnulado")
               
        If Not objComprobante.deseliminarComprobante Then
            objbasededatos.RollBackTrans
            MsgBox "Error: " + objComprobante.Error, vbDefaultButton1 + vbCritical, "Atención"
            Exit Function
        End If
        
        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
               objComprobante.tpModificacionCajaPuesto = "Deseliminado"
               objComprobante.dsObservacionCajaPuesto = strMotivo
            ' Grabar el motivo de la Eliminación
            If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
                objbasededatos.RollBackTrans
                MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                Exit Function
            End If
        End Select

        ' comitiamos y persistimos los cambios
        objbasededatos.CommitTrans
        ObtenerCampo("flEliminar") = 0
        MsgBox "El comprobante ha sido 'Deseliminado' con éxito", vbDefaultButton1 + vbInformation, "Atención"
    
        cmdDeseliminar = True
        
End Function




Private Function AnularComprobante() As Boolean
Dim resp        As Byte
Dim strMotivo   As String


        AnularComprobante = False

        If ObtenerCampo("flAnulado") = 1 Then
            MsgBox "El comprobante ya se enuectra anulado.", vbCritical + vbDefaultButton1, "Atención"
            Exit Function
        End If

        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
            strMotivo = InputBox("Ingrese el motivo de dicha anulación.", "Motivo de la Eliminación")
        End Select
        
        resp = MsgBox("Esta seguro que desea 'Anular' este comprobante.", vbQuestion + vbYesNo, "Atención")
        
        
        If resp = vbNo Then Exit Function
        
        ' Transaccionamos
        objbasededatos.BeginTrans
    

        objComprobante.nrTalonario = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrTalonario")
        objComprobante.nrComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante")
        objComprobante.tpComprobante = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpComprobante")
        objComprobante.tpLetra = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpLetra")
        objComprobante.nrCierre = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrCierre")
        objComprobante.IdReciboCtaCte = ObtenerCampo("IdReciboCtaCte")
        objComprobante.CondVenta = ObtenerCampo("cdCondVenta")
        objComprobante.nrCaja = ObtenerCampo("nrCaja")
        objComprobante.vlPesos = ObtenerCampo("vlPagoPesos")
        objComprobante.vlDolares = ObtenerCampo("vlPagoDolares")
        objComprobante.vlEuros = ObtenerCampo("vlPagoEuros")
        objComprobante.vlReales = ObtenerCampo("vlPagoReales")
        
        objComprobante.vlDiaDolar = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaDolar")
        objComprobante.vlDiaEuro = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaEuro")
        objComprobante.vlDiaReal = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaReal")
               
               
        If Not objComprobante.AnularComprobante Then
            objbasededatos.RollBackTrans
            MsgBox "Error: " + objComprobante.Error, vbDefaultButton1 + vbCritical, "Atención"
            Exit Function
        End If
        
        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
               objComprobante.tpModificacionCajaPuesto = "Anulado"
               objComprobante.dsObservacionCajaPuesto = strMotivo
            ' Grabar el motivo de la Eliminación
            If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
                objbasededatos.RollBackTrans
                MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                Exit Function
            End If
        End Select

        ' comitiamos y persistimos los cambios
        objbasededatos.CommitTrans
        
        AnularComprobante = True
        ObtenerCampo("flAnulado") = 1
        MsgBox "El comprobante ha sido anulado con éxito", vbDefaultButton1 + vbInformation, "Atención"
    
        
        
End Function




Public Function CorrigeErrores() As Boolean
Dim resp    As Byte
Dim strSQL  As String
Dim bModificoNumeros As Boolean
Dim bModificoFecha   As Boolean
Dim vlComision       As String
Dim strMotivo        As String



    CorrigeErrores = False

    If Trim(ObtenerCampo("nrTalonario")) = "" Then
        MsgBox "Debe completar el nro. de talonario", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario").SetFocus
        Exit Function
    End If
    
    If Not IsNumeric(ObtenerCampo("nrTalonario")) Then
        ObtenerCampo("nrTalonario").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("nrComprobante")) = "" Then
        MsgBox "Debe completar el nro. de comprobante", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante").SetFocus
        Exit Function
    End If

    If Not IsNumeric(ObtenerCampo("nrComprobante")) Then
        ObtenerCampo("nrComprobante").SetFocus
        Exit Function
    End If
    
    If Trim(ObtenerCampo("tpComprobante")) = "" Then
        MsgBox "Debe completar la letra del comprobante", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpComprobante").SetFocus
        Exit Function
    End If
    
    ' Eliminamos la restriccion version 3.7
    ' If cdCondVenta_anterior <> ObtenerCampo("cdCondVenta") And ObtenerCampo("cdCondVenta") = "Cuenta Corriente" Then
    '    MsgBox "No se puede modificar a la condición de venta a 'Cuenta Corriente'", vbInformation + vbDefaultButton1, "Atención"
    '     ObtenerCampo("cdCondVenta").SetFocus
    '     Exit Function
    ' End If
    
    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
        strMotivo = InputBox("Ingrese el motivo de la corrección.", "Motivo de la Eliminación")
    End Select
    
        
    resp = MsgBox("Esta seguro que desea 'Corregir' el comprobante.", vbQuestion + vbYesNo, "Atención")
    
    If resp = vbNo Then Exit Function


    If nrTalonario_anterior = Trim(ObtenerCampo("nrTalonario")) And _
       nrComprobante_anterior = Trim(ObtenerCampo("nrComprobante")) And _
       tpComprobante_anterior = Trim(ObtenerCampo("tpComprobante")) And _
       dtComprobante_anterior = ObtenerCampo("dtComprobante") And _
       cdCondVenta_anterior = ObtenerCampo("cdCondVenta") And _
       tpComision_anterior = ObtenerCampo("tpComision") Then
            MsgBox "No se han modificados los valores porque no hizo modificaciones a los datos, verifique sus cambios.", vbInformation, "Atención"
            CorrigeErrores = False
            Exit Function
    End If
    
    ' Transaccionamos
    objbasededatos.BeginTrans
    
    'vlComision = objComision.obtenerComision(CSng(ObtenerCampo("vlTotalGeneral")), ObtenerCampo("cdCondVenta").Text, ObtenerCampo("tpComision").Text, obtenerlistadecodigosdestinos())
    
    ' modificado en la version 4.3
    vlComision = FormatNumber(objComision.obtenerComision(CSng(ObtenerCampo("vlTotalGeneral")), ObtenerCampo("cdCondVenta").Text, ObtenerCampo("tpComision").Text, obtenerGrillaDatosLiquidaComision(), ObtenerCampo("tpComprobante")), 2)
     
    ' Modificado en la versión 2.5
    objSPs.nmStoredProcedure = "SP_ActualizarComprobante_v3_7"
    objSPs.setearCampoValor "@nrTalonario_param", nrTalonario_anterior
    objSPs.setearCampoValor "@nrComprobante_param", nrComprobante_anterior
    objSPs.setearCampoValor "@tpComprobante_param", tpComprobante_anterior
    objSPs.setearCampoValor "@tpLetra_param", tpLetra_anterior
    objSPs.setearCampoValor "@nrTalonario_new_param", ObtenerCampo("nrTalonario")
    objSPs.setearCampoValor "@nrComprobante_new_param", ObtenerCampo("nrComprobante")
    objSPs.setearCampoValor "@tpComprobante_new_param", ObtenerCampo("tpComprobante")
    objSPs.setearCampoValor "@tpLetra_new_param", ObtenerCampo("tpComprobante")
    objSPs.setearCampoValor "@dtComprobante_new_param", ObtenerCampo("dtComprobante")
    objSPs.setearCampoValor "@cdCondVenta_new_param", ObtenerCampo("cdCondVenta")
    objSPs.setearCampoValor "@tpComision_new_param", ObtenerCampo("tpComision")
    objSPs.setearCampoValor "@vlComision_new_param", vlComision
    objSPs.setearCampoValor "@nrCierre_param", objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrCierre")
    
    
    If Not objSPs.ExecSP() Then
        ' cerramos la transaccion
        objbasededatos.RollBackTrans
        MsgBox objbasededatos.Error, vbCritical + vbDefaultButton1, "Error"
        Exit Function
    Else
        ' Codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
            
            objComprobante.nrTalonario = ObtenerCampo("nrTalonario")
            objComprobante.nrComprobante = ObtenerCampo("nrComprobante")
            objComprobante.tpComprobante = ObtenerCampo("tpComprobante")
            objComprobante.tpLetra = ObtenerCampo("tpLetra")
            objComprobante.tpModificacionCajaPuesto = "Modificado"
            objComprobante.dsObservacionCajaPuesto = strMotivo
            ' Grabar el motivo de la Eliminación
            If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
                objbasededatos.RollBackTrans
                MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                Exit Function
            End If
            
            '/***********************************************************************/
            If cdCondVenta_anterior <> ObtenerCampo("cdCondVenta") Then
                ' obtenemos los nuevos valores del pago del comprobante
                
                
                If Not objComprobante.obtenerCondVentayValoresdePagosModificados _
                    (cdCondVenta_anterior, ObtenerCampo("cdCondVenta"), _
                    ObtenerCampo("vlTotalGeneral"), ObtenerCampo("vlPagoPesos"), _
                    ObtenerCampo("vlPagoDolares"), ObtenerCampo("vlPagoEuros"), _
                     ObtenerCampo("vlPagoReales")) Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
                    Exit Function
                End If
                
                ' MsgBox "revisar en la version 3.7"
                ' Obtenemos los nuevos montos de pago
                objCajas.nrCaja = ObtenerCampo("nrCaja")
                objCajas.vlPesos = objComprobante.vlPagoPesosACP
                objCajas.vlDolares = objComprobante.vlPagoDolaresACP
                objCajas.vlEuros = objComprobante.vlPagoEurosACP
                objCajas.vlReales = objComprobante.vlPagoRealesACP
                
                objCajas.vlDiaDolar = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaDolar")
                objCajas.vlDiaEuro = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaEuro")
                objCajas.vlDiaReal = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.vlDiaReal")
        
                If ObtenerCampo("flAnulado") = 0 Then
                    ' actualizamos el saldo se la caja
                    If Not objCajas.ActualizarCaja(True) Then
                        objbasededatos.RollBackTrans
                        MsgBox "Error: " + objCajas.Error, vbCritical + vbDefaultButton1, "Atención"
                        Exit Function
                    End If
                End If
                    
                
                If Not objCajas.ActualizarDiferenciaSaldoCajaPuesto() Then
                    objbasededatos.RollBackTrans
                    MsgBox "Error: " + objCajas.Error, vbCritical + vbDefaultButton1, "Atención"
                    Exit Function
                End If
                
            End If
            '/***********************************************************************/
        End Select
        ObtenerCampo("nrTalonario") = Trim(ObtenerCampo("nrTalonario"))
        ObtenerCampo("nrComprobante") = Trim(ObtenerCampo("nrComprobante"))
        nrTalonario_anterior = Trim(ObtenerCampo("nrTalonario"))
        nrComprobante_anterior = Trim(ObtenerCampo("nrComprobante"))
        tpComprobante_anterior = Trim(ObtenerCampo("tpComprobante"))
        dtComprobante_anterior = ObtenerCampo("dtComprobante")
        cdCondVenta_anterior = ObtenerCampo("cdCondVenta")
        tpComision_anterior = ObtenerCampo("tpComision")
        CorrigeErrores = True
        
        ' comitiamos y persistimos los cambios
        objbasededatos.CommitTrans
        

        MsgBox "El comprobante se ha actualizado con éxito.", vbInformation + vbDefaultButton1, "Atención"
    End If
        
End Function


Private Function actualizarFechaActualizaciondelaCaja() As Boolean

    actualizarFechaActualizaciondelaCaja = False

    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()

    If ObjTablasIO.Actualizar Then
        actualizarFechaActualizaciondelaCaja = True
    End If

End Function




Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Comprobantes") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
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
        ObjTablasIO.setearCampoOperadorValor "vlPrecioPeaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(2)
        ObjTablasIO.setearCampoOperadorValor "vlPrecioViaje", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "vlTotalItem", "<-", Me.lstItemsFactura.ListItems(i).ListSubItems(3)
        ObjTablasIO.setearCampoOperadorValor "dtInsercion", "<-", CStr(Date)
        
        ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
        ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
               
        ObjTablasIO.Insertar
        
    Next

End Sub

Private Function ObtenerItemsFactura(pnrTanario As String, _
pnrComprobante As String, ptpComprobante As String, ptpLetra As String) As Boolean
Dim i     As Integer


    ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", pnrTanario, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", pnrComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", ptpComprobante, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", ptpLetra
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
       On Error Resume Next
       Me.lstBusqueda.SetFocus
       On Error GoTo 0
    End If


End Function

'  Version 1.3 MUY IMPORTANTE PENDIENTE
'  Ademas de de actualizar el flag flEliminar se debe actualizar la fecha actualizacion
'  de esta forma se reflejará el cambio en el
'  tambien se debe actualizar los datos de flSincronizado
Private Function EliminarRegistro() As Boolean
Dim resp As Byte
Dim strMotivo As String

    EliminarRegistro = False

    ObtenerCampo("nrTalonario") = nrTalonario_anterior
    ObtenerCampo("nrComprobante") = nrComprobante_anterior
    
    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
        strMotivo = InputBox("Ingrese el motivo de dicha eliminación.", "Motivo de la Eliminación")
    End Select
    
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
        
    If resp = vbNo Then Exit Function
    
    EliminarRegistro = False
    
    objbasededatos.BeginTrans
    
    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Eliminacion", "administracion.Anulacion", "administracion.modificacion"
        '/***********************************************************************/
        objComprobante.nrTalonario = ObtenerCampo("nrTalonario").Text
        objComprobante.nrComprobante = ObtenerCampo("nrComprobante").Text
        objComprobante.tpComprobante = ObtenerCampo("tpComprobante").Text
        objComprobante.tpLetra = ObtenerCampo("tpLetra").Text
        objComprobante.nrCierre = objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrCierre")
        ' Grabar el estado anterior en la tabla de comprobantes cierres
        If Not objComprobante.guardarComprobanteCajaPuestoAnterior() Then
            objbasededatos.RollBackTrans
            MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
            Exit Function
        End If
        objComprobante.tpModificacionCajaPuesto = "Eliminado"
        objComprobante.dsObservacionCajaPuesto = strMotivo
        ' Grabar el motivo de la Eliminación
        If Not objComprobante.marcarTipodeActualizacionCajaPuesto() Then
            objbasededatos.RollBackTrans
            MsgBox "Error: " + objComprobante.Error, vbCritical + vbDefaultButton1, "Atención"
            Exit Function
        End If
        '/***********************************************************************/
    End Select
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", ObtenerCampo("nrComprobante").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", ObtenerCampo("nrTalonario").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", ObtenerCampo("tpComprobante").Text, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", ObtenerCampo("tpLetra").Text, " AND"
    ObjTablasIO.setearCampoOperadorValor "flCompensado", "=", "1"
    ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
    
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        objbasededatos.RollBackTrans
        MsgBox "Error: el comprobante no puede 'Eliminarse' porque ya fue compensado.", vbCritical + vbDefaultButton1, "Atención"
        Exit Function
    Else
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "=", ObtenerCampo("nrComprobante").Text, " AND"
        ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "=", ObtenerCampo("nrTalonario").Text, " AND"
        ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "=", ObtenerCampo("tpComprobante").Text, " AND"
        ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "=", ObtenerCampo("tpLetra").Text
        ' lo marcamos como eliminado
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
        ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
        ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
        ObjTablasIO.Actualizar
    End If

    ' eliminar el detalle
    ObjTablasIO.nmTabla = "TB_ComprobantesDetalle"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", ObtenerCampo("nrComprobante").Text, " AND"
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", ObtenerCampo("nrTalonario").Text, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", ObtenerCampo("tpComprobante").Text, " AND"
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", ObtenerCampo("tpLetra").Text
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
            
    If Not ObjTablasIO.Actualizar Then
        objbasededatos.RollBackTrans
        MsgBox "Error no se pudo eliminar el comprobante", vbCritical + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    ' Pendiente Controlar antes de eliminar
    ObjTablasIO.nmTabla = "TB_Comprobantes"
    ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", ObtenerCampo("nrComprobante").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", ObtenerCampo("nrTalonario").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", ObtenerCampo("tpComprobante").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", ObtenerCampo("tpLetra").Text
    
    ' Modificado en la version 2.5
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
    ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
        
    If Not ObjTablasIO.Actualizar() Then
        objbasededatos.RollBackTrans
        MsgBox "Error no se pudo eliminar el comprobante", vbCritical + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    ' Codigo agregado en la versión 2.5
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion"
        ' Actualizado saldo, despues de eliminar, si el comprobante no esta anulado
        If ObtenerCampo("flAnulado") = 0 Then
            Dim lvlPesos As Single
            Dim lvlDolares As Single
            Dim lvlEuros As Single
            Dim lvlReales As Single
            lvlPesos = ObtenerCampo("vlPagoPesos")
            lvlDolares = ObtenerCampo("vlPagoDolares")
            lvlReales = ObtenerCampo("vlPagoReales")
            lvlEuros = ObtenerCampo("vlPagoEuros")
            objCajas.nrCaja = ObtenerCampo("nrCaja")
            lvlPesos = lvlPesos * (-1)
            lvlDolares = lvlDolares * (-1)
            lvlEuros = lvlEuros * (-1)
            lvlReales = lvlReales * (-1)
            objCajas.vlPesos = lvlPesos
            objCajas.vlDolares = lvlDolares
            objCajas.vlEuros = lvlEuros
            objCajas.vlReales = lvlReales
            ' actualizamos el saldo se la caja
            If Not objCajas.ActualizarCaja(True) Then
                objbasededatos.RollBackTrans
                MsgBox "Error: " + objCajas.Error, vbCritical + vbDefaultButton1, "Atención"
                Exit Function
            End If
        End If
    
    End Select
    
    objbasededatos.CommitTrans
    EliminarRegistro = True
    
    MsgBox "Se ha eliminado con exito el registro.", vbInformation + vbYesNo, "Atención"
    
    
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
            
            
            
    cdCodBar = CompletarCerosaIzquierda(ObtenerCampo("nrTalonario").Text, 4)
    cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrComprobante").Text, 8)
    cdCodBar = cdCodBar + CompletarCerosaIzquierda(ObtenerCampo("nrLicencia").Text, 3)
    
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
           Me.fraVistaDetalleComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
           Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion"
               habilitarDeshabilitarControlesModif True
               If ObtenerCampo("flAnulado") = 1 Then
                    Me.tlb_ABM.Buttons("Anular").Visible = False
                    Me.tlb_ABM.Buttons("Desanular").Visible = True
                Else
                    Me.tlb_ABM.Buttons("Anular").Visible = True
                    Me.tlb_ABM.Buttons("Desanular").Visible = False
                End If
               If ObtenerCampo("flManual").Text = "Manualmente" Then
                    If ObtenerCampo("flEliminar") = 1 Then
                        Me.tlb_ABM.Buttons("Deseliminar").Visible = True
                        Me.tlb_ABM.Buttons("Eliminar").Visible = False
                        Me.tlb_ABM.Buttons("Anular").Visible = False
                        Me.tlb_ABM.Buttons("Desanular").Visible = False
                        Me.tlb_ABM.Buttons("Aceptar").Visible = False
                        Me.tlb_ABM.Buttons("Cancelar").Visible = False
                        habilitarDeshabilitarControlesModif False
                    Else
                        Me.tlb_ABM.Buttons("Deseliminar").Visible = False
                        Me.tlb_ABM.Buttons("Eliminar").Visible = True
                    End If
               Else
                    Me.tlb_ABM.Buttons("Eliminar").Visible = False
                    Me.tlb_ABM.Buttons("Deseliminar").Visible = False
               End If
           End Select
           Me.txtBusqueda.Tag = ""
    Case "Anular"
           Me.fraBusqComprobantes.Visible = False
           Me.fraVistaDetalleComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           habilitarDeshabilitarControlesModif False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
           Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion"
               If ObtenerCampo("flAnulado") = 1 Then
                    Me.tlb_ABM.Buttons("Anular").Visible = False
                    Me.tlb_ABM.Buttons("Desanular").Visible = True
                Else
                    Me.tlb_ABM.Buttons("Anular").Visible = True
                    Me.tlb_ABM.Buttons("Desanular").Visible = False
                    
                    Me.tlb_ABM.Buttons("Desanular").Visible = False
                End If
               If ObtenerCampo("flManual").Text = "Manualmente" Then
                    If ObtenerCampo("flEliminar") = 1 Then
                        Me.tlb_ABM.Buttons("Deseliminar").Visible = True
                        Me.tlb_ABM.Buttons("Eliminar").Visible = False
                        Me.tlb_ABM.Buttons("Anular").Visible = False
                        Me.tlb_ABM.Buttons("Desanular").Visible = False
                        Me.tlb_ABM.Buttons("Aceptar").Visible = False
                        Me.tlb_ABM.Buttons("Cancelar").Visible = False
                    Else
                        Me.tlb_ABM.Buttons("Deseliminar").Visible = False
                        Me.tlb_ABM.Buttons("Eliminar").Visible = True
                    End If
               Else
                    Me.tlb_ABM.Buttons("Eliminar").Visible = False
                    Me.tlb_ABM.Buttons("Deseliminar").Visible = False
               End If
           End Select
           Me.lstBusqueda.Visible = True
    Case "Agregar"
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraVistaDetalleComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraVistaDetalleComprobantes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Anular").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.fraVistaDetalleComprobantes.Visible = False
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           If EstadoABM = facturar Then
                Me.fraBusqComprobantes.Visible = False
                Me.lstBusqueda.Visible = False
                Me.fraVistaDetalleComprobantes.Visible = True
                Me.tlb_ABM.Buttons("Buscar").Visible = False
                Me.tlb_ABM.Buttons("Seleccionar").Visible = False
                Me.tlb_ABM.Buttons("Exportar").Visible = False
                Me.tlb_ABM.Buttons("Eliminar").Visible = False
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = True
                Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Else
                txtBusqueda_KeyPress vbKeyReturn
                Me.fraBusqComprobantes.Visible = True
                Me.lstBusqueda.Visible = True
                Me.fraVistaDetalleComprobantes.Visible = False
                Me.tlb_ABM.Buttons("Buscar").Visible = True
                Me.tlb_ABM.Buttons("Seleccionar").Visible = True
                Me.tlb_ABM.Buttons("Exportar").Visible = True
                Me.tlb_ABM.Buttons("Raya").Visible = True
                Me.tlb_ABM.Buttons("Eliminar").Visible = False
                Me.tlb_ABM.Buttons("Salir").Visible = True
                Me.tlb_ABM.Buttons("Aceptar").Visible = False
                Me.tlb_ABM.Buttons("Cancelar").Visible = False
                Me.txtBusqueda.SetFocus
          End If
    Case "Cancelar"
        If EstadoABM = facturar Then
           Me.fraBusqComprobantes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraVistaDetalleComprobantes.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
        Else
           Me.fraBusqComprobantes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraVistaDetalleComprobantes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
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
    
    Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
    Case "administracion.consulta"
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Anular").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.txtBusqueda.Tag = ""
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
        If Me.txtBusqueda.Text = "" Then Exit Sub
        
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Comprobantes"
         
             
        ' codigo agregado en la versión 2.5
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
            ' se obtiene el comprobnate por la clave del mismo
                ObjTablasIO.setearCampoOperadorValor "nrTalonario", "=", _
                objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrTalonario"), " AND "
                ObjTablasIO.setearCampoOperadorValor "nrComprobante", "=", _
                objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.nrComprobante"), " AND "
                ObjTablasIO.setearCampoOperadorValor "tpComprobante", "=", _
                objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpComprobante"), " AND "
                ObjTablasIO.setearCampoOperadorValor "tpLetra", "=", _
                objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.tpLetra")
        Case Else
            objDiccionariodeDatos.ObtenerNombredeCampoFisico _
            "TB_Comprobantes", Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
            ' Filtra por comprobantes Manuales
            ObjTablasIO.setearCampoOperadorValor "flManual", "=", "M", " AND "
        End Select
        
        Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
        Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
            ' no filtro por fechas
        Case Else
            If objConfig.tpModo_Operacion = FACTURACION_REMOTA Then
                ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCaja"), " AND "
            End If
            ObjTablasIO.setearCampoOperadorValor "dtComprobante", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
            ObjTablasIO.setearCampoOperadorValor "dtComprobante", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59")
        End Select
         
        For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpComprobante", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpLetra", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flManual", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Comprobantes"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            ActualizarColumnadeTipoFacturacion
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            Select Case objParametros.ObtenerValor("Frm_ElimModifAnularComprobantes.modo")
            Case "administracion.Anulacion", "administracion.Eliminacion", "administracion.modificacion", "administracion.consulta"
            Case Else
                MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
            End Select
         End If
    Else
          objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Comprobantes", Me.cmbCampos.Text
          Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
          KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


Private Sub ActualizarColumnadeTipoFacturacion()
Dim i As Long

    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).ListSubItems.Item(4) = "M" Then
            Me.lstBusqueda.ListItems(i).ListSubItems.Item(4) = "Manualmente"
        Else
           Me.lstBusqueda.ListItems(i).ListSubItems.Item(4) = "Por Sistema"
        End If
    Next i

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

    If ObtenerCampo(nmCampo).Locked Then Exit Sub

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub


Private Sub txtFields_GotFocus(Index As Integer)

   If Me.txtFields(Index).Tag <> "" Then

        ' Validar entrada del licenciatario
        Select Case Me.txtFields(Index).Tag
        Case "nrTalonario"
            AvisarError "nrTalonario", False
        Case "nrComprobante"
            AvisarError "nrComprobante", False
        End Select
        
  End If
        
End Sub

Private Sub txtFields_LostFocus(Index As Integer)


    If Me.txtFields(Index).Tag <> "" Then

        ' Validar entrada del licenciatario
        Select Case Me.txtFields(Index).Tag
        Case "nrTalonario"
            If Not IsNumeric(ObtenerCampo("nrTalonario").Text) Then
                AvisarError "nrTalonario", True
                Exit Sub
            End If
            If CInt(ObtenerCampo("nrTalonario").Text) > nrTalonarioMaximo Or _
                CInt(ObtenerCampo("nrTalonario").Text) < 1 Then
                AvisarError "nrTalonario", True
                Exit Sub
            End If
            Me.txtFields(Index).Text = CompletarCerosaIzquierda(Me.txtFields(Index).Text, 4)
        Case "nrComprobante"
            If Not IsNumeric(ObtenerCampo("nrComprobante").Text) Then
                AvisarError "nrComprobante", True
                Exit Sub
            End If
            Me.txtFields(Index).Text = CompletarCerosaIzquierda(Me.txtFields(Index).Text, 8)
        End Select
    End If
    
End Sub


Private Function ImprimirFactura(ByVal pnrTalonario As String, _
ByVal pnrComprobante As String, ByVal ptpComprobante As String, _
ByVal pLetra As String, ByVal pFormato As String) As Boolean
Dim strCodbarAFIP       As String
Dim strCodbarAFIPI2to5  As String
Dim strValorPromo       As String

        
    strValorPromo = objConfig.vlValorPromo
    
    objbasededatos.Exec_SP_PrepararReimpresiondeComprobante _
    pnrTalonario, pnrComprobante, ptpComprobante, pLetra, objUsuario.dsUsuario
    
    strCodbarAFIP = ObtenerCampo("dsOpcional3").Text
    strCodbarAFIPI2to5 = objAFIP.StrToI2of5(strCodbarAFIP)
    strCodbarAFIP = strCodbarAFIP + objAFIP.DigitoVerificador(strCodbarAFIP)
    
    Frm_Principal.LimpiarReporte
    
    Select Case ptpComprobante
    Case "X"
        If pFormato = "Chico" Then
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponChico_Imprime.rpt"
        Else
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CuponGrande.rpt"
        End If
    Case Else
        If pFormato = "Chico" Then
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_facturaChico_Imprime.rpt"
        Else
            Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_FacturaGrande.rpt"
        End If
    End Select
    
     
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.Destination = crptToWindow
    
    Select Case ptpComprobante
    Case "X"
        Frm_Principal.CrystalReport1.WindowTitle = "Cupon a Imprimir - ORIGINAL"
    Case Else
        Frm_Principal.CrystalReport1.WindowTitle = "Factura a Imprimir - ORIGINAL"
    End Select
    
    Frm_Principal.CrystalReport1.Formulas(0) = "Copia = 'ORIGINAL'"
    Frm_Principal.CrystalReport1.Formulas(1) = "NroComprobante = '" + pnrComprobante + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "cdCodBarAFIP = '" + strCodbarAFIP + "'"
    Frm_Principal.CrystalReport1.Formulas(3) = "cdCodBarAFIP_I2to5 = '" + strCodbarAFIPI2to5 + "'"
    Frm_Principal.CrystalReport1.Formulas(4) = "NroTalonario = '" + pnrTalonario + "'"
    Frm_Principal.CrystalReport1.Formulas(5) = "ValorPromo = '" + strValorPromo + "'"
    
    ' Frm_Principal.CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    
    Select Case ptpComprobante
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
    
    ' Aparece la venta duplicado
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    
    objSPs.nmStoredProcedure = "SP_eliminarTablasImpresion_v4_7"
    objSPs.setearCampoValor "@dsUsuario", objUsuario.dsUsuario
    If Not objSPs.ExecSP Then
        MsgBox " Error al intentar eliminar tablas de impresion Functión: SP_eliminarTablasImpresion_v4_7", vbCritical, "Atención"
        Exit Function
    End If


End Function


' /****************************************************************
' /****************************************************************
' /****************************************************************
' /****************************************************************
' /*  Pendiente para ver si se usa o no                           */

Private Sub cargarCondVentas(pcdCliente As String)

    ObtenerCampo("cdCondVenta").Clear

    Select Case pcdCliente
    Case "1"
        ObtenerCampo("cdCondVenta").AddItem "Contado"
        ObtenerCampo("cdCondVenta").AddItem "Cuenta Corriente"
        ObtenerCampo("cdCondVenta").AddItem "Cobro en Destino"
        ObtenerCampo("cdCondVenta").AddItem "Retorno"
        ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
        ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
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
                ObtenerCampo("tpComision").Clear
                ObtenerCampo("tpComision").AddItem "A Clientes"
                ObtenerCampo("tpComision").Text = "A Clientes"
           Case Else
                ObtenerCampo("cdCondVenta").Clear
                ObtenerCampo("cdCondVenta").AddItem "Contado"
                                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
                ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
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
                        ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Débito"
            ObtenerCampo("cdCondVenta").AddItem "Tarjeta de Crédito"
            ObtenerCampo("cdCondVenta").AddItem "Cobro en Destino"
            ObtenerCampo("cdCondVenta").AddItem "Todo Pago"
            ObtenerCampo("cdCondVenta") = "Contado"
        End Select
        ObtenerCampo("tpComision").Clear
        ObtenerCampo("tpComision").AddItem "A Clientes"
        ObtenerCampo("tpComision").Text = "A Clientes"
   End Select


   Me.Refresh
   DoEvents
        
    
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
Dim i         As Integer
Dim strDato   As String

    For i = 1 To Me.lstItemsFactura.ListItems.Count
        strDato = strDato + IIf(i <> 1, " - ", "") + _
        Me.lstItemsFactura.ListItems.Item(i).ListSubItems(const_dsProducto).Text
        Exit For
    Next
    obtenerPrimerDestino = Mid(strDato, 1, 100)

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


Private Function obtenerlistadecodigosdestinos() As String
Dim i            As Integer
Dim dsCodigosDestinos As String

        dsCodigosDestinos = ""
        If Me.lstItemsFactura.ListItems.Count > 0 Then
            For i = 1 To Me.lstItemsFactura.ListItems.Count
                    If Me.lstItemsFactura.ListItems.Item(i) <> "(Nuevo)" Then
                        dsCodigosDestinos = dsCodigosDestinos + Me.lstItemsFactura.ListItems.Item(i).ListSubItems(1)
                    End If
            Next
        End If
        
        obtenerlistadecodigosdestinos = dsCodigosDestinos
End Function




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
