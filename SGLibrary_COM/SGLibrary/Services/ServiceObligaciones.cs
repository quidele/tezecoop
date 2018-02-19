﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary.Services
{
    public class ServiceObligaciones : ServiceModelGenerico<Obligaciones>
    {
         dbSG2000Entities context;

         public ServiceObligaciones(dbSG2000Entities pdbSG2000Entities, TransactionScope ptransacion)
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

             using (TransactionScope transaction = new TransactionScope())
             {
   
                 //context.TB_documentos.Add(unRegistro);
                 // agregamos un numerador asociado al documento
                 //ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(context);
                 TB_numeradores un_TB_numeradores = new TB_numeradores();
                 un_TB_numeradores.formulario = this.formulario;
                 un_TB_numeradores.usuario_mod = this.usuario_mod;
                 un_TB_numeradores.consecutivos = "S";
                 un_TB_numeradores.incremento = 1;
                 un_TB_numeradores.valor_asignado = 0;


                 // Verificar la grabacion de los numeros nro_trans y nor_doc
                 context.TB_transCab.Add(unRegistro.TB_transCab);
                 foreach (var item in unRegistro.TB_ObligacionesTitulares )
	             {
                     context.TB_ObligacionesTitulares.Add(item);
	             }
                 foreach (var item in unRegistro.TB_ObligacionesCuotas  )
                 {
                     context.TB_ObligacionesCuotas.Add(item);
                 }
                 context.SaveChanges();
                 transaction.Complete();
                 return;

             } //  TransactionScope

         }

         public override void AnularRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             /* VALIDAR QUE NO SE ALLA COMPENSADO NINGUNA CUOTA */

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

         public override void ModificarRegistro(Obligaciones unRegistro)
         {
             var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
             Trace.TraceInformation(paramLog);

             // Agregar la validaciones necesarias previas a la eliminación
             /* VALIDAR QUE NO SE ALLA COMPENSADO NINGUNA CUOTA */

             using (TransactionScope transaction = new TransactionScope())
             {
                 /*
                  * var objDocumentoBD = (from c in context.TB_documentos
                                       where c.cod_doc == unRegistro.cod_doc
                                       select c).First<TB_documentos>();

                 objDocumentoBD.fecha_mod = DateTime.Now;
                 objDocumentoBD.usuario_mod = this.usuario_mod;
                 objDocumentoBD.nom_doc = unRegistro.nom_doc;
                 //this.CompletarAuditoria(objDocumentoBD, "seccion", "bloque", "M", "Editar");
                 context.SaveChanges();
                 transaction.Complete();
                  *
                  */

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


         }


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

         

    } // Cierra la clase 
} // Cierra el namespace 
