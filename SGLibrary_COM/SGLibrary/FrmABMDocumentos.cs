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

namespace SGLibrary
{
    public partial class FrmABMDocumentos : Form
    {


        public ServiceModelGenerico<TB_documentos> serviceModel { get; set; }

        public FrmABMDocumentos()
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
                        this.modoEdicion.Text = "SI";

                        if (this.DGV_Busqueda.SelectedRows.Count == 0 ) return; 
                        foreach (DataGridViewRow row in this.DGV_Busqueda.SelectedRows)
                        {
                            TB_documentos un_TB_documento = serviceModel.ObtenerRegistroxId(row.Cells["ID"].Value.ToString());
                            this.txtCoddoc.Text = un_TB_documento.cod_doc;
                            this.txtNomDoc.Text = un_TB_documento.nom_doc;
                        }
                        // INSERTE SU CODIGO
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
                        botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                        this.txtCoddoc.ReadOnly = true; 
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        //var registroBlanco = serviceModel.ObtenerRegistroBlanco();

                        // INSERTE SU CODIGO
                        this.txtCoddoc.Text = "";
                        this.txtNomDoc.Text = "";
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {
                        this.modoEdicion.Text = "NO";
                        IEnumerable<Object> listadeRegistros = serviceModel.ObtenerTodosLosRegistros();
                        this.cargarDataGridViewBusqueda_ADGV(DGV_Busqueda, listadeRegistros, "NO", this.dataSet1, this.bindingSource1);
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
                        foreach (DataGridViewRow row in DGV_Busqueda.SelectedRows)
                        {
                            TB_documentos  unRegistro = serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación del registro ", "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMPLETAR ELIMINACION
                            serviceModel.AnularRegistro(unRegistro);
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


        private void ActualizarCantidadRegistros(int registros){
            this.lblDgvBusquedaRegistros.Text  = registros.ToString () + " - Registros"; 
        }

        public Boolean altaRegistro()
        {


            try
            {
                TB_documentos objDocumento = new TB_documentos();
                if (this.txtCoddoc.Text.Trim () == "")
                {
                    MessageBox.Show("Debe ingresar el campo Codigo", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    this.txtCoddoc.Focus();
                    return false;
                }
                if (this.txtNomDoc.Text.Trim() == "")
                {
                    MessageBox.Show("Debe ingresar el campo Nombre", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    this.txtNomDoc.Focus();
                    return false;
                }
                objDocumento.cod_doc = this.txtCoddoc.Text;
                objDocumento.nom_doc = this.txtNomDoc.Text; 
                serviceModel.AgregarRegistro(objDocumento);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + serviceModel.ListaErrores(), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }


        public Boolean ediciondeRegistro()
        {

            try
            {
                TB_documentos objDocumento = new TB_documentos();
                if (this.txtCoddoc.Text.Trim() == "")
                {
                    MessageBox.Show("Debe ingresar el campo Codigo", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    this.txtCoddoc.Focus();
                    return false;
                }
                if (this.txtNomDoc.Text.Trim() == "")
                {
                    MessageBox.Show("Debe ingresar el campo Nombre", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    this.txtNomDoc.Focus();
                    return false;
                }
                objDocumento.cod_doc = this.txtCoddoc.Text;
                objDocumento.nom_doc = this.txtNomDoc.Text;
                serviceModel.ModificarRegistro(objDocumento);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + serviceModel.ListaErrores(), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;

        }



        public void cargarDataGridViewBusqueda_ADGV(DataGridView dgv, IEnumerable<Object> lista,
                                           String p_modoEdicion, DataSet p_DataSet, BindingSource p_BindingSource)
        {


            if ( lista.Count() == 0 )   return;

            Dictionary<string, string> lista_campo_tipo = new Dictionary<string, string>();

            lista_campo_tipo.Add("Nº", "System.String");
            lista_campo_tipo.Add("cod_doc", "System.String");
            lista_campo_tipo.Add("nom_doc", "System.String");
            lista_campo_tipo.Add("usuario_mod", "System.String");
            lista_campo_tipo.Add("fecha_mod", "System.DateTime");

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


                //dgv.Rows.Clear();
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
                doWork.Name = "CONCILIAR";
                doWork.HeaderText = "CONCILIAR";
                doWork.FalseValue = false;
                doWork.TrueValue = true;
                doWork.DataPropertyName = "CONCILIAR";
                dgv.Columns.Add(doWork);

 
                CalendarColumn doWork1 = new CalendarColumn();
                doWork1.Name = "FECHA_ACREDITACION";
                doWork1.HeaderText = "FECHA DE ACREDITACION";
                doWork1.DefaultCellStyle.Format = "d";
                doWork1.DataPropertyName = "FECHA_ACREDITACION";
                dgv.Columns.Add(doWork1);*/

                // Modificamos los Encabezados de las columnas
                foreach (DataGridViewColumn item in dgv.Columns)
                {
                    item.HeaderText = item.HeaderText.Replace("_", " ");
                }
                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);

                //-------- Agregamos el 
                cargarDataGridViewCupones_ADGV_Inicilizacion();

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

        private void cargarDataGridViewCupones_ADGV_Inicilizacion()
        {
            //throw new NotImplementedException();
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
            this.bindingSource1.Filter = this.DGV_Busqueda.FilterString;
            this.lblDgvBusquedaRegistros.Text = "Registros: " + this.bindingSource1.List.Count.ToString();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }


    }
}