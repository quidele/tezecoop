using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary.Services
{
    public class ServiceNumeradores : ServiceModelGenerico<TB_numeradores>
    {

        public override IEnumerable<TB_numeradores> ObtenerTodosLosRegistros()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeRegistros = (from c in context.TB_numeradores
                                        orderby c.numerador  ascending
                                        select c);
                return listadeRegistros.ToList();
            }
        } // Fin ObtenerTodosLosRegistros 

        public override void AgregarRegistro(TB_numeradores unRegistro)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                using (TransactionScope transaction = new TransactionScope())
                {
                    context.TB_numeradores.Add(unRegistro);
                    context.SaveChanges();
                    transaction.Complete();
                    return;

                } //  TransactionScope
            } // Cierra using Context 
        }

        public override void AnularRegistro(TB_numeradores unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Agregar la validaciones necesarias previas a la eliminación

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objNumeradorBD = (from c in context.TB_numeradores
                                          where c.numerador  == unRegistro.numerador 
                                          select c).First<TB_numeradores>();

                    objNumeradorBD.fecha_mod = DateTime.Now;
                    objNumeradorBD.usuario_mod = this.usuario_mod ;
                    context.TB_numeradores.Remove(objNumeradorBD);
                    transaction.Complete();
                }

            } // using context
        }

        public override void ModificarRegistro(TB_numeradores unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Agregar la validaciones necesarias previas a la eliminación

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objNumeradorBD = (from c in context.TB_numeradores
                                          where c.numerador == unRegistro.numerador 
                                          select c).First<TB_numeradores>();

                    objNumeradorBD.fecha_mod = DateTime.Now;
                    objNumeradorBD.usuario_mod = this.usuario_mod ;
                    objNumeradorBD.valor_asignado = unRegistro.valor_asignado ;
                    context.SaveChanges();
                    transaction.Complete();
                }

            } // using context
        }

        public int ObtenerValor(String p_numerador)
        {

            int aux_valor = 0;
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => p_numerador).GetLog();
            Trace.TraceInformation(paramLog);

            using (var context = new dbSG2000Entities())
            {
                // Agregar la validaciones necesarias previas a la eliminación

                using (TransactionScope transaction = new TransactionScope())
                {
                    var objNumeradorBD = (from c in context.TB_numeradores
                                          where c.numerador == p_numerador
                                          select c).First<TB_numeradores>();

                    aux_valor = objNumeradorBD.valor_asignado;
                    objNumeradorBD.valor_asignado = objNumeradorBD.valor_asignado + 1;
                    context.SaveChanges();
                    transaction.Complete();
                }

            } // using context

            paramLog = new SGLibrary.Utility.ParamLogUtility(() => aux_valor).GetLog();
            Trace.TraceInformation(paramLog);

            return aux_valor; 
        } 
    }// Cierra Clase 
} // Cierra namespace
