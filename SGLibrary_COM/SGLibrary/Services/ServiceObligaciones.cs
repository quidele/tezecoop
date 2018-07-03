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


         public override IEnumerable<Object> obtenerUsuarios()
         {
             
                 // Falta agregar filtro de fechas
                 var lista = (from c in context.TB_transCab
                                                 select new { USUARIO = c.usuario_mod }).Distinct();
                 return lista.ToList();
         }

         public IEnumerable<Object> ObtenerDescripciones()
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
             Trace.TraceInformation(paramLog);

             // Falta agregar filtro de fechas
             var listadeRegistros = (from c in context.TB_transCab
                                     where c.cod_doc == "OBAP"
                                     orderby c.nro_trans ascending
                                     select new { descripcion = c.descripcion  }).Distinct();
             return listadeRegistros.ToList();

         } // Fin ObtenerTodosLosRegistros

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
                                                                                    item.nrLicencia.GetValueOrDefault()  , null, item.fecha_vencimiento.Value.Date ,
                                                                                    unRegistro.TB_transCab.descripcion  , 0 , unRegistro.TB_transCab.cod_doc ,
                                                                                    unRegistro.TB_transCab.nro_doc.ToString(), unRegistro.TB_transCab.serie_doc.ToString(),
                                                                                    unRegistro.TB_transCab.letra_doc, Convert.ToDouble(item.importe), 
                                                                                    Convert.ToDouble(item.importe), unRegistro.TB_transCab.com_mov, unRegistro.TB_transCab.descripcion  ,"Débito");
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

                     int nrLicenciaBuscada = item.nrLicencia.GetValueOrDefault ();
                     TB_Cupones un_TB_CuponesBD = (from c in context.TB_Cupones
                                                   where c.nro_trans == item.nro_trans && c.nrLicencia == nrLicenciaBuscada
                                                   select c).First<TB_Cupones>();

                     context.TB_Cupones.Remove(un_TB_CuponesBD);
                     context.SaveChanges();
                     context.TB_ObligacionesCuotas.Remove  (item);
                 }
                 context.SaveChanges();
                 transaction.Complete();
             }// Cierra el  TransactionScope
         } // Cierra metodo AnularRegistro

         
         public override  void ModificarRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             /* VALIDAR QUE NO SE ALLA COMPENSADO NINGUNA CUOTA */
             ServiceCuponesTransaccion un_ServiceCuponesTransaccion = new ServiceCuponesTransaccion (context);

             using (TransactionScope transaction = new TransactionScope())
             {
                 
                 var objTB_transCabBD = (from c in context.TB_transCab
                                       where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                       select c).First<TB_transCab>();

                 var objTB_ObligacionesTitularesBD = (from c in context.TB_ObligacionesTitulares
                                                    where c.nro_trans == unRegistro.TB_transCab.nro_trans
                                                      select c).ToList<TB_ObligacionesTitulares>();


                 // Lista para realizar la bajas -- // para las licencias de la BD no incluidas en la IU hay que realizar una baja 
                 var ListaBajasTB_ObligacionesTitularesBD = objTB_ObligacionesTitularesBD.Where(c => !unRegistro.TB_ObligacionesTitulares.Select(fc => fc.nrLicencia).Contains(c.nrLicencia));

                 // Listas para realizar nueva altas    -- // para las licencias de la IU no incluidas en la BD hay que realizar una alta 
                 var ListaAltasTB_ObligacionesTitularesIU = unRegistro.TB_ObligacionesTitulares.Where(c => !objTB_ObligacionesTitularesBD.Select(fc => fc.nrLicencia).Contains(c.nrLicencia));

                 
                
                 // Validaciones sobres las bajas 
                 foreach (var item in ListaBajasTB_ObligacionesTitularesBD)
                 {

                     int nrLicenciaBuscada = item.nrLicencia.GetValueOrDefault() ; 
                     var lista_TB_CuponesBD = (from c in context.TB_Cupones
                                               where c.nro_trans == item.nro_trans && c.nrLicencia == nrLicenciaBuscada
                                               select c).ToList<TB_Cupones>();


                     var listaCuponesCompensadosBD = lista_TB_CuponesBD.Where(c => c.flCompensado == true).ToList<TB_Cupones>();
                     if (listaCuponesCompensadosBD.Count() > 0) // verificamos si 
                     {
                         throw new ServiceObligacionesException("Existen cupones compensados ", listaCuponesCompensadosBD); 
                     }

                     var listaTB_ObligacionesCuotasBD = (from c in context.TB_ObligacionesCuotas
                                                       where c.nro_trans == unRegistro.TB_transCab.nro_trans && c.nrLicencia == item.nrLicencia.GetValueOrDefault()
                                                       select c);

                     foreach (var itemCuotas in listaTB_ObligacionesCuotasBD) 
                     {
                         context.TB_ObligacionesCuotas.Remove(itemCuotas);// Eliminamos la info de cuotas
                     }
                     foreach (var un_TB_CuponesBD in lista_TB_CuponesBD) 
                     {
                         context.TB_Cupones.Remove(un_TB_CuponesBD); // Eliminamos los cupones asociados
                         
                     }
                     context.SaveChanges();
                     context.TB_ObligacionesTitulares.Remove(item); // Eliminamos los titulares asociados
                 }  // Fin de la Rutina de Eliminación

                 // dar de alta la lista de ListaAltasTB_ObligacionesTitularesIU con sus respectivas vencimientos de cuotas
                 // tambien realizar la grabacion de la tabla CUPONES
                 foreach (var itemAlta in ListaAltasTB_ObligacionesTitularesIU)
                 {
                     itemAlta.estado_registro = "PENDIENTE";
                     context.TB_ObligacionesTitulares.Add(itemAlta);
                     // obtenemos la lista de vencimientos / cuotas del titular
                     var listaAltaCuotas = unRegistro.TB_ObligacionesCuotas.Where(c => c.nrLicencia == itemAlta.nrLicencia).ToList<TB_ObligacionesCuotas>();
                     foreach (TB_ObligacionesCuotas itemAltaCuotas in listaAltaCuotas)  
                     {
                         itemAltaCuotas.estado_registro = "PENDIENTE";
                         context.TB_ObligacionesCuotas.Add(itemAltaCuotas);
                         un_ServiceCuponesTransaccion.GrabarCuponTransaccion(0, decimal.Parse(this.CajaAdm), this.Usuario, itemAltaCuotas.nro_trans,
                                                                            itemAltaCuotas.nrLicencia.GetValueOrDefault(), null, itemAltaCuotas.fecha_vencimiento.Value.Date,
                                                                            unRegistro.TB_transCab.descripcion, 0, unRegistro.TB_transCab.cod_doc,
                                                                            unRegistro.TB_transCab.nro_doc.ToString(), unRegistro.TB_transCab.serie_doc.ToString(),
                                                                            unRegistro.TB_transCab.letra_doc, Convert.ToDouble(itemAltaCuotas.importe),
                                                                            Convert.ToDouble(itemAltaCuotas.importe), unRegistro.TB_transCab.com_mov,
                                                                            unRegistro.TB_transCab.descripcion, "Débito");
                     }
                     
                 } // Fin Rutina de alta

                 context.SaveChanges();
                 transaction.Complete();
                 return;

             } // transaction Scope

             
         } // Cierra Metodo ModificarRegistro 


         public override Obligaciones ObtenerRegistroxId(String pId)
         {

             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pId).GetLog();
             Trace.TraceInformation(paramLog);

             int nro_trans = int.Parse(pId);
            var objTB_transCab = (from c in context.TB_transCab
                                  where c.nro_trans == nro_trans
                            select c).First();

            var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                               where c.nro_trans == nro_trans
                                        select c);

            var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                            where c.nro_trans == nro_trans
                                        select c);

            var un_Obligaciones = new Obligaciones(objTB_transCab, objTB_ObligacionesTitulares.ToList(), objTB_ObligacionesCuotas.ToList());

            return un_Obligaciones;

         }


         public override Obligaciones ObtenerRegistro(String pId)
         {

             throw new NotImplementedException();


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

             var monto_cuota = Math.Round   (p_total / p_cuotas ,0); 
             System.DateTime  fecha_vencimiento;

             foreach (var item in p_listaTitulares)
             {
                 for (int i = 0; i < p_cuotas; i++)
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
                     lista_resultado.Add(new TB_ObligacionesCuotasExt(1, item.cdProveedor, i +1 , fecha_vencimiento, monto_cuota, int.Parse ( item.nrLicencia) ,"",""));
                 }
             }
             return lista_resultado;
         } // cierre metodo calcularVencimientos

         
        // Obtener Obligaciones de un titular
         public  IEnumerable<Obligaciones> ObtenerObligaciones(
             DateTime p_fechadesde, DateTime p_fechaHasta, string p_usuario,
             int p_nrLicencia , String p_estado = null)
         {

             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => p_fechadesde, ()=> p_fechaHasta,
             () =>p_usuario  , () => p_nrLicencia, () => p_estado).GetLog();
             Trace.TraceInformation(paramLog);

             IEnumerable<TB_transCab> listadeRegistrosTB_transCab = (from c in context.TB_transCab
                                                                        join t in context.TB_ObligacionesTitulares
                                                                        on c.nro_trans equals t.nro_trans
                                                                        where 
                                                                        t.nrLicencia == p_nrLicencia
                                                                        && c.fec_doc >= p_fechadesde
                                                                        && c.fec_doc <= p_fechaHasta
                                                                        && (c.usuario_mod == p_usuario || p_usuario.ToUpper () == "Todos".ToUpper())
                                                                        && (c.estado_registro == p_estado || p_estado.ToUpper() == "Todos".ToUpper())
                                                                        orderby c.nro_trans ascending   // ordenamos desde mas reciente a mas vieja
                                                                        select c);

             List<int> lista_nro_trans = listadeRegistrosTB_transCab.Select(c => c.nro_trans).ToList<int>();

             List<Obligaciones> lista_resultado = new List<Obligaciones>(); 

             foreach (TB_transCab unTB_transCab  in listadeRegistrosTB_transCab)
             {

                var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                    where  c.nro_trans == unTB_transCab.nro_trans 
                                    select c);

                var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                    where  c.nro_trans == unTB_transCab.nro_trans
                                    select c);

                lista_resultado.Add(new Obligaciones(unTB_transCab, objTB_ObligacionesTitulares.ToList(), objTB_ObligacionesCuotas.ToList())); 
                    
             }

             return lista_resultado;

         }



         public IEnumerable<Obligaciones> ObtenerObligaciones(
             DateTime p_fechadesde, DateTime p_fechaHasta, string p_usuario,
             int p_nrLicencia, String p_estado = null, string p_descripcion = "")
         {

             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => p_fechadesde, () => p_fechaHasta,
             () => p_usuario, () => p_nrLicencia, () => p_estado, () => p_descripcion).GetLog();
             Trace.TraceInformation(paramLog);

             IEnumerable<TB_transCab> listadeRegistrosTB_transCab = (from c in context.TB_transCab
                                                                     join t in context.TB_ObligacionesTitulares
                                                                     on c.nro_trans equals t.nro_trans
                                                                     where
                                                                     (t.nrLicencia == p_nrLicencia || p_nrLicencia  == 0)
                                                                     && c.fec_doc >= p_fechadesde
                                                                     && c.fec_doc <= p_fechaHasta
                                                                     && (c.usuario_mod == p_usuario || p_usuario.ToUpper() == "TODOS".ToUpper())
                                                                     && (c.estado_registro == p_estado || p_estado.ToUpper() == "TODOS".ToUpper())
                                                                     && (c.descripcion.Contains(p_descripcion))
                                                                     orderby c.nro_trans ascending   // ordenamos desde mas reciente a mas vieja
                                                                     select c).Distinct();

             List<int> lista_nro_trans = listadeRegistrosTB_transCab.Select(c => c.nro_trans).ToList<int>();

             List<Obligaciones> lista_resultado = new List<Obligaciones>();

             foreach (TB_transCab unTB_transCab in listadeRegistrosTB_transCab)
             {

                 var objTB_ObligacionesTitulares = (from c in context.TB_ObligacionesTitulares
                                                    where c.nro_trans == unTB_transCab.nro_trans
                                                    select c);

                 var objTB_ObligacionesCuotas = (from c in context.TB_ObligacionesCuotas
                                                 where c.nro_trans == unTB_transCab.nro_trans
                                                 select c);

                 lista_resultado.Add(new Obligaciones(unTB_transCab, objTB_ObligacionesTitulares.ToList(), objTB_ObligacionesCuotas.ToList()));

             }

             return lista_resultado;

         }

       
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
