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

namespace SGLibrary
{
    public partial class FrmConciliaciones : Form
    {


        public ServiceConciliacion serviceConciliaciones { get; set; }
        public FrmConciliaciones()
        {
            InitializeComponent();
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {
            //botonesForm1.configMododeEdicion( ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            this.fechadesde.Value = DateTime.Now.AddDays(-30);
            this.fechahasta.Value = DateTime.Now.Date;
            this.botonesForm1.InicializarFindBoton();
        }
            
 

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            //MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 
            switch (miboton.Tag.ToString ()){
                case "EDIT" : {
                    this.panelcarga.Visible = true;
                    this.panelbusqueda.Visible  = false;
                    //botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                    break;
                }
                case "ADD":
                    {
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        var listadeViajesaConciliar = serviceConciliaciones.ObtenerViajesaConciliar();
                        cargarDataGridViewCupones(dataGridView1, listadeViajesaConciliar); 
                        //dataGridView1.DataSource = listadeViajesaConciliar;
                        //dataGridView1.ReadOnly = false ;
                        //dataGridView1.Columns["CONCILIAR"].ReadOnly = false;
                        break;
                    }
                case "FIND":
                    {
                        this.panelcarga.Visible =  false ;
                        this.panelbusqueda.Visible = true;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        var listadeConciliaciones = serviceConciliaciones.obtenerConciliaciones(this.fechadesde.Value, this.fechahasta.Value);
                        cargarDataGridViewConciliaciones(dataGridView2, listadeConciliaciones); 
                        break;
                    }
                
                case "OK":
                    {

                        List<Decimal> lista = new   List<Decimal> ();
                        foreach (DataGridViewRow item in dataGridView1.Rows)
                        {
                            Console.WriteLine(item.Cells["CONCILIAR"].EditedFormattedValue);
                            if (item.Cells["CONCILIAR"].EditedFormattedValue.ToString() == "True")
                            {
                                lista.Add( Decimal.Parse ( item.Cells["ID"].EditedFormattedValue.ToString()));
                            }
                           //DataGridViewCheckBoxColumn unControl = (DataGridViewCheckBoxColumn) item.Cells["CONCILIAR"].;
                           //Console.WriteLine ( unControl.TrueValue);
                        }

                  
                        var una_conciliacion = new TB_Conciliacion();
                        una_conciliacion.dtConciliacion = this.dtConciliacion.Value;
                        var listaaactualizar = serviceConciliaciones.agregarConciliacion(lista, una_conciliacion);
                        foreach (var item in listaaactualizar)
                        {
                            Console.WriteLine(item);
                        }
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;
                    }
                case "CANCEL":
                    {
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        break;
                    }

                case "DELETE":
                    {
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        //botonesForm1.configMododeEdicion(ABMBotonesForm.DELETE);
                        break;
                    }
                case "EXIT":
                    {
                        this.Close();
                        break;
                    }
            } 

        }

  


        public void cargarDataGridViewCupones(DataGridView dgv, IEnumerable<Object> lista )
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

            //dgv.Columns.Add("ID","ID");
            //columna = new DataGridViewColumn();
            //cell = new DataGridViewTextBoxCell();
            //columna.CellTemplate = cell;
            //columna.Name = "DOC";
            //columna.HeaderText = "DOC";
            //columna.ReadOnly = true;
            //dgv.Columns.Add(columna);

            //dgv.Columns.Add("LETRA", "LETRA");
            //dgv.Columns.Add("PDV", "PDV");
            //dgv.Columns.Add("NRO", "NRO");
            //dgv.Columns.Add("FECHA", "FECHA");
            //dgv.Columns.Add("MONTO", "MONTO");
            DataGridViewCheckBoxColumn doWork = new DataGridViewCheckBoxColumn();
            doWork.Name = "CONCILIAR";
            doWork.HeaderText = "CONCILIAR";
            doWork.FalseValue = "0";
            doWork.TrueValue = "1";
           
            dgv.Columns.Add(doWork);

            foreach (object item in lista)
            {
                var row = dgv.Rows.Add();
                Type t =item.GetType();
                PropertyInfo[] pi = t.GetProperties();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                    dgv.Rows[row].Cells[p.Name].Value = p.GetValue(item, null);
                }
            }


        }

        public void cargarDataGridViewConciliaciones(DataGridView dgv, IEnumerable<Object> lista)
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

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }


      
    }
}
