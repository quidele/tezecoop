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
    }
}
