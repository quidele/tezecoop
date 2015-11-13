VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Begin VB.Form Frm_ABMProveedores 
   Caption         =   "Maestro de Proveedores"
   ClientHeight    =   7725
   ClientLeft      =   120
   ClientTop       =   510
   ClientWidth     =   10500
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMProveedores.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7725
   ScaleWidth      =   10500
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   55
      Top             =   0
      Width           =   10500
      _ExtentX        =   18521
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMProveedores"
      HotImageList    =   "imgABMProveedoresResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un Proveedor"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el Proveedor deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo Proveedor"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "E&xportar(F6)"
            Key             =   "Exportar"
            ImageIndex      =   9
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Aceptar(F2)"
            Key             =   "Aceptar"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "&Cancelar(F3)"
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
      MouseIcon       =   "Frm_ABMProveedores.frx":030A
      Begin MSComctlLib.ImageList imgABMProveedoresResaltado 
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
               Picture         =   "Frm_ABMProveedores.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMProveedores 
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
               Picture         =   "Frm_ABMProveedores.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMProveedores 
      BorderStyle     =   0  'None
      Height          =   6870
      Left            =   -45
      TabIndex        =   26
      Top             =   675
      Width           =   10620
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   16
         Left            =   5235
         TabIndex        =   58
         Tag             =   "nrSocio"
         Top             =   480
         Width           =   1005
      End
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "tpProveedor"
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_ABMProveedores.frx":334A
         Left            =   1950
         List            =   "Frm_ABMProveedores.frx":3354
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "tpCategoria"
         Top             =   480
         Width           =   1560
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   2
         Left            =   270
         TabIndex        =   5
         Tag             =   "nmNombre"
         Top             =   1155
         Width           =   1965
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         DataField       =   "nmApellido"
         Height          =   285
         Index           =   3
         Left            =   2355
         TabIndex        =   6
         Tag             =   "nmApellido"
         Top             =   1155
         Width           =   4650
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdProveedor"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   210
         Locked          =   -1  'True
         TabIndex        =   0
         TabStop         =   0   'False
         Tag             =   "cdProveedor"
         Top             =   510
         Width           =   1095
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         DataField       =   "dsRazonSocial"
         Height          =   315
         Index           =   4
         Left            =   3645
         TabIndex        =   4
         Tag             =   "dsRazonSocial"
         Top             =   480
         Width           =   3375
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   5010
         Left            =   195
         TabIndex        =   27
         TabStop         =   0   'False
         Top             =   1755
         Width           =   8715
         _ExtentX        =   15372
         _ExtentY        =   8837
         _Version        =   393216
         Style           =   1
         TabHeight       =   520
         ForeColor       =   -2147483630
         TabCaption(0)   =   "Datos &Personales"
         TabPicture(0)   =   "Frm_ABMProveedores.frx":3370
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "lblLabels(5)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "lblLabels(6)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "lblLabels(7)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "lblLabels(8)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "lblLabels(9)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "lblLabels(10)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "lblLabels(11)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "lblLabels(12)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "lblLabels(13)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "lblLabels(16)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "DTPicker1(1)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).Control(11)=   "txtFields(5)"
         Tab(0).Control(11).Enabled=   0   'False
         Tab(0).Control(12)=   "txtFields(6)"
         Tab(0).Control(12).Enabled=   0   'False
         Tab(0).Control(13)=   "txtFields(7)"
         Tab(0).Control(13).Enabled=   0   'False
         Tab(0).Control(14)=   "txtFields(10)"
         Tab(0).Control(14).Enabled=   0   'False
         Tab(0).Control(15)=   "txtFields(11)"
         Tab(0).Control(15).Enabled=   0   'False
         Tab(0).Control(16)=   "DTPicker1(0)"
         Tab(0).Control(16).Enabled=   0   'False
         Tab(0).Control(17)=   "txtFields(1)"
         Tab(0).Control(17).Enabled=   0   'False
         Tab(0).Control(18)=   "txtFields(8)"
         Tab(0).Control(18).Enabled=   0   'False
         Tab(0).Control(19)=   "txtFields(9)"
         Tab(0).Control(19).Enabled=   0   'False
         Tab(0).Control(20)=   "txtFields(18)"
         Tab(0).Control(20).Enabled=   0   'False
         Tab(0).Control(21)=   "txtFields(19)"
         Tab(0).Control(21).Enabled=   0   'False
         Tab(0).ControlCount=   22
         TabCaption(1)   =   "Datos &Comerciales"
         TabPicture(1)   =   "Frm_ABMProveedores.frx":3642
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "lblLabels(20)"
         Tab(1).Control(1)=   "lblLabels(14)"
         Tab(1).Control(2)=   "lblLabels(17)"
         Tab(1).Control(3)=   "lblLabels(21)"
         Tab(1).Control(4)=   "lblLabels(23)"
         Tab(1).Control(5)=   "lblLabels(18)"
         Tab(1).Control(6)=   "lblLabels(22)"
         Tab(1).Control(7)=   "DTPicker1(2)"
         Tab(1).Control(8)=   "txtFields(14)"
         Tab(1).Control(9)=   "txtFields(15)"
         Tab(1).Control(10)=   "txtFields(17)"
         Tab(1).Control(11)=   "txtFields(24)"
         Tab(1).Control(12)=   "txtFields(12)"
         Tab(1).Control(13)=   "chkFields(25)"
         Tab(1).Control(14)=   "txtFields(20)"
         Tab(1).ControlCount=   15
         TabCaption(2)   =   "Teléfonos y Otros Datos"
         TabPicture(2)   =   "Frm_ABMProveedores.frx":37A0
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "Label5"
         Tab(2).Control(1)=   "Label6"
         Tab(2).Control(2)=   "Label7"
         Tab(2).Control(3)=   "Label8"
         Tab(2).Control(4)=   "Label9"
         Tab(2).Control(5)=   "lblLabels(2)"
         Tab(2).Control(6)=   "txtFields(21)"
         Tab(2).Control(7)=   "txtFields(22)"
         Tab(2).Control(8)=   "txtFields(23)"
         Tab(2).Control(9)=   "txtFields(25)"
         Tab(2).Control(10)=   "txtFields(26)"
         Tab(2).Control(11)=   "txtFields(27)"
         Tab(2).Control(12)=   "txtFields(28)"
         Tab(2).Control(13)=   "chkFields(0)"
         Tab(2).ControlCount=   14
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   0
            Left            =   -70125
            TabIndex        =   78
            Tag             =   "flcongas"
            Top             =   2685
            Width           =   285
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   28
            Left            =   -73830
            MaxLength       =   20
            TabIndex        =   76
            Tag             =   "tpmodeloauto"
            Top             =   2670
            Width           =   3225
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   27
            Left            =   -70590
            TabIndex        =   71
            Tag             =   "telchofer3"
            Top             =   1800
            Width           =   3015
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   26
            Left            =   -70590
            TabIndex        =   69
            Tag             =   "telchofer2"
            Top             =   1530
            Width           =   3015
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   25
            Left            =   -70590
            TabIndex        =   67
            Tag             =   "telchofer1"
            Top             =   1260
            Width           =   3015
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   23
            Left            =   -73785
            TabIndex        =   70
            Tag             =   "chofer3"
            Top             =   1800
            Width           =   3210
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   22
            Left            =   -73785
            TabIndex        =   68
            Tag             =   "chofer2"
            Top             =   1530
            Width           =   3210
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "nmApellido"
            Height          =   285
            Index           =   21
            Left            =   -73785
            TabIndex        =   66
            Tag             =   "chofer1"
            Top             =   1260
            Width           =   3210
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   315
            Index           =   20
            Left            =   -72825
            TabIndex        =   65
            Tag             =   "dtFinOrdenanza"
            Top             =   1620
            Width           =   1260
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   300
            Index           =   19
            Left            =   1950
            TabIndex        =   64
            Tag             =   "dtBaja"
            Top             =   4290
            Width           =   1260
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   300
            Index           =   18
            Left            =   270
            TabIndex        =   63
            Tag             =   "dtAlta"
            Top             =   4275
            Width           =   1260
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   25
            Left            =   -71790
            TabIndex        =   23
            Tag             =   "flBloqueado"
            Top             =   2400
            Width           =   285
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   315
            Index           =   9
            Left            =   255
            TabIndex        =   7
            Tag             =   "nrCUIT"
            Top             =   855
            Width           =   2190
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   300
            Index           =   8
            Left            =   3315
            TabIndex        =   12
            Tag             =   "nrFax"
            Top             =   2895
            Width           =   3045
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Index           =   1
            Left            =   240
            TabIndex        =   11
            Tag             =   "nrTel"
            Top             =   2910
            Width           =   2955
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "vlOrdenanza3337"
            Height          =   315
            Index           =   12
            Left            =   -74445
            TabIndex        =   20
            Tag             =   "vlOrdenanza3337"
            Top             =   1620
            Width           =   1530
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   345
            Index           =   0
            Left            =   1515
            TabIndex        =   25
            TabStop         =   0   'False
            Top             =   4260
            Width           =   315
            _ExtentX        =   556
            _ExtentY        =   609
            _Version        =   393216
            Format          =   105644033
            CurrentDate     =   38267
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsEmail"
            Height          =   285
            Index           =   11
            Left            =   3285
            TabIndex        =   14
            Tag             =   "dsEmail"
            Top             =   3630
            Width           =   3510
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   285
            Index           =   10
            Left            =   255
            TabIndex        =   13
            Tag             =   "dsCargo"
            Top             =   3615
            Width           =   2940
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Index           =   7
            Left            =   255
            TabIndex        =   10
            Tag             =   "nmLocalidad"
            Top             =   2265
            Width           =   3375
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "cdPostal"
            Height          =   285
            Index           =   6
            Left            =   3705
            TabIndex        =   9
            Tag             =   "cdPostal"
            Top             =   1575
            Width           =   1020
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsDomicilio"
            Height          =   285
            Index           =   5
            Left            =   240
            TabIndex        =   8
            Tag             =   "dsDomicilio"
            Top             =   1560
            Width           =   3375
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpEstado"
            Height          =   285
            Index           =   24
            Left            =   -74505
            TabIndex        =   22
            Tag             =   "tpEstado"
            Top             =   2385
            Width           =   2175
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpIIBB"
            Height          =   285
            Index           =   17
            Left            =   -73785
            TabIndex        =   18
            Tag             =   "tpIIBB"
            Top             =   1005
            Width           =   840
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpDoc"
            Height          =   285
            Index           =   15
            Left            =   -72750
            TabIndex        =   19
            Tag             =   "nrIIBB"
            Top             =   1005
            Width           =   1440
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpIVA"
            Height          =   285
            Index           =   14
            Left            =   -74445
            TabIndex        =   17
            Tag             =   "tpIVA"
            Top             =   1005
            Width           =   510
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   360
            Index           =   1
            Left            =   3195
            TabIndex        =   24
            TabStop         =   0   'False
            Top             =   4275
            Width           =   315
            _ExtentX        =   556
            _ExtentY        =   635
            _Version        =   393216
            Format          =   105971713
            CurrentDate     =   38267
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   360
            Index           =   2
            Left            =   -71580
            TabIndex        =   1
            TabStop         =   0   'False
            Top             =   1605
            Width           =   285
            _ExtentX        =   503
            _ExtentY        =   635
            _Version        =   393216
            Format          =   105971713
            CurrentDate     =   38267
         End
         Begin VB.Label lblLabels 
            Caption         =   "Gas"
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
            Index           =   2
            Left            =   -70245
            TabIndex        =   79
            Top             =   2460
            Width           =   660
         End
         Begin VB.Label Label9 
            Caption         =   "Modelo"
            Height          =   225
            Left            =   -73830
            TabIndex        =   77
            Top             =   2415
            Width           =   645
         End
         Begin VB.Label Label8 
            Caption         =   "Chofer2"
            Height          =   225
            Left            =   -74715
            TabIndex        =   75
            Top             =   1890
            Width           =   645
         End
         Begin VB.Label Label7 
            Caption         =   "Chofer1"
            Height          =   225
            Left            =   -74715
            TabIndex        =   74
            Top             =   1605
            Width           =   645
         End
         Begin VB.Label Label6 
            Caption         =   "Teléfonos"
            Height          =   225
            Left            =   -70620
            TabIndex        =   73
            Top             =   1005
            Width           =   2040
         End
         Begin VB.Label Label5 
            Caption         =   "Titular"
            Height          =   225
            Left            =   -74715
            TabIndex        =   72
            Top             =   1290
            Width           =   645
         End
         Begin VB.Label lblLabels 
            Caption         =   "Bloqueado"
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
            Index           =   22
            Left            =   -72045
            TabIndex        =   56
            Top             =   2160
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Número de IIBB"
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
            Left            =   -72780
            TabIndex        =   31
            Top             =   795
            Width           =   1485
         End
         Begin VB.Label lblLabels 
            Caption         =   "Nro. CUIT"
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
            Index           =   16
            Left            =   270
            TabIndex        =   43
            Top             =   615
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Fecha de Baja"
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
            Left            =   1950
            TabIndex        =   42
            Top             =   4050
            Width           =   1365
         End
         Begin VB.Label lblLabels 
            Caption         =   "Fecha de Alta"
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
            Left            =   270
            TabIndex        =   41
            Top             =   4035
            Width           =   1365
         End
         Begin VB.Label lblLabels 
            Caption         =   "Email"
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
            Index           =   11
            Left            =   3240
            TabIndex        =   40
            Top             =   3405
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Cargo"
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
            Index           =   10
            Left            =   240
            TabIndex        =   39
            Top             =   3390
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Fax"
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
            Left            =   3300
            TabIndex        =   38
            Top             =   2655
            Width           =   600
         End
         Begin VB.Label lblLabels 
            Caption         =   "Teléfono"
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
            Left            =   225
            TabIndex        =   37
            Top             =   2685
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Localidad"
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
            Left            =   255
            TabIndex        =   36
            Top             =   2010
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Cod. Postal"
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
            Left            =   3735
            TabIndex        =   35
            Top             =   1320
            Width           =   1395
         End
         Begin VB.Label lblLabels 
            Caption         =   "Domicilio"
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
            Left            =   240
            TabIndex        =   34
            Top             =   1320
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Estado "
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
            Index           =   23
            Left            =   -74490
            TabIndex        =   33
            Top             =   2100
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Fecha de Finalización"
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
            Index           =   21
            Left            =   -72780
            TabIndex        =   32
            Top             =   1395
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "IIBB"
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
            Index           =   17
            Left            =   -73755
            TabIndex        =   30
            Top             =   765
            Width           =   735
         End
         Begin VB.Label lblLabels 
            Caption         =   "IVA"
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
            Index           =   14
            Left            =   -74460
            TabIndex        =   29
            Top             =   765
            Width           =   645
         End
         Begin VB.Label lblLabels 
            Caption         =   "Ordenanza 3337"
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
            Index           =   20
            Left            =   -74460
            TabIndex        =   28
            Top             =   1395
            Width           =   1815
         End
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Index           =   13
         Left            =   3630
         TabIndex        =   3
         Tag             =   "nrLicencia"
         Top             =   480
         Width           =   795
      End
      Begin VB.Label lblnrSocio 
         Caption         =   "Nro. Socio"
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
         Left            =   5220
         TabIndex        =   59
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label lblLabels 
         Caption         =   "Nombre"
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
         Left            =   285
         TabIndex        =   52
         Top             =   945
         Width           =   870
      End
      Begin VB.Label lblLabels 
         Caption         =   "Apellido"
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
         Left            =   2385
         TabIndex        =   51
         Top             =   945
         Width           =   870
      End
      Begin VB.Label lblLabels 
         Caption         =   "Nro. de Proveedor"
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
         Left            =   255
         TabIndex        =   46
         Top             =   270
         Width           =   1620
      End
      Begin VB.Label lblLabels 
         Caption         =   "Tipo"
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
         Index           =   1
         Left            =   1965
         TabIndex        =   45
         Top             =   255
         Width           =   975
      End
      Begin VB.Label lblRazonSocial 
         Caption         =   "Razón Social"
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
         Left            =   3630
         TabIndex        =   44
         Top             =   255
         Width           =   1815
      End
      Begin VB.Label lblLicencia 
         Caption         =   "Nro. de Licencia"
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
         Left            =   3645
         TabIndex        =   57
         Top             =   225
         Width           =   1815
      End
   End
   Begin VB.Frame fraBusqProveedores 
      BorderStyle     =   0  'None
      Height          =   6900
      Left            =   -30
      TabIndex        =   50
      Top             =   615
      Width           =   10455
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1425
         TabIndex        =   60
         Top             =   2580
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   61
            Top             =   630
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
            TabIndex        =   15
            Top             =   390
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   21
            Top             =   375
            Width           =   510
         End
         Begin VB.Label Label4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   62
            Top             =   375
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4320
         TabIndex        =   47
         Top             =   300
         Width           =   5880
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
               Picture         =   "Frm_ABMProveedores.frx":37BC
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":38CE
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":39E0
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":3AF2
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":3C04
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMProveedores.frx":3D16
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   49
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
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   48
         Top             =   330
         Width           =   2400
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   6060
         Left            =   150
         TabIndex        =   16
         Top             =   765
         Width           =   10095
         _ExtentX        =   17806
         _ExtentY        =   10689
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
         NumItems        =   13
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "cdProveedor"
            Text            =   "Proveedor"
            Object.Width           =   1412
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "nmApellido"
            Text            =   "Apellido "
            Object.Width           =   2999
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nmNombre"
            Text            =   "Nombre"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razón Social"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "nrCUIT"
            Text            =   "CUIT"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nrSocio"
            Text            =   "Nro. Socio"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "dsDomicilio"
            Text            =   "Domicilio"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   8
            Object.Tag             =   "nmLocalidad"
            Text            =   "Localidad"
            Object.Width           =   2470
         EndProperty
         BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   9
            Object.Tag             =   "cdPostal"
            Text            =   "Codigo Postal"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "nrTel"
            Text            =   "Telefono"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Object.Tag             =   "nrFax"
            Text            =   "Fax"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Key             =   "flBloqueado"
            Object.Tag             =   "flBloqueado"
            Text            =   "Bloqueado"
            Object.Width           =   1587
         EndProperty
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   54
         Top             =   90
         Width           =   1755
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   53
         Top             =   105
         Width           =   795
      End
   End
End
Attribute VB_Name = "Frm_ABMProveedores"
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



Private Sub Combox1_Click(Index As Integer)

    Combox1_KeyDown Index, 13, 1

End Sub

Private Sub Combox1_GotFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
                              Me.Combox1(Index), "GotFocus"

End Sub

Private Sub Combox1_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

    If Combox1(Index).Tag = "tpCategoria" Then
        If ObtenerCampo("tpCategoria").Text = "Empresa" Then
             Me.lblLicencia.Visible = False
             ObtenerCampo("nrLicencia").Visible = False
             ObtenerCampo("dsRazonSocial").Visible = True
             ObtenerCampo("nrSocio").Visible = False
             Me.lblnrSocio.Visible = False
             Me.lblRazonSocial.Visible = True
        Else
             ' Si viene Por aca es un licenciatario
             Me.lblRazonSocial.Visible = False
             ObtenerCampo("dsRazonSocial").Visible = False
             ObtenerCampo("nrSocio").Visible = True
             Me.lblnrSocio.Visible = True
             Me.lblLicencia.Visible = True
             ObtenerCampo("nrLicencia").Visible = True
        End If
    End If
    
    
End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

  
    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Proveedores", _
                            Me.Combox1(Index), KeyAscii)
    End If
    
    
  
    
End Sub

Private Sub Combox1_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
                              Me.Combox1(Index), "LostFocus"


End Sub

Private Sub DTPicker1_Change(Index As Integer)

    Select Case Index
    Case 0
        ObtenerCampo("dtAlta") = DTPicker1(Index).value
        ObtenerCampo("dtAlta").SetFocus
    Case 1
        ObtenerCampo("dtBaja") = DTPicker1(Index).value
        ObtenerCampo("dtBaja").SetFocus
    Case 2
        ObtenerCampo("dtFinOrdenanza") = DTPicker1(Index).value
        ObtenerCampo("dtFinOrdenanza").SetFocus
    End Select

    
End Sub









Private Sub Form_Activate()

    ' objGUI.refrescarGrilla Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraBusqProveedores, Me.lstBusqueda
    

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
        If tlb_ABM.Buttons("Buscar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
        End If
        If tlb_ABM.Buttons("Aceptar").Visible Then
            tlb_ABM_ButtonClick tlb_ABM.Buttons("Aceptar")
        End If
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
    SelecionarItemCombo
    cargarcamposdebusqueda
    
    Me.cmbCampos.ListIndex = 1
    
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Proveedores"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Proveedores")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Proveedores")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
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


Private Sub SelecionarItemCombo()
    Dim i As Integer
    
    For i = Combox1.LBound To Combox1.UBound
        If Combox1(i).ListCount > 0 Then
            Combox1(i).ListIndex = 0
        End If
    Next i
    
End Sub


Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqProveedores, Me.lstBusqueda
 
     
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
    
    Screen.ActiveForm.MousePointer = vbHourglass
    ObjTablasIO.nmTabla = "TB_Proveedores"
    ObjTablasIO.setearCampoOperadorValor "cdProveedor", _
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
                            ("TB_Proveedores", Control.Tag, _
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
    Screen.ActiveForm.MousePointer = vbDefault
End Sub



Private Sub lstBusqueda_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        lstBusqueda_DblClick
    End If
End Sub


'Private Sub MaskEdBox1_GotFocus(Index As Integer)
'
'    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
'                              Me.MaskEdBox1(Index), "GotFocus"
'
'
'End Sub



'Private Sub MaskEdBox1_LostFocus(Index As Integer)
'
'     If Left(Me.MaskEdBox1(Index).Tag, 2) = "dt" Then
'        If Not (Me.MaskEdBox1(Index).Text = "__/__/____" Or _
'            Me.MaskEdBox1(Index).Text = "  /  /    ") Then
'            If Not IsDate(Me.MaskEdBox1(Index).Text) Then
'                Me.MaskEdBox1(Index).SelStart = 0
'                Me.MaskEdBox1(Index).SelLength = Len(Me.MaskEdBox1(Index).Text)
'                MsgBox "La fecha ingresada es incorrecta, cambiela o deje vacio este dato", vbCritical + vbDefaultButton1, "Atención"
'                Me.MaskEdBox1(Index).SetFocus
'            End If
'        End If
'     End If
'    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
'                              Me.MaskEdBox1(Index), "LostFocus"
'
'
'End Sub



Private Sub SSTab1_Click(PreviousTab As Integer)
Dim resp As Byte

    
    If SSTab1.Tab = 2 Then
    
        If ObtenerCampo("nrTel").Text <> "" And ObtenerCampo("telchofer1").Text = "" Then
            resp = MsgBox("Desea copiar la información de teléfonos del titular.", vbQuestion + vbYesNo, "Atención")
            If resp = vbNo Then Exit Sub
            ObtenerCampo("telchofer1").Text = ObtenerCampo("nrTel")
            ObtenerCampo("chofer1").Text = ObtenerCampo("nmNombre") + " " + ObtenerCampo("nmApellido")
        End If
        
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
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Proveedores", "cdProveedor", objConfig.nrPuesto)
           ObtenerCampo("cdProveedor").Text = strValor
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
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Proveedores") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub


Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
    
        If ObtenerCampo("nrLicencia").Text <> "" Then
            ObjTablasIO.nmTabla = "TB_Comprobantes"
            ObjTablasIO.setearCampoOperadorValor "nrComprobante", "->", ""
            ObjTablasIO.setearCampoOperadorValor "nrTalonario", "->", ""
            ObjTablasIO.setearCampoOperadorValor "nrLicencia", "=", ObtenerCampo("nrLicencia").Text, " AND "
            ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"

            ObjTablasIO.Seleccionar
            If Not ObjTablasIO.rs_resultados.EOF Then
                MsgBox "Este proveedor o licenciatario posee facturas, imposible eliminarlo.", vbInformation + vbDefaultButton1, "Atención"
                EliminarRegistro = False
                Exit Function
            End If
        End If
        ObjTablasIO.nmTabla = "TB_Proveedores"
        ObjTablasIO.setearCampoOperadorValor "cdProveedor", "=", ObtenerCampo("cdProveedor").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "<-", "1"
        If ObjTablasIO.Actualizar() Then
            MsgBox "Se ha eliminado con exito el registro", vbCritical + vbYesNo, "Atención"
            EliminarRegistro = True
        End If
    End If
    
End Function

Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String
Dim strValor   As String

    If EstadoABM = alta Then
        strValor = objbasededatos.SP_ObtenerMaxcdProveedor()
        objDiccionariodeDatos.GuardarValorCampo _
            "TB_Proveedores", "cdProveedor", _
        objParametros.ObtenerValor("nrPuesto"), strValor
        ObtenerCampo("cdProveedor").Text = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
    End If
    
    ObjTablasIO.nmTabla = "TB_Proveedores"
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
            ObjTablasIO.setearCampoOperadorValor "cdProveedor", _
            "=", ObtenerCampo("cdProveedor").Text
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
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Proveedores", "cdProveedor", objConfig.nrPuesto
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
           Me.fraBusqProveedores.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMProveedores.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.SSTab1.Tab = 0
           Me.txtBusqueda.Tag = ""
           Combox1_KeyDown 1, 13, 1
           objGUI.refrescarGrilla Me.lstBusqueda
    Case "Agregar"
           Me.fraBusqProveedores.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMProveedores.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Agregar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = True
           Me.SSTab1.Tab = 0
           Me.txtBusqueda.Tag = ""
           Combox1_KeyDown 1, 13, 1
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
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.fraABMProveedores.Visible = False
           Me.fraBusqProveedores.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.fraBusqProveedores.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMProveedores.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           objGUI.SizeControls Me, Me.fraBusqProveedores, Me.lstBusqueda
           Me.txtBusqueda.SetFocus
    Case "Cancelar"
           Me.fraBusqProveedores.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMProveedores.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           objGUI.SizeControls Me, Me.fraBusqProveedores, Me.lstBusqueda
           Me.txtBusqueda.SetFocus
    End Select
    
'    On Error Resume Next
'    objGUI.SizeControls Me, Me.fraBusqProveedores, Me.lstBusqueda
'    On Error GoTo 0
'
    ' Me.lstBusqueda.ListItems.Clear


    
End Sub




Private Sub txtBusqueda_GotFocus()

    
    Me.txtBusqueda.Text = Trim(Me.txtBusqueda.Text)
    Me.txtBusqueda.SelStart = Len(Trim(Me.txtBusqueda.Text))
    
    
End Sub

Private Sub txtBusqueda_KeyPress(KeyAscii As Integer)
Dim n As Integer
Dim strBuscada As String
Dim encontrado As Boolean

    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         encontrado = False
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Proveedores"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
         ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0"
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.setearCampoOperadorValor "nrCUIT", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTel", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrFax", "->", ""
         ObjTablasIO.setearCampoOperadorValor "cdPostal", "->", ""
         
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            encontrado = True
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Proveedores"
            ColorearLineasyResaltarFilas
         End If
         '/++++++++++++++++++++++++++++++++
         ObjTablasIO.nmTabla = "TB_Proveedores"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
         ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "1"
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.setearCampoOperadorValor "nrCUIT", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrTel", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nrFax", "->", ""
         ObjTablasIO.setearCampoOperadorValor "cdPostal", "->", ""
         
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Proveedores", Me.lstBusqueda.ListItems.Count + 1
            ColorearLineasyResaltarFilas
            encontrado = True
         End If
         
         If encontrado Then
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
         
    Else
        Select Case Me.cmbCampos.Text
        Case "DNI", "LC", "CI", "CUIT", "CUIL"
        Case Else
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Proveedores", Me.cmbCampos.Text
            Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Proveedores", Me.txtBusqueda, KeyAscii)
        End Select
    End If
    Screen.ActiveForm.MousePointer = vbDefault
    
End Sub



Private Sub ColorearLineasyResaltarFilas()
Dim i As Integer
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        ' marcamos los viajes con factura manual
        If objControl.buscarListviewValorColumnaIndice(Me.lstBusqueda, "flBloqueado", i) = "SI" Then
           Me.lstBusqueda.ListItems(i).ForeColor = Rojo
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = "Proveedor bloqueado"
            Next
        
        End If
        
    Next i
    
    objGUI.refrescarGrilla Me.lstBusqueda

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer


    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Proveedores", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub




Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Proveedores", _
                              Me.txtFields(Index), "LostFocus"
                              
    Select Case Me.txtFields(Index).Tag
    Case "dtAlta", "dtBaja", "dtFinOrdenanza"
        If Me.txtFields(Index).Text <> "" Then
            If Not IsDate(Me.txtFields(Index).Text) Then
                MsgBox "La fecha no es válida.", vbInformation + vbDefaultButton1, "Atención"
                Me.txtFields(Index).SetFocus
            End If
        End If
    End Select
End Sub

