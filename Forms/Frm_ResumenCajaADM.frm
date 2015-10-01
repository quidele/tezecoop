VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form Frm_ResumenCajaADM 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Resumen de Caja de Administración"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   10320
   ClipControls    =   0   'False
   Icon            =   "Frm_ResumenCajaADM.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8490
   ScaleWidth      =   10320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fra_ProgressBar 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Exportando los datos ....."
      ForeColor       =   &H80000008&
      Height          =   1650
      Left            =   2412
      TabIndex        =   25
      Top             =   3396
      Visible         =   0   'False
      Width           =   5340
      Begin MSComctlLib.ProgressBar ProgressBar 
         Height          =   480
         Left            =   315
         TabIndex        =   26
         Top             =   615
         Width           =   4575
         _ExtentX        =   8096
         _ExtentY        =   847
         _Version        =   393216
         Appearance      =   0
      End
      Begin VB.Label Label8 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Porcentaje "
         Height          =   255
         Left            =   315
         TabIndex        =   29
         Top             =   375
         Width           =   855
      End
      Begin VB.Label lblvlPorcentaje 
         BackColor       =   &H00FFFFFF&
         Caption         =   "10 %"
         Height          =   255
         Left            =   1155
         TabIndex        =   28
         Top             =   375
         Width           =   510
      End
      Begin VB.Label Label1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "100 %"
         Height          =   240
         Left            =   4380
         TabIndex        =   27
         Top             =   390
         Width           =   510
      End
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
      Index           =   13
      Left            =   3408
      Locked          =   -1  'True
      TabIndex        =   24
      Tag             =   "vlCierrePesos"
      Top             =   7680
      Width           =   1200
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
      Index           =   14
      Left            =   4584
      Locked          =   -1  'True
      TabIndex        =   23
      Tag             =   "vlCierreDolares"
      Top             =   7680
      Width           =   1200
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
      Index           =   15
      Left            =   5772
      Locked          =   -1  'True
      TabIndex        =   22
      Tag             =   "vlCierreEuros"
      Top             =   7680
      Width           =   1200
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
      Index           =   0
      Left            =   3408
      Locked          =   -1  'True
      TabIndex        =   21
      Tag             =   "vlSaldoInicialPesos"
      Top             =   7416
      Width           =   1200
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
      Index           =   1
      Left            =   4596
      Locked          =   -1  'True
      TabIndex        =   20
      Tag             =   "vlSaldoInicialDolares"
      Top             =   7416
      Width           =   1200
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
      Index           =   2
      Left            =   5772
      Locked          =   -1  'True
      TabIndex        =   19
      Tag             =   "vlSaldoInicialEuros"
      Top             =   7416
      Width           =   1200
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
      Left            =   3408
      Locked          =   -1  'True
      TabIndex        =   18
      Tag             =   "vlSaldoFinalRealPesos"
      Top             =   7956
      Width           =   1200
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
      Index           =   7
      Left            =   4584
      Locked          =   -1  'True
      TabIndex        =   17
      Tag             =   "vlSaldoFinalRealDolares"
      Top             =   7956
      Width           =   1200
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
      Index           =   8
      Left            =   5772
      Locked          =   -1  'True
      TabIndex        =   16
      Tag             =   "vlSaldoFinalRealEuros"
      Top             =   7956
      Width           =   1200
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   4
      Left            =   6960
      Locked          =   -1  'True
      TabIndex        =   15
      Tag             =   "vlTotalSaldoInicial"
      Top             =   7416
      Width           =   1188
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   5
      Left            =   6960
      Locked          =   -1  'True
      TabIndex        =   14
      Tag             =   "vlTotalSaldoCierre"
      Top             =   7680
      Width           =   1188
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
      Left            =   6960
      Locked          =   -1  'True
      TabIndex        =   13
      Tag             =   "vlTotalSaldoRealFinal"
      Top             =   7956
      Width           =   1185
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   17
      Left            =   8916
      Locked          =   -1  'True
      TabIndex        =   6
      Tag             =   "vlDiaEuro"
      Top             =   990
      Width           =   1092
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   16
      Left            =   7848
      Locked          =   -1  'True
      TabIndex        =   5
      Tag             =   "vlDiaDolar"
      Top             =   990
      Width           =   1080
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   12
      Left            =   5892
      Locked          =   -1  'True
      TabIndex        =   4
      Tag             =   "dtCierre"
      Top             =   990
      Width           =   1980
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   11
      Left            =   3996
      Locked          =   -1  'True
      TabIndex        =   3
      Tag             =   "dtApertura"
      Top             =   990
      Width           =   1905
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   10
      Left            =   96
      Locked          =   -1  'True
      TabIndex        =   2
      Tag             =   "nrCajaVista"
      Top             =   990
      Width           =   2175
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
      Height          =   300
      IMEMode         =   3  'DISABLE
      Index           =   9
      Left            =   2256
      Locked          =   -1  'True
      TabIndex        =   1
      Tag             =   "dsUsuarioCaja"
      Top             =   990
      Width           =   1755
   End
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10320
      _ExtentX        =   18203
      _ExtentY        =   1164
      ButtonWidth     =   2196
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgReimpRecibosResaltado"
      HotImageList    =   "imgReimpRecibosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Detalle"
            Key             =   "ImprimirDetalle"
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
      MouseIcon       =   "Frm_ResumenCajaADM.frx":030A
      Begin MSComctlLib.ImageList imgReimpRecibos 
         Left            =   8100
         Top             =   60
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
               Picture         =   "Frm_ResumenCajaADM.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":0584
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":06D8
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":07F0
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":08FC
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":0A50
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":0B58
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":11D4
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":1334
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":1788
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":1BDC
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgReimpRecibosResaltado 
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
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":2256
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":2372
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":24C6
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":25D6
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":26D8
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":282C
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":2938
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":2FB4
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":311C
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":3570
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenCajaADM.frx":39C4
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin MSComctlLib.ImageList ImgOperadores 
      Left            =   5376
      Top             =   5148
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
            Picture         =   "Frm_ResumenCajaADM.frx":403E
            Key             =   "Similar"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenCajaADM.frx":4150
            Key             =   "Igual"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenCajaADM.frx":4262
            Key             =   "MayoroIgual"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenCajaADM.frx":4374
            Key             =   "Mayor"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenCajaADM.frx":4486
            Key             =   "MenoroIgual"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_ResumenCajaADM.frx":4598
            Key             =   "Menor"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lstBusqueda 
      Height          =   5652
      Left            =   108
      TabIndex        =   30
      Top             =   1392
      Width           =   10056
      _ExtentX        =   17727
      _ExtentY        =   9975
      SortKey         =   1
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
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
      NumItems        =   8
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Tag             =   "nrCaja"
         Text            =   "Nro. Caja"
         Object.Width           =   2
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Object.Tag             =   "tpOperacion"
         Text            =   "Operación"
         Object.Width           =   3351
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Object.Tag             =   "dsConcepto"
         Text            =   "Concepto"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Object.Tag             =   "SumaPesos"
         Text            =   "Pesos"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Object.Tag             =   "SumaDolares"
         Text            =   "Dolares"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Object.Tag             =   "SumaEuros"
         Text            =   "Euros"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Object.Tag             =   "tpCajaImputacion"
         Text            =   "a Caja"
         Object.Width           =   4233
      EndProperty
      BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   7
         Object.Tag             =   "cdConcepto"
         Text            =   "cdConcepto"
         Object.Width           =   2
      EndProperty
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Pesos"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   3252
      TabIndex        =   37
      Top             =   7188
      Width           =   1212
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Dolares"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   4452
      TabIndex        =   36
      Top             =   7188
      Width           =   1236
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Euros"
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
      Left            =   5688
      TabIndex        =   35
      Tag             =   "vlSaldoInicialEuros"
      Top             =   7188
      Width           =   1212
   End
   Begin VB.Label Label6 
      Caption         =   "Saldo Inicial"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   2076
      TabIndex        =   34
      Top             =   7380
      Width           =   1380
   End
   Begin VB.Label Label7 
      Caption         =   "Caja Diaria"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   276
      Left            =   2076
      TabIndex        =   33
      Top             =   7728
      Width           =   1380
   End
   Begin VB.Label Label9 
      Caption         =   "Saldo Final"
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
      Left            =   2088
      TabIndex        =   32
      Top             =   8028
      Width           =   1368
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      Caption         =   "Total Pesificado"
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
      Left            =   6900
      TabIndex        =   31
      Tag             =   "vlSaldoInicialEuros"
      Top             =   7188
      Width           =   1476
   End
   Begin VB.Label Label15 
      Caption         =   "Cotiz. Euro"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   8970
      TabIndex        =   12
      Top             =   735
      Width           =   1065
   End
   Begin VB.Label Label14 
      Caption         =   "Cotiz. Dolar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   7875
      TabIndex        =   11
      Top             =   735
      Width           =   1065
   End
   Begin VB.Label Label13 
      Caption         =   "Fecha de Cierre"
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
      Left            =   5970
      TabIndex        =   10
      Top             =   735
      Width           =   1875
   End
   Begin VB.Label Label2 
      Caption         =   "Fecha de Apertura"
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
      Left            =   4065
      TabIndex        =   9
      Top             =   735
      Width           =   1875
   End
   Begin VB.Label Label12 
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
      Left            =   90
      TabIndex        =   8
      Top             =   750
      Width           =   1215
   End
   Begin VB.Label Label11 
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
      Left            =   2295
      TabIndex        =   7
      Top             =   720
      Width           =   1260
   End
End
Attribute VB_Name = "Frm_ResumenCajaADM"
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




Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
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
    Me.Caption = objParametros.ObtenerValor("Frm_ResumenCajaADM.titulo")
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub





Private Sub lblLabels_Click(Index As Integer)

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

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    '/* cambio intruducido en la version 4.1 1027 - 2030 - 1028*/
    
    Select Case objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "cdConcepto")
    ' corregir esta parte del codigo ya que no toma en cuenta la apertura por
    ' pago de comprobantes
    ' creamos la version 4.1
    Case "1027", "2030", "1028"
        objParametros.GrabarValor "dsConcepto", Me.lstBusqueda.SelectedItem.SubItems(2)
        objParametros.GrabarValor "nmVista", "VW_DetalleMovimientosContablesCupones"
        objParametros.GrabarValor "tpOperacion", Me.lstBusqueda.SelectedItem.SubItems(1)
        objParametros.GrabarValor "nrCajaVista", Me.lstBusqueda.SelectedItem.Text
        objParametros.GrabarValor "dsUsuarioCaja", ObtenerCampo("dsUsuarioCaja").Text
    Case Else
        objParametros.GrabarValor "dsConcepto", Me.lstBusqueda.SelectedItem.SubItems(2)
        objParametros.GrabarValor "nmVista", "VW_DetalleMovimientosContables"
        objParametros.GrabarValor "tpOperacion", Me.lstBusqueda.SelectedItem.SubItems(1)
        objParametros.GrabarValor "nrCajaVista", Me.lstBusqueda.SelectedItem.Text
        objParametros.GrabarValor "dsUsuarioCaja", ObtenerCampo("dsUsuarioCaja").Text
    End Select
    Frm_DetalleMovimientosContables.Show 1
    
        
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           
           objCajas.ObtenerSaldosdeInicioyValores objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
           
           ObtenerCampo("nrCajaVista").Text = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
           ObtenerCampo("dtApertura").Text = objCajas.dtApertura
           ObtenerCampo("dtCierre").Text = objCajas.dtCierre
           ObtenerCampo("vlDiaDolar").Text = objCajas.vlDiaDolar
           ObtenerCampo("vlDiaEuro").Text = objCajas.vlDiaEuro
           ObtenerCampo("dsUsuarioCaja").Text = objCajas.dsUsuario
           HabilitarCampos "nrCajaVista", False
           HabilitarCampos "dtApertura", False
           HabilitarCampos "dtCierre", False
           HabilitarCampos "vlDiaDolar", False
           HabilitarCampos "vlDiaEuro", False
           HabilitarCampos "dsUsuarioCaja", False
           
           objCajas.calcularSaldoInicial _
                 objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCaja"), _
                 objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCajaImputacion"), _
                 objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
            
           
           
           ObtenerCampo("vlSaldoInicialPesos").Text = objCajas.vlSaldoInicialPesos
           ObtenerCampo("vlSaldoInicialDolares").Text = objCajas.vlSaldoInicialDolares
           ObtenerCampo("vlSaldoInicialEuros").Text = objCajas.vlSaldoInicialEuros
           ActualizarSaldos
           PresentarPantalla Button
           EstadoABM = Consulta
           
    Case "Seleccionar"
           
           EstadoABM = Consulta
           limpiarControles
           ' Pasar datos
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCajaVista", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
           
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
          
    Case "Salir"
           Unload Me
    Case "Aceptar"
    
     Case "Imprimir"
        imprimirCaja True
     Case "ImprimirDetalle"
        imprimirCajaDetalle True
    End Select
    
End Sub


Private Sub imprimirCaja(porpantalla As Boolean)
    
    Frm_Principal.LimpiarReporte
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    
    ' determinando la version del reporte
    Dim nombrereporte As String
    nombrereporte = "rpt_cajaspuestosimputadas_v3_1.rpt"

    objSPs.nmStoredProcedure = "sp_versionreporte_v3_2"
    objSPs.setearCampoValor "@dtFechaOperacion", ObtenerCampo("dtcierre")
    If objSPs.ExecSP() Then
        If objSPs.rs_resultados("version") = "v3_2" Then
          nombrereporte = "rpt_cajaspuestosimputadasdesimputadas_v3_7.rpt"
        Else
          nombrereporte = "rpt_cajaspuestosimputadas_v3_1.rpt"
        End If
    End If

    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\" & nombrereporte
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Movimiento de una Caja"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
    Frm_Principal.CrystalReport1.StoredProcParam(1) = 0
    Frm_Principal.CrystalReport1.WindowTitle = "Imputación Cajas de los Puestos"
    
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0


    nombrereporte = "rpt_ResumendeCajaADM_v3_1.rpt"
    objSPs.nmStoredProcedure = "sp_versionreporte_v3_2"
    objSPs.setearCampoValor "@dtFechaOperacion", ObtenerCampo("dtcierre")
    If objSPs.ExecSP() Then
        If objSPs.rs_resultados("version") = "v3_2" Then
          nombrereporte = "rpt_resumendecajaadm_v3_7.rpt"
        Else
          nombrereporte = "rpt_ResumendeCajaADM_v3_1.rpt"
        End If
    End If


    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\" & nombrereporte
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Movimiento de una Caja"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
    Frm_Principal.CrystalReport1.StoredProcParam(1) = objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCaja")
    Frm_Principal.CrystalReport1.StoredProcParam(2) = objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCajaImputacion")
    
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


Private Sub imprimirCajaDetalle(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_cierredecajaadmdetallecontrol2_v3_7.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "PAGO DE COMPROBANTES - CONTROL 2"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
    
    ' Frm_Principal.CrystalReport1.RetrieveDataFile
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    

    ' Frm_Principal.LimpiarReporte
        
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_CierredeCajaADMDetalleControl1_v3_7.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "MOVIMIENTOS DE LA CAJA - CONTROL 1"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCajaImputacion")
    Frm_Principal.CrystalReport1.StoredProcParam(1) = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
    Frm_Principal.CrystalReport1.StoredProcParam(2) = objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCaja")
    
    
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


Private Sub ActualizarSaldos()
           
 
           objCajas.SumarCajaADM objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista"), objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCaja"), objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCajaImputacion")
           
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
           
           If objParametros.ObtenerValor("nrCaja") = objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista") Then
                ActualizarCajaAdmActual objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
           End If
           
           
End Sub


Private Sub ActualizarCajaAdmActual(pnrCajaAdmActual As String)

    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", ObtenerCampo("vlSaldoFinalRealPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", ObtenerCampo("vlSaldoFinalRealEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", ObtenerCampo("vlSaldoFinalRealDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierrePesos", "<-", ObtenerCampo("vlCierrePesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierreDolares", "<-", ObtenerCampo("vlCierreDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierreEuros", "<-", ObtenerCampo("vlCierreEuros").Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pnrCajaAdmActual
    ObjTablasIO.Actualizar
    
   
End Sub



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
        ObjTablasIO.nmTabla = "VW_ResumenCajaADM_v2_9"
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
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "SP_ResumenCajaADM_v2_9") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
End Sub


Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
    End Select
    

End Sub


Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n          As Integer
Dim strBuscada As String

    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         Screen.ActiveForm.MousePointer = vbHourglass
         objSPs.nmStoredProcedure = "SP_ResumenCajaADM_v2_9"
         objSPs.setearCampoValor "@nrCaja_param", objParametros.ObtenerValor("Frm_ResumenCajaADM.nrCajaVista")
         objSPs.setearCampoValor "@tpCaja_param", objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCaja")
         objSPs.setearCampoValor "@tpCajaImputacion_param", objParametros.ObtenerValor("Frm_ResumenCajaADM.tpCajaImputacion")
         
         If Not objSPs.ExecSP Then
            MsgBox "Error no se pudo obtener el resumen de la caja", vbCritical, "Atención"
            Exit Sub
         End If
         
         
         If Not objSPs.rs_resultados.EOF Then
            objControl.CargarListView_SG objSPs.rs_resultados, Me.lstBusqueda, 0, "SP_ResumenCajaADM_v2_9"
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
    End If
    
    
End Sub

