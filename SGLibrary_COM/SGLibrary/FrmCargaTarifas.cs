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
            this.dataGridView1.AutoGenerateColumns = true;
            nombreArchivo = ""; 
            
        }


        private String nombreArchivo;
        private List<TarifasXLS> listaTarifas;
        private List<TarifasXLS> datosprueba; 

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
                this.dataSet = Extensiones.Extensions.ToDataSet(listaTarifas);
                this.bindingSource.DataSource = this.dataSet;
                this.bindingSource.DataMember = this.dataSet.Tables[0].TableName; 
                //this.dataGridView1.DataSource = bindingSource;

                //this.dataGridView1.DataSource = listaTarifas;

                if (this.bindingSource.List.Count > 0)
                {
                    datosprueba = ((DataRowView)this.bindingSource.List[0]).DataView.ToTable().Rows.Cast<DataRow>().Select(r =>
                    new TarifasXLS()
                    {
                        Codigo = r.Field<int>("Codigo"),
                        Descripcion = r.Field<String>("Descripcion"),
                        Kilometros = r.Field<double>("Kilometros"),
                        Muestra_en_la_Web = r.Field<bool>("Muestra_en_la_Web"),
                        Peaje = r.Field<double>("Peaje"),
                        Precio = r.Field<double>("Precio"),
                        Total = r.Field<double>("Total")
                    }).ToList();

                    cargarDataGridViewBusqueda(this.dataGridView1, datosprueba);
                }


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
            
           MessageBox.Show(this.dataGridView1.FilterString.Replace ("CAPITAL","CAPITAL%"));
           this.bindingSource.Filter = this.dataGridView1.FilterString.Replace ("CAPITAL","CAPITAL%"); ;



           MessageBox.Show( this.bindingSource.List.Count.ToString() );

           //this.bindingSource. 
           
            //List<TarifasXLS> products = (List<TarifasXLS>)this.bindingSource.DataSource;


       
     

           if (this.bindingSource.List.Count > 0 ) {
              datosprueba = ((DataRowView)this.bindingSource.List[0]).DataView.ToTable().Rows.Cast<DataRow>().Select(r =>
              new TarifasXLS()
              {
                  Codigo = r.Field<int>("Codigo"),
                  Descripcion = r.Field<String>("Descripcion"),
                  Kilometros = r.Field<double>("Kilometros"),
                  Muestra_en_la_Web = r.Field<bool>("Muestra_en_la_Web"),
                  Peaje = r.Field<double>("Peaje"),
                  Precio = r.Field<double>("Precio"),
                  Total = r.Field<double>("Total")
              }).ToList();

              cargarDataGridViewBusqueda(this.dataGridView1, datosprueba);
           }
             

                
          
        }


       
    }// cierre clase Form 




}
