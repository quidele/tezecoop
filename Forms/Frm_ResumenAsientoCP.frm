VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_ResumenAsientoCP 
   Caption         =   "Caja Puesto -> Caja Adm."
   ClientHeight    =   8070
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11565
   Icon            =   "Frm_ResumenAsientoCP.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8070
   ScaleWidth      =   11565
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   61
      Top             =   0
      Width           =   11565
      _ExtentX        =   20399
      _ExtentY        =   1164
      ButtonWidth     =   2805
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMCajasResaltado"
      HotImageList    =   "imgABMCajasResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
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
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F4)"
            Key             =   "Aceptar"
            ImageKey        =   "Aceptar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(ESC)"
            Key             =   "Cancelar"
            ImageKey        =   "Cancelar"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Detalle Viajes(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ResumenAsientoCP.frx":030A
      Begin MSComctlLib.ImageList imgABMCajas 
         Left            =   9600
         Top             =   90
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   14
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":0584
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":06D8
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":07F0
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":08FC
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":0A50
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":0B58
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":11D4
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":1334
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":1788
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":1BDC
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":2256
               Key             =   "arreglar"
               Object.Tag             =   "arreglar"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":26A8
               Key             =   "calcu"
               Object.Tag             =   "calcu"
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":29C2
               Key             =   "asiento"
               Object.Tag             =   "asiento"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMCajasResaltado 
         Left            =   270
         Top             =   45
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   16
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":2CDC
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":2DF8
               Key             =   "Sincronizar"
               Object.Tag             =   "Sincronizar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":407A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":41CE
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":42DE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":43E0
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":4534
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":4640
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":4CBC
               Key             =   "Aprobar_ver"
               Object.Tag             =   "Aprobar_ver"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":4E24
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":5278
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":56CC
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":5D46
               Key             =   "Arreglar"
               Object.Tag             =   "Arreglar"
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":6198
               Key             =   "calcu"
               Object.Tag             =   "calcu"
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":64B2
               Key             =   "asientos"
               Object.Tag             =   "asientos"
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":67CC
               Key             =   "registracion"
               Object.Tag             =   "registracion"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMCajas 
      BorderStyle     =   0  'None
      Height          =   7275
      Left            =   15
      TabIndex        =   0
      Top             =   660
      Width           =   11220
      Begin VB.Frame fra_valores 
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   0  'None
         Height          =   2535
         Left            =   180
         TabIndex        =   27
         Top             =   1350
         Width           =   10905
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   17
            Left            =   2985
            Locked          =   -1  'True
            TabIndex        =   76
            Tag             =   "vlSaldoFinalRealReales"
            Top             =   585
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   16
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   75
            TabStop         =   0   'False
            Tag             =   "vlCierreReales"
            Top             =   585
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   15
            Left            =   1845
            Locked          =   -1  'True
            TabIndex        =   74
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalReales"
            Top             =   585
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   6
            Left            =   705
            Locked          =   -1  'True
            TabIndex        =   73
            Tag             =   "vlSaldoInicialReales"
            Top             =   600
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   5
            Left            =   5295
            TabIndex        =   72
            Tag             =   "vlFondoFijoReales"
            Top             =   585
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   1500
            Index           =   25
            Left            =   6720
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   63
            TabStop         =   0   'False
            Tag             =   "dsObservacion"
            Top             =   945
            Width           =   4140
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   12
            Left            =   5295
            TabIndex        =   58
            Tag             =   "vlFondoFijoPesos"
            Top             =   270
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   4
            Left            =   5295
            TabIndex        =   59
            Tag             =   "vlFondoFijoDolares"
            Top             =   900
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   1
            Left            =   5295
            TabIndex        =   60
            Tag             =   "vlFondoFijoEuros"
            Top             =   1230
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   10
            Left            =   708
            Locked          =   -1  'True
            TabIndex        =   10
            Tag             =   "vlSaldoInicialDolares"
            Top             =   915
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   9
            Left            =   708
            Locked          =   -1  'True
            TabIndex        =   9
            Tag             =   "vlSaldoInicialPesos"
            Top             =   270
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   11
            Left            =   708
            Locked          =   -1  'True
            TabIndex        =   11
            Tag             =   "vlSaldoInicialEuros"
            Top             =   1245
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   201
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalDolares"
            Top             =   900
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   200
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   40
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalPesos"
            Top             =   255
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   13
            Left            =   1290
            Locked          =   -1  'True
            TabIndex        =   39
            TabStop         =   0   'False
            Tag             =   "dsDiferenciaDeCierre"
            Top             =   2160
            Width           =   5235
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   208
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   38
            TabStop         =   0   'False
            Tag             =   "vlCierrePesos"
            Top             =   270
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   209
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   37
            TabStop         =   0   'False
            Tag             =   "vlCierreDolares"
            Top             =   900
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   202
            Left            =   1848
            TabIndex        =   36
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalEuros"
            Top             =   1230
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   210
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "vlCierreEuros"
            Top             =   1230
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   207
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   34
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinalReal"
            Top             =   1545
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   206
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   33
            Tag             =   "vlSaldoFinalRealEuros"
            Top             =   1230
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   205
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   32
            Tag             =   "vlSaldoFinalRealDolares"
            Top             =   900
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   204
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   31
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalRealPesos"
            Top             =   270
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   203
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   30
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinal"
            Top             =   1545
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   21
            Left            =   135
            Locked          =   -1  'True
            TabIndex        =   29
            TabStop         =   0   'False
            Tag             =   "vlDiferenciaDeCierre"
            Top             =   2160
            Width           =   1080
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   211
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   28
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoCierre"
            Top             =   1545
            Width           =   1100
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Reales"
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
            Index           =   20
            Left            =   90
            TabIndex        =   77
            Top             =   645
            Width           =   585
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   240
            Index           =   17
            Left            =   8025
            TabIndex        =   64
            Top             =   615
            Width           =   1350
         End
         Begin VB.Label lblFondoFijo 
            BackColor       =   &H00FFC0C0&
            Caption         =   "Fondo Fijo próxima Caja"
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
            Left            =   5295
            TabIndex        =   57
            Top             =   30
            Width           =   2325
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Saldo"
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
            Index           =   14
            Left            =   90
            TabIndex        =   52
            Top             =   60
            Width           =   585
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   255
            Index           =   6
            Left            =   90
            TabIndex        =   51
            Top             =   1305
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "U$s"
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
            Index           =   5
            Left            =   90
            TabIndex        =   50
            Top             =   960
            Width           =   585
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   255
            Index           =   9
            Left            =   90
            TabIndex        =   49
            Top             =   330
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Inicial"
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
            Index           =   1
            Left            =   690
            TabIndex        =   48
            Top             =   45
            Width           =   1125
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Motivo en Diferencia de Cierre"
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
            Left            =   1245
            TabIndex        =   47
            Top             =   1875
            Width           =   2880
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Diferencia"
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
            Index           =   8
            Left            =   120
            TabIndex        =   46
            Top             =   1875
            Width           =   1125
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Sup."
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
            Left            =   1875
            TabIndex        =   45
            Top             =   30
            Width           =   1080
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Cierre"
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
            Index           =   10
            Left            =   4200
            TabIndex        =   44
            Top             =   30
            Width           =   1050
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Real"
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
            Index           =   11
            Left            =   3060
            TabIndex        =   43
            Top             =   30
            Width           =   1050
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Totales Pesificados"
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
            Index           =   15
            Left            =   90
            TabIndex        =   42
            Top             =   1560
            Width           =   1710
         End
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   7170
         Left            =   60
         ScaleHeight     =   7140
         ScaleWidth      =   11040
         TabIndex        =   13
         Top             =   45
         Width           =   11070
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   14
            Left            =   4095
            Locked          =   -1  'True
            TabIndex        =   70
            TabStop         =   0   'False
            Tag             =   "vlDiaReal"
            Top             =   975
            Width           =   2010
         End
         Begin MSComctlLib.ListView lstResumenAsientoOcultos 
            Height          =   2910
            Left            =   1875
            TabIndex        =   69
            Top             =   3960
            Visible         =   0   'False
            Width           =   10785
            _ExtentX        =   19024
            _ExtentY        =   5133
            View            =   3
            LabelEdit       =   1
            SortOrder       =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            OLEDragMode     =   1
            OLEDropMode     =   1
            FullRowSelect   =   -1  'True
            _Version        =   393217
            SmallIcons      =   "ImgListaEstadosCajaPuesto"
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
            NumItems        =   6
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Key             =   "cdConcepto"
               Object.Tag             =   "cdConcepto"
               Text            =   "Código"
               Object.Width           =   2
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Key             =   "dsConcepto"
               Object.Tag             =   "dsConcepto"
               Text            =   "Concepto"
               Object.Width           =   7056
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Key             =   "moneda"
               Object.Tag             =   "moneda"
               Text            =   "Moneda"
               Object.Width           =   1411
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Key             =   "vlImporte"
               Object.Tag             =   "vlImporte"
               Text            =   "Importe"
               Object.Width           =   2117
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Key             =   "tpOperacion"
               Object.Tag             =   "tpOperacion"
               Text            =   "Operación"
               Object.Width           =   3175
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Key             =   "tpCajaImputacion"
               Object.Tag             =   "tpCajaImputacion"
               Text            =   "a Caja"
               Object.Width           =   4762
            EndProperty
         End
         Begin VB.CheckBox check_estado 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Cerrada"
            ForeColor       =   &H80000008&
            Height          =   405
            Left            =   8385
            TabIndex        =   67
            Top             =   900
            Visible         =   0   'False
            Width           =   1485
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   24
            Left            =   6090
            Locked          =   -1  'True
            TabIndex        =   66
            TabStop         =   0   'False
            Tag             =   "dtObservacion"
            Top             =   975
            Width           =   2100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   5070
            Locked          =   -1  'True
            TabIndex        =   19
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   420
            Width           =   2580
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   2640
            Locked          =   -1  'True
            TabIndex        =   18
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   420
            Width           =   2445
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   8
            Left            =   2100
            Locked          =   -1  'True
            TabIndex        =   17
            TabStop         =   0   'False
            Tag             =   "vlDiaEuro"
            Top             =   975
            Width           =   2010
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   7
            Left            =   105
            Locked          =   -1  'True
            TabIndex        =   2
            TabStop         =   0   'False
            Tag             =   "vlDiaDolar"
            Top             =   975
            Width           =   2010
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   120
            Locked          =   -1  'True
            TabIndex        =   1
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   420
            Width           =   2550
         End
         Begin MSComctlLib.ListView lstResumenAsiento 
            Height          =   2910
            Left            =   165
            TabIndex        =   62
            Top             =   4080
            Width           =   10785
            _ExtentX        =   19024
            _ExtentY        =   5133
            View            =   3
            LabelEdit       =   1
            SortOrder       =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            OLEDragMode     =   1
            OLEDropMode     =   1
            FullRowSelect   =   -1  'True
            _Version        =   393217
            SmallIcons      =   "ImgListaEstadosCajaPuesto"
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
            NumItems        =   6
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Key             =   "cdConcepto"
               Object.Tag             =   "cdConcepto"
               Text            =   "Código"
               Object.Width           =   2
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Key             =   "dsConcepto"
               Object.Tag             =   "dsConcepto"
               Text            =   "Concepto"
               Object.Width           =   7056
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Key             =   "moneda"
               Object.Tag             =   "moneda"
               Text            =   "Moneda"
               Object.Width           =   1411
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Key             =   "vlImporte"
               Object.Tag             =   "vlImporte"
               Text            =   "Importe"
               Object.Width           =   2117
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Key             =   "tpOperacion"
               Object.Tag             =   "tpOperacion"
               Text            =   "Operación"
               Object.Width           =   3175
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Key             =   "tpCajaImputacion"
               Object.Tag             =   "tpCajaImputacion"
               Text            =   "a Caja"
               Object.Width           =   4762
            EndProperty
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Real"
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
            Index           =   13
            Left            =   4110
            TabIndex        =   71
            Top             =   750
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Registración Asiento"
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
            Index           =   12
            Left            =   165
            TabIndex        =   68
            Top             =   3825
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Ultima Modif."
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
            Index           =   16
            Left            =   6120
            TabIndex        =   65
            Top             =   750
            Width           =   1215
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Index           =   28
            Left            =   5070
            TabIndex        =   21
            Top             =   165
            Width           =   4050
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Euros"
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
            Index           =   4
            Left            =   2130
            TabIndex        =   20
            Top             =   735
            Width           =   1950
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Dolar u$s"
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
            Index           =   3
            Left            =   135
            TabIndex        =   16
            Top             =   735
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   255
            Index           =   0
            Left            =   105
            TabIndex        =   15
            Top             =   195
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Nro. de Puesto"
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
            Index           =   27
            Left            =   2655
            TabIndex        =   14
            Top             =   165
            Width           =   1965
         End
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   7365
      Left            =   -15
      TabIndex        =   7
      Top             =   660
      Width           =   11205
      Begin MSComctlLib.ImageList ImgListaEstadosCajaPuesto 
         Left            =   6600
         Top             =   3885
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
               Picture         =   "Frm_ResumenAsientoCP.frx":6C1E
               Key             =   "pendiente1"
               Object.Tag             =   "pendiente1"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":6DD0
               Key             =   "pendiente"
               Object.Tag             =   "pendiente"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":6F52
               Key             =   "agregado"
               Object.Tag             =   "agregado"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":7062
               Key             =   "rechazado"
               Object.Tag             =   "rechazado"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":71B4
               Key             =   "anulado"
               Object.Tag             =   "anulado"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":72C4
               Key             =   "aprobado"
               Object.Tag             =   "aprobado"
            EndProperty
         EndProperty
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2505
         TabIndex        =   22
         Top             =   1995
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   23
            Top             =   615
            Width           =   4575
            _ExtentX        =   8096
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label3 
            BackColor       =   &H80000005&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   26
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   25
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H80000005&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   24
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   5556
         TabIndex        =   3
         Top             =   300
         Width           =   5520
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   9330
         Top             =   4560
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
               Picture         =   "Frm_ResumenAsientoCP.frx":7416
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":7528
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":763A
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":774C
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":785E
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenAsientoCP.frx":7970
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   3405
         TabIndex        =   6
         Top             =   300
         Width           =   2085
         _ExtentX        =   3678
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
         TabIndex        =   5
         Top             =   315
         Width           =   3195
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   6015
         Left            =   135
         TabIndex        =   4
         Top             =   1155
         Width           =   10980
         _ExtentX        =   19368
         _ExtentY        =   10610
         View            =   3
         LabelEdit       =   1
         SortOrder       =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         FullRowSelect   =   -1  'True
         _Version        =   393217
         SmallIcons      =   "ImgListaEstadosCajaPuesto"
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrCaja"
            Text            =   "Caja"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dtApertura"
            Text            =   "Fecha Apertura"
            Object.Width           =   3705
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "dtCierre"
            Text            =   "Fecha Cierre"
            Object.Width           =   3705
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "nrPuesto"
            Text            =   "Puesto"
            Object.Width           =   1413
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2647
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "vlSaldoInicialPesos"
            Text            =   "Sdo Inicial"
            Object.Width           =   1942
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "tpEstadoAprobacion"
            Text            =   "Estado Modificación"
            Object.Width           =   4410
         EndProperty
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1290
         TabIndex        =   53
         Tag             =   "dtDesde"
         Top             =   705
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   121700353
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   3810
         TabIndex        =   54
         Tag             =   "dtHasta"
         Top             =   720
         Width           =   1785
         _ExtentX        =   3149
         _ExtentY        =   609
         _Version        =   393216
         Format          =   121700353
         CurrentDate     =   38267
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
         Index           =   19
         Left            =   3195
         TabIndex        =   56
         Top             =   810
         Width           =   645
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
         Index           =   18
         Left            =   90
         TabIndex        =   55
         Top             =   825
         Width           =   1200
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   5550
         TabIndex        =   12
         Top             =   75
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   8
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_ResumenAsientoCP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Const COLUMNA_ESTADO = 6
Const FONDO_FIJO_MINIMO = 1




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
            End If
        End If
    Next
        
        
    HabilitarCampos "vlFondoFijoPesos", False
    HabilitarCampos "vlFondoFijoDolares", False
    HabilitarCampos "vlFondoFijoEuros", False
                
        
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


Private Sub imprimirCajaTotales(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\" & "rpt_cierredecaja_imprimev4_9.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Cierre de Caja"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = ObtenerCampo("nrCaja").Text
    
    ' Aparece la venta original
    On Error Resume Next
    ' hacer dinamica la cantidad de copias
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
End Sub


Private Sub cmdImprimirTotales_Click()
    imprimirCajaTotales True
End Sub

 

Private Sub Form_Activate()

    Select Case EstadoABM
    Case alta
        ObtenerCampo("vlSaldoInicialPesos").SetFocus
    Case Else
        Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP")
        Case "CajaSinCerrar"
        Case "CerrarCaja"
            HabilitarCampos "dsDiferenciaDeCierre", True
            HabilitarCampos "vlSaldoFinalRealPesos", True
            HabilitarCampos "vlSaldoFinalRealDolares", True
            HabilitarCampos "vlSaldoFinalRealEuros", True
            ' version 2.7
            On Error Resume Next
              ObtenerCampo("vlSaldoFinalRealPesos").SetFocus
            On Error GoTo 0
        Case Else
            If Me.txtBusqueda.Visible Then
                On Error Resume Next
                Me.txtBusqueda.SetFocus
                On Error GoTo 0
            End If
        End Select
    End Select
    
    
    If objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa") = "SI" Then
            Me.cmbCampos.Text = "Nro. de Caja"
            Me.txtBusqueda.Text = objParametros.ObtenerValor("Frm_ResumenAsientoCP.nrCaja")
            txtBusqueda_KeyPress (13)
            lstBusqueda_DblClick
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

    
    ObtenerCampo("dtDesde") = DateAdd("d", -15, Date)
    ObtenerCampo("dtHasta") = Date
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    
    Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP")
    Case "Alta"
        EstadoABM = alta
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Agregar")
    Case "CerrarCaja"
        EstadoABM = CerrarCaja
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Seleccionar")
    Case "CajaSinCerrar"
        EstadoABM = cajasincerrar
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Seleccionar")
    Case Else
        tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
        EstadoABM = Consulta
        Me.cmbCampos.ListIndex = 0
    End Select
    
    Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
    Case "registracion_asiento"
        Me.Caption = "Registración " + Me.Caption + " - (" + objUsuario.dsUsuario + ") "
    Case "reversion_asiento"
        Me.Caption = "Reversión " + Me.Caption + " - (" + objUsuario.dsUsuario + ") "
    End Select
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Cajas"
    Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
    objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cajas")
    Do Until objDiccionariodeDatos.FindeCampos("TB_Cajas")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Cajas")
    Loop
    Me.cmbCampos.ListIndex = 0

End Sub


Private Sub CargarOperadoresAritmeticos()

    Me.ImageCombo1.ComboItems.Clear
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.Text
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
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave

    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            End If
        End If
    Next
    
    ObjTablasIO.setearCampoOperadorValor "flEstado", _
    "->", ""
    
    ObjTablasIO.Seleccionar
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cajas", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    objParametros.GrabarValor "flEstado", ObjTablasIO.rs_resultados("flEstado").value
    Me.check_estado.value = IIf(ObjTablasIO.rs_resultados("flEstado").value = True, vbChecked, vbUnchecked)
    
    If ObjTablasIO.rs_resultados("flEstado").value = False Then
        If objCajas.SumarCajaPuestos(ObjTablasIO.rs_resultados("nrCaja").value) Then
            ObtenerCampo("vlSaldoFinalPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalPesos", objCajas.vlSaldoFinalPesos)
            ObtenerCampo("vlSaldoFinalDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalDolares", objCajas.vlSaldoFinalDolares)
            ObtenerCampo("vlSaldoFinalEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalEuros", objCajas.vlSaldoFinalEuros)
        End If
        ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerValoresNumericos("vlSaldoFinalPesos")
        ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerValoresNumericos("vlSaldoFinalDolares")
        ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerValoresNumericos("vlSaldoFinalEuros")
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
        ' CalcularDiferencia
    End If

    ' EULISES
    If objParametros.ObtenerValor("Frm_ResumenAsientoCP") = "CerrarCaja" Or _
       objParametros.ObtenerValor("Frm_ResumenAsientoCP") = "CajaSinCerrar" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
               

    End If
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub




Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraABMCajas, Me.lstBusqueda
    

End Sub

Private Sub Frame1_DragDrop(Source As Control, x As Single, y As Single)

End Sub

Private Sub lstBusqueda_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    If lstBusqueda.SortKey = ColumnHeader.Index - 1 Then
        If lstBusqueda.SortOrder = lvwAscending Then
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
    
    Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
    Case "reversion_asiento"
        If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
    End Select
     
    Screen.ActiveForm.MousePointer = vbHourglass
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", Me.lstBusqueda.SelectedItem.Text
    
    
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                ObjTablasIO.setearCampoOperadorValor _
                Control.Tag, _
                "->", ""
            End If
        End If
    Next
    ObjTablasIO.setearCampoOperadorValor "flEstado", _
    "->", ""
    ObjTablasIO.Seleccionar
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cajas", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    Me.check_estado.value = IIf(ObjTablasIO.rs_resultados("flEstado").value = True, vbChecked, vbUnchecked)
    
    ' Verificar el estado de la caja
    If ObjTablasIO.rs_resultados("flEstado").value = False Then
        If objCajas.SumarCajaPuestos(ObjTablasIO.rs_resultados("nrCaja").value) Then
            '/* version 2.7 */
            ObtenerCampo("vlSaldoFinalPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalPesos", objCajas.vlSaldoFinalPesos)
            ObtenerCampo("vlSaldoFinalDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalDolares", objCajas.vlSaldoFinalDolares)
            ObtenerCampo("vlSaldoFinalEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalEuros", objCajas.vlSaldoFinalEuros)
            ObtenerCampo("vlSaldoFinalReales").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalReales", objCajas.vlSaldoFinalReales)
            '/* */
        End If
        ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerValoresNumericos("vlSaldoFinalPesos")
        ObtenerCampo("vlSaldoFinalRealReales").Text = ObtenerValoresNumericos("vlSaldoFinalReales")
        ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerValoresNumericos("vlSaldoFinalDolares")
        ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerValoresNumericos("vlSaldoFinalEuros")
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
        ObtenerCampo("vlSaldoFinalRealReales").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealReales", ObtenerCampo("vlSaldoFinalRealReales").Text)
        ' CalcularDiferencia
    End If
    
    If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                ObtenerCampo("dsObservacion").Locked = False
                ObtenerCampo("dsObservacion").BackColor = Blanco
                objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
    End If
    
    If objParametros.ObtenerValor("Frm_ResumenAsientoCP") = "Consulta" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
    End If
    
    Me.lstResumenAsiento.ListItems.Clear
    
    ' obtener los datos de la caja en cuestion
    objSPs.nmStoredProcedure = "SP_obtenerImputacion_v4_2"
    objSPs.setearCampoValor "@nrCaja_param", ObtenerCampo("nrCaja")
    objSPs.setearCampoValor "@AsientoModelo_param", "REGISTRACION_CAJA_PUESTO"
    If Not objSPs.ExecSP() Then
        MsgBox "Error al ejecutar el procedure SP_obtenerImputacion_v4_2, decripción: " + objSPs.Error, vbCritical + vbDefaultButton1, "Error"
        Exit Sub
    End If
    
    objControl.CargarListView_SG_conFORMATO objSPs.rs_resultados, Me.lstResumenAsiento, 0, "SP_obtenerImputacion_v4_2"
    
    Dim rsAux As Object
    
    Set rsAux = objSPs.rs_resultados.NextRecordset
    
    Me.lstResumenAsientoOcultos.ListItems.Clear
    
    objControl.CargarListView_SG_conFORMATO rsAux, Me.lstResumenAsientoOcultos, 0, "SP_obtenerImputacion_v3_7"
    
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    Screen.ActiveForm.MousePointer = vbDefault
    
    
End Sub



Private Sub lstBusqueda_GotFocus()

   Dim i As Integer
    
    i = Me.lstBusqueda.ListItems.Add(, , "").Index
    Me.lstBusqueda.ListItems.Remove i
    
End Sub

Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor                     As String
Dim l_strcajasaSincronizar       As String
Dim observaciones_sincronizar As String
Dim l_strWherecajasaSincronizar  As String
Dim resp                            As Byte


    objParametros.GrabarValor "Cancela", "SI"
    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
            lstBusqueda_DblClick
            If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                  ObtenerCampo("dsObservacion").Locked = False
                  ObtenerCampo("dsObservacion").BackColor = Blanco
                  objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
            End If
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
           Case "registracion_asiento"
                If Not realizarAsientodeCajaPuestoaCajaAdministracion() Then
                
                    If objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa") = "SI" Then
                            Unload Me
                    End If
                        
                    Exit Sub
                End If
           Case "reversion_asiento"
                If Not revertirAsientodeCajaPuestoaCajaAdministracion() Then
                
                    If objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa") = "SI" Then
                        Unload Me
                    End If

                    Exit Sub
                End If
           End Select
           
           If objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa") = "SI" Then
             Unload Me
             Exit Sub
           End If
           
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Button
    Case "Cancelar"

            If objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa") = "SI" Then
                Unload Me
                Exit Sub
            End If
           PresentarPantalla Button
    Case "Imprimir"
        ' If Me.check_estado.value = vbUnchecked Then
        '    Guardarregistro modificacion
        ' End If
        imprimirCaja True
    End Select
    
    
End Sub

Private Function revertirAsientodeCajaPuestoaCajaAdministracion() As Boolean
Dim resp As Byte

         resp = MsgBox("Esta seguro que desea realizar la reversión de la imputación de la caja puesto?", vbQuestion + vbYesNo, "Atención")
    
        If resp = vbNo Then Exit Function
    
      
     ' modificado en la version 3.2
      objMovimientos.nrCajaPuesto = ObtenerCampo("nrCaja")
      objMovimientos.nrCaja = objParametros.ObtenerValor("nrCaja")
      objMovimientos.dsUsuario = objUsuario.dsUsuario
      objMovimientos.dsUsuario_Supervisor = objSeguridad.objUsuarioSupervisor.dsUsuario
      
      If Not objMovimientos.revertirAsientodeCajaPuestoaCajaAdministracion() Then
        MsgBox objMovimientos.Error, vbCritical + vbDefaultButton1, "Atención"
        revertirAsientodeCajaPuestoaCajaAdministracion = False
      Else
        ' objbasededatos.CommitTrans
        revertirAsientodeCajaPuestoaCajaAdministracion = True
        resp = MsgBox("La desimputación se ha realizado con éxito. Desea modificar la caja ahora mismo?", vbQuestion + vbYesNo + vbDefaultButton1, "Atención")
        
        If resp = vbYes Then
            objParametros.GrabarValor "Frm_DetalleCajaPuesto.nrcajapuesto", ObtenerCampo("nrCaja")
            objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
            Unload Me
            On Error Resume Next
            Unload Frm_DetalleCajaPuesto
            On Error GoTo 0
            Frm_DetalleCajaPuesto.Show vbModal
            Exit Function
        End If
        
      End If
      
      objMovimientos.nrCajaPuesto = ""
      
End Function

Private Function realizarAsientodeCajaPuestoaCajaAdministracion() As Boolean
Dim resp As String

    realizarAsientodeCajaPuestoaCajaAdministracion = False
    
    resp = MsgBox("Esta seguro que desea realizar la imputación de la caja puesto?", vbQuestion + vbYesNo, "Atención")
    
    If resp = vbNo Then Exit Function
    
    objMovimientos.nrRecibo = ""
    objMovimientos.nrFactura = ""
    objMovimientos.dsProveedor = ""
    
    objMovimientos.nrCaja = objParametros.ObtenerValor("nrCaja")
    objMovimientos.dsUsuario = objUsuario.dsUsuario
    objMovimientos.dsUsuarioCajaPuesto = ObtenerCampo("dsUsuario")
    objMovimientos.nrCajaPuesto = ObtenerCampo("nrCaja").Text
    objMovimientos.dtMovimiento = objbasededatos.getDateasString()
    
    If Not objMovimientos.realizarAsientodeCajaPuestoaCajaAdministracion(Me.lstResumenAsiento, Me.lstResumenAsientoOcultos) Then
        MsgBox objMovimientos.Error, vbCritical, "Atención"
        Exit Function
    End If
    
    
    MsgBox "La imputación se ha realizado con éxito", vbInformation, "Atención"
    
    objMovimientos.nrRecibo = ""
    objMovimientos.nrFactura = ""
    objMovimientos.dsProveedor = ""
    objMovimientos.nrCaja = ""
    objMovimientos.dsUsuario = ""
    objMovimientos.dsUsuarioCajaPuesto = ""
    objMovimientos.nrCajaPuesto = ""
    objMovimientos.dtMovimiento = ""
    
    realizarAsientodeCajaPuestoaCajaAdministracion = True

End Function




' alta de cajas puestos desde la administracion
Private Function altadeCajaPuestodesdeLaAdministracion()

    If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Function
    objParametros.GrabarValor "frm_AltaCajaPuestodesdeADM.cajacreada", "NO"
    objParametros.GrabarValor "frm_AltaCajaPuestodesdeADM.cajacreada.nrcaja", ""
    frm_AltaCajaPuestodesdeADM.Show vbModal
    If objParametros.ObtenerValor("frm_AltaCajaPuestodesdeADM.cajacreada") = "SI" Then
        Me.txtBusqueda.Text = "*"
        txtBusqueda_KeyPress vbKeyReturn
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.nrcajapuesto", objParametros.ObtenerValor("frm_AltaCajaPuestodesdeADM.cajacreada.nrcaja")
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
        Frm_DetalleCajaPuesto.Show vbModal
    End If
    ' tomar la respuesta
    ' abrir la caja para modificación

    
End Function




Private Function ValidarEntrada() As Boolean
Dim vlFondoFijoPesos   As Single
Dim vlFondoFijoDolares As Single
Dim vlFondoFijoEuros   As Single
Dim bDiferencia        As Boolean
Dim resp               As Byte

    ValidarEntrada = False
    vlFondoFijoPesos = ObtenerCampo("vlFondoFijoPesos")
    vlFondoFijoDolares = ObtenerCampo("vlFondoFijoDolares")
    vlFondoFijoEuros = ObtenerCampo("vlFondoFijoEuros")
    
    If vlFondoFijoPesos + vlFondoFijoDolares + vlFondoFijoEuros <= FONDO_FIJO_MINIMO Then
        MsgBox "Debe completar los valores del fondo fijo que quedará para la próxima caja.", vbInformation + vbDefaultButton1, "Atención"
        AvisarError "vlFondoFijoPesos", True
        AvisarError "vlFondoFijoDolares", True
        AvisarError "vlFondoFijoEuros", True
        ObtenerCampo("vlFondoFijoPesos").SetFocus
        
        Exit Function
    End If
    
    bDiferencia = ExisteDiferencia()
    
    If bDiferencia Then
        resp = MsgBox("Existe una diferencia de caja. Desea cerrar la caja de todas maneras?", vbQuestion + vbYesNo + vbDefaultButton2, "Atención")
        If resp = vbNo Then
            AvisarError "vlSaldoFinalRealPesos", True
            AvisarError "vlSaldoFinalRealDolares", True
            AvisarError "vlSaldoFinalRealEuros", True
            Exit Function
        End If
    Else
        resp = MsgBox("Los valores ingresados son correctos. Esta segura que desea cerrar esta caja?", vbQuestion + vbYesNo, "Cierre de Caja")
        If resp = vbNo Then Exit Function
    End If
    
    ValidarEntrada = True

End Function



Private Sub marcarEstadosCajasPuestos()
Dim i As Integer
Dim j As Integer

    For i = 1 To Me.lstBusqueda.ListItems.Count
        Select Case Me.lstBusqueda.ListItems(i).SubItems(COLUMNA_ESTADO)
        Case "Pendiente"
            Me.lstBusqueda.ListItems(i).ForeColor = vbRed
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = vbRed
            Next
        Case "Aprobada"
            Me.lstBusqueda.ListItems(i).ForeColor = Verde
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Verde
            Next
        Case "Rechazada"
            Me.lstBusqueda.ListItems(i).ForeColor = Azul
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Azul
            Next
        Case "Modificando"
            Me.lstBusqueda.ListItems(i).ForeColor = Marron
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Marron
            Next
        End Select
        
    Next i
    

End Sub




Private Sub imprimirCaja(porpantalla As Boolean)

    If ObtenerCampo("nrCaja").Text = "" Then
        MsgBox "Debe seleccionar una caja", vbCritical, "Atención"
    End If
    
    objSPs.nmStoredProcedure = "SP_ObtenerResumenCajaPuesto_v3_7"
    objSPs.setearCampoValor "@nrCaja", ObtenerCampo("nrCaja").Text
    
    If Not objSPs.ExecSP Then
        MsgBox "ERROR no se puede mostrar este informe, function: SP_ObtenerResumenCajaPuesto error extendido:" + objSPs.Error, vbCritical, "Atención"
        Exit Sub
    End If
    
    Frm_Principal.LimpiarReporte
    
    Select Case objUsuario.tpAcceso
    Case "Puestos"
        '******************************************************************************
        ' Versión 2.7
        ' Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "rpt_cierredecaja_imprime.rpt"
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_cierredecaja_imprime_valores_v4_1.rpt"
        '******************************************************************************
    Case Else
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\" + "rpt_cierredecaja_imprime_valores_v4_1.rpt"
    End Select
    
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Movimiento de una Caja"
    Frm_Principal.CrystalReport1.Formulas(0) = "nrCajaManual = '" + ObtenerCampo("nrCaja").Text + "'"
    
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
    
    ' Frm_Principal.LimpiarReporte

    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes + "\rpt_ComprobantesManuales_cajapuesto_v3_7.rpt"
    
    
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = "Comprobantes Manuales - Caja Nro: " + ObtenerCampo("nrCaja").Text
    Frm_Principal.CrystalReport1.StoredProcParam(0) = ObtenerCampo("nrCaja").Text
    Frm_Principal.CrystalReport1.Formulas(0) = ""
        
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
        MsgBox "ERROR: " + Err.Description + " -  Nombre del reporte:  " + Frm_Principal.CrystalReport1.ReportFileName, vbInformation + vbDefaultButton1, "Atención"
    End If
    On Error GoTo 0
    
    
End Sub


Private Sub ExportaraExcel()
Dim strError  As String

    
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Cajas") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbCritical + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Cajas"
        ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
        If ObjTablasIO.Eliminar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As String

    Guardarregistro = False

    If EstadoABM = alta Then
        objSPs.nmStoredProcedure = "SP_ObtenerMaxnrCaja_v2_8"
        objSPs.setearCampoValor "@nrPuesto", objParametros.ObtenerValor("nrPuesto")
        If Not objSPs.ExecSP() Then
            MsgBox "ERROR: " + objSPs.Error, vbCritical, "Atención"
            Exit Function
        End If
        strValor = objSPs.rs_resultados("MaxnrCaja")
        objDiccionariodeDatos.GuardarValorCampo _
                "TB_Cajas", "nrCaja", _
                ObtenerCampo("nrPuesto").Text, strValor
        ObtenerCampo("nrCaja").Text = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
    End If
    
    ObjTablasIO.nmTabla = "TB_Cajas"
    

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

    Select Case EstadoABM
    Case cajasincerrar, modificacion
            ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()
            ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                Guardarregistro = True
            End If
    Case alta
            ObjTablasIO.setearCampoOperadorValor "flSincronizado", "<-", "0"
            ObjTablasIO.setearCampoOperadorValor "hrApertura", "<-", CStr(Format(Now, "HH:MM"))
            
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objParametros.GrabarValor "CajaAbierta", "SI"
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cajas", "nrCaja", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case CerrarCaja
    
            ObjTablasIO.setearCampoOperadorValor "flEstado", "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "hrCierre", "<-", CStr(Format(Now, "HH:MM"))
            ObjTablasIO.setearCampoOperadorValor "nrCaja", "=", ObtenerCampo("nrCaja").Text
            
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                Dim bDiferencia As Boolean
                bDiferencia = ExisteDiferencia()
                HabilitarCampos "vlSaldoFinalRealPesos", False
                HabilitarCampos "vlSaldoFinalRealDolares", False
                HabilitarCampos "vlSaldoFinalRealEuros", False
                HabilitarCampos "vlFondoFijoPesos", False
                HabilitarCampos "vlFondoFijoDolares", False
                HabilitarCampos "vlFondoFijoEuros", False
                If bDiferencia Then
                    MsgBox "La caja ha sido cerrada con diferencia.", vbInformation + vbDefaultButton1, "Atención"
                Else
                    MsgBox "La caja ha sido cerrada con éxito.", vbInformation + vbDefaultButton1, "Atención"
                End If
                Sleep (1000)
                MsgBox "Verifique la alimentación de hojas de papel de la impresora.", vbInformation + vbDefaultButton1, "Impresión del cierre de caja"
                '*********************************************
                '* Version 2.7
                '* imprimirCaja False
                objParametros.GrabarValor "Frm_ResumenAsientoCPPuesto.nrCaja", ObtenerCampo("nrCaja").Text
                impresion.imprimirCierreCajaPuesto False
                objParametros.GrabarValor "Frm_ResumenAsientoCPPuesto.nrCaja", ""
                '*********************************************
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "vlSaldoInicialPesos", True
           HabilitarCampos "vlSaldoInicialEuros", True
           HabilitarCampos "vlSaldoInicialDolares", True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
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
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMCajas.Visible = False
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
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
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
        
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)

         ObjTablasIO.nmTabla = "VW_CajasPuestos_v2_9"
         
         If objConfig.nrPuesto = "9" Then
            ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9", "AND"
         Else
            ObjTablasIO.setearCampoOperadorValor "tpAcceso", "=", "Puestos", "AND"
         End If
         
         ' se acuerdo a que se desea como funcion obtengo la seleccion
         Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
         Case "registracion_asiento"
              ' filtros de las cajas disponibles para registracion
             ObjTablasIO.setearCampoOperadorValor "flImputado", "=", "0", "AND"
         Case "reversion_asiento"
             ObjTablasIO.setearCampoOperadorValor "flImputado", "=", "1", "AND"
         End Select
         
         
         ObjTablasIO.setearCampoOperadorValor "flestado", "=", "1", "AND"
         
         ' -- agregado en la version 2.5
         Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
         Case "cajas_modificadas_adm"
            ObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "is not null", "", " AND "
         End Select
        
         Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.registracion_directa")
         Case "SI"
         Case Else
            ObjTablasIO.setearCampoOperadorValor "dtApertura", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
            ObjTablasIO.setearCampoOperadorValor "dtApertura", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59"), " AND "
         End Select
        
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "VW_CajasPuestos_v2_9", Me.cmbCampos.Text
         ' Filtros por nivel de Acceso
         Select Case objUsuario.tpAcceso
         Case "Puestos"
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND "
            ' si es un Puesto y usuario Comun FALTA PROGRAMAR
            ObjTablasIO.setearCampoOperadorValor "dsUsuario", "=", objUsuario.dsUsuario
         Case Else
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, ""
         End Select
        
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.List(n)
                If objDiccionariodeDatos.nmCampo = "dtApertura" Then
                    ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, "->", "", , "DESC"
                Else
                    ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                    "->", ""
                End If
         Next
         
         ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flSincronizado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cajas"
            
             ' -- agregado en la version 2.5
             'Select Case objParametros.ObtenerValor("Frm_ResumenAsientoCP.modo")
             'Case "cajas_modificadas_adm"
                marcarEstadosCajasPuestos
             'End Select
    
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            ' MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", Me.txtBusqueda, KeyAscii)
    End If
    
    Screen.ActiveForm.MousePointer = vbDefault

    
End Sub

Private Sub CalcularDiferencia()
Dim vlTotalSaldoFinal     As Single
Dim vlTotalSaldoFinalReal As Single

    
    ObtenerCampo("vlTotalSaldoFinal").Text = ObtenerPesos("vlTotalSaldoFinal")
    ObtenerCampo("vlTotalSaldoFinalReal").Text = ObtenerPesos("vlTotalSaldoFinalReal")
    ObtenerCampo("vlTotalSaldoFinal").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlTotalSaldoFinal", ObtenerCampo("vlTotalSaldoFinal").Text)
    ObtenerCampo("vlTotalSaldoFinalReal").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlTotalSaldoFinalReal", ObtenerCampo("vlTotalSaldoFinalReal").Text)
    vlTotalSaldoFinal = ObtenerValoresNumericos("vlTotalSaldoFinal")
    vlTotalSaldoFinalReal = ObtenerValoresNumericos("vlTotalSaldoFinalReal")
    ObtenerCampo("vlTotalSaldoCierre").Text = ObtenerPesos("vlTotalSaldoCierre")
    ObtenerCampo("vlDiferenciaDeCierre").Text = vlTotalSaldoFinal - vlTotalSaldoFinalReal
    ObtenerCampo("vlDiferenciaDeCierre").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlDiferenciaDeCierre", ObtenerCampo("vlDiferenciaDeCierre").Text)
    ObtenerCampo("vlCierrePesos").Text = ObtenerValoresNumericos("vlSaldoFinalRealPesos") - ObtenerValoresNumericos("vlSaldoInicialPesos")
    ObtenerCampo("vlCierreDolares").Text = ObtenerValoresNumericos("vlSaldoFinalRealDolares") - ObtenerValoresNumericos("vlSaldoInicialDolares")
    ObtenerCampo("vlCierreEuros").Text = ObtenerValoresNumericos("vlSaldoFinalRealEuros") - ObtenerValoresNumericos("vlSaldoInicialEuros")
    ObtenerCampo("vlCierreReales").Text = ObtenerValoresNumericos("vlSaldoFinalRealReales") - ObtenerValoresNumericos("vlSaldoInicialReales")
    
    
    ObtenerCampo("vlCierrePesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierrePesos", ObtenerCampo("vlCierrePesos").Text)
    ObtenerCampo("vlCierreDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreDolares", ObtenerCampo("vlCierreDolares").Text)
    ObtenerCampo("vlCierreEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreEuros", ObtenerCampo("vlCierreEuros").Text)
    ObtenerCampo("vlCierreEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreEuros", ObtenerCampo("vlCierreEuros").Text)
    ObtenerCampo("vlCierreReales").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlCierreReales", ObtenerCampo("vlCierreReales").Text)
    


End Sub



Private Function ObtenerValoresNumericos(pTag As String) As Single

    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerValoresNumericos = 0
    Else
        ObtenerValoresNumericos = CSng(ObtenerCampo(pTag).Text)
    End If
    
End Function


Private Function ObtenerPesos(pTag As String) As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single
Dim vlDiaReal  As Single

    vlDiaEuro = CSng(ObtenerCampo("vlDiaEuro").Text)
    vlDiaDolar = CSng(ObtenerCampo("vlDiaDolar").Text)
    vlDiaReal = CSng(ObtenerCampo("vlDiaReal").Text)


    If Trim(ObtenerCampo(pTag).Text) = "" Then
        ObtenerPesos = 0
    Else
        Select Case pTag
        Case "vlTotalSaldoFinalReal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealReales") * vlDiaReal
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
        Case "vlTotalSaldoFinal"
            ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalReales") * vlDiaReal
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalPesos")
        Case "vlTotalSaldoCierre"
            ObtenerPesos = ObtenerValoresNumericos("vlCierreEuros") * vlDiaEuro
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierreDolares") * vlDiaDolar
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierreReales") * vlDiaReal
            ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierrePesos")
        End Select
    End If
    
End Function



Private Sub txtFields_Change(Index As Integer)


If Me.txtFields(Index).Tag <> "" Then
    Select Case Me.txtFields(Index).Tag
    Case "vlSaldoFinalRealPesos", "vlSaldoFinalRealDolares", "vlSaldoFinalRealEuros"
        AvisarError "vlSaldoFinalRealPesos", False
        AvisarError "vlSaldoFinalRealDolares", False
        AvisarError "vlSaldoFinalRealEuros", False
    Case "vlFondoFijoPesos", "vlFondoFijoDolares", "vlFondoFijoEuros"
        AvisarError "vlFondoFijoPesos", False
        AvisarError "vlFondoFijoDolares", False
        AvisarError "vlFondoFijoEuros", False
    End Select
End If

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                                  Me.txtFields(Index), "GotFocus"
        If Not Me.check_estado.value = vbChecked Then
               ' CalcularDiferencia
        End If
 
    End If


End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
       If Me.txtFields(Index).Tag <> "" Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", _
                            Me.txtFields(Index), KeyAscii)
       End If
    End If
    
End Sub



Private Sub txtFields_LostFocus(Index As Integer)
    
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                              Me.txtFields(Index), "LostFocus"
    End If

End Sub

Private Sub ActualizarObservacionCaja()

    ObtenerCampo("dtObservacion").Text = Now()
    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", ObtenerCampo("dsObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "dtObservacion", "<-", ObtenerCampo("dtObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.Actualizar
    
   
End Sub



Private Function ObtenerPesosSaldoSistema() As Single
Dim vlDiaEuro  As Single
Dim vlDiaDolar As Single

        vlDiaEuro = CSng(ObtenerCampo("vlDiaEuro").Text)
        vlDiaDolar = CSng(ObtenerCampo("vlDiaDolar").Text)
        
        ObtenerPesosSaldoSistema = objCajas.vlSaldoFinalEuros * vlDiaEuro
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalDolares * vlDiaDolar
        ObtenerPesosSaldoSistema = ObtenerPesosSaldoSistema + objCajas.vlSaldoFinalPesos

End Function




Private Function ExisteDiferencia() As Boolean
Dim vlTotalSaldoFinal     As Single
Dim vlTotalSaldoFinalReal As Single

    ' Calculamos los datos del sistema
    objCajas.SumarCajaPuestos (objParametros.ObtenerValor("Frm_ResumenAsientoCP.nrCaja"))

    ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)

    If CDbl(FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)) = CDbl(FormatNumber(ObtenerPesosSaldoSistema(), 2)) Then
        ObtenerCampo("vlDiferenciaDeCierre").ForeColor = vbBlack
        ObtenerCampo("vlDiferenciaDeCierre").Text = FormatNumber("0", 2)
        ObtenerCampo("dsDiferenciaDeCierre").Text = ""
        ExisteDiferencia = False
    Else
        If ObtenerPesosSaldoSistema() > ObtenerPesos("vlTotalSaldoFinalReal") Then
            ObtenerCampo("vlDiferenciaDeCierre").ForeColor = Rojo
            ObtenerCampo("dsDiferenciaDeCierre").Text = "Faltante de dinero"
        Else
            ObtenerCampo("vlDiferenciaDeCierre").ForeColor = vbBlack
            ObtenerCampo("dsDiferenciaDeCierre").Text = "Sobrante de dinero"
        End If
        ObtenerCampo("vlDiferenciaDeCierre").Text = FormatNumber(ObtenerPesosSaldoSistema(), 2) - ObtenerPesos("vlTotalSaldoFinalReal")
        ExisteDiferencia = True
    End If

End Function



Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Not ObtenerCampo(nmCampo).Locked Then
        If Error Then
              ObtenerCampo(nmCampo).BackColor = Rojo
        Else
              ObtenerCampo(nmCampo).BackColor = Blanco
        End If
    End If
    
End Sub
