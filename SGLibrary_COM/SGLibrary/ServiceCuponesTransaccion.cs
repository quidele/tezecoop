using SGLibrary.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace SGLibrary
{


    public class ServiceCuponesTransaccion : ServiceCupones  
    {

        dbSG2000Entities context;

        public ServiceCuponesTransaccion(dbSG2000Entities pdbSG2000Entities)
        {
            context = pdbSG2000Entities;
        }


        /// <summary>
        /// grabar movimientos contables para reflejar la salida del dinero
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public void GrabarCuponTransaccion(Double pvlPesos, decimal pnrCaja, String pdsUsuario, int pnro_trans, int pnrLicencia,
                                                    String pnrFactura, DateTime pdtFecha, String pdsObservaccion,
                                                    int  pcdCliente , String ptpComprobanteCliente ,
                                                    String pnrComprabanteCliente, String pnrTalonarioCliente,
                                                    String ptpLetraCliente, double pvlMontoCupon,
                                                    double pvlComision ) 
        {

            /* var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pvlPesos, () => pnrCaja,
                                    () => pnro_trans, () => pnrLicencia, () => pnrFactura,
                                    () => pdtFecha,  () => pdsObservaccion, () => pcdCliente,
                                    () => ptpComprobanteCliente, () => pnrComprabanteCliente,
                                    () => pnrTalonarioCliente, () => ptpLetraCliente, () => pvlMontoCupon, () => pvlComision
                ).GetLog();
            Trace.TraceInformation(paramLog);
             * 
             */

            try
            {
                //  Setear conceptos y caja
                //  Obtener la entidad Usuario
                TB_Cupones unCupon = new TB_Cupones();

                var max = (from p in context.TB_Cupones 
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
                    unCupon.vlMontoCupon = pvlMontoCupon; // aqui debemos 
                    unCupon.vlComision = pvlComision;
                    unCupon.vlPagoPesos = 0;
                    unCupon.vlPagoReales  = 0;
                    unCupon.vlPagoEuros = 0;
                    unCupon.vlPagoDolares = 0;
                    unCupon.nro_trans = pnro_trans;
                    unCupon.flCobradoalCliente = false;
                    unCupon.flCompensado = false;
                    unCupon.flAnulado = false;
                    unCupon.nrCajaCliente = pnrCaja;
                    unCupon.vlIVA = 0;
                    unCupon.vlSubtotal = 0;
                    unCupon.nro_trans = pnro_trans;  // referencia muy importante
                    context.TB_Cupones.Add(unCupon);
                    context.SaveChanges();

                }


            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                /*foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }*/
                throw;
            }
            return;
        } // CIERRA GrabarCupon



        public List<TB_Cupones> existenComprobantesCompensados( int nro_trans)
        {
            var lista  = (from p in context.TB_Cupones where  p.nro_trans ==  nro_trans &&
                                                                     p.flCompensado == true
                          select p).OrderByDescending(p => p.nrCupon).ToList<TB_Cupones>();

            return lista ;
        }  // cierra metodo existenComprobantesCompensados
        

    } // CIERRA CLASE 



}
