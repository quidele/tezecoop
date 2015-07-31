VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form frm_ABMCaja 
   Caption         =   "Manejo de Cajas"
   ClientHeight    =   8280
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10620
   Icon            =   "Frm_ABMCaja.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8280
   ScaleWidth      =   10620
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   72
      Top             =   0
      Width           =   10620
      _ExtentX        =   18733
      _ExtentY        =   1164
      ButtonWidth     =   2805
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMCajasResaltado"
      HotImageList    =   "imgABMCajasResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   12
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
            Caption         =   "Aprob/Rech/Ver"
            Key             =   "Aprobar_ver"
            ImageKey        =   "Aprobar_ver"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Caja"
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
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "Arreglar"
            Key             =   "Arreglar"
            ImageKey        =   "Arreglar"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Detalle Viajes(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ABMCaja.frx":030A
      Begin MSComctlLib.ImageList imgABMCajas 
         Left            =   9015
         Top             =   60
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
               Picture         =   "Frm_ABMCaja.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0584
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":06D8
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":07F0
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":08FC
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0A50
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":0B58
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":11D4
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":1334
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":1788
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":1BDC
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2256
               Key             =   "arreglar"
               Object.Tag             =   "arreglar"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":26A8
               Key             =   "calcu"
               Object.Tag             =   "calcu"
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":29C2
               Key             =   "asiento"
               Object.Tag             =   "asiento"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMCajasResaltado 
         Left            =   1
         Top             =   1
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
               Picture         =   "Frm_ABMCaja.frx":2CDC
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":2DF8
               Key             =   "Sincronizar"
               Object.Tag             =   "Sincronizar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":407A
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":41CE
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":42DE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":43E0
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":4534
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":4640
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":4CBC
               Key             =   "Aprobar_ver"
               Object.Tag             =   "Aprobar_ver"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":4E24
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":5278
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":56CC
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":5D46
               Key             =   "Arreglar"
               Object.Tag             =   "Arreglar"
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":6198
               Key             =   "calcu"
               Object.Tag             =   "calcu"
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":64B2
               Key             =   "asientos"
               Object.Tag             =   "asientos"
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":67CC
               Key             =   "registracion"
               Object.Tag             =   "registracion"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMCajas 
      BorderStyle     =   0  'None
      Height          =   7575
      Left            =   15
      TabIndex        =   0
      Top             =   660
      Width           =   10560
      Begin VB.Frame fra_valores 
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   0  'None
         Height          =   2925
         Left            =   1380
         TabIndex        =   32
         Top             =   2565
         Width           =   8280
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   19
            Left            =   3000
            Locked          =   -1  'True
            TabIndex        =   79
            Tag             =   "vlSaldoFinalRealDolares"
            Top             =   1095
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   18
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   78
            TabStop         =   0   'False
            Tag             =   "vlCierreDolares"
            Top             =   1095
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   17
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   77
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalDolares"
            Top             =   1095
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   16
            Left            =   705
            Locked          =   -1  'True
            TabIndex        =   76
            Tag             =   "vlSaldoInicialDolares"
            Top             =   1110
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8,25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   15
            Left            =   5295
            TabIndex        =   75
            Tag             =   "vlFondoFijoDolares"
            Top             =   1095
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8,25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   12
            Left            =   5295
            TabIndex        =   69
            Tag             =   "vlFondoFijoPesos"
            Top             =   450
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8,25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   4
            Left            =   5295
            TabIndex        =   70
            Tag             =   "vlFondoFijoReales"
            Top             =   765
            Width           =   1230
         End
         Begin VB.TextBox txtFields 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8,25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   1
            Left            =   5295
            TabIndex        =   71
            Tag             =   "vlFondoFijoEuros"
            Top             =   1425
            Width           =   1230
         End
         Begin VB.CommandButton cmdImprimirTotales 
            Caption         =   "Imprimir Totales"
            Height          =   468
            Left            =   6675
            TabIndex        =   63
            Top             =   480
            Width           =   852
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
            TabIndex        =   11
            Tag             =   "vlSaldoInicialReales"
            Top             =   780
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
            TabIndex        =   10
            Tag             =   "vlSaldoInicialPesos"
            Top             =   456
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
            TabIndex        =   12
            Tag             =   "vlSaldoInicialEuros"
            Top             =   1440
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
            TabIndex        =   46
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalReales"
            Top             =   768
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
            TabIndex        =   45
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalPesos"
            Top             =   435
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   13
            Left            =   105
            Locked          =   -1  'True
            TabIndex        =   44
            TabStop         =   0   'False
            Tag             =   "dsDiferenciaDeCierre"
            Top             =   2505
            Width           =   3975
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
            TabIndex        =   43
            TabStop         =   0   'False
            Tag             =   "vlCierrePesos"
            Top             =   444
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   209
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   42
            TabStop         =   0   'False
            Tag             =   "vlCierreReales"
            Top             =   768
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   202
            Left            =   1848
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalEuros"
            Top             =   1425
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   210
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   40
            TabStop         =   0   'False
            Tag             =   "vlCierreEuros"
            Top             =   1425
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   207
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   39
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinalReal"
            Top             =   1785
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   206
            Left            =   3000
            Locked          =   -1  'True
            TabIndex        =   38
            Tag             =   "vlSaldoFinalRealEuros"
            Top             =   1425
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   205
            Left            =   2988
            Locked          =   -1  'True
            TabIndex        =   37
            Tag             =   "vlSaldoFinalRealReales"
            Top             =   768
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
            TabIndex        =   36
            TabStop         =   0   'False
            Tag             =   "vlSaldoFinalRealPesos"
            Top             =   444
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   203
            Left            =   1848
            Locked          =   -1  'True
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinal"
            Top             =   1785
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   21
            Left            =   4185
            Locked          =   -1  'True
            TabIndex        =   34
            TabStop         =   0   'False
            Tag             =   "vlDiferenciaDeCierre"
            Top             =   2505
            Width           =   1080
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   211
            Left            =   4140
            Locked          =   -1  'True
            TabIndex        =   33
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoCierre"
            Top             =   1785
            Width           =   1100
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "U$s"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   19
            Left            =   90
            TabIndex        =   80
            Top             =   1155
            Width           =   585
         End
         Begin VB.Label lblFondoFijo 
            BackColor       =   &H00FFC0C0&
            Caption         =   "Fondo Fijo próxima Caja"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   5205
            TabIndex        =   68
            Top             =   150
            Width           =   2325
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Saldo"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   14
            Left            =   84
            TabIndex        =   62
            Top             =   240
            Width           =   588
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Euros"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            Left            =   90
            TabIndex        =   61
            Top             =   1500
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Reales"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   5
            Left            =   90
            TabIndex        =   60
            Top             =   825
            Width           =   585
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Pesos"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   9
            Left            =   84
            TabIndex        =   59
            Top             =   504
            Width           =   600
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Inicial"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   1
            Left            =   684
            TabIndex        =   58
            Top             =   228
            Width           =   1128
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Motivo en Diferencia de Cierre"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   7
            Left            =   150
            TabIndex        =   52
            Top             =   2220
            Width           =   2880
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Diferencia"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   8
            Left            =   4185
            TabIndex        =   51
            Top             =   2265
            Width           =   1125
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Sup."
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   2
            Left            =   1872
            TabIndex        =   50
            Top             =   216
            Width           =   1080
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Cierre"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   10
            Left            =   4200
            TabIndex        =   49
            Top             =   216
            Width           =   1056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Final Real"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   276
            Index           =   11
            Left            =   3060
            TabIndex        =   48
            Top             =   216
            Width           =   1056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Totales Pesificados"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   15
            Left            =   90
            TabIndex        =   47
            Top             =   1800
            Width           =   1710
         End
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   7050
         Left            =   105
         ScaleHeight     =   7020
         ScaleWidth      =   10335
         TabIndex        =   14
         Top             =   90
         Width           =   10365
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   14
            Left            =   6540
            Locked          =   -1  'True
            TabIndex        =   73
            TabStop         =   0   'False
            Tag             =   "vlDiaReal"
            Top             =   2100
            Width           =   2430
         End
         Begin VB.Frame fra_comentarios 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   1365
            Left            =   1290
            TabIndex        =   53
            Top             =   5490
            Width           =   5328
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   24
               Left            =   1260
               Locked          =   -1  'True
               TabIndex        =   55
               TabStop         =   0   'False
               Tag             =   "dtObservacion"
               Top             =   930
               Width           =   3945
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               Height          =   765
               Index           =   25
               Left            =   1284
               Locked          =   -1  'True
               MultiLine       =   -1  'True
               ScrollBars      =   2  'Vertical
               TabIndex        =   54
               TabStop         =   0   'False
               Tag             =   "dsObservacion"
               Top             =   30
               Width           =   3945
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Ultima Modif."
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8,25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   240
               Index           =   16
               Left            =   45
               TabIndex        =   57
               Top             =   975
               Width           =   1215
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Observación"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8,25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   240
               Index           =   17
               Left            =   45
               TabIndex        =   56
               Top             =   90
               Width           =   1215
            End
         End
         Begin VB.CheckBox check_estado 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Check1"
            ForeColor       =   &H80000008&
            Height          =   405
            Left            =   945
            TabIndex        =   26
            Top             =   6360
            Visible         =   0   'False
            Width           =   300
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   22
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   960
            Width           =   5130
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   390
            Width           =   2445
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   6
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   20
            TabStop         =   0   'False
            Tag             =   "dtCierre"
            Top             =   1500
            Width           =   2445
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   8
            Left            =   3990
            Locked          =   -1  'True
            TabIndex        =   19
            TabStop         =   0   'False
            Tag             =   "vlDiaEuro"
            Top             =   2100
            Width           =   2430
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   7
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   3
            TabStop         =   0   'False
            Tag             =   "vlDiaDolar"
            Top             =   2100
            Width           =   2550
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   5
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   2
            TabStop         =   0   'False
            Tag             =   "dtApertura"
            Top             =   1512
            Width           =   2580
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1305
            Locked          =   -1  'True
            TabIndex        =   1
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   390
            Width           =   2550
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Real"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   18
            Left            =   6540
            TabIndex        =   74
            Top             =   1875
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Usuario"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   28
            Left            =   1308
            TabIndex        =   25
            Top             =   708
            Width           =   4056
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   252
            Index           =   13
            Left            =   3996
            TabIndex        =   24
            Top             =   1272
            Width           =   1980
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Euros"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   4
            Left            =   3996
            TabIndex        =   23
            Top             =   1872
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Dolar u$s"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   3
            Left            =   1308
            TabIndex        =   18
            Top             =   1848
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fecha de Apertura"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   12
            Left            =   1308
            TabIndex        =   17
            Top             =   1272
            Width           =   1968
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   255
            Index           =   0
            Left            =   1290
            TabIndex        =   16
            Top             =   150
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Nro. de Puesto"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8,25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   27
            Left            =   3990
            TabIndex        =   15
            Top             =   135
            Width           =   1965
         End
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   7290
      Left            =   -45
      TabIndex        =   8
      Top             =   645
      Width           =   10605
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
               Picture         =   "Frm_ABMCaja.frx":6C1E
               Key             =   "pendiente1"
               Object.Tag             =   "pendiente1"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":6DD0
               Key             =   "pendiente"
               Object.Tag             =   "pendiente"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":6F52
               Key             =   "agregado"
               Object.Tag             =   "agregado"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":7062
               Key             =   "rechazado"
               Object.Tag             =   "rechazado"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":71B4
               Key             =   "anulado"
               Object.Tag             =   "anulado"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":72C4
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
         TabIndex        =   27
         Top             =   1995
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   28
            Top             =   615
            Width           =   4575
            _ExtentX        =   8096
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   31
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   30
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   29
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   5595
         TabIndex        =   4
         Top             =   300
         Width           =   4395
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
               Picture         =   "Frm_ABMCaja.frx":7416
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":7528
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":763A
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":774C
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":785E
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCaja.frx":7970
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   3405
         TabIndex        =   7
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
         TabIndex        =   6
         Top             =   315
         Width           =   3195
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5370
         Left            =   150
         TabIndex        =   5
         Top             =   1200
         Width           =   9810
         _ExtentX        =   17304
         _ExtentY        =   9472
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
            Size            =   8,25
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
            Object.Tag             =   "vlDiferenciaDeCierre"
            Text            =   "Diferencia"
            Object.Width           =   1940
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
         Left            =   1410
         TabIndex        =   64
         Tag             =   "dtDesde"
         Top             =   705
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   635
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Index           =   1
         Left            =   3930
         TabIndex        =   65
         Tag             =   "dtHasta"
         Top             =   735
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin VB.Label lblFechaHasta 
         Caption         =   "Hasta"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3195
         TabIndex        =   67
         Top             =   810
         Width           =   645
      End
      Begin VB.Label lblFechadesde 
         Caption         =   "Fecha Desde"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8,25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   90
         TabIndex        =   66
         Top             =   825
         Width           =   1200
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   5550
         TabIndex        =   13
         Top             =   75
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   9
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "frm_ABMCaja"
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
    HabilitarCampos "vlFondoFijoReales", False
    
        
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
    ' Debug.Assert "hola"
    
End Function




Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub


Private Sub imprimirCajaTotales(porpantalla As Boolean)

    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\" & "rpt_cierredecaja_imprimev3_7.rpt"
    
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
     If Me.check_estado.value = vbUnchecked Then
           Guardarregistro modificacion
     End If
    imprimirCajaTotales True
End Sub

 

Private Sub Form_Activate()

    Select Case EstadoABM
    Case alta
        ObtenerCampo("vlSaldoInicialPesos").SetFocus
    Case Else
        Select Case objParametros.ObtenerValor("frm_ABMCaja")
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

    Me.Caption = Me.Caption + " - (" + objUsuario.dsUsuario + ") "
    
    ObtenerCampo("dtDesde") = DateAdd("d", -15, Date)
    ObtenerCampo("dtHasta") = Date
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    
    Select Case objParametros.ObtenerValor("frm_ABMCaja")
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
        CalcularDiferencia
    End If

    ' EULISES
    If objParametros.ObtenerValor("Frm_ABMCaja") = "CerrarCaja" Or _
       objParametros.ObtenerValor("Frm_ABMCaja") = "CajaSinCerrar" Then
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
            '/* */
        End If
        ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerValoresNumericos("vlSaldoFinalPesos")
        ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerValoresNumericos("vlSaldoFinalDolares")
        ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerValoresNumericos("vlSaldoFinalEuros")
        ObtenerCampo("vlSaldoFinalRealReales").Text = ObtenerValoresNumericos("vlSaldoFinalReales")
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
        ObtenerCampo("vlSaldoFinalRealReales").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealReales", ObtenerCampo("vlSaldoFinalRealReales").Text)
        
        CalcularDiferencia
    End If
    
    If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                ObtenerCampo("dsObservacion").Locked = False
                ObtenerCampo("dsObservacion").BackColor = Blanco
                objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
    End If
    
    If objParametros.ObtenerValor("Frm_ABMCaja") = "Consulta" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
    End If
    
    '/* version 2.7 */
    'If StrComp(objUsuario.tpAcceso, "Puestos", vbTextCompare) = 0 Then
    '      fra_comentarios.Top = fra_valores.Top
    '      fra_valores.Visible = False
    '      fra_valores.Visible = False
    '      fra_comentarios.Visible = True
    'Else
          fra_comentarios.Visible = True
          fra_valores.Visible = True
    ' End If
    
    
    
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
            Select Case objParametros.ObtenerValor("frm_ABMCaja")
            Case "CerrarCaja"
                BusquedaporClave objParametros.ObtenerValor("nrCaja")
                '/*****************************************************/
                '/* version 2.7
                ' habilitamos los campos de los valores del fondo fijo
                ObtenerCampo("vlFondoFijoPesos") = ObtenerCampo("vlSaldoInicialPesos")
                ObtenerCampo("vlFondoFijoDolares") = ObtenerCampo("vlSaldoInicialDolares")
                ObtenerCampo("vlFondoFijoEuros") = ObtenerCampo("vlSaldoInicialEuros")
                
                HabilitarCampos "vlFondoFijoPesos", True
                HabilitarCampos "vlFondoFijoDolares", True
                HabilitarCampos "vlFondoFijoEuros", True
                '/*****************************************************/
                EstadoABM = CerrarCaja
                PresentarPantalla Button
            Case "CajaSinCerrar"
                BusquedaporClave objParametros.ObtenerValor("nrCaja")
                EstadoABM = cajasincerrar
                PresentarPantalla Button
            Case Else
                EstadoABM = Consulta
                ' Pasar datos
                lstBusqueda_DblClick
            End Select
            
            If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                  ObtenerCampo("dsObservacion").Locked = False
                  ObtenerCampo("dsObservacion").BackColor = Blanco
                  objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
            End If
    Case "Agregar"

           
       
           
           If objParametros.ObtenerValor("frm_ABMCaja.modo") <> "cajas_modificadas_adm" Then
                If objUsuario.tpAcceso = "Administración" Then
                    ' alta de cajas puestos desde la administración
                    altadeCajaPuestodesdeLaAdministracion
                    Exit Sub
                End If
                
           End If
           
           EstadoABM = alta
           limpiarControles
           
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cajas", "nrCaja", objConfig.nrPuesto)
           ObtenerCampo("nrCaja").Text = strValor
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
           ObtenerCampo("vlDiaDolar").Text = objConfig.vlDiaDolar
           ObtenerCampo("vlDiaEuro").Text = objConfig.vlDiaEuro
           ObtenerCampo("vlDiaReal").Text = objConfig.vlDiaReal
           ObtenerCampo("dtApertura").Text = Now()
           Me.fra_valores.Visible = True
           PresentarPantalla Button
           objCajas.ObtenerFondoCajaAnterior (objConfig.nrPuesto)
           ObtenerCampo("vlSaldoInicialPesos").Text = FormatNumber(objCajas.vlFondoFijoPesos, 2)
           ObtenerCampo("vlSaldoInicialDolares").Text = FormatNumber(objCajas.vlFondoFijoDolares, 2)
           ObtenerCampo("vlSaldoInicialEuros").Text = FormatNumber(objCajas.vlFondoFijoEuros, 2)
           ObtenerCampo("vlSaldoInicialReales").Text = FormatNumber(objCajas.vlFondoFijoReales, 2)
           
           ObtenerCampo("vlSaldoFinalPesos").Text = FormatNumber(objCajas.vlFondoFijoPesos, 2)
           ObtenerCampo("vlSaldoFinalDolares").Text = FormatNumber(objCajas.vlFondoFijoDolares, 2)
           ObtenerCampo("vlSaldoFinalEuros").Text = FormatNumber(objCajas.vlFondoFijoEuros, 2)
           ObtenerCampo("vlSaldoFinalReales").Text = FormatNumber(objCajas.vlFondoFijoReales, 2)
               
           ' ObtenerCampo("vlSaldoFinalRealPesos").Text = objCajas.vlFondoFijoPesos
           ' ObtenerCampo("vlSaldoFinalRealDolares").Text = objCajas.vlFondoFijoDolares
           ' ObtenerCampo("vlSaldoFinalRealEuros").Text = objCajas.vlFondoFijoEuros
           
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                PresentarPantalla Button
           End If
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
                If EstadoABM = CerrarCaja Then
                    '/* version 2.7 */
                    ' Realizar validaciones
                    ' validar la introduccion de los valores del fondo fijo
                    ' validar la diferencias
                    If Not ValidarEntrada() Then
                        Exit Sub
                    End If
                    '/* version 2.7 */
                    ObtenerCampo("dtCierre").Text = objbasededatos.getDateasString()
                    objParametros.GrabarValor "Cancela", "NO"
                    If objParametros.ObtenerValor("dsObservacion") <> ObtenerCampo("dsObservacion").Text Then ObtenerCampo("dtObservacion").Text = Now()
                Else
                    If objParametros.ObtenerValor("dsObservacion") <> ObtenerCampo("dsObservacion").Text And _
                       ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                        ActualizarObservacionCaja
                    End If
                    
                    If ObtenerCampo("dtCierre").Text <> "" Or objUsuario.tpAcceso = "Administración" Or Me.check_estado.value = vbChecked Then
                        Unload Me
                        Exit Sub
                    End If
                    If Not ObtenerCampo("vlSaldoFinalPesos").Text > ObtenerCampo("vlSaldoInicialPesos").Text Then
                        ObtenerCampo("vlSaldoFinalPesos").Text = ObtenerCampo("vlSaldoInicialPesos").Text
                    End If
                    If Not ObtenerCampo("vlSaldoFinalEuros").Text > ObtenerCampo("vlSaldoInicialEuros").Text Then
                        ObtenerCampo("vlSaldoFinalEuros").Text = ObtenerCampo("vlSaldoInicialEuros").Text
                    End If
                    If Not ObtenerCampo("vlSaldoFinalDolares").Text > ObtenerCampo("vlSaldoInicialDolares").Text Then
                        ObtenerCampo("vlSaldoFinalDolares").Text = ObtenerCampo("vlSaldoInicialDolares").Text
                    End If
                    objParametros.GrabarValor "vlDiaDolar", ObtenerCampo("vlDiaDolar").Text
                    objParametros.GrabarValor "vlDiaEuro", ObtenerCampo("vlDiaEuro").Text
                End If
                If Guardarregistro(EstadoABM) Then
                    If objConfig.AbreCaja = "SI" Then
                        objParametros.GrabarValor "Cancela", "NO"
                        objParametros.GrabarValor "nrCaja", ObtenerCampo("nrCaja")
                        Unload Me
                        Exit Sub
                    End If
                    PresentarPantalla Button
                    EstadoABM = Consulta
                End If
    Case "Cancelar"
            Select Case objParametros.ObtenerValor("Frm_ABMCaja")
            Case "Alta"
                objParametros.GrabarValor "CajaAbierta", "NO"
                Unload Me
                Exit Sub
            Case "CajaSinCerrar"
                objParametros.GrabarValor "CajaAbierta", "NO"
                Unload Me
                Exit Sub
            Case "CerrarCaja"
                objParametros.GrabarValor "Cancela", "SI"
                Unload Me
            Case Else
                PresentarPantalla Button
                EstadoABM = Consulta
            End Select
    Case "Imprimir"
        If Me.check_estado.value = vbUnchecked Then
           Guardarregistro modificacion
        End If
        imprimirCaja True
    Case "Arreglar"

        
        If Me.lstBusqueda.ListItems.Count <= 0 Then Exit Sub
        If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
        
        ' version 4.1
        resp = MsgBox("Esta seguro que desea modificar la caja '" + Me.lstBusqueda.SelectedItem.Text + "'. ", vbInformation + vbYesNo, "Atención - Agregar")
        If resp = vbNo Then Exit Sub
        
        ' MsgBox "Seguridad desactivada.", vbInformation + vbDefaultButton1
        If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.nrcajapuesto", Me.lstBusqueda.SelectedItem.Text
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
        Frm_DetalleCajaPuesto.Show vbModal
        lstBusqueda_DblClick
    Case "Aprobar_ver"
        If Me.lstBusqueda.ListItems.Count <= 0 Then Exit Sub
        objParametros.GrabarValor "Frm_DetalleCajaPuesto.nrcajapuesto", Me.lstBusqueda.SelectedItem.Text
        ' -- agregado en la version 2.5
        Select Case objParametros.ObtenerValor("frm_ABMCaja.modo")
        Case "cajas_modificadas_adm", "cajas_modificadas_adm.cajaspendientes"
           Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpEstadoAprobacion", Me.lstBusqueda.SelectedItem.Index)
           Case "Pendiente"
                If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dsUsuario", Me.lstBusqueda.SelectedItem.Index) = objUsuario.dsUsuario Then
                    objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "SI"
                    Frm_DetalleCajaPuesto.Show vbModal
                    resp = MsgBox("Aprueba los cambios efectuados en su caja nro. '" + Me.lstBusqueda.SelectedItem.Text + "'?" + vbCrLf + "Presione cancelar para realizarlo mas tarde.", vbQuestion + vbYesNoCancel, "Atención")
                    Select Case resp
                    Case vbYes
                        objSPs.nmStoredProcedure = "sp_AprobarCajaPuesto_v2_5"
                        objSPs.setearCampoValor "@pdsUsuario_param", objUsuario.dsUsuario
                        objSPs.setearCampoValor "@pnrCaja_param", Me.lstBusqueda.SelectedItem.Text
                        If Not objSPs.ExecSP() Then
                            MsgBox "Error al ejecutar el procedure sp_AprobarCajaPuesto_v2_5, decripción: " + objSPs.Error, vbCritical
                        End If
                        MsgBox "Caja aprobada.", vbInformation + vbDefaultButton1, "Atención"
                    Case vbNo
                        objSPs.nmStoredProcedure = "sp_RechazarCajaPuesto_v2_5"
                        objSPs.setearCampoValor "@pdsUsuario_param", objUsuario.dsUsuario
                        objSPs.setearCampoValor "@pnrCaja_param", Me.lstBusqueda.SelectedItem.Text
                        If Not objSPs.ExecSP() Then
                            MsgBox "Error al ejecutar el procedure sp_obtenerCajasPendientesdeAprobacion_v2_5, decripción: " + objSPs.Error, vbCritical
                            Exit Sub
                        End If
                        MsgBox "Caja rechazada.", vbInformation + vbDefaultButton1, "Atención"
                    Case Else
                        ' debera revisarla mas  tarde
                    End Select
                    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
               Else
                    objParametros.GrabarValor "Frm_DetalleCajaPuesto.Aprobacion.Usuario", "NO"
                    Frm_DetalleCajaPuesto.Show vbModal
               End If
           Case Else
                Frm_DetalleCajaPuesto.Show vbModal
           End Select
        End Select
    End Select
    
    
End Sub



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
    Frm_Principal.CrystalReport1.StoredProcParam(0) = ObtenerCampo("nrCaja").Text
    
    ' Aparece la venta original
    ' On Error Resume Next
    Frm_Principal.CrystalReport1.CopiesToPrinter = CInt(objConfig.Cantidad_copias_cierre_caja_Puesto)
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    On Error GoTo 0
    
    
    'Frm_Principal.LimpiarReporte
    
     ' <<version4.1>>
    objSPs.nmStoredProcedure = "rpt_ComprobantesManuales_cajapuesto_v3_7"
    objSPs.setearCampoValor "@nrCaja_param", ObtenerCampo("nrCaja").Text
    
    If Not objSPs.ExecSP Then
        MsgBox "ERROR no se puede mostrar este informe, function: rpt_ComprobantesManuales_cajapuesto_v3_7 error extendido:" + objSPs.Error, vbCritical, "Atención"
        Exit Sub
    End If
    ' <<version4.1>>
    If objSPs.rs_resultados.EOF Then
        MsgBox "No se ha facturado manualmente, no se emitira el reporte.", vbInformation, "Atención"
        Exit Sub
    End If
    
    

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
                objParametros.GrabarValor "frm_ABMCajaPuesto.nrCaja", ObtenerCampo("nrCaja").Text
                impresion.imprimirCierreCajaPuesto False
                objParametros.GrabarValor "frm_ABMCajaPuesto.nrCaja", ""
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
           If objParametros.ObtenerValor("frm_ABMCaja") = "CerrarCaja" Then
              Me.tlb_ABM.Buttons("Imprimir").Visible = True
              Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           '///////////////////////////////////////////////////
           ' Modificación agregada en la versión 2.9
           PantallaComandosGestionCajaPuestos
           '///////////////////////////////////////////////////
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "vlSaldoInicialPesos", True
           HabilitarCampos "vlSaldoInicialEuros", True
           HabilitarCampos "vlSaldoInicialDolares", True
           HabilitarCampos "vlSaldoInicialReales", True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
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
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           '///////////////////////////////////////////////////
           ' Modificación agregada en la versión 2.9
           PantallaComandosGestionCajaPuestos
           '///////////////////////////////////////////////////
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
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           '///////////////////////////////////////////////////
           ' Modificación agregada en la versión 2.9
           PantallaComandosGestionCajaPuestos
           '///////////////////////////////////////////////////
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
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           '///////////////////////////////////////////////////
           ' Modificación agregada en la versión 2.9
           PantallaComandosGestionCajaPuestos
           '///////////////////////////////////////////////////
           Me.txtBusqueda.SetFocus
    End Select

End Sub



Private Sub PantallaComandosGestionCajaPuestos()

           '///////////////////////////////////////////////////
           ' Modificación agregada en la versión 2.9
           Select Case objParametros.ObtenerValor("frm_ABMCaja.modo")
           Case "cajas_modificadas_adm"
                If objUsuario.tpAcceso = "Administración" Then
                     Me.tlb_ABM.Buttons("Arreglar").Visible = True
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = False
                Else
                     Me.tlb_ABM.Buttons("Arreglar").Visible = False
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = True
                End If
           Case "cajas_modificadas_adm.cajarechazadas"
                If objUsuario.tpAcceso = "Administración" Then
                     Me.tlb_ABM.Buttons("Arreglar").Visible = True
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = False
                Else
                     Me.tlb_ABM.Buttons("Arreglar").Visible = False
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = False
                End If
                Me.DTPicker1(1).Visible = False
                Me.DTPicker1(0).Visible = False
                Me.lblFechadesde.Visible = False
                Me.lblFechaHasta.Visible = False
           Case "cajas_modificadas_adm.cajaspendientes"
                If objUsuario.tpAcceso = "Administración" Then
                     Me.tlb_ABM.Buttons("Arreglar").Visible = False
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = False
                Else
                     Me.tlb_ABM.Buttons("Arreglar").Visible = False
                     Me.tlb_ABM.Buttons("Aprobar_ver").Visible = True
                End If
                Me.DTPicker1(1).Visible = False
                Me.DTPicker1(0).Visible = False
                Me.lblFechadesde.Visible = False
                Me.lblFechaHasta.Visible = False
           Case "cajas_del_usuario"
               If objUsuario.tpAcceso = "Administración" Then
                    Me.tlb_ABM.Buttons("Arreglar").Visible = True
                    Me.tlb_ABM.Buttons("Agregar").Visible = True
               Else
                    Me.tlb_ABM.Buttons("Arreglar").Visible = False
                    Me.tlb_ABM.Buttons("Agregar").Visible = False
               End If
                Me.tlb_ABM.Buttons("Aprobar_ver").Visible = False
           End Select
           '///////////////////////////////////////////////////
           

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

         ObjTablasIO.nmTabla = "VW_CajasPuestos_v2_5"
         
         If objConfig.nrPuesto = "9" Then
            ObjTablasIO.setearCampoOperadorValor "nrPuesto", "<>", "9", "AND"
         Else
            ObjTablasIO.setearCampoOperadorValor "tpAcceso", "=", "Puestos", "AND"
         End If
         
         ' -- agregado en la version 2.5
         Select Case objParametros.ObtenerValor("frm_ABMCaja.modo")
         Case "cajas_modificadas_adm"
            ObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "is not null", "", " AND "
            ObjTablasIO.setearCampoOperadorValor "dtApertura", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
            ObjTablasIO.setearCampoOperadorValor "dtApertura", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59"), " AND "
        Case "cajas_modificadas_adm.cajaspendientes"
            ObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "=", "Pendiente", " AND "
        Case "cajas_modificadas_adm.cajarechazadas"
            ObjTablasIO.setearCampoOperadorValor "tpEstadoAprobacion", "=", "Rechazada", " AND "
         Case Else
            ObjTablasIO.setearCampoOperadorValor "dtApertura", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
            ObjTablasIO.setearCampoOperadorValor "dtApertura", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59"), " AND "
         End Select

         objDiccionariodeDatos.ObtenerNombredeCampoFisico "VW_CajasPuestos_v2_5", Me.cmbCampos.Text
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
            objControl.CargarListView_SG_conFORMATO ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cajas"
            
             ' -- agregado en la version 2.5
             'Select Case objParametros.ObtenerValor("frm_ABMCaja.modo")
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
        ' Agregada en la version 2.9
        If check_estado.value = 0 Then
            CalcularDiferencia
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
    objCajas.SumarCajaPuestos (objParametros.ObtenerValor("frm_ABMCaja.nrCaja"))

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
