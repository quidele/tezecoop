using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Data.Objects;
using System.Transactions;
using SGLibrary.ArchivoTarjetas;
using System.Data.Entity.Validation;
using System.Data;
using System.Diagnostics;
using SGLibrary.Extensiones;

namespace SGLibrary
{
    [Guid("65174DA4-2750-403E-A84F-AA685C296E26"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(Conciliacion_Events))]
    public class ServiceConciliacionAutomatica : ServiceConciliacion 
    {

        public ServiceConciliacionAutomatica()
        {

        }


        public void procesarArchivo(ArchivoTarjeta miArchivo)
        {

            miArchivo.ProcesarArchivo(); // procesa el archivo , sin importar el formato
            Console.WriteLine(miArchivo.miArchivoTarjeta.formato + " " + miArchivo.miArchivoTarjeta.nombrearchivo);

            //ServiceConciliacionAutomatica un_ServiceConciliacionAutomatica = new ServiceConciliacionAutomatica();
            try
            {
            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                   
                    var item = context.TB_ArchivoTarjeta.Add(miArchivo.miArchivoTarjeta);
                    context.SaveChanges();
                    transaction.Complete(); 
                }

            }
          }
         catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
            {
                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            throw;
            }

       }


        // Conciliar 
        public void ConcilialiarAutomaticaticamente(TB_ArchivoTarjeta unTB_ArchivoTarjeta)
        {

            using (var context = new dbSG2000Entities())
            {
                try
                {
                // La logica de la conciliación queda suscripta en el SP
                 spu_conciliarAutomaticamente_Result   resul = context.spu_conciliarAutomaticamente (unTB_ArchivoTarjeta.id).First();
                // verificar el resultado que devuelve el STORE
                 Console.WriteLine(resul.resultado + " " + resul.descripcion_error);
                }
                catch (EntityCommandCompilationException e)
                {
                    Console.WriteLine( e.Message);
                    throw;
                }
                
            }
          

        } // FIN DE ConcilialiarAutomaticaticamente


        public IEnumerable<Object> ObtenerViajesConciliadosAutomaticamente(Decimal  pIdArchivo)
        {

            using (var context = new dbSG2000Entities())
            {
                var listadeViajesaConciliar1 = (from c in context.TB_Cupones
                                                 join x in context.TB_ArchivoTarjetaDetalle
                                                    on c.nrCupon  equals x.nrCupon // Join entre las dos tablas
                                                where (c.flCobradoalCliente == false) && (c.flCompensado == false)
                                                && (c.flAnulado == false)
                                                //&& (new[] { "Tarjeta de Crédito", "Tarjeta de Débito"}.Contains(c.tpCupon))
                                                && (x.idarchivo == pIdArchivo) // filtramos por un archivo
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
                                                    MONTO_ARCHI = x.importe,
                                                    EMPRESA = c.nmEmpresaTarjeta, 
                                                    TARJETA = c.nrTarjeta,
                                                    TARJETA_ARCHI = x.tarjeta,
                                                    CUPON = c.nrCuponPosnet != null ? c.nrCuponPosnet : "0",
                                                    CUPON_ARCHI = x.comprobante,
                                                    NIVEL = x.nrNivelConciliacion,
                                                    IdArchivoTarjetaDetalle = x.Id,
                                                    FECHA_PAGO =  x.fechaPago.Value 
                                                }).OrderBy(c => c.FECHA);

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 
                Trace.TraceInformation(listadeViajesaConciliar1.ToString());
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }

        public IEnumerable<Object> ObtenerViajesNoConciliadosAutomaticamente(Decimal pIdArchivo)
        {

            using (var context = new dbSG2000Entities())
            {
                var listadeViajesaConciliar1 = (from x in context.TB_ArchivoTarjetaDetalle
                                                where (x.idarchivo == pIdArchivo) // filtramos por un archivo
                                                && (x.nrCupon == null)
                                                select new
                                                {
                                                    ID = 0,
                                                    FECHA = "",
                                                    LICENCIA = "",
                                                    DOC = "",
                                                    LETRA = "",
                                                    PDV = "",
                                                    NRO = "",
                                                    MONTO = "",
                                                    MONTO_ARCHI = x.importe,
                                                    EMPRESA = "", 
                                                    TARJETA = "",
                                                    TARJETA_ARCHI = x.tarjeta,
                                                    CUPON = "",
                                                    CUPON_ARCHI = x.comprobante,
                                                    NIVEL = x.nrNivelConciliacion,
                                                    IdArchivoTarjetaDetalle = x.Id,
                                                    FECHA_PAGO = x.fechaPago.Value
                                                });

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 
                Trace.TraceInformation(listadeViajesaConciliar1.ToString());
                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }


        }

        public TB_ArchivoTarjeta obtenerArchivo(String pId)
        {

            Int32 id = Int32.Parse(pId);

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                TB_ArchivoTarjeta una_TB_ArchivoTarjeta = (from c in context.TB_ArchivoTarjeta
                                                    where c.id == id
                                                    select c)
                                                 .First();
                return una_TB_ArchivoTarjeta;
            }
        }



        public virtual void agregarConciliacion(List<TB_ConciliacionDetalleEx> plistaDetalleConciliacion, TB_Conciliacion objConciliacion)
        {
            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();


            try
            {
                using (var context = new dbSG2000Entities())
                {

                    using (TransactionScope transaction = new TransactionScope())
                    {

                        objConciliacion.dsUsuario = this.Usuario;
                        objConciliacion.nrCajaAdm = Decimal.Parse(this.CajaAdm);
                        objConciliacion.flestado = "A";
                        objConciliacion.dtModificacion = DateTime.Now;

                        context.TB_Conciliacion.Add(objConciliacion);
                        context.SaveChanges();

                        foreach (var detalleConciliacion in plistaDetalleConciliacion)
                        {
                            TB_Cupones un_Cupon = (from c in context.TB_Cupones
                                                   where c.nrCupon == detalleConciliacion.nrCupon
                                                   select c).First();

                            TB_ArchivoTarjetaDetalle un_TB_ArchivoTarjetaDetalle = (from c in context.TB_ArchivoTarjetaDetalle
                                                                                    where c.Id == detalleConciliacion.IdArchivoTarjetaDetalle
                                                                                    select c).First();

                            TB_ArchivoTarjeta un_TB_ArchivoTarjeta = (from c in context.TB_ArchivoTarjeta
                                                                      where c.id == objConciliacion.idArchivo
                                                                      select c).First();

                            if (detalleConciliacion.fechaPago.Value.Subtract(detalleConciliacion.dtCupon).TotalDays >= 20)
                            {
                                detalleConciliacion.FechaPagoLicenciatario = detalleConciliacion.dtCupon.AddDays(30);
                            }
                            else
                            {
                                detalleConciliacion.FechaPagoLicenciatario = detalleConciliacion.dtCupon.AddDays(5);
                            }

                            un_Cupon.dtCobradoalCliente = detalleConciliacion.FechaPagoLicenciatario; // muy importante para habilitar el pago al licenciatario
                            un_Cupon.flCobradoalCliente = true; // Marca de cociliacion
                            un_Cupon.dtFechaAcreditacion = detalleConciliacion.fechaPago;  // Fecha en que visa o master pagan al banco

                            un_Cupon.vlMontoAcreditacion = System.Convert.ToDouble(un_TB_ArchivoTarjetaDetalle.importe);  // importe enviado por la Tarjeta


                            detalleConciliacion.IdConciliacion = objConciliacion.IdConciliacion;
                            context.TB_ConciliacionDetalle.Add(detalleConciliacion.ToTB_ConciliacionDetalle());

                            context.SaveChanges();

                            un_Cupon.IdConciliacion = detalleConciliacion.IdConciliacion; // Asociamos la conciliacion al cupon

                            var nrFactura = un_Cupon.tpComprobanteCliente + "-" + un_Cupon.tpLetraCliente + "-" + un_Cupon.nrTalonarioCliente + "-" + un_Cupon.nrComprabanteCliente.Trim() + "/ Cupon: " + ExtensionString.EmptyIfNull(un_Cupon.nrCuponPosnet).Trim() + "/ Tarjeta: " + ExtensionString.EmptyIfNull(un_Cupon.nrTarjeta).Trim();

                            unSMC.GrabarAsientoContablePosdatados(un_Cupon.vlMontoAcreditacion.Value, objConciliacion.nrCajaAdm.Value,
                                objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Conciliacion_de_Viajes, Viajes_con_Tarjeta_a_Bancos, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, un_TB_ArchivoTarjeta.formato);

                        }

                        context.SaveChanges();


                        // Procesamos el Movimientos posdatados
                        unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);

                        transaction.Complete();





                        return;

                        //return listadeViajesaConciliar.ToList();

                    }
                } // Cierre using 
            }
            catch (DbEntityValidationException e)
            {
                Console.WriteLine(e);
                Trace.TraceError(e.Message);
                foreach (var eve in e.EntityValidationErrors)
                {
                    Trace.TraceError("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);

                    foreach (var ve in eve.ValidationErrors)
                    {
                        Trace.TraceError("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }


        }
        //// fin agregar conciliacion


        /// <summary>
        /// 
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public  IEnumerable<Object>  ObtenerDetalleConciliacionAutomatica(long pId)
        {
            List<Decimal> ids_cupones = new List<Decimal>();

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
                                                    join x in una_conciliacionDetalle on c.nrCupon equals x.nrCupon
                                                    join y in context.TB_ArchivoTarjetaDetalle on x.IdArchivoTarjetaDetalle equals y.Id
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
                                                    MONTO_ARCHI = y.importe,
                                                    EMPRESA = c.nmEmpresaTarjeta, 
                                                    TARJETA = c.nrTarjeta,
                                                    TARJETA_ARCHI = y.tarjeta,
                                                    CUPON = c.nrCuponPosnet,
                                                    CUPON_ARCHI = y.comprobante,
                                                    NIVEL = y.nrNivelConciliacion,
                                                    IdArchivoTarjetaDetalle = y.Id,
                                                    FECHA_PAGO =  x.fechaPago.Value,
                                                    COMPENSADO = c.flCompensado == true ? "SI" : "NO"
                                                });

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }
        }



        public virtual void modificarConciliacionAutomatica(List<decimal> listaCuponesDesconciliados, 
                                                      List<decimal> listaCuponesConciliados,
                                                      TB_Conciliacion objConciliacion)
        {

            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();

                     //una_conciliacion.TB_ConciliacionDetalle 
            using (var context = new dbSG2000Entities())
            {

                // detalle conciliacion desconciliadas
                var listaDetalleDesconciliados = (from c in context.TB_ConciliacionDetalle
                                                  where listaCuponesDesconciliados.Contains(c.nrCupon) &&
                                                                c.IdConciliacion == objConciliacion.IdConciliacion
                                                  select c).ToList(); ;
                

                // cupones conciliacion desconciliadas
                var listaTB_CuponesDesconciliados = (from c in context.TB_Cupones   where listaCuponesDesconciliados.Contains (c.nrCupon) select c.flCobradoalCliente   ).ToList();;

                using (TransactionScope transaction = new TransactionScope())
                {

                    objConciliacion = (from c in context.TB_Conciliacion
                                       where c.IdConciliacion == objConciliacion.IdConciliacion
                                       select c).First<TB_Conciliacion>();

                    objConciliacion.dsUsuario = this.Usuario;
                    objConciliacion.nrCajaAdm = Decimal.Parse(this.CajaAdm);
                    objConciliacion.flestado = "A";
                    objConciliacion.dtModificacion = DateTime.Now;

                    context.SaveChanges();

                    foreach (var detalleConciliacion in listaDetalleDesconciliados)
                    {
                        TB_Cupones un_Cupon = (from c in context.TB_Cupones
                                               where c.nrCupon == detalleConciliacion.nrCupon
                                               select c).First();

                        TB_ArchivoTarjeta un_TB_ArchivoTarjeta = (from c in context.TB_ArchivoTarjeta
                                                                  where c.id == objConciliacion.idArchivo
                                                                  select c).First();

                        var vlMontoAcreditacion = Convert.ToDouble ( un_Cupon.vlMontoAcreditacion) ;
                        un_Cupon.dtCobradoalCliente = null;     // limpiamos la fecha de cobrado
                        un_Cupon.flCobradoalCliente = false ;   // desconciliamos el cupon lo liberamos de la conciliacion
                        un_Cupon.IdConciliacion = null;
                        un_Cupon.vlMontoAcreditacion = null;
                        un_Cupon.dtFechaAcreditacion = null;

                        context.SaveChanges();

                        var nrFactura = un_Cupon.tpComprobanteCliente + "-" + un_Cupon.tpLetraCliente + "-" + un_Cupon.nrTalonarioCliente + "-" + un_Cupon.nrComprabanteCliente.Trim() + "/ Cupon: " + ExtensionString.EmptyIfNull(un_Cupon.nrCuponPosnet).Trim() + "/ Tarjeta: " + ExtensionString.EmptyIfNull(un_Cupon.nrTarjeta).Trim();

                        // GrabarAsientoContable(TotalConciliacionAnulado, Decimal.Parse(this._cajactiva), this._usuarioActivo, 
                        // objConciliacion, context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes);

                        unSMC.GrabarAsientoContablePosdatados(vlMontoAcreditacion, objConciliacion.nrCajaAdm.Value,
                            objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, un_TB_ArchivoTarjeta.formato);

                        context.TB_ConciliacionDetalle.Remove (detalleConciliacion);
                    }

                    context.SaveChanges();

                    // Procesamos el Movimientos posdatados
                    unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);

                    transaction.Complete();


                    return;
                    //return listadeViajesaConciliar.ToList();

                }

                // desafectar el cupon flCobradoalCliente = false
                // desafectar el cupon dtCobradoalCliente = null
                // grabar la tabla de Movimientos en forma de anulacion 
                  
            
            }
            
        }


        public virtual void anularConciliacionAutomatica(TB_Conciliacion objConciliacion)
        {
            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();

            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {


                    var objConciliacionBD = (from c in context.TB_Conciliacion
                                             where c.IdConciliacion == objConciliacion.IdConciliacion
                                             select c).First<TB_Conciliacion>();

                    objConciliacionBD.TB_ConciliacionDetalle.ToList();

                    TB_ArchivoTarjeta un_TB_ArchivoTarjeta = (from c in context.TB_ArchivoTarjeta
                                                              where c.id == objConciliacion.idArchivo
                                                              select c).First();

                    // Eliminamos el detalle de la conciliacion
                    foreach (TB_ConciliacionDetalle item in objConciliacionBD.TB_ConciliacionDetalle)
                    {   // eliminamos los detalle existentes

                        // liberamos al cupon
                        TB_Cupones objCupon = (from c in context.TB_Cupones where item.nrCupon == c.nrCupon select c).First();


                        var vlMontoAcreditacion = Convert.ToDouble(objCupon.vlMontoAcreditacion);
                        objCupon.dtCobradoalCliente = null;     // limpiamos la fecha de cobrado
                        objCupon.flCobradoalCliente = false;   // desconciliamos el cupon lo liberamos de la conciliacion
                        objCupon.IdConciliacion = null;
                        objCupon.vlMontoAcreditacion = null;
                        objCupon.dtFechaAcreditacion = null;

                        var nrFactura = objCupon.tpComprobanteCliente + "-" + objCupon.tpLetraCliente + "-" +
                                        objCupon.nrTalonarioCliente + "-" + objCupon.nrComprabanteCliente.Trim() + "/ Cupon: " +
                                        ExtensionString.EmptyIfNull(objCupon.nrCuponPosnet).Trim() + "/ Tarjeta: "
                                        + ExtensionString.EmptyIfNull(objCupon.nrTarjeta).Trim();

                        unSMC.GrabarAsientoContablePosdatados(vlMontoAcreditacion, objConciliacion.nrCajaAdm.Value,
                                objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context,
                                Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes, objCupon.nrLicencia.ToString(),
                                nrFactura, item.fechaPago.Value, objCupon.nrCupon, un_TB_ArchivoTarjeta.formato);

                    }
                    // Eliminamos el detalle de la conciliacion
                    //context.Database.ExecuteSqlCommand("DELETE FROM TB_ConciliacionDetalle where IdConciliacion= {0}", objConciliacionBD.IdConciliacion);

                    objConciliacionBD.dtModificacion = DateTime.Now;
                    objConciliacion.dsUsuario = this.Usuario;
                    objConciliacion.nrCajaAdm = Decimal.Parse(this.CajaAdm);
                    objConciliacionBD.flestado = "E";  // Conciliacion Eliminada
                    context.SaveChanges();


                    // Procesamos el Movimientos posdatados
                    unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);


                    transaction.Complete();

                }

            }


        }


    }
}
