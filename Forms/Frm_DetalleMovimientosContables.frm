VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_DetalleMovimientosContables 
   Caption         =   "Detalle Movimientos Contables"
   ClientHeight    =   7755
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   10410
   ClipControls    =   0   'False
   Icon            =   "Frm_DetalleMovimientosContables.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   7755
   ScaleWidth      =   10410
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
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
      IMEMode         =   3  'DISABLE
      Index           =   7
      Left            =   3225
      Locked          =   -1  'True
      TabIndex        =   11
      Tag             =   "tpOperacion"
      Top             =   990
      Width           =   2130
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
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
      IMEMode         =   3  'DISABLE
      Index           =   6
      Left            =   135
      Locked          =   -1  'True
      TabIndex        =   10
      Tag             =   "dsConcepto"
      Top             =   990
      Width           =   3120
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
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
      IMEMode         =   3  'DISABLE
      Index           =   5
      Left            =   7890
      Locked          =   -1  'True
      TabIndex        =   9
      Tag             =   "dsUsuarioCaja"
      Top             =   990
      Width           =   2385
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
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
      IMEMode         =   3  'DISABLE
      Index           =   3
      Left            =   5325
      Locked          =   -1  'True
      TabIndex        =   8
      Tag             =   "nrCajaVista"
      Top             =   990
      Width           =   2595
   End
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2310
      TabIndex        =   3
      Top             =   3495
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   4
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
         TabIndex        =   7
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1155
         TabIndex        =   6
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   5
         Top             =   390
         Width           =   510
      End
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10410
      _ExtentX        =   18362
      _ExtentY        =   1164
      ButtonWidth     =   2117
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgMovimientosContables"
      HotImageList    =   "imgMovimientosContablesResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Movimiento Contable"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Movimiento Contable deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Movimiento Contable"
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
      MouseIcon       =   "Frm_DetalleMovimientosContables.frx":030A
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
               Picture         =   "Frm_DetalleMovimientosContables.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgMovimientosContables 
         Left            =   7890
         Top             =   -30
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
               Picture         =   "Frm_DetalleMovimientosContables.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleMovimientosContables.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   7155
      Top             =   2010
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
            Picture         =   "Frm_DetalleMovimientosContables.frx":334A
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleMovimientosContables.frx":345C
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleMovimientosContables.frx":356E
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleMovimientosContables.frx":3680
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleMovimientosContables.frx":3792
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleMovimientosContables.frx":38A4
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   6228
      Left            =   156
      TabIndex        =   1
      Top             =   1356
      Width           =   10140
      _ExtentX        =   17886
      _ExtentY        =   10980
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
      NumItems        =   11
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "dsConcepto"
         Text            =   "Concepto"
         Object.Width           =   3881
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
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlDolares"
         Text            =   "Dolares"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "vlEuros"
         Text            =   "Euros"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "nrFactura"
         Text            =   "Factura"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "nrRecibo"
         Text            =   "Recibo"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "dtMovimiento"
         Text            =   "Fecha"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Object.Tag             =   "nrCajaPuesto"
         Text            =   "Caja Puesto"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Object.Tag             =   "dsUsuarioCajaPuesto"
         Text            =   "Usuario Puesto"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Object.Tag             =   "dsUsuario"
         Text            =   "Usuario Adm"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComctlLib.ListView lstBusquedaDetalle 
      Height          =   6105
      Left            =   150
      TabIndex        =   2
      Top             =   1350
      Width           =   10140
      _ExtentX        =   17886
      _ExtentY        =   10769
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
      NumItems        =   13
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "nrLicencia"
         Text            =   "Licencia"
         Object.Width           =   1058
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "nrTalonarioCliente"
         Text            =   "Talonario"
         Object.Width           =   1058
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "nrComprabanteCliente"
         Text            =   "Nro. de Comprobante"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "vlPesos"
         Text            =   "Pesos"
         Object.Width           =   1676
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "vlDolares"
         Text            =   "Dolares"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "vlEuros"
         Text            =   "Euros"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "vlComision"
         Text            =   "Comisión"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "vlIVA"
         Text            =   "IVA"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Object.Tag             =   "tpCupon"
         Text            =   "Cond. Venta"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Object.Tag             =   "vlMontoCupon"
         Text            =   "Total Fact."
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Object.Tag             =   "dtCompensado"
         Text            =   "Fecha Compensado"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   11
         Object.Tag             =   "dsUsuario"
         Text            =   "Usuario"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   12
         Object.Tag             =   "nrRecibo"
         Text            =   "Nro. Recibo"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label9 
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
      Height          =   270
      Left            =   3285
      TabIndex        =   15
      Top             =   780
      Width           =   1620
   End
   Begin VB.Label Label7 
      Caption         =   "Descripción del Concepto"
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
      Left            =   135
      TabIndex        =   14
      Top             =   780
      Width           =   2280
   End
   Begin VB.Label Label2 
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
      Height          =   270
      Left            =   7920
      TabIndex        =   13
      Top             =   765
      Width           =   1260
   End
   Begin VB.Label Label1 
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
      Height          =   270
      Left            =   5340
      TabIndex        =   12
      Top             =   780
      Width           =   1215
   End
End
Attribute VB_Name = "Frm_DetalleMovimientosContables"
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
                HabilitarCampos Control.Tag, True
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




Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
         tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
    Case vbKeyF2
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case vbKeyF5
        tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
    End Select


End Sub

Private Sub Form_Load()

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
End Sub

Private Sub Form_Resize()

    objGUI.SizeControls Me, , Me.lstBusqueda
    
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


Private Sub HabilitarCampos(nmCampo As String, habilitar As Boolean)
    
    If Not habilitar Then
          ObtenerCampo(nmCampo).Locked = True
          ObtenerCampo(nmCampo).BackColor = Gris '&HE0E0E0
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
          ObtenerCampo(nmCampo).Locked = False
    End If

End Sub


Private Sub lstBusqueda_DblClick()

    Select Case UCase(ObtenerCampo("dsConcepto").Text)
    Case "COBRO A CUENTA CORRIENTE"
        imprimirCobroCtaCte Me.lstBusqueda.SelectedItem.SubItems(6)
    Case "PAGO A LOS LICENCIATARIOS", "INGRESO COMPENSATORIO POR COMISIONES"
        imprimirPagoLicenciatario Me.lstBusqueda.SelectedItem.SubItems(6)
    End Select
    
End Sub

Private Sub lstBusquedaDetalle_DblClick()

    
    If Me.lstBusquedaDetalle.ListItems.Count = 0 Then Exit Sub
    imprimirPagoLicenciatario Me.lstBusquedaDetalle.SelectedItem.SubItems(12)

End Sub


Private Sub imprimirCobroCtaCte(IdRecibo As String)

    Frm_Principal.LimpiarReporte
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_detallefacturactacte_v4_7.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.Destination = crptToWindow
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Pago a Licenciatario"
    Frm_Principal.CrystalReport1.Formulas(1) = "F1_IdRecibo ='" + IdRecibo + "'"
    
    ' Frm_Principal.CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    

End Sub

Private Sub imprimirPagoLicenciatario(IdRecibo As String)

    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_pagolicenciatario_v4_9.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.Destination = crptToWindow
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Pago a Licenciatario"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
    
    ' Frm_Principal.CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    ' On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    

End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte
 
    Select Case Button.Key
    Case "Buscar"
           EstadoABM = Consulta
           If objParametros.ObtenerValor("nmVista") = "VW_DetalleMovimientosContables" Then
                Me.lstBusquedaDetalle.Visible = False
                Me.lstBusqueda.Visible = True
                Me.lstBusqueda.ListItems.Clear
                ObjTablasIO.nmTabla = "VW_DetalleMovimientosContables_v3_1"
                ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlPesos", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlDolares", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlEuros", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrRecibo", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dtMovimiento", "->", "ASC"
                ObjTablasIO.setearCampoOperadorValor "dsProveedor", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrFactura", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
                '-- inicio agregado en la version 3.1
                ObjTablasIO.setearCampoOperadorValor "nrCajaPuesto", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsUsuarioCajaPuesto", "->", ""
                '-- fin agregado version 3.1
                ObjTablasIO.setearCampoOperadorValor "tpOperacion", "=", objParametros.ObtenerValor("tpOperacion"), " AND "
                ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCajaVista"), " AND "
                ObjTablasIO.setearCampoOperadorValor "dsConcepto", "=", objParametros.ObtenerValor("dsConcepto")
                ObjTablasIO.Seleccionar
                objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "VW_DetalleMovimientosContables_v3_1"
                CalcularTotalesenGrillaLstBusqueda
           Else
                Me.lstBusqueda.Visible = False
                Me.lstBusquedaDetalle.Visible = True
                Me.lstBusquedaDetalle.ListItems.Clear
                ObjTablasIO.nmTabla = "VW_DetalleMovimientosContablesCupones"
                ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrCaja", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlPesos", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlDolares", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlEuros", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrRecibo", "->", ""
                ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
                ObjTablasIO.setearCampoOperadorValor "tpCupon", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
                ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlIVA", "->", ""
                ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "->", ""
                ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
                ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""

                ObjTablasIO.setearCampoOperadorValor "dtCompensado", "->", "", , "ASC"
                
                
                ObjTablasIO.setearCampoOperadorValor "tpOperacion", "=", objParametros.ObtenerValor("tpOperacion"), " AND "
                ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", objParametros.ObtenerValor("nrCajaVista"), " AND "
                ObjTablasIO.setearCampoOperadorValor "dsConcepto", "=", objParametros.ObtenerValor("dsConcepto")
                ObjTablasIO.Seleccionar
                objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusquedaDetalle, 0, "VW_DetalleMovimientosContablesCupones"
                CalcularTotalesenGrillaLstBusquedaDetalle
           End If
           
           ObtenerCampo("tpOperacion").Text = objParametros.ObtenerValor("tpOperacion")
           ObtenerCampo("nrCajaVista").Text = objParametros.ObtenerValor("nrCajaVista")
           ObtenerCampo("dsConcepto").Text = objParametros.ObtenerValor("dsConcepto")
           ObtenerCampo("dsUsuarioCaja").Text = objParametros.ObtenerValor("dsUsuarioCaja")
           
           HabilitarCampos "tpOperacion", False
           HabilitarCampos "nrCajaVista", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "dsUsuarioCaja", False
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Aceptar"
         EstadoABM = Consulta
    Case "Salir"
           Unload Me
    End Select
    
End Sub


Private Sub CalcularTotalesenGrillaLstBusqueda()
Dim i         As Integer
Dim vlPesos   As Single
Dim vlDolares As Single
Dim vlEuros   As Single
Dim objItem   As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        vlPesos = vlPesos + AdaptarValorNumerico(Me.lstBusqueda.ListItems(i).SubItems(2))
        vlDolares = vlDolares + AdaptarValorNumerico(Me.lstBusqueda.ListItems(i).SubItems(3))
        vlEuros = vlEuros + AdaptarValorNumerico(Me.lstBusqueda.ListItems(i).SubItems(4))
    Next i
    
    Set objItem = Me.lstBusqueda.ListItems.Add(, , "Total:")
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.Bold = True
    objItem.ForeColor = vbBlue
    
    objItem.ListSubItems.Item(2).Bold = True
    objItem.ListSubItems.Item(2).ForeColor = vbBlue
    objItem.ListSubItems.Item(2).Text = FormatNumber(vlPesos, 2)
    
    objItem.ListSubItems.Item(3).Bold = True
    objItem.ListSubItems.Item(3).ForeColor = vbBlue
    objItem.ListSubItems.Item(3).Text = FormatNumber(vlDolares, 2)
    
    objItem.ListSubItems.Item(4).Bold = True
    objItem.ListSubItems.Item(4).ForeColor = vbBlue
    objItem.ListSubItems.Item(4).Text = FormatNumber(vlEuros, 2)
    
End Sub



Private Sub CalcularTotalesenGrillaLstBusquedaDetalle()
Dim i            As Integer
Dim vlPesos      As Single
Dim vlDolares    As Single
Dim vlEuros      As Single
Dim vlComision   As Single
Dim vlTotalFact  As Single
Dim vlIVA        As Single
Dim objItem      As ListItem

    For i = 1 To Me.lstBusquedaDetalle.ListItems.Count
        vlPesos = vlPesos + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(3))
        vlDolares = vlDolares + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(4))
        vlEuros = vlEuros + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(5))
        vlComision = vlComision + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(6))
        vlIVA = vlIVA + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(7))
        vlTotalFact = vlTotalFact + AdaptarValorNumerico(Me.lstBusquedaDetalle.ListItems(i).SubItems(9))
    Next i
    
    
    
    Set objItem = Me.lstBusquedaDetalle.ListItems.Add(, , "Total:")
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    objItem.ListSubItems.Add , , " "
    
    objItem.Bold = True
    objItem.ForeColor = vbBlue
    objItem.ListSubItems.Item(3).Bold = True
    objItem.ListSubItems.Item(3).ForeColor = vbBlue
    objItem.ListSubItems.Item(3).Text = FormatNumber(vlPesos, 2)
    
    objItem.ListSubItems.Item(4).Bold = True
    objItem.ListSubItems.Item(4).ForeColor = vbBlue
    objItem.ListSubItems.Item(4).Text = FormatNumber(vlDolares, 2)
    
    objItem.ListSubItems.Item(5).Bold = True
    objItem.ListSubItems.Item(5).ForeColor = vbBlue
    objItem.ListSubItems.Item(5).Text = FormatNumber(vlEuros, 2)
    
    objItem.ListSubItems.Item(6).Bold = True
    objItem.ListSubItems.Item(6).ForeColor = vbBlue
    objItem.ListSubItems.Item(6).Text = FormatNumber(vlComision, 2)
    
    
    objItem.ListSubItems.Item(7).Bold = True
    objItem.ListSubItems.Item(7).ForeColor = vbBlue
    objItem.ListSubItems.Item(7).Text = FormatNumber(vlIVA, 2)
    
    
    objItem.ListSubItems.Item(9).Bold = True
    objItem.ListSubItems.Item(9).ForeColor = vbBlue
    objItem.ListSubItems.Item(9).Text = FormatNumber(vlTotalFact, 2)
    
    
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



Private Sub ExportaraExcel()
Dim strError  As String



    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Me.lstBusqueda.ListItems.Count > 0 Then
        If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "VW_DetalleMovimientosContables") Then
            MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
            Exit Sub
        End If
    Else
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusquedaDetalle, "VW_DetalleMovimientosContablesCupones") Then
            MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
            Exit Sub
        End If
    End If
    
       
End Sub


