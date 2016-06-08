using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class UserControl1 : UserControl
    {
        public UserControl1()
        {
            InitializeComponent();
        }


        public delegate void ClickDelegateHandler(object sender, EventArgs e);
        public event ClickDelegateHandler ClickEventDelegateHandler;          

        private void button1_Click(object sender, EventArgs e)
        {
          
            ClickEventDelegateHandler.Invoke(sender,e );

        }

        private void button2_Click(object sender, EventArgs e)
        {
            ClickEventDelegateHandler.Invoke(sender, e);
        }

        private void UserControl1_Load(object sender, EventArgs e)
        {

        }
    }
}
