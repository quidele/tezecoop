using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;
using SGLibrary.Exceptions;
using System.Data.Entity.Validation; 

namespace SGLibrary.Services
{
    public class ServiceObligaciones : ServiceModelGenerico<Obligaciones>
    {
         dbSG2000Entities context;

         public ServiceObligaciones(dbSG2000Entities pdbSG2000Entities)
        {
            context = pdbSG2000Entities;            
        }


         public override IEnumerable<Obligaciones> ObtenerTodosLosRegistros()
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
             Trace.TraceInformation(paramLog);

             // Falta agregar filtro de fechas
             var listadeRegistros = (from c in context.TB_transCab
                                     where c.cod_doc == "OBAP"
                                     orderby c.nro_trans  ascending
                                     select c);
             listadeRegistros.ToList();

             List<Obligaciones> listadeObligaciones = new List<Obligaciones>(); 
             foreach (var item in listadeRegistros)
             {
                 listadeObligaciones.Add (new Obligaciones (item, null , null) );
             }
             return listadeObligaciones; 

         } // Fin ObtenerTodosLosRegistros 

         public override void AgregarRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             try
             {
                     using (TransactionScope transaction = new TransactionScope())
                     {
                         // Verificar la grabacion de los numeros nro_trans y nor_doc
                         context.TB_transCab.Add(unRegistro.TB_transCab);
                         context.SaveChanges();
                         foreach (var item in unRegistro.TB_ObligacionesTitulares )
	                     {
                             context.TB_ObligacionesTitulares.Add(item);
	                     }
                         context.SaveChanges();
                         foreach (var item in unRegistro.TB_ObligacionesCuotas  )
                         {
                             context.TB_ObligacionesCuotas.Add(item);
                         }

                         // Hacemos un Guardado parcial de la transaccion
                         context.SaveChanges();

                         ServiceCuponesTransaccion un_ServiceCuponesTransaccion = new ServiceCuponesTransaccion(context);

                         foreach (var item in unRegistro.TB_ObligacionesCuotas)
                         {
                             un_ServiceCuponesTransaccion.GrabarCuponTransaccion (0, decimal.Parse ( this.CajaAdm)  , this.Usuario , item.nro_trans ,
                                                                                   int.Parse ( item.nrLicencia)  , null, unRegistro.TB_transCab.fec_doc ,
                                                                                    unRegistro.TB_transCab.com_mov , 0 , unRegistro.TB_transCab.cod_doc ,
                                                                                    unRegistro.TB_transCab.nro_doc.ToString(), unRegistro.TB_transCab.serie_doc.ToString(),
                                                                                    unRegistro.TB_transCab.letra_doc, Convert.ToDouble(item.importe), Convert.ToDouble (item.importe));
                         }

                         context.SaveChanges();
                         transaction.Complete();
                         return;
                     } //  TransactionScope

             }
             catch (DbEntityValidationException e)
             {
                 Console.WriteLine(e);
                 Trace.TraceError(e.Message);
                 foreach (var eve in e.EntityValidationErrors)
                 {
                     Trace.TraceError("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                         eve.Entry.Entity.GetType().Name, eve.Entry.State);

                     foreach (var ve in eve.ValidationErrors)
                     {
                         Trace.TraceError("- Property: \"{0}\", Error: \"{1}\"",
                             ve.PropertyName, ve.ErrorMessage);
                     }
                 }
                 throw new ServiceObligacionesException("No se puede grabar el registro existen errores ", e);
             }

         }

         public override void AnularRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             /* VALIDAR QUE NO SE ALLA COMPENSADO NINGUNA CUOTA */
             ServiceCuponesTransaccion un_ServiceCuponesTransaccion = new ServiceCuponesTransaccion(context);

             var listaCuponesCompensados = un_ServiceCuponesTransaccion.existenComprobantesCompensados( unRegistro.TB_transCab.nro_trans);
             if (listaCuponesCompensados.Count() != 0)
             {
                 // avisar mediante excepcion 
                 throw new ServiceObligacionesException("No se puede modificar el registrio ya que existen Comprobantes compensados", listaCuponesCompensados);
             }  


             // Agregar la validaciones necesarias previas a la eliminación
             using (TransactionScope transaction = new TransactionScope())
             {

                 var objTB_transCab = (from c in context.TB_transCab
                                       where c.nro_trans  == unRegistro.TB_transCab.nro_trans 
                                       select c).First<TB_transCab>();

                 var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                                    where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                                    select c);

                 var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                                 where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                                 select c);

                 context.TB_transCab.Remove(objTB_transCab);
                 foreach (var item in objTB_ObligacionesTitulares)
                 {
                     context.TB_ObligacionesTitulares.Remove (item);
                 }
                 foreach (var item in objTB_ObligacionesCuotas)
                 {
                     context.TB_ObligacionesCuotas.Remove  (item);
                 }

             }


         }

         

         public override  void ModificarRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             /* VALIDAR QUE NO SE ALLA COMPENSADO NINGUNA CUOTA */
             ServiceCuponesTransaccion un_ServiceCuponesTransaccion = new ServiceCuponesTransaccion (context);

             var listaCuponesCompensados = un_ServiceCuponesTransaccion.existenComprobantesCompensados( unRegistro.TB_transCab.nro_trans);
             if (listaCuponesCompensados.Count() != 0  ) {
                  // avisar mediante excepcion 
                 throw new ServiceObligacionesException("No se puede modificar el registrio ya que existen Comprobantes compensados", listaCuponesCompensados); 
             }  


             using (TransactionScope transaction = new TransactionScope())
             {
                 
                 var objTB_transCab = (from c in context.TB_transCab
                                       where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                       select c).First<TB_transCab>();

                 var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                                    where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                                    select c);

                 var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                                 where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                                 select c);

                 foreach (var item in objTB_ObligacionesTitulares)
                 {
                     context.TB_ObligacionesTitulares.Remove(item);
                 }
                 foreach (var item in objTB_ObligacionesCuotas)
                 {
                     context.TB_ObligacionesCuotas.Remove(item);
                 }

                 
                 // Damos de alta los nuevas relaciones
                 foreach (var item in unRegistro.TB_ObligacionesTitulares)
                 {
                     context.TB_ObligacionesTitulares.Add(item);
                 }
                 foreach (var item in unRegistro.TB_ObligacionesCuotas)
                 {
                     context.TB_ObligacionesCuotas.Add(item);
                 }

                 context.SaveChanges(); 
                 transaction.Complete();

             }

             
         } // Cierra Metodo ModificarRegistro 


         public override Obligaciones ObtenerRegistroxId(String pId)
         {

             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pId).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             using (TransactionScope transaction = new TransactionScope())
             {
                 var objTB_transCab = (from c in context.TB_transCab
                                       where c.cod_doc == pId
                                       select c).First<TB_transCab>();

                 var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                                    where c.nro_trans == int.Parse(pId)
                                                    select c);

                 var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                                 where c.nro_trans == int.Parse(pId)
                                                 select c);

                 var un_Obligaciones = new Obligaciones(objTB_transCab, objTB_ObligacionesTitulares.ToList(), objTB_ObligacionesCuotas.ToList());

                 return un_Obligaciones;
             }

         }


         public override Obligaciones ObtenerRegistro(String pId)
         {

             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pId).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             using (TransactionScope transaction = new TransactionScope())
             {
                 var objDocumentoBD = (from c in context.TB_documentos
                                       where c.cod_doc == pId
                                       select c).First<TB_documentos>();
                 return new Obligaciones() ;
             }


         }// Cierre ObtenerRegistro


         public override IEnumerable<Obligaciones> ObtenerRegistros(DateTime fechadesde, DateTime fechaHasta, string usuario)
         {
             List<Obligaciones> un_lista_obligaciones = new  List<Obligaciones> () ;
             using (var context = new dbSG2000Entities())
             {
                 // Falta agregar filtro de fechas
                 IEnumerable<TB_transCab> listadeRegistros = (from c in context.TB_transCab
                                                 where c.fec_doc >= fechadesde
                                                 && c.fec_doc <= fechaHasta
                                                 && (c.usuario_mod == usuario || usuario.Trim().Length == 0)
                                                 orderby c.nro_trans descending  // ordenamos desde mas reciente a mas vieja
                                                 select c);
                foreach (var item in listadeRegistros.ToList<TB_transCab>())
	            {
                    un_lista_obligaciones.Add(new Obligaciones(item, null, null));
	            }

                 return un_lista_obligaciones;
             } // cierre using

         } // cierra metodo ObtenerRegistros


         public  IEnumerable<TB_ObligacionesCuotasExt> calcularVencimientos(List<TB_ProveedoresExt> p_listaTitulares,  decimal p_total, 
                                                                    decimal p_cuotas,  DateTime  p_fecha_inicio , string p_periodo )
         {
             List<TB_ObligacionesCuotasExt> lista_resultado = new List<TB_ObligacionesCuotasExt>();

             var monto_cuota = p_total / p_cuotas; 
             System.DateTime  fecha_vencimiento;

             foreach (var item in p_listaTitulares)
             {
                 for (int i = 1; i <= p_cuotas; i++)
                 {
                     switch (p_periodo)
	                    {
                         case "Semanal": 
                             fecha_vencimiento =  p_fecha_inicio.AddDays(i * 7);   
                             break;
                         case "Mensual": 
                             fecha_vencimiento = p_fecha_inicio.AddMonths (i);
                             break;
                         case "Trimestral":
                             fecha_vencimiento = p_fecha_inicio.AddMonths(i * 3 ); 
                             break;
                         case "Semestral":
                             fecha_vencimiento = p_fecha_inicio.AddMonths(i * 6);
                             break;
                         case "Anual":
                             fecha_vencimiento = p_fecha_inicio.AddYears(i);
                             break;
                             
                         default:
                             fecha_vencimiento = p_fecha_inicio; 
                             break;
	                    }
                     
                     // Armar TB_ObligacionesCuotasExt
                     lista_resultado.Add(new TB_ObligacionesCuotasExt(1, item.cdProveedor, i, fecha_vencimiento, monto_cuota,item.nrLicencia ,""));
                 }
             }
             return lista_resultado;
         } // cierre metodo calcularVencimientos



         public override Obligaciones CompletarAuditoria(Obligaciones obj, string p_seccion, string p_bloque, string p_estado_registro, string p_operacion_mod)
         {
             obj.TB_transCab.estado_registro = p_estado_registro;
             obj.TB_transCab.seccion = p_seccion;
             obj.TB_transCab.bloque = p_bloque;
             obj.TB_transCab.operacion_mod = p_operacion_mod;

             return obj;
         }
         
    } // Cierra la clase 
} // Cierra el namespace 
