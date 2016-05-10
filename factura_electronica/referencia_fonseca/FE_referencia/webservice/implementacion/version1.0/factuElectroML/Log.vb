Imports System.IO

Public Class Log


    Public Shared Sub EscbribirLinea_Log(ByVal stringLinea As String)

        If Configuration.ConfigurationManager.AppSettings("LOG_ACTIVADO") = "SI" Then
            Dim rutaLog As String = Configuration.ConfigurationManager.AppSettings("LOG_RUTA")
            Dim hoyFecha As New Date()
            hoyFecha = Now
            Dim fechaArchivo As String = Now.Year.ToString + "-" + Now.Month.ToString + "-" + Now.Day.ToString
            Dim strWriter As New StreamWriter((rutaLog + "FctElec-" + fechaArchivo + ".log").ToString, True)
            strWriter.WriteLine(hoyFecha + " - " + stringLinea)
            strWriter.Close()
        End If



    End Sub

End Class
