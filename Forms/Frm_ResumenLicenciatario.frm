VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.OCX"
Begin VB.Form frm_ResumenLicenciatario 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   Caption         =   "Resumenes Licenciatarios"
   ClientHeight    =   7335
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12000
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   Icon            =   "Frm_ResumenLicenciatario.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7335
   ScaleWidth      =   12000
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar tlb_ABM 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12000
      _ExtentX        =   21167
      _ExtentY        =   1111
      ButtonWidth     =   2328
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgResumenLicenciatarios"
      DisabledImageList=   "imgResumenLicenciatarios"
      HotImageList    =   "imgResumenLicenciatarios"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
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
            Caption         =   "Resumen"
            Key             =   "Resumen"
            ImageKey        =   "Resumen"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Raya"
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "&Salir (ESC)"
            Key             =   "Salir"
            ImageKey        =   "Salir"
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
      MouseIcon       =   "Frm_ResumenLicenciatario.frx":030A
      Begin MSComctlLib.ImageList imgResumenLicenciatariosResaltado 
         Left            =   1770
         Top             =   945
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   12
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":046C
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":0588
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":06DC
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":07EC
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":08EE
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":0A42
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":0B4E
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":11CA
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":1332
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":1786
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":1BDA
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":2254
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageList imgResumenLicenciatarios 
         Left            =   9330
         Top             =   0
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   20
         ImageHeight     =   20
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   12
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":2366
               Key             =   "Buscar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":247E
               Key             =   "Seleccionar"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":25D2
               Key             =   "Agregar"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":26EA
               Key             =   "Aceptar"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":27F6
               Key             =   "Cancelar"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":294A
               Key             =   "Eliminar"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":2A52
               Key             =   "Nuevo"
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":30CE
               Key             =   "Linterna3"
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":322E
               Key             =   "Exportar"
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":3682
               Key             =   "Salir"
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":3AD6
               Key             =   "Imprimir"
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":4150
               Key             =   "Resumen"
            EndProperty
         EndProperty
      End
   End
   Begin VB.Frame fraBusqCajas 
      BorderStyle     =   0  'None
      Height          =   10200
      Left            =   75
      TabIndex        =   19
      Top             =   705
      Width           =   20205
      Begin MSComctlLib.ListView lstExcelIVA 
         Height          =   2400
         Left            =   405
         TabIndex        =   57
         Top             =   5565
         Visible         =   0   'False
         Width           =   12975
         _ExtentX        =   22886
         _ExtentY        =   4233
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         MultiSelect     =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "dtCupon"
            Text            =   "Fecha"
            Object.Width           =   3351
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dsDestino"
            Text            =   "Destino"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "vlMontoCupon"
            Text            =   "Monto"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "tpComprobanteCliente"
            Object.Tag             =   "tpComprobanteCliente"
            Text            =   "Letra"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "nrTalonarioCliente"
            Object.Tag             =   "nrTalonarioCliente"
            Text            =   "Serie"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "nrComprabanteCliente"
            Object.Tag             =   "nrComprabanteCliente"
            Text            =   "Número"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Key             =   "vlIVA"
            Object.Tag             =   "vlIVA"
            Text            =   "IVA"
            Object.Width           =   2540
         EndProperty
      End
      Begin VB.OptionButton OptionSeleccionViajes 
         Caption         =   "Viajes con iva"
         Height          =   390
         Index           =   3
         Left            =   10950
         TabIndex        =   56
         Top             =   165
         Width           =   3540
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   0
         Left            =   5310
         TabIndex        =   47
         Tag             =   "vlMontoCupon"
         Text            =   "0"
         ToolTipText     =   "Ingrese una Licencia"
         Top             =   570
         Width           =   1470
      End
      Begin VB.CommandButton cmdBuscar 
         Height          =   375
         Left            =   4755
         Picture         =   "Frm_ResumenLicenciatario.frx":4262
         Style           =   1  'Graphical
         TabIndex        =   36
         Top             =   1170
         Width           =   375
      End
      Begin VB.Frame Frame1 
         Caption         =   "Fecha del viaje"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   780
         Left            =   45
         TabIndex        =   31
         Top             =   900
         Width           =   4635
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   360
            Index           =   0
            Left            =   690
            TabIndex        =   32
            Tag             =   "dtDesde"
            Top             =   300
            Width           =   1575
            _ExtentX        =   2778
            _ExtentY        =   635
            _Version        =   393216
            Format          =   116457473
            CurrentDate     =   38267
         End
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   345
            Index           =   1
            Left            =   2805
            TabIndex        =   33
            Tag             =   "dtHasta"
            Top             =   285
            Width           =   1695
            _ExtentX        =   2990
            _ExtentY        =   609
            _Version        =   393216
            Format          =   116457473
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
            Index           =   9
            Left            =   2295
            TabIndex        =   35
            Top             =   360
            Width           =   600
         End
         Begin VB.Label lblLabels 
            Caption         =   "Desde"
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
            Left            =   90
            TabIndex        =   34
            Top             =   345
            Width           =   810
         End
      End
      Begin VB.Frame fra_ProgressBar 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Exportando los datos ....."
         ForeColor       =   &H80000008&
         Height          =   1650
         Left            =   2790
         TabIndex        =   26
         Top             =   3030
         Visible         =   0   'False
         Width           =   5250
         Begin VB.CommandButton cmdCancelar 
            Caption         =   "&Cancelar"
            Height          =   420
            Left            =   2100
            TabIndex        =   37
            Top             =   1110
            Width           =   1065
         End
         Begin MSComctlLib.ProgressBar ProgressBar 
            Height          =   480
            Left            =   315
            TabIndex        =   27
            Top             =   570
            Width           =   4575
            _ExtentX        =   8070
            _ExtentY        =   847
            _Version        =   393216
            Appearance      =   0
         End
         Begin VB.Label Label2 
            BackColor       =   &H80000005&
            Caption         =   "100 %"
            Height          =   240
            Left            =   4380
            TabIndex        =   30
            Top             =   345
            Width           =   510
         End
         Begin VB.Label lblvlPorcentaje 
            BackColor       =   &H00FFFFFF&
            Caption         =   "10 %"
            Height          =   255
            Left            =   1155
            TabIndex        =   29
            Top             =   330
            Width           =   510
         End
         Begin VB.Label Label1 
            BackColor       =   &H80000005&
            Caption         =   "Porcentaje "
            Height          =   255
            Left            =   315
            TabIndex        =   28
            Top             =   330
            Width           =   855
         End
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         CausesValidation=   0   'False
         DataField       =   "nmNombre"
         Height          =   285
         Index           =   1
         Left            =   45
         TabIndex        =   1
         Tag             =   "nrLicencia"
         ToolTipText     =   "Ingrese una Licencia"
         Top             =   570
         Width           =   915
      End
      Begin VB.TextBox txtBusqueda 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   285
         Index           =   19
         Left            =   915
         Locked          =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         TabStop         =   0   'False
         Tag             =   "nmLicenciatario"
         Top             =   570
         Width           =   4425
      End
      Begin VB.OptionButton OptionSeleccionViajes 
         Caption         =   "Todos los viajes pagados al Licenciatario"
         Height          =   390
         Index           =   0
         Left            =   7395
         TabIndex        =   2
         Top             =   120
         Width           =   3540
      End
      Begin MSComctlLib.ImageList ImgOperadores 
         Left            =   4710
         Top             =   -45
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
               Picture         =   "Frm_ResumenLicenciatario.frx":4364
               Key             =   "Similar"
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":4476
               Key             =   "Igual"
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":4588
               Key             =   "MayoroIgual"
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":469A
               Key             =   "Mayor"
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":47AC
               Key             =   "MenoroIgual"
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":48BE
               Key             =   "Menor"
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "Frm_ResumenLicenciatario.frx":49D0
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.Frame Frame2 
         Caption         =   "Falta Compensar"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   630
         Left            =   5190
         TabIndex        =   38
         Top             =   1065
         Width           =   8445
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
            TabIndex        =   55
            Top             =   300
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
            Left            =   2640
            TabIndex        =   54
            Top             =   225
            Width           =   780
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
            Left            =   4950
            TabIndex        =   51
            Top             =   240
            Width           =   3255
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
            Left            =   4320
            TabIndex        =   50
            Top             =   270
            Width           =   615
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
            Left            =   3585
            TabIndex        =   44
            Top             =   225
            Width           =   705
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
            Left            =   1500
            TabIndex        =   43
            Top             =   240
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
            Height          =   315
            Left            =   180
            TabIndex        =   42
            Top             =   225
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
            Left            =   3435
            TabIndex        =   41
            Top             =   285
            Width           =   270
         End
         Begin VB.Label Label4 
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
            Left            =   1125
            TabIndex        =   40
            Top             =   285
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
            TabIndex        =   39
            Top             =   285
            Width           =   165
         End
      End
      Begin VB.CheckBox chkTodosLosLicenciatarios 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Todos los Licenciatarios "
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   105
         TabIndex        =   4
         Top             =   15
         Width           =   5415
      End
      Begin VB.OptionButton OptionSeleccionViajes 
         Caption         =   "Todos lo Viajes Facturados al Licenciatario"
         Height          =   465
         Index           =   1
         Left            =   7395
         TabIndex        =   3
         Top             =   375
         Value           =   -1  'True
         Width           =   3555
      End
      Begin VB.OptionButton OptionSeleccionViajes 
         Caption         =   "Todos lo Viajes No Pagados al Licenciatario"
         Height          =   465
         Index           =   2
         Left            =   7410
         TabIndex        =   45
         Top             =   705
         Width           =   3555
      End
      Begin MSComctlLib.ListView lstBusqueda 
         Height          =   8115
         Left            =   45
         TabIndex        =   21
         Top             =   1800
         Width           =   19830
         _ExtentX        =   34978
         _ExtentY        =   14314
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         MultiSelect     =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         OLEDragMode     =   1
         OLEDropMode     =   1
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
         NumItems        =   23
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "nrLicencia"
            Text            =   "Licencia"
            Object.Width           =   1499
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Object.Tag             =   "dtCupon"
            Text            =   "Fecha y Hora del Viaje"
            Object.Width           =   3351
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Object.Tag             =   "dsDestino"
            Text            =   "Destino"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Tag             =   "dsLeyenda"
            Text            =   "Obs. Factura"
            Object.Width           =   3175
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
            Object.Tag             =   "vlComision"
            Text            =   "Comisión"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   10
            Object.Tag             =   "vlIVA"
            Text            =   "IVA"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   11
            Key             =   "tpComprobanteCliente"
            Object.Tag             =   "tpComprobanteCliente"
            Text            =   "Letra"
            Object.Width           =   1587
         EndProperty
         BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   12
            Object.Tag             =   "nrTalonarioCliente"
            Text            =   "Talonario"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(14) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   13
            Object.Tag             =   "nrComprabanteCliente"
            Text            =   "Comprabante"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(15) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   14
            Object.Tag             =   "flCompensado"
            Text            =   "Compensado"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(16) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   15
            Object.Tag             =   "dtCompensado"
            Text            =   "Fecha de Compensado"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(17) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   16
            Object.Tag             =   "dsUsuario"
            Text            =   "Usuario"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(18) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   17
            Object.Tag             =   "nrCajaLicenciatario"
            Text            =   "Nro. de Caja"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(19) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   18
            Object.Tag             =   "nrCupon"
            Text            =   "Nro. Cupon"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(20) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   19
            Object.Tag             =   "dsObservacion"
            Text            =   "Observación"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(21) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   20
            Key             =   "flManual"
            Object.Tag             =   "flManual"
            Text            =   "Viaje Manual"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(22) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   21
            Object.Tag             =   "datotellic"
            Text            =   "datotellic"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(23) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   22
            Object.Tag             =   "datostelchoferes"
            Text            =   "datostelchoferes"
            Object.Width           =   0
         EndProperty
      End
      Begin VB.Label Label5 
         Caption         =   "Monto Viaje Mayor a"
         Height          =   225
         Left            =   5670
         TabIndex        =   46
         Top             =   345
         Width           =   1455
      End
      Begin VB.Label Label3 
         Caption         =   "Licencia"
         Height          =   300
         Left            =   135
         TabIndex        =   23
         Top             =   315
         Width           =   825
      End
      Begin VB.Label Label19 
         Caption         =   "Licenciatario"
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
         Left            =   1365
         TabIndex        =   22
         Top             =   315
         Width           =   1455
      End
   End
   Begin VB.Frame fraPagoLicenciatarios 
      BorderStyle     =   0  'None
      Height          =   10260
      Left            =   0
      TabIndex        =   5
      Top             =   645
      Width           =   20205
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H80000008&
         Height          =   4716
         Left            =   1590
         ScaleHeight     =   4680
         ScaleWidth      =   6870
         TabIndex        =   7
         Top             =   1560
         Width           =   6900
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   7
            Left            =   312
            Locked          =   -1  'True
            TabIndex        =   52
            TabStop         =   0   'False
            Tag             =   "dsLeyenda"
            Top             =   1728
            Width           =   6180
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            DataField       =   "cdCaja"
            ForeColor       =   &H00000000&
            Height          =   285
            Index           =   6
            Left            =   300
            Locked          =   -1  'True
            TabIndex        =   48
            TabStop         =   0   'False
            Tag             =   "vlIVA"
            Top             =   4044
            Width           =   1410
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
            TabIndex        =   24
            TabStop         =   0   'False
            Tag             =   "dsDestino"
            Top             =   1065
            Width           =   6180
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
            TabIndex        =   12
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
            Index           =   1
            Left            =   2025
            Locked          =   -1  'True
            TabIndex        =   11
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
            Index           =   2
            Left            =   345
            Locked          =   -1  'True
            TabIndex        =   10
            TabStop         =   0   'False
            Tag             =   "nrLicenciaMuestra"
            Top             =   480
            Width           =   810
         End
         Begin VB.TextBox txtFields 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            Height          =   1350
            Index           =   20
            Left            =   300
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   9
            TabStop         =   0   'False
            Tag             =   "dsObservacion"
            Top             =   2352
            Width           =   6210
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
            TabIndex        =   8
            TabStop         =   0   'False
            Tag             =   "dtCupon"
            Top             =   480
            Width           =   2310
         End
         Begin VB.Label lblLabels 
            BackStyle       =   0  'Transparent
            Caption         =   "Observación Factura"
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
            Index           =   8
            Left            =   324
            TabIndex        =   53
            Top             =   1488
            Width           =   3156
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
            Height          =   252
            Index           =   7
            Left            =   300
            TabIndex        =   49
            Top             =   3804
            Width           =   480
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
            TabIndex        =   25
            Top             =   825
            Width           =   915
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
            TabIndex        =   17
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
            TabIndex        =   16
            Top             =   240
            Width           =   1380
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
            TabIndex        =   15
            Top             =   240
            Width           =   915
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
            Height          =   252
            Index           =   3
            Left            =   312
            TabIndex        =   14
            Top             =   2112
            Width           =   3816
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
            TabIndex        =   13
            Top             =   255
            Width           =   2085
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
         TabIndex        =   6
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
         TabIndex        =   18
         Top             =   6180
         Visible         =   0   'False
         Width           =   915
      End
   End
End
Attribute VB_Name = "frm_ResumenLicenciatario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const grilla_columna_datostelchoferes = 22
Const grilla_columna_datotellic = 21
Const grilla_columna_nrCupon = 18
Const grilla_columna_dsObservacion = 19
Const grilla_columna_flmanual = 20


Dim EstadoABM As Byte
Dim objControl As New CControl

' variable para la clase
Dim tTip As CUserTooltip

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

    For Each Control In Me.txtFields
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


Private Sub chkTodosLosLicenciatarios_Click()

    If chkTodosLosLicenciatarios.value = vbUnchecked Then
        HabilitarCampos "nrLicencia", True
    Else
        ObtenerCampo("nrLicencia").Locked = False
        ObtenerCampo("nrLicencia").Text = ""
        ObtenerCampo("nmLicenciatario").Text = ""
        HabilitarCampos "nrLicencia", False
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

Private Sub AvisarError(nmCampo As String, Error As Boolean)

    If Error Then
          ObtenerCampo(nmCampo).BackColor = Rojo
          ' ObtenerCampo(nmCampo).SetFocus
    Else
          ObtenerCampo(nmCampo).BackColor = Blanco
    End If

End Sub

Private Sub cmdBuscar_Click()
Dim nrLicencia As String
Dim strSQL     As String

    If Me.chkTodosLosLicenciatarios.value = vbUnchecked And Trim(ObtenerCampo("nrLicencia").Text) = "" Then
        MsgBox "Debe completar el campo de licencia.", vbInformation + vbDefaultButton1, "Atención"
        Me.txtBusqueda(1).SetFocus
        Exit Sub
    End If
    
    If ObtenerCampo("dtDesde").value > ObtenerCampo("dtHasta").value Then
        MsgBox "La fecha desde no puede ser mayor a la fecha hasta.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dtDesde").SetFocus
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    Me.lstBusqueda.ListItems.Clear
    Me.lstExcelIVA.ListItems.Clear
         
         If Trim(ObtenerCampo("nrLicencia").Text) = "" Then
             nrLicencia = 0
         Else
             nrLicencia = CLng(Trim(ObtenerCampo("nrLicencia").Text))
         End If
        
         strSQL = " SP_TB_Cupones_Qry_v3_9 "
         strSQL = strSQL + "@dtCupon_desde_param='" + Format(ObtenerCampo("dtDesde").value, "DD-MM-YYYY 00:00:00.000") + "',"
         strSQL = strSQL + "@dtCupon_hasta_param='" + Format(ObtenerCampo("dtHasta").value, "DD-MM-YYYY 23:59:59.000") + "',"
         strSQL = strSQL + "@nrLicencia_param=" + nrLicencia + ","
         strSQL = strSQL + "@flAnulado_param=0,"
         strSQL = strSQL + "@flCompensado_param=" + CStr(IIf(Me.OptionSeleccionViajes(0).value, 1, 0)) + ","
         strSQL = strSQL + "@flNoPagados_param=" + CStr(IIf(Me.OptionSeleccionViajes(2).value, 1, 0)) + ","
         strSQL = strSQL + "@flAgrupado=0,"
         strSQL = strSQL + "@vlMontoCupon_param=" + objbasededatos.FormatearValorSQL(ObtenerCampo("vlMontoCupon"), "DOUBLE") + ","
         strSQL = strSQL + "@flIVA=" + CStr(IIf(Me.OptionSeleccionViajes(3).value, 1, 0))
         
         
         If objbasededatos.ExecStoredProcedures(strSQL) Then
            If Not objbasededatos.rs_resultados.EOF Then
               objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstBusqueda, 0, "VW_Cupones"
               objbasededatos.ExecStoredProcedures (strSQL)
               objControl.CargarListView_SG objbasededatos.rs_resultados, Me.lstExcelIVA, 0, "VW_Cupones"
               ColorearLineasyResaltarObservacion
               On Error Resume Next
               Me.lstBusqueda.SetFocus
               On Error GoTo 0
            Else
                MsgBox "No existe datos para la selección, por favor verifique el rango de fecha ingresado.", vbInformation, "Atención"
            End If
         Else
             MsgBox "Error, " + objbasededatos.Error, vbInformation, "Atención"
         End If
    
    Screen.MousePointer = vbDefault
    
End Sub

Private Sub ColorearLineasyResaltarObservacion()
Dim i As Long
Dim j As Integer
Dim ItemList  As ListItem

    For i = 1 To Me.lstBusqueda.ListItems.Count
        
        If Me.lstBusqueda.ListItems(i).SubItems(grilla_columna_dsObservacion) <> "" Then
            Set ItemList = Me.lstBusqueda.ListItems.Item(i)
            ItemList.SmallIcon = 7
            ItemList.CreateDragImage
        End If
        
        ' marcamos los viajes con factura manual
        If Me.lstBusqueda.ListItems(i).SubItems(grilla_columna_flmanual) = "M" Then
           Me.lstBusqueda.ListItems(i).ForeColor = Naranja
            For j = 1 To Me.lstBusqueda.ListItems(i).ListSubItems.Count
                Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ForeColor = Naranja
                    Me.lstBusqueda.ListItems(i).ListSubItems.Item(j).ToolTipText = "Factura cargada en forma manual"
            Next
        
        End If
    
    Next i
    
    objGUI.refrescarGrilla Me.lstBusqueda
        

End Sub



Private Sub cmdCancelar_Click()
Dim resp   As Byte

    resp = MsgBox("Esta seguro que desea cancelar la exportación", vbQuestion + vbYesNo, "Atención")
    If resp = vbYes Then
        objExportar.bCancelar = True
    End If
    
End Sub

Private Sub Form_Activate()


    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
    Me.chkTodosLosLicenciatarios.value = vbChecked

    cmdBuscar_Click
   
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)


    Select Case KeyCode
    Case vbKeyEscape
            If EstadoABM = Consulta Then
                If tlb_ABM.Buttons("Salir").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Salir")
                End If
            Else
                If tlb_ABM.Buttons("Cancelar").Visible Then
                    tlb_ABM_ButtonClick tlb_ABM.Buttons("Cancelar")
                End If
            End If
    Case vbKeyF2
            If tlb_ABM.Buttons("Buscar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Buscar")
            End If
    Case vbKeyF5
        If EstadoABM = Consulta Then
            If tlb_ABM.Buttons("Exportar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Exportar")
            End If
        Else
            If tlb_ABM.Buttons("Eliminar").Visible Then
                tlb_ABM_ButtonClick tlb_ABM.Buttons("Eliminar")
            End If
        End If
    End Select


End Sub

Private Sub Form_Load()

    obtener_suma_falta_compensar
    
    Set objControl.objDiccionariodeDatos = objDiccionariodeDatos
    limpiarControles
    EstadoABM = Consulta
    ObtenerCampo("dtDesde").value = Date
    ObtenerCampo("dtHasta").value = Date
    ' tlb_ABM_ButtonClick Me.tlb_ABM.Buttons("Buscar")
    
    
   Set tTip = New CUserTooltip
   
   
   ' Establece El tipo ( balloon o normal )
   tTip.Estilo = TTBalloon
   ' Indica el icono a utilizar ( info, Warning , error etc..)
   tTip.Icono = TTIconInfo
   tTip.Delay = 0 ' Tiempo de duración
   tTip.Duracion = 999999999
   

   
   
End Sub







Private Sub BusquedaporClave(pClave As String)
Dim Control As Control
Dim Valor   As Variant
    
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCaja", _
    "=", pClave, " AND "
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




Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
End Sub

Private Sub Form_Resize()


    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda

End Sub



Private Sub fraBusqCajas_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
End Sub

Private Sub lstBusqueda_Click()

    ' agregado en la version 3.5
    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda

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


    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    If Me.lstBusqueda.SelectedItem.Text = "" Then Exit Sub
        
    ObjTablasIO.nmTabla = "TB_Cupones"
    ObjTablasIO.setearCampoOperadorValor "nrCupon", _
    "=", Me.lstBusqueda.SelectedItem.SubItems(grilla_columna_nrCupon), " AND "
    
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"

    ObjTablasIO.setearCampoOperadorValor "nrCupon", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrTalonarioCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nrComprabanteCliente", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dtCupon", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsDestino", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsObservacion", "->", ""
    ObjTablasIO.setearCampoOperadorValor "dsLeyenda", "->", ""
    ObjTablasIO.setearCampoOperadorValor "vlIVA", "->", ""
    
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
    
    ObtenerCampo("nrLicenciaMuestra") = objDiccionariodeDatos.FormatearCampoValor _
                            ("TB_Cupones", "nrLicencia", _
                            CStr(AdaptarNulos(ObjTablasIO.rs_resultados("nrLicencia"), "")))
    
    EstadoABM = modificacion
    PresentarPantalla Me.tlb_ABM.Buttons("Seleccionar")
    
End Sub

Private Sub lstBusqueda_ItemClick(ByVal Item As MSComctlLib.ListItem)
Dim nrLicencia As String
Dim datostelchoferes As String
Dim datotellic     As String


      If Me.lstBusqueda.ListItems.Count <= 0 Then Exit Sub
      If Item.Text = "" Then Exit Sub
      
        tTip.Titulo = Me.lstBusqueda.SelectedItem.Text
        tTip.Texto = Me.lstBusqueda.SelectedItem.Text
        tTip.Crear Me.lstBusqueda.hwnd ' crea el Tips
        
      
      datotellic = Item.ListSubItems(grilla_columna_datotellic)
      datostelchoferes = Item.ListSubItems(grilla_columna_datostelchoferes)
      
      If datotellic <> "" Then
        tTip.Titulo = datotellic
        tTip.Texto = datostelchoferes
        tTip.Crear Me.lstBusqueda.hwnd ' crea el Tips
        Exit Sub
      End If
      
      nrLicencia = objControl.buscarListviewValorColumnaSeleccionada(Me.lstBusqueda, "nrLicencia")
      objSPs.nmStoredProcedure = "spu_obtenerLicenciatariosTelefonosChoferes_v3_9"
      objSPs.setearCampoValor "@pnrLicencia", nrLicencia
   
      If objSPs.ExecSP() Then
        Dim strChoferes As String
        tTip.Titulo = CStr(objbasededatos.rs_resultados("nombre_completo") + " " + objbasededatos.rs_resultados("nrTel"))
        Me.lstBusqueda.ListItems(Item.Index).SubItems(grilla_columna_datotellic) = CStr(objbasededatos.rs_resultados("nombre_completo") + " " + objbasededatos.rs_resultados("nrTel"))
        objbasededatos.rs_resultados.MoveNext
        strChoferes = ""
        Do Until objbasededatos.rs_resultados.EOF
             strChoferes = strChoferes + objbasededatos.rs_resultados("nombre_completo") + " " + objbasededatos.rs_resultados("nrTel") + vbCrLf
             objbasededatos.rs_resultados.MoveNext
        Loop
        If strChoferes = "" Then
            strChoferes = " - "
        End If
        tTip.Texto = strChoferes
         Me.lstBusqueda.ListItems(Item.Index).SubItems(grilla_columna_datostelchoferes) = strChoferes
        tTip.Crear Me.lstBusqueda.hwnd ' crea el Tips
      End If

    
    
End Sub

Private Sub lstBusqueda_LostFocus()

        '/* cuando el foco se va eliminamos el tooltip */
        tTip.Destroy
        
End Sub

Private Sub lstBusqueda_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

   ' comentado en la version 3.5
   ' objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
   ' objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
    
End Sub



Private Sub tlb_ABM_ButtonClick(ByVal Button As MSComctlLib.Button)
Dim strValor    As String
    
    Select Case Button.Key
    Case "Buscar"
           cmdBuscar_Click
           PresentarPantalla Button
           ' buscar en la base de datos
           EstadoABM = Consulta
    Case "Seleccionar"
           lstBusqueda_DblClick
           EstadoABM = Consulta
    Case "Imprimir"
           ImprimirResumen
    Case "Exportar"
          ExportaraExcel
          EstadoABM = Consulta
    Case "Salir"
           Unload Me
    Case "Aceptar"
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Cancelar"
           PresentarPantalla Button
           EstadoABM = Consulta
    Case "Resumen"
        ImprimirResumenAgrupados
    End Select
    
End Sub


Private Sub ImprimirResumenAgrupados()
Dim resp         As Byte
Dim nrLicencia   As Long

    If ObtenerCampo("dtDesde").value > ObtenerCampo("dtHasta").value Then
        MsgBox "La fecha desde no puede ser mayor a la fecha hasta.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dtDesde").SetFocus
        Exit Sub
    End If
    
    If Trim(ObtenerCampo("nrLicencia").Text) = "" Then
        nrLicencia = 0
    Else
        nrLicencia = CLng(Trim(ObtenerCampo("nrLicencia").Text))
    End If
    Frm_Principal.LimpiarReporte
    
    Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_ResumenLicenciatarioAgrupado_v3_9.rpt"
    
    Frm_Principal.CrystalReport1.WindowState = crptMaximized
    
    Frm_Principal.CrystalReport1.Destination = crptToWindow
    Frm_Principal.CrystalReport1.WindowTitle = "Resúmenes de Licenciatarios"
    
    Frm_Principal.CrystalReport1.Formulas(1) = "FechaDesde='" + CStr(ObtenerCampo("dtDesde").value) + "'"
    Frm_Principal.CrystalReport1.Formulas(2) = "FechaHasta='" + CStr(ObtenerCampo("dtHasta").value) + "'"
        
    Frm_Principal.CrystalReport1.StoredProcParam(0) = Format(ObtenerCampo("dtDesde").value, "YYYY-MM-DD 00:00:00.000")
    Frm_Principal.CrystalReport1.StoredProcParam(1) = Format(ObtenerCampo("dtHasta").value, "YYYY-MM-DD 23:59:59.000")
    Frm_Principal.CrystalReport1.StoredProcParam(2) = nrLicencia
    Frm_Principal.CrystalReport1.StoredProcParam(3) = 0 ' Anulado
    Frm_Principal.CrystalReport1.StoredProcParam(4) = IIf(Me.OptionSeleccionViajes(0).value, 1, 0)  ' Compensado
    Frm_Principal.CrystalReport1.StoredProcParam(5) = IIf(Me.OptionSeleccionViajes(2).value, 1, 0) ' no pagados
    Frm_Principal.CrystalReport1.StoredProcParam(6) = 1 ' agrupado
    Frm_Principal.CrystalReport1.StoredProcParam(7) = objbasededatos.FormatearValorSQL(ObtenerCampo("vlMontoCupon"), "DOUBLE")  ' vlMontoCupon
    Frm_Principal.CrystalReport1.StoredProcParam(8) = IIf(Me.OptionSeleccionViajes(3).value, 1, 0)  ' IVA
   
        
    ' Aparece la venta original
    On Error Resume Next
    Frm_Principal.CrystalReport1.WindowTitle = Frm_Principal.CrystalReport1.WindowTitle + " - (" + Frm_Principal.CrystalReport1.ReportFileName + ")"
    Frm_Principal.CrystalReport1.Action = 1
    If Err Then
            MsgBox "Error al generar el reporte: " + Err.Description, vbCritical, "Atención"
    End If
    On Error GoTo 0
    
    
    
End Sub

Private Sub ImprimirResumen()
Dim resp As Byte
    
    If ObtenerCampo("dtDesde").value > ObtenerCampo("dtHasta").value Then
        MsgBox "La fecha desde no puede ser mayor a la fecha hasta.", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("dtDesde").SetFocus
        Exit Sub
    End If
    
    
    If Me.chkTodosLosLicenciatarios.value = vbChecked Then
        resp = MsgBox("Imprimirá todos los resumenes, esta opción puede demorar varios minutos." + vbCrLf + _
                 "Esta seguro que quiere imprimir.", vbQuestion + vbYesNo, "Atención")
                 
         If resp = vbNo Then Exit Sub
         ObjTablasIO.nmTabla = "TB_Proveedores"
         ObjTablasIO.setearCampoOperadorValor "nrLicencia", "->", "", "ASC"
         ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
         ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0", " AND "
         ObjTablasIO.setearCampoOperadorValor "nrLicencia", "is not null", ""
         
         ObjTablasIO.Seleccionar
         
         Do Until ObjTablasIO.rs_resultados.EOF
            ImprimirResumenporLicencia _
                CStr(ObjTablasIO.rs_resultados("nrLicencia").value), _
                ObtenerCampo("dtDesde").value, ObtenerCampo("dtHasta").value, False
            ObjTablasIO.rs_resultados.MoveNext
         Loop
    Else
        If ObtenerCampo("nrLicencia").Text = "" Then
            MsgBox "Debe ingresar una Licencia", vbCritical, "Atención"
            ObtenerCampo("nrLicencia").SetFocus
            Exit Sub
        End If
            ImprimirResumenporLicencia _
                ObtenerCampo("nrLicencia").Text, _
                ObtenerCampo("dtDesde").value, _
                ObtenerCampo("dtHasta").value, False
   End If
    
   
End Sub


Private Sub ImprimirResumenporLicencia(pnrLicencia As String, _
pdtdesde As String, pdtHasta As String, pSalidaImpresora As Boolean)

        
        Frm_Principal.LimpiarReporte
        
        
        Frm_Principal.CrystalReport1.ReportFileName = objConfig.Sub_Path_Reportes & "\rpt_resumenlicenciatario_v4_1.rpt"
        Frm_Principal.CrystalReport1.WindowState = crptMaximized
        If pSalidaImpresora Then
            Frm_Principal.CrystalReport1.Destination = crptToPrinter
        Else
            Frm_Principal.CrystalReport1.Destination = crptToWindow
        End If
        
        Frm_Principal.CrystalReport1.WindowTitle = "Impresión de Resumen del Licenciatario Nro. " + pnrLicencia
        
        Frm_Principal.CrystalReport1.StoredProcParam(0) = Format(pdtdesde, "YYYY-MM-DD 00:00:00.000")
        Frm_Principal.CrystalReport1.StoredProcParam(1) = Format(pdtHasta, "YYYY-MM-DD 23:59:59.000")
        Frm_Principal.CrystalReport1.StoredProcParam(2) = CInt(pnrLicencia)
        Frm_Principal.CrystalReport1.StoredProcParam(3) = 0 ' Anulado
        Frm_Principal.CrystalReport1.StoredProcParam(4) = IIf(Me.OptionSeleccionViajes(0).value, 1, 0)  ' Compensado
        Frm_Principal.CrystalReport1.StoredProcParam(5) = IIf(Me.OptionSeleccionViajes(2).value, 1, 0) ' no pagados
        Frm_Principal.CrystalReport1.StoredProcParam(6) = 0 ' agrupado
        Frm_Principal.CrystalReport1.StoredProcParam(7) = objbasededatos.FormatearValorSQL(ObtenerCampo("vlMontoCupon"), "DOUBLE")  ' vlMontoCupon
        Frm_Principal.CrystalReport1.StoredProcParam(8) = IIf(Me.OptionSeleccionViajes(3).value, 1, 0)  ' IVA
        
        Frm_Principal.CrystalReport1.Formulas(1) = "FechaDesde='" + pdtdesde + "'"
        Frm_Principal.CrystalReport1.Formulas(2) = "FechaHasta='" + pdtHasta + "'"
        
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

    objExportar.ConProgressBar = True
    Set objExportar.Ventana = Me
    If Me.lstBusqueda.ListItems.Count = 0 Then Exit Sub
    
    If Me.OptionSeleccionViajes(3).value Then
         If Not objExportar.aExcel_FromListView_ConFormato2(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstExcelIVA, "TB_Cupones") Then
            MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
            Exit Sub
        End If
        Exit Sub
    End If
    
    
    
    If Not objExportar.aExcel_FromListView_ConFormato(objConfig.dsPathTemp + "\Libro1", True, "Plantilla.xls", strError, Me.lstBusqueda, "TB_Cupones") Then
        MsgBox "Error: " + strError, vbCritical + vbDefaultButton1, "Atención"
        Exit Sub
    End If
End Sub


Private Function Guardarregistro(EstadoABM As Byte) As Boolean
Dim Control As Control
Dim strtag  As String
Dim strPrefijo As String

    ObjTablasIO.nmTabla = "TB_Cupones"
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
    Case "Buscar"
           fraBusqCajas.Visible = True
           fraPagoLicenciatarios.Visible = False
           Me.lstBusqueda.Visible = True
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Resumen").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           On Error Resume Next
           Me.txtBusqueda(1).SetFocus
           On Error GoTo 0
    Case "Seleccionar"
           fraBusqCajas.Visible = False
           fraPagoLicenciatarios.Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = True
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Seleccionar").Visible = False
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = False
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = False
           Me.tlb_ABM.Buttons("Resumen").Visible = False
           Me.tlb_ABM.Buttons("Imprimir").Visible = False
    Case "Aceptar"
           fraPagoLicenciatarios.Visible = False
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           fraBusqCajas.Visible = True
           Me.lstBusqueda.Visible = True
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = False
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Resumen").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
           Me.lstBusqueda.Visible = True
           Me.lstBusqueda.SetFocus
    Case "Cancelar"
           fraBusqCajas.Visible = True
           fraPagoLicenciatarios.Visible = False
           Me.lstBusqueda.Visible = True
           Me.fraPagoLicenciatarios.Visible = False
           Me.tlb_ABM.Buttons("Buscar").Visible = True
           Me.tlb_ABM.Buttons("Seleccionar").Visible = True
           Me.tlb_ABM.Buttons("Eliminar").Visible = False
           Me.tlb_ABM.Buttons("Exportar").Visible = True
           Me.tlb_ABM.Buttons("Raya").Visible = True
           Me.tlb_ABM.Buttons("Salir").Visible = True
           Me.tlb_ABM.Buttons("Aceptar").Visible = False
           Me.tlb_ABM.Buttons("Cancelar").Visible = False
           Me.tlb_ABM.Buttons("Resumen").Visible = True
           Me.tlb_ABM.Buttons("Imprimir").Visible = True
    End Select

    

End Sub





Private Sub tlb_ABM_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    ' comentado en la version 3.5
    'objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    'objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
    
End Sub

Private Sub txtBusqueda_Change(Index As Integer)

    Select Case UCase(txtBusqueda(Index).Tag)
    Case UCase("nrLicencia")
        If txtBusqueda(Index).Text <> "" Then
            Me.chkTodosLosLicenciatarios.value = vbUnchecked
        Else
            Me.chkTodosLosLicenciatarios.value = vbChecked
        End If
        DoEvents
        AvisarError "nrLicencia", False
    End Select

End Sub

Private Sub txtBusqueda_GotFocus(Index As Integer)


    DoEvents
    objGUI.SizeControls Me, Me.fraBusqCajas, Me.lstBusqueda
    objGUI.SizeControls Me, Me.fraPagoLicenciatarios, Me.lstBusqueda
    
    
    
End Sub

Private Sub txtBusqueda_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)


    If KeyCode = vbKeyF1 Then
          Select Case UCase(txtBusqueda(Index).Tag)
          Case UCase("nrLicencia")
            ObtenerCampo("nrLicencia").Text = "(Borrar)"
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            If Trim(ObtenerCampo("nrLicencia").Text) = "(Nuevo)" Then
                ObtenerCampo("nrLicencia").Text = ""
            Else
                buscarlicencia
            End If
          End Select
    End If
    
    
End Sub

Private Sub txtBusqueda_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

     Select Case UCase(txtBusqueda(Index).Tag)
    Case UCase("nrLicencia")
        If txtBusqueda(Index).Text = "" And KeyAscii <> Asc(vbTab) Then
            HabilitarCampos txtBusqueda(Index).Tag, True
            Me.chkTodosLosLicenciatarios.value = vbUnchecked
            If IsNumeric(Chr(KeyAscii)) Then
                txtBusqueda(Index).Text = Chr(KeyAscii)
                txtBusqueda(Index).SelStart = 1
            End If
            KeyAscii = vbKeyReturn
        End If
        Exit Sub
    End Select
    
    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtBusqueda(Index), KeyAscii)
    End If



    
    
End Sub

Private Sub txtBusqueda_LostFocus(Index As Integer)
    Select Case txtBusqueda(Index).Tag
    Case "nrLicencia"
        If (Not txtBusqueda(Index).Text = "(Borrar)") And _
            Trim(txtBusqueda(Index).Text) <> "" And Trim(txtBusqueda(Index).Text) <> "*" Then
            buscarlicencia
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtBusqueda(Index), "LostFocus"
        End If
 
    End Select

End Sub

Private Sub txtFields_GotFocus(Index As Integer)

    DoEvents
    If Me.txtFields(Index).Tag <> "" Then
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                                      Me.txtFields(Index), "GotFocus"
    End If
    
End Sub

Private Sub txtFields_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyF1 Then
          Select Case UCase(txtFields(Index).Tag)
          Case UCase("nrLicencia")
            ObtenerCampo("nrLicencia").Text = "(Borrar)"
            objParametros.GrabarValor "nmTablaBusqueda", "TB_Proveedores"
            objParametros.GrabarValor "nmCampoClaveBusqueda", "nrLicencia"
            objParametros.GrabarValor "vlCampoClaveBusqueda", ""
            Frm_Busquedas.Show 1
            ObtenerCampo("nrLicencia").Text = objParametros.ObtenerValor("vlCampoClaveBusqueda")
            If Trim(ObtenerCampo("nrLicencia").Text) = "(Nuevo)" Then
                ObtenerCampo("nrLicencia").Text = ""
            Else
                buscarlicencia
            End If
          End Select
    End If
End Sub





Private Function buscarlicencia() As Boolean
Dim strNombreCompleto As String

    
    ObjTablasIO.nmTabla = "TB_Proveedores"
    ObjTablasIO.setearCampoOperadorValor "tpCategoria", "=", "Licenciatario", " AND "
    ObjTablasIO.setearCampoOperadorValor _
    "nrLicencia", "=", ObtenerCampo("nrLicencia").Text, " AND "
    ObjTablasIO.setearCampoOperadorValor "flEliminar", "=", "0"
    
    ObjTablasIO.setearCampoOperadorValor "nmNombre", "->", ""
    ObjTablasIO.setearCampoOperadorValor "nmApellido", "->", ""
    ObjTablasIO.Seleccionar
    If Not ObjTablasIO.rs_resultados.EOF Then
        strNombreCompleto = IIf(IsNull(ObjTablasIO.rs_resultados("nmApellido").value), "", ObjTablasIO.rs_resultados("nmApellido").value) + " "
        strNombreCompleto = strNombreCompleto & IIf(IsNull(ObjTablasIO.rs_resultados("nmNombre").value), "", ObjTablasIO.rs_resultados("nmNombre").value)
        ObtenerCampo("nmLicenciatario").Text = strNombreCompleto
        buscarlicencia = True
        
    Else
        MsgBox "La licencia es invalida, por favor ingrese una correcta", vbInformation + vbDefaultButton1, "Atención"
        ObtenerCampo("nmLicenciatario").Text = ""
        AvisarError "nrLicencia", True
        ObtenerCampo("nrLicencia").SetFocus
        buscarlicencia = False
    End If
         
End Function

Private Sub txtFields_KeyPress(Index As Integer, KeyAscii As Integer)
Dim tabindexsig As Integer

    If Not KeyAscii = vbKeyReturn Then
        KeyAscii = objDiccionariodeDatos.ValidarEntrada("TB_Cupones", _
                            Me.txtFields(Index), KeyAscii)
    End If
    
End Sub


Private Sub txtFields_LostFocus(Index As Integer)
    
    Select Case txtFields(Index).Tag
    Case "nrLicencia"
        If (Not txtFields(Index).Text = "(Borrar)") And _
            Trim(txtFields(Index).Text) <> "" And Trim(txtFields(Index).Text) <> "*" Then
            buscarlicencia
            objDiccionariodeDatos.FormatearCampoControl "TB_Cupones", _
                              Me.txtFields(Index), "LostFocus"
        End If
 
    End Select
    
End Sub


Private Sub obtener_suma_falta_compensar()
Dim strSQL As String

    strSQL = " sp_obtiene_falta_compensar_v4_2 "
 
    If objbasededatos.ExecStoredProcedures(strSQL) Then
        Me.lbl_falta_comp_pesos.Caption = objbasededatos.rs_resultados("suma_vlPagoPesos")
        Me.lbl_falta_comp_euros.Caption = objbasededatos.rs_resultados("suma_vlPagoEuros")
        Me.lbl_falta_comp_dolares.Caption = objbasededatos.rs_resultados("suma_vlPagoDolares")
        Me.lbl_falta_comp_reales.Caption = objbasededatos.rs_resultados("suma_vlPagoReales")
        Me.lbl_falta_comp_dtcupon_hora_corte = objbasededatos.rs_resultados("dtcupon_hora_corte")
        
    End If
      
End Sub

