using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace SGLibrary
{


    [Guid("444FA977-AA64-4A43-9576-163C5B0E2EA5")]
    public interface Tarifas_Interface
    {
        [DispId(40)]
        void cargarTarifas();
    }

    public class ServiceTarifas : Tarifas_Interface
    {

            public void  cargarTarifas ()
            {

                try
                {
                    var f = new FrmCargaTarifas();
                    f.ShowDialog();
                }
                catch (Exception ex)
                {
                    System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
                }
                
            }


    }
}
