VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form Frm_MovimientosContables 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Movimientos Contables"
   ClientHeight    =   8145
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10845
   ClipControls    =   0   'False
   Icon            =   "Frm_MovimientosContables.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8145
   ScaleWidth      =   10845
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   10845
      _ExtentX        =   19129
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgMovimientosContables"
      HotImageList    =   "imgMovimientosContables"
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
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Movimiento Contable deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
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
      MouseIcon       =   "Frm_MovimientosContables.frx":030A
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
               Picture         =   "Frm_MovimientosContables.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgMovimientosContables 
         Left            =   8025
         Top             =   15
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
               Picture         =   "Frm_MovimientosContables.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraMovimientosContables 
      BorderStyle     =   0  'None
      Height          =   7470
      Left            =   -45
      TabIndex        =   9
      Top             =   630
      Width           =   10830
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   7170
         Left            =   195
         ScaleHeight     =   7140
         ScaleWidth      =   10455
         TabIndex        =   10
         Top             =   150
         Width           =   10485
         Begin VB.Frame FraMovimiento 
            BackColor       =   &H00FFC0C0&
            BorderStyle     =   0  'None
            Caption         =   "Frame1"
            Height          =   3480
            Left            =   105
            TabIndex        =   48
            Top             =   3540
            Width           =   10305
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   7
               Left            =   30
               TabIndex        =   75
               Tag             =   "dsMovimiento"
               Top             =   240
               Width           =   7365
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
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
               Index           =   5
               Left            =   2940
               Locked          =   -1  'True
               ScrollBars      =   2  'Vertical
               TabIndex        =   73
               TabStop         =   0   'False
               Tag             =   "tpConcepto"
               Top             =   795
               Width           =   1980
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
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
               Index           =   4
               Left            =   15
               Locked          =   -1  'True
               TabIndex        =   72
               TabStop         =   0   'False
               Tag             =   "dsConcepto"
               Top             =   795
               Width           =   2910
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmNombre"
               Height          =   285
               IMEMode         =   3  'DISABLE
               Index           =   1
               Left            =   30
               TabIndex        =   60
               Tag             =   "dsProveedor"
               Top             =   1305
               Width           =   2895
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   8
               Left            =   2940
               TabIndex        =   59
               Tag             =   "nrFactura"
               Top             =   1305
               Width           =   2535
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   2
               Left            =   5490
               TabIndex        =   58
               Tag             =   "nrRecibo"
               Top             =   1305
               Width           =   2100
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   288
               Index           =   6
               Left            =   4935
               Locked          =   -1  'True
               TabIndex        =   57
               TabStop         =   0   'False
               Tag             =   "tpOperacion"
               Top             =   795
               Width           =   2445
            End
            Begin VB.CommandButton cmdLimpiar 
               Height          =   285
               Left            =   3930
               Picture         =   "Frm_MovimientosContables.frx":334A
               Style           =   1  'Graphical
               TabIndex        =   56
               TabStop         =   0   'False
               ToolTipText     =   "Borrar Valores"
               Top             =   1875
               Width           =   285
            End
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
               Height          =   300
               Index           =   18
               Left            =   2475
               ScrollBars      =   2  'Vertical
               TabIndex        =   55
               Tag             =   "vlPesos"
               Text            =   "0"
               Top             =   1875
               Width           =   1380
            End
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
               Height          =   300
               Index           =   17
               Left            =   1200
               TabIndex        =   54
               Tag             =   "vlDolares"
               Text            =   "0"
               Top             =   1875
               Width           =   1236
            End
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
               Height          =   300
               Index           =   9
               Left            =   30
               TabIndex        =   53
               Tag             =   "vlEuros"
               Text            =   "0"
               Top             =   1875
               Width           =   1140
            End
            Begin VB.CommandButton cmdAgregarMovimiento 
               Caption         =   "Guadar el &Movimiento"
               Height          =   375
               Left            =   4515
               TabIndex        =   52
               ToolTipText     =   "Agregar el Movimiento"
               Top             =   1845
               Width           =   2796
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               Height          =   1008
               Index           =   20
               Left            =   30
               MultiLine       =   -1  'True
               ScrollBars      =   2  'Vertical
               TabIndex        =   51
               TabStop         =   0   'False
               Tag             =   "dsObservacion"
               Top             =   2445
               Width           =   10110
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   13
               Left            =   7605
               TabIndex        =   50
               Tag             =   "nrCajaPuesto"
               Top             =   1305
               Width           =   2196
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               BeginProperty Font 
                  Name            =   "Verdana"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   288
               Index           =   14
               Left            =   7395
               Locked          =   -1  'True
               TabIndex        =   49
               TabStop         =   0   'False
               Tag             =   "tpCajaImputacion"
               Top             =   795
               Width           =   2385
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Descripción del Movimiento"
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
               Left            =   15
               TabIndex        =   76
               Top             =   30
               Width           =   3015
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
               Index           =   12
               Left            =   30
               TabIndex        =   74
               Tag             =   "dsObservacion"
               Top             =   2220
               Width           =   1935
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Proveedor"
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
               Left            =   0
               TabIndex        =   71
               Top             =   1080
               Width           =   1050
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Número de Factura"
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
               Left            =   2940
               TabIndex        =   70
               Top             =   1110
               Width           =   1770
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Número de Recibo"
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
               Left            =   5505
               TabIndex        =   69
               Top             =   1095
               Width           =   1785
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Descripción"
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
               Left            =   15
               TabIndex        =   68
               Top             =   585
               Width           =   1785
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Tipo "
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
               Left            =   3015
               TabIndex        =   67
               Top             =   585
               Width           =   660
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
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
               Height          =   255
               Index           =   8
               Left            =   4965
               TabIndex        =   66
               Top             =   570
               Width           =   1470
            End
            Begin VB.Label Label22 
               Alignment       =   2  'Center
               BackColor       =   &H00FFC0C0&
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
               Left            =   30
               TabIndex        =   65
               Top             =   1635
               Width           =   1050
            End
            Begin VB.Label Label21 
               Alignment       =   2  'Center
               BackColor       =   &H00FFC0C0&
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
               Left            =   1170
               TabIndex        =   64
               Top             =   1620
               Width           =   945
            End
            Begin VB.Label Label8 
               Alignment       =   2  'Center
               BackColor       =   &H00FFC0C0&
               Caption         =   "Total Pesos"
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
               Left            =   2430
               TabIndex        =   63
               Top             =   1635
               Width           =   1380
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Nro. de Caja Puesto"
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
               Left            =   7605
               TabIndex        =   62
               Top             =   1080
               Width           =   1785
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Pertenence a"
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
               Index           =   14
               Left            =   7410
               TabIndex        =   61
               Top             =   570
               Width           =   1470
            End
         End
         Begin VB.Frame FraConceptos 
            BackColor       =   &H00FFC0C0&
            BorderStyle     =   0  'None
            Caption         =   "Frame1"
            Height          =   2850
            Left            =   135
            TabIndex        =   44
            Top             =   735
            Width           =   10275
            Begin VB.TextBox txtItemConcepto 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmNombre"
               Height          =   285
               Index           =   2
               Left            =   0
               TabIndex        =   45
               Tag             =   "dsConceptoBuscado"
               Top             =   240
               Width           =   3930
            End
            Begin MSComctlLib.ListView lstBusquedaConceptos 
               Height          =   2280
               Left            =   0
               TabIndex        =   46
               TabStop         =   0   'False
               Top             =   525
               Width           =   10155
               _ExtentX        =   17912
               _ExtentY        =   4022
               View            =   3
               LabelEdit       =   1
               LabelWrap       =   -1  'True
               HideSelection   =   0   'False
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
               OLEDropMode     =   1
               NumItems        =   5
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Key             =   "cdConcepto"
                  Object.Tag             =   "cdConcepto"
                  Text            =   "Código"
                  Object.Width           =   0
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Key             =   "dsConcepto"
                  Object.Tag             =   "dsConcepto"
                  Text            =   "Descripción"
                  Object.Width           =   6791
               EndProperty
               BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   2
                  Object.Tag             =   "tpConcepto"
                  Text            =   "Tipo "
                  Object.Width           =   3263
               EndProperty
               BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   3
                  Key             =   "tpOperacion"
                  Object.Tag             =   "tpOperacion"
                  Text            =   "Operación"
                  Object.Width           =   2822
               EndProperty
               BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   4
                  Object.Tag             =   "tpCajaImputacion"
                  Text            =   "Pertenence a "
                  Object.Width           =   6174
               EndProperty
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Ingrese el Concepto"
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
               Left            =   60
               TabIndex        =   47
               Top             =   0
               Width           =   3015
            End
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   12
            Left            =   4116
            Locked          =   -1  'True
            TabIndex        =   18
            TabStop         =   0   'False
            Tag             =   "dsUsuario"
            Top             =   372
            Width           =   2652
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   11
            Left            =   2124
            Locked          =   -1  'True
            TabIndex        =   16
            TabStop         =   0   'False
            Tag             =   "nrCaja"
            Top             =   372
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   10
            Left            =   6792
            Locked          =   -1  'True
            TabIndex        =   14
            TabStop         =   0   'False
            Tag             =   "dtMovimiento"
            Top             =   372
            Width           =   3495
         End
         Begin VB.TextBox txtFields 
            BackColor       =   &H00E0E0E0&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   8184
            Locked          =   -1  'True
            TabIndex        =   1
            TabStop         =   0   'False
            Tag             =   "cdConcepto"
            Top             =   5256
            Visible         =   0   'False
            Width           =   870
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   132
            Locked          =   -1  'True
            TabIndex        =   12
            TabStop         =   0   'False
            Tag             =   "IdMovimiento"
            Top             =   372
            Width           =   1965
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
            Height          =   252
            Index           =   11
            Left            =   4116
            TabIndex        =   19
            Top             =   144
            Width           =   1992
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
            Height          =   252
            Index           =   10
            Left            =   2160
            TabIndex        =   17
            Top             =   144
            Width           =   1992
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
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
            Height          =   252
            Index           =   9
            Left            =   6792
            TabIndex        =   15
            Top             =   144
            Width           =   852
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Concepto"
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
            Index           =   5
            Left            =   8172
            TabIndex        =   13
            Top             =   5028
            Visible         =   0   'False
            Width           =   852
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Código"
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
            Index           =   27
            Left            =   144
            TabIndex        =   11
            Top             =   144
            Width           =   1992
         End
      End
   End
   Begin VB.Frame fraBusqContables 
      BorderStyle     =   0  'None
      Height          =   7530
      Left            =   -15
      TabIndex        =   5
      Top             =   570
      Width           =   10785
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   3675
         Top             =   915
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483648
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   7
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":343C
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":354E
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":3660
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":3772
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":3884
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":3996
               Key             =   "Menor"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_MovimientosContables.frx":3AA8
               Key             =   "nota"
               Object.Tag             =   "nota"
            EndProperty
         EndProperty
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2640
         TabIndex        =   39
         Top             =   2250
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   40
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label12 
            BackColor       =   &H80000009&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   43
            Top             =   375
            Width           =   855
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H80000009&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   42
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label11 
            BackColor       =   &H80000009&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   41
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
         Left            =   3765
         Locked          =   -1  'True
         TabIndex        =   31
         Tag             =   "vlCierrePesos"
         Top             =   6660
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
         Left            =   4980
         Locked          =   -1  'True
         TabIndex        =   30
         Tag             =   "vlCierreDolares"
         Top             =   6660
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
         Left            =   6195
         Locked          =   -1  'True
         TabIndex        =   29
         Tag             =   "vlCierreEuros"
         Top             =   6660
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
         Left            =   3765
         Locked          =   -1  'True
         TabIndex        =   28
         Tag             =   "vlSaldoInicialPesos"
         Top             =   6360
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
         Left            =   4980
         Locked          =   -1  'True
         TabIndex        =   27
         Tag             =   "vlSaldoInicialDolares"
         Top             =   6360
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
         Left            =   6195
         Locked          =   -1  'True
         TabIndex        =   26
         Tag             =   "vlSaldoInicialEuros"
         Top             =   6360
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
         Left            =   3765
         Locked          =   -1  'True
         TabIndex        =   25
         Tag             =   "vlSaldoFinalRealPesos"
         Top             =   6975
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
         Left            =   4980
         Locked          =   -1  'True
         TabIndex        =   24
         Tag             =   "vlSaldoFinalRealDolares"
         Top             =   6975
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
         Left            =   6195
         Locked          =   -1  'True
         TabIndex        =   23
         Tag             =   "vlSaldoFinalRealEuros"
         Top             =   6975
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
         Index           =   3
         Left            =   7410
         Locked          =   -1  'True
         TabIndex        =   22
         Tag             =   "vlTotalSaldoRealFinal"
         Top             =   6975
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
         Index           =   4
         Left            =   7410
         Locked          =   -1  'True
         TabIndex        =   21
         Tag             =   "vlTotalSaldoInicial"
         Top             =   6360
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
         Index           =   5
         Left            =   7410
         Locked          =   -1  'True
         TabIndex        =   20
         Tag             =   "vlTotalSaldoCierre"
         Top             =   6660
         Width           =   1200
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   4275
         TabIndex        =   0
         Top             =   330
         Width           =   6450
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   4
         Top             =   330
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
         Height          =   5250
         Left            =   150
         TabIndex        =   2
         Top             =   735
         Width           =   10575
         _ExtentX        =   18653
         _ExtentY        =   9260
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
         NumItems        =   16
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "IdMovimiento"
            Text            =   "Codigo"
            Object.Width           =   2469
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
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "vlDolares"
            Text            =   "Dolares"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "vlEuros"
            Text            =   "Euros"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dsConcepto"
            Text            =   "Concepto"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "tpConcepto"
            Text            =   "Tipo Concepto"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "dsMovimiento"
            Text            =   "Descripción"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "dtMovimiento"
            Text            =   "Fecha"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "nrRecibo"
            Text            =   "Recibo"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "nrFactura"
            Text            =   "Factura"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Object.Tag             =   "dsProveedor"
            Text            =   "Des. Proveedor"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Object.Tag             =   "nrCaja"
            Text            =   "Caja Adm."
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(15) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   14
            Object.Tag             =   "dsObservacion"
            Text            =   "Observación"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(16) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   15
            Object.Tag             =   "nrCajaPuesto"
            Text            =   "Caja Puesto"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   330
         Width           =   2400
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
         Height          =   270
         Left            =   3750
         TabIndex        =   38
         Top             =   6105
         Width           =   1215
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
         Height          =   255
         Left            =   4950
         TabIndex        =   37
         Top             =   6105
         Width           =   1230
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
         Height          =   225
         Left            =   6180
         TabIndex        =   36
         Tag             =   "vlSaldoInicialEuros"
         Top             =   6120
         Width           =   1215
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
         Height          =   270
         Left            =   2580
         TabIndex        =   35
         Top             =   6375
         Width           =   1170
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
         Height          =   270
         Left            =   2580
         TabIndex        =   34
         Top             =   6705
         Width           =   1170
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
         Height          =   225
         Left            =   2595
         TabIndex        =   33
         Top             =   7020
         Width           =   1155
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
         Height          =   225
         Left            =   7395
         TabIndex        =   32
         Tag             =   "vlSaldoInicialEuros"
         Top             =   6105
         Width           =   1470
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   7
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   6
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_MovimientosContables"
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
    
    ObtenerCampo("vlPesos").Text = "0,00"
    ObtenerCampo("vlDolares").Text = "0,00"
    ObtenerCampo("vlEuros").Text = "0,00"
    
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



Private Sub cmdAgregarMovimiento_Click()
Dim resp As Byte

    If Not ValidarEntrada Then Exit Sub
    resp = MsgBox("Confirma guardar este movimiento.", vbQuestion + vbYesNo, "Atencion")

    If resp = vbNo Then Exit Sub

    If Guardarregistro(EstadoABM) Then
        EstadoABM = Consulta
    End If

    ActualizarSaldos
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")

End Sub

Private Sub cmdLimpiar_Click()

    ObtenerCampo("vlPesos").Text = "0,00"
    ObtenerCampo("vlDolares").Text = "0,00"
    ObtenerCampo("vlEuros").Text = "0,00"
    
End Sub

Private Sub cmdFacturar_Click()

    tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
    
    
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
    EstadoABM = Consulta
    limpiarControles
    cargarcamposdebusqueda
    buscarTodoslosConceptos
    Me.cmbCampos.ListIndex = 1
    
    
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
    
End Sub


Private Sub buscarTodoslosConceptos()
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

        Me.lstBusquedaConceptos.ListItems.Clear
        ObjTablasIO.nmTabla = "TB_Conceptos"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "->", "", "ASC"
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpCajaImputacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<>", "Neutro", "AND"
        ' ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1027", "AND"
        ' ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1028", "AND"
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", "AND"
        ObjTablasIO.setearCampoOperadorValor "tpCreadopor", "=", "Usuario"
        
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusquedaConceptos, 0, "TB_Conceptos"
        End If
        
End Sub

Private Function buscarConceptos(pDato As String) As Boolean
Dim strNombreCompleto As String
Dim vlPorcentaje      As Single
Dim vlPrecioViaje     As Single
Dim vlTotalGeneral    As Single

        ObjTablasIO.nmTabla = "TB_Conceptos"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "->", "", , "ASC"
        ObjTablasIO.setearCampoOperadorValor "tpConcepto", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "tpCajaImputacion", "->", ""
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
        ObjTablasIO.setearCampoOperadorValor "tpOperacion", "<>", "Neutro", "AND"
        ' ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1027", "AND"
        ' ObjTablasIO.setearCampoOperadorValor "cdConcepto", "<>", "1028", "AND"
        ObjTablasIO.setearCampoOperadorValor "tpCreadoPor", "=", "Usuario", "AND"
        
        ObjTablasIO.setearCampoOperadorValor "dsConcepto", "Like", pDato
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            Me.lstBusquedaConceptos.ListItems.Clear
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusquedaConceptos, 0, "TB_Conceptos"
            buscarConceptos = True
        Else
            buscarConceptos = False
        End If
        
End Function

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_MovimientosContables"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_MovimientosContables")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_MovimientosContables")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
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

    If Not objSeguridad.ObtenerPermisoSupervisor() Then Exit Sub
     
     
    
    ObjTablasIO.nmTabla = "TB_MovimientosContables"
    ObjTablasIO.setearCampoOperadorValor "IdMovimiento", _
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
    ObjTablasIO.Seleccionar
    For Each Control In Me.txtFields
        If Not IsMissing(Control.Tag) Then
            If Not Control.Tag = "" Then
                    On Error Resume Next
                    Valor = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_MovimientosContables", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                    
                    Control.Text = Valor
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
        
    ' version 2.9
    Dim puedeOperar As Boolean
    puedeOperar = objCajas.puedeOperar(ObtenerCampo("nrCaja"), ObtenerCampo("cdConcepto"))
    For Each Control In Me.txtFields
        If Not puedeOperar Then
            HabilitarCampos Control.Tag, False
        Else
            HabilitarCampos Control.Tag, True
        End If
    Next
                    
    If Not puedeOperar Then
       Me.cmdAgregarMovimiento.Enabled = False
       Me.tlb_ABM.Buttons("Aceptar").Enabled = False
       Me.cmdLimpiar.Enabled = False
       Me.lstBusquedaConceptos.Enabled = False
       HabilitarCampos "dsConceptoBuscado", False
    Else
       Me.cmdAgregarMovimiento.Enabled = True
       Me.tlb_ABM.Buttons("Aceptar").Enabled = True
       Me.cmdLimpiar.Enabled = True
       Me.lstBusquedaConceptos.Enabled = True
       HabilitarCampos "dsConceptoBuscado", True
    End If
                    
    
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
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

Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub



Private Sub lstBusquedaConceptos_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)


    If Me.lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1 Then
        If lstBusquedaConceptos.SortOrder = lvwAscending And lstBusquedaConceptos.Sorted Then
            lstBusquedaConceptos.SortOrder = lvwDescending
        Else
            lstBusquedaConceptos.SortOrder = lvwAscending
        End If
        lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1
    Else
       lstBusquedaConceptos.SortOrder = lvwAscending
       lstBusquedaConceptos.SortKey = ColumnHeader.Index - 1
    End If
    ' lstBusqueda.Refresh
    lstBusquedaConceptos.Sorted = True
    
End Sub

Private Sub lstBusquedaConceptos_DblClick()

    If Me.lstBusquedaConceptos.ListItems.Count < 1 Then Exit Sub
    PasarItems
    

End Sub


Private Sub PasarItems()
    
    ObtenerCampo("cdConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.Text
    ObtenerCampo("dsConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(1)
    ObtenerCampo("tpConcepto").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(2)
    ObtenerCampo("tpOperacion").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(3)
    ObtenerCampo("tpCajaImputacion").Text = Me.lstBusquedaConceptos.SelectedItem.SubItems(4)
    ObtenerCampo("vlPesos").SetFocus
    
End Sub


Private Sub lstBusquedaConceptos_KeyPress(KeyAscii As Integer)

    Select Case KeyAscii
    Case vbKeyReturn
        If Me.lstBusquedaConceptos.ListItems.Count < 1 Then Exit Sub
        PasarItems
    Case vbKeyBack
        ObtenerCampo("dsConceptoBuscado").SetFocus
    End Select
    
End Sub

Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
Dim resp        As Byte

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           ObtenerCampo("vlCierrePesos").Text = FormatNumber(objCajas.vlPesos, 2)
           ObtenerCampo("vlCierreDolares").Text = FormatNumber(objCajas.vlDolares, 2)
           ObtenerCampo("vlCierreEuros").Text = FormatNumber(objCajas.vlEuros, 2)
           ObtenerCampo("vlSaldoFinalRealPesos").Text = FormatNumber(ObtenerValoresNumericos("vlCierrePesos") + ObtenerValoresNumericos("vlSaldoInicialPesos"), 2)
           ObtenerCampo("vlSaldoFinalRealDolares").Text = FormatNumber(ObtenerValoresNumericos("vlCierreDolares") + ObtenerValoresNumericos("vlSaldoInicialDolares"), 2)
           ObtenerCampo("vlSaldoFinalRealEuros").Text = FormatNumber(ObtenerValoresNumericos("vlCierreEuros") + ObtenerValoresNumericos("vlSaldoInicialEuros"), 2)
           ActualizarSaldos
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           limpiarControles
           ' Pasar datos
           lstBusqueda_DblClick
           PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           strValor = objbasededatos.SP_ObtenerMaxIDMovimiento()
           ObtenerCampo("IdMovimiento").Text = strValor
           ObtenerCampo("nrCaja").Text = objParametros.ObtenerValor("nrCaja")
           ObtenerCampo("dsUsuario").Text = objUsuario.dsUsuario
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCaja", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
           HabilitarCampos "tpCajaImputacion", False
           Me.lstBusquedaConceptos.Enabled = True
           Me.cmdAgregarMovimiento.Enabled = True
           Me.cmdLimpiar.Enabled = True
           buscarTodoslosConceptos
           PresentarPantalla Button
           ObtenerCampo("dtMovimiento").Text = Now
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
          cmdAgregarMovimiento_Click
     Case "Cancelar"
            ActualizarSaldos
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
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



Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_MovimientosContables"
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
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_MovimientosContables") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
    
End Sub

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_MovimientosContables"
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
    
                  
    ObjTablasIO.setearCampoOperadorValor _
              "dsUsuario_Supervisor", "<-", objParametros.ObtenerValor("dsUsuario_Acceso_Supervisor")
              
        
    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "IdMovimiento", _
            "=", ObtenerCampo("IdMovimiento").Text
            If Not ObjTablasIO.Actualizar() Then
                MsgBox "Error: no se pudo insertar el registro. " + _
                ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                
                Guardarregistro = True
            End If
    Case alta
            If Not ObjTablasIO.Insertar Then
                MsgBox "Error: no se pudo insertar el registro, " _
                + ObjTablasIO.Error, vbCritical + vbDefaultButton1, "Atención"
                Guardarregistro = False
            Else
                objDiccionariodeDatos.GuardarSiguienteValor "TB_MovimientosContables", "IdMovimiento", objConfig.nrPuesto
                Guardarregistro = True
            End If
    End Select

End Function




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqContables.Visible = False
           Me.lstBusqueda.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           If objCajas.puedeOperar(ObtenerCampo("nrCaja"), ObtenerCampo("cdConcepto")) Then
                Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Eliminar").Visible = False
           End If
           Me.FraMovimiento.Top = Me.FraConceptos.Top
           Me.FraConceptos.Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "dsUsuario", False
           HabilitarCampos "nrCaja", False
           HabilitarCampos "IdMovimiento", False
           HabilitarCampos "dtMovimiento", False
           HabilitarCampos "tpConcepto", False
           HabilitarCampos "dsConcepto", False
           HabilitarCampos "tpOperacion", False
           HabilitarCampos "tpCajaImputacion", False
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("dsObservacion").Visible = True
           Me.fraMovimientosContables.Visible = True
    Case "Agregar"
           Me.fraBusqContables.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraMovimientosContables.Visible = True
           Me.FraMovimiento.Top = Me.FraConceptos.Top + Me.FraConceptos.Height
           Me.FraMovimiento.Visible = True
           Me.FraConceptos.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Enabled = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
           ObtenerCampo("dsObservacion").Visible = True
           ObtenerCampo("dsConceptoBuscado").SetFocus
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
    
           If objParametros.ObtenerValor("CajaAbierta") = "SI" Then
                Me.tlb_ABM.Buttons("Agregar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Agregar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraMovimientosContables.Visible = False
           Me.fraBusqContables.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           
           If objParametros.ObtenerValor("CajaAbierta") = "SI" Then
                Me.tlb_ABM.Buttons("Agregar").Visible = True
           Else
                Me.tlb_ABM.Buttons("Agregar").Visible = False
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraMovimientosContables.Visible = False
           Me.fraBusqContables.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           If objParametros.ObtenerValor("CajaAbierta") = "NO" Then
             Me.tlb_ABM.Buttons("Agregar").Visible = False
           Else
             Me.tlb_ABM.Buttons("Agregar").Visible = True
           End If
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraMovimientosContables.Visible = False
           Me.fraBusqContables.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    End Select
    
    If Me.fraBusqContables.Visible Then
        Me.fraBusqContables.Visible = True
          Me.txtBusqueda.SetFocus
    End If
    

    

End Sub




Private Sub txtBusqueda_GotFocus()

    
    Me.txtBusqueda.Text = Trim(Me.txtBusqueda.Text)
    Me.txtBusqueda.SelStart = Len(Trim(Me.txtBusqueda.Text))
    
    
End Sub

Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n As Integer
Dim strBuscada As String
Dim objUtilsBD As New CUtilsBD
Dim strWhere   As String

    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         
         ' Aqui se deberian extraer los datos si el movimiento de
         ' de la caja de los licenciatarios o de la caja de la cooperativa
         ' Ademas si el concepto permite que se muestro o no un
         ' movimiento
         Screen.ActiveForm.MousePointer = vbHourglass
         
         strBuscada = Trim(Me.txtBusqueda.Text)
         
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
         
         strWhere = " WHERE " + objUtilsBD.armarCampoOperadorValor("TB_MovimientosContables", objDiccionariodeDatos.nmCampo, ObtenerOperadorAritmetico(), strBuscada)
         strWhere = strWhere + " AND " + objUtilsBD.armarCampoOperadorValor("TB_MovimientosContables", "nrCaja", "=", objParametros.ObtenerValor("nrCaja"))
         
         objMovimientos.obtenerMovimientosContables objUsuario.dsUsuario, strWhere
         
         If Not objbasededatos.rs_resultados.EOF Then
            objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstBusqueda, 0, "TB_MovimientosContables"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            Me.lstBusqueda.SortKey = 0
            Me.lstBusqueda.SortOrder = lvwAscending
            Me.lstBusqueda.Sorted = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
            ColorearLineas
             End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_MovimientosContables", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_MovimientosContables", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub


Private Sub ColorearLineas()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        If Me.lstBusqueda.ListItems(i).SubItems(14) <> "" Then
            Set Me.lstBusqueda.SmallIcons = Me.ImgOperadores
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 7
            ItemList.CreateDragImage
        End If
        
    Next i

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_MovimientosContables", _
                                Me.txtFields(Index), KeyAscii)
    End If
    
End Sub




Private Sub ValidTextBox1_Click()

End Sub

Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "LostFocus"
End Sub


Private Sub txtItemConcepto_GotFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "LostFocus"
                              
                              
    objGUI.refrescarGrilla Me.lstBusquedaConceptos
    
End Sub

Private Sub txtItemConcepto_KeyPress(Index As Integer, KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        Select Case txtItemConcepto(Index).Tag
        Case "dsConceptoBuscado"
            Me.lstBusquedaConceptos.ListItems.Clear
            If buscarConceptos(ObtenerCampo("dsConceptoBuscado").Text) Then
                Me.lstBusquedaConceptos.SetFocus
            End If
        End Select
        
    Else
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_MovimientosContables", _
                      Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtItemConcepto_LostFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_MovimientosContables", _
                              Me.txtFields(Index), "LostFocus"
                              
End Sub




