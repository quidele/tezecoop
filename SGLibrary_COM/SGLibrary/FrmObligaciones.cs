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

namespace SGLibrary
{
    public partial class FrmObligaciones : Form
    {


        public ServiceModelGenerico<Obligaciones> serviceModel { get; set; }

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
                        this.cbFecValor.Value = DateTime.UtcNow;
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

            lista_campo_tipo.Add("nro_trans", new ADGVFieldAdapter("nro_trans", "NRO.TRANS", "nro_trans", "System.Decimal"));
            lista_campo_tipo.Add("nro_doc", new ADGVFieldAdapter("nro_doc", "NRO.DOC", "nro_doc", "System.Int32"));
            lista_campo_tipo.Add("fec_doc", new ADGVFieldAdapter("fec_doc", "FECHA", "fec_doc", "System.DateTime"));

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
            return !char.IsDigit(caracter) && !char.IsControl(caracter) && (caracter != '.');
        }

        private void agregarLicenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmBuscarTitulares un_FrmBuscarTitulares = new FrmBuscarTitulares();
            un_FrmBuscarTitulares.ShowDialog();
        }

    } // Cierra la clase 
       
} // cierra el namespace