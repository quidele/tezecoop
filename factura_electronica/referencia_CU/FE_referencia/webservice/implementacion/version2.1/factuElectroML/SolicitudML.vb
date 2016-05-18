Public Class SolicitudML
    Implements IComparable

    Public idsolicitud As New Campo
    Public serie_doc As New Campo
    Public nro_doc As New Campo
    Public imp_tot_mo As New Campo
    Public estado_envio As New Campo
    Public nom_tit As New Campo
    Public cod_doc As New Campo
    Public fec_doc As New Campo
    '<<Version 2.1.3>>
    Public Overrides Function Equals(ByVal obj As Object) As Boolean

        If Not TypeOf (obj) Is DBNull Then

            Dim unSolicitudML As SolicitudML = CType(obj, SolicitudML)
            If unSolicitudML.nro_doc.Valor.ToString <> "" Then
                Return CInt(Me.nro_doc.Valor.ToString) = Integer.Parse(unSolicitudML.nro_doc.Valor.ToString)
            End If

        End If
    End Function


    '<<Version 2.1.3>>
    Public Function CompareTo(ByVal obj As Object) As Integer Implements IComparable.CompareTo
        If Not TypeOf (obj) Is DBNull Then

            Dim objSolicitudML As SolicitudML = CType(obj, SolicitudML)


            Return objSolicitudML.nro_doc.valor.ToString.CompareTo(nro_doc.valor.ToString)


        End If
    End Function
End Class
