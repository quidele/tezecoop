using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApplication1.ServiceReference1;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();


            var resultado = client.obtenerRegistros();

            MessageBox.Show(resultado.valor.ToString());

            foreach (var item in resultado.Registros )
	        {
                MessageBox.Show(item); 
	        }

            // Use the 'client' variable to call operations on the service.
            
            // Always close the client.
            client.Close();


        }
    }
}
