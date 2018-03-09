using SGLibrary.GUIUtilities;
using SGLibrary.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class FrmBuscarTitulares: Form
    {

        public List<TB_ProveedoresExt> Titulares { get; set; }
        public List<TB_ProveedoresExt> TitularesaExcluir { get; set; }

        public FrmBuscarTitulares()
        {
            InitializeComponent();
        }

       

        public void cargarDataGridView(DataGridView dgv, IEnumerable<Object> lista)
        {

            //dgv.Rows.Clear();
            dgv.Columns.Clear();

            foreach (var item in lista)
            {
                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = p.Name;
                    columna.HeaderText = p.Name;
                    columna.ReadOnly = true;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                }
                break;
            }



            foreach (object item in lista)
            {
                var row = dgv.Rows.Add();
                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    dgv.Rows[row].Cells[p.Name].Value = p.GetValue(item, null);
                }
            }

            // Modificamos los Encabezados de las columnas
            foreach (DataGridViewColumn item in dgv.Columns)
            {
                item.HeaderText = item.HeaderText.Replace("_", " ");
            }


        }


        public void cargarDataGridView(DataGridView dgv, IEnumerable<Object> lista_datos, bool crea_encabezados, DataSet p_DataSet, BindingSource p_BindingSource)
        {

            /*
              this.dataSet1.Clear();
            this.bindingSource1.Clear();
            this.dataGridView1.Rows.Clear(); 
             * */
           
            Dictionary<string, ADGVFieldAdapter> lista_campo_tipo = new Dictionary<string, ADGVFieldAdapter>();
            //lista_campo_tipo.Add("NOMBRE DE CAMPO", "TIPO DE CAMPO");
            lista_campo_tipo.Add("Nº", new ADGVFieldAdapter("Nº", "Nº", "Nº", "System.Int32",true,true));
            lista_campo_tipo.Add("cdProveedor", new ADGVFieldAdapter("cdProveedor", "COD.TITU", "cdProveedor", "System.Decimal", true, false));
            lista_campo_tipo.Add("nrLicencia", new ADGVFieldAdapter("nrLicencia", "LICENCIA", "nrLicencia", "System.Int32", true, true));
            lista_campo_tipo.Add("nmNombre", new ADGVFieldAdapter("nmNombre", "NOMBRE", "nmNombre", "System.String", true, true));
            lista_campo_tipo.Add("nmApellido", new ADGVFieldAdapter("nmApellido", "APELLIDO", "nmApellido", "System.String", true, true)); 


            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista_datos, lista_campo_tipo);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista_datos.ToString());

                if (crea_encabezados)
                {
                    dgv.AutoGenerateColumns = false;
                    //dgv.Rows.Clear();
                    dgv.Columns.Clear();

                    foreach (var item in lista_campo_tipo)
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

                } //crea_encabezados


               /* dataGridView1.CellFormatting +=
            new System.Windows.Forms.DataGridViewCellFormattingEventHandler(
            this.dataGridView1_CellFormatting);*/


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

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            // Por ahora aca no programamos nada
        }

        private void txtFactura_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrLicencia_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrTarjeta_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtnrCuponPosnet_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void fechahasta_ValueChanged(object sender, EventArgs e)
        {

        }

        private void fechadesde_ValueChanged(object sender, EventArgs e)
        {

        }

        private void FrmBuscarComprobantes_Load(object sender, EventArgs e)
        {
            Titulares = new List<TB_ProveedoresExt>();
            ServiceLicenciatarios miServiceLicenciatarios = new ServiceLicenciatarios(new dbSG2000Entities());
            IEnumerable<TB_Proveedores> lista;
            if (TitularesaExcluir == null)
                lista = miServiceLicenciatarios.ObtenerTodosLosRegistros(); 
            else
            {
                //var listaaexcluir = TitularesaExcluir.ToList<TB_Proveedores>(); // casteamos la lista
                var listaaexcluir = TitularesaExcluir.Select(x => x.cdProveedor).ToList<int>();
                lista = miServiceLicenciatarios.ObtenerTodosLosRegistrosConExclusion(listaaexcluir);
            }
            if (lista.Count() == 0)
            {
                MessageBox.Show(this, "No hay registros que cumplan la condición", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            cargarDataGridView(this.dataGridView1, lista, true, this.dataSet1, this.bindingSource1);
            ADGVInicilizations.ADGV_ColorearGrillaxCorteValorFormatearFecha(this.dataGridView1, "nrLicencia", "");

            this.lblDgv1Registros.Text = "Registros: " + lista.Count().ToString();

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_FilterStringChanged(object sender, EventArgs e)
        {
            this.bindingSource1.Filter = this.dataGridView1.FilterString;
            this.lblDgv1Registros.Text = "Registros: " + this.bindingSource1.List.Count.ToString(); 

        }

        private void dataGridView1_SortStringChanged(object sender, EventArgs e)
        {

            this.bindingSource1.Sort = this.dataGridView1.SortString;
        }

        private void seleccionarToolStripMenuItem_Click(object sender, EventArgs e)
        {

            foreach (DataGridViewRow row in this.dataGridView1.SelectedRows)
            {
                TB_ProveedoresExt  un_titu_buscado=null;
                TB_ProveedoresExt un_titu_nuevo = new TB_ProveedoresExt(int.Parse(row.Cells["cdProveedor"].Value.ToString()), row.Cells["nrLicencia"].Value.ToString(), row.Cells["nmNombre"].Value.ToString(), row.Cells["nmApellido"].Value.ToString());
                if (TitularesaExcluir !=null)
                    un_titu_buscado = TitularesaExcluir.Find (x => x.cdProveedor == un_titu_nuevo.cdProveedor  );

                if (un_titu_buscado==null)
                    Titulares.Add(un_titu_nuevo);  
            }
            this.Hide();
        }

        private void dataGridView1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            seleccionarToolStripMenuItem_Click(this.seleccionarToolStripMenuItem, e);
        }
    }
}
