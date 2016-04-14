using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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


        public String getNombreArchivo() {
            return nombreArchivo;
        }

        public void setNombreArchivo(String valor)
        {
            nombreArchivo = valor;
        }
        
        private void button1_Click(object sender, EventArgs e)
        {

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                /* MessageBox.Show ( openFileDialog1.FileName); */ 
                nombreArchivo = openFileDialog1.FileName;
                textBox1.Text = openFileDialog1.FileName;

                ServiceExcel miServiceExcel = new ServiceExcel();
                miServiceExcel.InitializeExcel(textBox1.Text);
                dataGridView1.AutoSize = true;
                dataGridView1.DataSource = miServiceExcel.ReadMyExcel();
            

            }


            /* dataGridView1.Rows.Add(tranList[0]); */

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            textBox1.Text = ""; 
        }
    }
}
