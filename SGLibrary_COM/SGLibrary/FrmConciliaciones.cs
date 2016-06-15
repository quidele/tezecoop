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
    public partial class FrmConciliaciones : Form
    {
        public FrmConciliaciones()
        {
            InitializeComponent();
        }

        private void FrmConciliaciones_Load(object sender, EventArgs e)
        {

        }

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            ToolStripItem miboton = (ToolStripItem)sender;
            MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " + miboton.Tag); 
            switch (miboton.Tag.ToString ()){
                case "EDIT": {
                    this.panelcarga.Visible = true;
                    this.panelbusqueda.Visible  = false;
                    break;
                }
                case "FIND":
                    {
                        this.panelcarga.Visible =  false ;
                        this.panelbusqueda.Visible = true;
                    }
                    break;
            } 

        }
    }
}
