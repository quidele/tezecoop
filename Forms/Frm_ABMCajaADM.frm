VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MsComCtl.ocx"
Begin VB.Form frm_ABMCajaADM 
   Caption         =   "Manejo de Cajas de la Administración"
   ClientHeight    =   7185
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11865
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "Frm_ABMCajaADM.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   Picture         =   "Frm_ABMCajaADM.frx":030A
   ScaleHeight     =   7185
   ScaleWidth      =   11865
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   11865
      _ExtentX        =   20929
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMCajasResaltado"
      HotImageList    =   "imgABMCajasResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   14
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar una Caja"
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
            Caption         =   "&Imprimir(F8)"
            Key             =   "Imprimir"
            ImageKey        =   "Imprimir"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Ver caja CA"
            Key             =   "VerCaja"
            ImageKey        =   "VerCaja"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Ver Caja CC"
            Key             =   "VerCajaCC"
            ImageKey        =   "VerCaja"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Ver Caja CL"
            Key             =   "VerCajaCL"
            ImageKey        =   "VerCaja"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "Sincronizar"
            Key             =   "Sincronizar"
            ImageKey        =   "Sincronizar"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ABMCajaADM.frx":064C
      Begin MSComctlLib.ImageList imgABMCajasResaltado 
         Left            =   0
         Top             =   0
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
               Picture         =   "Frm_ABMCajaADM.frx":07AE
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":08CA
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":0A1E
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":0B2E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":0C30
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":0D84
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":0E90
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":150C
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":1674
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":1AC8
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":1F1C
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":2596
               Key             =   "VerCaja"
               Object.Tag             =   "VerCaja"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":26A8
               Key             =   "Sincronizar"
               Object.Tag             =   "Sincronizar"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMCajas 
         Left            =   8430
         Top             =   0
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
               Picture         =   "Frm_ABMCajaADM.frx":392A
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":3A42
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":3B96
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":3CAE
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":3DBA
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":3F0E
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":4016
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":4692
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":47F2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":4C46
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":509A
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":5714
               Key             =   "VerCaja"
               Object.Tag             =   "VerCaja"
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":5826
               Key             =   "Sincronizar"
               Object.Tag             =   "Sincronizar"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMCajas 
      BorderStyle     =   0  'None
      Height          =   6255
      Left            =   15
      TabIndex        =   0
      Top             =   765
      Width           =   11805
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   6015
         Left            =   1590
         ScaleHeight     =   5985
         ScaleWidth      =   8175
         TabIndex        =   18
         Top             =   135
         Width           =   8205
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   21
            Left            =   5430
            Locked          =   -1  'True
            TabIndex        =   56
            TabStop         =   0   'False
            Tag             =   "vlDiaReal"
            Top             =   2355
            Width           =   2430
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   13
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   46
            TabStop         =   0   'False
            Tag             =   "dtObservacion"
            Top             =   5400
            Width           =   3470
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   885
            Index           =   20
            Left            =   1905
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   43
            TabStop         =   0   'False
            Tag             =   "dsObservacion"
            Top             =   4380
            Width           =   3470
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   12
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   42
            Tag             =   "vlTotalSaldoInicial"
            Top             =   4035
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   1
            Left            =   4245
            Locked          =   -1  'True
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinal"
            Top             =   4020
            Width           =   1110
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   11
            Left            =   3060
            Locked          =   -1  'True
            TabIndex        =   7
            Tag             =   "vlSaldoFinalRealPesos"
            Top             =   3000
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   15
            Left            =   3045
            Locked          =   -1  'True
            TabIndex        =   8
            Tag             =   "vlSaldoFinalRealDolares"
            Top             =   3345
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   16
            Left            =   3060
            Locked          =   -1  'True
            TabIndex        =   9
            Tag             =   "vlSaldoFinalRealEuros"
            Top             =   3690
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   300
            Index           =   17
            Left            =   3060
            Locked          =   -1  'True
            TabIndex        =   38
            TabStop         =   0   'False
            Tag             =   "vlTotalSaldoFinalReal"
            Top             =   4020
            Width           =   1095
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   19
            Left            =   4245
            Locked          =   -1  'True
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "vlCierreEuros"
            Top             =   3660
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   285
            Index           =   18
            Left            =   4245
            Locked          =   -1  'True
            TabIndex        =   34
            TabStop         =   0   'False
            Tag             =   "vlCierreDolares"
            Top             =   3345
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   14
            Left            =   4245
            Locked          =   -1  'True
            TabIndex        =   32
            TabStop         =   0   'False
            Tag             =   "vlCierrePesos"
            Top             =   2970
            Width           =   1100
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
            TabIndex        =   27
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   1020
            Width           =   4050
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   2
            Left            =   3390
            Locked          =   -1  'True
            TabIndex        =   26
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   390
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   6
            Left            =   3390
            Locked          =   -1  'True
            TabIndex        =   25
            TabStop         =   0   'False
            Tag             =   "dtCierre"
            Top             =   1740
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   8
            Left            =   3390
            Locked          =   -1  'True
            TabIndex        =   24
            TabStop         =   0   'False
            Tag             =   "vlDiaEuro"
            Top             =   2355
            Width           =   1950
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   10
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   5
            Tag             =   "vlSaldoInicialDolares"
            Top             =   3330
            Width           =   1100
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   9
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   6
            Tag             =   "vlSaldoInicialEuros"
            Top             =   3675
            Width           =   1095
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
            Top             =   2355
            Width           =   1965
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
            Top             =   1725
            Width           =   1980
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   285
            Index           =   4
            Left            =   1890
            Locked          =   -1  'True
            TabIndex        =   4
            Tag             =   "vlSaldoInicialPesos"
            Top             =   2985
            Width           =   1100
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
            Width           =   1965
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
            Index           =   8
            Left            =   5430
            TabIndex        =   57
            Top             =   2130
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "Ultima Modificación"
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
            Index           =   7
            Left            =   0
            TabIndex        =   45
            Top             =   5440
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Alignment       =   1  'Right Justify
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
            Index           =   2
            Left            =   200
            TabIndex        =   44
            Top             =   4440
            Width           =   1575
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
            Left            =   150
            TabIndex        =   40
            Top             =   4065
            Width           =   1710
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Saldo Final"
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
            Index           =   11
            Left            =   3135
            TabIndex        =   39
            Top             =   2730
            Width           =   1050
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
            Left            =   1290
            TabIndex        =   37
            Top             =   3690
            Width           =   600
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
            Index           =   5
            Left            =   1290
            TabIndex        =   36
            Top             =   3345
            Width           =   585
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Total Diario"
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
            Index           =   10
            Left            =   4290
            TabIndex        =   33
            Top             =   2730
            Width           =   1005
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
            Height          =   255
            Index           =   9
            Left            =   1290
            TabIndex        =   31
            Top             =   3015
            Width           =   600
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
            Height          =   255
            Index           =   28
            Left            =   1305
            TabIndex        =   30
            Top             =   750
            Width           =   4050
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
            Height          =   255
            Index           =   13
            Left            =   3390
            TabIndex        =   29
            Top             =   1440
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
            Height          =   255
            Index           =   4
            Left            =   3390
            TabIndex        =   28
            Top             =   2130
            Width           =   1965
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
            Height          =   255
            Index           =   3
            Left            =   1305
            TabIndex        =   23
            Top             =   2115
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Saldo Inicial"
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
            Left            =   1890
            TabIndex        =   22
            Top             =   2745
            Width           =   1125
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
            Height          =   255
            Index           =   12
            Left            =   1305
            TabIndex        =   21
            Top             =   1395
            Width           =   1965
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
            TabIndex        =   20
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
            Left            =   3390
            TabIndex        =   19
            Top             =   135
            Width           =   1965
         End
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   6555
      Left            =   -45
      TabIndex        =   14
      Top             =   675
      Width           =   11865
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2490
         TabIndex        =   47
         Top             =   2175
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   48
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   51
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   50
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   300
            TabIndex        =   49
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   5520
         TabIndex        =   10
         Top             =   330
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
               Picture         =   "Frm_ABMCajaADM.frx":6AA8
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":6BBA
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":6CCC
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":6DDE
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":6EF0
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMCajaADM.frx":7002
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   3390
         TabIndex        =   13
         Top             =   330
         Width           =   2070
         _ExtentX        =   3651
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
         TabIndex        =   12
         Top             =   330
         Width           =   3135
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   5055
         Left            =   135
         TabIndex        =   11
         Top             =   1170
         Width           =   11655
         _ExtentX        =   20558
         _ExtentY        =   8916
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
            Object.Width           =   2205
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
            Object.Tag             =   "vlTotalSaldoFinalReal"
            Text            =   "Saldo Final"
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   360
         Index           =   0
         Left            =   1425
         TabIndex        =   52
         Tag             =   "dtDesde"
         Top             =   720
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
         Left            =   3945
         TabIndex        =   53
         Tag             =   "dtHasta"
         Top             =   750
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   609
         _Version        =   393216
         Format          =   111935489
         CurrentDate     =   38267
      End
      Begin VB.Label lblLabels 
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
         Index           =   19
         Left            =   3210
         TabIndex        =   55
         Top             =   825
         Width           =   645
      End
      Begin VB.Label lblLabels 
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
         Index           =   18
         Left            =   105
         TabIndex        =   54
         Top             =   840
         Width           =   1200
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   5550
         TabIndex        =   16
         Top             =   75
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   15
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "frm_ABMCajaADM"
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




Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    
End Sub







Private Sub Form_Activate()


    Select Case EstadoABM
    Case alta
        ObtenerCampo("vlSaldoInicialPesos").SetFocus
    Case Else
        Select Case objParametros.ObtenerValor("frm_ABMCaja")
        Case "CajaSinCerrar"
        Case "CerrarCaja"
        Case Else
            On Error Resume Next
            Me.txtBusqueda.SetFocus
            On Error GoTo 0
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
        ObtenerCampo("dtCierre").Text = Now()
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
    Me.cmbCampos.ListIndex = 1

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
    For Each Control In Me.Controls
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
    
    If ObjTablasIO.rs_resultados("flEstado") = False Then
        ObtenerCampo("vlSaldoFinalRealPesos").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealPesos", ObtenerCampo("vlSaldoFinalRealPesos").Text)
        ObtenerCampo("vlSaldoFinalRealDolares").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealDolares", ObtenerCampo("vlSaldoFinalRealDolares").Text)
        ObtenerCampo("vlSaldoFinalRealEuros").Text = objDiccionariodeDatos.FormatearCampoValor("TB_Cajas", "vlSaldoFinalRealEuros", ObtenerCampo("vlSaldoFinalRealEuros").Text)
    End If

    
    ' EULISES
    If objParametros.ObtenerValor("frm_ABMCaja") = "CerrarCaja" Or _
       objParametros.ObtenerValor("frm_ABMCaja") = "CajaSinCerrar" Then
       
        HabilitarCampos "vlSaldoInicialPesos", False
        HabilitarCampos "vlSaldoInicialEuros", False
        HabilitarCampos "vlSaldoInicialDolares", False
        
    End If
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub



Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    
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
        
    ' Verificar el estado de la caja
    If ObjTablasIO.rs_resultados("flEstado") <> 1 Then
            If objCajas.SumarCajaADM(ObjTablasIO.rs_resultados("nrCaja").value, "CA", "") Then
                ObtenerCampo("vlSaldoFinalRealPesos").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialPesos") + CSng(objCajas.vlPesos)), 2)
                ObtenerCampo("vlSaldoFinalRealEuros").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialEuros") + CSng(objCajas.vlEuros)), 2)
                ObtenerCampo("vlSaldoFinalRealDolares").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialDolares") + CSng(objCajas.vlDolares)), 2)
                ObtenerCampo("vlCierrePesos").Text = CStr(objCajas.vlPesos)
                ObtenerCampo("vlCierreDolares").Text = CStr(objCajas.vlDolares)
                ObtenerCampo("vlCierreEuros").Text = CStr(objCajas.vlEuros)
            Else
                 ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerCampo("vlSaldoInicialPesos").Text
                 ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerCampo("vlSaldoInicialEuros").Text
                 ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerCampo("vlSaldoInicialDolares").Text
                 ObtenerCampo("vlCierrePesos").Text = "0,00"
                 ObtenerCampo("vlCierreDolares").Text = "0,00"
                 ObtenerCampo("vlCierreEuros").Text = "0,00"
           End If
    End If
    
    If ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                ObtenerCampo("dsObservacion").Locked = False
                ObtenerCampo("dsObservacion").BackColor = Blanco
                objParametros.GrabarValor "dsObservacion", ObtenerCampo("dsObservacion").Text
    End If
           
    ObtenerCampo("vlTotalSaldoInicial").Text = FormatNumber(ObtenerPesos("vlTotalSaldoInicial"), 2)
    ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)
    ObtenerCampo("vlTotalSaldoFinal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinal"), 2)
           
    If objParametros.ObtenerValor("frm_ABMCaja") = "Consulta" Then
               ObtenerCampo("vlSaldoInicialPesos").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").Locked = True
               ObtenerCampo("vlSaldoInicialDolares").Locked = True
               ObtenerCampo("vlSaldoInicialEuros").BackColor = Gris
               ObtenerCampo("vlSaldoInicialDolares").BackColor = Gris
               ObtenerCampo("vlSaldoInicialPesos").BackColor = Gris '&HE0E0E0
    End If
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    'ObtenerCampo("vlSaldoInicialPesos").SetFocus
    ObtenerCampo("dsObservacion").SetFocus
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
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
            
            If objCajas.SumarCajaADM(ObtenerCampo("nrCaja").Text, "CA", "") Then
                ObtenerCampo("vlSaldoFinalRealPesos").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialPesos") + CSng(objCajas.vlPesos)), 2)
                ObtenerCampo("vlSaldoFinalRealEuros").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialEuros") + CSng(objCajas.vlEuros)), 2)
                ObtenerCampo("vlSaldoFinalRealDolares").Text = FormatNumber((ObtenerValoresNumericos("vlSaldoInicialDolares") + CSng(objCajas.vlDolares)), 2)
                ObtenerCampo("vlCierrePesos").Text = CStr(objCajas.vlPesos)
                ObtenerCampo("vlCierreDolares").Text = CStr(objCajas.vlDolares)
                ObtenerCampo("vlCierreEuros").Text = CStr(objCajas.vlEuros)
                If ObtenerCampo("dtCierre") = "" Then
                    ActualizarCaja
                End If
            Else
                 ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerCampo("vlSaldoInicialPesos").Text
                 ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerCampo("vlSaldoInicialEuros").Text
                 ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerCampo("vlSaldoInicialDolares").Text
                 ObtenerCampo("vlCierrePesos").Text = "0,00"
                 ObtenerCampo("vlCierreDolares").Text = "0,00"
                 ObtenerCampo("vlCierreEuros").Text = "0,00"
           End If
           
           ObtenerCampo("vlTotalSaldoInicial").Text = FormatNumber(ObtenerPesos("vlTotalSaldoInicial"), 2)
           ObtenerCampo("vlTotalSaldoFinalReal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinalReal"), 2)
           ObtenerCampo("vlTotalSaldoFinal").Text = FormatNumber(ObtenerPesos("vlTotalSaldoFinal"), 2)
           
    Case "Agregar"
    
           EstadoABM = alta
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cajas", "nrCaja", objConfig.nrPuesto)
           ObtenerCampo("nrCaja").Text = strValor
           ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario")
           ObtenerCampo("nrPuesto").Text = objConfig.nrPuesto
           ObtenerCampo("vlDiaDolar").Text = objConfig.vlDiaDolar
           ObtenerCampo("vlDiaEuro").Text = objConfig.vlDiaEuro
           ObtenerCampo("vlDiaReal").Text = objConfig.vlDiaReal
           
           If objCajas.ObtenerCajadeADMAbierta() Then
                MsgBox "La caja de administración esta abierta por el usuario " + _
                       " '" + objCajas.dsUsuario + "', este usuario deberá cerrar su " + _
                       " caja para que usted puede ingresar al sistema.", vbCritical, "Atención"
                ' salir del sistema
                Unload Me
                End
                
           End If
           objCajas.calcularSaldoInicial "", "", ""
           ObtenerCampo("vlSaldoInicialPesos").Text = objCajas.vlSaldoInicialPesos
           ObtenerCampo("vlSaldoInicialEuros").Text = objCajas.vlSaldoInicialEuros
           ObtenerCampo("vlSaldoInicialDolares").Text = objCajas.vlSaldoInicialDolares
           ObtenerCampo("dtApertura").Text = Now()
           PresentarPantalla Button
           ObtenerCampo("vlTotalSaldoInicial").Text = CStr(FormatNumber(ObtenerPesos("vlTotalSaldoInicial"), 2))
           If Not objConfig.AbreCaja = "SI" Then
              ObtenerCampo("vlSaldoInicialPesos").SetFocus
           End If
    Case "Eliminar"
           If EliminarRegistro() Then
                EstadoABM = Consulta
                PresentarPantalla Button
           End If
    Case "VerCaja"
        objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", ObtenerCampo("nrCaja").Text
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CA"
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", ""
        objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de la Administración"
        Frm_ResumenCajaADM.Show 1
   Case "VerCajaCL"
        objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", ObtenerCampo("nrCaja").Text
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CL"
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", "Caja de los Licenciatarios"
        objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de los Licenciatarios"
        Frm_ResumenCajaADM.Show 1
   Case "VerCajaCC"
        objParametros.GrabarValor "Frm_ResumenCajaADM.nrCajaVista", ObtenerCampo("nrCaja").Text
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCaja", "CC"
        objParametros.GrabarValor "Frm_ResumenCajaADM.tpCajaImputacion", "Caja de la Cooperativa"
        objParametros.GrabarValor "Frm_ResumenCajaADM.titulo", "Resumen - Caja de la Cooperativa"
        Frm_ResumenCajaADM.Show 1
    Case "Sincronizar"
    
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           If EstadoABM = CerrarCaja Then
                objParametros.GrabarValor "Cancela", "NO"
           Else
                ObtenerCampo("dtObservacion").Text = Now()
                If objParametros.ObtenerValor("dsObservacion") <> ObtenerCampo("dsObservacion").Text And _
                   ObtenerCampo("dsUsuario").Text = objParametros.ObtenerValor("dsUsuario") Then
                    ActualizarObservacionCaja
                End If
                If ObtenerCampo("dtCierre").Text <> "" Then
                       Unload Me
                       Exit Sub
                End If
                If Not ObtenerCampo("vlSaldoFinalRealPesos").Text > ObtenerCampo("vlSaldoInicialPesos").Text Then
                    ObtenerCampo("vlSaldoFinalRealPesos").Text = ObtenerCampo("vlSaldoInicialPesos").Text
                End If
                If Not ObtenerCampo("vlSaldoFinalRealEuros").Text > ObtenerCampo("vlSaldoInicialEuros").Text Then
                     ObtenerCampo("vlSaldoFinalRealEuros").Text = ObtenerCampo("vlSaldoInicialEuros").Text
                End If
                If Not ObtenerCampo("vlSaldoFinalRealDolares").Text > ObtenerCampo("vlSaldoInicialDolares").Text Then
                     ObtenerCampo("vlSaldoFinalRealDolares").Text = ObtenerCampo("vlSaldoInicialDolares").Text
                End If
                objParametros.GrabarValor "vlDiaDolar", ObtenerCampo("vlDiaDolar").Text
                objParametros.GrabarValor "vlDiaEuro", ObtenerCampo("vlDiaEuro").Text
                objParametros.GrabarValor "vlDiaReal", ObtenerCampo("vlDiaReal").Text
                
                objParametros.GrabarValor "vlSaldoInicialPesos", ObtenerCampo("vlSaldoInicialPesos").Text
                objParametros.GrabarValor "vlSaldoInicialDolares", ObtenerCampo("vlSaldoInicialDolares").Text
                objParametros.GrabarValor "vlSaldoInicialEuros", ObtenerCampo("vlSaldoInicialEuros").Text
                
           End If
           
           If Guardarregistro(EstadoABM) Then
                If objConfig.AbreCaja = "SI" Then
                    objParametros.GrabarValor "CajaAbierta", "SI"
                    objParametros.GrabarValor "nrCaja", ObtenerCampo("nrCaja").Text
                     ' --- INICIA VERSION 3.9 verificamos si existe una diferencia de cotización
                         ' caja anterior
                         objCajas.ObtenerUltimaCajaAdmCerrada
                         ' preguntamos si la caja anterior modifico alguna cotizacion
                         If objCajas.hayCambioenCotizacionAperturaCaja(objCajas.nrCaja, objParametros.ObtenerValor("nrCaja")) And _
                             Not objCajas.esDifporCotizacionImputadas(objParametros.ObtenerValor("nrCaja")) Then
                             MsgBox "Existen cambios de cotización, deberá ingresar el monto de la moneda, el sistema realizará el ajuste contable.", vbDefaultButton1 + vbInformation, "Atención"
                             objParametros.GrabarValor "frm_CambiosCotizacion.accion", "aperturadecaja"
                             objParametros.GrabarValor "frm_CambiosCotizacion.nrCajaAnterior", objCajas.nrCaja
                             objParametros.GrabarValor "frm_CambiosCotizacion.accion.resultado", "NOOK"
                             frm_CambiosCotizacion.Show vbModal
                             If objParametros.ObtenerValor("frm_CambiosCotizacion.accion.resultado") <> "OK" Then
                                MsgBox "El sistema no permitirá su apertura hasta que realice el asiento por cambio de cotización.", vbCritical + vbDefaultButton1, "Atención"
                                End
                             End If
                              
                         End If
                     ' --- FIN VERSION 3.9 verificamos si existe una diferencia de cotización
                    Unload Me
                    Exit Sub
                End If
                PresentarPantalla Button
                EstadoABM = Consulta
           End If

    Case "Cancelar"
    
            If EstadoABM <> Consulta Then
            
                If objConfig.AbreCaja = "SI" Then
                         ' --- INICIA VERSION 3.9 verificamos si existe una diferencia de cotización
                             ' caja anterior
                             objCajas.ObtenerUltimaCajaAdmCerrada
                             ' preguntamos si la caja anterior modifico alguna cotizacion
                             If objCajas.hayCambioenCotizacionAperturaCaja(objCajas.nrCaja, objParametros.ObtenerValor("nrCaja")) And _
                                 Not objCajas.esDifporCotizacionImputadas(objParametros.ObtenerValor("nrCaja")) Then
                                 MsgBox "Existen cambios de cotización, deberá ingresar el monto de la moneda, el sistema realizará el ajuste contable.", vbDefaultButton1 + vbInformation, "Atención"
                                 objParametros.GrabarValor "frm_CambiosCotizacion.accion", "aperturadecaja"
                                 objParametros.GrabarValor "frm_CambiosCotizacion.nrCajaAnterior", objCajas.nrCaja
                                 objParametros.GrabarValor "frm_CambiosCotizacion.accion.resultado", "NOOK"
                                 frm_CambiosCotizacion.Show vbModal
                                 If objParametros.ObtenerValor("frm_CambiosCotizacion.accion.resultado") <> "OK" Then
                                    MsgBox "El sistema no permitirá su apertura hasta que realice el asiento por cambio de cotización", vbCritical + vbDefaultButton1, "Atención"
                                    End
                                 End If
                                  
                             End If
                         ' --- FIN VERSION 3.9 verificamos si existe una diferencia de cotización
                        Unload Me
                        Exit Sub
                End If
            End If
            Select Case objParametros.ObtenerValor("frm_ABMCaja")
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
        If ObtenerCampo("dtCierre") = "" Then
           EstadoABM = modificacion
           Guardarregistro EstadoABM
        End If
        imprimirCaja True
    End Select
    
End Sub



Private Sub ActualizarCaja()

    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealPesos", "<-", ObtenerCampo("vlSaldoFinalRealPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealEuros", "<-", ObtenerCampo("vlSaldoFinalRealEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoFinalRealDolares", "<-", ObtenerCampo("vlSaldoFinalRealDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierrePesos", "<-", ObtenerCampo("vlCierrePesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierreDolares", "<-", ObtenerCampo("vlCierreDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlCierreEuros", "<-", ObtenerCampo("vlCierreEuros").Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.Actualizar
    
   
End Sub

Private Sub ActualizarObservacionCaja()

    ObjTablasIO.nmTabla = "TB_Cajas"
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", ObtenerCampo("dsObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "dtObservacion", "<-", ObtenerCampo("dtObservacion").Text
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", ObtenerCampo("nrCaja").Text
    ObjTablasIO.Actualizar
    
   
End Sub

Private Sub imprimirCaja(porpantalla As Boolean)
Dim nombrereporte As String

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
    

    Frm_Principal.LimpiarReporte
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\" & nombrereporte
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    If porpantalla Then
        Frm_Principal.CrystalReport1.Destination = crptToWindow
    Else
        Frm_Principal.CrystalReport1.Destination = crptToPrinter
    End If
    
    Frm_Principal.CrystalReport1.WindowTitle = "Impresión del Movimiento de una Caja"
    Frm_Principal.CrystalReport1.StoredProcParam(0) = ObtenerCampo("nrCaja").Text
    Frm_Principal.CrystalReport1.StoredProcParam(1) = "CA"
    Frm_Principal.CrystalReport1.StoredProcParam(2) = ""
    
    
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


Private Sub ExportaraExcel()
Dim strError  As String

    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
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
Dim Control    As Control
Dim strtag     As String
Dim strPrefijo As String
Dim strValor   As String

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
    
    ' logica arregada en la version 3.2
    Select Case EstadoABM
    Case CerrarCaja
        If Not objCajas.ActualizarValoresSumadosCajasPuestosImputadas(ObtenerCampo("nrCaja").Text) Then
            MsgBox "No se pudo actualizar el saldo de la cajas puestos imputadas.", vbInformation + vbDefaultButton1
        End If
    End Select
    

    
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

    ObjTablasIO.setearCampoOperadorValor "flCajaAdm", "<-", "1"
                          
    Select Case EstadoABM
    Case cajasincerrar, modificacion
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                Guardarregistro = True
            End If
    Case alta
            
            ObjTablasIO.setearCampoOperadorValor "hrApertura", _
            "=", CStr(Format(Now, "HH:MM"))
            
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cajas", "nrCaja", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                
                Guardarregistro = True
            End If
    Case CerrarCaja
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            ObjTablasIO.setearCampoOperadorValor "flEstado", _
            "<-", "1"
            ObjTablasIO.setearCampoOperadorValor "hrCierre", _
            "<-", CStr(Format(Now, "HH:MM"))
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "La caja se ha cerrado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                imprimirCaja False
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
           Me.tlb_ABM.Buttons("VerCaja").Visible = True
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = True
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMCajas.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("VerCaja").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
    Case "Eliminar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.tlb_ABM.Buttons("VerCaja").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = False
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
           Me.tlb_ABM.Buttons("VerCaja").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = False
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
           Me.tlb_ABM.Buttons("VerCaja").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Cancelar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMCajas.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("VerCaja").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCL").Visible = False
           Me.tlb_ABM.Buttons("VerCajaCC").Visible = False
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
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         Screen.ActiveForm.MousePointer = vbHourglass
         
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "VW_CajasPuestos_v2_5"
         
         ObjTablasIO.setearCampoOperadorValor "dtApertura", ">=", Format(ObtenerCampo("dtDesde").value, "dd/mm/yyyy 00:00:00"), " AND "
         ObjTablasIO.setearCampoOperadorValor "dtApertura", "<=", Format(ObtenerCampo("dtHasta").value, "dd/mm/yyyy 23:59:59"), " AND "
         
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "VW_CajasPuestos_v2_5", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "DESC"
         ObjTablasIO.setearCampoOperadorValor "tpAcceso", "=", "Administración"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "VW_CajasPuestos_v2_5", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         
         ObjTablasIO.setearCampoOperadorValor "dsUsuario", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlSaldoInicialPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlTotalSaldoFinalReal", "->", ""
         
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "VW_CajasPuestos_v2_5"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cajas", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cajas", Me.txtBusqueda, KeyAscii)
        
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
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

    
    vlDiaEuro = CSng(ObtenerCampo("vlDiaEuro").Text)
    vlDiaDolar = CSng(ObtenerCampo("vlDiaDolar").Text)
    
    Select Case pTag
    Case "vlTotalSaldoFinalReal"
        ObtenerPesos = ObtenerValoresNumericos("vlSaldoFinalRealEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoFinalRealPesos")
    Case "vlTotalSaldoFinal"
        ObtenerPesos = ObtenerValoresNumericos("vlCierreEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierreDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlCierrePesos")
    Case "vlTotalSaldoInicial"
        ObtenerPesos = ObtenerValoresNumericos("vlSaldoInicialEuros") * vlDiaEuro
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoInicialDolares") * vlDiaDolar
        ObtenerPesos = ObtenerPesos + ObtenerValoresNumericos("vlSaldoInicialPesos")
    End Select
    

    
End Function

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
        objDiccionariodeDatos.FormatearCampoControl "TB_Cajas", _
                                  Me.txtFields(Index), "GotFocus"
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

