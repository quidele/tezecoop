VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "PROGRESS - SQL TESTING"
   ClientHeight    =   7290
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   9240
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7290
   ScaleWidth      =   9240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmd_Update 
      Caption         =   "update  SQL"
      Height          =   390
      Left            =   4110
      TabIndex        =   6
      Top             =   2055
      Width           =   1905
   End
   Begin VB.CommandButton cmdInsert 
      Caption         =   "Insert  SQL"
      Height          =   390
      Left            =   2100
      TabIndex        =   5
      Top             =   2055
      Width           =   1905
   End
   Begin VB.CommandButton cmdCorrerSQL 
      Caption         =   "Correr SQL"
      Height          =   390
      Left            =   90
      TabIndex        =   4
      Top             =   2055
      Width           =   1905
   End
   Begin VB.TextBox txtRespuesta 
      Appearance      =   0  'Flat
      Height          =   4350
      Left            =   75
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Text            =   "frm_progress-sql.frx":0000
      Top             =   2820
      Width           =   9060
   End
   Begin VB.TextBox txtSQL 
      Appearance      =   0  'Flat
      Height          =   1560
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   360
      Width           =   9030
   End
   Begin VB.Label frm_progress_sql_test 
      Caption         =   "resultados SQL"
      Height          =   240
      Left            =   120
      TabIndex        =   3
      Top             =   2535
      Width           =   1830
   End
   Begin VB.Label Label1 
      Caption         =   "Sentencia SQL"
      Height          =   300
      Left            =   90
      TabIndex        =   2
      Top             =   105
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Const CANTIDAD_MAXIMA_REGISTROS = 2000

Dim oConexion As New ADODB.Connection


Private Sub cmd_Update_Click()

   oConexion.BeginTrans
    
    On Error Resume Next
    oConexion.Execute (Me.txtSQL.Text)
    
    If Err Then
        oConexion.RollbackTrans
        Me.txtRespuesta.Text = Err.Description
        Exit Sub
    End If
    
    Me.txtRespuesta.Text = "Registro actualizado OK"
    oConexion.CommitTrans
    
End Sub

Private Sub cmdCorrerSQL_Click()

    Select_testing

End Sub



Private Sub cmdInsert_Click()

    oConexion.BeginTrans
    
    On Error Resume Next
    oConexion.Execute (Me.txtSQL.Text)
    
    If Err Then
        oConexion.RollbackTrans
        Me.txtRespuesta.Text = Err.Description
        Exit Sub
    End If
    
    Me.txtRespuesta.Text = "Registro insertado ok"
    oConexion.CommitTrans

End Sub

Private Sub Command1_Click()
    
 
End Sub

Private Sub Form_Load()

    AbrirConexion

End Sub


Public Function AbrirConexion() As Connection
    
    oConexion.ConnectionString = "DSN=cueros prueba;UID=sysprogress;PWD=sysprogress"
    ' oConexion.ConnectionString = "DSN=ebfonsep;UID=sysprogress;PWD=sysprogress"
    oConexion.Open
    
    
End Function




Public Function Select_testing()
Dim rs As ADODB.Recordset
Dim strLinea As String
Dim i                As Integer
Dim icant_regis      As Integer


    Me.txtRespuesta.Text = ""
    If Me.txtSQL.Text = "" Then Exit Function
    
    On Error Resume Next
    Set rs = oConexion.Execute(Me.txtSQL.Text)
       
    icant_regis = 0
    
    Do Until rs.EOF
        If icant_regis > CANTIDAD_MAXIMA_REGISTROS Then
            Exit Function
        End If
        If icant_regis = 0 Then
            For i = 0 To rs.Fields.Count - 1
                strLinea = strLinea + CStr(rs(i).Name) + vbTab
            Next
            Me.txtRespuesta.Text = Me.txtRespuesta.Text + strLinea + vbCrLf
        End If
        strLinea = ""
        For i = 0 To rs.Fields.Count - 1
            strLinea = strLinea + CStr(rs(i)) + vbTab
        Next
        strLinea = strLinea + vbCrLf
        Me.txtRespuesta.Text = Me.txtRespuesta.Text + strLinea
        rs.MoveNext
        icant_regis = icant_regis + 1
    Loop
    
    If Err Then
        Me.txtRespuesta.Text = Me.txtRespuesta.Text + Err.Description
    End If
    
    On Error GoTo 0

End Function




