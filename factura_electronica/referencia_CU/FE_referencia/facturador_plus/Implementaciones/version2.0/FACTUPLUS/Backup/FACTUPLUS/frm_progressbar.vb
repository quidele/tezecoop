
Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Threading
Imports System.IO

Public Class frm_progressbar

Dim worker As System.Threading.Thread ' Thread
Dim worker_obj As New worker_class ' Object from worker class
Public Shared miValue_for_progress_bar As Integer
Public Shared abortar As Boolean

Public Sub New()
        Me.InitializeComponent()
        'ProgressBar1
        ProgressBar1.Name = "ProgressBar1"
        ProgressBar1.Maximum = 10
        ProgressBar1.Value = 1
End Sub

Sub UpdateProgressDisplay(ByVal Value_for_progress_bar As Integer)
        Try
            Me.Show()
        Catch ex As Exception
        End Try

        If miValue_for_progress_bar < 10 Then
            miValue_for_progress_bar = miValue_for_progress_bar + 1
        Else
            miValue_for_progress_bar = 1
        End If
        Application.DoEvents()
        ProgressBar1.Value = miValue_for_progress_bar
        Me.Refresh()
        Me.BringToFront()
        Application.DoEvents()
End Sub


Public Sub crearHilo()
        worker = New Thread(AddressOf worker_obj.DoRemoteCommunications)
        ' Now actually start the comms thread.
        worker.Start()
        abortar = False
End Sub


Public Sub paraHilo()

        abortar = True

        Do Until Not worker.IsAlive
            Thread.Sleep(100)
        Loop
        Me.Hide()

End Sub



End Class
