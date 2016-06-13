﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Globalization;
using WindowsFormsApplication1.Recursos_Localizables;


namespace WindowsFormsApplication1
{
    public partial class BotonesForm : UserControl
    {
        public BotonesForm()
        {
            InitializeComponent();
        }

        private void BotonesForm_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("ES-ES");
            this.toolStripButton1.Text = StringResources.botonBuscarText;
            this.toolStripButton2.Text = StringResources.botonEditarText;
            this.toolStripButton1.Image = StringResources.btn_form_add;
            this.toolStripButton2.Image = StringResources.btn_form_edit;
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {

        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {

        }
    }
}
    