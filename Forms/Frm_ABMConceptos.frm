VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ABMConceptos 
   Caption         =   "Maestro de Conceptos"
   ClientHeight    =   7185
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9915
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMConceptos.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7185
   ScaleWidth      =   9915
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   9915
      _ExtentX        =   17489
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMConceptos"
      HotImageList    =   "imgABMConceptosResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Concepto"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Concepto deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Concepto"
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
      MouseIcon       =   "Frm_ABMConceptos.frx":030A
      Begin MSComctlLib.ImageList imgABMConceptosResaltado 
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
               Picture         =   "Frm_ABMConceptos.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMConceptos 
         Left            =   1920
         Top             =   0
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
               Picture         =   "Frm_ABMConceptos.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMConceptos 
      BorderStyle     =   0  'None
      Height          =   6585
      Left            =   -1110
      TabIndex        =   5
      Top             =   555
      Width           =   10980
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   5145
         Left            =   1830
         ScaleHeight     =   5115
         ScaleWidth      =   8100
         TabIndex        =   6
         Top             =   600
         Width           =   8130
         Begin VB.ComboBox Combo3 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMConceptos.frx":334A
            Left            =   465
            List            =   "Frm_ABMConceptos.frx":3354
            Style           =   2  'Dropdown List
            TabIndex        =   34
            Tag             =   "tpCajaImputacion"
            Top             =   4395
            Width           =   2700
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Suma en Caja de la Cooperativa"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   0
            Left            =   510
            TabIndex        =   33
            Tag             =   "flSumaenCajaCooperativa"
            Top             =   3015
            Width           =   2970
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Suma en Caja de los Licenciatarios"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   1
            Left            =   510
            TabIndex        =   32
            Tag             =   "flSumaenCajaLicenciatarios"
            Top             =   3360
            Width           =   2850
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Ocultado en la Registración"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   5
            Left            =   510
            TabIndex        =   31
            Tag             =   "flOcultadoenRegistracion"
            Top             =   3735
            Width           =   2850
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Ocultado en Caja del Licenciatario"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   4
            Left            =   3660
            TabIndex        =   30
            Tag             =   "flOcultadoCajaLicenciatario"
            Top             =   3375
            Width           =   3015
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Ocultado en Caja de Cooperativa"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   3
            Left            =   3660
            TabIndex        =   29
            Tag             =   "flOcultadoCajaCooperativa"
            Top             =   3015
            Width           =   3015
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Ocultado en Caja de Admnistración"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   2
            Left            =   3660
            TabIndex        =   28
            Tag             =   "flOcultadoenCajaAdm"
            Top             =   2670
            Width           =   3015
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFC0C0&
            Caption         =   "Suma en Caja de la Admnistración"
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   25
            Left            =   510
            TabIndex        =   27
            Tag             =   "flSumaenCajaAdm"
            Top             =   2700
            Width           =   2985
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   1
            Left            =   4365
            Locked          =   -1  'True
            TabIndex        =   26
            TabStop         =   0   'False
            Tag             =   "tpCreadoPor"
            Top             =   4365
            Width           =   2865
         End
         Begin VB.ComboBox Combo2 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMConceptos.frx":338C
            Left            =   495
            List            =   "Frm_ABMConceptos.frx":3399
            Style           =   2  'Dropdown List
            TabIndex        =   11
            Tag             =   "tpOperacion"
            Top             =   2190
            Width           =   2700
         End
         Begin VB.ComboBox Combo1 
            Appearance      =   0  'Flat
            Height          =   315
            ItemData        =   "Frm_ABMConceptos.frx":33CA
            Left            =   3270
            List            =   "Frm_ABMConceptos.frx":3407
            Style           =   2  'Dropdown List
            TabIndex        =   3
            Tag             =   "tpConcepto"
            Top             =   2175
            Width           =   2700
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmNombre"
            Height          =   705
            Index           =   2
            Left            =   495
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   1
            Tag             =   "dsConcepto"
            Top             =   1140
            Width           =   7425
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   0
            Left            =   525
            Locked          =   -1  'True
            TabIndex        =   0
            TabStop         =   0   'False
            Tag             =   "cdConcepto"
            Top             =   450
            Width           =   1965
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            CausesValidation=   0   'False
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   3
            Left            =   6000
            TabIndex        =   2
            Tag             =   "vlConcepto"
            Top             =   2175
            Width           =   1920
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Pertenece a:"
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
            Left            =   480
            TabIndex        =   35
            Top             =   4170
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            Caption         =   "Creado por"
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
            Left            =   4470
            TabIndex        =   25
            Top             =   4035
            Width           =   1875
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Tipo de Operación"
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
            Left            =   480
            TabIndex        =   12
            Top             =   1965
            Width           =   1905
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Tipo de Concepto"
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
            Left            =   3270
            TabIndex        =   10
            Top             =   1950
            Width           =   1905
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Cod. de Concepto"
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
            Left            =   525
            TabIndex        =   9
            Top             =   210
            Width           =   1965
         End
         Begin VB.Label lblLabels 
            Alignment       =   2  'Center
            BackStyle       =   0  'Transparent
            Caption         =   "Valor Concepto"
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
            Left            =   6030
            TabIndex        =   8
            Top             =   1905
            Width           =   1860
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
            Index           =   27
            Left            =   510
            TabIndex        =   7
            Top             =   870
            Width           =   2730
         End
      End
   End
   Begin VB.Frame fraBusqConceptos 
      BorderStyle     =   0  'None
      Height          =   6360
      Left            =   30
      TabIndex        =   13
      Top             =   675
      Width           =   9840
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   330
         Width           =   2400
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4335
         TabIndex        =   19
         Top             =   330
         Width           =   5400
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1800
         TabIndex        =   14
         Top             =   2355
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   15
            Top             =   630
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   18
            Top             =   375
            Width           =   855
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   17
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   16
            Top             =   390
            Width           =   510
         End
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
               Picture         =   "Frm_ABMConceptos.frx":3554
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":3666
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":3778
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":388A
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":399C
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMConceptos.frx":3AAE
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   20
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
         Height          =   5400
         Left            =   105
         TabIndex        =   21
         Top             =   750
         Width           =   9630
         _ExtentX        =   16986
         _ExtentY        =   9525
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
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "cdConcepto"
            Text            =   "Concepto"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dsConcepto"
            Text            =   "Descripción"
            Object.Width           =   7056
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "tpConcepto"
            Text            =   "Tipo"
            Object.Width           =   4586
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "tpOperacion"
            Text            =   "Operación"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "tpCajaImputacion"
            Text            =   "Pertenece a"
            Object.Width           =   5292
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "vlConcepto"
            Text            =   "Valor"
            Object.Width           =   1764
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   24
         Top             =   105
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   23
         Top             =   90
         Width           =   1755
      End
   End
End
Attribute VB_Name = "Frm_ABMConceptos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    
Dim EstadoABM  As Byte
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
    
    Me.Combo1.ListIndex = 0
    Me.cmbCampos.ListIndex = 1
    PresentarPantalla Me.tlb_ABM.Buttons("Buscar")
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Conceptos"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Conceptos")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Conceptos")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Conceptos", Me.cmbCampos.Text
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
    objGUI.SizeControls Me, Me.fraBusqConceptos, Me.lstBusqueda
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

Private Sub lstBusqueda_DblClick()
Dim Control As Control
Dim Valor   As Variant


    Me.txtBusqueda.Tag = ""
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
    
    ObjTablasIO.nmTabla = "TB_Conceptos"
    ObjTablasIO.setearCampoOperadorValor "cdConcepto", _
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
                            ("TB_Conceptos", Control.Tag, _
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
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Conceptos", "cdConcepto", objConfig.nrPuesto)
           ObtenerCampo("cdConcepto").Text = strValor
           ' Version 3.2
           ObtenerCampo("tpCreadoPor").Text = "Usuario"
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
           If Guardarregistro(EstadoABM) Then
                PresentarPantalla Button
                EstadoABM = Consulta
           End If
    Case "Cancelar"
            PresentarPantalla Button
            EstadoABM = Consulta
    End Select
    
End Sub



Private Sub ExportaraExcel()
Dim strError  As String


    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Conceptos") Then
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
        ObjTablasIO.nmTabla = "TB_Conceptos"
        ObjTablasIO.setearCampoOperadorValor "cdConcepto", "=", ObtenerCampo("cdConcepto").Text
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
        If ObjTablasIO.Actualizar() Then
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


    If EstadoABM = alta Then
        strValor = objbasededatos.SP_ObtenerMaxcdConcepto()
        objDiccionariodeDatos.GuardarValorCampo _
                "TB_Conceptos", "cdConcepto", objParametros.ObtenerValor("nrPuesto"), strValor
        ObtenerCampo("cdConcepto").Text = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
    End If
    
    ObjTablasIO.nmTabla = "TB_Conceptos"
    
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
    
    ObjTablasIO.setearCampoOperadorValor "dtActualizacion", "<-", objbasededatos.getDateasString()

    Select Case EstadoABM
    Case modificacion
            ObjTablasIO.setearCampoOperadorValor "cdConcepto", _
            "=", ObtenerCampo("cdConcepto").Text
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
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Conceptos", "cdConcepto", objConfig.nrPuesto
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
           Me.fraBusqConceptos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMConceptos.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           If ObtenerCampo("tpCreadoPor") = "Sistema" Then
                objGUI.HabilitarCampos ObtenerCampo("dsConcepto"), False
                objGUI.HabilitarCampos ObtenerCampo("tpOperacion"), False
                objGUI.HabilitarCampos ObtenerCampo("tpConcepto"), False
                objGUI.HabilitarCampos ObtenerCampo("vlConcepto"), False
           Else
                objGUI.HabilitarCampos ObtenerCampo("dsConcepto"), True
                objGUI.HabilitarCampos ObtenerCampo("tpOperacion"), True
                objGUI.HabilitarCampos ObtenerCampo("tpConcepto"), True
                objGUI.HabilitarCampos ObtenerCampo("vlConcepto"), True
           End If
           Me.txtBusqueda.Tag = ""
    Case "Agregar"
           Me.fraBusqConceptos.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMConceptos.Visible = True
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
           ObtenerCampo("cdConcepto").SetFocus
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
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMConceptos.Visible = False
           Me.fraBusqConceptos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMConceptos.Visible = False
           Me.fraBusqConceptos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0

    Case "Cancelar"
           
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMConceptos.Visible = False
           Me.fraBusqConceptos.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0

           Me.txtBusqueda.SetFocus
    End Select
    
    If Me.fraBusqConceptos.Visible Then
        Me.fraBusqConceptos.Visible = True
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
         ObjTablasIO.nmTabla = "TB_Conceptos"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Conceptos", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
         ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
         
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Conceptos", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Conceptos"
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
    Else
        objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Conceptos", Me.cmbCampos.Text
        Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
        KeyAscii = objDiccionariodeDatos.ValidarEntrada _
        ("TB_Conceptos", Me.txtBusqueda, KeyAscii)
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_Conceptos", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer


    If Not KeyAscii = vbKeyReturn Then
        If Not KeyAscii = vbKeyReturn Then
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Conceptos", _
                                Me.txtFields(Index), KeyAscii)
        End If
    End If
    
End Sub



Private Sub ValidTextBox1_Click()

End Sub

Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Conceptos", _
                              Me.txtFields(Index), "LostFocus"
End Sub
