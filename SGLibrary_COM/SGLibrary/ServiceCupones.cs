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
        public void GrabarCupon(Double pvlPesos, decimal pnrCaja, String pdsUsuario, String pIdConciliacion,
                                                    dbSG2000Entities pdbSG2000Entities, int pnrLicencia,
                                                    String pnrFactura, DateTime pdtFecha,
                                                    Decimal pnrCupon, String pdsObservaccion,
                                                    int  pcdCliente , String ptpComprobanteCliente ,
                                                    String pnrComprabanteCliente, String pnrTalonarioCliente,
                                                    String ptpLetraCliente) 
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
                    unCupon.cdCliente = pcdCliente; 
                    unCupon.nrLicencia = pnrLicencia;
                    unCupon.tpComprobanteCliente = ptpComprobanteCliente;
                    unCupon.nrComprabanteCliente = pnrComprabanteCliente;
                    unCupon.nrTalonarioCliente = pnrTalonarioCliente;
                    unCupon.tpLetraCliente = ptpLetraCliente;
                    
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
        }
    }
}
