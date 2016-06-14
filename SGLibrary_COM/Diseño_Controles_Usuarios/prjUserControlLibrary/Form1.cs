using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void userControl11_Load(object sender, EventArgs e)
        {

        }

        private void userControl11_ClickEventDelegateHandler(object sender, EventArgs e)
        {
            Button miboton = (Button)sender;
            MessageBox.Show("tocaste un boton, boton " + miboton.Name);
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void botonesForm1_Load(object sender, EventArgs e)
        {

        }

        private void botonesForm1_Load_1(object sender, EventArgs e)
        {

        }

        private void botonesForm1_ClickEventDelegateHandler(object sender, EventArgs e)
        {

            ToolStripItem miboton = (ToolStripItem) sender;
            MessageBox.Show("tocaste un boton, boton " + miboton.Name + " TAB " +  miboton.Tag  ); 
        }
    }
}
