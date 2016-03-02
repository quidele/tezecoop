Public Class GestionMails

    Public Shared Function NotificarViaMail_FE(ByVal pEncabezado As String, ByVal pCuerpo As ArrayList) As Boolean
        Dim _cuerpo As String = ""


        For Each linea As String In pCuerpo
            _cuerpo = _cuerpo + vbCrLf + linea
        Next


        NotificarViaMail_FE = NotificarViaMail_FE(pEncabezado, pCuerpo)

    End Function

    Public Shared Function NotificarViaMail_FE(ByVal pEncabezado As String, ByVal pCuerpo As String) As Boolean

        pcuerpo = AdaptarString(pcuerpo)
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia

        If Not objAdmConexiones.ejecutarNonQuerySQLFE("Exec [dbo].[spu_NotificaViaMail] @HeadText = N'" + pEncabezado + "' , @Cuerpo = N'" + pCuerpo + "'") Then
            Log.EscbribirLinea_Log("Error al intentar enviar un mail")
            NotificarViaMail_FE = False
            Exit Function
        End If
        NotificarViaMail_FE = True
    End Function

    Private Function enviarMail() As Boolean

    End Function

    Private Shared Function AdaptarString(ByVal pTexto As String) As String
        Return Replace(pTexto, "'", "$$")
    End Function
End Class
