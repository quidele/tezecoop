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
    public partial class FrmBuscarComprobantes : Form
    {
        public FrmBuscarComprobantes()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            
            this.dataGridView1.DataSource = "";
            this.lblDgv1Registros.Text = "Registros: " + this.dataGridView1.Rows.Count;
 
        
   
            var txtBuscar = this.txtnrCuponPosnet.Text.Trim() + this.txtnrTarjeta.Text.Trim() + this.txtnrLicencia.Text.Trim() + this.txtFactura.Text.Trim();
            if (txtBuscar.Trim().Length == 0)
            {
                MessageBox.Show(this, "Debe ingresar algún campo de búsqueda", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.txtnrCuponPosnet.Focus();
                return;
            }

            ServiceCupones miServiceCupones = new ServiceCupones ();
            var listaViajes = miServiceCupones.BuscarViajes(this.fechadesde.Value, this.fechahasta.Value, this.cbEmpresa.Text,
                                          this.txtnrCuponPosnet.Text, this.txtnrTarjeta.Text, this.txtnrLicencia.Text , this.txtFactura.Text );
            if (listaViajes.Count()==0 ) {
                  MessageBox.Show(this, "No hay registros que cumplan la condición", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            cargarDataGridView(this.dataGridView1, listaViajes,true,this.dataSet1 , this.bindingSource1);
              this.lblDgv1Registros.Text = "Registros: " + listaViajes.Count().ToString();

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
            Dictionary<string, string> lista_campo_tipo = new Dictionary<string, string>();
            lista_campo_tipo.Add("Nº", "System.Decimal");
            lista_campo_tipo.Add("ID", "System.Decimal");
            lista_campo_tipo.Add("COND_VENTA", "System.String");
            lista_campo_tipo.Add("FECHA", "System.DateTime");
            lista_campo_tipo.Add("LICENCIA", "System.Int32");
            lista_campo_tipo.Add("DOC", "System.String");
            lista_campo_tipo.Add("LETRA", "System.String");
            lista_campo_tipo.Add("PDV", "System.String");
            lista_campo_tipo.Add("NRO", "System.String");
            lista_campo_tipo.Add("MONTO", "System.Double");
            lista_campo_tipo.Add("COMPENSADO", "System.Boolean");
            lista_campo_tipo.Add("CONCILIACION", "System.Boolean");
            lista_campo_tipo.Add("EMPRESA", "System.String");
            lista_campo_tipo.Add("TARJETA", "System.String");
            lista_campo_tipo.Add("CUPON", "System.String");
            lista_campo_tipo.Add("FECHA_PAGO", "System.DateTime");
            


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

                    foreach (var item in lista_datos)
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
                            DataGridViewColumn columna = new DataGridViewColumn();
                            DataGridViewCell cell = new DataGridViewTextBoxCell();
                            columna.CellTemplate = cell;
                            columna.Name = p.Name;
                            columna.HeaderText = p.Name;
                            columna.ReadOnly = true;
                            columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                            dgv.Columns.Add(columna);
                            columna.DataPropertyName = columna.Name;
                            // esta propiedad es la permite enlazar la columna del datagridview con el 
                            // con la columna del datasource: definida en la creacion de dataset

                        }
                        break;
                    }

                } //crea_encabezados


                dataGridView1.CellFormatting +=
            new System.Windows.Forms.DataGridViewCellFormattingEventHandler(
            this.dataGridView1_CellFormatting);

                // Modificamos los Encabezados de las columnas
                foreach (DataGridViewColumn item in dgv.Columns)
                {
                    item.HeaderText = item.HeaderText.Replace("_", " ");
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
            this.fechadesde.Value = DateTime.Now.Date;
            this.fechahasta.Value = DateTime.Now; 
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

        private void cambiarATarjetaDeCréditoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            modificarCondiciondeVenta(ServiceCuponesTransaccion.TARJETA_DE_CREDITO);
        }

        private void modificarCondiciondeVenta (string ptpCuponDestino){

            foreach (DataGridViewRow row in this.dataGridView1.SelectedRows)
            {
                
                decimal nrCupon = decimal.Parse(row.Cells["ID"].Value.ToString()); 
                string tpCuponOrigen = row.Cells["COND_VENTA"].Value.ToString(); 

                ServiceCuponesTransaccion un_ServiceCuponesTransaccion = new ServiceCuponesTransaccion (new dbSG2000Entities ()); 

                if (un_ServiceCuponesTransaccion.ModificarCondicionDeVenta (nrCupon , tpCuponOrigen  ,  ptpCuponDestino   )){
                    MessageBox.Show("La modificación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    btnBuscar_Click(this.btnBuscar, null); 
                }
                else
                {
                    MessageBox.Show("La modificación no se pudo realizar, se ha encontrado el siguiente error: " +
                                    un_ServiceCuponesTransaccion.ListaErrores(), "Atención", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }

        private void cambiarAToolStripMenuItem_Click(object sender, EventArgs e)
        {
            modificarCondiciondeVenta(ServiceCuponesTransaccion.TARJETA_DE_DEBITO);
        }

        private void cambiarATodoPagoTodoPagoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            modificarCondiciondeVenta(ServiceCuponesTransaccion.TARJETA_DE_TODO_PAGO);
        }
        
  

    }
}
