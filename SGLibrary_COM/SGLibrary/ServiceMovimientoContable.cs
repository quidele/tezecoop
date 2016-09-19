using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;

namespace SGLibrary
{
    public class ServiceMovimientoContable : ServiceModel 
    {

        /// <summary>
        /// grabar movimientos contables para reflejar la salida del dinero
        /// </summary>
        /// <param name="una_conciliacion"></param>
        /// <returns></returns>
        public void GrabarAsientoContablePosdatados(Double pvlPesos, decimal pnrCaja, String pdsUsuario, String  pIdConciliacion,
                                                    dbSG2000Entities pdbSG2000Entities, int cdConceptoOrigen, int cdConceptoDestino,
                                                    string pnrLicencia, string pnrFactura, DateTime pdtFechaPosdata, 
                                                    Decimal pnrCupon )
        {

            try
            {
                //  Setear conceptos y caja
                //  Obtener la entidad Usuario
                TB_MovimientosContablesPosdatados unMCConceptoOrigen = new TB_MovimientosContablesPosdatados();
                TB_MovimientosContablesPosdatados unMCConceptoDestino = new TB_MovimientosContablesPosdatados();


                TB_Conceptos cdConceptoConceptoOrigen = (from c in pdbSG2000Entities.TB_Conceptos where c.cdConcepto == cdConceptoOrigen select c).First();

                var max = (from p in pdbSG2000Entities.TB_MovimientosContablesPosdatados
                           select p).OrderByDescending( p => p.IdMovimiento).FirstOrDefault();

                if (max == null) 
                    max = new TB_MovimientosContablesPosdatados();

                unMCConceptoOrigen.IdMovimiento = max.IdMovimiento + 1;
                unMCConceptoOrigen.cdConcepto = cdConceptoConceptoOrigen.cdConcepto;
                unMCConceptoOrigen.dsMovimiento = "Conciliación Nro:  " + pIdConciliacion;
                unMCConceptoOrigen.dsUsuario = pdsUsuario;
                unMCConceptoOrigen.nrCaja = pnrCaja;
                unMCConceptoOrigen.vlPesos = pvlPesos;
                unMCConceptoOrigen.vlDolares = 0.0;
                unMCConceptoOrigen.vlEuros = 0.0;
                unMCConceptoOrigen.dtMovimiento = DateTime.Now;   // Asignamos la fecha de la conciliacion
                unMCConceptoOrigen.nrAnio = DateTime.Now.Year;
                unMCConceptoOrigen.nrRecibo = pIdConciliacion;
                unMCConceptoOrigen.tpCajaImputacion = cdConceptoConceptoOrigen.tpCajaImputacion;  // Completar desde el concepto
                unMCConceptoOrigen.dsConcepto = cdConceptoConceptoOrigen.dsConcepto;  // Completar desde el concepto
                unMCConceptoOrigen.tpOperacion = cdConceptoConceptoOrigen.tpOperacion;  // Completar desde el concepto
                //unMCConceptoOrigen.tpMovimiento = "";
                unMCConceptoOrigen.tpConcepto = cdConceptoConceptoOrigen.tpOperacion;  // Completar desde el concepto

                unMCConceptoOrigen.dsProveedor = "Licencia Nro. " + pnrLicencia;
                unMCConceptoOrigen.nrFactura = pnrFactura;
                unMCConceptoOrigen.flProcesado = false;
                unMCConceptoOrigen.dtFechaPosdata = pdtFechaPosdata;
                unMCConceptoOrigen.nrCupon = pnrCupon;
                unMCConceptoOrigen.IdConciliacion = int.Parse ( pIdConciliacion) ;

                TB_Conceptos cdConceptoConceptoDestino = (from c in pdbSG2000Entities.TB_Conceptos where c.cdConcepto == cdConceptoDestino select c).First(); ;

                pdbSG2000Entities.SaveChanges();

                unMCConceptoDestino.IdMovimiento = max.IdMovimiento + 2;
                unMCConceptoDestino.cdConcepto = cdConceptoConceptoDestino.cdConcepto;
                unMCConceptoDestino.dsMovimiento = "Conciliación Nro:  " + pIdConciliacion;
                unMCConceptoDestino.dsUsuario = pdsUsuario;
                unMCConceptoDestino.nrCaja = pnrCaja;
                unMCConceptoDestino.vlPesos = pvlPesos;
                unMCConceptoDestino.vlDolares = 0.0;
                unMCConceptoDestino.vlEuros = 0.0;
                unMCConceptoDestino.dtMovimiento = DateTime.Now;   // Asignamos la fecha de la conciliacion
                unMCConceptoDestino.nrAnio = DateTime.Now.Year;
                unMCConceptoDestino.nrRecibo = pIdConciliacion;
                unMCConceptoDestino.tpCajaImputacion = cdConceptoConceptoDestino.tpCajaImputacion;  // Completar desde el concepto
                unMCConceptoDestino.dsConcepto = cdConceptoConceptoDestino.dsConcepto;  // Completar desde el concepto
                unMCConceptoDestino.tpOperacion = cdConceptoConceptoDestino.tpOperacion;  // Completar desde el concepto
                //unMCConceptoOrigen.tpMovimiento = "";
                unMCConceptoDestino.tpConcepto = cdConceptoConceptoOrigen.tpOperacion;  // Completar desde el concepto

                unMCConceptoDestino.dsProveedor = "Licencia Nro. " + pnrLicencia;
                unMCConceptoDestino.nrFactura = pnrFactura;
                unMCConceptoDestino.flProcesado = false;
                unMCConceptoDestino.dtFechaPosdata = pdtFechaPosdata;
                unMCConceptoDestino.nrCupon = pnrCupon;
                unMCConceptoOrigen.IdConciliacion = int.Parse(pIdConciliacion);


                pdbSG2000Entities.TB_MovimientosContablesPosdatados.Add(unMCConceptoOrigen);
                pdbSG2000Entities.TB_MovimientosContablesPosdatados.Add(unMCConceptoDestino);
                pdbSG2000Entities.SaveChanges();

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
