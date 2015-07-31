VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmSeleccion 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Selección "
   ClientHeight    =   5235
   ClientLeft      =   1395
   ClientTop       =   1455
   ClientWidth     =   6090
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5235
   ScaleWidth      =   6090
   ShowInTaskbar   =   0   'False
   Begin VB.OptionButton optFechaVto 
      Caption         =   "Fecha Vto."
      Height          =   255
      Left            =   2400
      TabIndex        =   12
      Top             =   480
      Width           =   1095
   End
   Begin VB.OptionButton optLotes 
      Caption         =   "Año y Lotes"
      Height          =   255
      Left            =   4440
      TabIndex        =   13
      Top             =   480
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Rangos"
      Height          =   5055
      Left            =   120
      TabIndex        =   14
      Top             =   120
      Width           =   5895
      Begin VB.OptionButton optFecha 
         Caption         =   "Fecha"
         Height          =   255
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   975
      End
      Begin VB.Frame Frame5 
         Caption         =   "Fechas"
         Height          =   975
         Left            =   120
         TabIndex        =   28
         Top             =   720
         Width           =   5655
         Begin VB.CommandButton cmdTraerCalen 
            Caption         =   "..."
            Height          =   315
            Index           =   1
            Left            =   5100
            TabIndex        =   30
            Top             =   480
            Width           =   315
         End
         Begin VB.CommandButton cmdTraerCalen 
            Caption         =   "..."
            Height          =   315
            Index           =   0
            Left            =   1950
            TabIndex        =   29
            Top             =   480
            Width           =   315
         End
         Begin VB.TextBox txtFechaHasta 
            Height          =   315
            Left            =   3240
            MaxLength       =   10
            TabIndex        =   1
            Top             =   480
            Width           =   1800
         End
         Begin VB.TextBox txtFechaDesde 
            Height          =   315
            Left            =   120
            MaxLength       =   10
            TabIndex        =   0
            Top             =   480
            Width           =   1800
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Hasta"
            Height          =   195
            Index           =   1
            Left            =   3240
            TabIndex        =   32
            Top             =   240
            Width           =   420
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Desde"
            Height          =   195
            Index           =   0
            Left            =   120
            TabIndex        =   31
            Top             =   240
            Width           =   465
         End
      End
      Begin VB.CommandButton cmdCancelar 
         Caption         =   "&Cancelar"
         Height          =   400
         Left            =   4800
         TabIndex        =   10
         Top             =   4530
         Width           =   1000
      End
      Begin VB.CommandButton cmdSelect 
         Caption         =   "&Selección"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   400
         Left            =   4800
         TabIndex        =   8
         Top             =   3580
         Width           =   1000
      End
      Begin VB.CommandButton cmdReporte 
         Caption         =   "&Reporte"
         Height          =   400
         Left            =   4800
         TabIndex        =   9
         Top             =   4060
         Width           =   1000
      End
      Begin VB.Frame Frame2 
         Caption         =   "Fecha de Vto."
         Height          =   975
         Left            =   120
         TabIndex        =   23
         Top             =   1800
         Width           =   5655
         Begin VB.TextBox txtVtoFechaDesde 
            BackColor       =   &H8000000E&
            Height          =   315
            Left            =   120
            MaxLength       =   10
            TabIndex        =   2
            Top             =   480
            Width           =   1800
         End
         Begin VB.TextBox txtVtoFechaHasta 
            Height          =   315
            Left            =   3240
            MaxLength       =   10
            TabIndex        =   3
            Top             =   480
            Width           =   1800
         End
         Begin VB.CommandButton cmdTraerCalen 
            Caption         =   "..."
            Height          =   315
            Index           =   2
            Left            =   1980
            TabIndex        =   25
            Top             =   480
            Width           =   315
         End
         Begin VB.CommandButton cmdTraerCalen 
            Caption         =   "..."
            Height          =   315
            Index           =   3
            Left            =   5100
            TabIndex        =   24
            Top             =   480
            Width           =   315
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Desde"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   27
            Top             =   240
            Width           =   465
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Hasta"
            Height          =   195
            Index           =   3
            Left            =   3240
            TabIndex        =   26
            Top             =   240
            Width           =   420
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Años"
         Height          =   975
         Left            =   120
         TabIndex        =   18
         Top             =   2880
         Width           =   4575
         Begin VB.TextBox txtAnoDesde 
            Height          =   315
            Left            =   120
            MaxLength       =   4
            TabIndex        =   4
            Top             =   480
            Width           =   760
         End
         Begin VB.TextBox txtAnoHasta 
            Height          =   315
            Left            =   3240
            MaxLength       =   4
            TabIndex        =   5
            Top             =   480
            Width           =   760
         End
         Begin ComCtl2.UpDown UpDown2 
            Height          =   315
            Left            =   4005
            TabIndex        =   19
            Top             =   480
            Width           =   240
            _ExtentX        =   476
            _ExtentY        =   556
            _Version        =   327681
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown UpDown1 
            Height          =   315
            Left            =   900
            TabIndex        =   20
            Top             =   480
            Width           =   240
            _ExtentX        =   476
            _ExtentY        =   556
            _Version        =   327681
            Enabled         =   -1  'True
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Desde"
            Height          =   195
            Index           =   4
            Left            =   120
            TabIndex        =   22
            Top             =   240
            Width           =   465
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Hasta"
            Height          =   195
            Index           =   5
            Left            =   3240
            TabIndex        =   21
            Top             =   240
            Width           =   420
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Lotes"
         Height          =   975
         Left            =   120
         TabIndex        =   15
         Top             =   3960
         Width           =   4575
         Begin VB.TextBox txtLoteDesde 
            Height          =   315
            Left            =   120
            MaxLength       =   6
            TabIndex        =   6
            Top             =   480
            Width           =   1005
         End
         Begin VB.TextBox txtLoteHasta 
            Height          =   315
            Left            =   3240
            MaxLength       =   6
            TabIndex        =   7
            Top             =   480
            Width           =   1000
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Desde"
            Height          =   195
            Index           =   6
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   465
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Hasta"
            Height          =   195
            Index           =   7
            Left            =   3240
            TabIndex        =   16
            Top             =   240
            Width           =   420
         End
      End
   End
End
Attribute VB_Name = "frmSeleccion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const k_Gris = &HC0C0C0

Private Sub cmdCancelar_Click()
    Unload Me
End Sub


Private Sub cmdSelect_Click()
    Seleccionar
End Sub

Private Sub cmdTraerCalen_Click(Index As Integer)
    valor = Index
    MostrarCalendario
End Sub


Public Sub cargarFechas()

    Select Case valor
        Case 0
            txtFechaDesde = GetFecha()
        Case 1
            txtFechaHasta = GetFecha()
        Case 2
            txtVtoFechaDesde = GetFecha()
        Case 3
            txtVtoFechaHasta = GetFecha()
        Case 4
            txtAnoDesde = Year(GetFecha())
        Case 5
            txtAnoHasta = Year(GetFecha())
            
        Case Else
        
    End Select
End Sub

Private Sub MostrarCalendario()
    With frmCalendar
        .Show
    End With
End Sub


Private Sub Form_Load()
    txtFechaDesde = #1/1/1900#
    txtFechaHasta = #1/1/2100#
    txtVtoFechaDesde = #1/1/1900#
    txtVtoFechaHasta = #1/1/2100#
    txtAnoDesde = 1900
    txtAnoHasta = 2100
    txtLoteDesde = 1
    txtLoteHasta = 10000
    optFecha = True
End Sub

Private Function GetFecha() As Date
    GetFecha = frmCalendar.Calendario.Value
End Function

Private Sub Seleccionar()
    Dim dFechaLoteDesde As Date
    Dim dFechaLoteHasta As Date
    Dim dFechaVtoDesde As Date
    Dim dFechaVtoHasta As Date
    Dim iAnioDesde As Integer
    Dim iAnioHasta As Integer
    Dim iLoteDesde As Integer
    Dim iLoteHasta As Integer
    
    On Error GoTo ErrorHandler
    
    Screen.MousePointer = vbHourglass
    
    If txtFechaDesde = "" Or txtFechaHasta = "" Or txtVtoFechaDesde = "" Or txtVtoFechaHasta = "" _
    Or txtAnoDesde = "" Or txtAnoHasta = "" Or txtLoteDesde = "" Or txtLoteHasta = "" Then
        MsgBox "Todos los campos deben estar completos", vbInformation, "OYG"
        Screen.MousePointer = vbNormal
        Exit Sub
    Else
        dFechaLoteDesde = txtFechaDesde
        dFechaLoteHasta = txtFechaHasta
        dFechaVtoDesde = txtVtoFechaDesde
        dFechaVtoHasta = txtVtoFechaHasta
        iAnioDesde = txtAnoDesde
        iAnioHasta = txtAnoHasta
        iLoteDesde = txtLoteDesde
        iLoteHasta = txtLoteHasta
    End If
    
    oBasSQLOYG.SeleccionarPorFiltros txtFechaDesde, txtFechaHasta, txtVtoFechaDesde, _
    txtVtoFechaHasta, txtAnoDesde, txtAnoHasta, txtLoteDesde, txtLoteHasta
    
    ' SeleccionarFiltros txtFechaDesde, txtFechaHasta, txtVtoFechaDesde, _
    ' txtVtoFechaHasta, txtAnoDesde, txtAnoHasta, txtLoteDesde, txtLoteHasta
    
    Screen.MousePointer = vbNormal
    Unload Me
    
Exit Sub
ErrorHandler:
    Screen.MousePointer = vbNormal
    Select Case Err.Number
        Case 3421
            MsgBox "Error al ingresar los datos", vbInformation
            Exit Sub
        Case Else
            MsgBox "Error desconocido, la consulta no se realizará", vbInformation
            Exit Sub
    End Select

End Sub

Private Sub optFecha_Click()
    optFechaVto = False
    optLotes = False
    ManejaControles
End Sub

Private Sub optFechaVto_Click()
    optFecha = False
    optLotes = False
    ManejaControles
End Sub

Private Sub optLotes_Click()
    optFechaVto = False
    optFecha = False
    ManejaControles
End Sub

Private Sub txtAnoDesde_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtAnoHasta_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtFechaDesde_LostFocus()
    SoloFecha txtFechaDesde.Text, Me.txtFechaDesde
End Sub

Private Sub txtFechaHasta_LostFocus()
    SoloFecha txtFechaHasta.Text, Me.txtFechaHasta
End Sub

Private Sub txtLoteDesde_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtLoteHasta_KeyPress(KeyAscii As Integer)
    Validar KeyAscii
End Sub

Private Sub txtVtoFechaDesde_LostFocus()
    SoloFecha txtVtoFechaDesde.Text, Me.txtVtoFechaDesde
End Sub

Private Sub txtVtoFechaHasta_LostFocus()
    SoloFecha txtVtoFechaHasta.Text, Me.txtVtoFechaHasta
End Sub

Private Sub UpDown1_DownClick()
    If Not txtAnoDesde <= 1900 Then
        txtAnoDesde = txtAnoDesde - 1
    End If
End Sub

Private Sub UpDown1_UpClick()
    If Not txtAnoDesde > 2100 Then
        txtAnoDesde = txtAnoDesde + 1
    End If
End Sub

Private Sub UpDown2_DownClick()
    If Not txtAnoHasta <= 1900 Then
        txtAnoHasta = txtAnoHasta - 1
    End If
End Sub

Private Sub UpDown2_UpClick()
    If Not txtAnoHasta >= 2100 Then
        txtAnoHasta = txtAnoHasta + 1
    End If
End Sub

Private Sub ManejaControles()
    
    If optFecha Then
        txtFechaDesde.Enabled = True
        txtFechaDesde.BackColor = vbWhite
        txtFechaHasta.Enabled = True
        txtFechaHasta.BackColor = vbWhite
        
        txtVtoFechaDesde.Enabled = False
        txtVtoFechaDesde.BackColor = k_Gris
        txtVtoFechaHasta.Enabled = False
        txtVtoFechaHasta.BackColor = k_Gris
        
        txtLoteDesde.Enabled = False
        txtLoteDesde.BackColor = k_Gris
        txtLoteHasta.Enabled = False
        txtLoteHasta.BackColor = k_Gris
        
        txtAnoDesde.Enabled = False
        txtAnoDesde.BackColor = k_Gris
        txtAnoHasta.Enabled = False
        txtAnoHasta.BackColor = k_Gris
    ElseIf optFechaVto Then
        txtFechaDesde.Enabled = False
        txtFechaDesde.BackColor = k_Gris
        txtFechaHasta.Enabled = False
        txtFechaHasta.BackColor = k_Gris
        
        txtVtoFechaDesde.Enabled = True
        txtVtoFechaDesde.BackColor = vbWhite
        txtVtoFechaHasta.Enabled = True
        txtVtoFechaHasta.BackColor = vbWhite
        
        txtLoteDesde.Enabled = False
        txtLoteDesde.BackColor = k_Gris
        txtLoteHasta.Enabled = False
        txtLoteHasta.BackColor = k_Gris
        
        txtAnoDesde.Enabled = False
        txtAnoDesde.BackColor = k_Gris
        txtAnoHasta.Enabled = False
        txtAnoHasta.BackColor = k_Gris
    ElseIf optLotes Then
        txtFechaDesde.Enabled = False
        txtFechaDesde.BackColor = k_Gris
        txtFechaHasta.Enabled = False
        txtFechaHasta.BackColor = k_Gris
        
        txtVtoFechaDesde.Enabled = False
        txtVtoFechaDesde.BackColor = k_Gris
        txtVtoFechaHasta.Enabled = False
        txtVtoFechaHasta.BackColor = k_Gris
        
        txtLoteDesde.Enabled = True
        txtLoteDesde.BackColor = vbWhite
        txtLoteHasta.Enabled = True
        txtLoteHasta.BackColor = vbWhite
        
        txtAnoDesde.Enabled = True
        txtAnoDesde.BackColor = vbWhite
        txtAnoHasta.Enabled = True
        txtAnoHasta.BackColor = vbWhite
    End If

End Sub

Private Function SoloFecha(dfecha As String, txt As TextBox) As Boolean
    If txt.Text <> "" Then
        If Not IsDate(dfecha) Then
            MsgBox "No es una Fecha Válida", vbInformation, "OyG"
            txt.Text = ""
            txt.SetFocus
        End If
    End If
End Function
