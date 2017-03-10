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
                                TotalConciliacion = TotalConciliacion + item.vlMontoCupon.Value;
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
                        _listado_Errores.Add(next.Message);
                        se = next.InnerException as DbUpdateException;
                        next = se;
                    }


                }

            }


        }


        

    }
}


        