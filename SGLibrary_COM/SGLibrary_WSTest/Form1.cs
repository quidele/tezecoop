﻿using SGLibrary_WSTest.WSTezecoop;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SGLibrary_WSTest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            WSObligacionesClient client = new WSObligacionesClient();
            var una_wsobligacion = client.obtenerObligacionxId();
            this.textBox1.Text = una_wsobligacion.Error.Mensaje; 
        }

        private void btnSaludar_Click(object sender, EventArgs e)
        {
            WSObligacionesClient client = new WSObligacionesClient();
            MessageBox.Show  (client.Saludar(this.textBox1.Text));
        }

    }
}

