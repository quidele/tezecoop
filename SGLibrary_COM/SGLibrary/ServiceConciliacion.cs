using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Data;
using System.Data.SqlClient;


namespace SGLibrary
{



    public class ServiceConciliacion
    {
        IEnumerable<TB_Cupones> listadeViajesaConciliar; 

        public void execFormulario()
        {
            try
            {

                var f = new FrmConciliaciones();
                f.serviceConciliaciones = this;
                f.ShowDialog();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
            }
        }

        public IEnumerable<TB_Cupones> ObtenerViajesaConciliar()
        {

            using (var context = new dbSG2000Entities())
            {
                listadeViajesaConciliar = (from c in context.TB_Cupones where c.flCobradoalCliente == false select c);

                return listadeViajesaConciliar.ToList();
             
            }


        }

    }
}
