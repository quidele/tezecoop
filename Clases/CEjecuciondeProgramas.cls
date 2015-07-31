VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CEjeProgramas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False


Option Explicit

Const STARTF_USESHOWWINDOW As Long = &H1
Const SW_HIDE As Long = 0

Private Type STARTUPINFO
   cb As Long
   lpReserved As String
   lpDesktop As String
   lpTitle As String
   dwX As Long
   dwY As Long
   dwXSize As Long
   dwYSize As Long
   dwXCountChars As Long
   dwYCountChars As Long
   dwFillAttribute As Long
   dwFlags As Long
   wShowWindow As Integer
   cbReserved2 As Integer
   lpReserved2 As Long
   hStdInput As Long
   hStdOutput As Long
   hStdError As Long
End Type

Private Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessID As Long
   dwThreadID As Long
End Type

Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal _
   hHandle As Long, ByVal dwMilliseconds As Long) As Long

Private Declare Function CreateProcessA Lib "kernel32" (ByVal _
   lpApplicationName As Long, ByVal lpCommandLine As String, ByVal _
   lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, _
   ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, _
   ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, _
   lpStartupInfo As STARTUPINFO, lpProcessInformation As _
   PROCESS_INFORMATION) As Long

Private Declare Function CloseHandle Lib "kernel32" (ByVal _
   hObject As Long) As Long

Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Private Const NORMAL_PRIORITY_CLASS = &H20&
Private Const INFINITE = -1&



Public Function EjecutarSincronizador(cmdline$) As Long
Dim proc  As PROCESS_INFORMATION
Dim start As STARTUPINFO
Dim ret   As Long

   If IsProcessRunning("Sincronizador.exe") Then Exit Function
    
   ' Initialize the STARTUPINFO structure:
   start.cb = Len(start)
   start.dwFlags = STARTF_USESHOWWINDOW
   start.wShowWindow = SW_HIDE
   ' Start the shelled application:
   
   ret& = CreateProcessA(0&, cmdline$, 0&, 0&, 1&, _
      NORMAL_PRIORITY_CLASS, 0&, 0&, start, proc)
   
   DoEvents
   
   EjecutarSincronizador = ret
  
End Function



Function IsProcessRunning(strProcess)
    Dim Process, strObject
    IsProcessRunning = False
    strObject = "winmgmts://" + objConfig.nmServidor
    For Each Process In GetObject(strObject).InstancesOf("win32_process")
    If UCase(Process.Name) = UCase(strProcess) Then
            IsProcessRunning = True
            Exit Function
        End If
    Next
End Function




Public Function ExecCmd(cmdline$) As Long
   Dim proc  As PROCESS_INFORMATION
   Dim start As STARTUPINFO
   Dim ret   As Long

   ' Initialize the STARTUPINFO structure:
   start.cb = Len(start)
   start.dwFlags = STARTF_USESHOWWINDOW
   start.wShowWindow = SW_HIDE
   ' Start the shelled application:
   
   ret& = CreateProcessA(0&, cmdline$, 0&, 0&, 1&, _
      NORMAL_PRIORITY_CLASS, 0&, 0&, start, proc)
   DoEvents
   ' Wait for the shelled application to finish:
   ret& = WaitForSingleObject(proc.hProcess, INFINITE)
   ret& = CloseHandle(proc.hProcess)
   ExecCmd = ret
   ' Shell cmdline$, vbMaximizedFocus
   ' Shell Environ("comspec") + " /c " & "ping.exe www.yahoo.com>C:\\prueba.txt1"
   
    
End Function



