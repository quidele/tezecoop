VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form Frm_DetalleCajaPuesto 
   Caption         =   "Detalle Movimientos Caja Puesto"
   ClientHeight    =   9030
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   10260
   ClipControls    =   0   'False
   Icon            =   "Frm_DetalleCajaPuesto.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   9030
   ScaleWidth      =   10260
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   345
      IMEMode         =   3  'DISABLE
      Index           =   14
      Left            =   10335
      Locked          =   -1  'True
      TabIndex        =   46
      Tag             =   "vlSaldoInicialReales"
      ToolTipText     =   "1299,9687"
      Top             =   1320
      Width           =   1320
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   13
      Left            =   12675
      Locked          =   -1  'True
      TabIndex        =   44
      Tag             =   "vlDiaReal"
      Top             =   990
      Width           =   990
   End
   Begin VB.PictureBox pic_modificacionescomprobantes 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   3510
      Left            =   765
      ScaleHeight     =   3480
      ScaleWidth      =   9360
      TabIndex        =   37
      Top             =   2625
      Visible         =   0   'False
      Width           =   9390
      Begin VB.CommandButton cmdCerrarModifComprobantes 
         Appearance      =   0  'Flat
         Caption         =   "Cerrar"
         Height          =   375
         Left            =   135
         TabIndex        =   39
         Top             =   3000
         Width           =   1305
      End
      Begin MSComctlLib.ListView lst_modifComprobantes 
         Height          =   2130
         Left            =   150
         TabIndex        =   38
         Top             =   195
         Width           =   9090
         _ExtentX        =   16034
         _ExtentY        =   3757
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
            Size            =   8,25
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
            Object.Tag             =   "nrTalonario"
            Text            =   "Talón"
            Object.Width           =   1323
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "tpComprobante"
            Text            =   "Letra"
            Object.Width           =   1147
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nrComprobante"
            Text            =   "Comprobante"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dtComprobante"
            Text            =   "Fecha"
            Object.Width           =   2046
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "cdCondVenta"
            Text            =   "Cond. Venta"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "tpComision"
            Text            =   "Comisión"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "flAnulado"
            Text            =   "Anulado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "flEliminar"
            Text            =   "Eliminado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "dtActualizacion"
            Text            =   "Fecha Modificación"
            Object.Width           =   3528
         EndProperty
      End
      Begin VB.Label Label18 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Motivo/Observación"
         Height          =   195
         Left            =   2325
         TabIndex        =   43
         Top             =   2355
         Width           =   1710
      End
      Begin VB.Label Label17 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Estado Modificado"
         Height          =   195
         Left            =   165
         TabIndex        =   42
         Top             =   2355
         Width           =   1710
      End
      Begin VB.Label lblObservacionCajaPuesto 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   765
         Left            =   2295
         TabIndex        =   41
         Top             =   2565
         Width           =   6930
      End
      Begin VB.Label lblEstadoModificado 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   285
         Left            =   135
         TabIndex        =   40
         Top             =   2565
         Width           =   2055
      End
   End
   Begin VB.TextBox txtTotales 
      Appearance      =   0  'Flat
      Height          =   480
      Index           =   12
      Left            =   14505
      TabIndex        =   36
      Tag             =   "nrCierre"
      Text            =   "Text1"
      Top             =   870
      Visible         =   0   'False
      Width           =   1440
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   11
      Left            =   13650
      Locked          =   -1  'True
      TabIndex        =   33
      Tag             =   "nrPuesto"
      Top             =   990
      Width           =   825
   End
   Begin VB.PictureBox pic_detalle 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   2505
      Left            =   180
      ScaleHeight     =   2475
      ScaleWidth      =   13365
      TabIndex        =   23
      Top             =   6450
      Width           =   13395
      Begin VB.CommandButton cmdModificarSaldoOperadora 
         Caption         =   ">>"
         Height          =   330
         Left            =   7020
         TabIndex        =   35
         ToolTipText     =   "Modificar el saldo de la operadora"
         Top             =   165
         Width           =   480
      End
      Begin MSComctlLib.ListView lstBusquedaDetalle 
         Height          =   1980
         Left            =   -30
         TabIndex        =   25
         Top             =   510
         Width           =   13425
         _ExtentX        =   23680
         _ExtentY        =   3493
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         FlatScrollBar   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8,25
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
            Object.Tag             =   "dsCierre"
            Text            =   "Descripción"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "vlSaldoFinalPesos"
            Text            =   "Pesos"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "vlSaldoFinalDolares"
            Text            =   "Dolares"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "vlSaldoFinalEuros"
            Text            =   "Euros"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "vlSaldoFinalRealPesos"
            Text            =   "Pesos"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "vlSaldoFinalRealDolares"
            Text            =   "Dolares"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "vlSaldoFinalRealEuros"
            Text            =   "Euros"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "vlSaldoAdmPesos"
            Text            =   "Pesos"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "vlSaldoAdmDolares"
            Text            =   "Dolares"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "vlSaldoAdmEuros"
            Text            =   "Euros"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "vlSaldoAdmPesificado"
            Text            =   "Pesificado"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Object.Tag             =   "vlDiferenciaDeCierre"
            Text            =   "Diferencia"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Object.Tag             =   "dsDiferenciaDeCierre"
            Text            =   "Observación"
            Object.Width           =   10583
         EndProperty
      End
      Begin VB.Label Label12 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Saldo Final de la Operadora"
         ForeColor       =   &H80000008&
         Height          =   345
         Left            =   4350
         TabIndex        =   28
         Top             =   150
         Width           =   3150
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0E0FF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Saldo Final del Sistema "
         ForeColor       =   &H80000008&
         Height          =   345
         Left            =   1200
         TabIndex        =   27
         Top             =   150
         Width           =   3165
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Para la Aministración"
         ForeColor       =   &H80000008&
         Height          =   345
         Left            =   7485
         TabIndex        =   29
         Top             =   150
         Width           =   4230
      End
   End
   Begin MSComctlLib.ImageList ImageVarias 
      Left            =   5100
      Top             =   2145
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":552C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdReabrirCerrar 
      Caption         =   "Reabrir Caja"
      CausesValidation=   0   'False
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2775
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   1305
      Width           =   1650
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   345
      IMEMode         =   3  'DISABLE
      Index           =   10
      Left            =   915
      Locked          =   -1  'True
      TabIndex        =   30
      Tag             =   "dsEstado"
      ToolTipText     =   "1299,9687"
      Top             =   1320
      Width           =   1350
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   9
      Left            =   11745
      Locked          =   -1  'True
      TabIndex        =   20
      Tag             =   "vlDiaEuro"
      Top             =   990
      Width           =   990
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   8
      Left            =   10770
      Locked          =   -1  'True
      TabIndex        =   19
      Tag             =   "vlDiaDolar"
      Top             =   990
      Width           =   990
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   345
      IMEMode         =   3  'DISABLE
      Index           =   7
      Left            =   9030
      Locked          =   -1  'True
      TabIndex        =   18
      Tag             =   "vlSaldoInicialEuros"
      ToolTipText     =   "1299,9687"
      Top             =   1320
      Width           =   1320
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   345
      IMEMode         =   3  'DISABLE
      Index           =   6
      Left            =   7740
      Locked          =   -1  'True
      TabIndex        =   17
      Tag             =   "vlSaldoInicialDolares"
      ToolTipText     =   "1299,9687"
      Top             =   1320
      Width           =   1300
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   345
      IMEMode         =   3  'DISABLE
      Index           =   5
      Left            =   6465
      Locked          =   -1  'True
      TabIndex        =   16
      Tag             =   "vlSaldoInicialPesos"
      ToolTipText     =   "1299,9687"
      Top             =   1320
      Width           =   1300
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   3
      Left            =   8490
      Locked          =   -1  'True
      TabIndex        =   13
      Tag             =   "nmEmpleado"
      Top             =   990
      Width           =   2310
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   4
      Left            =   4200
      Locked          =   -1  'True
      TabIndex        =   8
      Tag             =   "dtApertura"
      Top             =   990
      Width           =   2025
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   2
      Left            =   150
      Locked          =   -1  'True
      TabIndex        =   7
      Tag             =   "dsPuesto"
      Top             =   990
      Width           =   1875
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   1
      Left            =   6195
      Locked          =   -1  'True
      TabIndex        =   6
      Tag             =   "dtCierre"
      Top             =   990
      Width           =   2310
   End
   Begin VB.TextBox txtTotales 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      CausesValidation=   0   'False
      DataField       =   "nmNombre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Index           =   0
      Left            =   2010
      Locked          =   -1  'True
      TabIndex        =   5
      Tag             =   "nrCaja"
      Top             =   990
      Width           =   2235
   End
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2760
      TabIndex        =   0
      Top             =   2805
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   1
         Top             =   615
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label4 
         BackColor       =   &H80000009&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   4
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H80000009&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1155
         TabIndex        =   3
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label3 
         BackColor       =   &H80000009&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   2
         Top             =   390
         Width           =   510
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483648
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":14D82
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":14E94
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":14FA6
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":150B8
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":151CA
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":152DC
            Key             =   "Menor"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":153EE
            Key             =   "nota"
            Object.Tag             =   "nota"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":155A0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   6405
      Top             =   2130
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483648
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":15722
            Key             =   "Modificado"
            Object.Tag             =   "Modificado"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":158D4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":15A56
            Key             =   "agregado"
            Object.Tag             =   "agregado"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":15B66
            Key             =   "Eliminado"
            Object.Tag             =   "Eliminado"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_DetalleCajaPuesto.frx":15CB8
            Key             =   "anulado"
            Object.Tag             =   "anulado"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   4680
      Left            =   210
      TabIndex        =   24
      Top             =   1725
      Width           =   10020
      _ExtentX        =   17674
      _ExtentY        =   8255
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDragMode     =   1
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      SmallIcons      =   "ImgOperadores"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   19
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "nrTalonario"
         Text            =   "Talón"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "nrComprobante"
         Text            =   "Comprobante"
         Object.Width           =   2205
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "tpComprobante"
         Text            =   "Tipo"
         Object.Width           =   882
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "dtComprobante"
         Text            =   "Fecha"
         Object.Width           =   2046
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "dsOpcional1"
         Text            =   "Hora"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "nrLicencia"
         Text            =   "Lic."
         Object.Width           =   988
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "cdCondVenta"
         Text            =   "Cond. Venta"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "vlPagoPesos"
         Text            =   "Pesos"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   8
         Object.Tag             =   "vlPagoDolares"
         Text            =   "Dolares"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   9
         Object.Tag             =   "vlPagoEuros"
         Text            =   "Euros"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   10
         Object.Tag             =   "vlPagoReales"
         Text            =   "Reales"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   11
         Object.Tag             =   "tpComision"
         Text            =   "Comision"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   12
         Object.Tag             =   "flAnulado"
         Text            =   "Anulado"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   13
         Object.Tag             =   "flManual"
         Text            =   "Facturación"
         Object.Width           =   2469
      EndProperty
      BeginProperty ColumnHeader(15) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   14
         Object.Tag             =   "dsOpcional2"
         Text            =   "Destino"
         Object.Width           =   7056
      EndProperty
      BeginProperty ColumnHeader(16) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   15
         Object.Tag             =   "tpLetra"
         Text            =   "Letra"
         Object.Width           =   0
      EndProperty
      BeginProperty ColumnHeader(17) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   16
         Object.Tag             =   "flmodificadoreaperturacajapuesto"
         Text            =   "Modificado"
         Object.Width           =   1587
      EndProperty
      BeginProperty ColumnHeader(18) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   17
         Object.Tag             =   "tpModificacionCajaPuesto"
         Text            =   "Tipo Modif"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(19) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   18
         Object.Tag             =   "dsObservacionCajaPuesto"
         Text            =   "Observación"
         Object.Width           =   2
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   26
      Top             =   0
      Width           =   10260
      _ExtentX        =   18098
      _ExtentY        =   1111
      ButtonWidth     =   2937
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgReimpComprobantesResaltado"
      HotImageList    =   "imgReimpComprobantesResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Buscar(F2)"
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
            Caption         =   "A&nular/Eliminar(Des)"
            Key             =   "Anular"
            Object.ToolTipText     =   "Anular un comprobante de esta caja"
            ImageKey        =   "Anular"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "A&gregar"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agrrgar un comprobante a esta caja"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
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
            Caption         =   "&Salir (F12)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_DetalleCajaPuesto.frx":15DC8
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
               Picture         =   "Frm_DetalleCajaPuesto.frx":15F2A
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":16042
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":16196
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":162AE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":163BA
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":1650E
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":16616
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":16C92
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":16DF2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":17246
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":1769A
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":17D14
               Key             =   "Anular"
            EndProperty
         EndProperty
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
               Picture         =   "Frm_DetalleCajaPuesto.frx":17E24
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":17F40
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":18094
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":181A4
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":182A6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":183FA
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":18506
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":18B82
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":18CEA
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":1913E
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":19592
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_DetalleCajaPuesto.frx":19C0C
               Key             =   "Anular"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Label Label16 
      Caption         =   "Cot. Real"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   12705
      TabIndex        =   45
      Top             =   750
      Width           =   900
   End
   Begin VB.Label Label15 
      Caption         =   "Puesto"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   13665
      TabIndex        =   34
      Top             =   765
      Width           =   795
   End
   Begin VB.Image pic_estadocaja 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   345
      Left            =   2235
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   435
   End
   Begin VB.Label Label14 
      Alignment       =   1  'Right Justify
      Caption         =   "Estado:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   300
      Left            =   180
      TabIndex        =   31
      ToolTipText     =   "Fondo Fijo"
      Top             =   1380
      Width           =   660
   End
   Begin VB.Label Label9 
      Caption         =   "Cot. Euro"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   11775
      TabIndex        =   22
      Top             =   750
      Width           =   900
   End
   Begin VB.Label Label7 
      Caption         =   "Cot. Dolar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   10770
      TabIndex        =   21
      Top             =   765
      Width           =   900
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Saldo Inicial:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8,25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   300
      Left            =   5130
      TabIndex        =   15
      ToolTipText     =   "Fondo Fijo"
      Top             =   1395
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "Operador"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   8505
      TabIndex        =   14
      Top             =   765
      Width           =   2070
   End
   Begin VB.Label Label10 
      Caption         =   "Nombre del Puesto"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   135
      TabIndex        =   12
      Top             =   780
      Width           =   1890
   End
   Begin VB.Label Label8 
      Caption         =   "Fecha de Cierre"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   6240
      TabIndex        =   11
      Top             =   765
      Width           =   2070
   End
   Begin VB.Label Label6 
      Caption         =   "Nro. de Caja"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8,25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   2055
      TabIndex        =   10
      Top             =   765
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "Fecha de Apertura"
      Height          =   255
      Left            =   4230
      TabIndex        =   9
      Top             =   780
      Width           =   1920
   End
End
Attribute VB_Name = "Frm_DetalleCajaPuesto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const GRILLA_COMPROBANTE = "GRILLA_COMPROBANTE"
Const GRILLA_SALDO = "GRILLA_SALDOS"
Const COLUMN_ELIMINADO = 16

Dim EstadoABM             As Byte
Dim objControl            As New CControl
Dim strgrillaSeleccionada As String


Public Sub RefrescarProgressbar(pAvance As Long)


    DoEvents
    On Error Resume Next
    Me.ProgressBar.value = pAvance
    Me.lblvlPorcentaje.Caption = CStr(pAvance) + " %"
    Me.Visible = True
    On Error GoTo 0
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




Private Sub cmdCerrarModifComprobantes_Click()

    Me.pic_modificacionescomprobantes.Visible = False
    
    If Not objCajas.puedeOperarUsuarioCajaPuesto(ObtenerCampo("nrCaja"), objUsuario.dsUsuario) Then
            Me.tlb_ABM.Enabled = True
            Me.lstBusqueda.Enabled = True
            Me.cmdCerrarModifComprobantes.Enabled = True
            Me.cmdReabrirCerrar.Enabled = False
            Me.lstBusquedaDetalle.Enabled = True
            Me.cmdModificarSaldoOperadora.Enabled = False
            MsgBox objCajas.Error, vbInformation + vbDefaultButton1
          ' verificamos si el usuario puede operar con esta caja
          

    Else
        ' habilitar para realizar cambios
        HabilitarControlesVistaModificaciones True
    End If
          
    
 
    

End Sub

Private Sub cmdModificarSaldoOperadora_Click()

    lstBusquedaDetalle_DblClick

End Sub

Private Sub cmdReabrirCerrar_Click()
Dim resp As Byte

    'ATENCION: transaccionan los Stores Procedures
    
    If Me.cmdReabrirCerrar.Caption = "Cerrar Caja" Then
        resp = MsgBox("Se procederá al cierre de la caja, por favor confirme los saldos de cierre de la operadora.", vbDefaultButton1 + vbInformation, "Atención")
        objParametros.GrabarValor "frm_ABMCajaPuesto.modo", "administracion.moficacion"
        objParametros.GrabarValor "frm_ABMCajaPuesto.nrcaja", ObtenerCampo("nrcaja")
        frm_ABMCajaPuesto.Show vbModal
        ' Actualizamos la pantalla
        cmdCargarDatosCajaPuesto
        resp = MsgBox("Se procederá al cierre de la caja, confirma esta operación?", vbQuestion + vbYesNo, "Atención")
        If resp = vbNo Then Exit Sub
        If objCajas.realizarCierreCajaPuesto(ObtenerCampo("nrCaja"), objUsuario.dsUsuario, "USRPARAM") Then
            objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "SI"
            cmdCargarDatosCajaPuesto
            MsgBox "El cierre se ha realizado con éxito. Verifique la alimentación de hojas de papel de la impresora.", vbInformation + vbDefaultButton1, "Atención"
            imprimirCaja False
            objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
            resp = MsgBox("Desea realizar la imputación.", vbQuestion + vbYesNo + vbDefaultButton2, "Impresión del cierre de caja")
            If resp = vbNo Then Exit Sub
            Unload Me
            objParametros.GrabarValor "Frm_ResumenAsientoCP.registracion_directa", "SI"
            objParametros.GrabarValor "Frm_ResumenAsientoCP.nrCaja", ObtenerCampo("nrCaja")
            objParametros.GrabarValor "Frm_ResumenAsientoCP.modo", "registracion_asiento"
            objParametros.GrabarValor "Frm_ResumenAsientoCP", "registracion_directa"
            Frm_ResumenAsientoCP.Show 1
            objParametros.GrabarValor "Frm_ResumenAsientoCP.registracion_directa", ""
            objParametros.GrabarValor "Frm_ResumenAsientoCP.nrCaja", ""
            objParametros.GrabarValor "Frm_ResumenAsientoCP.modo", ""
            objParametros.GrabarValor "Frm_ResumenAsientoCP", ""
        Else
            ' mejorar la discripcion del error
            MsgBox "Se ha producido un error, por favor reintente la operación. " + vbCrLf + " Error extendido: " + objCajas.Error + ".", vbCritical, "Atención"
        End If
    Else
        resp = MsgBox("Se procederá a realizar la reapertura de la caja, confirma esta operación?", vbQuestion + vbYesNo, "Atención")
        If resp = vbNo Then Exit Sub
        If objCajas.puedeOperarUsuarioCajaPuesto(ObtenerCampo("nrCaja"), objUsuario.dsUsuario) Then
            ' debemos  creamos la reapertura de la caja
            If Not objCajas.realizarReaperturadelaCajaPuesto(ObtenerCampo("nrCaja"), objUsuario.dsUsuario, "USRPARAM") Then
                MsgBox "Error al tratar de realizar la reapertura," + vbCrLf + " error extendido:" + objCajas.Error + ".", vbInformation, "Atención"
                Exit Sub
            End If
            ' si todos estuvo OK cargamos nuevamente la apariencia de la ventana a modo de edición
            cmdCargarDatosCajaPuesto
            MsgBox "La reapertura se ha realizado con éxito.", vbInformation + vbDefaultButton1, "Atención"
        Else
            MsgBox "Se ha producido un error, por favor reintente la operación. " + vbCrLf + " Error extendido: " + objCajas.Error + ".", vbCritical, "Atención"
        End If
    End If
    
    
End Sub




Private Sub Form_Activate()
Dim i As Integer

    i = Me.lstBusquedaDetalle.ListItems.Add(, , "").Index
    Me.lstBusquedaDetalle.ListItems.Remove i


End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
         If Me.pic_modificacionescomprobantes.Visible Then
            cmdCerrarModifComprobantes_Click
         Else
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
         End If
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
Dim i As Integer

    On Error Resume Next
    objGUI.SizeControls_WithTotals Me, , Me.lstBusqueda, , 100, Me.pic_detalle, Me.lstBusquedaDetalle
    On Error GoTo 0
    
        
    i = Me.lstBusquedaDetalle.ListItems.Add(, , "").Index
    Me.lstBusquedaDetalle.ListItems.Remove i
    
    
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

    
    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada", "Abierta"
            ' Hacemos lo mesmo
            tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Seleccionar")
    End Select
    

End Sub

Private Sub lstBusqueda_GotFocus()
    Dim i As Integer
    
    i = Me.lstBusqueda.ListItems.Add(, , "").Index
    Me.lstBusqueda.ListItems.Remove i
    
    i = Me.lstBusquedaDetalle.ListItems.Add(, , "").Index
    Me.lstBusquedaDetalle.ListItems.Remove i
    
    strgrillaSeleccionada = "GRILLA_COMPROBANTE"
    
    
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Or KeyAscii = vbKeySpace Then
        If objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "flmodificadoreaperturacajapuesto") = "SI" Then
            mostrarModificacionesdelComprobante
        End If
    End If

End Sub


Private Sub mostrarModificacionesdelComprobante()

    
    HabilitarControlesVistaModificaciones False
    
    ' obtener las modificaciones del comprobante
    objSPs.nmStoredProcedure = "sco_ComprobantesModificados_cajapuesto_v2_5"
    objSPs.setearCampoValor "@nrTalonario_param", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrTalonario")
    objSPs.setearCampoValor "@nrComprobante_param", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrComprobante")
    objSPs.setearCampoValor "@tpComprobante_param", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpComprobante")
    objSPs.setearCampoValor "@tpLetra_param", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpLetra")
    
    If Not objSPs.ExecSP() Then
        MsgBox "Error al ejecutar el procedure sco_ComprobantesModificados_cajapuesto_v2_5, decripción: " + objSPs.Error, vbCritical + vbDefaultButton1, "Error"
        Exit Sub
    End If
    Me.lst_modifComprobantes.ListItems.Clear
    
    objControl.CargarListView_SG_conFORMATO objSPs.rs_resultados, Me.lst_modifComprobantes, 0, "sco_Comprobantes_cajapuesto_v3_7"
    
    lblEstadoModificado = objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpModificacionCajaPuesto", Me.lstBusqueda.SelectedItem.Index)
    lblObservacionCajaPuesto = objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dsObservacionCajaPuesto", Me.lstBusqueda.SelectedItem.Index)
    
    
    
    objGUI.centrarObjeto Me.pic_modificacionescomprobantes
    objGUI.resaltarcambiosenFilaaFila lst_modifComprobantes
    Me.pic_modificacionescomprobantes.Visible = True
    
    
End Sub





Private Sub HabilitarControlesVistaModificaciones(pbHabilitar As Boolean)

    Me.tlb_ABM.Enabled = pbHabilitar
    Me.lstBusqueda.Enabled = pbHabilitar
    Me.cmdCerrarModifComprobantes.Enabled = Not pbHabilitar
    Me.cmdReabrirCerrar.Enabled = pbHabilitar
    Me.lstBusquedaDetalle.Enabled = pbHabilitar
    Me.cmdModificarSaldoOperadora.Enabled = pbHabilitar

End Sub




Private Sub lstBusquedaDetalle_DblClick()

    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
    Case "Abierta"
        If Me.cmdReabrirCerrar.Enabled Then
            objParametros.GrabarValor "frm_ABMCajaPuesto.modo", "administracion.moficacion"
            objParametros.GrabarValor "frm_ABMCajaPuesto.nrcaja", ObtenerCampo("nrcaja")
            frm_ABMCajaPuesto.Show vbModal
            ' Actualizamos la pantalla
            cmdCargarDatosCajaPuesto
        End If
    End Select
    
End Sub

Private Sub lstBusquedaDetalle_GotFocus()
Dim i As Integer
    
    i = Me.lstBusquedaDetalle.ListItems.Add(, , "").Index
    Me.lstBusquedaDetalle.ListItems.Remove i
        
    strgrillaSeleccionada = "GRILLA_SALDOS"

End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte
 
    Select Case Button.Key
    Case "Aprobar"
            
    Case "Buscar"
          EstadoABM = Consulta
          cmdCargarDatosCajaPuesto
    Case "Agregar"
           cmdAgregarComprobante
    Case "Anular"
          cmdAnularComprobante
    Case "Seleccionar"
          Select Case strgrillaSeleccionada
          Case "GRILLA_COMPROBANTE"
            cmdSeleccionarComprobante
          Case "GRILLA_SALDOS"
            ' cmdSeleccionarGrillaSaldos
          Case Else
            ' enviar mensaje iunformando que debe seleccionar la grilla deseada
          End Select
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    End Select
    
End Sub


Public Sub cmdCargarDatosCajaPuesto()

            Me.lstBusquedaDetalle.Visible = True
            Me.lstBusqueda.Visible = True
            Me.lstBusqueda.ListItems.Clear
            Me.lstBusquedaDetalle.ListItems.Clear
            
            ' obtener los datos de la caja en cuestion
            objSPs.nmStoredProcedure = "sco_cajapuesto_v3_7"
            objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("Frm_DetalleCajaPuesto.nrcajapuesto")
            
            If Not objSPs.ExecSP() Then
                MsgBox "Error al ejecutar el procedure sco_cajapuesto_v3_7, decripción: " + objSPs.Error, vbCritical + vbDefaultButton1, "Error"
                Exit Sub
            End If
            
            ObtenerCampo("nrcaja") = objParametros.ObtenerValor("Frm_DetalleCajaPuesto.nrcajapuesto")
            ObtenerCampo("dsPuesto") = objbasededatos.rs_resultados("dsPuesto")
            ObtenerCampo("nrPuesto") = objbasededatos.rs_resultados("nrPuesto")
            ObtenerCampo("dtApertura") = objbasededatos.rs_resultados("dtApertura")
            ObtenerCampo("dtCierre") = objbasededatos.rs_resultados_valor("dtCierre")
            ObtenerCampo("nmEmpleado") = objbasededatos.rs_resultados("nmEmpleado")
            
            ObtenerCampo("vlSaldoInicialPesos") = objbasededatos.rs_resultados("vlSaldoInicialPesos")
            ObtenerCampo("vlSaldoInicialDolares") = objbasededatos.rs_resultados("vlSaldoInicialDolares")
            ObtenerCampo("vlSaldoInicialEuros") = objbasededatos.rs_resultados("vlSaldoInicialEuros")
            ObtenerCampo("vlSaldoInicialReales") = objbasededatos.rs_resultados("vlSaldoInicialReales")
            
            
            ObtenerCampo("vlDiaDolar") = objbasededatos.rs_resultados("vlDiaDolar")
            ObtenerCampo("vlDiaEuro") = objbasededatos.rs_resultados("vlDiaEuro")
            ObtenerCampo("vlDiaReal") = objbasededatos.rs_resultados("vlDiaReal")
            ObtenerCampo("nrCierre") = objbasededatos.rs_resultados("nrCierre")
            
            ObtenerCampo("dsEstado") = objbasededatos.rs_resultados("dsEstado")
            ' Mostrar los comprobantes/viajes de la caja que se esta invocando
            ' basarse en el informe rpt_cierredecaja_imprime_valores.rpt, se deberia
            ' mostrar una información similar pero por pantalla
            objSPs.nmStoredProcedure = "sco_Comprobantes_cajapuesto_v3_7"
            objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("Frm_DetalleCajaPuesto.nrcajapuesto")
            
            If Not objSPs.ExecSP() Then
                MsgBox "Error al ejecutar el procedure sco_Comprobantes_cajapuesto_v3_7, decripción: " + objSPs.Error, vbCritical + vbDefaultButton1, "Error"
                Exit Sub
            End If
            
            objControl.CargarListView_SG_conFORMATO objSPs.rs_resultados, Me.lstBusqueda, 0, "sco_Comprobantes_cajapuesto_v3_7"
            
            objSPs.nmStoredProcedure = "sco_obtenerCierresCajaPuesto_v2_5"
            objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("Frm_DetalleCajaPuesto.nrcajapuesto")
            
            If Not objSPs.ExecSP() Then
                MsgBox "Error al ejecutar el procedure sco_obtenerCierresCajaPuesto_v2_5, decripción: " + objSPs.Error, vbCritical + vbDefaultButton1, "Error"
                Exit Sub
            End If
            
            
            objControl.CargarListView_SG_conFORMATO objSPs.rs_resultados, Me.lstBusquedaDetalle, 0, "sco_obtenerCierresCajaPuesto_v2_5"
            
            If Me.lstBusqueda.ListItems.Count > 0 Then
                ResaltarlosComprobantesModificados
            End If
            
            ' resaltados los cambios en los distintos cierres
            objGUI.resaltarcambiosenFilaaFila Me.lstBusquedaDetalle
            
            HabilitarCampos "dsEstado", False
            HabilitarCampos "nrCaja", False
            HabilitarCampos "dsPuesto", False
            HabilitarCampos "dtApertura", False
            HabilitarCampos "dtCierre", False
            HabilitarCampos "nmEmpleado", False
            HabilitarCampos "vlSaldoInicialPesos", False
            HabilitarCampos "vlSaldoInicialDolares", False
            HabilitarCampos "vlSaldoInicialEuros", False
            HabilitarCampos "vlSaldoInicialReales", False
            HabilitarCampos "vlDiaDolar", False
            HabilitarCampos "vlDiaReal", False
            HabilitarCampos "vlDiaEuro", False
            HabilitarCampos "nrPuesto", False
            
            Select Case objParametros.ObtenerValor("Frm_DetalleCajaPuesto.Aprobacion.Usuario")
            Case "SI"
                HabilitarReaperturaCierre False
                ColorearGrillaLstBusqueda False
                ColorearGrillaLstBusquedaDetalle False
                pintarEstado False
                Exit Sub
            End Select
            
            If Not objCajas.puedeOperarUsuarioCajaPuesto(ObtenerCampo("nrCaja"), objUsuario.dsUsuario) Then
                MsgBox objCajas.Error, vbInformation + vbDefaultButton1
                ' verificamos si el usuario puede operar con esta caja
                HabilitarReaperturaCierre False
                ColorearGrillaLstBusqueda False
                ColorearGrillaLstBusquedaDetalle False
                pintarEstado False
            Else
                ' habilitar para realizar cambios
                HabilitarReaperturaCierre True
                ColorearGrillaLstBusqueda True
                ColorearGrillaLstBusquedaDetalle True
                pintarEstado True
            End If
            
End Sub



' versión 2.5
Private Sub ResaltarlosComprobantesModificados()
Dim i As Integer
Dim ItemList  As ListItem
Dim j As Integer

    If Me.lstBusqueda.ListItems.Count < 1 Then Exit Sub
 
    For i = 1 To Me.lstBusqueda.ListItems.Count
    
        ' MsgBox "Corregir el funcionamiento de esta function "
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flmodificadoreaperturacajapuesto", i) = "SI" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            
            Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpModificacionCajaPuesto", i)
            Case "Agregado"
                ItemList.SmallIcon = 3
            Case "Eliminado"
                ItemList.SmallIcon = 4
            Case "Anulado"
                ItemList.SmallIcon = 5
            Case "Modificado", "Desanulado", "Deseliminado"
                ItemList.SmallIcon = 1
            Case Else
            End Select
            
            ItemList.CreateDragImage
            Me.lstBusqueda.ListItems.Item(i).ToolTipText = Me.lstBusqueda.ListItems.Item(i).ToolTipText + " Presione ENTER o SPACE para ver las modificaciones."
            For j = 1 To ItemList.ListSubItems.Count
                ItemList.ListSubItems(j).ToolTipText = Me.lstBusqueda.ListItems.Item(i).ToolTipText + " Presione ENTER o SPACE para ver las modificaciones."
            Next
        End If
    Next i

End Sub



' version 2.5 - pintar estado
Private Sub pintarEstado(pflEditar As Boolean)

    If Not pflEditar Then
        ObtenerCampo("dsEstado").ForeColor = Rojo
        Me.pic_estadocaja.Picture = Me.ImageVarias.ListImages.Item(1).Picture
    End If
    
    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
            Me.pic_estadocaja.Picture = Me.ImageVarias.ListImages.Item(1).Picture
            ObtenerCampo("dsEstado").ForeColor = Rojo
    Case "Abierta"
            Me.pic_estadocaja.Picture = Me.ImageVarias.ListImages.Item(2).Picture
            ObtenerCampo("dsEstado").ForeColor = Verde
    End Select
    

End Sub

' version 2.5 - HabilitarReaperturaCierre
Private Sub HabilitarReaperturaCierre(pflEditar As Boolean)
    
    If Not pflEditar Then
        Me.cmdReabrirCerrar.Enabled = False
        Me.cmdReabrirCerrar.Caption = "Reabrir Caja"
        Me.cmdModificarSaldoOperadora.Enabled = False
        Me.tlb_ABM.Buttons("Agregar").Visible = False
        Me.tlb_ABM.Buttons("Anular").Visible = False
        Me.tlb_ABM.Buttons("Seleccionar").Visible = True
        Me.tlb_ABM.Buttons("Exportar").Visible = True
        Me.tlb_ABM.Buttons("Salir").Visible = True
        Exit Sub
    End If
    
    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
            Me.cmdReabrirCerrar.Caption = "Reabrir Caja"
            Me.cmdModificarSaldoOperadora.Enabled = False
            Me.cmdReabrirCerrar.Enabled = True
            Me.tlb_ABM.Buttons("Agregar").Visible = False
            Me.tlb_ABM.Buttons("Anular").Visible = False
            Me.tlb_ABM.Buttons("Seleccionar").Visible = True
            Me.tlb_ABM.Buttons("Exportar").Visible = True
            Me.tlb_ABM.Buttons("Salir").Visible = True
    Case "Abierta"
            Me.tlb_ABM.Buttons("Agregar").Visible = True
            Me.tlb_ABM.Buttons("Anular").Visible = True
            Me.tlb_ABM.Buttons("Agregar").Visible = True
            Me.tlb_ABM.Buttons("Seleccionar").Visible = True
            Me.tlb_ABM.Buttons("Exportar").Visible = True
            Me.tlb_ABM.Buttons("Salir").Visible = True
            Me.cmdReabrirCerrar.Enabled = True
            Me.cmdReabrirCerrar.Caption = "Cerrar Caja"
            Me.cmdModificarSaldoOperadora.Enabled = True
    End Select

End Sub


' version 2.5 a desarrollar
Private Sub cmdSeleccionarGrillaSaldos()

    frm_ABMCajaPuesto.Show vbModal

End Sub


' version 2.5 a desarrollar
Private Sub cmdAgregarComprobante()

    objParametros.GrabarValor "frm_SeleccionarPuesto.nrPuesto", ObtenerCampo("nrPuesto")
    
    frm_SeleccionarPuesto.Show vbModal
    
    If objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto") = "" Then
        Exit Sub
    End If
    
    ' Seleccionar el numero de puesto de la caja-puesto seleccionada
    objParametros.GrabarValor "Frm_VentaPasajes.nrPuesto", objParametros.ObtenerValor("frm_SeleccionarPuesto.nrPuesto")
    objParametros.GrabarValor "Frm_VentaPasajes.desde", "administracion.cajapuesto"
    objParametros.GrabarValor "Frm_VentaPasajes.nrCaja", ObtenerCampo("nrCaja")
    
    
    ' objParametros.GrabarValor "nrCaja", strnrCaja
    objParametros.GrabarValor "Frm_VentaPasajes.Compensado", "NO"
    objParametros.GrabarValor "FormatoHoja", "Chico"
    objParametros.GrabarValor "Frm_VentaPasajes.modo", "Facturar"
    objParametros.GrabarValor "Frm_VentaPasajes.tipofacturacion", "manual"
    objParametros.GrabarValor "Frm_VentaPasajes.numeracion_correlativa", "NO"
    
    ' seteamos las cotizaciones
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaEuro", ObtenerCampo("vlDiaEuro")
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaDolar", ObtenerCampo("vlDiaDolar")
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", ObtenerCampo("vlDiaReal")
    objParametros.GrabarValor "Frm_VentasPasajes.nrCierre", ObtenerCampo("nrCierre")
    
    
    Frm_VentaPasajes.Show vbModal
    
    ' Actualizamos la pantalla
    cmdCargarDatosCajaPuesto
    
End Sub

' version 2.5 a desarrollar
Private Sub cmdAnularComprobante()

    ' version 2.5 a desarrollar
    If Not verificarSeleccionComprobanteOK() Then
        MsgBox "Debe seleccionar un comprobante.", vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    

    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.modo", "administracion.Anulacion"
    ' hay que pasarle los datos del comprobnate en cuestión, es decir
    ' los datos que conforman la primary key
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrTalonario", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrTalonario")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrComprobante", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrComprobante")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.tpComprobante", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpComprobante")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.tpLetra", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpLetra")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrCierre", ObtenerCampo("nrCierre")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaDolar", ObtenerCampo("vlDiaDolar")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaEuro", ObtenerCampo("vlDiaEuro")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaReal", ObtenerCampo("vlDiaReal")
    objParametros.GrabarValor "Frm_VentasPasajes.vlDiaReal", ObtenerCampo("vlDiaReal")
     
    Frm_ElimModifAnularComprobantes.Show 1
    
    ' Actualizamos la pantalla
    cmdCargarDatosCajaPuesto
    
    
    
End Sub



Private Function verificarSeleccionComprobanteOK() As Boolean

    On Error Resume Next
    If Me.lstBusqueda.SelectedItem.Text = "" Then
        verificarSeleccionComprobanteOK = False
        Exit Function
    End If
    If Err Then
        verificarSeleccionComprobanteOK = False
        Exit Function
    End If
    On Error GoTo 0
    
    verificarSeleccionComprobanteOK = True
    
End Function

' version 2.5 a desarrollar
Private Sub cmdSeleccionarComprobante()
       
    If Not verificarSeleccionComprobanteOK() Then
        MsgBox "Debe seleccionar un comprobante.", vbInformation + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
        objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.modo", "administracion.consulta"
    Case "Abierta"
        objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.modo", "administracion.modificacion"
    End Select
    ' hay que pasarle los datos del comprobnate en cuestión, es decir
    ' los datos que conforman la primary key
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrTalonario", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrTalonario")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrComprobante", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrComprobante")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.tpComprobante", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpComprobante")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.tpLetra", objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "tpLetra")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.nrCierre", ObtenerCampo("nrCierre")

    ' seteamos las cotizaciones
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaDolar", ObtenerCampo("vlDiaDolar")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaEuro", ObtenerCampo("vlDiaEuro")
    objParametros.GrabarValor "Frm_ElimModifAnularComprobantes.vlDiaReal", ObtenerCampo("vlDiaReal")
     
    Frm_ElimModifAnularComprobantes.Show 1
     
    ' Actualizamos la pantalla
    cmdCargarDatosCajaPuesto
         
         
End Sub

Private Sub ColorearGrillaLstBusqueda(pflEditar As Boolean)

   If Not pflEditar Then
        Me.lstBusqueda.BackColor = Gris
        Exit Sub
    End If


    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
        Me.lstBusqueda.BackColor = Gris
    Case "Abierta"
        Me.lstBusqueda.BackColor = Blanco
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


Private Sub ColorearGrillaLstBusquedaDetalle(pflEditar As Boolean)
    
    If Not pflEditar Then
        Me.lstBusquedaDetalle.BackColor = Gris
        Exit Sub
    End If

    Select Case ObtenerCampo("dsEstado")
    Case "Cerrada"
        Me.lstBusquedaDetalle.BackColor = Gris
    Case "Abierta"
        Me.lstBusquedaDetalle.BackColor = Blanco
    End Select

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
    
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "sco_Comprobantes_cajapuesto_v3_7") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If

    ' EULISES faltaria exportar los cierres
    
       
End Sub




Private Sub imprimirCaja(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_cierredecaja_imprimev3_7.rpt"
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    objSPs.nmStoredProcedure = "rpt_cierredecaja_v3_7"
    objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    If Not objSPs.ExecSP() Then
        MsgBox "Error: " + objSPs.Error + ", función:rpt_cierredecaja_v3_7", vbCritical, "Atención"
        Exit Sub
    End If
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Cierre de Caja"
    
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.Formulas(0) = "nrCajaManual=" + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")

    ' Aparece la venta original
    On Error Resume Next
    ' hacer dinamica la cantidad de copias
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    Select Case objUsuario.tpAcceso
    Case "Puestos"
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_ComprobantesManuales_cajapuesto_v3_7.rpt"
    End Select
    
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = "Comprobantes Manuales - Caja Nro: " + objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("frm_ABMCajaPuesto.nrCaja")
    Frm_Principal.CrystalReport1.Formulas(0) = ""
    
    Frm_Principal.CrystalReport1.CopiesToPrinter = 1
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    On Error Resume Next
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
        MsgBox "ERROR: " + Err.Description + " -  Nombre del reporte:  " + Frm_Principal.CrystalReport1.ReportFileName, vbInformation + vbDefaultButton1, "Atención"
    End If
    On Error GoTo 0

End Sub


