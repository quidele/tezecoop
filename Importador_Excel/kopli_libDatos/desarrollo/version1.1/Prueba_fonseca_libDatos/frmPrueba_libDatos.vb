Imports fonseca_libDatos
Public Class frmPrueba_libDatos

    Private _AdmConexionesBD As AdmConexionesBD
    Private _usuario As String
    Private _clave As String
    Private _cadenaDeConexion As String
    Private _unCampo As String

    Private Sub frmPrueba_libDatos_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        '      <add name="MAGMA_ERP" connectionString="Data Source=SVR-MAGMA-BD;Database=Magma_ERP" providerName="System.Data.SqlClient" />
        '<add name="CUEROS_BD" connectionString="DSN=cueros_prod" providerName="System.Data.Odbc" />
        '<add name="EBFONSE_BD" connectionString="DSN=ebfonse_prod" providerName="System.Data.Odbc" />
        '<add name="EBFONSE_BD_Unc" connectionString="DSN=ebfonse_prod_unc" providerName="System.Data.Odbc" />


        '      <add key="usuario_Magma_ERP" value="sa" />
        '<!-- Clave Encriptada-->
        '<add key="clave_MAGMA_ERP" value="Š§§ƒ¯•…" />

        '<add key="usuario_Cueros_BD" value="sysprogress" />
        '<!-- Clave Encriptada-->
        '<add key="clave_Cueros_BD" value="ÌÌÃÂÁ¶¹·¸ÆÆ" />

        '<add key="usuario_MFG_Ebfonse" value="sysprogress" />
        '<!-- Clave Encriptada-->
        '<add key="clave_MFG_Ebfonse" value="ÌÌÃÂÁ¶¹·¸ÆÆ" />






       


    End Sub

   

    Private Sub cmbBases_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmbBases.SelectedIndexChanged

        Dim tipoProv As AdmConexionesBD.TipoProveedorDatos

        Select Case cmbBases.Text
            Case "Magma"
                tipoProv = AdmConexionesBD.TipoProveedorDatos.SqlClient
                _cadenaDeConexion = "Data Source=SVR-MAGMA-BD;Database=Magma_ERP_Desa"
                _usuario = "sa"
                _clave = "Š§§ƒ¯•…"
                txtSQL.Text = "SELECT nom_pais FROM ct_paises"
                _unCampo = "nom_pais"
            Case "MFG"
                tipoProv = AdmConexionesBD.TipoProveedorDatos.ODBC
                _cadenaDeConexion = "DSN=cueros_prue"
                _usuario = "sysprogress"
                _clave = "ÌÌÃÂÁ¶¹·¸ÆÆ"
                txtSQL.Text = "select zinter_liquid_nbr from PUB.zinter_liquid_mstr  where  zinter_liquid_nbr > 10250 AND zinter_liquid_nbr < 10260"
                _unCampo = "zinter_liquid_nbr"
            Case "RRHH"
                tipoProv = AdmConexionesBD.TipoProveedorDatos.SqlClient
                _cadenaDeConexion = "Data Source=RRHH;Database=fonseca_gestion_prue"
                _usuario = "sa"
                _clave = "¦È­¼tŠvˆ"
                txtSQL.Text = "SELECT descripcion FROM Ju_reclamos"
                _unCampo = "descripcion"
            Case "MySQL"

                'REVISAR ! NO FUNCIONA

                tipoProv = AdmConexionesBD.TipoProveedorDatos.ODBC
                '_cadenaDeConexion = "DSN=iweb_homol"
                _cadenaDeConexion = "DSN=iweb"
                _usuario = "root"
                _clave = "¼°Æµ´»Ãƒ"
                txtSQL.Text = "SELECT id FROM  pro_reg_prov_cab_op;"
                _unCampo = "id"
            Case "FacturaElectronica"
                tipoProv = AdmConexionesBD.TipoProveedorDatos.SqlClient
                _cadenaDeConexion = "Data Source=SVR-MAGMA-BD;Database=FacturaElectronica_Prueba"
                _usuario = "sa"
                _clave = "Š§§ƒ¯•…"
                txtSQL.Text = "select descripcion from idioma"
                _unCampo = "descripcion"

        End Select

        _AdmConexionesBD = New AdmConexionesBD(tipoProv, _cadenaDeConexion, _usuario, _clave)


    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim ee As New Encriptado
        ee.EncryptText("marcelo1", "root")

        'mysql
        'root
        'marcelo1

    End Sub

    Private Sub btnEjecutarQuery_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEjecutarQuery.Click

        _AdmConexionesBD.EjecutarQuery(txtSQL.Text)

        ListBox1.Items.Clear()

        Do While _AdmConexionesBD.DataReader.Read()
            ListBox1.Items.Add(_AdmConexionesBD.DataReader(_unCampo))
        Loop

        _AdmConexionesBD.CerrarDataReader()
        _AdmConexionesBD.CerrarConexion()

    End Sub

    Private Sub btnEjecutarScalar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEjecutarScalar.Click

        _AdmConexionesBD.EjecutarScalar(txtSQL.Text)

        MessageBox.Show(_AdmConexionesBD.Rs_Scalar.ToString)

        _AdmConexionesBD.CerrarConexion()

    End Sub

    Private Sub btnEjecutarNonQuery_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEjecutarNonQuery.Click

        _AdmConexionesBD.Begin_Transaction()

        _AdmConexionesBD.EjecutarNonQuery(txtSQL.Text)

        MessageBox.Show(_AdmConexionesBD.FilasAfectadasNonQuery.ToString)

        _AdmConexionesBD.Commit_Transaction()

        _AdmConexionesBD.CerrarConexion()

    End Sub

    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ListBox1.Items.Clear()

        DataGridView1.DataSource = New DataTable()

    End Sub

    Private Sub btnDataSet_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDataSet.Click

        DataGridView1.DataSource = _AdmConexionesBD.EjecutarNonQuerySQL_DT(txtSQL.Text, CommandType.Text)

        _AdmConexionesBD.CerrarDataReader()
        _AdmConexionesBD.CerrarConexion()

    End Sub

  

    Private Sub btn_Actualizar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_Actualizar.Click
        Try

            Dim a As New DataTable()

            If _AdmConexionesBD.EjecutarNonQuerySQL_DT_Update(txtSQL.Text, DataGridView1.DataSource) Then
                MessageBox.Show("Actualizacion correcta!", "Actualizacion", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
End Class
