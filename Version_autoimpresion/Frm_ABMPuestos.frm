VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_ABMPuestos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Maestro de Puestos"
   ClientHeight    =   6810
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9045
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMPuestos.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   6810
   ScaleWidth      =   9045
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   9045
      _ExtentX        =   15954
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMPuestos"
      HotImageList    =   "imgABMPuestosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Puesto"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Puesto deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Puesto"
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
      MouseIcon       =   "Frm_ABMPuestos.frx":030A
      Begin MSComctlLib.ImageList imgABMPuestosResaltado 
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
            NumListImages   =   10
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMPuestos 
      BorderStyle     =   0  'None
      Height          =   5985
      Left            =   -60
      TabIndex        =   10
      Top             =   690
      Width           =   9060
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   5310
         Left            =   420
         ScaleHeight     =   5280
         ScaleWidth      =   8265
         TabIndex        =   11
         Top             =   435
         Width           =   8295
         Begin VB.Frame Frame2 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Facturación Manual"
            ForeColor       =   &H80000008&
            Height          =   2100
            Left            =   105
            TabIndex        =   38
            Top             =   2790
            Width           =   7980
            Begin VB.CheckBox Check1 
               BackColor       =   &H00FFC0C0&
               Caption         =   "Carga Manual con Secuencia"
               Height          =   192
               Left            =   135
               TabIndex        =   57
               Tag             =   "flRespeta_secuencia_carga_manual"
               Top             =   1740
               Width           =   3228
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   21
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   50
               Tag             =   "tpLetra"
               Top             =   570
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   20
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   49
               Tag             =   "nrComprobante_manual_ult"
               Top             =   585
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   19
               Left            =   2250
               Locked          =   -1  'True
               TabIndex        =   48
               Tag             =   "nrTalonario_manual"
               Top             =   570
               Width           =   1176
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   18
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   47
               Tag             =   "tpLetraEmpresa"
               Top             =   915
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   17
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   46
               Tag             =   "nrComprobante_manual_empresa_ult"
               Top             =   930
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   16
               Left            =   2250
               Locked          =   -1  'True
               TabIndex        =   45
               Tag             =   "nrTalonario_manual_empresa"
               Top             =   930
               Width           =   1176
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   15
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   44
               Tag             =   "tpLetraRecibo"
               Top             =   1275
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   14
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   43
               Tag             =   "nrComprobante_manual_ctacte_ult"
               Top             =   1275
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   13
               Left            =   2250
               Locked          =   -1  'True
               TabIndex        =   42
               Tag             =   "nrTalonario_manual_ctacte"
               Top             =   1290
               Width           =   1176
            End
            Begin VB.CommandButton cmdActualizarNumeracionManual 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   41
               Top             =   585
               Width           =   876
            End
            Begin VB.CommandButton Command4 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   40
               Top             =   930
               Width           =   876
            End
            Begin VB.CommandButton Command3 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   39
               Top             =   1290
               Width           =   876
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
               Left            =   5415
               TabIndex        =   56
               Top             =   285
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
               Left            =   3525
               TabIndex        =   55
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
               Left            =   2220
               TabIndex        =   54
               Top             =   300
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
               TabIndex        =   53
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
               TabIndex        =   52
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
               TabIndex        =   51
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
            Left            =   105
            TabIndex        =   19
            Top             =   735
            Width           =   7980
            Begin VB.CommandButton Command2 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   34
               Top             =   1275
               Width           =   876
            End
            Begin VB.CommandButton Command1 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   33
               Top             =   915
               Width           =   876
            End
            Begin VB.CommandButton cmdActualizarNumeracionAutomatico 
               Caption         =   "Actualizar"
               Height          =   288
               Left            =   6330
               TabIndex        =   32
               Top             =   555
               Width           =   876
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   12
               Left            =   2235
               Locked          =   -1  'True
               TabIndex        =   31
               Tag             =   "nrTalonario_auto_ctacte"
               Top             =   1320
               Width           =   1176
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   11
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   30
               Tag             =   "nrComprobante_auto_ctacte_ult"
               Top             =   1305
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   10
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   29
               Tag             =   "tpLetraRecibo"
               Top             =   1305
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   285
               Index           =   9
               Left            =   2235
               Locked          =   -1  'True
               TabIndex        =   28
               Tag             =   "nrTalonario_auto_empresa"
               Top             =   945
               Width           =   1176
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   8
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   27
               Tag             =   "nrComprobante_auto_empresa_ult"
               Top             =   945
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   7
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   26
               Tag             =   "tpLetraEmpresa"
               Top             =   930
               Width           =   810
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   1
               Left            =   2250
               Locked          =   -1  'True
               TabIndex        =   22
               Tag             =   "nrTalonario_automatico"
               Top             =   570
               Width           =   1176
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   4
               Left            =   3525
               Locked          =   -1  'True
               TabIndex        =   21
               Tag             =   "nrComprobante_automatico_ult"
               Top             =   585
               Width           =   1755
            End
            Begin VB.TextBox txtFields 
               Alignment       =   2  'Center
               Appearance      =   0  'Flat
               BackColor       =   &H00E0E0E0&
               CausesValidation=   0   'False
               DataField       =   "nmApellido"
               Height          =   300
               Index           =   6
               Left            =   5400
               Locked          =   -1  'True
               TabIndex        =   20
               Tag             =   "tpLetra"
               Top             =   570
               Width           =   810
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
               TabIndex        =   37
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
               TabIndex        =   36
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
               TabIndex        =   35
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
               Left            =   2220
               TabIndex        =   25
               Top             =   300
               Width           =   960
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
               Left            =   3525
               TabIndex        =   24
               Top             =   285
               Width           =   1455
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
               Index           =   4
               Left            =   5415
               TabIndex        =   23
               Top             =   285
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
            TabIndex        =   1
            Tag             =   "dsPuesto"
            Top             =   330
            Width           =   3975
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
            TabIndex        =   2
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
            TabIndex        =   13
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
            TabIndex        =   12
            Top             =   90
            Width           =   4230
         End
      End
   End
   Begin VB.Frame fraBusqPuestos 
      BorderStyle     =   0  'None
      Height          =   6360
      Left            =   -30
      TabIndex        =   6
      Top             =   570
      Width           =   9030
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1815
         TabIndex        =   14
         Top             =   2355
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   15
            Top             =   615
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.Label Label3 
            BackColor       =   &H80000009&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   18
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H80000009&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   17
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H80000009&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   16
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   288
         Left            =   4320
         TabIndex        =   0
         Top             =   348
         Width           =   4575
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
               Picture         =   "Frm_ABMPuestos.frx":334A
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":345C
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":356E
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3680
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":3792
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMPuestos.frx":38A4
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   5
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
         Height          =   5220
         Left            =   108
         TabIndex        =   3
         Top             =   696
         Width           =   8820
         _ExtentX        =   15558
         _ExtentY        =   9208
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
         Appearance      =   1
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
      End
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   330
         Width           =   2400
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   216
         Left            =   4320
         TabIndex        =   8
         Top             =   132
         Width           =   1752
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   7
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


Public Sub RefrescarProgressbar(pAvance As Long)

    DoEvents
    On Error Resume Next
    Me.ProgressBar.Value = pAvance
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
                    Control.Value = False
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





Private Sub cmdActualizarNumeracionAutomatico_Click()
Dim resp As Byte
Dim strSQL  As String

    resp = MsgBox("Esta seguro que desea reconstruir la numeración a partir de la base de datos.", vbQuestion + vbYesNo, "Atención")
    
    If resp = vbNo Then Exit Sub
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    strSQL = " sco_obtener_UltNroComprobante "
                        strSQL = strSQL + "@nrTalonario_param='" + ObtenerCampo("nrTalonario_automatico").Text + "',"
                        strSQL = strSQL + "@tpTalonario_param='A',"
                        strSQL = strSQL + "@tpLetra_param='" + ObtenerCampo("tpLetra").Text + "'"
                        
                    
                        
    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
        On Error Resume Next
        objbasededatos.rs_resultados.Close
        On Error GoTo 0
        MsgBox "ERROR: " + objbasededatos.Error, vbCritical + vbDefaultButton1, "Atencion"
        Exit Sub
    End If
    
    ObtenerCampo("nrComprobante_automatico_ult") = objbasededatos.rs_resultados("nro_comprobante")
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    If Trim(ObtenerCampo("nrComprobante_automatico_ult").Text) = "99999999" Then
        MsgBox "El talonario '" + ObtenerCampo("nrTalonario_automatico").Text + "' ha llegado a su fin, debe reemplazarlo.", vbInformation + vbDefaultButton1, "Atención"
        HabilitarCampos "nrTalonario_automatico", True
        HabilitarCampos "nrComprobante_automatico_ult", True
        AvisarError "nrTalonario_automatico", True
        AvisarError "nrComprobante_automatico_ult", True
    Else
        If EstadoABM <> alta Then
            HabilitarCampos "nrTalonario_automatico", False
            HabilitarCampos "nrComprobante_automatico_ult", True
        End If
    End If
    
End Sub

Private Sub cmdActualizarNumeracionManual_Click()
Dim resp As Byte
Dim strSQL As String

    resp = MsgBox("Esta seguro que desea reconstruir la numeración a partir de la base de datos.", vbQuestion + vbYesNo, "Atención")
    
    If resp = vbNo Then Exit Sub
    
    ' Verificar si los nros de lalonario pueder ser modificados
    strSQL = " sco_obtener_UltNroComprobante "
                        strSQL = strSQL + "@nrTalonario_param='" + ObtenerCampo("nrTalonario_Manual").Text + "',"
                        strSQL = strSQL + "@tpTalonario_param='M',"
                        strSQL = strSQL + "@tpLetra_param='" + ObtenerCampo("tpLetra").Text + "'"
                        
        
    If Not objbasededatos.ExecStoredProcedures(strSQL) Then
        On Error Resume Next
        objbasededatos.rs_resultados.Close
        On Error GoTo 0
        MsgBox "ERROR: " + objbasededatos.Error, vbCritical + vbDefaultButton1, "Atencion"
        Exit Sub
    End If
    
    ObtenerCampo("nrComprobante_manual_ult") = objbasededatos.rs_resultados("nro_comprobante")
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    If Trim(ObtenerCampo("nrComprobante_manual_ult").Text) = "99999999" Then
        MsgBox "El talonario '" + ObtenerCampo("nrTalonario_Manual").Text + "' ha llegado a su fin, debe reemplazarlo.", vbInformation + vbDefaultButton1, "Atención"
        HabilitarCampos "nrTalonario_Manual", True
        HabilitarCampos "nrComprobante_manual_ult", True
        AvisarError "nrTalonario_Manual", True
        AvisarError "nrComprobante_manual_ult", True
    Else
        HabilitarCampos "nrTalonario_Manual", False
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

    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    EstadoABM = Consulta
    limpiarControles
    cargarcamposdebusqueda
    Me.cmbCampos.ListIndex = 1
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
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
    
    ObjTablasIO.nmTabla = "TB_Puestos"
    ObjTablasIO.setearCampoOperadorValor "nrPuesto", _
    "=", Me.lstBusqueda.SelectedItem.Text
    
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
                    If Err Then
                        Control.Value = AdaptarTrueFalse(Control, Valor)
                    End If
                    On Error GoTo 0
                End If
            End If
    Next
    
    
    On Error Resume Next
    objbasededatos.rs_resultados.Close
    On Error GoTo 0
    
    
    If Trim(ObtenerCampo("nrComprobante_manual_ult").Text) = "99999999" Then
        MsgBox "El talonario manual nro. '" + ObtenerCampo("nrTalonario_Manual").Text + "' ha llegado a su fin, debe reemplazarlo.", vbInformation + vbDefaultButton1, "Atención"
        HabilitarCampos "nrTalonario_Manual", True
        HabilitarCampos "nrComprobante_manual_ult", True
        AvisarError "nrTalonario_Manual", True
        AvisarError "nrComprobante_manual_ult", True
    Else
        HabilitarCampos "nrTalonario_Manual", False
    End If
    
    
    If Trim(ObtenerCampo("nrComprobante_automatico_ult").Text) = "99999999" Then
        MsgBox "El talonario automático nro. '" + ObtenerCampo("nrTalonario_automatico").Text + "' ha llegado a su fin, debe reemplazarlo.", vbInformation + vbDefaultButton1, "Atención"
        HabilitarCampos "nrTalonario_automatico", True
        HabilitarCampos "nrComprobante_automatico_ult", True
        AvisarError "nrComprobante_automatico_ult", True
        AvisarError "nrTalonario_automatico", True
    Else
        HabilitarCampos "nrTalonario_automatico", False
        HabilitarCampos "nrComprobante_automatico_ult", False
    End If
    
 
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
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
Dim strValor    As String
    
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
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Puestos", "nrPuesto", objConfig.nrPuesto)
           ObtenerCampo("nrPuesto").Text = strValor
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
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Function validaEntrada() As Boolean

    validaEntrada = False
    If ObtenerCampo("nrTalonario_Manual") = "" Then
        MsgBox "no es válido el campo talonario manual", vbInformation + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    If ObtenerCampo("nrComprobante_manual_ult") = "" Then
        MsgBox "La numeración del talonario manual no es válida.", vbInformation + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    If ObtenerCampo("nrTalonario_automatico") = "" Then
        MsgBox "no es válido el campo talonario automático.", vbInformation + vbDefaultButton1, "Atención"
        Exit Function
    End If
    
    If ObtenerCampo("nrComprobante_automatico_ult") = "" Then
        MsgBox "La numeración del talonario automático no es válida.", vbInformation + vbDefaultButton1, "Atención"
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
        If ObjTablasIO.Eliminar() Then
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
                            "<-", Control.Value
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
    
            strSQL = " sup_Puestos "
            strSQL = strSQL + " @nrPuesto_param=" + ObtenerCampo("nrPuesto") + " , "
            strSQL = strSQL + " @dsPuesto_param='" + ObtenerCampo("dsPuesto") + "' , "
            strSQL = strSQL + " @dtActualizado_param='" + CStr(Now()) + "',  "
            strSQL = strSQL + " @nrTalonario_manual_param=" + ObtenerCampo("nrTalonario_manual") + " , "
            strSQL = strSQL + " @nrTalonario_automatico_param=" + ObtenerCampo("nrTalonario_automatico") + " , "
            strSQL = strSQL + " @nrComprobante_manual_ult_param=" + ObtenerCampo("nrComprobante_manual_ult") + " , "
            strSQL = strSQL + " @nrComprobante_automatico_ult_param=" + ObtenerCampo("nrComprobante_automatico_ult") + ", "
            strSQL = strSQL + " @flRespeta_secuencia_carga_manual_param=" + CStr(ObtenerCampo("flRespeta_secuencia_carga_manual")) + ","
            strSQL = strSQL + " @tpLetra_param=" + ObtenerCampo("tpLetra").Text
            
            If Not objbasededatos.ExecStoredProcedures(strSQL) Then
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




Private Sub PresentarPantalla(ByVal Button As MSComctlLib.Button)
Dim i  As Integer

    Select Case Button.Key
    Case "Seleccionar"
           Me.fraBusqPuestos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMPuestos.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           HabilitarCampos "dsPuesto", True
           HabilitarCampos "nrTalonario_automatico", False
           HabilitarCampos "nrComprobante_automatico_ult", False
           HabilitarCampos "tpLetra", False
           On Error Resume Next
           ObtenerCampo("dsPuesto").SetFocus
           On Error GoTo 0
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqPuestos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMPuestos.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.txtBusqueda.Tag = ""
           HabilitarCampos "nrTalonario_automatico", True
           HabilitarCampos "nrComprobante_automatico_ult", True
           HabilitarCampos "nrTalonario_manual", True
           HabilitarCampos "nrComprobante_manual_ult", True
           HabilitarCampos "tpLetra", True
           On Error Resume Next
           ObtenerCampo("dsPuesto").SetFocus
           On Error GoTo 0
    Case "Eliminar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
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
         ObtenerOperadorAritmetico() + "", strBuscada, "", "ASC"
         
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

Private Sub txtFields_Change(Index As Integer)


    Select Case Me.txtFields(Index).Tag
    Case "nrTalonario_manual", "nrComprobante_manual_ult"
        AvisarError "nrTalonario_manual", False
        AvisarError "nrComprobante_manual_ult", False
    Case "nrTalonario_automatico", "nrComprobante_automatico_ult"
        AvisarError "nrTalonario_automatico", False
        AvisarError "nrComprobante_automatico_ult", False
    End Select

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
End Sub
