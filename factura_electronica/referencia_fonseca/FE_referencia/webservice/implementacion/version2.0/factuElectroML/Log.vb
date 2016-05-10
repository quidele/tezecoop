Imports System.IO

Public Class Log


    Public Shared Sub EscbribirLinea_Log(ByVal stringLinea As String)

        If Configuration.ConfigurationManager.AppSettings("LOG_ACTIVADO") = "SI" Then

            If Directory.Exists(CurDir() + "\" + "Log\") = False Then
                Directory.CreateDirectory(CurDir() + "\" + "Log\")
            End If

            Dim rutaLog As String = CurDir() + "\" + Configuration.ConfigurationManager.AppSettings("LOG_RUTA")
            Dim hoyFecha As New Date()
            hoyFecha = Now
            Dim fechaArchivo As String = Now.Year.ToString + "-" + Now.Month.ToString + "-" + Now.Day.ToString
            Dim strWriter As New StreamWriter((rutaLog + "FctElec-" + fechaArchivo + ".log").ToString, True)
            strWriter.WriteLine(hoyFecha + " - " + stringLinea)
            strWriter.Close()
        End If



    End Sub

End Class