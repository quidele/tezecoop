using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ControlesdeUsuario;
using System.Reflection;
using System.Diagnostics;
using SGLibrary.Extensiones;
using SGLibrary.Services;
using SGLibrary.GUIUtilities;
using System.Globalization;
using Microsoft.VisualBasic;


namespace SGLibrary
{
    public partial class FrmEstadoDeCuenta : Form
    {


        public ServiceModelGenerico<Obligaciones> serviceModel { get; set; }
        public List<TB_ProveedoresExt> Titulares { get; set; }
        public IEnumerable<TB_ObligacionesCuotasExt> Lista_Vencimientos { get; set; }

        private IEnumerable<Obligaciones> ListaRegistrosObligaciones;

        public FrmEstadoDeCuenta()
        {
            InitializeComponent();
        }

        private void FrmABMBase_Load(object sender, EventArgs e)
        {

            botonesForm1.configMododeEdicion(ABMBotonesForm.REPORT);
            this.panelcarga.Visible = true;
            this.panelbusqueda.Visible = false;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;

            //            var lista = this.serviceModel.obtenerUsuarios();
            List<Object> lista = this.serviceModel.obtenerUsuarios().ToList<Object>();
            lista.Add(new { USUARIO = "Todos"});

            if (lista.Count() > 0)
            {
                cargarCombo(this.cbUsuarios, lista);
                this.cbUsuarios.SelectedIndex = 0;
            }

            this.statusbar_bd.Text = "Base de datos: " + serviceModel.Basededatos;
            this.statusbar_servidor.Text = "Base de datos: " + serviceModel.Servidor;
            this.statusbar_usuario.Text = "Usuario: " + serviceModel.Usuario;
            this.statusbar_nrocaja.Text = "Caja: " + serviceModel.CajaAdm;
            this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();
            this.status_bar_ambiente.Text = "Ambiente: " + ConfigBD.Instance(this.serviceModel.Ambiente)._ambiente;
            this.Titulares = new List<TB_ProveedoresExt>();

            //this.botonesForm1.InicializarFindBoton();
            this.txtnrLicencia.Focus(); 

        }


        private void HabilitarDeshabilitarCampos(Boolean pEdicion){
            
            this.cbEstado.Enabled = (!pEdicion); 
            this.txtDescripcion.Enabled =  (!pEdicion);
            this.txtComMov.Enabled = (!pEdicion);
            this.txtnrLicencia.Enabled = (!pEdicion);

        }


        private bool validarIngresodeGrilla()
        {
            if (this.ADGV_Titulares.RowCount==0) 
            {
                MessageBox.Show(string.Format("Debe agregar el/los titulares.", this.txtnrLicencia.Text), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.ADGV_Titulares.Focus();
                return false;
            }
            if (this.ADGV_TitularesCuotas.RowCount == 0)
            {
                MessageBox.Show("Debe ingresar los vencimientos.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.ADGV_Titulares.Focus();
                return false;
            } 
            return true;
        }


        private void ActualizarCantidadRegistros(int registros)
        {
            this.lblDgvBusquedaRegistros.Text = registros.ToString() + " - Registros";
        }



        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }


        public void cargarCombo(ComboBox cb, IEnumerable<Object> lista)
        {

            cb.Items.Clear();
            foreach (object item in lista)
            {
                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    cb.Items.Add(p.GetValue(item, null));
                }
            }

        }


        private void dataGridView2_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);
        }

        private void dataGridView2_RowHeaderMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);
        }

        private void cbUsuariosConciliaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            //MessageBox.Show(cbUsuariosConciliaciones.Text);
        }

        private void panelbusqueda_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView2_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource1.Filter = this.ADGVBusqueda.FilterString;
            this.lblDgvBusquedaRegistros.Text = "Registros: " + this.bindingSource1.List.Count.ToString();
        }

        private void txtMonto_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = soloNumerosDecimales(e.KeyChar);

        }

        private void txtMonto_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtCuotas_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtCuotas_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = soloEnteros(e.KeyChar);
        }

        public bool soloEnteros(Char caracter){
            return !char.IsDigit(caracter) && !char.IsControl(caracter);
        }

        public bool soloNumerosDecimales(Char caracter)
        {
            return !char.IsDigit(caracter) && !char.IsControl(caracter) && (caracter.ToString()  !=  CultureInfo.CurrentUICulture.NumberFormat.NumberDecimalSeparator);
        }

        


        

        private void CargarGrillasTitularesCuotas(Boolean pEdicion = false)
        {

            FrmCircularProgressBar f1 = new FrmCircularProgressBar();
            f1.Show();
            WinAPI.SiempreEncima(f1.Handle); 

            // cargamos nuevamente la lista
            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("cdProveedor", new ADGVFieldAdapter("cdProveedor", "COD.TITU", "cdProveedor", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nmNombre", new ADGVFieldAdapter("nmNombre", "NOMBRE", "nmNombre", "System.String", true, true));
            lista_campo_tipo.Add("nmApellido", new ADGVFieldAdapter("nmApellido", "APELLIDO", "nmApellido", "System.String", true, true));
            lista_campo_tipo.Add("estado_registro", new ADGVFieldAdapter("estado_registro", "ESTADO", "estado_registro", "System.String", true, true));

            cargarDataGridView_ADGV(this.ADGV_Titulares, this.Titulares, this.dataSet1, this.bindingSource1, lista_campo_tipo);

            if (this.ADGV_Titulares.Rows.Count == 0) return;

            ADGVInicilizations.ColorearGrillaxCorteValorFormatearFecha(this.ADGV_Titulares, "nrLicencia", "");
            ServiceObligaciones un_ServiceObligaciones = new ServiceObligaciones(new dbSG2000Entities());

            /* this.Lista_Vencimientos = un_ServiceObligaciones.calcularVencimientos(this.Titulares, decimal.Parse(this.txtnrLicencia.Text),
                decimal.Parse(this.txtCuotas.Text), this.dtpFecValor.Value, this.cbEstado.Text);
             */

            // cargamos nuevamente la lista
            lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "nro_trans", "nro_trans", "System.Int32", true, false));
            lista_campo_tipo.Add("cod_tit", new ADGVFieldAdapter("cod_tit", "COD.TITU", "cod_tit", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_cuota", new ADGVFieldAdapter("nro_cuota", "NRO.CUOTA", "nro_cuota", "System.String", true, true));
            lista_campo_tipo.Add("importe", new ADGVFieldAdapter("importe", "IMPORTE", "importe", "System.String", true, true));
            lista_campo_tipo.Add("fecha_vencimiento", new ADGVFieldAdapter("fecha_vencimiento", "VENCIMIENTO", "fecha_vencimiento", "System.DateTime", true, true));
            lista_campo_tipo.Add("estado_registro", new ADGVFieldAdapter("estado_registro", "ESTADO", "estado_registro", "System.String", true, true));

            cargarDataGridView_ADGV(this.ADGV_TitularesCuotas, this.Lista_Vencimientos, this.dataSet2, this.bindingSource2, lista_campo_tipo);
            ADGVInicilizations.ColorearGrillaxCorteValorFormatearFecha(this.ADGV_TitularesCuotas, "nrLicencia", "fecha_vencimiento");

            f1.Close();
        }


        

        // Agregar a datagridview de titulares
        public void cargarDataGridView_ADGV(DataGridView dgv, IEnumerable<Object> lista,
                                        DataSet p_DataSet, BindingSource p_BindingSource, 
                                        Dictionary<string, ADGVFieldAdapter> p_lista_campo_tipo)
        {

            /*
             this.dataSet1.Clear();
             this.bindingSource1.Clear();
             this.dataGridView1.Rows.Clear(); 
            **/

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, p_lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());

                dgv.AutoGenerateColumns = false;
                //dgv.Rows.Clear();
                dgv.Columns.Clear();

                foreach (var item in p_lista_campo_tipo)
                {
                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = item.Value.Name;
                    columna.HeaderText = item.Value.HeaderText;
                    columna.ReadOnly = item.Value.ReadOnly;
                    columna.Visible = item.Value.Visible;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                    columna.DataPropertyName = item.Value.DataPropertyName;
                }

                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);
            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                Trace.TraceError("Error Linea " + frame.GetFileLineNumber().ToString() + " columna " + frame.GetFileColumnNumber().ToString());
                Trace.TraceError(ex.ToString());
                throw;
            }

        }

        private void eliminarTitularToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (this.ADGV_Titulares.SelectedRows.Count == 0) return;

            foreach (DataGridViewRow row in this.ADGV_Titulares.SelectedRows)
            {
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(int.Parse(row.Cells["cdProveedor"].Value.ToString()), row.Cells["nrLicencia"].Value.ToString(), row.Cells["nmNombre"].Value.ToString(), row.Cells["nmApellido"].Value.ToString(), row.Cells["estado_registro"].Value.ToString());
                un_titu_nuevo  = Titulares.Find(x => x.cdProveedor == un_titu_nuevo.cdProveedor);
                Titulares.Remove(un_titu_nuevo);
            }
            CargarGrillasTitularesCuotas();
             
        }

        private void ADGV_Titulares_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource1.Filter = this.ADGV_Titulares.FilterString;
            //this.lblDgv1Registros.Text = "Registros: " + this.bindingSource1.List.Count.ToString(); 

        }

        private void ADGV_TitularesCuotas_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource2.Filter = this.ADGV_TitularesCuotas.FilterString;
            //this.lblDgv1Registros1.Text = "Registros: " + this.bindingSource2.List.Count.ToString(); 

        }

        private void ADGV_Titulares_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
                
        }

        private void txtDescripcion_TextChanged(object sender, EventArgs e)
        {
            CargarGrillasTitularesCuotas();
        }

        private void eliminarTodosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.ADGV_Titulares.Rows.Count == 0) return;
            LimpiarADGV_TitularesyCuotas();

        }

        private void LimpiarADGV_TitularesyCuotas()
        {

            this.Titulares.Clear();
            this.ADGV_Titulares.DataSource = "";
            this.Lista_Vencimientos = null;
            this.ADGV_TitularesCuotas.DataSource = "";
        }

       

        private void ADGVBusqueda_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void ADGVBusqueda_MouseDoubleClick(object sender, MouseEventArgs e)
        {

            var btnFind = new ToolStripButton();
            btnFind.Tag = "EDIT";
            botonesForm1_ClickEventDelegateHandler(btnFind, null);

        }

        private void panelcarga_Paint(object sender, PaintEventArgs e)
        {

        }

        
        void HandleContextMenuClick(object sender, EventArgs e)
        {
            ToolStripMenuItem menuItm = (ToolStripMenuItem)sender;
            this.txtDescripcion.Text =  menuItm.Text;
        }



        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 

            switch (miboton.Tag.ToString())
            {
                case "FIND":
                    {

                        //serviceConciliaciones.obtenerUsuariosConciliaciones();
                        ServiceObligaciones un_ServiceObligaciones = new ServiceObligaciones(new dbSG2000Entities());

                        int nrLicencia;

                        if (!int.TryParse(this.txtnrLicencia.Text, out nrLicencia))
                        {
                            MessageBox.Show("La licencia ingresada no es válida", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            return;
                        }

                        if (this.cbUsuarios.Text.Trim() == "")
                        {
                            this.cbUsuarios.Text = "Todos";
                        }

                        if (this.cbEstado.Text.Trim() == "")
                        {
                            this.cbEstado.Text = "Todos";
                        }

                        ListaRegistrosObligaciones = un_ServiceObligaciones.ObtenerObligaciones(this.fechadesde.Value,
                                    this.fechahasta.Value, this.cbUsuarios.Text, nrLicencia, this.cbEstado.Text);


                        var listaRegistrosTrans_Cab = ListaRegistrosObligaciones.Select(c => c.TB_transCab).ToList<TB_transCab>();

                        Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
                        //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
                        lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", false, false));
                        lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "NRO.TRANS", "nro_trans", "System.Decimal", false, false));
                        lista_campo_tipo.Add("nro_doc", new ADGVFieldAdapter("nro_doc", "NRO.DOC", "nro_doc", "System.Int32", true, true));
                        lista_campo_tipo.Add("descripcion", new ADGVFieldAdapter("descripcion", "DESCRIPCION", "descripcion", "System.String", true, true));
                        lista_campo_tipo.Add("fec_doc", new ADGVFieldAdapter("fec_doc", "FECHA", "fec_doc", "System.DateTime", true, true));
                        lista_campo_tipo.Add("usuario_mod", new ADGVFieldAdapter("usuario_mod", "USUARIO", "usuario_mod", "System.String", true, true));
                        lista_campo_tipo.Add("estado_registro", new ADGVFieldAdapter("estado_registro", "ESTADO", "estado_registro", "System.String", true, true));
                        cargarDataGridView_ADGV(this.ADGV_Titulares, listaRegistrosTrans_Cab, this.dataSet1, this.bindingSource1, lista_campo_tipo);

                        // this.cargarDataGridViewBusqueda_ADGV(ADGVBusqueda, listaRegistrosTrans_Cab, "NO", this.dataSet1, this.bindingSource1);
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        /*ActualizarCantidadRegistros(listadeRegistros.Count());*/
                        botonesForm1.configMododeEdicion(ABMBotonesForm.REPORT);
                        break;
                    }
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            }
        }

        private void botonesForm1_Load_1(object sender, EventArgs e)
        {

        }

        private void txtnrLicencia_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtnrLicencia_Leave(object sender, EventArgs e)
        {

            ObtenerNombreLicencia();

        }

        private bool ObtenerNombreLicencia()
        {
            int nrLicencia;

            if (!int.TryParse(this.txtnrLicencia.Text, out nrLicencia))
            {
                return false;
            }

            // obtener el nombre de la licencia
            ServiceLicenciatarios un_ServiceLicenciatarios = new ServiceLicenciatarios(new dbSG2000Entities());
            var un_licenciatario = un_ServiceLicenciatarios.ObtenerRegistroxLicencia(this.txtnrLicencia.Text);

            this.txtDescripcion.Text = un_licenciatario.nmNombre + " " + un_licenciatario.nmApellido;
            return false;
        }

        private void txtnrLicencia_Enter(object sender, EventArgs e)
        {
            if (ObtenerNombreLicencia())
            {
                this.cbEstado.Focus();
            }
        }

        private void ADGV_Titulares_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            VisualizarDetalledeCuotas();
        }

        private void VisualizarDetalledeCuotas()
        {
            foreach (DataGridViewRow row in this.ADGV_Titulares.SelectedRows)
            {
                // INSERTE SU CODIGO
                int nro_trans = int.Parse(row.Cells["nro_trans"].Value.ToString());

                Obligaciones una_obligacion = ListaRegistrosObligaciones.Where(c => c.TB_transCab.nro_trans == nro_trans).First();
                var una_TB_ObligacionesCuotas = una_obligacion.TB_ObligacionesCuotas;

                /*var  una_TB_ObligacionesCuotas = ListaRegistrosObligaciones.Select(c => c.TB_ObligacionesCuotas);
                IEnumerable<Obligaciones> lista_Obligaciones = una_TB_ObligacionesCuotas.Where( c=> c.); */


                Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
                // cargamos nuevamente la lista
                lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
                //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
                lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
                lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "nro_trans", "nro_trans", "System.Int32", true, false));
                lista_campo_tipo.Add("cod_tit", new ADGVFieldAdapter("cod_tit", "COD.TITU", "cod_tit", "System.Decimal", true, false));
                lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
                lista_campo_tipo.Add("nro_cuota", new ADGVFieldAdapter("nro_cuota", "NRO.CUOTA", "nro_cuota", "System.String", true, true));
                lista_campo_tipo.Add("importe", new ADGVFieldAdapter("importe", "IMPORTE", "importe", "System.String", true, true));
                lista_campo_tipo.Add("fecha_vencimiento", new ADGVFieldAdapter("fecha_vencimiento", "VENCIMIENTO", "fecha_vencimiento", "System.DateTime", true, true));
                lista_campo_tipo.Add("estado_registro", new ADGVFieldAdapter("estado_registro", "ESTADO", "estado_registro", "System.String", true, true));

                cargarDataGridView_ADGV(this.ADGV_TitularesCuotas, una_TB_ObligacionesCuotas, this.dataSet2, this.bindingSource2, lista_campo_tipo);

                Dictionary<string, Color> estados_color = new Dictionary<string, Color>();

                estados_color.Add("COBRADO", Color.Green);
                estados_color.Add("COBRADO PARCIAL", Color.Orange);
                estados_color.Add("PENDIENTE", Color.White);

                ADGVInicilizations.ColorearGrillaxEstadoVencimiento(this.ADGV_TitularesCuotas, "estado_registro", "fecha_vencimiento", estados_color, "PENDIENTE");

            }
        }

        private void txtnrLicencia_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode   == Keys.Enter) {
                ObtenerNombreLicencia();
            }
        }

        private void cbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbEstado_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void ADGV_Titulares_SelectionChanged(object sender, EventArgs e)
        {
            VisualizarDetalledeCuotas();
        }

        private void ADGV_Titulares_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            VisualizarDetalledeCuotas();
        }
        


    } // Cierra la clase 
       
} // cierra el namespace