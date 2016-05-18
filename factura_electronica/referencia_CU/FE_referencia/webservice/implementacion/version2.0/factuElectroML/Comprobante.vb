Public Class Comprobante

    Public cod_doc As New Campo
    Public nro_doc As New Campo
    Public nro_trans As New Campo
    Public estado As New Campo
    Public observacion As New Campo
    Public fecha_emision As New Campo ' Fecha_cbte
    Public nom_tit As New Campo
    Public imp_tot_mo As New Campo
    Public estado_envio As New Campo

    Public tipo As New Campo
    Public ptovta As New Campo
    Public idSolicitud As New Campo ' Se recupera de solicitud
    Public codtarea As New Campo    ' de AFIP si existe 
    Public estadocmp As New Campo    ' de AFIP si existe
    Public observa_envio As New Campo  ' se asigna seun resultado del envio
    Public codaut As New Campo    ' CAE Se recupera AFIP
    Public vtocodaut As New Campo ' fecha de vencimiento CAE Se recupera de AFIP
    Public nro As New Campo       ' Cbt_nro recupera de AFIP


End Class
