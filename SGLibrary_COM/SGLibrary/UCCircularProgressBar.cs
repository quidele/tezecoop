using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SGLibrary
{
    public partial class UCCircularProgressBar : UserControl
    {
        public UCCircularProgressBar()
        {
            InitializeComponent();
        }

        private int i=1;

        private void UCCircularProgressBar_Load(object sender, EventArgs e)
        {
            circularProgressBar1.Value = 0;
            circularProgressBar1.Maximum = 10; 
        
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if ( i >= 10 ){
                i= 1;
                circularProgressBar1.Value = 1;
                
            }
            else{
                i++;
                circularProgressBar1.Increment(1);
            }
            
        }

        public void Start()
        {
            timer1.Enabled = true;
            this.Visible = true;
            circularProgressBar1.Show();
            
        }

        public void Stop()
        {
            timer1.Enabled = false;
            this.Visible = false;
        }

        private void circularProgressBar1_Click(object sender, EventArgs e)
        {

        }

    }
}
