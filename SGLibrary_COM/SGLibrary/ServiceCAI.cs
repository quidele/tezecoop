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


        public spu_generarPresentacionCAI_v4_9_4_Result generarPresentacionCAI(int idPresetancion)
        {
            using (var context = new dbSG2000Entities())
            {
                spu_generarPresentacionCAI_v4_9_4_Result resultado = context.spu_generarPresentacionCAI_v4_9_4
                    (idPresetancion, "N").First();
                Trace.TraceInformation(resultado.resultado + " "  + resultado.Descrip);
                return resultado;
            }
        }


        public override object ObtenerRegistro(String pId)
        {

            Int32 id = Int32.Parse(pId);
            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                TB_PresentacionesCAI una_Presentacion = (from c in context.TB_PresentacionesCAI
                                                         where c.IdPresentacion == id select c).First();
                // Should Load the Details
                una_Presentacion.TB_PresentacionesCAIDetalle.ToList();
                return una_Presentacion;
            }
        }


        public  IEnumerable<Object> ObtenerDetalle(String pId)
        {

            Int32 id = Int32.Parse(pId);
            using (var context = new dbSG2000Entities())
            {

                TB_PresentacionesCAI una_Presentacion = (from c in context.TB_PresentacionesCAI
                                                         where c.IdPresentacion == id
                                                         select c)
                                      .First();
                // Falta agregar filtro de fechas
                var listaResultado = (from c in context.TB_PresentacionesCAIDetalle
                                      where c.IdPresentacion == id
                                      select new
                                      {
                                          AÑO = una_Presentacion.nrAnio,
                                          MES = una_Presentacion.nrMes,
                                          DOC = c.tpComprobante, 
                                          PDV = c.PDV,
                                          LETRA = c.Letra,
                                          CAI = c.nrCAI,
                                          UltNroComprobante = c.nrUltNroComprobante
                                      });
                                        
                return listaResultado;
            }
        }


        public override  IEnumerable<Object> ObtenerRegistros(DateTime fechadesde, DateTime fechaHasta, String usuario)
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listaResultado = (from c in context.TB_PresentacionesCAI
                                                where c.dtPresentacion  >= fechadesde
                                                && c.dtPresentacion <= fechaHasta
                                                && (c.dsUsuario == usuario || usuario.Trim().Length == 0)
                                                orderby c.IdPresentacion descending  // ordenamos desde mas reciente a mas vieja
                                                select new
                                                {
                                                    ID = c.IdPresentacion ,
                                                    FECHA = c.dtPresentacion ,
                                                    AÑO = c.nrAnio ,
                                                    MES = c.nrMes ,
                                                    USUARIO = c.dsUsuario,
                                                    FECHA_MODIF = c.dtModificacion,
                                                    ESTADO = c.flestado
                                                });
                return listaResultado.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }



        public override  void AgregarRegistro(object unRegistro)
        {

            TB_PresentacionesCAI objPresentacion = (TB_PresentacionesCAI) unRegistro;

            Trace.TraceInformation("ingresando a agregarPresentacionCAI");
            using (var context = new dbSG2000Entities())
            {

                using (TransactionScope transaction = new TransactionScope())
                {
                    //TB_PresentacionesCAIDetalle detalleConciliacion = new TB_PresentacionesCAIDetalle();
                    //foreach (var item in objPresentacion.TB_PresentacionesCAIDetalle)
                    //{

                    //    context.TB_PresentacionesCAIDetalle.Add(new TB_PresentacionesCAIDetalle
                    //    {
                    //        TB_PresentacionesCAI = objPresentacion,
                    //        nrCAI = item.nrCAI,
                    //        dtInsercion = DateTime.Now,
                    //        nrUltNroComprobante = item.nrUltNroComprobante
                    //    });

                    //}
                    context.TB_PresentacionesCAI.Add(objPresentacion);
                    context.SaveChanges();
                    transaction.Complete();
                    return;

                }
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


        public override void AnularRegistro(object unRegistro)
        {
            TB_PresentacionesCAI objPresentacion = (TB_PresentacionesCAI) unRegistro;
            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                    var objPresentacionBD = (from c in context.TB_PresentacionesCAI
                                             where c.IdPresentacion == objPresentacion.IdPresentacion
                                             select c).First<TB_PresentacionesCAI>();

                    objPresentacionBD.dtModificacion = DateTime.Now;
                    objPresentacionBD.flestado = "E";  // Conciliacion Eliminada
                    context.SaveChanges();
                    transaction.Complete();
                }

            }
        }


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


        public IEnumerable<Object> obtenerUsuarios()
        {

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listaResultado = (from c in context.TB_PresentacionesCAI
                                      where c.dsUsuario != null
                                                select new { USUARIO = c.dsUsuario }).Distinct();
                return listaResultado.ToList();
                //return listadeViajesaConciliar.ToList();
            }
        }

    } // Cierre Clase

} // Cierrar NAMESPACE


        