VERSION 5.00
Begin VB.Form frm_Splash 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   ClientHeight    =   4920
   ClientLeft      =   1020
   ClientTop       =   1650
   ClientWidth     =   8880
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   8880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   3000
      Left            =   -45
      Picture         =   "frmSplash.frx":000C
      ScaleHeight     =   3000
      ScaleWidth      =   4785
      TabIndex        =   0
      Top             =   1260
      Width           =   4785
   End
   Begin VB.PictureBox Picture2 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1515
      Left            =   -75
      Picture         =   "frmSplash.frx":69C3
      ScaleHeight     =   1515
      ScaleWidth      =   8955
      TabIndex        =   1
      Top             =   -90
      Width           =   8955
   End
   Begin VB.Timer Timer1 
      Interval        =   4000
      Left            =   7860
      Top             =   3480
   End
   Begin VB.Label lblversion 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Versión 1.0"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   300
      Left            =   5070
      TabIndex        =   5
      Top             =   3750
      Width           =   3540
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Viajes"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   600
      Left            =   5010
      TabIndex        =   4
      Top             =   3045
      Width           =   3540
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Gestión de"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   600
      Left            =   5040
      TabIndex        =   3
      Top             =   2460
      Width           =   3540
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Sistema de"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   600
      Left            =   5040
      TabIndex        =   2
      Top             =   1860
      Width           =   3540
   End
End
Attribute VB_Name = "frm_Splash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim contar As Integer
Dim objExecCmd As New CEjeProgramas

Private Sub Form_Activate()

    
    If App.LogMode = MODO_DEBUG Then
        ' Realizar Pruebas
        Me.Visible = False
    End If


    Screen.MousePointer = vbHourglass
    objProductos.buscarTodoslosProductos
    Screen.MousePointer = vbDefault
    Unload Me
    
    ' Agregado v4.6
    On Error Resume Next
    objExecCmd.ExecCmd ("InstalarComponentes.bat")
    On Error GoTo 0
    'MsgBox "Componentes instalados OK"

    
    
    
End Sub

Private Sub Form_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
End Sub

Private Sub Form_Load()

    Me.lblversion.Caption = "Acceso - Versión " + CStr(App.Major) + "." + CStr(App.Minor)
    Me.Timer1.Enabled = True
    
   
        
End Sub


