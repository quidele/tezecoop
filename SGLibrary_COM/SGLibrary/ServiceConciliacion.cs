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

        public IEnumerable<Object> ObtenerViajesaConciliar()
        {

            using (var context = new dbSG2000Entities())
            {
                var listadeViajesaConciliar1 = (from c in context.TB_Cupones     
                                                where c.flCobradoalCliente == false 
                                            
                                                select new { ID = c.nrCupon, FECHA = c.dtCupon,  DOC = c.tpComprobanteCliente, 
                                                             LETRA = c.tpLetraCliente , PDV = c.nrTalonarioCliente ,
                                                             NRO = c.nrComprabanteCliente  , MONTO = c.vlMontoCupon , 
                                                             CONCILIAR = c.flCobradoalCliente }).Take(5);

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
             
            }

                    
        }

    }
}
