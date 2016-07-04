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


        public IEnumerable<Object> agregarConciliacion(List<Decimal> ids_cupones, TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {
                this._usuarioActivo = "quidele";
                this._cajactiva = "1";
                objConciliacion.dsUsuario = this._usuarioActivo;
                objConciliacion.nrCajaAdm = Decimal.Parse ( this._cajactiva);
                objConciliacion.flestado = "A";
                objConciliacion.dtModificacion = DateTime.Now;
                

                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where ids_cupones.Contains(c.nrCupon) 
                                                select c
                                                ).Take(5);


                Console.WriteLine(listadeViajesaConciliar1.ToString());
                TB_ConciliacionDetalle detalleConciliacion = new TB_ConciliacionDetalle();

                foreach (var item in listadeViajesaConciliar1.ToList())
                {
                    item.flCobradoalCliente = true;
                    context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion  , nrCupon = item.nrCupon });
             
                }
                context.TB_Conciliacion.Add(objConciliacion);
                context.SaveChanges(); 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }


        public IEnumerable<Object> modificarConciliacion(List<Decimal> ids_cupones, 
                                                         List<Decimal> ids_cupones_conciliados, 
                                                         TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {


                var listadetalleConciliacion = (from c in context.TB_ConciliacionDetalle
                                                where c.IdConciliacion == objConciliacion.IdConciliacion 
                                                select c
                                                ).ToList<TB_ConciliacionDetalle>();

                foreach (TB_ConciliacionDetalle item in listadetalleConciliacion)
                {   // eliminamos los detalle existentes
                    context.TB_ConciliacionDetalle.Remove(item);
                }

                this._usuarioActivo = "quidele";
                this._cajactiva = "1";
                objConciliacion.dtModificacion = DateTime.Now;
                objConciliacion.dsUsuario = this._usuarioActivo;
                objConciliacion.nrCajaAdm = Decimal.Parse(this._cajactiva);
                objConciliacion.flestado = "A";

                
                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where ids_cupones.Contains(c.nrCupon)
                                                select c
                                                );


                Console.WriteLine(listadeViajesaConciliar1.ToString());
                TB_ConciliacionDetalle detalleConciliacion = new TB_ConciliacionDetalle();

                Decimal idCupon_conciliado = 0; 

                foreach (var item in listadeViajesaConciliar1.ToList())
                {
                    idCupon_conciliado = 0;
                    idCupon_conciliado = (from c in ids_cupones_conciliados where item.nrCupon == c select c).First();
                    
                    if ( idCupon_conciliado==0 )
                    {
                        item.flCobradoalCliente = true;
                        context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion, nrCupon = item.nrCupon });
                    }
                    else
                        item.flCobradoalCliente = false;


                }
                context.TB_Conciliacion.Add(objConciliacion);
                context.SaveChanges();

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }

        public IEnumerable<Object> obtenerConciliaciones(DateTime fechadesde , DateTime fechaHasta)
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeViajesaConciliar1 = (from c in context.TB_Conciliacion
                                                where c.dtConciliacion >= fechadesde
                                                && c.dtConciliacion <= fechaHasta 
                                                select new { ID = c.IdConciliacion  , 
                                                       FECHA = c.dtConciliacion , 
                                                       USUARIO = c.dsUsuario , 
                                                       CAJA_ADM =  c.nrCajaAdm  ,
                                                       FECHA_MODIF = c.dtModificacion , 
                                                       ESTADO  = c.flestado  } 
                                                    );
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }


        public void anularConciliacion(TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {
                this._usuarioActivo = "quidele";
                this._cajactiva = "1";

                var objConciliacionBD = (from c in context.TB_Conciliacion
                                         where c.IdConciliacion == objConciliacion.IdConciliacion
                                         select c ).First <TB_Conciliacion>();

                // Eliminamos el detalle de la conciliacion
                foreach (TB_ConciliacionDetalle item in objConciliacionBD.TB_ConciliacionDetalle)
                {   // eliminamos los detalle existentes
                    context.TB_ConciliacionDetalle.Remove(item);
                }

     
                objConciliacion.dtModificacion = DateTime.Now;
                objConciliacion.dsUsuario = this._usuarioActivo;
                objConciliacion.nrCajaAdm = Decimal.Parse(this._cajactiva);
                objConciliacion.flestado = "E";  // Conciliacion Eliminada

                context.TB_Conciliacion.Add(objConciliacion);
                context.SaveChanges();

            }


        }



        public TB_Conciliacion obtenerConciliacion(Int32 pId)
        {
            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                TB_Conciliacion una_conciliacion = (from c in context.TB_Conciliacion
                                                where c.IdConciliacion == pId  
                                                select c
                                                ).First ();
                return una_conciliacion;
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
