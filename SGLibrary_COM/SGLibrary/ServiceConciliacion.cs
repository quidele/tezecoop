using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;
using System.Data.Entity.Infrastructure;

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
        private List<String> _listado_Errores;

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
                                                where (c.flCobradoalCliente == false) && (c.flCompensado == false) && (new[] { "Tarjeta de Crédito", "Tarjeta de Débito" }.Contains(c.tpCupon))
                                                select new { ID = c.nrCupon, FECHA = c.dtCupon,
                                                             LICENCIA = c.nrLicencia,
                                                             DOC = c.tpComprobanteCliente, 
                                                             LETRA = c.tpLetraCliente , PDV = c.nrTalonarioCliente ,
                                                             NRO = c.nrComprabanteCliente  , MONTO = c.vlMontoCupon ,
                                                             TARJETA = c.nrTarjeta, DOCU = c.tpDocTarjeta, 
                                                             DOCU_NRO = c.nrDocTarjeta
                                                            });

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
             
            }

                    
        }


        public void agregarConciliacion(List<Decimal> ids_cupones, TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {

                objConciliacion.dsUsuario = this._usuarioActivo;
                objConciliacion.nrCajaAdm = Decimal.Parse ( this._cajactiva);
                objConciliacion.flestado = "A";
                objConciliacion.dtModificacion = DateTime.Now;
                

                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where ids_cupones.Contains(c.nrCupon) 
                                                select c
                                                );

                Console.WriteLine(listadeViajesaConciliar1.ToString());
                TB_ConciliacionDetalle detalleConciliacion = new TB_ConciliacionDetalle();

                foreach (var item in listadeViajesaConciliar1.ToList())
                {
                    item.flCobradoalCliente = true;
                    context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion  , nrCupon = item.nrCupon });
             
                }
                context.TB_Conciliacion.Add(objConciliacion);
                context.SaveChanges();
                transaction.Complete();
                return;
                //return listadeViajesaConciliar.ToList();
         
                }
            }


        }


        public void modificarConciliacion(List<Decimal> ids_cupones, 
                                                         List<Decimal> ids_cupones_conciliados, 
                                                         TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {
                try
                {
                    using (TransactionScope transaction = new TransactionScope())
                    {

                        // obtenemos el objeto de la BD 
                        objConciliacion = (from c in context.TB_Conciliacion
                                           where c.IdConciliacion == objConciliacion.IdConciliacion
                                           select c).First<TB_Conciliacion>();

                        var listadetalleConciliacion = (from c in context.TB_ConciliacionDetalle
                                                        where c.IdConciliacion == objConciliacion.IdConciliacion
                                                        select c
                                                        ).ToList<TB_ConciliacionDetalle>();

                        foreach (TB_ConciliacionDetalle item in listadetalleConciliacion)
                        {   // eliminamos los detalle existentes
                            context.TB_ConciliacionDetalle.Remove(item);
                        }

                        objConciliacion.dtModificacion = DateTime.Now;
                        objConciliacion.dsUsuario = this._usuarioActivo;
                        objConciliacion.nrCajaAdm = Decimal.Parse(this._cajactiva);
                        objConciliacion.flestado = "A";


                        var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                        where ids_cupones.Contains(c.nrCupon)
                                                        select c
                                                        );


                        Console.WriteLine(listadeViajesaConciliar1.ToString());

                        Decimal idCupon_conciliado = 0;

                        foreach (var item in listadeViajesaConciliar1.ToList())
                        {
                            idCupon_conciliado = 0;
                            idCupon_conciliado = (from c in ids_cupones_conciliados where item.nrCupon == c select c).FirstOrDefault();

                            if (idCupon_conciliado != 0)
                            {
                                item.flCobradoalCliente = true;
                                context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion, nrCupon = item.nrCupon });
                            }
                            else
                                item.flCobradoalCliente = false;


                        }
                        context.SaveChanges();
                        transaction.Complete();
                     
                        return;
                    }

                }
                catch (DbUpdateException next)
                {
                    DbUpdateException se = null;
                    _listado_Errores = new List<String>();
                    while (next.InnerException != null)
                    {
                        _listado_Errores.Add( next.Message);
                        se = next.InnerException as DbUpdateException;
                        next = se;
                    }

          
                }
            
            }


        }

        public IEnumerable<Object> obtenerConciliaciones(DateTime fechadesde , DateTime fechaHasta , String usuario )
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeViajesaConciliar1 = (from c in context.TB_Conciliacion
                                                where c.dtConciliacion >= fechadesde
                                                && c.dtConciliacion <= fechaHasta
                                                && (c.dsUsuario == usuario || usuario.Trim().Length ==0 )
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

                using (TransactionScope transaction = new TransactionScope())
                {

                var objConciliacionBD = (from c in context.TB_Conciliacion
                                         where c.IdConciliacion == objConciliacion.IdConciliacion
                                         select c ).First <TB_Conciliacion>();

                objConciliacionBD.TB_ConciliacionDetalle.ToList();

                // Eliminamos el detalle de la conciliacion
                foreach (TB_ConciliacionDetalle item in objConciliacionBD.TB_ConciliacionDetalle)
                {   // eliminamos los detalle existentes

                    // liberamos al cupon
                    TB_Cupones objCupon = (from c in context.TB_Cupones where item.nrCupon == c.nrCupon select c).First();
                    objCupon.flCobradoalCliente = false;
                    
                }
                // Eliminamos el detalle de la conciliacion
                //context.Database.ExecuteSqlCommand("DELETE FROM TB_ConciliacionDetalle where IdConciliacion= {0}", objConciliacionBD.IdConciliacion);

                objConciliacionBD.dtModificacion = DateTime.Now;
                objConciliacionBD.dsUsuario = this._usuarioActivo;
                objConciliacionBD.nrCajaAdm = Decimal.Parse(this._cajactiva);
                objConciliacionBD.flestado = "E";  // Conciliacion Eliminada
                context.SaveChanges();
                transaction.Complete();
                }

            }


        }



        public TB_Conciliacion obtenerConciliacion(String pId)
        {

            Int32 id = Int32.Parse(pId)  ;

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                TB_Conciliacion una_conciliacion = (from c in context.TB_Conciliacion
                                                    where c.IdConciliacion == id 
                                                select c)
                                                 .First ();
                // Should Load the Orders
                una_conciliacion.TB_ConciliacionDetalle.ToList();
                 
                return una_conciliacion;
            }
        }

        

        public string Usuario
        {
            get
            {
                return this._usuarioActivo;
            }
            set
            {
                this._usuarioActivo = value;
            }
        }


        public string CajaAdm
        {
            get
            {
                return this._cajactiva;
            }
            set
            {
                this._cajactiva = value;
            }
        }

        public String ListaErrores()
        {
            String lista_errores="";
            foreach (var item in this._listado_Errores)
            {
                lista_errores = lista_errores +"\n"+ item;
            }
            return lista_errores;
        }


        public void UsuarioActivo (string value)
        {
                this._usuarioActivo = value;
            
        }


        public void CajaActiva(string value)
        {
                this._cajactiva = value;
            
        }


        public IEnumerable<Object> obtenerUsuariosConciliaciones()
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeViajesaConciliar1 = (from c in context.TB_Conciliacion
                                                select new { USUARIO = c.dsUsuario } ).Distinct(); 
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public IEnumerable<Object> ObtenerDetalleConciliacion(long  pId)
        {
            List<Decimal> ids_cupones = new  List<Decimal>();

            //una_conciliacion.TB_ConciliacionDetalle 
            using (var context = new dbSG2000Entities())
            {

                // Falta agregar filtro de fechas
                var una_conciliacionDetalle = (from c in context.TB_ConciliacionDetalle
                                               where c.IdConciliacion == pId
                                               select c);

                foreach (var item in una_conciliacionDetalle)
                {
                    ids_cupones.Add(item.nrCupon);
                }

                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where ids_cupones.Contains(c.nrCupon)  
                                                select new
                                                {
                                                    ID = c.nrCupon,
                                                    FECHA = c.dtCupon,
                                                    LICENCIA = c.nrLicencia,
                                                    DOC = c.tpComprobanteCliente,
                                                    LETRA = c.tpLetraCliente,
                                                    PDV = c.nrTalonarioCliente,
                                                    NRO = c.nrComprabanteCliente,
                                                    MONTO = c.vlMontoCupon,
                                                    TARJETA = c.nrTarjeta,
                                                    DOCU = c.tpDocTarjeta,
                                                    DOCU_NRO = c.nrDocTarjeta,
                                                    COMPENSADO =  c.flCompensado == true ? "SI" :"NO"                                          
                                                });

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }

        }
    }
}
