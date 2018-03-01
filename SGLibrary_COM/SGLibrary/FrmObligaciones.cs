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
    public partial class FrmObligaciones : Form
    {


        public ServiceModelGenerico<Obligaciones> serviceModel { get; set; }
        public List<TB_ProveedoresExt> Titulares { get; set; }
        public IEnumerable<TB_ObligacionesCuotasExt> Lista_Vencimientos { get; set; }
        

        public FrmObligaciones()
        {
            InitializeComponent();
        }

        private void FrmABMBase_Load(object sender, EventArgs e)
        {

            botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30).Date;
            this.fechahasta.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();

            this.statusbar_bd.Text = "Base de datos: " + serviceModel.Basededatos;
            this.statusbar_servidor.Text = "Base de datos: " + serviceModel.Servidor;
            this.statusbar_usuario.Text = "Usuario: " + serviceModel.Usuario;
            this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();

        }




        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 



            switch (miboton.Tag.ToString())
            {
                case "EDIT":
                    {
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        if (this.ADGVBusqueda.SelectedRows.Count == 0) return;
                        foreach (DataGridViewRow row in this.ADGVBusqueda.SelectedRows)
                        {
                            // INSERTE SU CODIGO
                            Obligaciones  una_Obligacion = serviceModel.ObtenerRegistroxId("Clave");
                        }
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
                        botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        // INSERTE SU CODIGO
                        // Recuperar el documento OBAP con el numerador correspondiente  
                        ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(new dbSG2000Entities ());

                        this.txtCoddoc.Text =  "OBAP";
                        this.txtSerieDoc.Text = "0";
                        var txtnumerador = this.txtCoddoc.Text + this.txtSerieDoc.Text + (new ServiceParametros()).ObtenerParametro("empresa");
                        this.txtNroDoc.Text = un_ServiceNumeradores.ObtenerValor(txtnumerador).ToString();
                        this.cbFecdoc.Value = DateTime.UtcNow;
                        this.dtpFecValor.Value = DateTime.UtcNow;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
                        this.modoEdicion.Text = "NO";
                        //serviceConciliaciones.obtenerUsuariosConciliaciones();
                        IEnumerable<Obligaciones> listadeRegistros = serviceModel.ObtenerRegistros(this.fechadesde.Value, this.fechahasta.Value, this.cbUsuariosConciliaciones.Text);
                        this.cargarDataGridViewBusqueda_ADGV(ADGVBusqueda, listadeRegistros, "NO", this.dataSet1, this.bindingSource1);
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        ActualizarCantidadRegistros(listadeRegistros.Count());
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;

                    }

                case "OK":
                    {

                        if (this.modoEdicion.Text == "NO")
                        {
                            if (!altaRegistro()) break;
                        }
                        else
                        {
                            if (!ediciondeRegistro()) break;
                        }

                        //cargarCombo(this.cbUsuariosConciliaciones, serviceConciliaciones.obtenerUsuariosConciliaciones());
                        this.modoEdicion.Text = "NO";
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "CANCEL":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        break;
                    }

                case "DELETE":
                    {
                        this.modoEdicion.Text = "NO";
                        foreach (DataGridViewRow row in ADGVBusqueda.SelectedRows)
                        {
                            Obligaciones  unRegistro = serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación del registro ", "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMPLETAR ELIMINACION
                            //serviceModel.AnularRegistro(unRegistro);
                            MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            }

        }


        private void ActualizarCantidadRegistros(int registros)
        {
            this.lblDgvBusquedaRegistros.Text = registros.ToString() + " - Registros";
        }

        public Boolean altaRegistro()
        {
            return true;
        }


        public Boolean ediciondeRegistro()
        {

            try
            {
                // serviceModel.ModificarRegistro(new Object());
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message + serviceModel.ListaErrores(), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;

        }



        public void cargarDataGridViewBusqueda_ADGV(DataGridView dgv, IEnumerable<Obligaciones> lista,
                                           String p_modoEdicion, DataSet p_DataSet, BindingSource p_BindingSource)
        {
            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");

            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "NRO.TRANS", "nro_trans", "System.Decimal",true,true));
            lista_campo_tipo.Add("nro_doc", new ADGVFieldAdapter("nro_doc", "NRO.DOC", "nro_doc", "System.Int32", true, true));
            lista_campo_tipo.Add("fec_doc", new ADGVFieldAdapter("fec_doc", "FECHA", "fec_doc", "System.DateTime", true, true));

            /* lista_campo_tipo.Add("ID", "System.Decimal");
            lista_campo_tipo.Add("FECHA", "System.DateTime");
            lista_campo_tipo.Add("LICENCIA", "System.Int32");
            lista_campo_tipo.Add("DOC", "System.String");
            lista_campo_tipo.Add("LETRA", "System.String");
            lista_campo_tipo.Add("PDV", "System.String");
            lista_campo_tipo.Add("NRO", "System.String");
            lista_campo_tipo.Add("MONTO", "System.Double");
            lista_campo_tipo.Add("EMPRESA", "System.String");
            lista_campo_tipo.Add("TARJETA", "System.String");
            lista_campo_tipo.Add("DOCU", "System.String");
            lista_campo_tipo.Add("DOCU_NRO", "System.String");
            lista_campo_tipo.Add("CUPON", "System.String");
            lista_campo_tipo.Add("CONCILIAR", "System.Boolean"); 
            if (p_modoEdicion == "SI")
            {
                lista_campo_tipo.Add("COMPENSADO", "System.String");
            }
            lista_campo_tipo.Add("FECHA_ACREDITACION", "System.DateTime"); **/


            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());

                dgv.Columns.Clear();
                dgv.AutoGenerateColumns = false;
                dgv.AllowUserToResizeColumns = true;
                dgv.AllowUserToOrderColumns = true;

                foreach (var item in lista)
                {
                    Type t = item.GetType();
                    PropertyInfo[] pi = t.GetProperties();
                    DataGridViewColumn columna1 = new DataGridViewColumn();
                    DataGridViewCell cell1 = new DataGridViewTextBoxCell();
                    columna1.CellTemplate = cell1;
                    columna1.Name = "Nº";
                    columna1.HeaderText = "Nº";
                    columna1.ReadOnly = true;
                    columna1.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna1);
                    columna1.DataPropertyName = "Nº";

                    foreach (PropertyInfo p in pi)
                    {
                        /* 
                         * if (p.Name.CompareTo("CONCILIAR") == 0) continue;
                        if (p.Name.CompareTo("FECHA_ACREDITACION") == 0) continue;*/

                        DataGridViewColumn columna = new DataGridViewColumn();
                        DataGridViewCell cell = new DataGridViewTextBoxCell();
                        columna.CellTemplate = cell;
                        columna.Name = p.Name;
                        columna.HeaderText = p.Name;
                        columna.ReadOnly = true;
                        columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                        columna.DataPropertyName = p.Name; 
                        dgv.Columns.Add(columna);
                    }
                    break;
                }

                /* DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
                doWork.Name = "Name";
                doWork.HeaderText = "HeaderText";
                doWork.FalseValue = false;
                doWork.TrueValue = true;
                doWork.DataPropertyName = "DataPropertyName";
                dgv.Columns.Add(doWork);

 
                CalendarColumn doWork1 = new CalendarColumn();
                doWork1.Name = "CalendarColumn_Name";
                doWork1.HeaderText = "HeaderText";
                doWork1.DefaultCellStyle.Format = "d";
                doWork1.DataPropertyName = "DataPropertyName";
                dgv.Columns.Add(doWork1);
                 */

                // Modificamos los Encabezados de las columnas
                foreach (DataGridViewColumn item in dgv.Columns)
                {
                    item.HeaderText = item.HeaderText.Replace("_", " ");
                }
                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);

                //-------- Agregamos el 
                cargarDataGridViewBusqueda_ADGV_Inicilizacion();

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

        private void cargarDataGridViewBusqueda_ADGV_Inicilizacion()
        {


            //throw new NotImplementedException();
            /*
             
             //Application.DoEvents();
                var row = item;
                switch (row.Cells["NIVEL"].Value.ToString())
                {
                    case "-1": row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                    case "1": row.DefaultCellStyle.BackColor = Color.DarkGreen;
                        row.DefaultCellStyle.ForeColor = Color.White;
                        row.Cells["CONCILIAR"].Value = true;
                        break;
                    case "2": row.DefaultCellStyle.BackColor = Color.LightBlue; break;
                    case "3": row.DefaultCellStyle.BackColor = Color.Orange; break;
                    case "4": row.DefaultCellStyle.BackColor = Color.OrangeRed; break;
                    default:
                        row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                }
                row.Cells["FECHA_PAGO"].Value = row.Cells["FECHA_PAGO"].Value.ToString().Remove(10);
             * 
             * 
             */


        } // Cierra  cargarDataGridViewCupones_ADGV

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

        private bool validarIngresodeDatosCabecera()
        {
            // situacion sin archivo            
            if (this.cbTipoArchivo.Text.Trim().CompareTo ("") ==0){
                if ((this.txtDescripcion.Text.Trim().CompareTo ("")==0 ))
                {
                    MessageBox.Show("Debe ingresar descripción", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtDescripcion.Focus();
                    return false;
                }
                if (!Information.IsNumeric(this.txtMonto.Text))
                {
                    MessageBox.Show(string.Format("El monto ingresada no es válido {0}", this.txtMonto.Text), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtMonto.Focus();
                    return false;
                }
                if (!Information.IsNumeric(this.txtCuotas.Text))
                {
                    MessageBox.Show(string.Format ("la cuota ingresada no es válido {0}",this.txtCuotas.Text ), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.txtCuotas.Focus();
                    return false;
                }
            }
            
            // situacion con archivo
            if (this.cbTipoArchivo.Text !=""){

            }            
            return true;
        }


        private void agregarLicenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            // si no cumple las validaciones nos vamos
            if (!validarIngresodeDatosCabecera()) return;

            FrmBuscarTitulares un_FrmBuscarTitulares = new FrmBuscarTitulares();
            // Enviamos la lista que ya se encuentra en el formulario 
            un_FrmBuscarTitulares.TitularesaExcluir = this.Titulares; 
            // excluir a los titulares que ya existen en la grilla
            un_FrmBuscarTitulares.ShowDialog();
            // antes de realizar estos validar que no agregar 
            if (this.Titulares == null)
                this.Titulares = un_FrmBuscarTitulares.Titulares;
            else
                this.Titulares.AddRange (un_FrmBuscarTitulares.Titulares) ;
            
            // cargamos nuevamente la lista
            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("cdProveedor", new ADGVFieldAdapter("cdProveedor", "COD.TITU", "cdProveedor", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nmNombre", new ADGVFieldAdapter("nmNombre", "NOMBRE", "nmNombre", "System.String", true, true));
            lista_campo_tipo.Add("nmApellido", new ADGVFieldAdapter("nmApellido", "APELLIDO", "nmApellido", "System.String", true, true));

            cargarDataGridView_ADGV(this.ADGV_Titulares, this.Titulares, this.dataSet1, this.bindingSource1, lista_campo_tipo);

            ServiceObligaciones un_ServiceObligaciones = new ServiceObligaciones(new dbSG2000Entities());

            this.Lista_Vencimientos = un_ServiceObligaciones.calcularVencimientos(this.Titulares, decimal.Parse(this.txtMonto.Text),
                decimal.Parse(this.txtCuotas.Text), this.dtpFecValor.Value, this.cbPeriodo.Text);

            
                // cargamos nuevamente la lista
            lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "nro_trans", "nro_trans", "System.Int32", true, false));
            lista_campo_tipo.Add("cod_tit", new ADGVFieldAdapter("cod_tit", "COD.TITU", "cod_tit", "System.Decimal", true, false));
            // lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_cuota", new ADGVFieldAdapter("nro_cuota", "NRO.CUOTA", "nro_cuota", "System.String", true, true));
            lista_campo_tipo.Add("importe", new ADGVFieldAdapter("importe", "IMPORTE", "importe", "System.String", true, true));
            lista_campo_tipo.Add("fecha_vencimiento", new ADGVFieldAdapter("fecha_vencimiento", "VENCIMIENTO", "fecha_vencimiento", "System.DateTime", true, true));

            cargarDataGridView_ADGV(this.ADGV_TitularesCuotas, this.Lista_Vencimientos, this.dataSet2, this.bindingSource2, lista_campo_tipo);

        }


        private void ADGV_TitularesCuotas_Inicilizacion()
        {

            // Coloreamos cortando por licencia 
            //  para asignar colores tenemos que realuizar un corte de control 
            // por licencia

            foreach (DataGridViewRow item in ADGV_TitularesCuotas.Rows)
            {
               
                var row = item;
                switch (row.Cells["NIVEL"].Value.ToString())
                {
                    case "-1": row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                    case "1": row.DefaultCellStyle.BackColor = Color.DarkGreen;
                        row.DefaultCellStyle.ForeColor = Color.White;
                        row.Cells["CONCILIAR"].Value = true;
                        break;
                    case "2": row.DefaultCellStyle.BackColor = Color.LightBlue; break;
                    case "3": row.DefaultCellStyle.BackColor = Color.Orange; break;
                    case "4": row.DefaultCellStyle.BackColor = Color.OrangeRed; break;
                    default:
                        row.Cells["CONCILIAR"].Value = false;
                        row.ReadOnly = true;
                        row.DefaultCellStyle.BackColor = Color.White;
                        row.DefaultCellStyle.ForeColor = Color.Black;
                        break;
                }
                // row.Cells["fecha_vencimiento"].Value = row.Cells["fecha_vencimiento"].Value.ToString().Remove(10);
             
            }

             
             


        } // Cierra  ADGV_TitularesCuotas_Inicilizacion

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
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(int.Parse(row.Cells["cdProveedor"].Value.ToString()), row.Cells["nrLicencia"].Value.ToString(), row.Cells["nmNombre"].Value.ToString(), row.Cells["nmApellido"].Value.ToString());
                un_titu_nuevo  = Titulares.Find(x => x.cdProveedor == un_titu_nuevo.cdProveedor);
                Titulares.Remove(un_titu_nuevo);
            }


            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("cdProveedor", new ADGVFieldAdapter("cdProveedor", "COD.TITU", "cdProveedor", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nmNombre", new ADGVFieldAdapter("nmNombre", "NOMBRE", "nmNombre", "System.String", true, true));
            lista_campo_tipo.Add("nmApellido", new ADGVFieldAdapter("nmApellido", "APELLIDO", "nmApellido", "System.String", true, true));

            // volvemos a cargarCombo la lista
            cargarDataGridView_ADGV(this.ADGV_Titulares, this.Titulares, this.dataSet1, this.bindingSource1, lista_campo_tipo);


            ServiceObligaciones un_ServiceObligaciones = new ServiceObligaciones(new dbSG2000Entities());

            this.Lista_Vencimientos = un_ServiceObligaciones.calcularVencimientos(this.Titulares, decimal.Parse(this.txtMonto.Text),
                decimal.Parse(this.txtCuotas.Text), this.dtpFecValor.Value, this.cbPeriodo.Text);


            // cargamos nuevamente la lista
            lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "nro_trans", "nro_trans", "System.Int32", true, false));
            lista_campo_tipo.Add("cod_tit", new ADGVFieldAdapter("cod_tit", "COD.TITU", "cod_tit", "System.Decimal", true, false));
            // lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nro_cuota", new ADGVFieldAdapter("nro_cuota", "NRO.CUOTA", "nro_cuota", "System.String", true, true));
            lista_campo_tipo.Add("importe", new ADGVFieldAdapter("importe", "IMPORTE", "importe", "System.String", true, true));
            lista_campo_tipo.Add("fecha_vencimiento", new ADGVFieldAdapter("fecha_vencimiento", "VENCIMIENTO", "fecha_vencimiento", "System.DateTime", true, true));

            cargarDataGridView_ADGV(this.ADGV_TitularesCuotas, this.Lista_Vencimientos, this.dataSet2, this.bindingSource2, lista_campo_tipo);


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
                
        }// cierra metodo


    } // Cierra la clase 
       
} // cierra el namespace