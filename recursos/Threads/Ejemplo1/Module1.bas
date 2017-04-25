Attribute VB_Name = "Module1"

' The module code has two functions define:
' test_function and test_function2 which are associated
' to a thread. The thread remains in the critical path
' until a signal is received. Once the signal is
' received the thread finish executing the critical path
' and terminates.


Option Explicit
Public Declare Function CreateThread Lib "kernel32" (ByVal lpThreadAttributes As Any, ByVal dwStackSize As _
Long, ByVal lpStartAddress As Long, lpParameter As _
Any, ByVal dwCreationFlags As Long, lpThreadID As _
Long) As Long

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Function TerminateThread Lib "kernel32" (ByVal hThread As Long, ByVal dwExitCode As Long) As Long

Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long

Public Declare Function WaitForSingleObject Lib "kernel32.dll" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Public Declare Function CreateEvent& Lib "kernel32" Alias "CreateEventA" (ByVal lpEventAttributes As Long, _
ByVal bManualReset As Long, ByVal bInitialState As Long, ByVal lpname As String)

Public lThreadHandle1 As Long
Public lThreadHandle2 As Long
Public lEventHandle As Long

Public Sub Main()

    frmOutput.Show vbModal
    
' frmOutput.Show

End Sub

Public Sub test_function()
Dim i As Long
Dim ret As Long




i = 0


Do
i = i + 1


    MsgBox "HILO 1"

    'Sleep 10
    ' EULI
    ' frmOutput.txtStream1 = i

DoEvents
ret = WaitForSingleObject(lEventHandle, 10)
Loop Until ret = 0


End Sub

Public Sub test_function2()
Dim i As Long
Dim ret As Long
i = 0

Do
i = i + 1

'Sleep 500
' EULI
' frmOutput.txtStream2 = i

MsgBox "HILO 2"

ret = WaitForSingleObject(lEventHandle, 500)
Loop Until ret = 0

End Sub
