Module ModuloDeInicio

    Public Sub main()

        Application.EnableVisualStyles()

        If Configuration.ConfigurationManager.AppSettings("TIPO_MERCADO").ToString = "ML" Then
            Dim frmInicio As New Frm_obtieneCAE
            Application.Run(frmInicio)

        ElseIf Configuration.ConfigurationManager.AppSettings("TIPO_MERCADO").ToString = "EX" Then
            Dim frmInicio As New Frm_ObtieneCAE_EX
            Application.Run(frmInicio)
        Else
            MsgBox("¡¡ Error de configuración en TIPO_MERCADO !!", MsgBoxStyle.Exclamation)
        End If

    End Sub



End Module
