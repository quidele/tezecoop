using System;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class FrmSeleccionarImpresora : Form
    {
        PrinterManager impresoras = new PrinterManager();

        public FrmSeleccionarImpresora()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

            this.cbImpresoras.Items.AddRange(impresoras.getAllPrinters().ToArray () ); 
        }

        private void btn_selecccionar_Click(object sender, EventArgs e)
        {
            txtImpresora.Text = cbImpresoras.Text;

            if (txtImpresora.Text.ToString().Length != 0)
            {
                impresoras.setDefaultPrinter(txtImpresora.Text);
                this.Visible = false; 
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.printDialog1.ShowDialog();
        }

        
    }
}
