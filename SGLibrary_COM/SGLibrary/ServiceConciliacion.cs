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
using System.Diagnostics; 

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
    public class ServiceConciliacion : ServiceModel, Conciliacion_Interface
    {

        public const int Viajes_con_Tarjeta_a_Bancos = 2035;
        public const int Conciliacion_de_Viajes = 2036;
        public const int Anula_Viajes_con_Tarjeta_a_Bancos = 2037;
        public const int Anula_conciliacion_de_Viajes = 2038;

        private String _usuarioActivo;
        private String _cajactiva;
        private List<String> _listado_Errores;

        public void execFormulario()
        {
            try
            {

                var f = new FrmConciliaciones();
                f.serviceConciliaciones = this;
                f.serviceConciliacionesAutomaticas = new ServiceConciliacionAutomatica();
                f.serviceConciliacionesAutomaticas.CajaActiva(this._cajactiva);
                f.serviceConciliacionesAutomaticas.UsuarioActivo(this._usuarioActivo);
                f.un_ServiceConciliacionManual = new ServiceConciliacionManual();
                f.un_ServiceConciliacionManual.CajaActiva(this.CajaAdm);
                f.un_ServiceConciliacionManual.UsuarioActivo(this.Usuario);
                f.un_ServiceConciliacionTodoPago  = new ServiceConciliacionTodoPago();
                f.un_ServiceConciliacionTodoPago.CajaActiva(this.CajaAdm);
                f.un_ServiceConciliacionTodoPago.UsuarioActivo(this.Usuario);
                f.serviceConciliacionesAutomaticasAMCA = new ServiceConciliacionAutomaticaAMCA();
                f.serviceConciliacionesAutomaticasAMCA.CajaActiva(this.CajaAdm);
                f.serviceConciliacionesAutomaticasAMCA.UsuarioActivo(this.Usuario);
                f.ShowDialog();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                
                Trace.TraceError(ex.Message);
                
                System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
            }
        }

        public virtual IEnumerable<Object> ObtenerViajesaConciliar()
        {

            using (var context = new dbSG2000Entities())
            {
                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                where (c.flCobradoalCliente == false) && (c.flCompensado == false)
                                                && (c.flAnulado == false)
                                                && (new[] { "Tarjeta de Crédito", "Tarjeta de Débito"   }.Contains(c.tpCupon))
                                                select new { ID = c.nrCupon, FECHA = c.dtCupon,
                                                             LICENCIA = c.nrLicencia,
                                                             DOC = c.tpComprobanteCliente, 
                                                             LETRA = c.tpLetraCliente , PDV = c.nrTalonarioCliente ,
                                                             NRO = c.nrComprabanteCliente  , MONTO = c.vlMontoCupon ,
                                                             TARJETA = c.nrTarjeta, DOCU = c.tpDocTarjeta, 
                                                             DOCU_NRO = c.nrDocTarjeta,
                                                             CUPON = c.nrCuponPosnet,
                                                             CONCILIAR = false  // Agregado para ADGV 
                                                }).OrderBy(c =>  c.FECHA );

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 
                Trace.TraceInformation(  listadeViajesaConciliar1.ToString());
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
                Trace.TraceInformation(listadeViajesaConciliar1.ToString());
                TB_ConciliacionDetalle detalleConciliacion = new TB_ConciliacionDetalle();
                
                double TotalConciliacion=0.0; 

                foreach (var item in listadeViajesaConciliar1.ToList())
                {
                    item.flCobradoalCliente = true;
                    item.dtCobradoalCliente = DateTime.Today;
                    context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion  , nrCupon = item.nrCupon });
                    TotalConciliacion = TotalConciliacion + item.vlMontoCupon.Value ;
                }
                context.TB_Conciliacion.Add(objConciliacion);

                context.SaveChanges();
                
               GrabarAsientoContable(TotalConciliacion, Decimal.Parse(this._cajactiva), this._usuarioActivo, objConciliacion, context, Conciliacion_de_Viajes, Viajes_con_Tarjeta_a_Bancos);
                

                context.SaveChanges();
                transaction.Complete();
                return;
                //return listadeViajesaConciliar.ToList();
         
                }
            }


         }

        // se anade virtual ya que puede ser sobreescrito , palabra clacve override
        public virtual void modificarConciliacion(List<Decimal> ids_cupones, 
                                                    List<Decimal> ids_cupones_conciliados, 
                                                         TB_Conciliacion objConciliacion)
        {

            using (var context = new dbSG2000Entities())
            {
                try
                {
                    using (TransactionScope transaction = new TransactionScope())
                    {

                        double TotalConciliacion = 0.0; 
                        double TotalConciliacionAnulado = 0.0;

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
                                item.dtCobradoalCliente = DateTime.Today;
                                context.TB_ConciliacionDetalle.Add(new TB_ConciliacionDetalle { TB_Conciliacion = objConciliacion, nrCupon = item.nrCupon });
                                TotalConciliacion = TotalConciliacion + item.vlMontoCupon.Value ; 
                            }
                            else
                            {
                                
                                item.flCobradoalCliente = false;
                                item.dtCobradoalCliente = null;
                                TotalConciliacionAnulado = TotalConciliacionAnulado + item.vlMontoCupon.Value; 
                            }


                        }

                        context.SaveChanges();

                        GrabarAsientoContable(TotalConciliacion, Decimal.Parse(this._cajactiva), this._usuarioActivo, objConciliacion, context, Conciliacion_de_Viajes, Viajes_con_Tarjeta_a_Bancos);

                        GrabarAsientoContable(TotalConciliacionAnulado, Decimal.Parse(this._cajactiva), this._usuarioActivo, objConciliacion, context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes);

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
                                                && (c.dsUsuario == usuario || usuario.Trim().Length == 0)
                                                orderby c.IdConciliacion descending  // ordenamos desde mas reciente a mas vieja
                                                select new
                                                {
                                                    ID = c.IdConciliacion,
                                                    FECHA = c.dtConciliacion,
                                                    TIPO = c.formato,
                                                    USUARIO = c.dsUsuario,
                                                    CAJA_ADM = c.nrCajaAdm,
                                                    FECHA_MODIF = c.dtModificacion,
                                                    ESTADO = c.flestado
                                                });
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }

        // agregado en la version 4.9.2 , agregamos el parametro tipo
        public IEnumerable<Object> obtenerConciliaciones(DateTime fechadesde, DateTime fechaHasta, String usuario, String tipo)
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeViajesaConciliar1 = (from c in context.TB_Conciliacion
                                                where c.dtConciliacion >= fechadesde
                                                && c.dtConciliacion <= fechaHasta
                                                && (c.dsUsuario == usuario || usuario.Trim().Length == 0)
                                                 && (c.formato == tipo || tipo.Trim().Length == 0)
                                                orderby c.IdConciliacion descending  // ordenamos desde mas reciente a mas vieja
                                                select new
                                                {
                                                    ID = c.IdConciliacion,
                                                    FECHA = c.dtConciliacion,
                                                    TIPO = c.formato,
                                                    USUARIO = c.dsUsuario,
                                                    CAJA_ADM = c.nrCajaAdm,
                                                    FECHA_MODIF = c.dtModificacion,
                                                    ESTADO = c.flestado
                                                });
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }


        public virtual void anularConciliacion(TB_Conciliacion objConciliacion)
        {
            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {

                double TotalConciliacionAnulado = 0.0;

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
                    objCupon.dtCobradoalCliente = null;
                    TotalConciliacionAnulado = TotalConciliacionAnulado + objCupon.vlMontoCupon.Value; 
                }
                // Eliminamos el detalle de la conciliacion
                //context.Database.ExecuteSqlCommand("DELETE FROM TB_ConciliacionDetalle where IdConciliacion= {0}", objConciliacionBD.IdConciliacion);

                objConciliacionBD.dtModificacion = DateTime.Now;
                objConciliacionBD.dsUsuario = this._usuarioActivo;
                objConciliacionBD.nrCajaAdm = Decimal.Parse(this._cajactiva);
                objConciliacionBD.flestado = "E";  // Conciliacion Eliminada
                context.SaveChanges();
                GrabarAsientoContable(TotalConciliacionAnulado, Decimal.Parse(this._cajactiva), this._usuarioActivo, objConciliacion, context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes);

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
                // Should Load the Details
                una_conciliacion.TB_ConciliacionDetalle.ToList();
                if (una_conciliacion.idArchivo!= null)
                {
                    una_conciliacion.TB_ArchivoTarjeta.ToString();
                }
      
                return una_conciliacion;
            }
        }

        

        public override string Usuario
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


        public override string CajaAdm
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

        public override String ListaErrores()
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
        public virtual IEnumerable<Object> ObtenerDetalleConciliacion(long pId)
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
                                                    EMPRESA = c.nmEmpresaTarjeta, 
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


        /// <summary>
        /// grabar movimientos contables para reflejar la salida del dinero
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public void GrabarAsientoContable(Double pvlPesos , Decimal pnrCaja , String pdsUsuario, TB_Conciliacion pConciliacion, 
                                                    dbSG2000Entities pdbSG2000Entities, int cdConceptoOrigen , int cdConceptoDestino )
        {
               //  Setear conceptos y caja
               //  Obtener la entidad Usuario
            TB_MovimientosContables unMCConceptoOrigen= new TB_MovimientosContables();
            TB_MovimientosContables unMCConceptoDestino = new TB_MovimientosContables();


            TB_Conceptos cdConceptoConceptoOrigen = (from c in pdbSG2000Entities.TB_Conceptos where c.cdConcepto == cdConceptoOrigen select c).First();

            var query = from p in pdbSG2000Entities.TB_MovimientosContables
                        select p.IdMovimiento ;

            unMCConceptoOrigen.IdMovimiento = query.Max()+1;
            unMCConceptoOrigen.cdConcepto = cdConceptoConceptoOrigen.cdConcepto;
            unMCConceptoOrigen.dsMovimiento = "Conciliación Nro:  " + pConciliacion.IdConciliacion.ToString();
            unMCConceptoOrigen.dsUsuario = pdsUsuario;
            unMCConceptoOrigen.nrCaja = pnrCaja;
            unMCConceptoOrigen.vlPesos = pvlPesos;
            unMCConceptoOrigen.vlDolares  = 0.0;
            unMCConceptoOrigen.vlEuros = 0.0;
            unMCConceptoOrigen.dtMovimiento = DateTime.Now;   // Asignamos la fecha de la conciliacion
            unMCConceptoOrigen.nrAnio = DateTime.Now.Year;
            unMCConceptoOrigen.nrRecibo = pConciliacion.IdConciliacion.ToString();
            unMCConceptoOrigen.tpCajaImputacion = cdConceptoConceptoOrigen.tpCajaImputacion  ;  // Completar desde el concepto
            unMCConceptoOrigen.dsConcepto = cdConceptoConceptoOrigen.dsConcepto ;  // Completar desde el concepto
            unMCConceptoOrigen.tpOperacion = cdConceptoConceptoOrigen.tpOperacion ;  // Completar desde el concepto
            //unMCConceptoOrigen.tpMovimiento = "";
            unMCConceptoOrigen.tpConcepto = cdConceptoConceptoOrigen.tpOperacion ;  // Completar desde el concepto
            TB_Conceptos cdConceptoConceptoDestino = (from c in pdbSG2000Entities.TB_Conceptos where c.cdConcepto == cdConceptoDestino select c).First(); ;

            pdbSG2000Entities.SaveChanges();

            unMCConceptoDestino.IdMovimiento = query.Max() + 2;
            unMCConceptoDestino.cdConcepto = cdConceptoConceptoDestino.cdConcepto;
            unMCConceptoDestino.dsMovimiento = "Conciliación Nro:  " + pConciliacion.IdConciliacion.ToString();
            unMCConceptoDestino.dsUsuario = pdsUsuario;
            unMCConceptoDestino.nrCaja = pnrCaja; 
            unMCConceptoDestino.vlPesos = pvlPesos;
            unMCConceptoDestino.vlDolares = 0.0;
            unMCConceptoDestino.vlEuros = 0.0;
            unMCConceptoDestino.dtMovimiento = DateTime.Now;   // Asignamos la fecha de la conciliacion
            unMCConceptoDestino.nrAnio = DateTime.Now.Year;
            unMCConceptoDestino.nrRecibo = pConciliacion.IdConciliacion.ToString();
            unMCConceptoDestino.tpCajaImputacion = cdConceptoConceptoDestino.tpCajaImputacion;  // Completar desde el concepto
            unMCConceptoDestino.dsConcepto = cdConceptoConceptoDestino.dsConcepto;  // Completar desde el concepto
            unMCConceptoDestino.tpOperacion = cdConceptoConceptoDestino.tpOperacion;  // Completar desde el concepto
            //unMCConceptoOrigen.tpMovimiento = "";
            unMCConceptoDestino.tpConcepto = cdConceptoConceptoOrigen.tpOperacion;  // Completar desde el concepto

            pdbSG2000Entities.TB_MovimientosContables.Add(unMCConceptoOrigen);
            pdbSG2000Entities.TB_MovimientosContables.Add(unMCConceptoDestino);
            pdbSG2000Entities.SaveChanges(); 

            return;   
         }


        
    }
}

