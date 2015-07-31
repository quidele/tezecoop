VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmPrincipal 
   Caption         =   "Impresión de Etiquetas de Lotes"
   ClientHeight    =   6216
   ClientLeft      =   432
   ClientTop       =   1476
   ClientWidth     =   11028
   Icon            =   "frmPrincipal.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6216
   ScaleWidth      =   11028
   Begin VB.Frame Frame3 
      Height          =   615
      Left            =   0
      TabIndex        =   29
      Top             =   5520
      Width           =   10935
      Begin VB.CommandButton cmbAnterior 
         Caption         =   "<<"
         Height          =   255
         Left            =   1440
         TabIndex        =   34
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton txtUltimo 
         Caption         =   "&Ultimo"
         Height          =   255
         Left            =   3960
         TabIndex        =   33
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton cmbPrimero 
         Caption         =   "&Primero"
         Height          =   255
         Left            =   2640
         TabIndex        =   32
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdProximo 
         Caption         =   ">>"
         Height          =   255
         Left            =   2040
         TabIndex        =   31
         Top             =   240
         Width           =   495
      End
      Begin VB.TextBox txtUbicacion 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   30
         Text            =   "1"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label lbldiahoy 
         Alignment       =   1  'Right Justify
         Caption         =   "Label4"
         Height          =   255
         Left            =   6000
         TabIndex        =   36
         Top             =   240
         Width           =   4695
      End
      Begin VB.Label lblCantidadLotes 
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "000"
         Height          =   255
         Left            =   5400
         TabIndex        =   35
         Top             =   240
         Visible         =   0   'False
         Width           =   495
      End
   End
   Begin VB.CommandButton cmdVto 
      Caption         =   "&Mod.Vto."
      Height          =   400
      Left            =   9720
      TabIndex        =   28
      ToolTipText     =   "Modifica la fecha de Vto."
      Top             =   2760
      Width           =   1000
   End
   Begin VB.TextBox txtCodigo 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   120
      MaxLength       =   6
      TabIndex        =   0
      Top             =   480
      Width           =   765
   End
   Begin MSComDlg.CommonDialog dlgImprimir 
      Left            =   9720
      Top             =   4560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame2 
      Height          =   5535
      Left            =   9480
      TabIndex        =   18
      Top             =   0
      Width           =   1455
      Begin VB.Timer Timer1 
         Interval        =   1000
         Left            =   720
         Top             =   4560
      End
      Begin VB.CommandButton cmdAnulado 
         Caption         =   "A&nular"
         Height          =   400
         Left            =   240
         TabIndex        =   13
         ToolTipText     =   "Anula el registro"
         Top             =   3720
         Width           =   1000
      End
      Begin VB.CommandButton cmdEliminar 
         Caption         =   "&Eliminar"
         Height          =   400
         Left            =   240
         TabIndex        =   12
         ToolTipText     =   "Elimina el último registro del corriente año"
         Top             =   3240
         Width           =   1000
      End
      Begin VB.CommandButton cmdSalir 
         Caption         =   "Sa&lir"
         Height          =   400
         Left            =   240
         TabIndex        =   14
         ToolTipText     =   "Sale de la aplicación"
         Top             =   5040
         Width           =   1000
      End
      Begin VB.CommandButton cmdModificar 
         Caption         =   "&Modificar"
         Height          =   400
         Left            =   240
         TabIndex        =   11
         ToolTipText     =   "Modifica el registro"
         Top             =   2280
         Width           =   1000
      End
      Begin VB.CommandButton cmdRefrescar 
         Caption         =   "&Refrescar"
         Height          =   400
         Left            =   240
         TabIndex        =   10
         ToolTipText     =   "Carga la Grilla con los 100 últimos registros"
         Top             =   1800
         Width           =   1000
      End
      Begin VB.CommandButton cmdSelect 
         Caption         =   "&Seleccionar"
         Height          =   400
         Left            =   240
         TabIndex        =   9
         ToolTipText     =   "Busqueda por Selección"
         Top             =   1305
         Width           =   1000
      End
      Begin VB.CommandButton cmdImprimir 
         Caption         =   "&Imprimir"
         Height          =   400
         Left            =   240
         TabIndex        =   8
         ToolTipText     =   "Crea e imprime una nueva etiqueta"
         Top             =   840
         Width           =   1000
      End
      Begin VB.CommandButton cmdAgregar 
         Caption         =   "&Agregar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   7.8
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Left            =   255
         TabIndex        =   7
         ToolTipText     =   "Agrega un nuevo Lote e Imprime la etiqueta"
         Top             =   360
         Width           =   1000
      End
   End
   Begin MSFlexGridLib.MSFlexGrid grdPrincipal 
      Height          =   3975
      Left            =   0
      TabIndex        =   17
      Top             =   1560
      Width           =   9375
      _ExtentX        =   16531
      _ExtentY        =   7006
      _Version        =   393216
      Rows            =   3
      Cols            =   9
      FixedCols       =   0
      AllowBigSelection=   0   'False
      ScrollTrack     =   -1  'True
      FocusRect       =   0
      SelectionMode   =   1
      AllowUserResizing=   3
      MousePointer    =   1
   End
   Begin VB.Frame Frame1 
      Height          =   1455
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   9375
      Begin VB.TextBox txtCodProveedor 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4560
         MaxLength       =   6
         TabIndex        =   37
         Top             =   480
         Width           =   750
      End
      Begin MSMask.MaskEdBox mskVto 
         Height          =   315
         Left            =   3795
         TabIndex        =   26
         Top             =   960
         Width           =   1095
         _ExtentX        =   1947
         _ExtentY        =   550
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##/##/####"
         PromptChar      =   " "
      End
      Begin VB.TextBox txtRemito3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   8145
         MaxLength       =   8
         TabIndex        =   5
         Top             =   930
         Width           =   885
      End
      Begin VB.TextBox txtRemito2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   7530
         MaxLength       =   4
         TabIndex        =   4
         Top             =   930
         Width           =   525
      End
      Begin VB.TextBox txtRemito1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   7170
         MaxLength       =   1
         TabIndex        =   3
         Top             =   930
         Width           =   280
      End
      Begin VB.CheckBox chkHabilitaVto 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         Caption         =   "&Habilita Vto."
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5175
         TabIndex        =   6
         Top             =   990
         Width           =   1215
      End
      Begin VB.ComboBox cmbProveedor 
         Height          =   315
         Left            =   5340
         TabIndex        =   2
         Text            =   "cmbProveedor"
         Top             =   465
         Width           =   3900
      End
      Begin VB.ComboBox cmbArticulo 
         Height          =   315
         Left            =   900
         TabIndex        =   1
         Text            =   "cmbArticulo"
         Top             =   480
         Width           =   3615
      End
      Begin MSMask.MaskEdBox mskFechaLote 
         Height          =   315
         Left            =   990
         TabIndex        =   27
         Top             =   960
         Width           =   1095
         _ExtentX        =   1926
         _ExtentY        =   550
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##/##/####"
         PromptChar      =   " "
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Código"
         Height          =   210
         Index           =   6
         Left            =   4575
         TabIndex        =   38
         Top             =   255
         Width           =   495
      End
      Begin VB.Label Label3 
         Caption         =   "-"
         Height          =   135
         Left            =   8070
         TabIndex        =   25
         Top             =   1005
         Width           =   135
      End
      Begin VB.Label Label2 
         Caption         =   "-"
         Height          =   135
         Left            =   7455
         TabIndex        =   24
         Top             =   1005
         Width           =   135
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Código"
         Height          =   195
         Index           =   5
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Remito"
         Height          =   195
         Index           =   4
         Left            =   6570
         TabIndex        =   22
         Top             =   1005
         Width           =   495
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Proveedores"
         Height          =   195
         Index           =   3
         Left            =   5355
         TabIndex        =   21
         Top             =   240
         Width           =   900
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Fecha Vto"
         Height          =   195
         Index           =   2
         Left            =   3000
         TabIndex        =   20
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Fecha Lote"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   19
         Top             =   1080
         Width           =   810
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Articulo"
         Height          =   195
         Index           =   1
         Left            =   960
         TabIndex        =   16
         Top             =   240
         Width           =   525
      End
   End
End
Attribute VB_Name = "frmPrincipal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_fecha As Boolean
Private m_resultados As String

Public Property Let Fecha(undato As Boolean)
    m_fecha = undato
End Property

Public Property Get Fecha() As Boolean
    Fecha = m_fecha
End Property

Public Property Let resultados(unString As String)
    m_resultados = unString
End Property

Public Property Get resultados() As String
    resultados = m_resultados
End Property

Private Sub chkHabilitaVto_Click()
    If chkHabilitaVto.Value = 1 Then
        mskVto.Enabled = True
        'txtVto.Enabled = True
    Else
        mskVto.Enabled = False
        'txtVto.Enabled = False
    End If
End Sub

Private Sub cmbAnterior_Click()
        
        Dim alerta
        
        If grdPrincipal.Rows = 0 Then Exit Sub
        
        If txtUbicacion >= 2 Then
        txtUbicacion = txtUbicacion - 1
        grdPrincipal.Row = txtUbicacion
        grdPrincipal.SetFocus

        
        Dim lArticulo As Long
    Dim lProveedor As Long
    Dim sRemito As String
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    
'    On Error GoTo ErrorHandler
    If grdPrincipal.Text = "" Then Exit Sub
    
    With grdPrincipal
        If .RowSel = 0 Then
            cmdEliminar.Enabled = True
        Else
            cmdEliminar.Enabled = False
        End If
        .Row = .RowSel
        .Col = 6: lProveedor = .Text
        .Col = 8: sRemito = .Text
        .Col = 3: lArticulo = .Text
        .Col = 2: dFechaLote = .Text
        .Col = 5: dFechaVto = .Text
        .Col = 1
             
        txtUbicacion = grdPrincipal.Row

        
    End With
    
     ForzarItemdata cmbArticulo, lArticulo
     ForzarItemdata cmbProveedor, lProveedor
     txtRemito1 = Mid(sRemito, 1, 1)
     txtRemito2 = Mid(sRemito, 3, 7)
     txtRemito3 = Mid(sRemito, 8)
     
     'mskRemito = sRemito
     txtCodigo = CStr(lArticulo)
     mskFechaLote = Format$((dFechaLote), "dd/mm/yyyy")
     mskVto = Format$((dFechaVto), "dd/mm/yyyy")
     grdPrincipal.SetFocus
     Exit Sub
    
        Else
        alerta = MsgBox("Ha llegado al tope de la lista", vbCritical, "OYG")
        End If

'ErrorHandler:
'    MsgBox "No pudo leer los Datos de la Grilla", vbInformation, "OyG"

End Sub

Private Sub cmbArticulo_Click()
    Dim lCodigo As Long
    If cmbArticulo.ListIndex = -1 Then
        Beep
        Exit Sub
    End If
    lCodigo = cmbArticulo.ItemData(cmbArticulo.ListIndex)
    txtCodigo.Text = CStr(lCodigo)
    mskVto = Format$(DateAdd("d", obtenerVto(lCodigo), mskFechaLote), "dd/mm/yyyy")
End Sub

Private Sub cmbPrimero_Click()

    If grdPrincipal.Rows = 0 Then Exit Sub

    grdPrincipal.Row = 1
    txtUbicacion = 1
    grdPrincipal.SetFocus

        
    Dim lArticulo As Long
    Dim lProveedor As Long
    Dim sRemito As String
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    
    On Error GoTo ErrorHandler
    
    With grdPrincipal
        If .RowSel = 0 Then
            cmdEliminar.Enabled = True
        Else
            cmdEliminar.Enabled = False
        End If
        .Row = .RowSel
        .Col = 6: lProveedor = .Text
        .Col = 8: sRemito = .Text
        .Col = 3: lArticulo = .Text
        .Col = 2: dFechaLote = .Text
        .Col = 5: dFechaVto = .Text
        .Col = 1
             
        txtUbicacion = grdPrincipal.Row

        
    End With
    
     ForzarItemdata cmbArticulo, lArticulo
     ForzarItemdata cmbProveedor, lProveedor
     txtRemito1 = Mid(sRemito, 1, 1)
     txtRemito2 = Mid(sRemito, 3, 7)
     txtRemito3 = Mid(sRemito, 8)
     
     'mskRemito = sRemito
     txtCodigo = CStr(lArticulo)
     mskFechaLote = Format$((dFechaLote), "dd/mm/yyyy")
     mskVto = Format$((dFechaVto), "dd/mm/yyyy")
     grdPrincipal.SetFocus
     Exit Sub
     
ErrorHandler:
    MsgBox "No pudo leer los Datos de la Grilla", vbInformation, "OyG"

End Sub

Private Sub cmbProveedor_Click()
    Dim iCodigo As Long
    
    If cmbProveedor.ListIndex = -1 Then
        Beep
        Exit Sub
    End If
    iCodigo = cmbProveedor.ItemData(cmbProveedor.ListIndex)
    Me.txtCodProveedor.Text = iCodigo
    
    
End Sub

Private Sub cmbProveedor_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyTab And KeyAscii = vbKeyReturn Then
        txtRemito1.SetFocus
    End If
    
End Sub

Private Sub cmdAgregar_Click()
    Dim iNroLote As Integer
    Dim Anio As Integer
    Dim lArticulo As Long
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    Dim lProveedor As Long
    Dim sRemito As String
    Dim sProveedor_descripcion As String
    Dim sArticulo_descripcion As String


    lblCantidadLotes = lblCantidadLotes + 1
    mskFechaLote = Format$(CDate(Now), "dd/mm/YYYY")
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False

    If Not ValidarCombos(Anio) Then
        Exit Sub
    End If
    
    
    
    lArticulo = cmbArticulo.ItemData(cmbArticulo.ListIndex)
    dFechaLote = CDate(mskFechaLote)
    dFechaVto = CDate(mskVto)
    lProveedor = cmbProveedor.ItemData(cmbProveedor.ListIndex)
    sRemito = txtRemito1 & "-" & txtRemito2 & "-" & txtRemito3
    sArticulo_descripcion = Me.cmbArticulo.Text
    sProveedor_descripcion = Me.cmbProveedor.Text
    ' sRemito = mskRemito
    
    aplicacion.m_con_mfg_cueros.BeginTrans
    aplicacion.m_con_OYG.BeginTrans
    
    'iNroLote = IncrementoNroLote
    
    iNroLote = oBasSQLOYG.obtenerNumeroLote
    
    If Not InsertarLote(Anio, iNroLote, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito, sArticulo_descripcion, sProveedor_descripcion) Then
         aplicacion.m_con_mfg_cueros.RollbackTrans
         aplicacion.m_con_OYG.RollbackTrans
         MsgBox "No puedo grabar el registro", vbInformation, "OyG"
         Exit Sub
    End If
    
    
    If Not oBasSQLOYG.InsertarLote(Anio, iNroLote, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito) Then
        aplicacion.m_con_OYG.RollbackTrans
        aplicacion.m_con_mfg_cueros.RollbackTrans
        MsgBox "Error al insertar el lote en OyG.", vbInformation, "OyG"
        Exit Sub
    End If
    
    aplicacion.m_con_mfg_cueros.CommitTrans
    aplicacion.m_con_OYG.CommitTrans
    
    insertarNuevoLoteenGrilla Anio, iNroLote, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito, sArticulo_descripcion, sProveedor_descripcion

    ' oBasSQLOYG.CargarGrilla
    ' Refrescar_con_mfg_cueros
    
    frmPrincipal.grdPrincipal.Col = 1
    frmPrincipal.grdPrincipal.Sort = 2  ' Ordenamos por numero de lote en forma descendente
    
    ImprimirFila grdPrincipal.TopRow
    

End Sub



Public Sub insertarNuevoLoteenGrilla(Anio As Integer, iNroLote As Integer, _
lArticulo As Long, dFechaLote As Date, dFechaVto As Date, lProveedor As Long, _
sRemito As String, sArticulo_descripcion As String, sProveedor_descripcion As String)

    With frmPrincipal.grdPrincipal
        .Rows = .Rows + 1
        .Row = .Rows - 1
        .Col = 0
        .Text = Anio
        .Col = 1
        .Text = iNroLote
        .Col = 2
        .Text = Format$(dFechaLote, "dd/mm/yyyy")
        .Col = 3
        .Text = lArticulo ' Cod Oculto
        .Col = 4
        .Text = sArticulo_descripcion
        .Col = 5
        .Text = Format$(dFechaVto, "dd/mm/yyyy")
        .Col = 6
        .Text = lProveedor ' Cod Oculto
        .Col = 7
        .Text = sProveedor_descripcion
        .Col = 8
        .Text = sRemito
    End With
                
End Sub



Public Sub ActualizarLoteenGrilla(Anio As Integer, iNroLote As Integer, _
lArticulo As Long, dFechaLote As Date, dFechaVto As Date, lProveedor As Long, _
sRemito As String, sArticulo_descripcion As String, sProveedor_descripcion As String)

    With frmPrincipal.grdPrincipal
        .Row = .RowSel
        .Col = 0
        .Text = Anio
        .Col = 1
        .Text = iNroLote
        .Col = 2
        .Text = Format$(dFechaLote, "dd/mm/yyyy")
        .Col = 3
        .Text = lArticulo ' Cod Oculto
        .Col = 4
        .Text = sArticulo_descripcion
        .Col = 5
        .Text = Format$(dFechaVto, "dd/mm/yyyy")
        .Col = 6
        .Text = lProveedor ' Cod Oculto
        .Col = 7
        .Text = sProveedor_descripcion
        .Col = 8
        .Text = sRemito
    End With
                
End Sub



Public Sub ActualizarFechaVtoLoteenGrilla(dFechaVto As Date)

    With frmPrincipal.grdPrincipal
        .Row = .RowSel
        .Col = 5
        .Text = Format$(dFechaVto, "dd/mm/yyyy")
    End With
    
                
End Sub


Public Sub EliminarLoteenGrilla()

    With frmPrincipal.grdPrincipal
        .Row = .RowSel
        frmPrincipal.grdPrincipal.RemoveItem .RowSel
    End With
                
End Sub

Private Sub cmdAnulado_Click()
    Dim iNroLote As Integer
    Dim iAnio As Integer
    
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    
    If grdPrincipal.Rows = 0 Then Exit Sub
    
    With grdPrincipal
        .Row = .RowSel
        .Col = 1: iNroLote = .Text
        .Col = 0: iAnio = .Text
    End With
    
    
    
    If vbYes = MsgBox("Esta seguro que desea anular este lote", vbInformation + vbYesNo, "Mensaje de Anulación") Then
    
        aplicacion.m_con_mfg_cueros.BeginTrans
        If Not AnularLote(iNroLote, iAnio) Then
               aplicacion.m_con_mfg_cueros.RollbackTrans
            MsgBox lerror, vbInformation, "OyG"
            Exit Sub
        End If
        If Not oBasSQLOYG.AnularSelectLote(iNroLote, iAnio) Then
            aplicacion.m_con_mfg_cueros.RollbackTrans
            MsgBox lerror, vbInformation, "OyG"
            Exit Sub
        End If
        aplicacion.m_con_mfg_cueros.CommitTrans
        EliminarLoteenGrilla
        ' oBasSQLOYG.CargarGrilla
        ' Refrescar_con_mfg_cueros
    End If
    
End Sub

Private Sub cmdEliminar_Click()
    Dim iAnio As Integer
    Dim ilote As Integer
    
    lblCantidadLotes = lblCantidadLotes - 1
    
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    With grdPrincipal
        ' version mfg .Row = 0
        .Row = 1
        .Col = 0: iAnio = .Text
        .Col = 1: ilote = .Text
    End With
    
    aplicacion.m_con_mfg_cueros.BeginTrans
    aplicacion.m_con_OYG.BeginTrans
    
    If Not EliminarLote(iAnio, ilote) Then
        aplicacion.m_con_mfg_cueros.RollbackTrans
        aplicacion.m_con_OYG.RollbackTrans
        MsgBox "No pudo Eliminar", vbInformation, "OyG"
        Exit Sub
    End If
    
    If Not oBasSQLOYG.EliminarUltimoLote(iAnio, ilote) Then
        aplicacion.m_con_mfg_cueros.RollbackTrans
        aplicacion.m_con_OYG.RollbackTrans
        MsgBox "No pudo Eliminar", vbInformation, "OyG"
        Exit Sub
    End If
    
    aplicacion.m_con_mfg_cueros.CommitTrans
    aplicacion.m_con_OYG.CommitTrans
    
    
    EliminarLoteenGrilla
    
    ' oBasSQLOYG.CargarGrilla
    ' Refrescar_con_mfg_cueros
    
    LimpiarControles
    
End Sub

Private Sub cmdImprimir_Click()
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    ImprimirFila grdPrincipal.RowSel
End Sub

Private Sub cmdModificar_Click()
    Dim iNroLote As Integer
    Dim lArticulo As Long
    Dim lProveedor As Long
    Dim iAnio As Integer
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    Dim sRemito As String
    Dim sProveedor_descripcion As String
    Dim sArticulo_descripcion As String
    
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    
    If grdPrincipal.Rows = 0 Then Exit Sub
    
    With grdPrincipal
        .Row = .RowSel
        .Col = 1: iNroLote = .Text
        .Col = 0: iAnio = .Text
    End With
    
    If Not ValidarCombos(iAnio, True) Then
        Exit Sub
    End If
    
    
    lArticulo = cmbArticulo.ItemData(cmbArticulo.ListIndex)
    lProveedor = cmbProveedor.ItemData(cmbProveedor.ListIndex)
    dFechaLote = CDate(mskFechaLote)
    dFechaVto = Format(CDate(mskVto), "dd/mm/yyyy")
    sRemito = txtRemito1 & "-" & txtRemito2 & "-" & txtRemito3
    sProveedor_descripcion = Me.cmbProveedor.Text
    sArticulo_descripcion = Me.cmbArticulo.Text
    
    aplicacion.m_con_mfg_cueros.BeginTrans
    
     If Not SeleccionarLote(iNroLote, iAnio, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito, sArticulo_descripcion, sProveedor_descripcion) Then
         aplicacion.m_con_mfg_cueros.RollbackTrans
         MsgBox "Error inesperado, no pudo Modificar", vbInformation, "OyG"
         Exit Sub
     End If
    
    If Not oBasSQLOYG.SeleccionarloteModificar(iNroLote, iAnio, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito) Then
        aplicacion.m_con_mfg_cueros.RollbackTrans
        MsgBox "Error inesperado, no pudo Modificar OYG ", vbInformation, "OyG"
        Exit Sub
    End If
    
    aplicacion.m_con_mfg_cueros.CommitTrans
    
    ActualizarLoteenGrilla iAnio, iNroLote, lArticulo, dFechaLote, dFechaVto, lProveedor, sRemito, sArticulo_descripcion, sProveedor_descripcion
    
    ' oBasSQLOYG.CargarGrilla
    'Refrescar_con_mfg_cueros
    LimpiarControles
End Sub

Private Sub cmdProximo_Click()
    txtUbicacion = txtUbicacion + 1
    If txtUbicacion < grdPrincipal.Rows Then
        grdPrincipal.Row = txtUbicacion
    Else
        MsgBox "Ha llegado al Ultimo Registro. No se puede Avanzar", vbInformation + vbOKOnly
    End If
    grdPrincipal.SetFocus

           
    Dim lArticulo As Long
    Dim lProveedor As Long
    Dim sRemito As String
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    
    On Error GoTo ErrorHandler
    
    With grdPrincipal
        If .RowSel = 0 Then
            cmdEliminar.Enabled = True
        Else
            cmdEliminar.Enabled = False
        End If
        .Row = .RowSel
        .Col = 6: lProveedor = .Text
        .Col = 8: sRemito = .Text
        .Col = 3: lArticulo = .Text
        .Col = 2: dFechaLote = .Text
        .Col = 5: dFechaVto = .Text
        .Col = 1
             
        txtUbicacion = grdPrincipal.Row

        
    End With
    
     ForzarItemdata cmbArticulo, lArticulo
     ForzarItemdata cmbProveedor, lProveedor
     txtRemito1 = Mid(sRemito, 1, 1)
     txtRemito2 = Mid(sRemito, 3, 7)
     txtRemito3 = Mid(sRemito, 8)
     
     'mskRemito = sRemito
     txtCodigo = CStr(lArticulo)
     mskFechaLote = Format$((dFechaLote), "dd/mm/yyyy")
     mskVto = Format$((dFechaVto), "dd/mm/yyyy")
     grdPrincipal.SetFocus
     Exit Sub
     
ErrorHandler:
    MsgBox "No pudo leer los Datos de la Grilla", vbInformation, "OyG"

End Sub

Private Sub cmdRefrescar_Click()
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    
    oBasSQLOYG.CargarGrilla
    ' Refrescar_con_mfg_cueros

    LimpiarControles
    txtCodigo.SetFocus
End Sub

Private Sub cmdSalir_Click()
    If vbYes = MsgBox("Desea salir del programa", vbInformation + vbYesNo, "OyG") Then
        End
    End If
End Sub

Private Sub cmdSelect_Click()
    chkHabilitaVto.Value = 0
    mskVto.Enabled = False
    frmSeleccion.Show
End Sub

Private Sub cmdTraerCalen_Click(Index As Integer)
    valor = Index
    MostrarCalendario
End Sub

Private Sub MostrarCalendario()
    With frmCalendar
        .Show
    End With
End Sub

Private Sub cmdVto_Click()
    Dim iNroLote As Integer
    Dim dFechaVto As Date
    Dim iAnio     As Integer
    
    If chkHabilitaVto.Value = 1 Then
        With grdPrincipal
            .Row = .RowSel
            .Col = 1: iNroLote = .Text
            .Col = 0: iAnio = .Text
        End With
        
        dFechaVto = Format(CDate(mskVto), "dd/mm/yyyy")
        
        aplicacion.m_con_mfg_cueros.BeginTrans
        
        If Not SeleccionarLoteVto(iAnio, iNroLote, dFechaVto) Then
            aplicacion.m_con_mfg_cueros.RollbackTrans
            MsgBox "Error inesperado, no pudo Modificar", vbInformation, "OyG"
        End If
        
        If Not oBasSQLOYG.SeleccionarloteModificarVto(iNroLote, dFechaVto) Then
            aplicacion.m_con_mfg_cueros.RollbackTrans
            MsgBox "Error al modificar la fecha de vencimiento en OyG.", vbInformation, "OyG"
            Exit Sub
        End If

        aplicacion.m_con_mfg_cueros.CommitTrans
        

        ActualizarFechaVtoLoteenGrilla dFechaVto
        
        ' oBasSQLOYG.CargarGrilla
        ' Refrescar_con_mfg_cueros
        LimpiarControles
        chkHabilitaVto.Value = 0
        mskVto.Enabled = False
    Else
        MsgBox "No se pudo modificar la fecha de Vto. el campo debe estar habilitado", vbInformation
    End If
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
    
    
    mskFechaLote = Format$(CDate(Now), "dd/mm/YYYY")
    cmdEliminar.Enabled = False
    mskVto.Enabled = False
    
    If App.PrevInstance = True Then
        MsgBox ("EL PROGRAMA YA SE ENCUENTRA ABIERTO" & Chr(13) & "NO SE CARGARA OTRA PANTALLA")
        End
    End If
    

    
End Sub

Sub ImprimirFila(lFila As Long)
    Dim dfecha As Date
    Dim dVto As Date
    Dim lLote As Long, iCopias As Integer
    Dim rs As Recordset, sCommand As String
    Dim lAño As Long
    Dim lmax As Single
    Dim strAnio As String
    Dim strlote As String
    Dim i As Integer
    
    On Error GoTo ErrorHandler
 
    With grdPrincipal
        If lFila < 0 Then
            MsgBox "Debe seleccionar una fila válida", vbInformation + vbOKOnly, "Curtiembre Fonseca"
            Exit Sub
        End If
        
        .Row = lFila
        .Col = 0: lAño = .Text
        .Col = 1: lLote = .Text
        .Col = 2: dfecha = .Text
        .Col = 5: dVto = .Text
    End With
    
    If lAño < 2000 Then
        lAño = lAño - 1900
    Else
        lAño = lAño - 2000
    End If
    
    dlgImprimir.CancelError = True
    dlgImprimir.Copies = 1
    dlgImprimir.ShowPrinter
    
    strAnio = CStr(lAño)
    
    If Len(strAnio) < 2 Then
        For i = 1 To 2 - Len(strAnio)
            strAnio = "0" & strAnio
        Next
    End If
    
    strlote = CStr(lLote)
    
    If Len(strlote) < 5 Then
        For i = 1 To 5 - Len(strlote)
            strlote = "0" & strlote
        Next
    End If
    
    On Error GoTo salida
    
    Printer.Copies = 1
    oImprimeEtiqueta.lote = strAnio + ObtenerLetraDeLote() + strlote
    oImprimeEtiqueta.cantidad_copias = dlgImprimir.Copies
    oImprimeEtiqueta.fecha_lote = Format(dfecha, "dd/mm/yyyy")
    oImprimeEtiqueta.fecha_vencimiento = Format(dVto, "dd/mm/yy")
    oImprimeEtiqueta.empresa = ""
    oImprimeEtiqueta.imprimir
    
        
salida:
    'rs.Close
    Exit Sub

ErrorHandler:
    Select Case Err.Number
        Case 32755
'            MsgBox "Error de impresión", vbInformation
            Exit Sub
        Case Else
            MsgBox "Se ha producido un error desconocido al intentar imprimir.", vbInformation + vbOKOnly, "OyG"
            GoTo salida
    End Select
    
End Sub

Private Sub Frame1_DragDrop(Source As Control, X As Single, Y As Single)

End Sub

Private Sub grdPrincipal_Click()
  ManejaGrilla
End Sub

Private Sub ManejaGrilla()
    Dim lArticulo As Long
    Dim lProveedor As Long
    Dim sRemito As String
    Dim dFechaLote As Date
    Dim dFechaVto As Date
    
    On Error GoTo ErrorHandler
    
    If grdPrincipal.Rows = 0 Then Exit Sub
    
    With grdPrincipal
        ' Version MFG
        ' If .RowSel = 0 Then
        If .RowSel = 1 Then
            cmdEliminar.Enabled = True
        Else
            cmdEliminar.Enabled = False
        End If
        .Row = .RowSel
        .Col = 6: lProveedor = .Text
        .Col = 8: sRemito = .Text
        .Col = 3: lArticulo = .Text
        .Col = 2: dFechaLote = .Text
        .Col = 5: dFechaVto = .Text
        .Col = 1
             
        txtUbicacion = grdPrincipal.Row

        
    End With
    
     ForzarItemdata cmbArticulo, lArticulo
     ForzarItemdata cmbProveedor, lProveedor
     txtRemito1 = Mid(sRemito, 1, 1)
     txtRemito2 = Mid(sRemito, 3, 7)
     txtRemito3 = Mid(sRemito, 8)
     
     'mskRemito = sRemito
     txtCodigo = CStr(lArticulo)
     mskFechaLote = Format$((dFechaLote), "dd/mm/yyyy")
     mskVto = Format$((dFechaVto), "dd/mm/yyyy")
     grdPrincipal.SetFocus
     Exit Sub
     
ErrorHandler:
    MsgBox "No pudo leer los Datos de la Grilla", vbInformation, "OyG"

End Sub
Private Sub mskRemito_GotFocus()
    'SeleccionText mskRemito
End Sub

Private Sub grdPrincipal_KeyPress(KeyAscii As Integer)
    ManejaGrilla
End Sub

Private Sub lbldiahoy_Click()

End Sub

Private Sub Timer1_Timer()
lbldiahoy = Format(Now, "long date") & " - " & Format(Now, "long time")
End Sub

Private Sub txtCodigo_GotFocus()
    SeleccionText txtCodigo
End Sub

Private Sub txtCodigo_KeyPress(KeyAscii As Integer)
    Dim lArticulo As Long
    
    If KeyAscii = 13 Then
        If (Val(txtCodigo.Text) >= 100000) And (Val(txtCodigo.Text) < 200000) Then
            lArticulo = txtCodigo.Text
            If ForzarItemdata(cmbArticulo, lArticulo) Then
                MsgBox "Código de articulo inexistente.", vbInformation + vbDefaultButton1, "OyG"
            End If
        Else
            MsgBox "El Rango de los Artículos son del 100.000 al 199.999", vbInformation, "OyG"
            'txtCodigo.Text = "______"
        End If
    Else
        Validar KeyAscii
    End If
End Sub


Private Sub txtFechaLote_GotFocus()
    SeleccionText mskFechaLote
End Sub

Private Sub txtFechaLote_LostFocus()
   cmbArticulo_Click
End Sub

Private Function ValidarCombos(ByRef Anio As Integer, Optional Modificar As Boolean) As Boolean
    If cmbArticulo.ListIndex = -1 Then
        MsgBox "Debe seleccionar artículo", vbInformation, "OyG"
        ValidarCombos = False
        Exit Function
    End If
    
    If cmbProveedor.ListIndex = -1 Then
        MsgBox "Debe seleccionar proveedor", vbInformation, "OyG"
        ValidarCombos = False
        Exit Function
    End If
    
    If txtRemito1.Text = "" Or txtRemito2 = "" Or txtRemito3 = "" Then
    'If mskRemito = "" Then
        MsgBox "Debe completar el Remito", vbInformation, "OyG"
        txtRemito1.SetFocus
        ValidarCombos = False
        Exit Function
    End If
        
    If Not Modificar Then
        Anio = Year(CDate(mskFechaLote))
        If (Anio > Year(CDate(Now))) Or (CDate(mskFechaLote) > Format$(CDate(Now), "dd/mm/YYYY")) Then
            MsgBox "La Fecha Lote no puede ser mayor a la fecha actual", vbInformation, "OyG"
            ValidarCombos = False
            Exit Function
        End If
    Else
        
        If (Anio <> Year(CDate(mskFechaLote))) Then
            MsgBox "La Fecha Lote no puede ser mayor a la fecha actual", vbInformation, "OyG"
            ValidarCombos = False
            Exit Function
        End If
    End If
    ValidarCombos = True
    
End Function

Private Sub txtCodProveedor_KeyPress(KeyAscii As Integer)
    Dim l_Proveedor As Long
    If KeyAscii = 13 Then
            l_Proveedor = Me.txtCodProveedor.Text
            If ForzarItemdata(Me.cmbProveedor, l_Proveedor) Then
                MsgBox "Código de proveedor inexistente.", vbInformation + vbDefaultButton1
                Me.txtCodProveedor.SetFocus
                Exit Sub
            End If
    Else
        Validar KeyAscii
    End If
End Sub

Private Sub txtRemito1_Change()
    If Len(txtRemito1) = 1 Then
        txtRemito1 = UCase(txtRemito1.Text)
        txtRemito2.SetFocus
    End If
End Sub

Private Sub txtRemito1_GotFocus()
    SeleccionText txtRemito1
End Sub

Private Sub txtRemito1_KeyPress(KeyAscii As Integer)
    ValidarString KeyAscii
End Sub

Private Sub txtRemito2_Change()
    If txtRemito1 = "" Then Exit Sub
    If Len(txtRemito2) = 4 Then
        txtRemito3.SetFocus
    End If
End Sub

Private Sub txtRemito2_GotFocus()
    SeleccionText txtRemito2
End Sub

Private Sub txtRemito2_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtRemito2_LostFocus()
    If txtRemito1 = "" Then Exit Sub
    CompletarRemitoConCeros txtRemito2
End Sub

Private Sub CompletarRemitoConCeros(oText As TextBox)
    Dim sPrimeraLetra As String
    Dim i As Integer
    Dim sRemito As String
    Dim sRtoAux As String
    Dim sCeros As String
    Dim sValor As Integer
    
    If oText.Name = "txtRemito2" Then
        sValor = 4
        sRemito = txtRemito2
    Else
        sValor = 8
        sRemito = txtRemito3
    End If
        
    For i = 1 To sValor - Len(oText)
        sCeros = sCeros & "0"
    Next
    oText.Text = sCeros & sRemito
            
    If txtRemito3 = "" Then Exit Sub
    sPrimeraLetra = txtRemito1
    Select Case sPrimeraLetra
        Case "A", "B", "C", "R", "X", "_"
            'txtRemito = CompletarConCeros(txtRemito)
        Case Else
            MsgBox "Las únicas Letras permitidas para los Remitos son: A, B, C, R, X ", vbInformation, "OyG"
            txtRemito1.SetFocus
            SeleccionText txtRemito1
    End Select
    
End Sub




Private Sub txtRemito3_GotFocus()
    SeleccionText txtRemito3
End Sub

Private Sub txtRemito3_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtRemito3_LostFocus()
    If txtRemito1 = "" Or txtRemito2 = "" Then Exit Sub
    CompletarRemitoConCeros txtRemito3
End Sub


Private Sub txtVto_GotFocus()
    SeleccionText mskVto
End Sub

Private Sub txtUltimo_Click()
    
    If grdPrincipal.Rows = 0 Then Exit Sub
    grdPrincipal.Row = grdPrincipal.Rows - 1 'lblCantidadLotes - 1
    txtUbicacion = lblCantidadLotes
    grdPrincipal.SetFocus

End Sub
