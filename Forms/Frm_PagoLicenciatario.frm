VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form frm_PagoLicenciatario 
   Caption         =   "Manejo de Pago a Licenciatario y Cobro a Cta. Cte."
   ClientHeight    =   7995
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   13875
   ClipControls    =   0   'False
   Icon            =   "Frm_PagoLicenciatario.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7995
   ScaleWidth      =   13875
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   13875
      _ExtentX        =   24474
      _ExtentY        =   1164
      ButtonWidth     =   2117
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgPagoLicenciatarios"
      HotImageList    =   "imgPagoLicenciatariosResaltado"
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
            Object.Visible         =   0   'False
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
      MouseIcon       =   "Frm_PagoLicenciatario.frx":030A
      Begin MSComctlLib.ImageList imgPagoLicenciatariosResaltado 
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
               Picture         =   "Frm_PagoLicenciatario.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":1BDA
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgPagoLicenciatarios 
         Left            =   3450
         Top             =   -90
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
               Picture         =   "Frm_PagoLicenciatario.frx":2254
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":236C
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":24C0
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":25D8
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":26E4
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":2838
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":2940
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":2FBC
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":311C
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":3570
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":39C4
               Key             =   "Imprimir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   7395
      Left            =   -60
      TabIndex        =   5
      Top             =   555
      Width           =   13890
      Begin VB.Frame fra_totales 
         Height          =   1515
         Left            =   180
         TabIndex        =   52
         Top             =   5850
         Width           =   13665
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   3
            Left            =   8130
            Locked          =   -1  'True
            TabIndex        =   89
            Tag             =   "vlAcumTarjeta"
            Top             =   390
            Width           =   825
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   2
            Left            =   6300
            Locked          =   -1  'True
            TabIndex        =   87
            Tag             =   "vlSaldoReales"
            Top             =   1005
            Width           =   870
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   13
            Left            =   3570
            Locked          =   -1  'True
            TabIndex        =   71
            TabStop         =   0   'False
            Tag             =   "vlSaldoPesos"
            Top             =   1005
            Width           =   900
         End
         Begin VB.CommandButton cmdCompensar 
            Caption         =   "Compensar"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   780
            Left            =   90
            TabIndex        =   70
            Tag             =   "cmdCompensar"
            Top             =   435
            Width           =   1650
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   16
            Left            =   4500
            Locked          =   -1  'True
            TabIndex        =   69
            Tag             =   "vlSaldoDolares"
            Top             =   1005
            Width           =   885
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   17
            Left            =   5400
            Locked          =   -1  'True
            TabIndex        =   68
            Tag             =   "vlSaldoEuros"
            Top             =   1005
            Width           =   885
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   18
            Left            =   6300
            Locked          =   -1  'True
            TabIndex        =   67
            Tag             =   "vlAcumReales"
            Top             =   390
            Width           =   900
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   20
            Left            =   5400
            Locked          =   -1  'True
            TabIndex        =   66
            Tag             =   "vlAcumEuros"
            Top             =   390
            Width           =   885
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   21
            Left            =   4500
            Locked          =   -1  'True
            TabIndex        =   65
            Tag             =   "vlAcumDolares"
            Top             =   390
            Width           =   888
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   22
            Left            =   3585
            Locked          =   -1  'True
            TabIndex        =   64
            Tag             =   "vlAcumPesos"
            Top             =   390
            Width           =   900
         End
         Begin VB.Frame Frame1 
            Caption         =   "Saldo/Cobro Anterior"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   1020
            Left            =   8985
            TabIndex        =   55
            Top             =   270
            Width           =   4650
            Begin VB.TextBox txtIdRecibo 
               Appearance      =   0  'Flat
               BackColor       =   &H8000000F&
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FF0000&
               Height          =   300
               Left            =   1065
               Locked          =   -1  'True
               TabIndex        =   56
               Top             =   630
               Width           =   2565
            End
            Begin VB.Label Label29 
               Caption         =   "€"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   3540
               TabIndex        =   86
               Top             =   315
               Width           =   195
            End
            Begin VB.Label lblsaldoAnteriorReales 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00C0FFFF&
               BorderStyle     =   1  'Fixed Single
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FF0000&
               Height          =   300
               Left            =   2670
               TabIndex        =   85
               Top             =   255
               Width           =   840
            End
            Begin VB.Label Label10 
               Caption         =   "Recibo:"
               ForeColor       =   &H8000000D&
               Height          =   165
               Left            =   345
               TabIndex        =   63
               Top             =   735
               Width           =   675
            End
            Begin VB.Label Label9 
               Caption         =   "$"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   30
               TabIndex        =   62
               Top             =   315
               Width           =   165
            End
            Begin VB.Label Label11 
               Caption         =   "u$s"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   1125
               TabIndex        =   61
               Top             =   315
               Width           =   345
            End
            Begin VB.Label Label12 
               Caption         =   "R$"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   9
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00800000&
               Height          =   255
               Left            =   2385
               TabIndex        =   60
               Top             =   315
               Width           =   270
            End
            Begin VB.Label lblsaldoAnteriorPesos 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00C0FFFF&
               BorderStyle     =   1  'Fixed Single
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FF0000&
               Height          =   315
               Left            =   195
               TabIndex        =   59
               Top             =   255
               Width           =   900
            End
            Begin VB.Label lblsaldoAnteriordolares 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00C0FFFF&
               BorderStyle     =   1  'Fixed Single
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FF0000&
               Height          =   315
               Left            =   1515
               TabIndex        =   58
               Top             =   255
               Width           =   840
            End
            Begin VB.Label lblsaldoAnterioreuros 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00C0FFFF&
               BorderStyle     =   1  'Fixed Single
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00FF0000&
               Height          =   315
               Left            =   3735
               TabIndex        =   57
               Top             =   255
               Width           =   840
            End
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   375
            Index           =   0
            Left            =   7185
            Locked          =   -1  'True
            TabIndex        =   54
            Tag             =   "vlAcumIVA"
            Top             =   1005
            Width           =   900
         End
         Begin VB.TextBox txtSaldos 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            ForeColor       =   &H00000000&
            Height          =   390
            Index           =   1
            Left            =   7215
            Locked          =   -1  'True
            TabIndex        =   53
            Tag             =   "vlAcumComision"
            Top             =   390
            Width           =   900
         End
         Begin VB.Label Label31 
            Alignment       =   2  'Center
            Caption         =   "Tarjeta"
            Height          =   255
            Left            =   8010
            TabIndex        =   90
            Tag             =   "vlAcumTarjeta"
            Top             =   135
            Width           =   840
         End
         Begin VB.Label Label27 
            Alignment       =   2  'Center
            Caption         =   "Saldo R$"
            Height          =   255
            Left            =   6285
            TabIndex        =   88
            Top             =   795
            Width           =   840
         End
         Begin VB.Label lblSaldo 
            Caption         =   "Saldo a Pagar /"
            Height          =   225
            Left            =   1815
            TabIndex        =   84
            Top             =   720
            Width           =   1200
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Caption         =   "Acumulado"
            Height          =   255
            Left            =   1890
            TabIndex        =   83
            Top             =   465
            Width           =   1560
         End
         Begin VB.Label Label4 
            Alignment       =   2  'Center
            Caption         =   "a Licenciatario"
            Height          =   285
            Left            =   1755
            TabIndex        =   82
            Top             =   975
            Width           =   1755
         End
         Begin VB.Label Label5 
            Caption         =   "Cobrar"
            ForeColor       =   &H000000FF&
            Height          =   240
            Left            =   3000
            TabIndex        =   81
            Top             =   750
            Width           =   555
         End
         Begin VB.Label Label15 
            Caption         =   "Saldo $"
            Height          =   165
            Left            =   3615
            TabIndex        =   80
            Top             =   810
            Width           =   795
         End
         Begin VB.Label Label16 
            Caption         =   "Saldo u$s"
            Height          =   165
            Left            =   4545
            TabIndex        =   79
            Top             =   810
            Width           =   795
         End
         Begin VB.Label Label17 
            Caption         =   "Saldo €"
            Height          =   165
            Left            =   5475
            TabIndex        =   78
            Top             =   810
            Width           =   795
         End
         Begin VB.Label Label22 
            Caption         =   "IVA"
            Height          =   165
            Left            =   7425
            TabIndex        =   77
            Top             =   810
            Width           =   420
         End
         Begin VB.Label Label21 
            Alignment       =   2  'Center
            Caption         =   "Pesos"
            Height          =   255
            Left            =   3570
            TabIndex        =   76
            Top             =   135
            Width           =   930
         End
         Begin VB.Label Label23 
            Alignment       =   2  'Center
            Caption         =   "Dolares"
            Height          =   255
            Left            =   4500
            TabIndex        =   75
            Top             =   135
            Width           =   900
         End
         Begin VB.Label Label24 
            Alignment       =   2  'Center
            Caption         =   "Euros"
            Height          =   255
            Left            =   5400
            TabIndex        =   74
            Top             =   150
            Width           =   900
         End
         Begin VB.Label Label25 
            Alignment       =   2  'Center
            Caption         =   "Reales"
            Height          =   255
            Left            =   6315
            TabIndex        =   73
            Top             =   135
            Width           =   840
         End
         Begin VB.Label Label26 
            Alignment       =   2  'Center
            Caption         =   "Comisión"
            Height          =   255
            Left            =   7215
            TabIndex        =   72
            Top             =   135
            Width           =   840
         End
      End
      Begin VB.CheckBox Chk_IncluirAnulados 
         Appearance      =   0  'Flat
         Caption         =   "Incluir Anulados"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   6024
         TabIndex        =   45
         Top             =   720
         Width           =   1425
      End
      Begin VB.Frame Frame2 
         Caption         =   "Falta compensar"
         ForeColor       =   &H000000C0&
         Height          =   960
         Left            =   7470
         TabIndex        =   36
         Top             =   75
         Width           =   6375
         Begin VB.Label Label28 
            Caption         =   "R$"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   2355
            TabIndex        =   51
            Top             =   285
            Width           =   270
         End
         Begin VB.Label lbl_falta_comp_reales 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   2655
            TabIndex        =   50
            Top             =   240
            Width           =   870
         End
         Begin VB.Label Label13 
            Caption         =   "Fecha"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   510
            TabIndex        =   44
            Top             =   645
            Width           =   615
         End
         Begin VB.Label lbl_falta_comp_dtcupon_hora_corte 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   1170
            TabIndex        =   43
            Top             =   600
            Width           =   2475
         End
         Begin VB.Label lbl_falta_comp_euros 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   3780
            TabIndex        =   42
            Top             =   240
            Width           =   840
         End
         Begin VB.Label lbl_falta_comp_dolares 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   1470
            TabIndex        =   41
            Top             =   255
            Width           =   840
         End
         Begin VB.Label lbl_falta_comp_pesos 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   165
            TabIndex        =   40
            Top             =   255
            Width           =   900
         End
         Begin VB.Label Label18 
            Caption         =   "€"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   3585
            TabIndex        =   39
            Top             =   285
            Width           =   240
         End
         Begin VB.Label Label19 
            Caption         =   "u$s"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   1095
            TabIndex        =   38
            Top             =   300
            Width           =   345
         End
         Begin VB.Label Label20 
            Caption         =   "$"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   30
            TabIndex        =   37
            Top             =   300
            Width           =   165
         End
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2595
         TabIndex        =   28
         Top             =   2535
         Visible         =   0   'False
         Width           =   5340
         Begin VB.CommandButton cmdCancelar 
            Caption         =   "Cancelar"
            Height          =   420
            Left            =   1965
            TabIndex        =   33
            Top             =   1095
            Width           =   1365
         End
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   345
            TabIndex        =   29
            Top             =   570
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label8 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   32
            Top             =   315
            Width           =   855
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   31
            Top             =   315
            Width           =   510
         End
         Begin VB.Label Label7 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   30
            Top             =   330
            Width           =   510
         End
      End
      Begin VB.CheckBox CheckRecibo 
         Appearance      =   0  'Flat
         Caption         =   "Imprime Recibo"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1896
         TabIndex        =   10
         Top             =   744
         Value           =   1  'Checked
         Width           =   1452
      End
      Begin VB.CheckBox CheckTodos 
         Appearance      =   0  'Flat
         Caption         =   "Seleccionar Todos"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   195
         TabIndex        =   9
         Top             =   735
         Width           =   1668
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   324
         Left            =   4260
         TabIndex        =   1
         Top             =   324
         Width           =   3075
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   7230
         Top             =   1575
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483648
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   10
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":403E
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4150
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4262
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4374
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4486
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4598
               Key             =   "Menor"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":46AA
               Key             =   "nota"
               Object.Tag             =   "nota"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":485C
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":49DE
               Key             =   "menos"
               Object.Tag             =   "menos"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_PagoLicenciatario.frx":4AEE
               Key             =   "cruz"
               Object.Tag             =   "cruz"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2595
         TabIndex        =   4
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
         Height          =   4815
         Left            =   180
         TabIndex        =   2
         Top             =   1020
         Width           =   13665
         _ExtentX        =   24104
         _ExtentY        =   8493
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
         Checkboxes      =   -1  'True
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
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         OLEDragMode     =   1
         OLEDropMode     =   1
         NumItems        =   22
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "tpComprobanteCliente"
            Text            =   "Doc"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nrComprabanteCliente"
            Text            =   "Comprobante"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "tpLetraCliente"
            Text            =   "Letra"
            Object.Width           =   882
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "vlMontoCupon"
            Text            =   "Total Fact."
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "tpCupon"
            Text            =   "Cond. Venta"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "vlPagoPesos"
            Text            =   "Pago $"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "vlPagoDolares"
            Text            =   "Pago u$s"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "vlPagoEuros"
            Text            =   "Pago EU"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "vlPagoReales"
            Text            =   "Pago Real"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "vlComision"
            Text            =   "Retención"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Key             =   "vlRecargoTarjeta"
            Object.Tag             =   "vlRecargoTarjeta"
            Text            =   "Tarjeta"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Object.Tag             =   "nrTalonarioCliente"
            Text            =   "Talonario"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Object.Tag             =   "dtCupon"
            Text            =   "Fecha y Hora del Viaje"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(15) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   14
            Object.Tag             =   "flCobradoalCliente"
            Text            =   "Cobrado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(16) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   15
            Object.Tag             =   "flCompensado"
            Text            =   "Compensado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(17) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   16
            Object.Tag             =   "cdCodBar"
            Text            =   "Cod. de Barras"
            Object.Width           =   2
         EndProperty
         BeginProperty ColumnHeader(18) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   17
            Object.Tag             =   "nrCupon"
            Text            =   "Nro. Cupon"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(19) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   18
            Object.Tag             =   "cdCliente"
            Text            =   "Cod. Cliente"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(20) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   19
            Object.Tag             =   "dsObservacion"
            Text            =   "Observación"
            Object.Width           =   5292
         EndProperty
         BeginProperty ColumnHeader(21) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   20
            Object.Tag             =   "vlIVA"
            Text            =   "IVA"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(22) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   21
            Object.Tag             =   "flAnulado"
            Text            =   "flAnulado"
            Object.Width           =   2
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         ItemData        =   "Frm_PagoLicenciatario.frx":4C40
         Left            =   180
         List            =   "Frm_PagoLicenciatario.frx":4C42
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   315
         Width           =   2400
      End
      Begin VB.Label lblCantidaddeCD 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         ForeColor       =   &H80000008&
         Height          =   228
         Left            =   5652
         TabIndex        =   49
         Top             =   744
         Width           =   288
      End
      Begin VB.Label Label14 
         Alignment       =   1  'Right Justify
         Caption         =   "CD"
         Height          =   252
         Left            =   5400
         TabIndex        =   48
         Top             =   768
         Width           =   240
      End
      Begin VB.Label label30 
         Alignment       =   1  'Right Justify
         Caption         =   "Retornos"
         Height          =   252
         Left            =   4416
         TabIndex        =   47
         Top             =   768
         Width           =   660
      End
      Begin VB.Label lblCantidaddeRetornos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         ForeColor       =   &H80000008&
         Height          =   228
         Left            =   5088
         TabIndex        =   46
         Top             =   744
         Width           =   288
      End
      Begin VB.Label lblCantidaddeViajes 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "0"
         ForeColor       =   &H80000008&
         Height          =   228
         Left            =   4080
         TabIndex        =   27
         Top             =   744
         Width           =   300
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         Caption         =   "Cantidad"
         Height          =   252
         Left            =   3396
         TabIndex        =   26
         Top             =   768
         Width           =   660
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4335
         TabIndex        =   7
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   195
         TabIndex        =   6
         Top             =   105
         Width           =   795
      End
   End
   Begin VB.Frame fraPagoLicenciatarios 
      BorderStyle     =   0  'None
      Height          =   8715
      Left            =   60
      TabIndex        =   0
      Top             =   705
      Width           =   11130
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   3900
         Left            =   1770
         ScaleHeight     =   3870
         ScaleWidth      =   6870
         TabIndex        =   13
         Top             =   1350
         Width           =   6900
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   6
            Left            =   285
            Locked          =   -1  'True
            TabIndex        =   34
            TabStop         =   0   'False
            Tag             =   "vlIVA"
            Top             =   3375
            Width           =   1410
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   3
            Left            =   4200
            Locked          =   -1  'True
            TabIndex        =   19
            TabStop         =   0   'False
            Tag             =   "dtCupon"
            Top             =   480
            Width           =   2310
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   1350
            Index           =   20
            Left            =   300
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   18
            TabStop         =   0   'False
            Tag             =   "dsObservacion"
            Top             =   1665
            Width           =   6210
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   2
            Left            =   330
            Locked          =   -1  'True
            TabIndex        =   17
            TabStop         =   0   'False
            Tag             =   "nrLicencia"
            Top             =   480
            Width           =   810
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   1
            Left            =   2025
            Locked          =   -1  'True
            TabIndex        =   16
            TabStop         =   0   'False
            Tag             =   "nrComprabanteCliente"
            Top             =   480
            Width           =   2145
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   1185
            Locked          =   -1  'True
            TabIndex        =   15
            TabStop         =   0   'False
            Tag             =   "nrTalonarioCliente"
            Top             =   480
            Width           =   810
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   5
            Left            =   315
            Locked          =   -1  'True
            TabIndex        =   14
            TabStop         =   0   'False
            Tag             =   "dsDestino"
            Top             =   1065
            Width           =   6180
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "IVA"
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
            Left            =   285
            TabIndex        =   35
            Top             =   3135
            Width           =   480
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Fecha y Hora del Viaje"
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
            Left            =   4200
            TabIndex        =   25
            Top             =   255
            Width           =   2085
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Observación de Pago"
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
            Left            =   315
            TabIndex        =   24
            Top             =   1425
            Width           =   3810
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   255
            Index           =   2
            Left            =   345
            TabIndex        =   23
            Top             =   240
            Width           =   915
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Index           =   1
            Left            =   2025
            TabIndex        =   22
            Top             =   240
            Width           =   1380
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Talonario"
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
            Left            =   1155
            TabIndex        =   21
            Top             =   240
            Width           =   915
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Destinos"
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
            Left            =   330
            TabIndex        =   20
            Top             =   825
            Width           =   915
         End
      End
      Begin VB.TextBox txtFields 
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdCaja"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   4
         Left            =   270
         Locked          =   -1  'True
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "nrCupon"
         Top             =   6420
         Visible         =   0   'False
         Width           =   810
      End
      Begin VB.Label lblLabels 
         BackStyle       =   0  'Transparent
         Caption         =   "Nro. de Cupón"
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
         Left            =   270
         TabIndex        =   12
         Top             =   6180
         Visible         =   0   'False
         Width           =   915
      End
   End
End
Attribute VB_Name = "frm_PagoLicenciatario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Const C_TPCUPON = 4
Const C_dtCupon = 13
Const C_vlIVA = 20
Const C_nrCupon = 17


Dim EstadoABM  As Byte
Dim objControl As New CControl
Dim lerror     As String
Dim bExportando As Boolean


Const CONCEPTO_PAGO_DE_COMPROBANTES = "1027"
Const CONCEPTO_COMISIÓN_COOPERATIVA = "1028"
Const CONCEPTO_COBRO_A_CUENTA_CORRIENTE = "1063"
Const CONCEPTO_COBRO_IVA_AL_LICENCIATARIO = "1064"
Const CONCEPTO_PAGO_A_LOS_LICENCIATARIOS_EN_REAL = "2030"
Const CONCEPTO_COBRO_A_CUENTA_CORRIENTE_990 = "2034"


Public COBRO_COMISION_CD_RE_OBLIGATORIA As String
Public CANT_VIAJES_A_COMP As Integer
Public CTROL_CANT_VIAJES As String

Public RESTRINGE_TARJETAS As String



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




Private Sub CheckTodos_Click()
Dim i   As Integer

    ' inicializamos las marcas
    For i = 1 To Me.lstBusqueda.ListItems.Count
        Me.lstBusqueda.ListItems(i).Checked = False
    Next
    
    Me.lblCantidaddeCD.Caption = 0
    Me.lblCantidaddeRetornos.Caption = 0
    Me.lblCantidaddeViajes.Caption = 0
    
    
    If Me.CheckTodos.value Then
        ' Selecciona todo  -  Cobros en destinos
            For i = 1 To Me.lstBusqueda.ListItems.Count
                If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Cobro en Destino" Then
                    If Not sepuedeCompensar(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dtCupon", i), _
                            objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i), _
                            objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i), _
                              Me.lstBusqueda.ListItems(i).Checked, False, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flCobradoalCliente", i)) Then
                      Me.lstBusqueda.ListItems(i).Checked = False
                    Else
                       Me.lstBusqueda.ListItems(i).Checked = True
                    End If
                End If
                ActualizarCantidadViajes
            Next

        
        For i = 1 To Me.lstBusqueda.ListItems.Count
            If Not sepuedeCompensar(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dtCupon", i), _
                    objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i), _
                    objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i), _
                      Me.lstBusqueda.ListItems(i).Checked, False, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flCobradoalCliente", i)) Then
              Me.lstBusqueda.ListItems(i).Checked = False
            Else
               Me.lstBusqueda.ListItems(i).Checked = True
            End If
            ActualizarCantidadViajes
        Next
    Else
        ' deselecciona todo
        For i = 1 To Me.lstBusqueda.ListItems.Count
            If Not sepuedeCompensar(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dtCupon", i), _
                    objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i), _
                    objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i), _
                    Me.lstBusqueda.ListItems(i).Checked, False, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flCobradoalCliente", i)) Then
                Me.lstBusqueda.ListItems(i).Checked = False
            Else
                If Me.COBRO_COMISION_CD_RE_OBLIGATORIA = "S" And _
                   (objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Retorno" Or _
                      objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Cobro en Destino") Then
                    Me.lstBusqueda.ListItems(i).Checked = True
                 Else
                    Me.lstBusqueda.ListItems(i).Checked = False
                 End If
            End If
            ActualizarCantidadViajes
        Next
    End If
    
   DoEvents
   ' ActualizarSaldo  comentado en la version 3.2
   
End Sub

Private Sub cmbCampos_Change()


    txtBusqueda_KeyPress vbKeyReturn
    ActualizarSaldo
    
End Sub

Private Sub cmbCampos_Click()
    
    CargarOperadoresAritmeticos
    Me.txtBusqueda.Text = ""
    txtBusqueda_KeyPress vbKeyReturn
    
End Sub


Private Sub cmdCancelar_Click()
Dim resp As Byte

    resp = MsgBox("Esta seguro que desea cancelar la exportación", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        objExportar.bCancelar = True
    End If

End Sub

Private Sub cmdCompensar_Click()
Dim resp   As Byte

    ActualizarSaldo
    
    If Me.lstBusqueda.ListItems.Count <= 0 Then Exit Sub
    
    If Me.cmbCampos.Text = "Cliente" And Me.lstBusqueda.ListItems(1).Text <> "999" Then
        MsgBox "El campo cliente 'Cliente'  debe ser utilizado unicamente con la licencia 999", vbQuestion + vbYesNo, "Atención"
        Exit Sub
    End If
    
    
    If Not hayCuponesparacompensar Then Exit Sub
    resp = MsgBox("Esta seguro que desea realizar la operación", vbQuestion + vbYesNo, "Atención")
    Sleep (600)
    If resp = vbNo Then
        limpiarTotales
        Exit Sub
    End If
    Me.Enabled = False
    If Not CompensarCupones() Then
        Me.Enabled = True
        Exit Sub
    End If
    Me.Enabled = True
    
    txtBusqueda_KeyPress 13
    ActualizarSaldo
    obtener_suma_falta_compensar
    
End Sub



Private Sub imprimirPagoLicenciatario(IdRecibo As String, tpRecibo)

    
    Frm_Principal.LimpiarReporte
    
    If tpRecibo = "Cliente" Then
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_recibotacte_v4_7.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Cobro a Cuenta Corriente"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
        Frm_Principal.CrystalReport1.StoredProcParam(1) = 1
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description + " Reporte " + Frm_Principal.CrystalReport1.WindowTitle, vbCritical, "Atención"
        End If
        On Error GoTo 0
    Else
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_pagolicenciatario_v4_9.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        Frm_Principal.CrystalReport1.Destination = crptToWindow
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Recibo - Pago a Licenciatario"
        Frm_Principal.CrystalReport1.StoredProcParam(0) = IdRecibo
        ' Aparece la venta original
        On Error Resume Next
        Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
        Frm_Principal.CrystalReport1.Action = 1
        If Err Then
            Sleep (2000)
            On Error Resume Next
            Frm_Principal.CrystalReport1.Action = 1
            If Err Then
                MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
            End If
        End If
        On Error GoTo 0
    End If
    
    
End Sub



Private Sub Form_Activate()


    bExportando = False
    
    Select Case EstadoABM
    Case alta
    Case Else
        Me.txtBusqueda.SetFocus
    End Select
    Me.lstBusqueda.ListItems.Clear
    
    objGUI.SizeControlsPagoLicenciatario Me, Me.fraBusqCajas, Me.lstBusqueda, 50, 50, fra_totales
        
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

    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    cargarcamposdebusqueda
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    EstadoABM = Consulta
    Me.cmbCampos.ListIndex = 1
    
    obtener_suma_falta_compensar
    
    CANT_VIAJES_A_COMP = objParametros.ObtenerValorBD("CANT_VIAJES_A_COMP")
    CTROL_CANT_VIAJES = objParametros.ObtenerValorBD("CTROL_CANT_VIAJES")
    Me.COBRO_COMISION_CD_RE_OBLIGATORIA = objParametros.ObtenerValorBD("COBRO_COMISION_CD_RE_OBLIGATORIA")
    Me.RESTRINGE_TARJETAS = objParametros.ObtenerValorBD("RESTRINGE_TARJETAS")
    
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



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    If bExportando Then
        Cancel = 1
    End If
    
End Sub


Private Sub Form_Resize()

    objGUI.SizeControlsPagoLicenciatario Me, Me.fraBusqCajas, Me.lstBusqueda, 50, 50, fra_totales

End Sub

Private Sub fraBusqCajas_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    objGUI.SizeControlsPagoLicenciatario Me, Me.fraBusqCajas, Me.lstBusqueda, 50, 50, fra_totales

End Sub

Private Sub lstBusqueda_Click()

    ' agregado en la version 3.5
    objGUI.SizeControlsPagoLicenciatario Me, Me.fraBusqCajas, Me.lstBusqueda, 50, 50, fra_totales
    
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

Private Sub lstBusqueda_DblClick_Manual()
Dim Control As Control
Dim Valor   As Variant


    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCupon", _
    "=", Me.lstBusqueda.SelectedItem.SubItems(C_nrCupon)
    
    ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsDestino", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlIVA", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "->", ""
    
    ObjTablasIO.Seleccionar
    
    
    limpiarControles
    
    For Each Control In Me.txtFields
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



Private Sub lstBusqueda_DblClick()

    lstBusqueda_DblClick_Manual
    
End Sub

Private Sub lstBusqueda_ItemCheck(ByVal Item As MSComctlLib.ListItem)
Dim i  As Integer

   
   Set Me.lstBusqueda.SelectedItem = Item
   
   If Me.cmbCampos.Text = "Cliente" Then Exit Sub
   
   If Not sepuedeCompensar(Item.ListSubItems(C_dtCupon).Text, _
        objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", Item.Index) _
        , objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", Item.Index), _
        Not Item.Checked, True, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flCobradoalCliente", Item.Index)) Then
        Item.Checked = False
   Else
        If Me.COBRO_COMISION_CD_RE_OBLIGATORIA = "S" And _
              (objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", Item.Index) = "Retorno" Or _
                  objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", Item.Index) = "Cobro en Destino") Then
               Item.Checked = True
        End If
   End If
    
   ActualizarCantidadViajes

   ' DoEvents
   ' ActualizarSaldo comentado en la version 3.2
   
   If Item.Checked Then
        Item.Bold = True
        For i = 1 To Item.ListSubItems.Count
            Item.ListSubItems.Item(i).Bold = True
        Next
   Else
        Item.Bold = False
        For i = 1 To Item.ListSubItems.Count
            Item.ListSubItems.Item(i).Bold = False
        Next
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
                lstBusqueda_DblClick_Manual
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Cupones", "nrCaja", objConfig.nrPuesto)
    Case "Eliminar"
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           If Guardarregistro(EstadoABM) Then
                PresentarPantalla Button
                DoEvents
                ActualizarSaldo
                tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
                EstadoABM = Consulta
           End If
    Case "Cancelar"
                PresentarPantalla Button
                DoEvents
                ' ActualizarSaldo    comentado en la version 3.2
                EstadoABM = Consulta
    End Select
    
End Sub



Private Sub ExportaraExcel()
Dim strError  As String

    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub

    objExportar.ConProgressBar = True
    Me.tlb_ABM.Enabled = False
    Me.lstBusqueda.Enabled = False
    bExportando = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView(objConfig.dsPathTemp + "\Libro1", _
    True, "Plantilla.xls", strError, Me.lstBusqueda) Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Screen.MousePointer = vbDefault
        Me.fra_ProgressBar.Visible = False
        bExportando = False
        Me.tlb_ABM.Enabled = True
        Me.lstBusqueda.Enabled = True
        Exit Sub
    End If
    Screen.MousePointer = vbDefault
    Me.fra_ProgressBar.Visible = False
    bExportando = False
    Me.tlb_ABM.Enabled = True
    Me.lstBusqueda.Enabled = True
    
End Sub


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_Cupones"
    
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "<-", Left(ObtenerCampo("dsObservacion"), 400)
        

    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "nrCupon", _
            "=", ObtenerCampo("nrCupon").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Cupones", "nrCupon", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                
                Guardarregistro = True
            End If
    Case CerrarCaja
            ObjTablasIO.setearCampoOperadorValor "nrCaja", _
            "=", ObtenerCampo("nrCaja").Text
            ObjTablasIO.setearCampoOperadorValor "flEstado", _
            "<-", "1"
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
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
           Me.fraPagoLicenciatarios.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           On Error Resume Next
           ObtenerCampo("dsObservacion").SetFocus
           On Error GoTo 0
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqCajas.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraPagoLicenciatarios.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           ' Me.tlb_ABM.Buttons("Agregar").Visible = False
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
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           ' Me.tlb_ABM.Buttons("Agregar").Visible = True
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
           ' Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraPagoLicenciatarios.Visible = False
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           ' Me.tlb_ABM.Buttons("Agregar").Visible = True
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
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           ' Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    ' Me.lstBusqueda.ListItems.Clear

End Sub




Private Sub tlb_ABM_Change()
    ' ActualizarSaldo comentado en la version 3.2
End Sub



Private Sub txtBusqueda_GotFocus()

    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    DoEvents
    
End Sub

Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n As Integer
Dim strBuscada As String

    Me.lblCantidaddeViajes.Caption = 0
    Me.lblCantidaddeRetornos.Caption = 0
    
    
    Me.CheckTodos.value = False
    
    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Or Me.txtBusqueda.Text = "*" Or _
            Me.txtBusqueda.Text = "%" Or Me.txtBusqueda.Text = "-" Or _
            Me.txtBusqueda.Text = "+" Then
            Me.lstBusqueda.ListItems.Clear
            Exit Sub
         End If
         Screen.ActiveForm.MousePointer = vbHourglass
         Me.CheckRecibo.value = vbChecked
         Me.txtBusqueda.Text = ReemplazarPalabra(Me.txtBusqueda.Text, "*", "")
         Me.txtBusqueda.Text = ReemplazarPalabra(Me.txtBusqueda.Text, "%", "")
         strBuscada = Trim(Me.txtBusqueda.Text)
         limpiarControles
         Me.txtBusqueda.Text = strBuscada
         ObjTablasIO.nmTabla = "TB_Cupones"
         
         ' Verificamos si el comprobante ha sido eliminado de la cuenta corriente
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND "
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
        
         ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", "", " ASC "
         ObjTablasIO.setearCampoOperadorValor "tpCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlMontoCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlPagoReales", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlComision", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlRecargoTarjeta", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpComprobanteCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "tpLetraCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flCompensado", "->", ""
         ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flCompensado", "=", "0", " AND "
         
         If Not Me.cmbCampos.Text = "Cliente" Then
            ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0"
         Else
            ObjTablasIO.setearCampoOperadorValor "flAnulado", "=", "0", " AND "
            ObjTablasIO.setearCampoOperadorValor "nrLicencia", "=", "999"
         End If
         
         ObjTablasIO.setearCampoOperadorValor "vlaFavordelLicenciatario", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlafavorAdmin", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsObservacion", "->", ""
         ObjTablasIO.setearCampoOperadorValor "vlIVA", "->", ""
         ObjTablasIO.setearCampoOperadorValor "flAnulado", "->", ""
         
         ObjTablasIO.Seleccionar
         
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Cupones"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            
            '/* version 2.7
            If Me.Chk_IncluirAnulados.value = vbChecked Then
                cmdIncluirAnulados
            End If
            '/* fin vertsion 2.7
            
            If Not Me.cmbCampos.Text = "Cliente" Then
            
                If Not objCtaCteLic.obtenerCantidadCuponesCompensadosdelDia(strBuscada) Then
                    MsgBox "No se puedo obtener la cantidad de tickets compensados." + vbCrLf + "Error extendido: " + objCtaCteLic.Error, vbInformation, "Atención"
                End If
                
            End If
            
            
            ColorearLineas_AsignarValoresPorDefecto
            
            
            ' ActualizarSaldo
            ' Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
             ' MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
         End If
         ActualizarCantidadViajes
    Else
    
        Me.lblsaldoAnteriorPesos.Caption = ""
        Me.lblsaldoAnteriordolares.Caption = ""
        Me.lblsaldoAnterioreuros.Caption = ""
        Me.txtIdRecibo.Text = ""
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Cupones", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
    
End Sub



Private Sub cmdIncluirAnulados()

    If objCtaCteLic.obtenerCuponesAnulados(Trim(Me.txtBusqueda.Text)) Then
        MsgBox "Error al obtener los cupones anulados. " + vbCrLf + objCtaCteLic.Error, vbInformation, "Atención"
        Exit Sub
    End If
    objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstBusqueda, 0, "TB_Cupones"
    
End Sub

Private Sub ColorearLineas_AsignarValoresPorDefecto()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem
Dim vlRetencion As Single
Dim Valor       As Single

    For i = 1 To Me.lstBusqueda.ListItems.Count
    
    
    
        If sepuedeCompensar(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dtCupon", i), _
                objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i), _
                objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i), _
                False, False, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flCobradoalCliente", i)) Then
                
                 If Me.COBRO_COMISION_CD_RE_OBLIGATORIA = "S" And _
                   (objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Retorno" Or _
                   objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Cobro en Destino") Then
                    Me.lstBusqueda.ListItems(i).Checked = True
                 Else
                    Me.lstBusqueda.ListItems(i).Checked = False
                 End If

        
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                ' Si la factura es de monto cero
                If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Cobro en Destino" Or _
                   objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) = "Retorno" Then
                     ' se trata de Cobro en destino o Retorno
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = True
                    Me.lstBusqueda.ListItems(i).ForeColor = Rojo
                    Me.lstBusqueda.ListItems(i).Bold = True
                Else
                    ' viajes al contado y tarjeta
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Azul
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = False
                    Me.lstBusqueda.ListItems(i).ForeColor = Azul
                End If
                ActualizarCantidadViajes
            Next j
        Else
            ' grisamos el registro
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Gris
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Bold = True
            Next j
            Me.lstBusqueda.ListItems(i).ForeColor = Gris
            Me.lstBusqueda.ListItems(i).Bold = True
            ' Me.lstBusqueda.ListItems(i).Ghosted = True
        End If
    
        For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
        
            If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dsObservacion", i) <> "" Then
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Text
            End If
            
            
            '  version 2.7 resaltar cupon anulado
            If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i) = "SI" Then
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = "ANULADO"
            End If
        
            ' Sumamos el IVA a la retención
            If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i) = "" Then
                Valor = 0
            Else
                Valor = CSng(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i))
            End If
            
            
            If Valor > 0 Then
                Set ItemList = Me.lstBusqueda.ListItems.Item(i)
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).Text + " - posee IVA "
            End If
            
        Next j
        
            
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "dsObservacion", i) <> "" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 7
            ItemList.CreateDragImage
        End If
        
                    
        '  version 2.7 resaltar cupon anulado
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i) = "SI" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 10
            ItemList.CreateDragImage
        End If
        

        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i) = "" Then
            Me.lstBusqueda.ListItems(i).SubItems(C_vlIVA) = FormatNumber(0, 2)
        Else
            Valor = FormatNumber(CSng(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i)), 2)
        End If
    
       ' Resaltamos el registro IVA con el icono de la calculadora
        If Valor > 0 Then
        
                ' Sumamos el IVA a la retención
                ' Set ItemList = Me.lstBusqueda.ListItems.Item(i)
                ' vlRetencion = Me.lstBusqueda.ListItems(i).SubItems(7)
                ' vlRetencion = vlRetencion + CSng(objControl.buscarListviewValorColumnaIndice (Me.lstBusqueda, "dsObservacion", i ))
                ' Me.lstBusqueda.ListItems(i).SubItems(7) = FormatNumber(vlRetencion, 2)
                
                ItemList.SmallIcon = 8
                ItemList.CreateDragImage
        End If
        
    Next i

End Sub



Public Function sepuedeCompensar(pdtCupon As String, flAnulado As String, _
                                 ptpCupon As String, pSeleccionado As Boolean, _
                                 pavisarError As Boolean, pflCobradoalCliente As String) As Boolean

    If flAnulado = "SI" Then
        sepuedeCompensar = False
        Exit Function
    End If
    
    objSPs.nmStoredProcedure = "SP_sepuedecompensar_2_0"
    objSPs.setearCampoValor "@dtcupon_param", pdtCupon
    
    If Not objSPs.ExecSP() Then
        MsgBox objSPs.Error, vbCritical, "Atención"
    End If

    If objSPs.rs_resultados("sepuedecompensar") = 1 Then
        sepuedeCompensar = True
    Else
        sepuedeCompensar = False
        Exit Function
    End If
    
    
    If CTROL_CANT_VIAJES = "N" Then Exit Function
    
    Dim vlCantidaddeViajes As Single
    Dim vlCantidaddeRetornos As Single
    Dim vlCantidad_Viajes_Seleccionados As Single
    Dim vlCobrosenDestinos As Single
    
    vlCantidaddeViajes = Me.lblCantidaddeViajes.Caption
    vlCantidaddeRetornos = Me.lblCantidaddeRetornos.Caption
    vlCobrosenDestinos = Me.lblCantidaddeCD.Caption


    If pSeleccionado And _
            Me.COBRO_COMISION_CD_RE_OBLIGATORIA = "S" _
            And ptpCupon = "Retorno" Then
        sepuedeCompensar = True
        Exit Function
    End If

    '-- si el registro ya estaba seleccionado
    If pSeleccionado And _
            Me.COBRO_COMISION_CD_RE_OBLIGATORIA = "S" _
            And ptpCupon = "Cobro en Destino" Then
        sepuedeCompensar = True
        Exit Function
    End If
    
    If pSeleccionado Then
         vlCantidaddeViajes = vlCantidaddeViajes - 1
    Else
        vlCantidaddeViajes = vlCantidaddeViajes + 1
    End If
                                 
    ' vlCantidad_Viajes_Seleccionados = vlCantidaddeViajes - (vlCantidaddeRetornos + vlCobrosenDestinos)
    vlCantidad_Viajes_Seleccionados = vlCantidaddeViajes - (vlCantidaddeRetornos)
    
    If vlCantidad_Viajes_Seleccionados > CANT_VIAJES_A_COMP - objCtaCteLic.CuponesCompensados Then
          If pavisarError Then
            Dim strMSG As String
            strMSG = "No se puede seleccionar el viaje. Se supera el tope diario permitido." + vbCrLf
            strMSG = strMSG + "Viajes compensados del día: " + CStr(objCtaCteLic.CuponesCompensados) + vbCrLf
            strMSG = strMSG + "Total permitido x día (sin retornos): " + CStr(CANT_VIAJES_A_COMP) + vbCrLf
            strMSG = strMSG + "Total Seleccionado (sin retornos): " + CStr(vlCantidad_Viajes_Seleccionados)
            MsgBox strMSG, vbInformation + vbDefaultButton1, "Compensación"
          End If
          sepuedeCompensar = False
    Else
          sepuedeCompensar = True
    End If
    
    ' agregado en la version 4.9
    If Me.RESTRINGE_TARJETAS = "S" Then
        If (ptpCupon = "Tarjeta de Crédito" Or ptpCupon = "Tarjeta de Débito") Then
            If pflCobradoalCliente = "SI" Then
                sepuedeCompensar = True
            Else
                sepuedeCompensar = False
            End If
        End If
    End If
    
     
End Function


Private Sub ColorearLineasyResaltarObservacion()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i) <> "" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 7
            ItemList.CreateDragImage
        End If
        
        
        '  version 2.7 resaltar cupon anulado
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flAnulado", i) = "SI" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 10
            ItemList.CreateDragImage
        End If
        
    Next i

End Sub


Private Function grabarRecibo(pIdRecibo As String, pCliente As String, pdsRazonSocial As String) As String

    ' grabar el recibo
    ObjTablasIO.nmTabla = "TB_Recibos"
    ObjTablasIO.setearCampoOperadorValor "IdRecibo", "<-", pIdRecibo
    ObjTablasIO.setearCampoOperadorValor "vlAcumDolares", "<-", ObtenerCampo("vlAcumDolares").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoPesos", "<-", ObtenerCampo("vlSaldoPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoEuros", "<-", ObtenerCampo("vlSaldoEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlAcumPesos", "<-", ObtenerCampo("vlAcumPesos").Text
    ObjTablasIO.setearCampoOperadorValor "vlAcumEuros", "<-", ObtenerCampo("vlAcumEuros").Text
    ObjTablasIO.setearCampoOperadorValor "vlAcumComision", "<-", ObtenerCampo("vlAcumComision").Text
    ObjTablasIO.setearCampoOperadorValor "vlAcumTarjeta", "<-", ObtenerCampo("vlAcumTarjeta").Text
    ObjTablasIO.setearCampoOperadorValor "vlSaldoDolares", "<-", ObtenerCampo("vlSaldoDolares").Text
    ObjTablasIO.setearCampoOperadorValor "dtRecibo", "<-", Now
    
    If Me.cmbCampos.Text = "Cliente" Or Me.txtBusqueda.Text = 990 Then
        ObjTablasIO.setearCampoOperadorValor "tpRecibo", "<-", "Recibo de Cobranza de Cta. Cte."
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "<-", pCliente
        ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "<-", pdsRazonSocial
    Else
        ObjTablasIO.setearCampoOperadorValor "tpRecibo", "<-", "Detalle de Pago a Licenciatario"
    End If
    
    ObjTablasIO.setearCampoOperadorValor "nrCaja", "<-", objParametros.ObtenerValor("nrCaja")
    
    If ObjTablasIO.Insertar Then
        objDiccionariodeDatos.GuardarSiguienteValor "TB_Recibos", "IdRecibo", objConfig.nrPuesto
        grabarRecibo = pIdRecibo
    Else
        grabarRecibo = ""
    End If

End Function


' Programar
Private Function CompensarCupones() As Boolean
Dim i                       As Integer
Dim j                       As Integer
Dim IdRecibo                As String
Dim strdsRazonSocial        As String
Dim bNohaynadaparacompensar As Boolean
Dim estaOK                  As Boolean
Dim CantIntentos            As Integer
Dim bmasdeunaLicencia       As Boolean
Dim strLicencia             As String
Dim cantidad_Viajes         As Integer
Dim cupones_a_compensar     As Integer
Dim sql                     As String
Dim bmasdeunCliente         As Boolean
Dim cdCliente               As String


    cantidad_Viajes = 0

    bNohaynadaparacompensar = True
    
    
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) <> "Retorno" Then
                cantidad_Viajes = cantidad_Viajes + 1
            End If
            bNohaynadaparacompensar = False
        End If
        
    Next i

    If bNohaynadaparacompensar Then
        MsgBox "No hay comprobantes seleccionados.", vbInformation + vbDefaultButton1, "Atención"
        CompensarCupones = False
        Exit Function
    End If
    

    If Not Me.cmbCampos.Text = "Cliente" Then
        If CTROL_CANT_VIAJES = "S" Then
            Dim vlCantidaddeViajes As Single
            Dim vlCantidaddeRetornos As Single
            Dim vlCantidad_Viajes_Seleccionados As Single
            Dim vlCobrosenDestinos As Single
            
            vlCantidaddeViajes = Me.lblCantidaddeViajes.Caption
            vlCantidaddeRetornos = Me.lblCantidaddeRetornos.Caption
            vlCobrosenDestinos = Me.lblCantidaddeCD.Caption
            vlCantidad_Viajes_Seleccionados = vlCantidaddeViajes - (vlCantidaddeRetornos + vlCobrosenDestinos)
            If vlCantidad_Viajes_Seleccionados > CANT_VIAJES_A_COMP - objCtaCteLic.CuponesCompensados Then
                    MsgBox "No se puede seleccionar el viaje. Se supera el tope diario permitido.", vbInformation + vbDefaultButton1, "Compensación"
                    Exit Function
            End If
        End If
    End If
    
    ' Add version 4.7
    If Me.cmbCampos.Text = "Cliente" Then
        If CSng(ObtenerCampo("vlSaldoPesos").Text) < 0 Then
            MsgBox "El saldo de la cuenta corriente no puede quedar en negativo, debe ajustar con una NC.", vbInformation + vbDefaultButton1, "Compensación"
            Exit Function
        End If
    End If
    
        
    
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            strLicencia = Me.lstBusqueda.ListItems(i)
            Exit For
        End If
    Next i
    
    bmasdeunaLicencia = False
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            If Not strLicencia = Me.lstBusqueda.ListItems(i) Then
                bmasdeunaLicencia = True
                Exit For
            End If
        End If
    Next i
    
    If bmasdeunaLicencia Then
        MsgBox "No se pueden compensar cupones de distintas licencias, por favor verifique su selección", vbInformation + vbDefaultButton1, "Atención"
        CompensarCupones = False
        Exit Function
    End If
    
    '/* INICIO - Agregado en la version 4.2
'    bmasdeunCliente = False
'    For i = 1 To Me.lstBusqueda.ListItems.Count
'        If Me.lstBusqueda.ListItems(i).Checked Then
'            cdCliente = objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "cdCliente", i)
'            Exit For
'        End If
'    Next i
'
'    For i = 1 To Me.lstBusqueda.ListItems.Count
'        If Me.lstBusqueda.ListItems(i).Checked Then
'            If cdCliente <> objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "cdCliente", i) Then
'            bmasdeunCliente = True
'            End If
'        End If
'    Next i
'
'    If bmasdeunCliente Then
'        MsgBox "No se pueden compensar cupones de distintos clientes, por favor verifique su selección", vbInformation + vbDefaultButton1, "Atención"
'        CompensarCupones = False
'        Exit Function
'    End If
    '/* FIN:  Agregado en la version 4.2

    
    
    
    ' Abrimos la transacción
    If Not objbasededatos.BeginTrans Then
        objbasededatos.RollBackTrans
        MsgBox "No se puede iniciar transacción." + vbCrLf + "Error extendido: " + objbasededatos.Error, vbInformation + vbDefaultButton1, "Atención"
        CompensarCupones = False
        Exit Function
    End If
      
     
    IdRecibo = objbasededatos.SP_ObtenerMaxIDRecibo
    
    estaOK = False
    CantIntentos = 0
    
    Do Until estaOK Or (CantIntentos > 4)
    
        ObjTablasIO.nmTabla = "TB_Cupones"
        ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", ""
        ObjTablasIO.setearCampoOperadorValor "IdRecibo", "=", IdRecibo
        ' si hay cupones grabados previamente con este IdRECIBO
        
        If Not ObjTablasIO.Seleccionar Then
            objbasededatos.RollBackTrans
            MsgBox "No se ha podido consultar el ultimo ID de Recibo, por favor intentelo nuevamente.", vbCritical + vbDefaultButton1, "Atención"
            CompensarCupones = False
            Exit Function
        End If
        
        If Not ObjTablasIO.rs_resultados.EOF Then
            ' obtener un nuevo I
            IdRecibo = CDbl(IdRecibo) + 1
        Else
            estaOK = True
            Exit Do
        End If
        CantIntentos = CantIntentos + 1
    Loop
    
    
    If Not estaOK Then
        objbasededatos.RollBackTrans
        MsgBox "Se ha producido un error (controlando el IdRecibo), por favor intente nuevamente realizar esta operación.", vbCritical + vbDefaultButton1, "Atrención"
        CompensarCupones = False
        Exit Function
    End If

    strdsRazonSocial = ""
    If Me.cmbCampos.Text = "Cliente" Or Me.txtBusqueda.Text = 990 Then
        ObjTablasIO.nmTabla = "TB_Clientes"
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsRazonSocial", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsEmail", "->", ""
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "cdCliente", 1), " AND "
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
        
        If Not ObjTablasIO.Seleccionar Then
            objbasededatos.RollBackTrans
            MsgBox "No se ha encontrado el cliente, por favor re-intente nuevamente o comuniquese con el administrador del sistema", vbCritical + vbDefaultButton1, "Atención"
            CompensarCupones = False
            Exit Function
        End If
        
        If Not ObjTablasIO.rs_resultados.EOF Then
            strdsRazonSocial = AdaptarNulos(ObjTablasIO.rs_resultados("dsRazonSocial").value, "")
        Else
            objbasededatos.RollBackTrans
            MsgBox "No se ha encontrado el cliente, por favor re-intente nuevamente o comuniquese con el administrador del sistema", vbCritical + vbDefaultButton1, "Atención"
            CompensarCupones = False
            Exit Function
        End If
        
        cdCliente = ObjTablasIO.rs_resultados("cdCliente")
    End If
    
    

    ' grabar el recibo
    IdRecibo = grabarRecibo(IdRecibo, cdCliente, strdsRazonSocial)
    
    ' control si graba el Recibo
    If IdRecibo = "" Or objbasededatos.recordAffected <> 1 Then
        objbasededatos.RollBackTrans
        MsgBox "Se ha producido un error al grabar el recibo, por favor intente nuevamente realizar esta operación", vbCritical + vbDefaultButton1, "Atrención"
        CompensarCupones = False
        Exit Function
    End If
    
    cupones_a_compensar = 0
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            ObjTablasIO.nmTabla = "TB_Cupones"
            ObjTablasIO.setearCampoOperadorValor "nrCupon", "=", _
                            objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "nrCupon", i), " AND "
            ObjTablasIO.setearCampoOperadorValor "IdRecibo", "IS NULL", ""
            
            Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i)
            Case "Cobro en Destino", "Retorno"
                ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "<-", "0"
                ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "<-", "0"
                ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "<-", "0"
                ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "1"
                ObjTablasIO.setearCampoOperadorValor "flCobradoalCliente", "<-", "1"
                ObjTablasIO.setearCampoOperadorValor "dtCobradoalCliente", "<-", CStr(Now())
                ObjTablasIO.setearCampoOperadorValor "dtCompensado", "<-", CStr(Now())
            Case "Cuenta Corriente", "Tarjeta de Crédito", "Tarjeta de Débito"
                ObjTablasIO.setearCampoOperadorValor "vlPagoPesos", "<-", objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                ObjTablasIO.setearCampoOperadorValor "vlPagoDolares", "<-", "0"
                ObjTablasIO.setearCampoOperadorValor "vlPagoEuros", "<-", "0"
                ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "1"
                ObjTablasIO.setearCampoOperadorValor "dtCompensado", "<-", CStr(Now())
            Case Else
                ObjTablasIO.setearCampoOperadorValor "flCompensado", "<-", "1"
                ObjTablasIO.setearCampoOperadorValor "dtCompensado", "<-", CStr(Now())
            End Select
            ObjTablasIO.setearCampoOperadorValor "nrCajaLicenciatario", "<-", objParametros.ObtenerValor("nrCaja")
            ObjTablasIO.setearCampoOperadorValor "dtCajaLicenciatario", "<-", CStr(Now())
            ObjTablasIO.setearCampoOperadorValor "IdRecibo", "<-", IdRecibo
            ObjTablasIO.setearCampoOperadorValor "dsUsuario", "<-", objUsuario.dsUsuario
            
            
            If Not ObjTablasIO.Actualizar Then
                objbasededatos.RollBackTrans
                MsgBox "Se ha producido un error al actualizar el flag de compensado, por favor intente nuevamente esta operación." + ObjTablasIO.Error + ", por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
                CompensarCupones = False
                Exit Function
            End If
            If objbasededatos.recordAffected = 0 Then
                objbasededatos.RollBackTrans
                MsgBox "Se ha producido un error al actualizar el flag de compensado, por favor intente nuevamente esta operación." + ObjTablasIO.Error + ", por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
                CompensarCupones = False
                Exit Function
            End If
            cupones_a_compensar = cupones_a_compensar + 1
        End If
    Next i
    
    
    ' aqui validamos que se hayan marcado  todos los comprobantes en compensados
    sql = " select count(*) as cupones_a_compensados from tb_cupones where IdRecibo = " + CStr(IdRecibo)
    
    If Not objbasededatos.ExecuteSQL(sql) Then
        objbasededatos.RollBackTrans
        MsgBox "El control de cupones compensados arrojo errores, por favor repita la operación." + ObjTablasIO.Error + ", por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
        CompensarCupones = False
        Exit Function
    End If
    
    If objbasededatos.rs_resultados_valor("cupones_a_compensados") <> cupones_a_compensar Then
        objbasededatos.RollBackTrans
        MsgBox "Los cupones compensados no coinciden con los que desea compensar. " + vbCrLf + "cupones_a_compensados." + _
                CStr(objbasededatos.rs_resultados_valor("cupones_a_compensados")) + _
                " y cupones_a_compensar =" + CStr(cupones_a_compensar) + vbCrLf + " Por favor intente nuevamente.", vbCritical + vbDefaultButton1, "Atención"
        CompensarCupones = False
        Exit Function
    End If
    
    
    Select Case Me.lstBusqueda.ListItems(1).Text
    Case "999"
        If grabarMovimientoContable(IdRecibo, CONCEPTO_COBRO_A_CUENTA_CORRIENTE, objParametros.ObtenerValor("nrCaja"), _
                                     "Cobro a Cuenta Corriente", "Licencia Nro. " + Me.lstBusqueda.ListItems(1).Text, _
                                     ObtenerCampo("vlAcumDolares").Text, ObtenerCampo("vlAcumPesos").Text, _
                                     ObtenerCampo("vlAcumEuros").Text, objUsuario.dsUsuario) Then
                ' Cierra la transaccion OK
                objbasededatos.CommitTrans
        Else
                objbasededatos.RollBackTrans
                MsgBox "Se ha producido un error: " + lerror + ", por favor intente nuevamente", vbCritical + vbDefaultButton1, "Atención"
                CompensarCupones = False
                Exit Function
        End If
    Case "990"
        If grabarMovimientoContable(IdRecibo, CONCEPTO_COBRO_A_CUENTA_CORRIENTE_990, objParametros.ObtenerValor("nrCaja"), _
                                     "Cobro a Cuenta Corriente", "Licencia Nro. " + Me.lstBusqueda.ListItems(1).Text, _
                                     ObtenerCampo("vlAcumDolares").Text, ObtenerCampo("vlAcumPesos").Text, _
                                     ObtenerCampo("vlAcumEuros").Text, objUsuario.dsUsuario) Then
                ' Cierra la transaccion OK
                objbasededatos.CommitTrans
        Else
                objbasededatos.RollBackTrans
                MsgBox "Se ha producido un error: " + lerror + ", por favor intente nuevamente", vbCritical + vbDefaultButton1, "Atención"
                CompensarCupones = False
                Exit Function
        End If
    Case Else
    
        ' PAGO DE COMPROBANTES
        If objCtaCteLic.grabarMovimientoContablePagoLicenciatario(IdRecibo, CONCEPTO_PAGO_DE_COMPROBANTES, objParametros.ObtenerValor("nrCaja"), _
                                                         "Pago a Licenciatario", "Licencia Nro. " + Me.lstBusqueda.ListItems(1).Text, _
                                                         ObtenerCampo("vlSaldoDolares").Text, ObtenerCampo("vlSaldoPesos").Text, _
                                                         ObtenerCampo("vlSaldoEuros").Text, objUsuario.dsUsuario) Then
            If Not objCtaCteLic.grabarMovimientoContablePagoLicenciatarioenMonedaReal(IdRecibo, _
                                        CONCEPTO_PAGO_A_LOS_LICENCIATARIOS_EN_REAL, _
                                        objParametros.ObtenerValor("nrCaja"), _
                                        "Pago a Licenciatario en Reales", _
                                        "Licencia Nro. " + Me.lstBusqueda.ListItems(1).Text, _
                                        ObtenerCampo("vlAcumReales").Text, _
                                        objParametros.ObtenerValor("frm_PagoLicenciatario.vlDiaReal"), _
                                        objUsuario.dsUsuario) Then
            
                objbasededatos.RollBackTrans
                MsgBox "Se ha producido un error en grabarMovimientoContablePagoLicenciatarioenMonedaReal, por favor intente nuevamente", vbCritical + vbDefaultButton1, "Atención"
                CompensarCupones = False
                Exit Function
            End If
            ' Cierra la transaccion OK
            objbasededatos.CommitTrans
        Else
            objbasededatos.RollBackTrans
            MsgBox "Se ha producido un error, por favor intente nuevamente", vbCritical + vbDefaultButton1, "Atención"
            CompensarCupones = False
            Exit Function
        End If
    End Select

    Me.lblsaldoAnteriorPesos.Caption = ObtenerCampo("vlSaldoPesos").Text
    Me.lblsaldoAnteriordolares.Caption = ObtenerCampo("vlSaldoDolares").Text
    Me.lblsaldoAnterioreuros.Caption = ObtenerCampo("vlSaldoEuros").Text
    Me.lblsaldoAnteriorReales.Caption = ObtenerCampo("vlSaldoReales").Text

    
    Me.txtIdRecibo.Text = IdRecibo
    CompensarCupones = True
    
    If CheckRecibo.value = vbChecked Then
        objMovimientos.cdConcepto = ""
        If Me.txtBusqueda.Text = 990 Then
            imprimirPagoLicenciatario IdRecibo, "Cliente"
        Else
            imprimirPagoLicenciatario IdRecibo, Me.cmbCampos.Text
        End If
    End If
    
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
        lerror = objMovimientos.Error
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


' Programar
Private Sub ActualizarSaldo()
Dim i As Integer
Dim j As Integer
Dim vlAcumPesos     As Single
Dim vlAcumDolares   As Single
Dim vlAcumEuros     As Single
Dim vlAcumComision  As Single
Dim vlAcumReales    As Single
Dim vlAcumIVA       As Single
Dim vlSaldoPesos    As Single
Dim vlSaldoDolares  As Single
Dim vlSaldoEuros    As Single
Dim iCantviajes     As Integer
Dim iCantRetornos   As Integer
Dim vlAcumTarjeta   As Single
Dim vlRecargoTarjeta As String

    vlAcumPesos = 0
    vlAcumDolares = 0
    vlAcumEuros = 0
    vlAcumComision = 0
    vlSaldoPesos = 0
    vlSaldoDolares = 0
    vlSaldoEuros = 0
    vlAcumReales = 0

    iCantviajes = 0
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            If Me.cmbCampos.Text = "Cliente" Then
                Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i)
                Case "Contado"
                  ' MOD Y ADD Version 4.7
                   If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i) = "FA" Or _
                        Len(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i)) = 1 Or _
                            objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i) = "ND" Then
                        vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   Else
                        vlAcumPesos = vlAcumPesos - objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   End If
                   vlAcumDolares = "0"
                   vlAcumEuros = "0"
                   vlAcumComision = "0"
                   vlAcumIVA = "0"
                   vlAcumReales = 0
                End Select
            Else
            
                Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i)
                Case "Cobro en Destino"
                   vlAcumPesos = vlAcumPesos - 0
                   vlAcumDolares = vlAcumDolares - 0
                   vlAcumEuros = vlAcumEuros - 0
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                   vlAcumReales = vlAcumReales - 0
                Case "Retorno"
                   iCantRetornos = iCantRetornos + 1
                   vlAcumPesos = vlAcumPesos - 0
                   vlAcumDolares = vlAcumDolares - 0
                   vlAcumEuros = vlAcumEuros - 0
                   vlAcumReales = vlAcumReales - 0
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                Case "Contado"
                ' MOD Y ADD Version 4.7
                   If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i) = "FA" Or _
                        Len(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i)) = 1 Or _
                            objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpComprobanteCliente", i) = "ND" Then
                        vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoPesos", i)
                        vlAcumDolares = vlAcumDolares + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                        vlAcumEuros = vlAcumEuros + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                        vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                        vlAcumReales = vlAcumReales + AdaptarNulos(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoReales", i), 0)
                   Else   ' para Notas de Credito
                        vlAcumPesos = vlAcumPesos - objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoPesos", i)
                        vlAcumDolares = vlAcumDolares - objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                        vlAcumEuros = vlAcumEuros - objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                        vlAcumComision = vlAcumComision - objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                        vlAcumReales = vlAcumReales - AdaptarNulos(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoReales", i), 0)
                   End If
                   
                Case "Cuenta Corriente"
                   vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   vlAcumDolares = vlAcumDolares + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                   vlAcumEuros = vlAcumEuros + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                   vlAcumReales = vlAcumReales + AdaptarNulos(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoReales", i), 0)
                Case "Tarjeta de Crédito", "Tarjeta de Débito"
                   vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   vlAcumDolares = vlAcumDolares + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                   vlAcumEuros = vlAcumEuros + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                   vlAcumReales = vlAcumReales + AdaptarNulos(objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoReales", i), 0)
                   ' Agregado en la version 4.9
                   vlRecargoTarjeta = objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlRecargoTarjeta", i)
                   vlRecargoTarjeta = IIf(vlRecargoTarjeta = "", "0", vlRecargoTarjeta)
                   vlAcumTarjeta = vlAcumTarjeta + vlRecargoTarjeta
                End Select
                ' Sumamos los importes en IVA
                vlAcumIVA = vlAcumIVA + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i)
            End If
            iCantviajes = iCantviajes + 1
        End If
    Next i
    
    Me.lblCantidaddeViajes.Caption = CStr(iCantviajes)
    Me.lblCantidaddeRetornos.Caption = CStr(iCantRetornos)
    
    
    ObtenerCampo("vlAcumPesos").Text = FormatNumber(CStr(vlAcumPesos), 2)
    ObtenerCampo("vlAcumDolares").Text = FormatNumber(CStr(vlAcumDolares), 2)
    ObtenerCampo("vlAcumEuros").Text = FormatNumber(CStr(vlAcumEuros), 2)
    ObtenerCampo("vlAcumReales").Text = FormatNumber(CStr(vlAcumReales), 2)
    
    ObtenerCampo("vlAcumIVA").Text = FormatNumber(CStr(vlAcumIVA), 2)
    
    ObtenerCampo("vlAcumComision").Text = FormatNumber(CStr(vlAcumComision), 2)
    
    ObtenerCampo("vlAcumTarjeta").Text = FormatNumber(CStr(vlAcumTarjeta), 2)
    
    ObtenerCampo("vlSaldoDolares").Text = FormatNumber(CStr(vlAcumDolares), 2)
    ObtenerCampo("vlSaldoEuros").Text = FormatNumber(CStr(vlAcumEuros), 2)
    ObtenerCampo("vlSaldoReales").Text = FormatNumber(CStr(vlAcumReales), 2)
    
    vlSaldoPesos = vlAcumPesos - (vlAcumComision + vlAcumIVA + vlAcumTarjeta)
    ObtenerCampo("vlSaldoPesos").Text = FormatNumber(CStr(vlSaldoPesos), 2)
    
    
    PintarTextodeCampos ObtenerCampo("vlSaldoDolares")
    PintarTextodeCampos ObtenerCampo("vlSaldoEuros")
    PintarTextodeCampos ObtenerCampo("vlSaldoPesos")
    
    'If vlSaldoPesos <= 0 Then
    '    Me.cmdCompensar.Enabled = False
    'Else
    '    Me.cmdCompensar.Enabled = True
    'End If
       
End Sub


Private Sub txtCoddeBarras_KeyDown(KeyCode As Integer, Shift As Integer)
Dim bencontrado     As Boolean
Dim strCodBarras    As String
Dim i               As Integer
Dim n               As Integer

    If KeyCode <> vbKeyReturn Then Exit Sub
    
    ' If Len(Me.txtCoddeBarras.Text) <> objConfig.nrTamanioCodBarra Then Exit Sub
    ' strCodBarras = Me.txtCoddeBarras.Text
    
    If Me.lstBusqueda.ListItems.Count = 0 Then
        MsgBox "Primero debe filtrar  la licencia.", vbInformation, "Atención"
        Me.txtBusqueda.SetFocus
        Exit Sub
    End If
        
    ' Buscar en la brilla y marcar
    
    For i = 1 To Me.lstBusqueda.ListItems.Count
        If InStr(1, objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "cdCodBar", i), strCodBarras, vbTextCompare) > 0 Then
            bencontrado = True
            Me.lstBusqueda.ListItems(i).Checked = True
            Me.lstBusqueda.ListItems(i).Bold = True
            For n = 1 To Me.lstBusqueda.ColumnHeaders.Count - 2
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(n).Bold = True
            Next
            Exit For
        End If
    Next
    
    If Not bencontrado Then
        MsgBox "El comprobante no ha sido encontrado por favor verifiquelo manualmente.", vbInformation, "Atención"
        Exit Sub
    Else
        DoEvents
        ActualizarSaldo
    End If
    
   
End Sub


Private Sub BuscarporCodigodeBarras()
    
        
End Sub




Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtFields(Index), "LostFocus"
End Sub


Private Sub obtener_suma_falta_compensar()
Dim strSQL As String

    strSQL = " sp_obtiene_falta_compensar_v4_2 "
 
    If objbasededatos.ExecStoredProcedures(strSQL) Then
        If objbasededatos.rs_resultados.EOF Then
            Me.lbl_falta_comp_pesos.Caption = "0"
            Me.lbl_falta_comp_euros.Caption = "0"
            Me.lbl_falta_comp_dolares.Caption = "0"
        Else
            Me.lbl_falta_comp_pesos.Caption = objbasededatos.rs_resultados("suma_vlPagoPesos")
            Me.lbl_falta_comp_euros.Caption = objbasededatos.rs_resultados("suma_vlPagoEuros")
            Me.lbl_falta_comp_dolares.Caption = objbasededatos.rs_resultados("suma_vlPagoDolares")
            Me.lbl_falta_comp_reales.Caption = objbasededatos.rs_resultados("suma_vlPagoReales")
            Me.lbl_falta_comp_dtcupon_hora_corte = objbasededatos.rs_resultados("dtcupon_hora_corte")
            
        End If
    End If
      
End Sub

Public Sub limpiarTotales()

    ObtenerCampo("vlAcumPesos").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlAcumDolares").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlAcumEuros").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlAcumIVA").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlAcumComision").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlSaldoDolares").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlSaldoEuros").Text = FormatNumber(CStr(0), 2)
    ObtenerCampo("vlSaldoPesos").Text = FormatNumber(CStr(0), 2)
    PintarTextodeCampos ObtenerCampo("vlSaldoDolares")
    PintarTextodeCampos ObtenerCampo("vlSaldoEuros")
    PintarTextodeCampos ObtenerCampo("vlSaldoPesos")
    
    
End Sub




Private Sub ActualizarCantidadViajes()
Dim i As Integer
Dim j As Integer
Dim vlAcumPesos     As Single
Dim vlAcumDolares   As Single
Dim vlAcumEuros     As Single
Dim vlAcumComision  As Single
Dim vlAcumIVA       As Single
Dim vlSaldoPesos    As Single
Dim vlSaldoDolares  As Single
Dim vlSaldoEuros    As Single
Dim iCantviajes     As Integer
Dim iCantRetornos   As Integer
Dim iCantCobrosenDestinos As Integer
Dim vlRecargoTarjeta As String
Dim vlAcumTarjeta As Single
    ' ---MsgBox " Voy por aca "
    
    vlAcumPesos = 0
    vlAcumDolares = 0
    vlAcumEuros = 0
    vlAcumComision = 0
    vlSaldoPesos = 0
    vlSaldoDolares = 0
    vlSaldoEuros = 0

    iCantviajes = 0
    For i = 1 To Me.lstBusqueda.ListItems.Count
    
        
    
        If Me.lstBusqueda.ListItems(i).Checked Then
            If Me.cmbCampos.Text = "Cliente" Then
                Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i)
                Case "Contado"
                   vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   vlAcumDolares = "0"
                   vlAcumEuros = "0"
                   vlAcumComision = "0"
                   vlAcumIVA = "0"
                End Select
            Else
            
                Select Case objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i)
                Case "Cobro en Destino"
                   iCantCobrosenDestinos = iCantCobrosenDestinos + 1
                   vlAcumPesos = vlAcumPesos - 0
                   vlAcumDolares = vlAcumDolares - 0
                   vlAcumEuros = vlAcumEuros - 0
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                Case "Retorno"
                   iCantRetornos = iCantRetornos + 1
                   vlAcumPesos = vlAcumPesos - 0
                   vlAcumDolares = vlAcumDolares - 0
                   vlAcumEuros = vlAcumEuros - 0
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                Case "Contado"
                   vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoPesos", i)
                   vlAcumDolares = vlAcumDolares + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                   vlAcumEuros = vlAcumEuros + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                Case "Cuenta Corriente", "Tarjeta de Crédito", "Tarjeta de Débito"
                   vlAcumPesos = vlAcumPesos + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlMontoCupon", i)
                   vlAcumDolares = vlAcumDolares + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoDolares", i)
                   vlAcumEuros = vlAcumEuros + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlPagoEuros", i)
                   vlAcumComision = vlAcumComision + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlComision", i)
                   vlRecargoTarjeta = objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlRecargoTarjeta", i)
                   vlRecargoTarjeta = IIf(vlRecargoTarjeta = "", "0", vlRecargoTarjeta)
                   vlAcumTarjeta = vlAcumTarjeta
                End Select
                ' Sumamos los importes en IVA
                vlAcumIVA = vlAcumIVA + objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "vlIVA", i)
            End If
            iCantviajes = iCantviajes + 1
        End If
    Next i
    
    Me.lblCantidaddeViajes.Caption = CStr(iCantviajes)
    Me.lblCantidaddeRetornos.Caption = CStr(iCantRetornos)
    Me.lblCantidaddeCD.Caption = iCantCobrosenDestinos
           
End Sub


Private Function hayCuponesparacompensar() As Boolean
Dim i As Integer
Dim cantidad_Viajes As Integer

    For i = 1 To Me.lstBusqueda.ListItems.Count
        If Me.lstBusqueda.ListItems(i).Checked Then
            If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "tpCupon", i) <> "Retorno" Then
                cantidad_Viajes = cantidad_Viajes + 1
            End If
            hayCuponesparacompensar = True
            Exit Function
        End If
    Next i
    
    hayCuponesparacompensar = False
    
End Function
    
