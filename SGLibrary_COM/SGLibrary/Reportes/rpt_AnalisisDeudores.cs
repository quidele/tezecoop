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

namespace SGLibrary.Reportes
{
    public partial class rpt_AnalisisDeudores : Form
    {


        public ServiceModel serviceModel { get; set; }



        public rpt_AnalisisDeudores()
        {
            InitializeComponent();
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {

            using (var context = new dbSG2000Entities())
            {
                this.statusbar_bd.Text = "Base de datos: " + context.Database.Connection.Database;
                this.statusbar_servidor.Text = "Base de datos: " + context.Database.Connection.DataSource;

                
            }


            botonesForm1.configMododeEdicion(ABMBotonesForm.VIEW);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();
        }



        public void deshabilitarycolorearGrillaABM()
        {
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                {
                    item.ReadOnly = true;
                    item.DefaultCellStyle.BackColor = Color.Gray;
                }
            }
        }

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            this.panelcarga.Enabled = true;

            switch (miboton.Tag.ToString())
            {
                case "EDIT":
                    {

                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                        {
                            this.modoEdicion.Text = "SI";
                            Object una_registro = serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());

                        }
                        deshabilitarycolorearGrillaABM();
                        break;
                    }
                case "ADD":
                    {
                        this.modoEdicion.Text = "NO";


                        this.txtdsUsuario.Text = serviceModel.Usuario;
                        this.txtnrCajaAdm.Text = serviceModel.CajaAdm;
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        dataGridView1.Columns.Clear();
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        break;
                    }
                case "FIND":
                    {


                        this.modoEdicion.Text = "NO";
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;

                    }

                case "OK":
                    {

                        if (this.modoEdicion.Text == "NO")
                        {
                            if (!altadeRegistro()) break;
                        }
                        else
                        {
                            if (!ediciondeRegistro()) break;
                        }


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
                        foreach (DataGridViewRow row in dataGridView2.SelectedRows)
                        {


                            Object un_registro = serviceModel.ObtenerRegistro(row.Cells["ID"].Value.ToString());
                            DialogResult dialogResult = MessageBox.Show("Confirma la eliminación del registro " + un_registro.ToString(), "Atención", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (dialogResult == DialogResult.No) break;
                            // COMLETAR ELIMINACION
                            serviceModel.AnularRegistro(un_registro);
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


        public Boolean altadeRegistro()
        {

            List<Decimal> lista = new List<Decimal>();


            /*  validar a nivel de Items*/
            foreach (DataGridViewRow item in dataGridView1.Rows)
            {

            }

            if ((lista.Count() == 0))
            {
                MessageBox.Show("Debe seleccionar algún comprobante.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                dataGridView1.Focus();
                return false;
            }
            return true;
        }


        public Boolean ediciondeRegistro()
        {
            List<Decimal> listaClaveRegistros = new List<Decimal>();

            foreach (DataGridViewRow item in dataGridView1.Rows)
            {
                // Si existen modificaciones agregar a la lista    
                listaClaveRegistros.Add(Decimal.Parse(item.Cells["ID"].EditedFormattedValue.ToString()));
            }

            if (listaClaveRegistros.Count() == 0)
            {
                MessageBox.Show("Debe seleccionar algún registro");
                dataGridView1.Focus();
                return false;
            }

            return true;
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

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }

        private void panelbusqueda_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cmdAnalisisDeudores_Click(object sender, EventArgs e)
        {
            IEnumerable<Object> lista;

            using (var context = new dbSG2000Entities())
            {

                var listaSQL = context.spu_obtenerDeudoresaFecha( this.fechadesde.Value.Date);
                Trace.TraceInformation(listaSQL.ToString());
                lista = listaSQL.ToList(); 
            }
            // lista.ToList();
            cargarDataGridViewBusqueda(dataGridView2, lista);
            deshabilitarycolorearGrillaABM();

        }

        public void cargarDataGridViewBusqueda(DataGridView dgv, IEnumerable<Object> lista)
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

    } // Cierre declaracion Clase 
} // Cierre namespace
