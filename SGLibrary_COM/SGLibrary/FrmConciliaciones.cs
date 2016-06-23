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
            botonesForm1.configMododeEdicion( ABMBotonesForm.FIND);
            this.panelcarga.Visible = false;
            this.panelbusqueda.Visible = true;
            

        }
            
 

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 
            switch (miboton.Tag.ToString ()){
                case "EDIT" : {
                    this.panelcarga.Visible = true;
                    this.panelbusqueda.Visible  = false;
                    botonesForm1.configMododeEdicion(ABMBotonesForm.EDIT);
                    break;
                }
                case "ADD":
                    {
                        this.panelcarga.Visible = true;
                        this.panelbusqueda.Visible = false;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.ADD);
                        var listadeViajesaConciliar = serviceConciliaciones.ObtenerViajesaConciliar();
                        cargarDataGridView (dataGridView1, listadeViajesaConciliar); 
                        //dataGridView1.DataSource = listadeViajesaConciliar;
                        //dataGridView1.ReadOnly = false ;
                        //dataGridView1.Columns["CONCILIAR"].ReadOnly = false;
                        break;
                    }
                case "FIND":
                    {
                        this.panelcarga.Visible =  false ;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;
                    }
                
                case "OK":
                    {
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.FIND);
                        break;
                    }
                case "CANCEL":
                    {
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.CANCEL);
                        break;
                    }

                case "DELETE":
                    {
                        this.panelcarga.Visible = false;
                        this.panelbusqueda.Visible = true;
                        botonesForm1.configMododeEdicion(ABMBotonesForm.DELETE);
                        break;
                    }
            } 

        }

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }



        public void cargarDataGridView(DataGridView dgv, IEnumerable<Object> lista )
        {
            dgv.Columns.Add ("columna1_name", "columna1_header");
            dgv.Columns.Add ("columna2_name", "columna2_header");
            dgv.Columns.Add ("columna3_name", "columna3_header");
            dgv.Columns.Add ("columna4_name", "columna4_header");
            dgv.Columns.Add ("columna5_name", "columna5_header");

            foreach (var item in lista)
            {
                Type t =item .GetType();

                PropertyInfo[] pi = t.GetProperties(); 

                foreach (PropertyInfo p in pi)
                {
                    p.GetValue("");
                        
                }
                dgv.Rows.Add(item.GetType().GetProperty().GetValue(, "Value2", "Value3", "Value4", "Value4");
            }


        }
      
    }
}
