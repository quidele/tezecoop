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
    public class ServiceConciliacionManual : ServiceConciliacion
    {


        public void agregarConciliacion(List<TB_ConciliacionDetalleEx> plistaDetalleConciliacion, TB_Conciliacion objConciliacion)
        {
            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();

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

                        un_Cupon.vlMontoAcreditacion = un_Cupon.vlMontoCupon; // importe enviado por la Tarjeta


                        detalleConciliacion.IdConciliacion = objConciliacion.IdConciliacion;
                        context.TB_ConciliacionDetalle.Add(detalleConciliacion.ToTB_ConciliacionDetalle());
                        context.SaveChanges();

                        un_Cupon.IdConciliacion = detalleConciliacion.IdConciliacion; // Asociamos la conciliacion al cupon

                        var nrFactura = un_Cupon.tpComprobanteCliente + "-" + un_Cupon.tpLetraCliente + "-" + un_Cupon.nrTalonarioCliente + un_Cupon.nrComprabanteCliente.Trim();

                        unSMC.GrabarAsientoContablePosdatados(un_Cupon.vlMontoAcreditacion.Value, objConciliacion.nrCajaAdm.Value,
                            objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Conciliacion_de_Viajes, Viajes_con_Tarjeta_a_Bancos, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, "Manual");

                    }

                    context.SaveChanges();


                    // Procesamos el Movimientos posdatados
                    unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);


                    transaction.Complete();


                    return;

                    //return listadeViajesaConciliar.ToList();

                }
            }


        }
        //// fin agregar conciliacion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public override IEnumerable<Object> ObtenerDetalleConciliacion(long pId)
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

                var listadeViajesaConciliar1 = (from c in context.TB_Cupones   join  x in  context.TB_ConciliacionDetalle 
                                                                   on c.nrCupon equals x.nrCupon
                                                where  ( ids_cupones.Contains(c.nrCupon) && x.IdConciliacion == pId )
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
                                                    COMPENSADO = c.flCompensado == true ? "SI" : "NO",
                                                    FECHA_ACREDITACION = x.fechaPago 
                                                });

                // 'nrDocTarjeta' , 'nrTarjeta' , 'tpDocTarjeta' 

                return listadeViajesaConciliar1.ToList();
                //return listadeViajesaConciliar.ToList();

            }
        } // Fin de obtener detalle conciliacion


        public override void modificarConciliacion(List<decimal> listaCuponesDesconciliados,
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
                var listaTB_CuponesDesconciliados = (from c in context.TB_Cupones where listaCuponesDesconciliados.Contains(c.nrCupon) select c.flCobradoalCliente).ToList(); ;

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


                        var vlMontoAcreditacion = Convert.ToDouble(un_Cupon.vlMontoAcreditacion);
                        un_Cupon.dtCobradoalCliente = null;     // limpiamos la fecha de cobrado
                        un_Cupon.flCobradoalCliente = false;   // desconciliamos el cupon lo liberamos de la conciliacion
                        un_Cupon.IdConciliacion = null;
                        un_Cupon.vlMontoAcreditacion = null;
                        un_Cupon.dtFechaAcreditacion = null;

                        context.SaveChanges();

                        var nrFactura = un_Cupon.tpComprobanteCliente + "-" + un_Cupon.tpLetraCliente + "-" + un_Cupon.nrTalonarioCliente + "-" + un_Cupon.nrComprabanteCliente.Trim() + "/ Cupon: " + ExtensionString.EmptyIfNull(un_Cupon.nrCuponPosnet).Trim() + "/ Tarjeta: " + ExtensionString.EmptyIfNull(un_Cupon.nrTarjeta).Trim();

                        // GrabarAsientoContable(TotalConciliacionAnulado, Decimal.Parse(this._cajactiva), this._usuarioActivo, 
                        // objConciliacion, context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes);

                        unSMC.GrabarAsientoContablePosdatados(vlMontoAcreditacion, objConciliacion.nrCajaAdm.Value,
                            objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, "Manual");

                        context.TB_ConciliacionDetalle.Remove(detalleConciliacion);
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
        } // fin de  modificarConciliacionAutomatica



        public override void anularConciliacion(TB_Conciliacion objConciliacion)
        {
            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();

            try
            {

            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {


                    var objConciliacionBD = (from c in context.TB_Conciliacion
                                             where c.IdConciliacion == objConciliacion.IdConciliacion
                                             select c).First<TB_Conciliacion>();

                    objConciliacionBD.TB_ConciliacionDetalle.ToList();


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
                                nrFactura, item.fechaPago.Value, objCupon.nrCupon, "Manual");

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
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
            {
                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                Trace.TraceError("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                    Trace.TraceError("- Property: \"{0}\", Error: \"{1}\"",
                      ve.PropertyName, ve.ErrorMessage);
                }
            }
            throw;
            }


        }  // FIN anularConciliacionAutomatica
       

    } // fin de la clase
} // fin del namespace
