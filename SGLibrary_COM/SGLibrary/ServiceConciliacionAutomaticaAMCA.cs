﻿using System;
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
using System.Globalization;

namespace SGLibrary
{


    public class ServiceConciliacionAutomaticaAMCA : ServiceConciliacionAutomatica 
    {

        private Int32 CONCILIACION_CANT_DIAS_COBRO_AMCA = 0;

        public ServiceConciliacionAutomaticaAMCA()
        {
            var un_ServiceParametros = new ServiceParametros();
            CONCILIACION_CANT_DIAS_COBRO_AMCA = Int32.Parse(un_ServiceParametros.ObtenerParametro("CONCILIACION_CANT_DIAS_COBRO_AMCA"), CultureInfo.InvariantCulture); 

        }


        public override void agregarConciliacion(List<TB_ConciliacionDetalleEx> plistaDetalleConciliacion, TB_Conciliacion objConciliacion)
        {
            ServiceMovimientoContable unSMC = new ServiceMovimientoContable();

            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {

                    objConciliacion.dsUsuario = this.Usuario ;
                    objConciliacion.nrCajaAdm = Decimal.Parse(this.CajaAdm );
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



                        detalleConciliacion.FechaPagoLicenciatario = detalleConciliacion.dtCupon.AddDays(10);
                        
                        un_Cupon.dtCobradoalCliente = detalleConciliacion.FechaPagoLicenciatario; // muy importante para habilitar el pago al licenciatario
                        un_Cupon.flCobradoalCliente = true; // Marca de cociliacion
                        un_Cupon.dtFechaAcreditacion = detalleConciliacion.fechaPago;  // Fecha en que visa o master pagan al banco

                        un_Cupon.vlMontoAcreditacion = System.Convert.ToDouble(un_TB_ArchivoTarjetaDetalle.importe);  // importe enviado por la Tarjeta
                       
                       
                        detalleConciliacion.IdConciliacion = objConciliacion.IdConciliacion;
                        context.TB_ConciliacionDetalle.Add(detalleConciliacion.ToTB_ConciliacionDetalle());
                        context.SaveChanges();

                        un_Cupon.IdConciliacion = detalleConciliacion.IdConciliacion; // Asociamos la conciliacion al cupon

                        /*  NO GRABAMOS MOVIMIENTOS POSTADATOS - PORQUE EL PAGO ES EN EFECTIVO
                         * var nrFactura = un_Cupon.tpComprobanteCliente + "-" +  un_Cupon.tpLetraCliente +"-" + un_Cupon.nrTalonarioCliente + "-"  + un_Cupon.nrComprabanteCliente.Trim () + "/ Cupon: " + ExtensionString.EmptyIfNull( un_Cupon.nrCuponPosnet).Trim() + "/ Tarjeta: " + ExtensionString.EmptyIfNull(un_Cupon.nrTarjeta).Trim() ;
                        unSMC.GrabarAsientoContablePosdatados(un_Cupon.vlMontoAcreditacion.Value, objConciliacion.nrCajaAdm.Value,
                            objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Conciliacion_de_Viajes, Viajes_con_Tarjeta_a_Bancos, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, un_TB_ArchivoTarjeta.formato);
                         * 
                         */

                    }

                    context.SaveChanges();
                    transaction.Complete();


                    // Procesamos el Movimientos posdatados
                    // unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);


                    return;

                    //return listadeViajesaConciliar.ToList();

                }
            }


        }
        //// fin agregar conciliacion



        public override void modificarConciliacionAutomatica(List<decimal> listaCuponesDesconciliados, 
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


                        /*  NO GRABAMOS MOVIMIENTOS POSTADATOS - PORQUE EL PAGO ES EN EFECTIVO
                        var nrFactura = un_Cupon.tpComprobanteCliente + "-" + un_Cupon.tpLetraCliente + "-" + un_Cupon.nrTalonarioCliente + "-" + un_Cupon.nrComprabanteCliente.Trim() + "/ Cupon: " + ExtensionString.EmptyIfNull(un_Cupon.nrCuponPosnet).Trim() + "/ Tarjeta: " + ExtensionString.EmptyIfNull(un_Cupon.nrTarjeta).Trim();
                        // GrabarAsientoContable(TotalConciliacionAnulado, Decimal.Parse(this._cajactiva), this._usuarioActivo, 
                        // objConciliacion, context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes);

                        unSMC.GrabarAsientoContablePosdatados(vlMontoAcreditacion, objConciliacion.nrCajaAdm.Value,
                            objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context, Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes, un_Cupon.nrLicencia.ToString(), nrFactura, detalleConciliacion.fechaPago.Value, un_Cupon.nrCupon, un_TB_ArchivoTarjeta.formato);
                         * /
                         */
 
                        context.TB_ConciliacionDetalle.Remove (detalleConciliacion);
                        
                    }

                    context.SaveChanges();

                    // Procesamos el Movimientos posdatados
                    // unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);

                    transaction.Complete();


                    return;
                    //return listadeViajesaConciliar.ToList();

                }

                // desafectar el cupon flCobradoalCliente = false
                // desafectar el cupon dtCobradoalCliente = null
                // grabar la tabla de Movimientos en forma de anulacion 
                  
            
            }
            
        }


        public override void anularConciliacionAutomatica(TB_Conciliacion objConciliacion)
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

                        /*  NO GRABAMOS MOVIMIENTOS POSTADATOS - PORQUE EL PAGO ES EN EFECTIVO
                        var nrFactura = objCupon.tpComprobanteCliente + "-" + objCupon.tpLetraCliente + "-" +
                                        objCupon.nrTalonarioCliente + "-" + objCupon.nrComprabanteCliente.Trim() + "/ Cupon: " +
                                        ExtensionString.EmptyIfNull(objCupon.nrCuponPosnet).Trim() + "/ Tarjeta: "
                                        + ExtensionString.EmptyIfNull(objCupon.nrTarjeta).Trim();

                        unSMC.GrabarAsientoContablePosdatados(vlMontoAcreditacion, objConciliacion.nrCajaAdm.Value,
                                objConciliacion.dsUsuario, objConciliacion.IdConciliacion.ToString(), context,
                                Anula_Viajes_con_Tarjeta_a_Bancos, Anula_conciliacion_de_Viajes, objCupon.nrLicencia.ToString(),
                                nrFactura, item.fechaPago.Value, objCupon.nrCupon, un_TB_ArchivoTarjeta.formato);
                         */ 
 

                    }
                    // Eliminamos el detalle de la conciliacion
                    //context.Database.ExecuteSqlCommand("DELETE FROM TB_ConciliacionDetalle where IdConciliacion= {0}", objConciliacionBD.IdConciliacion);

                    objConciliacionBD.dtModificacion = DateTime.Now;
                    objConciliacion.dsUsuario = this.Usuario;
                    objConciliacion.nrCajaAdm = Decimal.Parse(this.CajaAdm);
                    objConciliacionBD.flestado = "E";  // Conciliacion Eliminada
                    context.SaveChanges();


                    // Procesamos el Movimientos posdatados
                    // unSMC.procesarMovimientosPosdatados(Decimal.Parse(this.CajaAdm), this.Usuario);


                    transaction.Complete();

                }

            }


        }


    }
}
