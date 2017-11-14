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
    public partial class FrmCircularProgressBar : Form
    {
        public FrmCircularProgressBar()
        {
            InitializeComponent();
        }

        private void FrmCircularProgressBar_Load(object sender, EventArgs e)
        {
           this.ucCircularProgressBar1.Start();
           Application.DoEvents();
           WinAPI.SiempreEncima(this.Handle);
           Application.DoEvents(); 
        }



    }
}
