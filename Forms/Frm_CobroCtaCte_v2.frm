VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form frm_CobroCtaCte_v2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Liquidar / Facturar / Adelantos  a Cuentas Corrientes"
   ClientHeight    =   7425
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   12690
   ClipControls    =   0   'False
   Icon            =   "Frm_CobroCtaCte_v2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7425
   ScaleWidth      =   12690
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cbTipoLiquidacion 
      BackColor       =   &H00C0FFFF&
      Height          =   315
      ItemData        =   "Frm_CobroCtaCte_v2.frx":030A
      Left            =   2835
      List            =   "Frm_CobroCtaCte_v2.frx":0317
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   795
      Width           =   4785
   End
   Begin VB.Frame FraFacturaAdelantes 
      Height          =   3360
      Left            =   1065
      TabIndex        =   19
      Top             =   2175
      Width           =   10140
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
         Left            =   4680
         ScrollBars      =   2  'Vertical
         TabIndex        =   30
         TabStop         =   0   'False
         Tag             =   "vlPagoPesos"
         Text            =   "0"
         Top             =   2775
         Width           =   1635
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         ForeColor       =   &H00000000&
         Height          =   390
         Index           =   3
         Left            =   1455
         Locked          =   -1  'True
         TabIndex        =   27
         Tag             =   "dsRazonSocial"
         Top             =   450
         Width           =   7125
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         ForeColor       =   &H00000000&
         Height          =   390
         Index           =   2
         Left            =   255
         TabIndex        =   26
         Tag             =   "cdCliente"
         Top             =   450
         Width           =   1170
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   1125
         Index           =   0
         Left            =   240
         TabIndex        =   25
         TabStop         =   0   'False
         Tag             =   "dsOpcional2"
         Top             =   1305
         Width           =   9555
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   8
         Left            =   255
         TabIndex        =   23
         TabStop         =   0   'False
         Tag             =   "dsLeyenda"
         Top             =   2775
         Width           =   4275
      End
      Begin VB.Label Label14 
         Caption         =   "Total"
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
         Left            =   4710
         TabIndex        =   31
         Top             =   2520
         Width           =   4230
      End
      Begin VB.Label Label13 
         Caption         =   "Raz�n Social"
         Height          =   255
         Left            =   1470
         TabIndex        =   29
         Top             =   240
         Width           =   1110
      End
      Begin VB.Label Label12 
         Caption         =   "Nro. de Cliente"
         Height          =   255
         Left            =   270
         TabIndex        =   28
         Top             =   240
         Width           =   1155
      End
      Begin VB.Label Label11 
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
         Left            =   300
         TabIndex        =   24
         Top             =   2520
         Width           =   4230
      End
      Begin VB.Label Label10 
         Caption         =   "Detalle Factura Adelantada"
         Height          =   255
         Left            =   270
         TabIndex        =   22
         Top             =   1050
         Width           =   3465
      End
   End
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   3840
      TabIndex        =   8
      Top             =   2940
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   9
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label7 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   12
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1155
         TabIndex        =   11
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label6 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   10
         Top             =   390
         Width           =   510
      End
   End
   Begin VB.Frame frm_liquidaViajes 
      Height          =   5220
      Left            =   105
      TabIndex        =   16
      Top             =   1230
      Width           =   12360
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   4275
         TabIndex        =   33
         Top             =   510
         Width           =   5880
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         ItemData        =   "Frm_CobroCtaCte_v2.frx":0387
         Left            =   195
         List            =   "Frm_CobroCtaCte_v2.frx":0389
         Locked          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   32
         Top             =   510
         Width           =   2400
      End
      Begin VB.CheckBox CheckTodos 
         Appearance      =   0  'Flat
         Caption         =   "Seleccionar Todos"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   210
         TabIndex        =   17
         Top             =   990
         Width           =   1755
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   3825
         Left            =   195
         TabIndex        =   18
         Top             =   1290
         Width           =   11925
         _ExtentX        =   21034
         _ExtentY        =   6747
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         MultiSelect     =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         Checkboxes      =   -1  'True
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
         NumItems        =   10
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "cdCliente"
            Text            =   "Nro. Cliente"
            Object.Width           =   1499
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "nrComprabanteCliente"
            Text            =   "Comprobante"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "vlMontoCupon"
            Text            =   "Total Fact."
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "tpCupon"
            Text            =   "Cond. Venta"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "nrTalonarioCliente"
            Text            =   "Talonario"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dtCupon"
            Text            =   "Fecha"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "flCobradoalCliente"
            Text            =   "Cobrado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "cdCodBar"
            Text            =   "Cod. de Barras"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "nrCupon"
            Text            =   "Nro. Cupon"
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2610
         TabIndex        =   34
         Top             =   510
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
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4320
         TabIndex        =   36
         Top             =   255
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   210
         TabIndex        =   35
         Top             =   285
         Width           =   795
      End
   End
   Begin VB.ComboBox cbTipoFacturacion 
      BackColor       =   &H00C0FFFF&
      Height          =   315
      ItemData        =   "Frm_CobroCtaCte_v2.frx":038B
      Left            =   135
      List            =   "Frm_CobroCtaCte_v2.frx":0395
      Style           =   2  'Dropdown List
      TabIndex        =   14
      Top             =   6810
      Width           =   2850
   End
   Begin VB.CommandButton cmdFacturar 
      Caption         =   "Aceptar"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   9735
      TabIndex        =   4
      Tag             =   "cmdCompensar"
      Top             =   6615
      Width           =   2175
   End
   Begin VB.TextBox txtSaldos 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      ForeColor       =   &H00000000&
      Height          =   390
      Index           =   2
      Left            =   8055
      Locked          =   -1  'True
      TabIndex        =   3
      Tag             =   "vlAcumPesos"
      Top             =   6795
      Width           =   900
   End
   Begin VB.TextBox txtSaldos 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      ForeColor       =   &H00000000&
      Height          =   390
      Index           =   0
      Left            =   3045
      Locked          =   -1  'True
      TabIndex        =   2
      Tag             =   "cdCliente"
      Top             =   6795
      Width           =   1170
   End
   Begin VB.TextBox txtSaldos 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      ForeColor       =   &H00000000&
      Height          =   390
      Index           =   1
      Left            =   4260
      Locked          =   -1  'True
      TabIndex        =   1
      Tag             =   "dsRazonSocial"
      Top             =   6795
      Width           =   3750
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12690
      _ExtentX        =   22384
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgCobroClientes"
      HotImageList    =   "imgCobroClientesResaltado"
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
            Object.Visible         =   0   'False
            Caption         =   "&Imprimir(F8)"
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
      MouseIcon       =   "Frm_CobroCtaCte_v2.frx":03AD
      Begin MSComctlLib.ImageList imgCobroClientesResaltado 
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
               Picture         =   "Frm_CobroCtaCte_v2.frx":050F
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":062B
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":077F
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":088F
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":0991
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":0AE5
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":0BF1
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":126D
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":13D5
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":1829
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":1C7D
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgCobroClientes 
         Left            =   1410
         Top             =   45
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
               Picture         =   "Frm_CobroCtaCte_v2.frx":22F7
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":240F
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":2563
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":267B
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":2787
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":28DB
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":29E3
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":305F
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":31BF
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":3613
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_CobroCtaCte_v2.frx":3A67
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   12015
      Top             =   735
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
            Picture         =   "Frm_CobroCtaCte_v2.frx":40E1
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_CobroCtaCte_v2.frx":41F3
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_CobroCtaCte_v2.frx":4305
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_CobroCtaCte_v2.frx":4417
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_CobroCtaCte_v2.frx":4529
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_CobroCtaCte_v2.frx":463B
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageCombo ImageCombo2 
      Height          =   330
      Left            =   0
      TabIndex        =   13
      Top             =   0
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
   Begin VB.Label Label9 
      Caption         =   "Operacion"
      Height          =   210
      Left            =   120
      TabIndex        =   21
      Top             =   765
      Width           =   2415
   End
   Begin VB.Label Label8 
      Caption         =   "Tipo Facturaci�n"
      Height          =   210
      Left            =   150
      TabIndex        =   15
      Top             =   6600
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "Acumulado"
      Height          =   255
      Left            =   8085
      TabIndex        =   7
      Top             =   6555
      Width           =   885
   End
   Begin VB.Label Label4 
      Caption         =   "Nro. de Cliente"
      Height          =   255
      Left            =   3060
      TabIndex        =   6
      Top             =   6570
      Width           =   1155
   End
   Begin VB.Label Label5 
      Caption         =   "Raz�n Social"
      Height          =   255
      Left            =   4260
      TabIndex        =   5
      Top             =   6585
      Width           =   1110
   End
End
Attribute VB_Name = "frm_CobroCtaCte_v2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl
' V4.6
Dim objServicePrinter As Object



Dim nrCaja_CtaCte As String







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






Private Sub Check1_Click()

End Sub



Private Sub CheckDetalle_Click()

End Sub

Private Sub cbTipoLiquidacion_Change()
    
    Select Case cbTipoLiquidacion.Text
    Case "Facturar Adelantos(FACTURA)"
      
        Me.frm_liquidaViajes.Visible = False
          Me.FraFacturaAdelantes.Visible = True
        Me.FraFacturaAdelantes.ZOrder 0
    Case "Facturar Viajes Realizados (FACTURA)"
        Me.FraFacturaAdelantes.Visible = False
        Me.frm_liquidaViajes.Visible = True
        Me.txtBusqueda.SetFocus
    Case "Consolidar Viajes Adelantados (RECIBO)"
        Me.FraFacturaAdelantes.Visible = False
        Me.frm_liquidaViajes.Visible = True
        Me.txtBusqueda.SetFocus
    End Select

End Sub


Private Sub Facturar_Adelantos()

End Sub


Private Sub Facturar_Viajes_Realizados()

End Sub


Private Sub Consolidar_Viajes_Adelantados()

End Sub

Private Sub cbTipoLiquidacion_Click()
    
    Select Case cbTipoLiquidacion.Text
    Case "Facturar Adelantos (FACTURA)"
        Me.FraFacturaAdelantes.Visible = True
        Me.frm_liquidaViajes.Visible = False
        ObtenerCampo("cdCliente").SetFocus
    Case "Facturar Viajes Realizados (FACTURA)"
        Me.FraFacturaAdelantes.Visible = False
        Me.frm_liquidaViajes.Visible = True
        Me.txtBusqueda.SetFocus
    Case "Consolidar Viajes Adelantados (RECIBO)"
        Me.FraFacturaAdelantes.Visible = False
        Me.frm_liquidaViajes.Visible = True
        Me.txtBusqueda.SetFocus
    End Select

End Sub

Private Sub CheckTodos_Click()
Dim i   As Integer

    If Me.CheckTodos.value Then
        For i = 1 To Me.lstBusqueda.ListItems.Count
            Me.lstBusqueda.ListItems(i).Checked = True
        Next
    Else
        For i = 1 To Me.lstBusqueda.ListItems.Count
            Me.lstBusqueda.ListItems(i).Checked = False
        Next
    End If
    
   DoEvents
   ActualizarSaldo
     
End Sub

Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub


Private Sub cmdFacturar_Click()
Dim resp          As Byte
Dim strDetalle    As String
Dim IdRecibo      As String
Dim check_OK      As Boolean
Dim i             As Integer
    
    If Me.lstBusqueda.ListItems.Count <= 0 Then Exit Sub
    resp = MsgBox("Esta seguro que desea realizar la operaci�n.", vbQuestion + vbYesNo, "Atenci�n")
    If resp = vbNo Then Exit Sub
    
    check_OK = False
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            check_OK = True
        End If
    Next
    
    
    If Not check_OK Then
        MsgBox "Debe Seleccionar los viajes a facturar.", vbCritical + vbDefaultButton1, "Atenci�n"
        Me.lstBusqueda.SetFocus
        Exit Sub
    End If
    
    If ObtenerCampo("vlAcumPesos").Text = "" Or ObtenerCampo("vlAcumPesos").Text = "0,00" Then
        MsgBox "Debe Seleccionar los viajes a facturar.", vbCritical + vbDefaultButton1, "Atenci�n"
        Me.lstBusqueda.SetFocus
        Exit Sub
    End If
    

    ObjTablasIO.nmTabla = "TB_Clientes"
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
    ObjTablasIO.setearCampoOperadorValor "tpIVA", "->", ""
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", Me.lstBusqueda.SelectedItem.Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    ObjTablasIO.Seleccionar
    If ObjTablasIO.rs_resultados.EOF Then
        MsgBox "El cliente ingresado no es valido", vbCritical + vbDefaultButton1, "Atenci�n"
        Exit Sub
    End If
    
    Dim dsRazonSocial As String
    Dim nrDoc As String
    Dim dsEmail As String
    Dim tpIVA As String
    
    dsRazonSocial = AdaptarNulos(ObjTablasIO.rs_resultados("dsRazonSocial").value, "")
    nrDoc = AdaptarNulos(ObjTablasIO.rs_resultados("nrDoc").value, "")
    dsEmail = AdaptarNulos(ObjTablasIO.rs_resultados("dsEmail").value, "")
    tpIVA = AdaptarNulos(ObjTablasIO.rs_resultados("tpIVA").value, "")
    
    
    
    ' Comentado en la version 4.8
    ' IdRecibo = objbasededatos.SP_ObtenerMaxIDRecibo
    
    IdRecibo = grabarRecibo(Me.lstBusqueda.SelectedItem.Text, ObtenerCampo("dsRazonSocial").Text)
     
    ' Comenzar una transaccion
    If IdRecibo = "" Then
           MsgBox "Se produjo un error al obtener el Nro de Recibo, reintente nuevamente", vbCritical + vbDefaultButton1, "Atenci�n"
           Exit Sub
    End If
        
    
    strDetalle = "Viajes seg�n recibo Nro. " + IdRecibo
    objParametros.GrabarValor "FacturarCtaCte.IdRecibo", IdRecibo
    objParametros.GrabarValor "FacturarCtaCte.vlTotal", ObtenerCampo("vlAcumPesos").Text
    objParametros.GrabarValor "FacturarCtaCte.cdCliente", Me.lstBusqueda.SelectedItem.Text
    objParametros.GrabarValor "FacturarCtaCte.dsRazonSocial", dsRazonSocial
    objParametros.GrabarValor "FacturarCtaCte.nrDoc", nrDoc
    objParametros.GrabarValor "FacturarCtaCte.dsEmail", dsEmail
    objParametros.GrabarValor "FacturarCtaCte.tpIVA", tpIVA
    objParametros.GrabarValor "FacturarCtaCte.dsDetalle", strDetalle
    objParametros.GrabarValor "FacturarCtaCte.tpComprobante", "FA"
    objParametros.GrabarValor "FacturarCtaCte.TipoFacturacion", Me.cbTipoFacturacion.Text
    
    
    Dim strSQL As String
    '***********************************************************'
    ' Modificacion EZE V4.6
    strSQL = "dbo.spu_obtener_puntosdeventa_facturacion_v4_9_5 @nrPuesto_param=" + objParametros.ObtenerValorBD("PUESTO_FACTURACION_CTA_CTE") + ", "
    strSQL = strSQL + "@tipo_iva = " + objParametros.ObtenerValor("FacturarCtaCte.tpIVA") + ",  "
    
    ' strSQL = strSQL + "@auto_impresor = " + IIf(objConfig.tpImpresion = "CONTINUO", "S", "N") + ", "
    ' Agrgado en la version 4.9.4
    strSQL = strSQL + "@auto_impresor = " + IIf(Me.cbTipoFacturacion.Text = "Autom�tica", "S", "N") + ", " ' Autom�tica  / Manual
    
    strSQL = strSQL + "@tpFormadePago = null,  "
    strSQL = strSQL + "@tpComprobante = '" + objParametros.ObtenerValor("FacturarCtaCte.tpComprobante") + "'"
    
    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
         eliminarRecibo (IdRecibo)  ' eliminamos el remito grabado inicialmente
        MsgBox "No se encuentra bien definido el n�mero de talonario" + _
               vbCrLf + " para el puesto o punto de venta que ingres� al sistema." + vbCrLf + "Error extendido: " + objbasededatos.Error, vbCritical + vbDefaultButton1, "Atenci�n"
        Exit Sub
    End If
    
    objParametros.GrabarValor "FacturarCtaCte.nrTalonario", objbasededatos.rs_resultados("nrTalonario")
    objParametros.GrabarValor "FacturarCtaCte.nrComprobante", objbasededatos.rs_resultados("nrComprobante")
    objParametros.GrabarValor "FacturarCtaCte.tpLetra", Trim(objbasededatos.rs_resultados("tpLetra"))
    objParametros.GrabarValor "FacturarCtaCte.nrCAI", Trim(objbasededatos.rs_resultados("nrCAI"))
    objParametros.GrabarValor "FacturarCtaCte.dtVencimiento", Trim(objbasededatos.rs_resultados("dtCAI"))
    objParametros.GrabarValor "FacturarCtaCte.flManual", IIf(Me.cbTipoFacturacion.Text = "Autom�tica", "N", "M")
    
    ' REVEER CTA. CTES
    Frm_FacturaCtaCte.Show 1
    
    If objParametros.ObtenerValor("FacturarCtaCte.Facturado") = "SI" Then
        objbasededatos.BeginTrans
        ' IdRecibo = grabarRecibo(Me.lstBusqueda.SelectedItem.Text, ObtenerCampo("dsRazonSocial").Text)
        If IdRecibo = "" Then
            objbasededatos.RollBackTrans
             eliminarRecibo (IdRecibo)  ' eliminamos el remito grabado inicialmente
            MsgBox "Se ha producido un error, por favor intente realizar nuevamente la operaci�n", vbCritical + vbDefaultButton1, "Atenci�n"
            Exit Sub
        End If
        ' Actualizar el flag flCobradoalCliente
        If Not ActualizarFlagCobradoAlCliente(IdRecibo) Then
            objbasededatos.RollBackTrans
             eliminarRecibo (IdRecibo)  ' eliminamos el remito grabado inicialmente
            MsgBox "Se ha producido un error, por favor intente realizar nuevamente la operaci�n", vbCritical + vbDefaultButton1, "Atenci�n"
            Exit Sub
        Else
            objbasededatos.CommitTrans
            imprimirCobroCliente IdRecibo, Me.lstBusqueda.SelectedItem.Text, ObtenerCampo("dsRazonSocial").Text
        End If
    Else
         eliminarRecibo (IdRecibo)  ' en caso de no facturar, eliminamos el remito grabado inicialmente
    End If
    
    txtBusqueda_KeyPress 13
    
End Sub


Private Function ActualizarFlagCobradoAlCliente(pIdRecibo As String) As Boolean
Dim i As Integer

    ActualizarFlagCobradoAlCliente = False
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            ObjTablasIO.nmTabla = "TB_Cupones"
            
            ' MsgBox "Corregir no regrabar nrCajaCliente crear otra campo para la caja que cobra la CC"
            ' modificado en la version 3.2
            ObjTablasIO.setearCampoOperadorValor "nrCupon", "=", Me.lstBusqueda.ListItems(i).SubItems(9)
            ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "dtCobradoalCliente", "<-", CStr(Now())
            ObjTablasIO.setearCampoOperadorValor "nrCajaCtaCte", "<-", objParametros.ObtenerValor("nrCaja")
            ObjTablasIO.setearCampoOperadorValor "dtCajaCtaCte", "<-", objbasededatos.getDateasString()
            ObjTablasIO.setearCampoOperadorValor "IdReciboCtaCte", "<-", pIdRecibo
            ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", objUsuario.dsUsuario
            If Not ObjTablasIO.Actualizar Then
                ActualizarFlagCobradoAlCliente = False
                Exit Function
            Else
                ActualizarFlagCobradoAlCliente = True
            End If
        End If
        ActualizarFlagCobradoAlCliente = True
    Next i
    
End Function




Private Sub imprimirCobroCliente(IdRecibo As String, _
        cdCliente As String, dsRazonSocial As String)

    Frm_Principal.LimpiarReporte

    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_detallefacturactacte_liq_v4_7.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.Destination = crptToPrinter  ' crptToPrinter , crptToWindow
    Frm_Principal.CrystalReport1.WindowTitle = "Impresi�n de LIQUIDACION DE VIAJES REALIZADOS EN CTA. CTE"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
    Frm_Principal.CrystalReport1.StoredProcParam(1) = 0
    
    ' Aparece la venta original
    On Error Resume Next
    
    '/******************************************************
    '/* Version 4.6  Solicitamos la impreso en la cual se desea imprimir
    ' MsgBox "SELECCIONE LA IMPRESORA"
    objServicePrinter.ConfigPrinter "impresi�n del recibo"
    '/*  Cierrre Version 4.6
    '/******************************************************
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description + vbCrLf + " Nombre del archivo : " + vbCrLf + Frm_Principal.CrystalReport1.ReportFileName, vbCritical, "Atenci�n"
    End If
    On Error GoTo 0

    Sleep (5)
    ' MsgBox "antes de RollbackPrinter "
    objServicePrinter.RollbackPrinter

End Sub




Private Sub Form_Activate()



        If Not objCajas.ObtenerCajadeADMAbierta() Then
            MsgBox "Para realizar esta tarea debe existir una caja de la ADM abierta, no se puede continuar", vbInformation, "Atenci�n"
            Unload Me
            Exit Sub
        End If
    
        objParametros.GrabarValor "FacturarCtaCte.nrCaja", objCajas.nrCaja
        
        On Error Resume Next
        Me.txtBusqueda.SetFocus
        On Error GoTo 0
    
    
    
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

    ' v4.6
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.ServicePrinter"
    Set objServicePrinter = CreateObject("SGLibrary.ServicePrinter")
    objLog.Grabar_Log "Inicializando Servicio SGLibrary.ServicePrinter OK "
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    EstadoABM = Consulta
    Me.cmbCampos.ListIndex = 3
    Me.cbTipoFacturacion.ListIndex = 0
    Me.FraFacturaAdelantes.Visible = False
    Me.frm_liquidaViajes.Visible = False
        

End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Cupones"
    Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
    objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cupones")
    Do Until objDiccionariodeDatos.FindeCampos("TB_Cupones")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cupones")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

    Me.ImageCombo1.ComboItems.Clear
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.Text
    Select Case UCase(objDiccionariodeDatos.tpTipo)
    Case "BIT", "COUNTER", "DOUBLE", "INTEGER":
        ' Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar"
        Me.ImageCombo1.ComboItems.Add 1, "Igual", "Igual", "Igual", "Igual"
        ' Me.ImageCombo1.ComboItems.Add 3, "Menor", "Menor", "Menor"
        'Me.ImageCombo1.ComboItems.Add 4, "Mayor", "Mayor", "Mayor"
        'Me.ImageCombo1.ComboItems.Add 5, "MayoroIgual", "Mayor o Igual", "MayoroIgual"
        ' Me.ImageCombo1.ComboItems.Add 6, "MenoroIgual", "Menor o Igual", "MenoroIgual"
    Case "DATETIME":
        ' Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar"
        Me.ImageCombo1.ComboItems.Add 1, "Igual", "Igual", "Igual", "Igual"
        ' Me.ImageCombo1.ComboItems.Add 3, "Menor", "Menor", "Menor"
        ' Me.ImageCombo1.ComboItems.Add 4, "Mayor", "Mayor", "Mayor"
        ' Me.ImageCombo1.ComboItems.Add 5, "MayoroIgual", "Mayor o Igual", "MayoroIgual"
        ' Me.ImageCombo1.ComboItems.Add 6, "MenoroIgual", "Menor o Igual", "MenoroIgual"
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
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            End If
        End If
    Next
    ObjTablasIO.Seleccionar
    For Each Control In Me.Controls
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cupones", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
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

Private Sub lstBusqueda_ItemCheck(ByVal Item As MSComctlLib.ListItem)

    
    DoEvents
    ActualizarSaldo
    
End Sub


' Programar
Private Sub ActualizarSaldo()
Dim i As Integer
Dim j As Integer
Dim vlAcumPesos      As Single
Dim vlAcumDolares    As Single
Dim vlAcumEuros    As Single
Dim vlAcumComision    As Single
Dim vlSaldoPesos    As Single
Dim vlSaldoDolares    As Single
Dim vlSaldoEuros    As Single


    vlAcumPesos = 0
    vlAcumDolares = 0
    vlAcumEuros = 0
    vlAcumComision = 0
    vlSaldoPesos = 0
    vlSaldoDolares = 0
    vlSaldoEuros = 0

    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
               vlAcumPesos = vlAcumPesos + ObtenerValoresNumericos(Me.lstBusqueda.ListItems(i).SubItems(2))
        End If
    Next i
    
    ObtenerCampo("vlAcumPesos").Text = FormatNumber(CStr(vlAcumPesos), 2)
    vlSaldoPesos = vlAcumPesos
    
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
                
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cupones", "nrCaja", objConfig.nrPuesto)
           ObtenerCampo("nrCaja").Text = strValor
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
    Case "Eliminar"
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           If Guardarregistro(EstadoABM) Then
                If objConfig.AbreCaja = "SI" Then
                    Unload Me
                    Exit Sub
                End If
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
                Unload Me
                PresentarPantalla Button
                EstadoABM = Consulta
    End Select
    
End Sub



Private Sub ExportaraExcel()
Dim strError  As String

    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView(objConfig.dsPathTemp + "\Libro1", _
    True, "Plantilla.xls", strError, Me.lstBusqueda) Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atenci�n"
        Exit Sub
    End If
    
End Sub


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_Cupones"
    For Each Control In Me.Controls
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
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atenci�n"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con �xito.", _
                    vbInformation + vbDefaultButton1, "Atenci�n"
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atenci�n"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCaja", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con �xito.", _
                    vbInformation + vbDefaultButton1, "Atenci�n"
                
                Guardarregistro = True
            End If
    Case CerrarCaja
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            ObjTablasIO.setearCampoOperadorValor "flEstado", _
            "<-", "1"
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atenci�n"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con �xito.", _
                    vbInformation + vbDefaultButton1, "Atenci�n"
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           If objParametros.ObtenerValor("frm_CobroCtaCte_v2") = "CerrarCaja" Then
              Me.tlb_ABM.Buttons("Imprimir").Visible = True
              Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
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
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Cancelar"
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
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
         If Me.txtBusqueda.Text = "1" Or Me.txtBusqueda.Text = "" Or Me.txtBusqueda.Text = "*" Or Me.txtBusqueda.Text = "%" Then Exit Sub
         
         ' Screen.MousePointer = vbHourglass
         Me.txtBusqueda.Text = ReemplazarPalabra(Me.txtBusqueda.Text, "*", "")
         Me.txtBusqueda.Text = ReemplazarPalabra(Me.txtBusqueda.Text, "%", "")
         strBuscada = Trim(Me.txtBusqueda.Text)
         limpiarControles
         Me.txtBusqueda.Text = strBuscada
         ObjTablasIO.nmTabla = "TB_Cupones"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.Text
         
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
        
         ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "->", "", ""
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "=", "Cuenta Corriente", "AND"
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "->", "0"
         ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "=", "0", "AND"
         ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0"
         ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cupones"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            ColoearLineas
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            ObjTablasIO.nmTabla = "TB_Clientes"
            ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
            ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
            ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", Me.txtBusqueda.Text
            ObjTablasIO.Seleccionar
            If ObjTablasIO.rs_resultados.EOF Then Exit Sub
            ObtenerCampo("dsRazonSocial").Text = AdaptarNulos(ObjTablasIO.rs_resultados("dsRazonSocial").value, "")
            Me.txtSaldos(0).Text = Me.txtBusqueda.Text
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", Me.txtBusqueda, KeyAscii)
    End If
    Screen.MousePointer = vbDefault
    
End Sub

Private Sub ColoearLineas()
Dim i As Integer
Dim j As Integer

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
            If Me.lstBusqueda.ListItems(i).SubItems(3) = "0" Then
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                 Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = True
            Else
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Azul
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = False
            End If
        Next j
    Next i

End Sub


Private Function grabarRecibo(cdCliente As String, dsRazonSocial As String) As String
Dim strValor As String


    strValor = objbasededatos.SP_ObtenerMaxIDRecibo
    
    ' objDiccionariodeDatos.ObtenerSiguienteValor("TB_Recibos", _
    '            "IdRecibo", objConfig.nrPuesto)
               
    ObjTablasIO.nmTabla = "TB_Recibos"
    ObjTablasIO.setearCampoOperadorValor "IdRecibo", "<-", strValor
    ObjTablasIO.setearCampoOperadorValor "vlAcumDolares", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoPesos", "<-", ObtenerCampo("vlAcumPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoEuros", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlAcumPesos", "<-", ObtenerCampo("vlAcumPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlAcumEuros", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlAcumComision", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoDolares", "<-", "0"
    ObjTablasIO.setearCampoOperadorValor "dtRecibo", "<-", Now
    ObjTablasIO.setearCampoOperadorValor "tpRecibo", "<-", "Detalle de Cobro a Cta. Cte."
    ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", cdCliente
    ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", dsRazonSocial
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", objParametros.ObtenerValor("nrCaja")

    If ObjTablasIO.Insertar Then
        objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", objConfig.nrPuesto
        grabarRecibo = strValor
    Else
        grabarRecibo = ""
    End If

End Function

Private Function eliminarRecibo(pIdRecibo As String) As Boolean
           
    ObjTablasIO.nmTabla = "TB_Recibos"
    ObjTablasIO.setearCampoOperadorValor "IdRecibo", "=", pIdRecibo
    eliminarRecibo = ObjTablasIO.Eliminar

End Function

Private Function grabarMovimientoContable(pIdRecibo As String, _
pcdConcepto As String, pnrCaja As String, pdsMovimiento As String, _
pnmProveedor As String, pvlDolares As String, pvlPesos As String, _
pvlEuros As String, pdsUsuario As String) As Boolean

   ' agregado en la version 4
   objMovimientos.limpiarObjeto

    objMovimientos.cdConcepto = pcdConcepto
    objMovimientos.IdRecibo = pIdRecibo
    objMovimientos.nrCaja = pnrCaja
    objMovimientos.dsMovimiento = pdsMovimiento
    objMovimientos.dsProveedor = pnmProveedor
    objMovimientos.dsUsuario = pdsUsuario
    objMovimientos.dtMovimiento = CStr(Now)
    objMovimientos.nrFactura = ""
    objMovimientos.IdProveedor = ""
    objMovimientos.vlDolares = pvlDolares
    objMovimientos.vlPesos = pvlPesos
    objMovimientos.vlEuros = pvlEuros
    
    If objMovimientos.grabarMovimientoContable() Then
        grabarMovimientoContable = True
    Else
        grabarMovimientoContable = False
    End If
    
    
End Function


Private Function ObtenerValoresNumericos(pDato As String) As Single

    If Trim(pDato) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(pDato)
    End If
    
End Function


Private Function PintarTextodeCampos(cajatexto As TextBox)

    If IsNumeric(cajatexto.Text) Then
        If CSng(cajatexto.Text) < 0 Then
            cajatexto.ForeColor = vbRed
        Else
            cajatexto.ForeColor = vbBlack
        End If
    End If
    
End Function




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






Private Sub txtFields_Change(Index As Integer)

    Select Case txtFields(Index).Tag
    Case "cdCliente"
    If txtFields(Index).Text = "" Then
            ObtenerCampo("cdCliente").BackColor = Blanco
            HabilitarCampos "dsRazonSocial", False
        End If
    Case "vlPagoPesos"
        Me.txtSaldos(2).Text = ObtenerCampo("vlPagoPesos").Text
    End Select

End Sub

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
            objParametros.GrabarValor "Frm_Busquedas.nmCampoTipoValorDefecto", "Cuenta Corriente"
            objParametros.GrabarValor "tpCampoBusqueda", "Raz�n Social"
            Frm_Busquedas.Show 1
            ObtenerCampo("cdCliente").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            buscarcampocliente
        End Select
    End Select

End Sub

Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)


    Select Case KeyAscii
    Case vbKeyReturn
        Select Case Me.txtFields(Index).Tag
        Case "cdCliente"
            ' -- agregado en la version 4.9
            If Not ObtenerCampo("cdCliente").Text = "" Then
                buscarcampocliente
            End If
            ObtenerCampo("dsOpcional2").SetFocus
        Case "dsOpcional2"
            ObtenerCampo("dsLeyenda").SetFocus
        Case "dsLeyenda"
            ObtenerCampo("vlPagoPesos").SetFocus
        Case "vlPagoPesos"
            Me.cbTipoFacturacion.SetFocus
        End Select
    Case vbKeyBack
    Case Else
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Comprobantes", _
                            Me.txtFields(Index), KeyAscii)
    End Select
End Sub






' versi�n  1.4
Private Sub buscarcampocliente()
Dim Control As Control
Dim Valor   As Variant
Dim i       As Integer
Dim tpIVA   As String




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
           AvisarError "cdCliente", True
           MsgBox "El cliente no existe, por favor ingrese un nuevo valor.", vbInformation + vbDefaultButton1, "Atenci�n"
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
           Me.txtSaldos(0).Text = ObtenerCampo("cdCliente").Text
           Me.txtSaldos(1).Text = ObtenerCampo("dsRazonSocial").Text
           ObtenerCampo("dsOpcional2").SetFocus
            
       Else
           HabilitarCampos "dsRazonSocial", False
           ObtenerCampo("cdCliente").BackColor = Rojo
           ObtenerCampo("cdCliente").SetFocus
       End If
   
End Sub




Private Sub txtFields_LostFocus(Index As Integer)


    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Comprobantes", _
                                  Me.txtFields(Index), "LostFocus"
    End If
    
End Sub

