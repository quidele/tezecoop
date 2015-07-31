VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6336
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   10140
   LinkTopic       =   "Form1"
   ScaleHeight     =   6336
   ScaleWidth      =   10140
   StartUpPosition =   3  'Windows Default
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   6012
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9852
      _ExtentX        =   17378
      _ExtentY        =   10605
      _Version        =   393216
      Appearance      =   0
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' variable para la clase
Dim tTip As Class1

Private Sub Form_Load()
    Dim i As Integer
    
    With MSFlexGrid1
    
        .FixedCols = 0
        ' Agrega 3 cabeceras
        .FormatString = "   Columna 1|  Columna 2|  Columna3"
        
        Randomize
        ' agrega algunos datos
        For i = 1 To 12
            .AddItem i & vbTab & MonthName(i) & vbTab & _
                                FormatCurrency(Rnd * i, 2)
        Next
    End With
       
   ' Crear una nueva instancia de la clase
   Set tTip = New Class1
   
   ' Establece El tipo ( balloon o normal )
   tTip.Estilo = TTBalloon
   ' Indica el icono a utilizar ( info, Warning , error etc..)
   tTip.Icono = TTIconInfo
   tTip.Delay = 50 ' Tiempo de duración

End Sub


' Despliega el Tip al posar el puntero
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub MSFlexGrid1_MouseMove(Button As Integer, _
                                  Shift As Integer, _
                                  x As Single, y As Single)
  
  ' para almacenar la fila y columna actual donde está el puntero
  Static f As Long
  Static c As Long
  
  With MSFlexGrid1
    ' verifica que el mouse está en una columna o fila
    If .MouseRow > 0 And .MouseCol >= 0 Then
          
          If f <> .MouseRow Or c <> .MouseCol Then
             ' almacena la fila y columna actual
             f = .MouseRow
             c = .MouseCol
             
             ' texto y titulo
             tTip.Titulo = "Ejemplo"
             tTip.Texto = "Texto de la celda :" & _
                         .TextMatrix(.MouseRow, .MouseCol)
                
             tTip.Crear .hwnd ' crea el Tips
           End If
    Else
        ' Lo destruye
        tTip.Destroy
    End If
  End With
End Sub

