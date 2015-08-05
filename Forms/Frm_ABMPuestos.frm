VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ABMPuestos 
   Caption         =   "Maestro de Puestos"
   ClientHeight    =   7110
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11265
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMPuestos.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7110
   ScaleWidth      =   11265
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   11265
      _ExtentX        =   19870
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMPuestosResaltado"
      HotImageList    =   "imgABMPuestosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Puesto"
            ImageKey        =   "Buscar"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Puesto deseado"
            ImageKey        =   "Seleccionar"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Puesto"
            ImageKey        =   "Agregar"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F5)"
            Key             =   "Exportar"
            ImageKey        =   "Exportar"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Sincronizar"
            Key             =   "Sincronizar"
            ImageKey        =   "Sincronizar"
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
            Caption         =   "&Eliminar(F5)"
            Key             =   "Eliminar"
            ImageKey        =   "Eliminar"
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
      MouseIcon       =   "Frm_ABMPuestos.frx":030A
      Begin MSComctlLib.ImageList imgABMPuestosResaltado 
         Left            =   5000
         Top             =   1
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
               Picture         =   "Frm_ABMPuestos.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1BDA
               Key             =   "Sincronizar"
               Object.Tag             =   "Sincronizar"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMPuestos 
         Left            =   7956
         Top             =   180
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
               Picture         =   "Frm_ABMPuestos.frx":2E5C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":2F74
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":30C8
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":31E0
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":32EC
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3440
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3548
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3BC4
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3D24
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":4178
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":45CC
               Key             =   "sincronizar"
               Object.Tag             =   "sincronizar"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMPuestos 
      BorderStyle     =   0  'None
      Height          =   5985
      Left            =   -75
      TabIndex        =   8
      Top             =   705
      Width           =   10365
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   5895
         Left            =   225
         ScaleHeight     =   5865
         ScaleWidth      =   10005
         TabIndex        =   14
         Top             =   45
         Width           =   10035
         Begin VB.CheckBox Check2 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Factura Cuenta Corriente "
            ForeColor       =   &H80000008&
            Height          =   192
            Left            =   270
            TabIndex        =   66
            Tag             =   "flFacturaCtacte"
            Top             =   5130
            Width           =   2445
         End
         Begin VB.Frame Frame2 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Facturación Manual"
            ForeColor       =   &H80000008&
            Height          =   2100
            Left            =   135
            TabIndex        =   36
            Top             =   2805
            Width           =   9780
            Begin VB.CheckBox Check1 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFC0C0&
               Caption         =   "Carga Manual con Secuencia"
               ForeColor       =   &H80000008&
               Height          =   192
               Left            =   135
               TabIndex        =   49
               Tag             =   "flRespeta_secuencia_carga_manual"
               Top             =   1725
               Width           =   3228
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   21
               Left            =   4008
               TabIndex        =   48
               Tag             =   "tpLetra_manual"
               Top             =   552
               Width           =   795
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   20
               Left            =   2565
               TabIndex        =   47
               Tag             =   "nrComprobante_manual_ult"
               Top             =   552
               Width           =   1425
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   19
               Left            =   1710
               TabIndex        =   46
               Tag             =   "nrTalonario_manual"
               Top             =   555
               Width           =   825
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   18
               Left            =   4020
               TabIndex        =   45
               Tag             =   "tpLetraEmpresa_manual"
               Top             =   900
               Width           =   795
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   17
               Left            =   2565
               TabIndex        =   44
               Tag             =   "nrComprobante_manual_empresa_ult"
               Top             =   900
               Width           =   1425
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   16
               Left            =   1710
               TabIndex        =   43
               Tag             =   "nrTalonario_manual_empresa"
               Top             =   900
               Width           =   825
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   15
               Left            =   4020
               TabIndex        =   42
               Tag             =   "tpLetraRecibo_manual"
               Top             =   1245
               Width           =   795
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   14
               Left            =   2565
               TabIndex        =   41
               Tag             =   "nrComprobante_manual_ctacte_ult"
               Top             =   1245
               Width           =   1425
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   13
               Left            =   1710
               TabIndex        =   40
               Tag             =   "nrTalonario_manual_ctacte"
               Top             =   1245
               Width           =   825
            End
            Begin VB.CommandButton cmdActualizarNumeracionManual 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   0
               Left            =   4875
               TabIndex        =   39
               Top             =   555
               Width           =   960
            End
            Begin VB.CommandButton cmdActualizarNumeracionManual 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   1
               Left            =   4875
               TabIndex        =   38
               Top             =   900
               Width           =   945
            End
            Begin VB.CommandButton cmdActualizarNumeracionManual 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   2
               Left            =   4860
               TabIndex        =   37
               Top             =   1260
               Width           =   960
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
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
               Height          =   255
               Index           =   13
               Left            =   4020
               TabIndex        =   55
               Top             =   315
               Width           =   570
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Ultimo Número"
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
               Left            =   2550
               TabIndex        =   54
               Top             =   285
               Width           =   1455
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
               Index           =   11
               Left            =   1680
               TabIndex        =   53
               Top             =   270
               Width           =   960
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Consumidor Final"
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
               TabIndex        =   52
               Top             =   600
               Width           =   2115
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "A Empresas"
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
               Left            =   135
               TabIndex        =   51
               Top             =   945
               Width           =   1920
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Recibo Cta. Ctes."
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
               Left            =   135
               TabIndex        =   50
               Top             =   1320
               Width           =   2055
            End
         End
         Begin VB.Frame Frame1 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Auto Impresión"
            ForeColor       =   &H80000008&
            Height          =   1890
            Left            =   135
            TabIndex        =   17
            Top             =   780
            Width           =   9735
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   23
               Left            =   7020
               TabIndex        =   65
               Tag             =   "dtCAI_Talonario_auto_empresa"
               Top             =   945
               Width           =   1095
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   22
               Left            =   7035
               TabIndex        =   64
               Tag             =   "dtCAI_Talonario_auto"
               Top             =   585
               Width           =   1095
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   5
               Left            =   4785
               TabIndex        =   61
               Tag             =   "nrCAI_Talonario_auto"
               Top             =   585
               Width           =   2205
            End
            Begin VB.TextBox txtFields 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   3
               Left            =   4785
               TabIndex        =   60
               Tag             =   "nrCAI_Talonario_auto_empresa"
               Top             =   945
               Width           =   2205
            End
            Begin VB.CommandButton cmdActualizarNumeracionAutomatico 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   2
               Left            =   8400
               TabIndex        =   29
               Top             =   1290
               Width           =   990
            End
            Begin VB.CommandButton cmdActualizarNumeracionAutomatico 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   1
               Left            =   8385
               TabIndex        =   28
               Top             =   930
               Width           =   990
            End
            Begin VB.CommandButton cmdActualizarNumeracionAutomatico 
               Caption         =   "Recalcular"
               Height          =   288
               Index           =   0
               Left            =   8400
               TabIndex        =   27
               Top             =   570
               Width           =   990
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   12
               Left            =   1680
               TabIndex        =   26
               Tag             =   "nrTalonario_auto_ctacte"
               Top             =   1275
               Width           =   825
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   11
               Left            =   2535
               TabIndex        =   25
               Tag             =   "nrComprobante_auto_ctacte_ult"
               Top             =   1275
               Width           =   1380
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   10
               Left            =   3945
               TabIndex        =   24
               Tag             =   "tpLetraRecibo"
               Top             =   1275
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   9
               Left            =   1680
               TabIndex        =   23
               Tag             =   "nrTalonario_auto_empresa"
               Top             =   945
               Width           =   825
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   8
               Left            =   2535
               TabIndex        =   22
               Tag             =   "nrComprobante_auto_empresa_ult"
               Top             =   945
               Width           =   1380
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   7
               Left            =   3945
               TabIndex        =   21
               Tag             =   "tpLetraEmpresa"
               Top             =   945
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   1
               Left            =   1680
               TabIndex        =   20
               Tag             =   "nrTalonario_automatico"
               Top             =   585
               Width           =   825
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   4
               Left            =   2532
               TabIndex        =   19
               Tag             =   "nrComprobante_automatico_ult"
               Top             =   585
               Width           =   1380
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   6
               Left            =   3945
               TabIndex        =   18
               Tag             =   "tpLetra"
               Top             =   585
               Width           =   810
            End
            Begin MSComCtl2.DTPicker DTPicker1 
               Height          =   330
               Index           =   1
               Left            =   8100
               TabIndex        =   59
               TabStop         =   0   'False
               Top             =   570
               Width           =   255
               _ExtentX        =   450
               _ExtentY        =   582
               _Version        =   393216
               Format          =   158466049
               CurrentDate     =   38267
            End
            Begin MSComCtl2.DTPicker DTPicker1 
               Height          =   330
               Index           =   2
               Left            =   8085
               TabIndex        =   63
               TabStop         =   0   'False
               Top             =   930
               Width           =   255
               _ExtentX        =   450
               _ExtentY        =   582
               _Version        =   393216
               Format          =   158466049
               CurrentDate     =   38267
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Vencimiento"
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
               Left            =   7020
               TabIndex        =   58
               Top             =   345
               Width           =   1245
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "CAI"
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
               Index           =   3
               Left            =   4815
               TabIndex        =   62
               Top             =   330
               Width           =   570
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Recibo Cta. Ctes."
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
               Left            =   135
               TabIndex        =   35
               Top             =   1320
               Width           =   2055
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "A Empresas"
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
               Left            =   135
               TabIndex        =   34
               Top             =   945
               Width           =   1920
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Consumidor Final"
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
               Left            =   135
               TabIndex        =   33
               Top             =   600
               Width           =   2115
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
               Index           =   1
               Left            =   1695
               TabIndex        =   32
               Top             =   300
               Width           =   810
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
               Caption         =   "Ultimo Número"
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
               Left            =   2550
               TabIndex        =   31
               Top             =   300
               Width           =   1350
            End
            Begin VB.Label lblLabels 
               BackStyle       =   0  'Transparent
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
               Height          =   240
               Index           =   4
               Left            =   3945
               TabIndex        =   30
               Top             =   300
               Width           =   570
            End
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   300
            Index           =   2
            Left            =   2085
            MultiLine       =   -1  'True
            TabIndex        =   16
            Tag             =   "dsPuesto"
            Top             =   330
            Width           =   7710
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   300
            Index           =   0
            Left            =   90
            Locked          =   -1  'True
            TabIndex        =   15
            TabStop         =   0   'False
            Tag             =   "nrPuesto"
            Top             =   330
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Nro de Puesto"
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
            Left            =   90
            TabIndex        =   57
            Top             =   105
            Width           =   1950
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Descripción de Puesto"
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
            Left            =   2115
            TabIndex        =   56
            Top             =   90
            Width           =   4230
         End
      End
   End
   Begin VB.Frame fraBusqPuestos 
      BorderStyle     =   0  'None
      Height          =   6510
      Left            =   0
      TabIndex        =   4
      Top             =   555
      Width           =   11220
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1815
         TabIndex        =   9
         Top             =   2355
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   10
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
            TabIndex        =   13
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   12
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   11
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   288
         Left            =   4350
         TabIndex        =   0
         Top             =   348
         Width           =   6660
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
               Picture         =   "Frm_ABMPuestos.frx":584E
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":5960
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":5A72
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":5B84
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":5C96
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":5DA8
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   3
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
         Height          =   5370
         Left            =   150
         TabIndex        =   1
         Top             =   690
         Width           =   10860
         _ExtentX        =   19156
         _ExtentY        =   9472
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrPuesto"
            Text            =   "Puesto"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dsPuesto"
            Text            =   "Descripción"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nrTalonario_manual"
            Text            =   "Talon. Manual"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "nrComprobante_manual_ult"
            Text            =   "Ult. Número"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "nrTalonario_automatico"
            Text            =   "Talon Automático"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "nrComprobante_automatico_ult"
            Text            =   "Ult. Número"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Key             =   "flFacturaCtacte"
            Object.Tag             =   "flFacturaCtacte"
            Text            =   "Factura Cta. Cte."
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   216
         Left            =   4320
         TabIndex        =   6
         Top             =   132
         Width           =   1752
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   5
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_ABMPuestos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM As Byte
Dim objControl As New CControl

' Variables para Controlar los valores modificados

Dim nrComprobante_automatico_ult_anterior As String
Dim nrComprobante_auto_empresa_ult_anterior As String
Dim nrComprobante_auto_ctacte_ult_anterior   As String
Dim nrComprobante_manual_ult_anterior As String
Dim nrComprobante_manual_empresa_ult_anterior As String
Dim nrComprobante_manual_ctacte_ult_anterior As String
    
' Variables para Controlar los valores modificados
Dim nrComprobante_automatico_ult_modificado As String
Dim nrComprobante_auto_empresa_ult_modificado As String
Dim nrComprobante_auto_ctacte_ult_modificado   As String
Dim nrComprobante_manual_ult_modificado As String
Dim nrComprobante_manual_empresa_ult_modificado As String
Dim nrComprobante_manual_ctacte_ult_modificado As String
 
 

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


    Me.DTPicker1(1).value = Date
    Me.DTPicker1(2).value = Date
    
    

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





Private Sub cmdActualizarNumeracionAutomatico_Click(Index As Integer)
Dim l_nrTalonario As String
Dim l_NombrenrComprobante As String
Dim l_tpLetra As String

    Select Case Index
    Case 0 ' Consumidor Final
        l_nrTalonario = ObtenerCampo("nrTalonario_automatico")
        l_NombrenrComprobante = "nrComprobante_automatico_ult"
        l_tpLetra = ObtenerCampo("tpLetra")
    Case 1 ' Empresas
        l_nrTalonario = ObtenerCampo("nrTalonario_auto_empresa")
        l_NombrenrComprobante = "nrComprobante_auto_empresa_ult"
        l_tpLetra = ObtenerCampo("tpLetraEmpresa")
    Case 2 ' Recibos
        l_nrTalonario = ObtenerCampo("nrTalonario_auto_ctacte")
        l_NombrenrComprobante = "nrComprobante_auto_ctacte_ult"
        l_tpLetra = ObtenerCampo("tpLetraRecibo")
    End Select
    
    ActualizarNumeracionTalonario l_nrTalonario, "A", l_tpLetra, l_NombrenrComprobante
        

End Sub


Private Sub ActualizarNumeracionTalonario(pnrTalonario_param As String, _
ptpTalonario_param As String, ptpLetra_param As String, pNombrenrComprobante As String)
Dim resp As Byte
Dim strSQL  As String

    resp = MsgBox("Esta seguro que desea reconstruir la numeración a partir de la base de datos.", vbQuestion + vbYesNo, "Atención")
    If resp = vbNo Then Exit Sub
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    strSQL = " sco_obtener_UltNroComprobante "
                        strSQL = strSQL + "@nrTalonario_param='" + pnrTalonario_param + "',"
                        strSQL = strSQL + "@tpTalonario_param='" + ptpTalonario_param + "',"
                        strSQL = strSQL + "@tpLetra_param='" + ptpLetra_param + "'"
                                           
    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
        On Error Resume Next
        objbasededatos.rs_resultados.Close
        On Error GoTo 0
        MsgBox "ERROR: " + objbasededatos.Error, vbCritical + vbDefaultButton1, "Atencion"
        Exit Sub
    End If
    
    ObtenerCampo(pNombrenrComprobante) = objbasededatos.rs_resultados("nro_comprobante")
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    If Trim(ObtenerCampo(pNombrenrComprobante).Text) = "99999999" Then
        MsgBox "El talonario ha llegado a su fin, debe reemplazarlo.", vbInformation + vbDefaultButton1, "Atención"
        AvisarError pNombrenrComprobante, True
    End If
    
    ObtenerCampo(pNombrenrComprobante).SetFocus
    
    
End Sub


Private Sub cmdActualizarNumeracionManual_Click(Index As Integer)
Dim l_nrTalonario As String
Dim l_NombrenrComprobante As String
Dim l_tpLetra As String

    Select Case Index
    Case 0 ' Consumidor Final
        l_nrTalonario = ObtenerCampo("nrTalonario_manual")
        l_NombrenrComprobante = "nrComprobante_manual_ult"
        l_tpLetra = ObtenerCampo("tpLetra_manual")
    Case 1 ' Empresas
        l_nrTalonario = ObtenerCampo("nrTalonario_manual_empresa")
        l_NombrenrComprobante = "nrComprobante_manual_empresa_ult"
        l_tpLetra = ObtenerCampo("tpLetraEmpresa_manual")
    Case 2 ' Recibos
        l_nrTalonario = ObtenerCampo("nrTalonario_manual_ctacte")
        l_NombrenrComprobante = "nrComprobante_manual_ctacte_ult"
        l_tpLetra = ObtenerCampo("tpLetraRecibo_manual")
    End Select
    
    ActualizarNumeracionTalonario l_nrTalonario, "M", l_tpLetra, l_NombrenrComprobante
        
            
    
End Sub



Private Sub DTPicker1_Change(Index As Integer)

    Select Case Index
    Case 1
        ObtenerCampo("dtCAI_Talonario_auto") = Format(Me.DTPicker1(1).value, "DD/MM/YYYY")
    Case 2
        ObtenerCampo("dtCAI_Talonario_auto_empresa") = Format(Me.DTPicker1(2).value, "DD/MM/YYYY")
    End Select

End Sub

Private Sub DTPicker1_Click(Index As Integer)

    Select Case Index
    Case 1
        ObtenerCampo("dtCAI_Talonario_auto") = Format(Me.DTPicker1(1).value, "DD/MM/YYYY")
    Case 2
        ObtenerCampo("dtCAI_Talonario_auto_empresa") = Format(Me.DTPicker1(2).value, "DD/MM/YYYY")
    End Select

End Sub

Private Sub DTPicker1_DblClick(Index As Integer)
    Select Case Index
    Case 1
        ObtenerCampo("dtCAI_Talonario_auto") = Format(Me.DTPicker1(1).value, "DD/MM/YYYY")
    Case 2
        ObtenerCampo("dtCAI_Talonario_auto_empresa") = Format(Me.DTPicker1(2).value, "DD/MM/YYYY")
    End Select
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
    Me.cmbCampos.ListIndex = 1
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Puestos"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Puestos")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Puestos")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Puestos", Me.cmbCampos.Text
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





Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqPuestos, Me.lstBusqueda
    
    
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



Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub



Private Sub lstBusqueda_DblClick()
Dim Control As Control
Dim Valor   As Variant
Dim strSQL  As String


    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    
    limpiarControles
    
    ObjTablasIO.nmTabla = "TB_Puestos"
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", _
    "=", Me.lstBusqueda.SelectedItem.Text, " AND "
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
                            ("TB_Puestos", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                            
                    Control.Text = Valor
                    
                    If Not Control.Tag = "flRespeta_secuencia_carga_manual" Then
                        AvisarError Control.Tag, False
                    End If
                    
                    If Err Then
                        Control.value = AdaptarTrueFalse(Control, Valor)
                    Else
                        If Trim(ObtenerCampo(Control.Tag).Text) = "99999999" Then
                            AvisarError Control.Tag, True
                            AvisarError Control.Tag, True
                        End If
                    End If
       
                    
                    On Error GoTo 0
                End If
            End If
    Next
    
    
    
    
    
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    

    guardamoslosValoresIniciales


    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")

    
    
End Sub

' modificacion inluida en la version 3.2
Private Sub guardamoslosValoresIniciales()

    
    nrComprobante_automatico_ult_anterior = ObtenerCampo("nrComprobante_automatico_ult")
    nrComprobante_auto_empresa_ult_anterior = ObtenerCampo("nrComprobante_auto_empresa_ult")
    nrComprobante_auto_ctacte_ult_anterior = ObtenerCampo("nrComprobante_auto_ctacte_ult")
    nrComprobante_manual_ult_anterior = ObtenerCampo("nrComprobante_manual_ult")
    nrComprobante_manual_empresa_ult_anterior = ObtenerCampo("nrComprobante_manual_empresa_ult")
    nrComprobante_manual_ctacte_ult_anterior = ObtenerCampo("nrComprobante_manual_ctacte_ult")
    
    
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


Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub





Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor                   As String
Dim observaciones_sincronizar  As String

    Select Case Button.Key
    Case "Buscar"
           ' buscar en la base de datos
           txtBusqueda_KeyPress vbKeyReturn
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Seleccionar"
           EstadoABM = Consulta
           ' Pasar datos
           lstBusqueda_DblClick
    Case "Agregar"
           EstadoABM = alta
           limpiarControles
           objSPs.nmStoredProcedure = "SP_ObtenerMaxnrPuesto"
           objSPs.ExecSP
           ObtenerCampo("nrPuesto").Text = objSPs.rs_resultados("nrPuesto") + 1
           PresentarPantalla Button
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
    
           If Not validaEntrada() Then Exit Sub
           If Guardarregistro(EstadoABM) Then
                txtBusqueda_KeyPress vbKeyReturn
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    Case "Sincronizar"
        
        observaciones_sincronizar = "Sincronización: ADM <-> Puesto de facturación" + vbCrLf
        objParametros.GrabarValor "observaciones_sincronizar", observaciones_sincronizar
        objParametros.GrabarValor "WherecajasaSincronizar", ""
        
        frm_sincronizarADM.Show vbModal
            
    End Select
    
End Sub



Private Function validaEntrada() As Boolean

    validaEntrada = False
    
    ' ----- automatico
    If ObtenerCampo("nrTalonario_automatico") = "" Then
        MsgBox "no es válido el campo talonario automático.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_automatico").SetFocus
         AvisarError "nrTalonario_automatico", True
        Exit Function
    End If
    If ObtenerCampo("nrComprobante_automatico_ult") = "" Then
        MsgBox "La numeración del talonario automático no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_automatico_ult").SetFocus
         AvisarError "nrComprobante_automatico_ult", True
        Exit Function
    End If
    If ObtenerCampo("tpLetra") = "" Then
        MsgBox "La letra automática no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpLetra").SetFocus
         AvisarError "tpLetra", True
        Exit Function
    End If
    ' ------
    If ObtenerCampo("nrTalonario_auto_empresa") = "" Then
        MsgBox "no es válido el campo talonario automático.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_auto_empresa").SetFocus
         AvisarError "nrTalonario_auto_empresa", True
        Exit Function
    End If
    If ObtenerCampo("nrComprobante_auto_empresa_ult") = "" Then
        MsgBox "La numeración del talonario automático no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_auto_empresa_ult").SetFocus
         AvisarError "nrComprobante_auto_empresa_ult", True
        Exit Function
    End If
    If ObtenerCampo("tpLetraEmpresa") = "" Then
        MsgBox "La letra automática no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpLetraEmpresa").SetFocus
        AvisarError "tpLetraEmpresa", True
        Exit Function
    End If
    ' ------
    If ObtenerCampo("nrTalonario_auto_ctacte") = "" Then
        MsgBox "no es válido el campo talonario automático.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_auto_ctacte").SetFocus
         AvisarError "nrTalonario_auto_ctacte", True
        Exit Function
    End If
    If ObtenerCampo("nrComprobante_auto_ctacte_ult") = "" Then
        MsgBox "La numeración del talonario automático no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_auto_ctacte_ult").SetFocus
         AvisarError "nrComprobante_auto_ctacte_ult", True
        Exit Function
    End If
    If ObtenerCampo("tpLetraRecibo") = "" Then
        MsgBox "La letra automática no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpLetraRecibo").SetFocus
         AvisarError "tpLetraRecibo", True
        Exit Function
    End If
    ' ------
    ' ----- manual
    
    If ObtenerCampo("nrTalonario_Manual") = "" Then
        MsgBox "no es válido el campo talonario manual", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_Manual").SetFocus
         AvisarError "nrTalonario_Manual", True
        Exit Function
    End If
    
    If ObtenerCampo("nrComprobante_manual_ult") = "" Then
        MsgBox "La numeración del talonario manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_manual_ult").SetFocus
         AvisarError "nrComprobante_manual_ult", True
        Exit Function
    End If
    
    If ObtenerCampo("tpletra_manual") = "" Then
        MsgBox "La letra manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpletra_manual").SetFocus
         AvisarError "tpletra_manual", True
        Exit Function
    End If
    '------
        If ObtenerCampo("nrTalonario_manual_empresa") = "" Then
        MsgBox "no es válido el campo talonario manual.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_manual_empresa").SetFocus
         AvisarError "nrTalonario_manual_empresa", True
        Exit Function
    End If
    If ObtenerCampo("nrComprobante_manual_empresa_ult") = "" Then
        MsgBox "La numeración del talonario manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_manual_empresa_ult").SetFocus
         AvisarError "nrComprobante_manual_empresa_ult", True
        Exit Function
    End If
    If ObtenerCampo("tpLetraEmpresa_manual") = "" Then
        MsgBox "La letra manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpLetraEmpresa_manual").SetFocus
        AvisarError "tpLetraEmpresa_manual", True
        Exit Function
    End If
    '------
        If ObtenerCampo("nrTalonario_manual_ctacte") = "" Then
        MsgBox "no es válido el campo talonario manual.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrTalonario_manual_ctacte").SetFocus
        AvisarError "nrTalonario_manual_ctacte", True
        Exit Function
    End If
    If ObtenerCampo("nrComprobante_manual_ctacte_ult") = "" Then
        MsgBox "La numeración del talonario manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nrComprobante_manual_ctacte_ult").SetFocus
        AvisarError "nrComprobante_manual_ctacte_ult", True
        Exit Function
    End If
    If ObtenerCampo("tpLetraRecibo_manual") = "" Then
        MsgBox "La letra manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("tpLetraRecibo_manual").SetFocus
        AvisarError "tpLetraRecibo_manual", True
        Exit Function
    End If
        
        
        
    validaEntrada = True
    
End Function


Private Sub ExportaraExcel()
Dim strError  As String


    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Puestos") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub

Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Puestos"
        ObjTablasIO.setearCampoOperadorValor "nrPuesto", "=", ObtenerCampo("nrPuesto").Text
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
        
        If ObjTablasIO.Actualizar() Then
            MsgBox "Se ha eliminado con exito el registro", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        Else
            MsgBox "No se ha podido eliminar el puesto porque presenta movimientos de facturación.", vbInformation + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function



Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control     As Control
Dim strtag      As String
Dim strPrefijo  As String
Dim strValor    As String
Dim strSQL      As String

    
    ObjTablasIO.nmTabla = "TB_Puestos"
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
    
            determinarAsignarValoresCamposModificados
    
            strSQL = "  sup_Puestos_v4_1 "
            strSQL = strSQL + " @nrPuesto_param=" + ObtenerCampo("nrPuesto") + " , "
            strSQL = strSQL + " @dsPuesto_param='" + ObtenerCampo("dsPuesto") + "' , "
            strSQL = strSQL + " @dtActualizado_param='" + CStr(Now()) + "',  "
            strSQL = strSQL + " @nrTalonario_manual_param=" + ObtenerCampo("nrTalonario_Manual") + " , "
            strSQL = strSQL + " @nrTalonario_automatico_param=" + ObtenerCampo("nrTalonario_automatico") + " , "
            strSQL = strSQL + " @nrComprobante_manual_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_manual_ult_modificado, "NUMERIC") + " , "
            strSQL = strSQL + " @nrComprobante_automatico_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_automatico_ult_modificado, "NUMERIC") + ", "
            strSQL = strSQL + " @flRespeta_secuencia_carga_manual_param=" + CStr(ObtenerCampo("flRespeta_secuencia_carga_manual")) + ","
            strSQL = strSQL + " @tpLetra_param='" + ObtenerCampo("tpLetra").Text + "',"
                    
            ' Paramtros de la version de la version 1.4
            strSQL = strSQL + "@nrTalonario_manual_empresa_param=" + ObtenerCampo("nrTalonario_manual_empresa") + ", "
            strSQL = strSQL + "@nrTalonario_manual_ctacte_param=" + ObtenerCampo("nrTalonario_manual_ctacte") + ", "
            strSQL = strSQL + "@nrComprobante_manual_empresa_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_manual_empresa_ult_modificado, "NUMERIC") + ", "
            strSQL = strSQL + "@nrComprobante_manual_ctacte_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_manual_ctacte_ult_modificado, "NUMERIC") + ", "
            strSQL = strSQL + "@tpLetraEmpresa_param='" + ObtenerCampo("tpLetraEmpresa") + "', "
            strSQL = strSQL + "@tpLetraRecibo_param='" + ObtenerCampo("tpLetraRecibo") + "', "
            strSQL = strSQL + "@nrTalonario_auto_empresa_param=" + ObtenerCampo("nrTalonario_auto_empresa") + ", "
            strSQL = strSQL + "@nrTalonario_auto_ctacte_param=" + ObtenerCampo("nrTalonario_auto_ctacte") + ", "
            strSQL = strSQL + "@nrComprobante_auto_ctacte_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_auto_ctacte_ult_modificado, "NUMERIC") + ", "
            strSQL = strSQL + "@nrComprobante_auto_empresa_ult_param=" + objbasededatos.FormatearValorSQL(nrComprobante_auto_empresa_ult_modificado, "NUMERIC") + ", "
            strSQL = strSQL + "@tpletra_manual_param='" + ObtenerCampo("tpletra_manual") + "', "
            strSQL = strSQL + "@tpLetraEmpresa_manual_param='" + ObtenerCampo("tpLetraEmpresa_manual") + "', "
            strSQL = strSQL + "@tpLetraRecibo_manual_param='" + ObtenerCampo("tpLetraRecibo_manual") + "',"
            
            
            ' Paramtros de la version de la version 1.8
            strSQL = strSQL + "@nrCAI_Talonario_auto_param=" + objbasededatos.FormatearValorSQL(ObtenerCampo("nrCAI_Talonario_auto"), "DECIMAL", "nrCAI_Talonario_auto") + ", "
            strSQL = strSQL + "@dtCAI_Talonario_auto_param=" + objbasededatos.FormatearValorSQL(ObtenerCampo("dtCAI_Talonario_auto"), "SMALLDATETIME", "dtCAI_Talonario_auto") + ", "
            strSQL = strSQL + "@nrCAI_Talonario_auto_empresa_param=" + objbasededatos.FormatearValorSQL(ObtenerCampo("nrCAI_Talonario_auto_empresa"), "DECIMAL", "nrCAI_Talonario_auto_empresa") + ", "
            strSQL = strSQL + "@dtCAI_Talonario_auto_empresa_param=" + objbasededatos.FormatearValorSQL(ObtenerCampo("dtCAI_Talonario_auto_empresa"), "SMALLDATETIME", "dtCAI_Talonario_auto_empresa") + ", "
            strSQL = strSQL + "@flFacturaCtacte=" + objbasededatos.FormatearValorSQL(ObtenerCampo("flFacturaCtacte"), "BIT", "flFacturaCtacte")
            
            
            objbasededatos.getDateasString
            
            If Not objbasededatos.ExecStoredProcedures2(strSQL) Then
                MsgBox "Error: no se pudo actualizar el registro. " + _
                objbasededatos.Error, vbCritical + vbDefaultButton1, "Atención"
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
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Puestos", "nrPuesto", objConfig.nrPuesto
                MsgBox "El registro ha sido guardado con éxito.", _
                    vbInformation + vbDefaultButton1, "Atención"
                
                Guardarregistro = True
            End If
    End Select

End Function



Private Sub determinarAsignarValoresCamposModificados()

    nrComprobante_automatico_ult_modificado = IIf(nrComprobante_automatico_ult_anterior <> ObtenerCampo("nrComprobante_automatico_ult"), ObtenerCampo("nrComprobante_automatico_ult"), "")
    nrComprobante_auto_empresa_ult_modificado = IIf(nrComprobante_auto_empresa_ult_anterior <> ObtenerCampo("nrComprobante_auto_empresa_ult"), ObtenerCampo("nrComprobante_auto_empresa_ult"), "")
    nrComprobante_auto_ctacte_ult_modificado = IIf(nrComprobante_auto_ctacte_ult_anterior <> ObtenerCampo("nrComprobante_auto_ctacte_ult"), ObtenerCampo("nrComprobante_auto_ctacte_ult"), "")
    nrComprobante_manual_ult_modificado = IIf(nrComprobante_manual_ult_anterior <> ObtenerCampo("nrComprobante_manual_ult"), ObtenerCampo("nrComprobante_manual_ult"), "")
    nrComprobante_manual_empresa_ult_modificado = IIf(nrComprobante_manual_empresa_ult_anterior <> ObtenerCampo("nrComprobante_manual_empresa_ult"), ObtenerCampo("nrComprobante_manual_empresa_ult"), "")
    nrComprobante_manual_ctacte_ult_modificado = IIf(nrComprobante_manual_ctacte_ult_anterior <> ObtenerCampo("nrComprobante_manual_ctacte_ult"), ObtenerCampo("nrComprobante_manual_ctacte_ult"), "")
    



End Sub


Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqPuestos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMPuestos.Visible = True
           Me.tlb_ABM.Buttons("Sincronizar").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "nrPuesto", False
           HabilitarCampos "dsPuesto", True
           On Error Resume Next
           ObtenerCampo("dsPuesto").SetFocus
           On Error GoTo 0
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqPuestos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMPuestos.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Sincronizar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
           HabilitarCampos "tpLetra", True
           On Error Resume Next
           ObtenerCampo("dsPuesto").SetFocus
           On Error GoTo 0
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Sincronizar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
    Case "Exportar"
    Case "Salir"
    Case "Buscar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Sincronizar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMPuestos.Visible = False
           Me.fraBusqPuestos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Sincronizar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMPuestos.Visible = False
           Me.fraBusqPuestos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Cancelar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Sincronizar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMPuestos.Visible = False
           Me.fraBusqPuestos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
           Me.txtBusqueda.SetFocus
    End Select
    
    If Me.fraBusqPuestos.Visible Then
        Me.fraBusqPuestos.Visible = True
          Me.txtBusqueda.SetFocus
    End If
    

End Sub




Private Sub txtBusqueda_GotFocus()

    
    Me.txtBusqueda.Text = Trim(Me.txtBusqueda.Text)
    Me.txtBusqueda.SelStart = Len(Trim(Me.txtBusqueda.Text))
    
    
End Sub

Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n           As Integer
Dim strBuscada  As String

    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Puestos"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Puestos", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Puestos", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Puestos"
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Puestos", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_Puestos", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_Puestos", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer


    If Not KeyAscii = vbKeyReturn Then
        If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Puestos", _
                                Me.txtFields(Index), KeyAscii, False)
        End If
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Puestos", _
                              Me.txtFields(Index), "LostFocus"
                              
    Select Case Me.txtFields(Index).Tag
    Case "dtCAI_Talonario_auto", "dtCAI_Talonario_auto_empresa"
        If Me.txtFields(Index).Text <> "" Then
            If Not IsDate(Me.txtFields(Index).Text) Then
                MsgBox "La fecha no es válida.", vbInformation + vbDefaultButton1, "Atención"
                Me.txtFields(Index).SetFocus
            End If
        End If
    End Select
End Sub
