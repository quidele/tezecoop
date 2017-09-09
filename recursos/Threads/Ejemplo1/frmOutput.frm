VERSION 5.00
Begin VB.Form frmOutput 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   570
      Left            =   2580
      TabIndex        =   1
      Top             =   945
      Width           =   1095
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   585
      Left            =   360
      TabIndex        =   0
      Top             =   990
      Width           =   1500
   End
   Begin VB.Label txtStream2 
      Caption         =   "HILO 2"
      Height          =   360
      Left            =   525
      TabIndex        =   3
      Top             =   2355
      Width           =   2160
   End
   Begin VB.Label txtStream1 
      Caption         =   "HILO 1"
      Height          =   360
      Left            =   510
      TabIndex        =   2
      Top             =   1980
      Width           =   2160
   End
End
Attribute VB_Name = "frmOutput"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' The form contains two command buttons to start and
' stop the thread. When the command button is
' pressed the thread for test_function is created, a
' second thread for test_function2 is created, and a
' event object used to signal termination of all looping
' is created. When the stop button is pressed, a signal
' is broadcast for the event object handle and the
' thread handles are terminated.


Private Sub cmdStart_Click()
Dim lpThreadID As Long

lThreadHandle1 = CreateThread(ByVal 0&, ByVal 0&, AddressOf test_function, ByVal 0&, 0, lpThreadID)
lThreadHandle2 = CreateThread(ByVal 0&, ByVal 0&, AddressOf test_function2, ByVal 0&, 0, lpThreadID)
lEventHandle = CreateEvent(ByVal 0&, False, False, ByVal 0&)

End Sub

Private Sub cmdStop_Click()
' Dim lRC As Long

' lRC = SetEvent(lEventHandle)

If lThreadHandle1 > 0 Then
Call TerminateThread(lThreadHandle1, ByVal 0&)
End If
If lThreadHandle2 > 0 Then
Call TerminateThread(lThreadHandle2, ByVal 0&)
End If

lThreadHandle1 = 0
lThreadHandle2 = 0

End Sub

Private Sub Form_Unload(Cancel As Integer)

If lThreadHandle1 > 0 Then
Call TerminateThread(lThreadHandle1, ByVal 0&)
End If
If lThreadHandle2 > 0 Then
Call TerminateThread(lThreadHandle2, ByVal 0&)
End If

Call TerminateProcess(GetCurrentProcess, ByVal 0&)

End Sub
