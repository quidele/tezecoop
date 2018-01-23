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
        
        public override  IEnumerable<TB_documentos> ObtenerTodosLosRegistros()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog); 

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeRegistros = (from c in context.TB_documentos
                                                orderby c.cod_doc ascending 
                                                select c );
                return listadeRegistros.ToList();
            }
        } // Fin ObtenerTodosLosRegistros 

        public override void AgregarRegistro(TB_documentos unRegistro)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog); 

            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                    
                    context.TB_documentos.Add(unRegistro);
                    // agregamos un numerador asociado al documento
                    ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores();
                    TB_numeradores un_TB_numeradores = new TB_numeradores();
                    un_TB_numeradores.numerador = unRegistro.cod_doc + "0" + new ServiceParametros().ObtenerParametro("Empresa");
                    this.CompletarAuditoria(un_TB_numeradores);
                    un_TB_numeradores.valor_asignado = 0;
                    un_ServiceNumeradores.AgregarRegistro(un_TB_numeradores);

                    context.SaveChanges();
                    transaction.Complete();
                    return;

                } //  TransactionScope
            } // Cierra using Context 
        }

        public override void AnularRegistro(TB_documentos unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Agregar la validaciones necesarias previas a la eliminación

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objDocumentoBD = (from c in context.TB_documentos
                                             where c.cod_doc  == unRegistro.cod_doc
                                          select c).First<TB_documentos>();

                    // Eliminamos numerador asociado al documento
                    ServiceNumeradores un_ServiceNumeradores = new ServiceNumeradores();
                    TB_numeradores un_TB_numeradores = new TB_numeradores();
                    un_TB_numeradores.numerador = unRegistro.cod_doc + "0" + new ServiceParametros().ObtenerParametro("Empresa");
                    un_ServiceNumeradores.AnularRegistro(un_TB_numeradores);
                    objDocumentoBD.fecha_mod  = DateTime.Now;
                    objDocumentoBD.usuario_mod = this.usuario_mod;
                    context.TB_documentos.Remove(objDocumentoBD);
                    transaction.Complete();
                }

            } // using context
        }

        public override void ModificarRegistro(TB_documentos unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Agregar la validaciones necesarias previas a la eliminación

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objDocumentoBD = (from c in context.TB_documentos
                                          where c.cod_doc == unRegistro.cod_doc
                                          select c).First<TB_documentos>();

                    objDocumentoBD.fecha_mod = DateTime.Now;
                    objDocumentoBD.usuario_mod = this.usuario_mod ;
                    objDocumentoBD.nom_doc = unRegistro.nom_doc; 
                    context.SaveChanges();
                    transaction.Complete();
                }

            } // using context
        }

    }
}

