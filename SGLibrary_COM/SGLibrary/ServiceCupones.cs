using SGLibrary.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace SGLibrary
{

    
    public  class ServiceCupones  : ServiceModel  
    {

        /// <summary>
        /// grabar movimientos contables para reflejar la salida del dinero
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public void GrabarCupon(Double pvlPesos, decimal pnrCaja, String pdsUsuario, int pIdConciliacion,
                                                    dbSG2000Entities pdbSG2000Entities, int pnrLicencia,
                                                    String pnrFactura, DateTime pdtFecha,
                                                    Decimal pnrCupon, String pdsObservaccion,
                                                    int  pcdCliente , String ptpComprobanteCliente ,
                                                    String pnrComprabanteCliente, String pnrTalonarioCliente,
                                                    String ptpLetraCliente, double pvlMontoCupon,
                                                    double pvlComision ) 
        {

            Trace.TraceInformation("ingresando a GrabarCupon");

            try
            {
                //  Setear conceptos y caja
                //  Obtener la entidad Usuario
                TB_Cupones unCupon = new TB_Cupones();
                
                var max = (from p in pdbSG2000Entities.TB_Cupones 
                           select p).OrderByDescending(p => p.nrCupon ).FirstOrDefault();

                if (max == null)
                {
                    throw new DAOEntityException("no se pudo obtener el máximo nro de cupón");
                }
                else
                {

                    unCupon.nrCupon = max.nrCupon + 1;
                    unCupon.dtCupon = DateTime.UtcNow ;
                    unCupon.cdCliente = pcdCliente; 
                    unCupon.nrLicencia = 99 ; //  definir que licencia vamos a utilizar para el armado de estos recibos
                    unCupon.tpComprobanteCliente = ptpComprobanteCliente;
                    unCupon.nrComprabanteCliente = pnrComprabanteCliente;
                    unCupon.nrTalonarioCliente = pnrTalonarioCliente;
                    unCupon.tpLetraCliente = ptpLetraCliente;
                    unCupon.vlMontoCupon = pvlMontoCupon;
                    unCupon.vlComision = pvlComision;
                    unCupon.vlPagoPesos = 0;
                    unCupon.vlPagoReales  = 0;
                    unCupon.vlPagoEuros = 0;
                    unCupon.vlPagoDolares = 0;
                    unCupon.IdConciliacion = pIdConciliacion;
                    unCupon.flCobradoalCliente = false;
                    unCupon.flCompensado = false;
                    unCupon.flAnulado = false;
                    unCupon.nrCajaCliente = pnrCaja;
                    unCupon.vlIVA = 0;
                    unCupon.vlSubtotal = 0; 
                    pdbSG2000Entities.TB_Cupones.Add(unCupon);
                    pdbSG2000Entities.SaveChanges();

                }


            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                //foreach (var eve in e.EntityValidationErrors)
                //{
                //    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                //    foreach (var ve in eve.ValidationErrors)
                //    {
                //        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                //            ve.PropertyName, ve.ErrorMessage);
                //    }
                //}
                throw;
            }
            return;
        } // CIERRA GrabarCupon


        public IEnumerable<Object> BuscarViajes(DateTime pfechadesde, DateTime pfechaHasta, String pEmpresa,
                                                 String pnrCuponPosnet, String  pnrTajeta , String pnrLicencia,
                                                 String Factura )
        {
            
            String[] substrings = Factura.Split('-');
            String comprobante="";
            String pdv = substrings[0];
            if (substrings.Count() == 2) { comprobante = substrings[1]; }
            int nrLicencia = 0;
            if (pnrLicencia.Trim().Length> 0)
                nrLicencia =int.Parse (pnrLicencia); 

 
            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeViajes = (from c in context.TB_Cupones 
                                                where c.dtCupon  >= pfechadesde
                                                      && c.dtCupon <= pfechaHasta
                                                      && c.nmEmpresaTarjeta.Contains (pEmpresa)  
                                                      && c.nrTarjeta.Contains (pnrTajeta)
                                                      && (c.nrLicencia == nrLicencia || nrLicencia == 0 )
                                                      && c.nrComprabanteCliente.Contains(pdv)
                                                      && c.nrComprabanteCliente.Contains(comprobante)
                                                      && c.nrCuponPosnet.Contains(pnrCuponPosnet)
                                                //&& (c.nm == usuario || usuario.Trim().Length == 0)
                                                orderby c.IdConciliacion descending  // ordenamos desde mas reciente a mas vieja
                                                select new
                                                {
                                                    ID = c.nrCupon,
                                                    FECHA = c.dtCupon,
                                                    COND_VENTA = c.tpCupon, 
                                                    LICENCIA = c.nrLicencia,
                                                    DOC = c.tpComprobanteCliente,
                                                    LETRA = c.tpLetraCliente,
                                                    PDV = c.nrTalonarioCliente,
                                                    NRO = c.nrComprabanteCliente,
                                                    MONTO = c.vlMontoCupon,
                                                    COMPENSADO = c.flCompensado,
                                                    CONCILIACION = c.IdConciliacion, 
                                                    EMPRESA = c.nmEmpresaTarjeta, 
                                                    TARJETA =c.nrTarjeta,
                                                    CUPON = c.nrCuponPosnet,
                                                    FECHA_PAGO = c.dtCobradoalCliente
                                                });

                if (listadeViajes == null) return null;
                return listadeViajes.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }


    } // CIERRA CLASE 



}
