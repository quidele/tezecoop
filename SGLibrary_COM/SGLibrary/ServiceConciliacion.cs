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

    [Guid("C752392B-C620-427d-BF4B-B0498A52611E")]
    public interface Conciliacion_Interface
    {
        [DispId(1)]
        void execFormulario();
        [DispId(2)]
        void UsuarioActivo(string usuario);
        [DispId(3)]
        void CajaActiva(string caja);
        
   
   
        
    }

      // Events interface para destinos 
    [Guid("44AE9E66-E02B-40ea-9DF6-93CD2946FFA2"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface Conciliacion_Events
    {
    }


    [Guid("85C3351A-CA89-4ddf-8A00-C7F865BF8474"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(Conciliacion_Events))]
    public class ServiceConciliacion : Conciliacion_Interface
    {
        
        private String _usuarioActivo;
        private String _cajactiva;

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
                                                             NRO = c.nrComprabanteCliente  , MONTO = c.vlMontoCupon }).Take(5);

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
             
            }

                    
        }


        public IEnumerable<Object> agregarConciliacion(decimal[] ids_cupones, TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {


                context.TB_Conciliacion.Add(objConciliacion);

                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where ids_cupones.Contains(c.nrCupon) 
                                                select c
                                                ).Take(5);


                Console.WriteLine(listadeViajesaConciliar1.ToString());

                foreach (var item in listadeViajesaConciliar1.ToList())
                {
                    item.flCobradoalCliente = true;
                    var detalleConciliacion = new TB_ConciliacionDetalle();
                    detalleConciliacion.TB_Conciliacion = objConciliacion;
                    detalleConciliacion.nrCupon = item.nrCupon;
                    context.TB_ConciliacionDetalle.Add(detalleConciliacion); 
                }
                context.SaveChanges(); 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }



        public void UsuarioActivo(string usuario)
        {
            _usuarioActivo = usuario;
       
        }

        public void CajaActiva(string caja)
        {
            _cajactiva = caja;
        }


    }
}
