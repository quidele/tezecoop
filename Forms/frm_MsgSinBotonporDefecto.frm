VERSION 5.00
Begin VB.Form frm_MsgSinBotonporDefecto 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Seleccionar Puesto"
   ClientHeight    =   1815
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   4455
   Icon            =   "frm_MsgSinBotonporDefecto.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1815
   ScaleWidth      =   4455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmd 
      Cancel          =   -1  'True
      Caption         =   "NO"
      Height          =   375
      Index           =   1
      Left            =   1230
      TabIndex        =   3
      Top             =   1350
      Width           =   1050
   End
   Begin VB.CommandButton cmd 
      Caption         =   "SI"
      Height          =   375
      Index           =   0
      Left            =   105
      TabIndex        =   2
      Top             =   1350
      Width           =   1050
   End
   Begin VB.PictureBox pnl 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      ForeColor       =   &H80000008&
      Height          =   1155
      Index           =   2
      Left            =   120
      ScaleHeight     =   1125
      ScaleWidth      =   4215
      TabIndex        =   0
      Top             =   105
      Width           =   4245
      Begin VB.TextBox txtMsg 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   105
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   4
         Top             =   120
         Width           =   3990
      End
      Begin VB.CommandButton cmd 
         Caption         =   "..."
         Height          =   330
         Index           =   2
         Left            =   5955
         TabIndex        =   1
         Top             =   240
         Width           =   330
      End
   End
End
Attribute VB_Name = "frm_MsgSinBotonporDefecto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub cmd_Click(Index As Integer)

    Select Case Index
    Case 0
        objParametros.GrabarValor "frm_MsgSinBotonporDefecto.respuesta", "SI"
    Case Else
        objParametros.GrabarValor "frm_MsgSinBotonporDefecto.respuesta", "NO"
    End Select
    Unload Me
    
End Sub

Private Sub Form_Activate()

 
    
    Me.txtMsg.Text = objParametros.ObtenerValor("frm_MsgSinBotonporDefecto.mensaje")
    Me.txtMsg.SetFocus
    
    
End Sub

Private Sub Form_Load()

    objParametros.GrabarValor "frm_MsgSinBotonporDefecto.respuesta", "NO"

End Sub
