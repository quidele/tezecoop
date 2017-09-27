using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Reflection;

namespace SGLibrary
{
    public partial class FrmCargaTarifas : Form
    {


        public FrmCargaTarifas()
        {
            InitializeComponent();
            nombreArchivo = ""; 
            
        }


        private String nombreArchivo;
        private List<TarifasXLS> listaTarifas; 

        public String getNombreArchivo() {
            return nombreArchivo;
        }

        public void setNombreArchivo(String valor)
        {
            nombreArchivo = valor;
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            this.button2.Enabled = false;
            openFileDialog1.FileName = "";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                /* MessageBox.Show ( openFileDialog1.FileName); */ 
                nombreArchivo = openFileDialog1.FileName;
                textBox1.Text = openFileDialog1.FileName;

                ServiceExcel miServiceExcel = new ServiceExcel();
                miServiceExcel.InitializeExcel(textBox1.Text);
                dataGridView1.AutoSize = true;

                
                //listaProductos = miServiceExcel.ReadMyExcel();

                listaTarifas = miServiceExcel.ReadMyExcelTarifas();

                dataGridView1.DataSource = listaTarifas;            

            }
            this.button2.Enabled = true;

            /* dataGridView1.Rows.Add(tranList[0]); */

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            textBox1.Text = ""; 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ServiceTarifas miServTarifas = new ServiceTarifas ();
            miServTarifas.ActualizarTarifas(listaTarifas);
            MessageBox.Show("El proceso ha finalizado con exito");
            this.Hide();
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_FilterStringChanged(object sender, EventArgs e)
        {
            
           MessageBox.Show(this.dataGridView1.FilterString);
           this.bindingSource.Filter = this.dataGridView1.FilterString;
            
        }


    }// cierre clase Form 
}
