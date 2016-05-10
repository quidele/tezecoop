Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Threading
Imports System.IO

Public Class worker_class

' Set up delegate for assync function call.
Public Delegate Sub Async_Update_Progress_caller(ByVal ByValValue_for_progress_bar As Integer)


Public Sub DoRemoteCommunications()
    Console.WriteLine("Comms worker thread started.....")

    Do Until False
        If frm_progressbar.abortar Then
            Exit Sub
        End If
        frm_progressbar.UpdateProgressDisplay(1)
        Thread.Sleep(100)
    Loop


End Sub



End Class
