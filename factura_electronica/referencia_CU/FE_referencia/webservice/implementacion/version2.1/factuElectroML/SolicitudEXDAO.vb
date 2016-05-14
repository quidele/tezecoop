Public Class SolicitudEXDAO

    Public [error] As String
    Public listaSolicitudes As New ArrayList
    Public SolicitudBuscado As SolicitudEX
    Public un_resultadoSP As New ResultadoSP

    ''' <summary>
    ''' Obtiene los comprobantes a enviar
    ''' </summary>
    ''' <returns>True si la operación resultó exitosa</returns>
    ''' <remarks></remarks>
    Public Function obtenerSolicitudaEnviar() As Boolean
        Dim Sql As String
        Dim unaSolicitud As SolicitudEX
        Dim haySolicitud As Boolean = False


        Sql = " exec spu_obtenerComprobantesaEnviarEX "

        AdmConexiones.ejecutarQuerySQLFE(Sql)

        Do While AdmConexiones.rsSQLFE.Read()
            unaSolicitud = New SolicitudEX
            haySolicitud = True
            Me.rsto_Solicitud(unaSolicitud, AdmConexiones.rsSQLFE) '-- Carga valores y tipos a cada atributo del objeto SolicitudML
            listaSolicitudes.Add(unaSolicitud)
            SolicitudBuscado = unaSolicitud
            obtenerSolicitudaEnviar = True
        Loop
        If Not (haySolicitud) Then
            Log.EscbribirLinea_Log("No existen Solicitudes a Enviar")
            [error] = "No existen Solicitudes a Enviar"
        End If
    End Function




    Private Function rsto_Solicitud(ByVal pSolicitud As SolicitudEX, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pSolicitud.cod_doc.valor = rs("cod_doc")
        pSolicitud.serie_doc.valor = rs("serie_doc")
        pSolicitud.nro_doc.valor = rs("nro_doc")
        pSolicitud.nro_trans.valor = rs("nro_trans")
        pSolicitud.nom_tit.valor = rs("nom_tit")
        pSolicitud.imp_tot_mo.valor = rs("imp_tot_mo")
        pSolicitud.cod_tit.valor = rs("cod_tit")
        pSolicitud.estado_envio.valor = rs("estado_envio")

        pSolicitud.cod_doc.tipo = rs("cod_doc").GetType
        pSolicitud.serie_doc.tipo = rs("serie_doc").GetType
        pSolicitud.nro_doc.tipo = rs("nro_doc").GetType
        pSolicitud.nro_trans.tipo = rs("nro_trans").GetType
        pSolicitud.nom_tit.tipo = rs("nom_tit").GetType
        pSolicitud.imp_tot_mo.tipo = rs("imp_tot_mo").GetType
        pSolicitud.cod_tit.tipo = rs("cod_tit").GetType
        pSolicitud.estado_envio.tipo = rs("estado_envio").GetType


    End Function

    Private Function rsto_resultadoSP(ByVal pResultadoSP As ResultadoSP, _
                               ByVal rs As Data.SqlClient.SqlDataReader) As Boolean

        pResultadoSP.resultado.valor = rs("resultado")
        pResultadoSP.descripcion.valor = rs("descripcion")

        pResultadoSP.resultado.tipo = rs("resultado").GetType
        pResultadoSP.descripcion.tipo = rs("descripcion").GetType

    End Function

End Class
