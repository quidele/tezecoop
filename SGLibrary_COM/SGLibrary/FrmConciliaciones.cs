using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using ControlesdeUsuario;

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
                        dataGridView1.DataSource = listadeViajesaConciliar;
                        dataGridView1.ReadOnly = false ;
                        dataGridView1.Columns["CONCILIAR"].ReadOnly = false;
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




      
    }
}
