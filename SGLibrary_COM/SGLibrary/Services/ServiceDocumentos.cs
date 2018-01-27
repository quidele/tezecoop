using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary.Services
{
    public class ServiceDocumentos : ServiceModelGenerico<TB_documentos>
    {

        dbSG2000Entities context;

        public ServiceDocumentos(dbSG2000Entities pdbSG2000Entities)
        {
            context = pdbSG2000Entities;
        }

        public override  IEnumerable<TB_documentos> ObtenerTodosLosRegistros()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog); 

                // Falta agregar filtro de fechas
                var listadeRegistros = (from c in context.TB_documentos
                                                orderby c.cod_doc ascending 
                                                select c );
                return listadeRegistros.ToList();
            
        } // Fin ObtenerTodosLosRegistros 

        public override void AgregarRegistro(TB_documentos unRegistro)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog); 

            using (TransactionScope transaction = new TransactionScope())
            {
                unRegistro.fecha_mod = DateTime.Now;
                unRegistro.usuario_mod = this.usuario_mod; 
                context.TB_documentos.Add(unRegistro);
                // agregamos un numerador asociado al documento
                ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(context);
                TB_numeradores un_TB_numeradores = new TB_numeradores();
                un_TB_numeradores.numerador = unRegistro.cod_doc + "0" + new ServiceParametros().ObtenerParametro("Empresa");
                un_TB_numeradores.nombre = unRegistro.cod_doc + "0" + new ServiceParametros().ObtenerParametro("Empresa");
                un_TB_numeradores.formulario = this.formulario;
                un_TB_numeradores.usuario_mod = this.usuario_mod;
                un_TB_numeradores.consecutivos = "S";
                un_TB_numeradores.incremento = 1;
                un_TB_numeradores = un_ServiceNumeradores.CompletarAuditoria(un_TB_numeradores, "seccion", "bloque", "A", "Nuevo");
                un_TB_numeradores.valor_asignado = 0;
                un_ServiceNumeradores.AgregarRegistro(un_TB_numeradores);
                context.SaveChanges();
                transaction.Complete();
                return;

            } //  TransactionScope
            
        }

        public override void AnularRegistro(TB_documentos unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            // Agregar la validaciones necesarias previas a la eliminación
            using (TransactionScope transaction = new TransactionScope())
            {
                var objDocumentoBD = (from c in context.TB_documentos
                                            where c.cod_doc  == unRegistro.cod_doc
                                        select c).First<TB_documentos>();

                // Eliminamos numerador asociado al documento
                ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores(context);
                TB_numeradores un_TB_numeradores = new TB_numeradores();
                un_TB_numeradores.numerador = unRegistro.cod_doc + "0" + new ServiceParametros().ObtenerParametro("Empresa");
                un_ServiceNumeradores.AnularRegistro(un_TB_numeradores);
                /* objDocumentoBD.fecha_mod  = DateTime.Now;
                objDocumentoBD.usuario_mod = this.usuario_mod; */
                context.TB_documentos.Remove(objDocumentoBD);
                context.SaveChanges();
                transaction.Complete();
            }
           
            
        }

        public override void ModificarRegistro(TB_documentos unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            
            // Agregar la validaciones necesarias previas a la eliminación

            using (TransactionScope transaction = new TransactionScope())
            {
                var objDocumentoBD = (from c in context.TB_documentos
                                        where c.cod_doc == unRegistro.cod_doc
                                        select c).First<TB_documentos>();

                objDocumentoBD.fecha_mod = DateTime.Now;
                objDocumentoBD.usuario_mod = this.usuario_mod ;
                objDocumentoBD.nom_doc = unRegistro.nom_doc;
                //this.CompletarAuditoria(objDocumentoBD, "seccion", "bloque", "M", "Editar");
                context.SaveChanges();
                transaction.Complete();
            }

            
        }

         
        public override TB_documentos ObtenerRegistroxId(String pId){

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pId).GetLog();
            Trace.TraceInformation(paramLog);

            // Agregar la validaciones necesarias previas a la eliminación
            using (TransactionScope transaction = new TransactionScope())
            {
                var objDocumentoBD = (from c in context.TB_documentos
                                        where c.cod_doc == pId
                                        select c).First<TB_documentos>();
                return objDocumentoBD;
            }
            
        }


        public override TB_documentos ObtenerRegistro(String pId)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => pId).GetLog();
            Trace.TraceInformation(paramLog);

            // Agregar la validaciones necesarias previas a la eliminación
            using (TransactionScope transaction = new TransactionScope())
            {
                var objDocumentoBD = (from c in context.TB_documentos
                                        where c.cod_doc == pId
                                        select c).First<TB_documentos>();
                return objDocumentoBD;
            }

            
        }// Cierre ObtenerRegistro

    }
}

