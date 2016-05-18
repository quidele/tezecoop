Public Class SolicitudMLDAO

    Public [error] As String
    Public listaSolicitudes As New ArrayList
    Public SolicitudBuscado As SolicitudML
    Public un_resultadoSP As New ResultadoSP


    'Public Function obtenerSolicitudaEnviar(ByVal pidSolicitud As Campo) As Boolean
    Public Function obtenerSolicitudaEnviar() As Boolean

        Try

        
            Dim Sql As String
            Dim unaSolicitud As SolicitudML
            Dim haySolicitud As Boolean = False

            ' obtenemos el detalle de la liquidacion 
            Sql = " exec spu_obtenerComprobantesaEnviarML_v2_1 "

            AdmConexiones.ejecutarQuerySQLFE(Sql)

            Do While AdmConexiones.rsSQLFE.Read()
                unaSolicitud = New SolicitudML
                SolicitudBuscado = New SolicitudML
                haySolicitud = True
                Me.rsto_Solicitud(unaSolicitud, AdmConexiones.rsSQLFE) '-- Carga valores y tipos a cada atributo del objeto SolicitudML
                listaSolicitudes.Add(unaSolicitud)
                SolicitudBuscado = unaSolicitud
                obtenerSolicitudaEnviar = True
            Loop
            If Not (haySolicitud) Then
                Me.error = "No existen Solicitudes a Enviar"

            End If
        Catch ex As Exception
            Me.error = ex.Message
            Throw
        End Try
    End Function




    Private Function rsto_Solicitud(ByVal pSolicitud As SolicitudML, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pSolicitud.idsolicitud.valor = rs("idsolicitud")
        pSolicitud.serie_doc.valor = rs("serie_doc")
        pSolicitud.nro_doc.valor = rs("nro_doc")
        pSolicitud.imp_tot_mo.valor = rs("imp_tot_mo")
        pSolicitud.estado_envio.valor = rs("estado_envio")
        pSolicitud.nom_tit.valor = rs("nom_tit")
        pSolicitud.cod_doc.Valor = rs("cod_doc")
        pSolicitud.fec_doc.valor = rs("fec_doc")

        pSolicitud.idsolicitud.tipo = rs("idsolicitud").GetType
        pSolicitud.serie_doc.tipo = rs("serie_doc").GetType
        pSolicitud.nro_doc.tipo = rs("nro_doc").GetType
        pSolicitud.imp_tot_mo.tipo = rs("imp_tot_mo").GetType
        pSolicitud.estado_envio.tipo = rs("estado_envio").GetType
        pSolicitud.nom_tit.Tipo = rs("nom_tit").GetType
        pSolicitud.cod_doc.Tipo = rs("cod_doc").GetType
        pSolicitud.fec_doc.Tipo = rs("fec_doc").GetType

    End Function




    Private Function rsto_resultadoSP(ByVal pResultadoSP As ResultadoSP, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pResultadoSP.resultado.valor = rs("resultado")
        pResultadoSP.descripcion.valor = rs("descripcion")

        pResultadoSP.resultado.tipo = rs("resultado").GetType
        pResultadoSP.descripcion.tipo = rs("descripcion").GetType

    End Function


End Class
