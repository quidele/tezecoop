VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   1545
   ClientLeft      =   2835
   ClientTop       =   3480
   ClientWidth     =   4590
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   912.837
   ScaleMode       =   0  'User
   ScaleWidth      =   4309.762
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbEmpresa 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   1080
      Width           =   3015
   End
   Begin VB.TextBox txtUserName 
      Appearance      =   0  'Flat
      Height          =   345
      Left            =   1440
      TabIndex        =   1
      Top             =   135
      Width           =   1845
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   345
      Left            =   3360
      TabIndex        =   4
      Top             =   120
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   345
      Left            =   3360
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   480
      Width           =   1140
   End
   Begin VB.TextBox txtPassword 
      Appearance      =   0  'Flat
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1440
      PasswordChar    =   "*"
      TabIndex        =   2
      Top             =   525
      Width           =   1845
   End
   Begin VB.Label lblEmpresa 
      AutoSize        =   -1  'True
      Caption         =   "&Empresa"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   840
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Usuario"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Index           =   0
      Left            =   105
      TabIndex        =   0
      Top             =   150
      Width           =   840
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Password:"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Index           =   1
      Left            =   105
      TabIndex        =   3
      Top             =   540
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Type tEmpresas
    nombre As String
    base As String
End Type

Public LoginSucceeded As Boolean
Dim vEmpresas() As tEmpresas

Private Sub cmbEmpresa_Change()
    
    
    If Me.txtUserName.Text = "" Then Exit Sub
    If Me.txtPassword.Text = "" Then Exit Sub
    
    
    If Me.cmbEmpresa.ListCount < 1 Then Exit Sub
    
    oEmpresa.nombre = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).nombre
    oEmpresa.database = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).base
    aplicacion.base = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).base
    cmdOK.Enabled = True
    
End Sub

Private Sub cmbEmpresa_Click()

    If Me.cmbEmpresa.ListCount < 1 Then Exit Sub
    If Me.txtUserName.Text = "" Then Exit Sub
    If Me.txtPassword.Text = "" Then Exit Sub
    
    oEmpresa.nombre = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).nombre
    oEmpresa.database = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).base
    aplicacion.base = vEmpresas(cmbEmpresa.ItemData(cmbEmpresa.ListIndex)).base
    cmdOK.Enabled = True
    
End Sub

Private Sub cmbEmpresa_GotFocus()


    
    If Me.txtUserName.Text = "" Then Exit Sub
    If Me.txtPassword.Text = "" Then Exit Sub
    
    If Me.cmbEmpresa.ListCount < 1 Then
            If LlenarComboEmpresa Then
            cmbEmpresa.Enabled = True
            cmbEmpresa.SetFocus
        End If
    End If
        
        
    If Me.cmbEmpresa.ListCount < 1 Then Exit Sub
    
    
    txtUserName.Enabled = False
    txtPassword.Enabled = False
    
    
End Sub

Private Sub cmdCancel_Click()
    MsgBox " No puede Conectarse con el Servidor. Terminando el Programa ", vbCritical + vbOKOnly
    End
End Sub

Private Sub cmdOK_Click()
    
    oEmpresa.usuario = txtUserName
    oEmpresa.password = txtPassword
    Unload Me
    
End Sub

Private Sub Form_Load()

    Me.Caption = Me.Caption + " - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
    
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Or KeyAscii = vbKeyTab Then
        If LlenarComboEmpresa Then
            cmbEmpresa.Enabled = True
            cmbEmpresa.SetFocus
        End If
    End If
End Sub


Private Sub txtPassword_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeyReturn Or KeyCode = vbKeyTab Then
        If LlenarComboEmpresa Then
            cmbEmpresa.SetFocus
        End If
    End If
End Sub


Private Function LlenarComboEmpresa() As Boolean
    Dim rs As Recordset
    Dim i As Integer
    
    On Error GoTo ErrorHandler

    Set rs = oEmpresa.obtenerEmpresas()
    Set oEmpresa = Nothing
    
    ReDim vEmpresas(0)
    
    If Not rs Is Nothing Then
        Do While Not rs.EOF
            ReDim Preserve vEmpresas(UBound(vEmpresas) + 1)
            vEmpresas(UBound(vEmpresas) - 1).nombre = Trim(rs("nombre"))
            vEmpresas(UBound(vEmpresas) - 1).base = Trim(rs("base"))
            rs.MoveNext
        Loop
        For i = 0 To UBound(vEmpresas) - 1
            With cmbEmpresa
                .AddItem vEmpresas(i).nombre
                .ItemData(.NewIndex) = i

            End With
        Next
        LlenarComboEmpresa = True
    Else
        LlenarComboEmpresa = False
    End If
    
    Exit Function
    
ErrorHandler:
    LlenarComboEmpresa = False
    
End Function

