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
    public partial class FrmCargaTarifasEjemploADGV : Form
    {


        public FrmCargaTarifasEjemploADGV()
        {
            InitializeComponent();
            this.dataGridView1.AutoGenerateColumns = true;
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

                // A la lista la transfiere al DATASET
                this.dataSet = Extensiones.Extensions.ToDataSet(listaTarifas);
                //Al binding source le configuramos el dataset
                this.bindingSource.DataSource = this.dataSet;
                // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
                this.bindingSource.DataMember = this.dataSet.Tables[0].TableName;

                // dentro de este metodo esta el bindeo del datagrid al binding sourcer
                cargarDataGridViewBusqueda(this.dataGridView1, listaTarifas,  this.bindingSource);
             



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


     


        public void cargarDataGridViewBusqueda(DataGridView dgv, IEnumerable<Object> listaHeaders,  BindingSource lista)
        {
            // le decimos al control que vamos a crear las columnas en forma manual
            dgv.AutoGenerateColumns = false;

            //dgv.Rows.Clear();
            dgv.Columns.Clear();
            
            foreach (var item in listaHeaders)
            {

                Type t = item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    DataGridViewTextBoxColumn columna = new DataGridViewTextBoxColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    //columna.CellTemplate = cell;
                    columna.Name = p.Name;
                    columna.HeaderText = p.Name;
                    columna.DataPropertyName = p.Name;  // esta propiedad es la permite enlazar la columna del datagridview con el 
                                                        // con la columna del datasource: definida en la creacion de dataset
                    //columna.ReadOnly = true;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                }
                break;
            }

            // Modificamos los Encabezados de las columnas
            foreach (DataGridViewColumn item in dgv.Columns)
            {
                   item.HeaderText = item.HeaderText.Replace("_", " ");
            }

            dgv.DataSource = lista;

            Console.WriteLine(lista.Count.ToString()); 

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
              /* datosprueba = ((DataRowView)this.bindingSource.List[0]).DataView.ToTable().Rows.Cast<DataRow>().Select(r =>
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

              cargarDataGridViewBusqueda(this.dataGridView1, datosprueba); */
           }
             

                
          
        }


       
    }// cierre clase Form 




}
