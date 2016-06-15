using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace SGLibrary
{



    public class ServiceConciliacion
    {

        public void execFormulario()
        {
            try
            {
                var f = new FrmConciliaciones();
                f.ShowDialog();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
            }
        }

    }
}
