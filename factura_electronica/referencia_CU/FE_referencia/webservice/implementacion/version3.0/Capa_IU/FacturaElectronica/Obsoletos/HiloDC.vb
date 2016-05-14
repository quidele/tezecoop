
Public Class HiloDC

    Public Sub Ejecutar_DcAfip()
        Try
            Shell(Application.StartupPath + "\" + "dc_AFIP.exe", AppWinStyle.NormalNoFocus)
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try

    End Sub

End Class
