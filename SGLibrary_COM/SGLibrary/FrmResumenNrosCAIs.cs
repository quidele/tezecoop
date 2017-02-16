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
using SGLibrary.ArchivoTarjetas;
using System.Diagnostics;
using SGLibrary.Extensiones;
using Microsoft.VisualBasic;

namespace SGLibrary
{
    public partial class FrmResumenNrosCAIs : Form
    {


        public ServiceModel serviceModel { get; set; }



        public FrmResumenNrosCAIs()
        {
            InitializeComponent();
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {

            using (var context = new dbSG2000Entities())
            {
                this.statusbar_bd.Text = "Base de datos: " + context.Database.Connection.Database;
                this.statusbar_servidor.Text = "Base de datos: " + context.Database.Connection.DataSource;
                this.statusbar_usuario.Text = "usuario: " + serviceModel.Usuario;
                this.statusbar_nrocaja.Text = "Caja Nro: " + serviceModel.CajaAdm;
                this.statusbar_version.Text = "Versión: " + typeof(SGLibrary.ServiceModel).Assembly.GetName().Version.ToString();

            }


            botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
            
            this.panelbusqueda.Visible = true;
            //this.botonesForm1.InicializarFindBoton();
        }



        
        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            

            switch (miboton.Tag.ToString())
            {
                
                case "FIND":
                    {
                       
                        if (!Information.IsNumeric(this.txtMes.Text)) {
                            MessageBox.Show("El mes ingresado no es válido", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.txtMes.Focus();
                            return;
                        }

                        ServiceCAI objServiceCAI = new ServiceCAI();
                        var listadeRegistros = objServiceCAI.obtenerEstadoCAIs (Convert.ToInt32(this.txtMes.Text), Convert.ToInt32(this.txtAnio.Text));
                        cargarDataGridViewFIND(this.dataGridView2, listadeRegistros);
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;

                    }

                case "OK":
                    {

                        var btnFind = new ToolStripButton();
                        btnFind.Tag = "FIND";
                        MessageBox.Show("La operación se ha realizado con éxito.", "Atención", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        botonesForm1_ClickEventDelegateHandler(btnFind, null);
                        break;
                    }
                case "CANCEL":
                    {
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        break;
                    }

                case "DELETE":
                    {
                        
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









        public void cargarDataGridViewFIND(DataGridView dgv, IEnumerable<Object> lista)
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

        private void txtMes_TextChanged(object sender, EventArgs e)
        {

        }



    } // Cierre declaracion Clase 
} // Cierre namespace
