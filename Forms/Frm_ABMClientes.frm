VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_ABMClientes 
   Caption         =   "Maestro de Clientes"
   ClientHeight    =   7170
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8910
   ClipControls    =   0   'False
   Icon            =   "Frm_ABMClientes.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7170
   ScaleWidth      =   8910
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8910
      _ExtentX        =   15716
      _ExtentY        =   1164
      ButtonWidth     =   2566
      ButtonHeight    =   1111
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgABMClientes"
      HotImageList    =   "imgABMClientesResaltado"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Buscar(F2)"
            Key             =   "Buscar"
            Object.ToolTipText     =   "Buscar un cliente"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Seleccionar(F3)"
            Key             =   "Seleccionar"
            Object.ToolTipText     =   "Seleccionar el cliente deseado"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Agregar(F4)"
            Key             =   "Agregar"
            Object.ToolTipText     =   "Agregar un nuevo cliente"
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
      MouseIcon       =   "Frm_ABMClientes.frx":030A
      Begin MSComctlLib.ImageList imgABMClientesResaltado 
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
               Picture         =   "Frm_ABMClientes.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":1786
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgABMClientes 
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
               Picture         =   "Frm_ABMClientes.frx":1BDA
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":1CF2
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":1E46
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":1F5E
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":206A
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":21BE
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":22C6
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":2942
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":2AA2
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":2EF6
               Key             =   "Salir"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraABMClientes 
      BorderStyle     =   0  'None
      Height          =   6540
      Left            =   0
      TabIndex        =   1
      Top             =   630
      Width           =   8820
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "dsRazonSocial"
         Height          =   285
         Index           =   4
         Left            =   3060
         TabIndex        =   6
         Tag             =   "dsRazonSocial"
         Top             =   375
         Width           =   3375
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         DataField       =   "cdCliente"
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   0
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   5
         TabStop         =   0   'False
         Tag             =   "cdCliente"
         Top             =   390
         Width           =   1095
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmApellido"
         Height          =   300
         Index           =   3
         Left            =   2370
         TabIndex        =   4
         Tag             =   "nmApellido"
         Top             =   1020
         Width           =   4050
      End
      Begin VB.TextBox txtFields 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   2
         Left            =   240
         TabIndex        =   3
         Tag             =   "nmNombre"
         Top             =   1035
         Width           =   2085
      End
      Begin VB.ComboBox Combox1 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Index           =   1
         ItemData        =   "Frm_ABMClientes.frx":334A
         Left            =   1710
         List            =   "Frm_ABMClientes.frx":3354
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "tpCliente"
         Top             =   360
         Width           =   1230
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   4755
         Left            =   285
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   1455
         Width           =   7830
         _ExtentX        =   13811
         _ExtentY        =   8387
         _Version        =   393216
         Style           =   1
         Tabs            =   2
         Tab             =   1
         TabsPerRow      =   2
         TabHeight       =   520
         ForeColor       =   -2147483630
         TabCaption(0)   =   "Datos &Personales"
         TabPicture(0)   =   "Frm_ABMClientes.frx":336D
         Tab(0).ControlEnabled=   0   'False
         Tab(0).Control(0)=   "lblLabels(16)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "lblLabels(15)"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "lblLabels(5)"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "lblLabels(6)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "lblLabels(7)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "lblLabels(8)"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "lblLabels(9)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "lblLabels(10)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "lblLabels(11)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "lblLabels(12)"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).Control(10)=   "lblLabels(13)"
         Tab(0).Control(10).Enabled=   0   'False
         Tab(0).Control(11)=   "DTPicker1(1)"
         Tab(0).Control(11).Enabled=   0   'False
         Tab(0).Control(12)=   "DTPicker1(0)"
         Tab(0).Control(12).Enabled=   0   'False
         Tab(0).Control(13)=   "txtFields(14)"
         Tab(0).Control(13).Enabled=   0   'False
         Tab(0).Control(14)=   "txtFields(13)"
         Tab(0).Control(14).Enabled=   0   'False
         Tab(0).Control(15)=   "txtFields(9)"
         Tab(0).Control(15).Enabled=   0   'False
         Tab(0).Control(16)=   "Combox1(0)"
         Tab(0).Control(16).Enabled=   0   'False
         Tab(0).Control(17)=   "txtFields(5)"
         Tab(0).Control(17).Enabled=   0   'False
         Tab(0).Control(18)=   "txtFields(6)"
         Tab(0).Control(18).Enabled=   0   'False
         Tab(0).Control(19)=   "txtFields(7)"
         Tab(0).Control(19).Enabled=   0   'False
         Tab(0).Control(20)=   "txtFields(10)"
         Tab(0).Control(20).Enabled=   0   'False
         Tab(0).Control(21)=   "txtFields(11)"
         Tab(0).Control(21).Enabled=   0   'False
         Tab(0).Control(22)=   "txtFields(1)"
         Tab(0).Control(22).Enabled=   0   'False
         Tab(0).Control(23)=   "txtFields(8)"
         Tab(0).Control(23).Enabled=   0   'False
         Tab(0).ControlCount=   24
         TabCaption(1)   =   "Datos &Comerciales"
         TabPicture(1)   =   "Frm_ABMClientes.frx":363F
         Tab(1).ControlEnabled=   -1  'True
         Tab(1).Control(0)=   "lblLabels(2)"
         Tab(1).Control(0).Enabled=   0   'False
         Tab(1).Control(1)=   "lblLabels(20)"
         Tab(1).Control(1).Enabled=   0   'False
         Tab(1).Control(2)=   "lblLabels(24)"
         Tab(1).Control(2).Enabled=   0   'False
         Tab(1).Control(3)=   "lblLabels(14)"
         Tab(1).Control(3).Enabled=   0   'False
         Tab(1).Control(4)=   "lblLabels(17)"
         Tab(1).Control(4).Enabled=   0   'False
         Tab(1).Control(5)=   "lblLabels(21)"
         Tab(1).Control(5).Enabled=   0   'False
         Tab(1).Control(6)=   "lblLabels(22)"
         Tab(1).Control(6).Enabled=   0   'False
         Tab(1).Control(7)=   "lblLabels(23)"
         Tab(1).Control(7).Enabled=   0   'False
         Tab(1).Control(8)=   "lblLabels(25)"
         Tab(1).Control(8).Enabled=   0   'False
         Tab(1).Control(9)=   "lblLabels(18)"
         Tab(1).Control(9).Enabled=   0   'False
         Tab(1).Control(10)=   "DTPicker1(2)"
         Tab(1).Control(10).Enabled=   0   'False
         Tab(1).Control(11)=   "txtFields(16)"
         Tab(1).Control(11).Enabled=   0   'False
         Tab(1).Control(12)=   "Combox1(3)"
         Tab(1).Control(12).Enabled=   0   'False
         Tab(1).Control(13)=   "Combox1(2)"
         Tab(1).Control(13).Enabled=   0   'False
         Tab(1).Control(14)=   "txtFields(15)"
         Tab(1).Control(14).Enabled=   0   'False
         Tab(1).Control(15)=   "txtFields(17)"
         Tab(1).Control(15).Enabled=   0   'False
         Tab(1).Control(16)=   "chkFields(25)"
         Tab(1).Control(16).Enabled=   0   'False
         Tab(1).Control(17)=   "txtFields(24)"
         Tab(1).Control(17).Enabled=   0   'False
         Tab(1).Control(18)=   "txtFields(25)"
         Tab(1).Control(18).Enabled=   0   'False
         Tab(1).Control(19)=   "txtFields(12)"
         Tab(1).Control(19).Enabled=   0   'False
         Tab(1).Control(20)=   "txtFields(23)"
         Tab(1).Control(20).Enabled=   0   'False
         Tab(1).ControlCount=   21
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty DataFormat 
               Type            =   1
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   3082
               SubFormatType   =   1
            EndProperty
            Height          =   285
            Index           =   23
            Left            =   540
            TabIndex        =   45
            Tag             =   "vlTopeCredito"
            Top             =   2685
            Width           =   1245
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   300
            Index           =   8
            Left            =   -71685
            TabIndex        =   44
            Tag             =   "nrFax"
            Top             =   2595
            Width           =   3045
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Index           =   1
            Left            =   -74760
            TabIndex        =   43
            Tag             =   "nrTel"
            Top             =   2610
            Width           =   2955
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "vlOrdenanza3337"
            Height          =   315
            Index           =   12
            Left            =   555
            TabIndex        =   42
            Tag             =   "vlOrdenanza3337"
            Top             =   1965
            Width           =   1530
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsEmail"
            Height          =   285
            Index           =   11
            Left            =   -71715
            TabIndex        =   41
            Tag             =   "dsEmail"
            Top             =   3330
            Width           =   3510
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   285
            Index           =   10
            Left            =   -74745
            TabIndex        =   40
            Tag             =   "dsCargo"
            Top             =   3315
            Width           =   2940
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   285
            Index           =   7
            Left            =   -74745
            TabIndex        =   39
            Tag             =   "nmLocalidad"
            Top             =   1965
            Width           =   3375
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "cdPostal"
            Height          =   285
            Index           =   6
            Left            =   -71235
            TabIndex        =   38
            Tag             =   "cdPostal"
            Top             =   1260
            Width           =   1020
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsDomicilio"
            Height          =   285
            Index           =   5
            Left            =   -74760
            TabIndex        =   37
            Tag             =   "dsDomicilio"
            Top             =   1260
            Width           =   3375
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "vlSaldo"
            Height          =   285
            Index           =   25
            Left            =   555
            Locked          =   -1  'True
            TabIndex        =   36
            TabStop         =   0   'False
            Tag             =   "vlSaldo"
            Top             =   4035
            Width           =   1275
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpEstado"
            Height          =   285
            Index           =   24
            Left            =   555
            TabIndex        =   35
            Tag             =   "tpEstado"
            Top             =   3405
            Width           =   2175
         End
         Begin VB.CheckBox chkFields 
            Appearance      =   0  'Flat
            BackColor       =   &H80000000&
            DataField       =   "flBloqueado"
            ForeColor       =   &H80000008&
            Height          =   285
            Index           =   25
            Left            =   3345
            TabIndex        =   34
            Tag             =   "flBloqueado"
            Top             =   3435
            Width           =   285
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpIIBB"
            Height          =   285
            Index           =   17
            Left            =   1905
            TabIndex        =   33
            Tag             =   "tpIIBB"
            Top             =   1350
            Width           =   840
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "tpDoc"
            Height          =   285
            Index           =   15
            Left            =   2925
            TabIndex        =   32
            Tag             =   "nrIIBB"
            Top             =   1365
            Width           =   1440
         End
         Begin VB.ComboBox Combox1 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   315
            Index           =   2
            ItemData        =   "Frm_ABMClientes.frx":379D
            Left            =   525
            List            =   "Frm_ABMClientes.frx":37B3
            Style           =   2  'Dropdown List
            TabIndex        =   31
            TabStop         =   0   'False
            Tag             =   "tpIVA"
            Top             =   1335
            Width           =   1230
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            DataField       =   "tpDoc"
            Height          =   315
            Index           =   0
            ItemData        =   "Frm_ABMClientes.frx":37CF
            Left            =   -74745
            List            =   "Frm_ABMClientes.frx":37DF
            Style           =   2  'Dropdown List
            TabIndex        =   30
            Tag             =   "tpDoc"
            Top             =   555
            Width           =   1080
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Height          =   315
            Index           =   9
            Left            =   -73395
            TabIndex        =   29
            Tag             =   "nrDoc"
            Top             =   555
            Width           =   2190
         End
         Begin VB.ComboBox Combox1 
            BackColor       =   &H00E0E0E0&
            DataField       =   "tpDoc"
            Height          =   315
            Index           =   3
            ItemData        =   "Frm_ABMClientes.frx":37F8
            Left            =   525
            List            =   "Frm_ABMClientes.frx":3802
            Style           =   2  'Dropdown List
            TabIndex        =   28
            Tag             =   "tpFormadePago"
            Top             =   630
            Width           =   2295
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   300
            Index           =   13
            Left            =   -74730
            TabIndex        =   27
            Tag             =   "dtAlta"
            Top             =   3975
            Width           =   1245
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   300
            Index           =   14
            Left            =   -73065
            TabIndex        =   26
            Tag             =   "dtBaja"
            Top             =   3990
            Width           =   1245
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            DataField       =   "dsCargo"
            Height          =   300
            Index           =   16
            Left            =   2190
            TabIndex        =   25
            Tag             =   "dtFinOrdenanza"
            Top             =   1980
            Width           =   1245
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   330
            Index           =   0
            Left            =   -73500
            TabIndex        =   46
            TabStop         =   0   'False
            Top             =   3960
            Width           =   270
            _ExtentX        =   476
            _ExtentY        =   582
            _Version        =   393216
            Format          =   111935489
            CurrentDate     =   38267
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   345
            Index           =   1
            Left            =   -71835
            TabIndex        =   47
            TabStop         =   0   'False
            Top             =   3975
            Width           =   270
            _ExtentX        =   476
            _ExtentY        =   609
            _Version        =   393216
            Format          =   111935489
            CurrentDate     =   38267
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   345
            Index           =   2
            Left            =   3405
            TabIndex        =   48
            TabStop         =   0   'False
            Top             =   1800
            Width           =   330
            _ExtentX        =   582
            _ExtentY        =   609
            _Version        =   393216
            Format          =   111935489
            CurrentDate     =   38267
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
            Left            =   2910
            TabIndex        =   69
            Top             =   1140
            Width           =   1485
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
            Left            =   -73050
            TabIndex        =   68
            Top             =   3750
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
            Left            =   -74730
            TabIndex        =   67
            Top             =   3735
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
            Left            =   -71760
            TabIndex        =   66
            Top             =   3105
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
            Left            =   -74760
            TabIndex        =   65
            Top             =   3090
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
            Left            =   -71700
            TabIndex        =   64
            Top             =   2355
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
            Left            =   -74775
            TabIndex        =   63
            Top             =   2385
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
            Left            =   -74745
            TabIndex        =   62
            Top             =   1710
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
            Left            =   -71250
            TabIndex        =   61
            Top             =   1020
            Width           =   1020
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
            Left            =   -74760
            TabIndex        =   60
            Top             =   1020
            Width           =   1815
         End
         Begin VB.Label lblLabels 
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
            Height          =   255
            Index           =   25
            Left            =   555
            TabIndex        =   59
            Top             =   3825
            Width           =   525
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
            Left            =   525
            TabIndex        =   58
            Top             =   3180
            Width           =   1815
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
            Left            =   3030
            TabIndex        =   57
            Top             =   3120
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
            Left            =   2235
            TabIndex        =   56
            Top             =   1740
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
            Left            =   1935
            TabIndex        =   55
            Top             =   1110
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
            Left            =   540
            TabIndex        =   54
            Top             =   1110
            Width           =   645
         End
         Begin VB.Label lblLabels 
            Caption         =   "Tope de Crédito:"
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
            Index           =   24
            Left            =   525
            TabIndex        =   53
            Top             =   2475
            Width           =   1815
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
            Left            =   540
            TabIndex        =   52
            Top             =   1740
            Width           =   1455
         End
         Begin VB.Label lblLabels 
            Caption         =   "Tipo de Doc."
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
            Index           =   15
            Left            =   -74775
            TabIndex        =   51
            Top             =   300
            Width           =   1155
         End
         Begin VB.Label lblLabels 
            Caption         =   "Documento"
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
            Left            =   -73395
            TabIndex        =   50
            Top             =   300
            Width           =   1815
         End
         Begin VB.Label lblLabels 
            Caption         =   "Forma de Pago"
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
            Left            =   555
            TabIndex        =   49
            Top             =   345
            Width           =   2115
         End
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
         Left            =   3075
         TabIndex        =   11
         Top             =   165
         Width           =   1815
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
         Left            =   1740
         TabIndex        =   10
         Top             =   150
         Width           =   975
      End
      Begin VB.Label lblLabels 
         Caption         =   "Nro. de Cliente"
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
         TabIndex        =   9
         Top             =   150
         Width           =   1440
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
         TabIndex        =   8
         Top             =   810
         Width           =   870
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
         TabIndex        =   7
         Top             =   825
         Width           =   870
      End
   End
   Begin VB.Frame fraBusqClientes 
      BorderStyle     =   0  'None
      Height          =   6420
      Left            =   0
      TabIndex        =   12
      Top             =   630
      Width           =   8820
      Begin VB.ComboBox cmbCampos 
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   150
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   330
         Width           =   2400
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4305
         TabIndex        =   18
         Top             =   315
         Width           =   4470
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   1395
         TabIndex        =   13
         Top             =   2250
         Visible         =   0   'False
         Width           =   5340
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   14
            Top             =   615
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
            TabIndex        =   17
            Top             =   375
            Width           =   855
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   16
            Top             =   375
            Width           =   510
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
               Picture         =   "Frm_ABMClientes.frx":3821
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":3933
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":3A45
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":3B57
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":3C69
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ABMClientes.frx":3D7B
               Key             =   "Menor"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo ImageCombo1 
         Height          =   330
         Left            =   2565
         TabIndex        =   19
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
         Height          =   5460
         Left            =   120
         TabIndex        =   20
         Top             =   750
         Width           =   8655
         _ExtentX        =   15266
         _ExtentY        =   9631
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
         NumItems        =   8
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "cdCliente"
            Text            =   "Cliente"
            Object.Width           =   1412
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "nmApellido"
            Text            =   "Apellido "
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "nmNombre"
            Text            =   "Nombre"
            Object.Width           =   2822
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dsRazonSocial"
            Text            =   "Razón Social"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Object.Tag             =   "nrDoc"
            Text            =   "Doc. Nro."
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Object.Tag             =   "dsDomicilio"
            Text            =   "Domicilio"
            Object.Width           =   4057
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Object.Tag             =   "nmLocalidad"
            Text            =   "Localidad"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Object.Tag             =   "flBloqueado"
            Text            =   "Bloqueado"
            Object.Width           =   1517
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "Campo"
         Height          =   210
         Left            =   165
         TabIndex        =   23
         Top             =   105
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   "Valor para la busqueda"
         Height          =   210
         Left            =   4305
         TabIndex        =   22
         Top             =   90
         Width           =   1755
      End
   End
End
Attribute VB_Name = "Frm_ABMClientes"
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
        
    ObtenerCampo("tpFormadePago").ListIndex = 0
    
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

    If Combox1(Index).Tag = "tpCliente" Then
        If ObtenerCampo("tpCliente").Text = "Empresa" Then
             Me.lblRazonSocial.Visible = True
             ObtenerCampo("dsRazonSocial").Visible = True
             ObtenerCampo("tpDoc").Text = "CUIT"
        Else
             Me.lblRazonSocial.Visible = False
             ObtenerCampo("dsRazonSocial").Visible = False
             ObtenerCampo("tpDoc").Text = "DNI"
        End If
    End If
    
End Sub

Private Sub Combox1_GotFocus(Index As Integer)

    objDiccionariodeDatos.FormatearCampoControl "TB_Clientes", _
                              Me.Combox1(Index), "GotFocus"

End Sub

Private Sub Combox1_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

    If Combox1(Index).Tag = "tpCliente" Then
        If ObtenerCampo("tpCliente").Text = "Empresa" Then
             Me.lblRazonSocial.Visible = True
             ObtenerCampo("dsRazonSocial").Visible = True
        Else
                
             Me.lblRazonSocial.Visible = False
             ObtenerCampo("dsRazonSocial").Visible = False
        End If
    End If
    
    
End Sub

Private Sub Combox1_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer


    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Clientes", _
                            Me.Combox1(Index), KeyAscii)
    End If
    
    
  
    
End Sub

Private Sub Combox1_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Clientes", _
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

    objGUI.SizeControls Me, Me.fraBusqClientes, Me.lstBusqueda
    
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
    SelecionarItemCombo
    cargarcamposdebusqueda
    Me.cmbCampos.ListIndex = 0
    
    tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
End Sub

' Eulises: Nueva Funcion
Private Sub cargarcamposdebusqueda()
Dim n As Integer

    objDiccionariodeDatos.ObtenerlosCamposdeBusquedadeunaTabla "TB_Clientes"
    n = 1
    Do Until objDiccionariodeDatos.FindeCampos("TB_Clientes")
        Me.cmbCampos.AddItem objDiccionariodeDatos.nmCampoExterno
        n = n + 1
        objDiccionariodeDatos.ObtenerSiguienteCampo ("TB_Clientes")
    Loop
    Me.cmbCampos.ListIndex = 1

End Sub


Private Sub CargarOperadoresAritmeticos()

  Me.ImageCombo1.ComboItems.Clear
  Select Case Me.cmbCampos.Text
  Case "DNI", "LC", "CI", "CUIT", "CUIL"
          Me.ImageCombo1.ComboItems.Add 1, "Similar", "Similar", "Similar", "Similar"
  Case Else
    objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
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
            Combox1(i).ListIndex = 1
        End If
    Next i
    
End Sub


Private Sub Form_Resize()

    objGUI.SizeControls Me, Me.fraBusqClientes, Me.lstBusqueda

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
    
    ObjTablasIO.nmTabla = "TB_Clientes"
    ObjTablasIO.setearCampoOperadorValor "cdCliente", _
    "=", Me.lstBusqueda.SelectedItem.Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    limpiarControles
    
    
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
                            ("TB_Clientes", Control.Tag, _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados(Control.Tag), "")))
                            
                    If Control.Tag = "tpIVA" And Valor = "" Then
                        ObtenerCampo("tpIVA").ListIndex = -1
                    Else
                        Control.Text = Valor
                        If Err Then
                            Control.value = AdaptarTrueFalse(Control, Valor)
                        End If
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
'    objDiccionariodeDatos.FormatearCampoControl "TB_Clientes", _
'                              Me.MaskEdBox1(Index), "LostFocus"
'
'
'End Sub



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
           strValor = objDiccionariodeDatos.ObtenerSiguienteValor("TB_Clientes", "cdCliente", objConfig.nrPuesto)
           ObtenerCampo("cdCliente").Text = strValor
           PresentarPantalla Button
    Case "Eliminar"
           ' Se debe Consultar si el cliente posee facuta si posee no podra
           ' eliminar fisicamente
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
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Clientes") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
    
End Sub

Private Function EliminarRegistro() As Boolean
Dim resp As Byte

    EliminarRegistro = False
    resp = MsgBox("Esta seguro que desea eliminar el registro", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
    
        ObjTablasIO.nmTabla = "TB_Comprobantes"
        ObjTablasIO.setearCampoOperadorValor "nrComprobante", "->", ""
        ObjTablasIO.setearCampoOperadorValor "nrTalonario", "->", ""
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdcliente").Text, " AND "
        ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
        
        ObjTablasIO.Seleccionar
        If Not ObjTablasIO.rs_resultados.EOF Then
            MsgBox "Este cliente posee facturas, imposible eliminarlo.", vbInformation + vbDefaultButton1, "Atención"
            EliminarRegistro = False
            Exit Function
        End If
        
        ' Pendiente Controlar antes de eliminar
        ObjTablasIO.nmTabla = "TB_Clientes"
        ObjTablasIO.setearCampoOperadorValor "cdCliente", "=", ObtenerCampo("cdcliente").Text
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
        strValor = objbasededatos.SP_ObtenerMaxcdCliente()
            objDiccionariodeDatos.GuardarValorCampo _
                "TB_Clientes", "cdCliente", objParametros.ObtenerValor("nrPuesto"), strValor
        ObtenerCampo("cdCliente").Text = ReemplazarPalabra(FormatNumber(CDbl(strValor) + 1, 0), ".", "")
    End If
    
    ObjTablasIO.nmTabla = "TB_Clientes"
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
            ObjTablasIO.setearCampoOperadorValor "cdCliente", _
            "=", ObtenerCampo("cdCliente").Text
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
                objDiccionariodeDatos.GuardarSiguienteValor "TB_Clientes", "cdCliente", objConfig.nrPuesto
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
           Me.fraBusqClientes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMClientes.Visible = True
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
           If ObtenerCampo("tpCliente").Text = "Empresa" Then
                Me.lblRazonSocial.Visible = True
                ObtenerCampo("dsRazonSocial").Visible = True
                ObtenerCampo("dsRazonSocial").SetFocus
           Else
                Me.lblRazonSocial.Visible = False
                ObtenerCampo("dsRazonSocial").Visible = False
                ObtenerCampo("nmNombre").SetFocus
           End If
    Case "Agregar"
           Me.fraBusqClientes.Visible = False
           Me.lstBusqueda.Visible = False
           Me.fraABMClientes.Visible = True
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
           ObtenerCampo("tpCliente").Text = "Particular"
           ObtenerCampo("nmNombre").SetFocus
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
           Me.fraABMClientes.Visible = False
           Me.fraBusqClientes.Visible = True
           Me.lstBusqueda.Visible = True
           On Error Resume Next
           Me.txtBusqueda.SetFocus
           On Error GoTo 0
    Case "Aceptar"
           Me.fraBusqClientes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMClientes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.txtBusqueda.SetFocus
    Case "Cancelar"
           Me.fraBusqClientes.Visible = True
           Me.lstBusqueda.Visible = True
           Me.fraABMClientes.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Agregar").Visible = True
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
Dim encontrado As Boolean



    If vbKeyReturn = KeyAscii Then
        Me.lstBusqueda.ListItems.Clear
         If Me.txtBusqueda.Text = "" Then
            Me.txtBusqueda.Text = "*"
         End If
         encontrado = False
         Screen.ActiveForm.MousePointer = vbHourglass
         strBuscada = Trim(Me.txtBusqueda.Text)
         ObjTablasIO.nmTabla = "TB_Clientes"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
         ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "0"
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Clientes"
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            ColorearLineasyResaltarFilas
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            encontrado = True
         End If
         
         '/*********************************************/
         ObjTablasIO.nmTabla = "TB_Clientes"
         objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         If strBuscada <> "*" Then
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
            ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
            ObtenerOperadorAritmetico() + "", strBuscada, " AND ", "ASC"
         End If
         ObjTablasIO.setearCampoOperadorValor "flBloqueado", "=", "1"
         For n = 0 To Me.cmbCampos.ListCount - 1
                objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.List(n)
                ObjTablasIO.setearCampoOperadorValor objDiccionariodeDatos.nmCampo, _
                "->", ""
         Next
         ObjTablasIO.setearCampoOperadorValor "nrDoc", "->", ""
         ObjTablasIO.setearCampoOperadorValor "dsDomicilio", "->", ""
         ObjTablasIO.setearCampoOperadorValor "nmLocalidad", "->", ""
         ObjTablasIO.Seleccionar
         If Not ObjTablasIO.rs_resultados.EOF Then
            encontrado = True
            objControl.CargarListView_SG ObjTablasIO.rs_resultados, Me.lstBusqueda, 0, "TB_Clientes", Me.lstBusqueda.ListItems.Count + 1
            ' objControl.CargarListView ObjTablasIO.rs_resultados, Me.lstBusqueda, 0
            ColorearLineasyResaltarFilas
         End If
        
         If encontrado Then
            Me.lstBusqueda.ListItems.Item(1).Selected = True
            On Error Resume Next
            Me.lstBusqueda.SetFocus
            On Error GoTo 0
         Else
            MsgBox "No existe datos para la selección.", vbInformation, "Atención"
         End If
         '/*********************************************/
    Else
        Select Case Me.cmbCampos.Text
        Case "DNI", "LC", "CI", "CUIT", "CUIL"
        Case Else
            objDiccionariodeDatos.ObtenerNombredeCampoFisico "TB_Clientes", Me.cmbCampos.Text
            Me.txtBusqueda.Tag = objDiccionariodeDatos.nmCampo
            KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Clientes", Me.txtBusqueda, KeyAscii)
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
        If Me.lstBusqueda.ListItems(i).SubItems(7) = "SI" Then
           Me.lstBusqueda.ListItems(i).ForeColor = Rojo
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Rojo
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = "Cliente bloqueado"
            Next
        
        End If
        
    Next i

End Sub

Private Sub txtFields_GotFocus(Index As Integer)
    
    
    DoEvents
    objDiccionariodeDatos.FormatearCampoControl "TB_Clientes", _
                              Me.txtFields(Index), "GotFocus"



End Sub


Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)


    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Clientes", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    objDiccionariodeDatos.FormatearCampoControl "TB_Clientes", _
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
