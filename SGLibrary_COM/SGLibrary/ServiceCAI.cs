using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary
{
    public class ServiceCAI : ServiceModel
    {

        public IEnumerable<Object> obtenerEstadoCAIs(int mes, int anio)
        {

            using (var context = new dbSG2000Entities())
            {
                var lista = context.spu_obtenerUltNroCAIsUsados(mes, anio);
                Trace.TraceInformation(lista.ToString());
                return lista.ToList();

            }

        }

        
       
        public void agregarPresentacionCAI(TB_PresentacionesCAI objPresentacion ,IEnumerable<TB_PresentacionesCAIDetalle> objPresentacionDetalle)
        {

            Trace.TraceInformation("ingresando a agregarPresentacionCAI");
            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {
                    TB_PresentacionesCAIDetalle detalleConciliacion = new TB_PresentacionesCAIDetalle();
                    foreach (var item in objPresentacionDetalle)
                    {
                        
                        context.TB_PresentacionesCAIDetalle.Add(new TB_PresentacionesCAIDetalle { TB_PresentacionesCAI = objPresentacion, 
                                                                                                   nrCAI  = item.nrCAI ,
                                                                                                   dtInsercion  = DateTime.Now ,
                                                                                                   nrUltNroComprobante  = item.nrUltNroComprobante 
                                                                                                   });
                        
                    }
                    context.TB_PresentacionesCAI.Add(objPresentacion);
                    context.SaveChanges();
                    transaction.Complete();
                    return;

                }
            }
        } // cierre agregarPresentacionCAI


        public virtual void anularPresentacion(TB_PresentacionesCAI objPresentacion)
        {
            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objPresentacionBD = (from c in context.TB_PresentacionesCAI 
                                             where c.IdPresentacion  == objPresentacion.IdPresentacion
                                             select c).First<TB_PresentacionesCAI>();

                    objPresentacionBD.dtModificacion = DateTime.Now;
                    objPresentacionBD.flestado = "E";  // Conciliacion Eliminada
                    context.SaveChanges();
                    transaction.Complete();
                }

            }
        }  // anularPresentacion 


        

    }
}


        