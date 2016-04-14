Imports fonseca_libDatos
Public Class ct_sectoresDAO



    Public [error] As String
    Public listaSectores As New ArrayList
    Public SectorBuscado As ct_sectores

    Public Function obtenerSectoresxUsuario(ByVal pusuario As Campo) As Boolean
        Dim Sql As String
        Dim un_ct_Sector As ct_sectores
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Log.Logger("info", "ct_sectoresDAO - obtenerSectoresxUsuario")

        listaSectores.Clear()

        ' obtenemos el detalle de la liuidacion 
        Sql = " exec fo_sp_obtenerSectoresdelUsuario @usuario=" + SQLAdapter.formatValuetoSQL(pusuario)
        Log.Logger("debug", Sql)
        objAdmConexiones.EjecutarQuerySQL(Sql)

        If objAdmConexiones.rsSQL.HasRows Then
            Do While objAdmConexiones.rsSQL.Read
                un_ct_Sector = New ct_sectores()
                Me.rsto_ct_Sector(un_ct_Sector, objAdmConexiones.rsSQL)
                listaSectores.Add(un_ct_Sector)
                SectorBuscado = un_ct_Sector
            Loop
        Else
            Me.error = "No existen registros para procesar en ct_Sectores "
            Exit Function
        End If

    End Function



    Public Function obtenerSectorxUsuario(ByVal pusuario As Campo, ByVal psector As Campo) As Boolean
        Dim Sql As String
        Dim un_ct_Sector As ct_sectores
        Dim objAdmConexiones As AdmConexiones = AdmConexiones.getInstancia()
        Log.Logger("info", "ct_sectoresDAO - obtenerSectorxUsuario")

        listaSectores.Clear()

        ' obtenemos el detalle de la liuidacion 
        Sql = " exec fo_sp_obtenerSectoresdelUsuario @usuario=" + SQLAdapter.formatValuetoSQL(pusuario) + SQLAdapter.COMA
        Sql = Sql + " @cod_sector=" + SQLAdapter.formatValuetoSQL(psector)
        Log.Logger("debug", Sql)
        objAdmConexiones.EjecutarQuerySQL(Sql)

        If objAdmConexiones.rsSQL.HasRows Then
            Do While objAdmConexiones.rsSQL.Read
                un_ct_Sector = New ct_sectores()
                Me.rsto_ct_Sector(un_ct_Sector, objAdmConexiones.rsSQL)
                listaSectores.Add(un_ct_Sector)
                SectorBuscado = un_ct_Sector
            Loop
        Else
            Me.error = "No existen registros para procesar en ct_Sectores "
            Exit Function
        End If

    End Function

    

    Private Function rsto_ct_Sector(ByVal pct_Sector As ct_sectores, _
                                   ByVal rs As Data.SqlClient.SqlDataReader) As Boolean


        pct_Sector.cod_sector.Valor = rs("cod_sector")
        pct_Sector.cod_sector.Tipo = rs("cod_sector").GetType()


    End Function



End Class





