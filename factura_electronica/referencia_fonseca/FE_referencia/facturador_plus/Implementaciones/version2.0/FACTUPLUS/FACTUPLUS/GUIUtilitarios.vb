Imports fonseca_libDatos
Public Class GUIUtilitarios

    Const TAMANIO_NRO_REMITO As Integer = 8
    Const TAMANIO_SERIE As Integer = 4


    ' Este metodo obtiene un componente a partir del valor tag
    Public Shared Function obtenercampo(ByRef form As Form, ByVal pNombre As String) As Control
        Dim i As Integer
        Dim j As Integer


        For i = 0 To form.Controls.Count - 1
            For j = 0 To form.Controls(i).Controls.Count() - 1
                If "System.Windows.Forms.TextBox" = form.Controls(i).Controls(j).GetType().ToString Or _
                   "System.Windows.Forms.MaskedTextBox" = form.Controls(i).Controls(j).GetType().ToString Or _
                   "System.Windows.Forms.DateTimePicker" = form.Controls(i).Controls(j).GetType().ToString Or _
                   "System.Windows.Forms.Label" = form.Controls(i).Controls(j).GetType().ToString Then
                    If UCase(form.Controls(i).Controls(j).Tag) = UCase(pNombre) Then
                        obtenercampo = form.Controls(i).Controls(j)
                        Exit Function
                    End If
                End If
            Next
        Next
        MsgBox("No existe el campo " + pNombre + ", situación no admisible", MsgBoxStyle.Critical, "Atencion")
        Return Nothing

    End Function


    Public Shared Sub centrarPanel(ByRef form As Form, ByVal panel As Panel)

        panel.Left = (form.Width - panel.Width) / 2
        panel.Top = (form.Height - panel.Height) / 2

    End Sub



    Public Shared Function obtenerDocuNumeroCompleto(ByVal pLetra As String, ByVal pSerie As String, ByVal pNro As String) As Campo
        Dim unCampo As New Campo
        Dim auxSerie As String
        Dim auxNro As String

        auxSerie = pSerie
        auxNro = pNro
        For i = pSerie.Length() To TAMANIO_SERIE - 1
            auxSerie = "0" + pSerie
        Next

        For i = pNro.Length() To TAMANIO_NRO_REMITO - 1
            auxNro = "0" + pNro
        Next

        unCampo.tipo = SQLAdapter.getTipoString
        unCampo.valor = pLetra + "-" + auxSerie + "-" + auxNro
        obtenerDocuNumeroCompleto = unCampo

    End Function

    Public Shared Function completarCerosaIzquierda(ByVal pdato As String, ByVal pTamaniodato As Integer) As String
        For i = pdato.Length() To pTamaniodato - 1
            pdato = "0" + pdato
        Next
        completarCerosaIzquierda = pdato
    End Function

    Public Shared Function obtenerNombreEjecutable(ByVal pRuta As String) As String
        Dim datos
        obtenerNombreEjecutable = ""
        datos = Split(pRuta, "\")
        For Each una_palabra In datos
            obtenerNombreEjecutable = una_palabra
        Next
    End Function









End Class
