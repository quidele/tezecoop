VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   60
   ClientTop       =   360
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   855
      Left            =   720
      TabIndex        =   0
      Top             =   1200
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim programa As Object
Dim strSQL   As String
Dim resultado As String

Set programa = CreateObject("fonseca_libCOM.AdmMagmaDatos")

strSQL = " EXEC dbo.spu_NotificaViaMail_CompletoV_1_1 'PRUEBA COM VB6', 'PRUEBA COM VB6', 'quidele' "
    

    resultado = programa.ejecutarSQL(strSQL)

End Sub

