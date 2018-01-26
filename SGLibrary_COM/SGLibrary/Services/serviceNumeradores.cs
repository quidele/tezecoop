using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary.Services
{
    public class ServiceNumeradores : ServiceModelGenerico<TB_numeradores>
    {
        dbSG2000Entities context;

        public ServiceNumeradores(dbSG2000Entities pdbSG2000Entities)
        {
            context = pdbSG2000Entities;
        }

        public override IEnumerable<TB_numeradores> ObtenerTodosLosRegistros()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog);

            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_numeradores
                                    orderby c.numerador  ascending
                                    select c);
            return listadeRegistros.ToList();
            
        } // Fin ObtenerTodosLosRegistros 

        public override void AgregarRegistro(TB_numeradores unRegistro)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            try
            {
            
                using (TransactionScope transaction = new TransactionScope())
                {
                    context.TB_numeradores.Add(unRegistro);
                    context.SaveChanges();
                    transaction.Complete();
                    return;

                } //  TransactionScope
            
            }  catch (DbEntityValidationException e)
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

                this._lista_errores = "";
                throw;
            }
        }

        public override void AnularRegistro(TB_numeradores unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            // Agregar la validaciones necesarias previas a la eliminación

            using (TransactionScope transaction = new TransactionScope())
            {
                var objNumeradorBD = (from c in context.TB_numeradores
                                        where c.numerador  == unRegistro.numerador 
                                        select c).First<TB_numeradores>();

                /* objNumeradorBD.fecha_mod = DateTime.Now;
                objNumeradorBD.usuario_mod = this.usuario_mod; */
                context.TB_numeradores.Remove(objNumeradorBD);
                transaction.Complete();
            }

            
        }

        public override void ModificarRegistro(TB_numeradores unRegistro)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => unRegistro).GetLog();
            Trace.TraceInformation(paramLog);

            
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

        }

        public int ObtenerValor(String p_numerador)
        {

            int aux_valor = 0;
            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => p_numerador).GetLog();
            Trace.TraceInformation(paramLog);

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

            paramLog = new SGLibrary.Utility.ParamLogUtility(() => aux_valor).GetLog();
            Trace.TraceInformation(paramLog);

            return aux_valor; 
        }


        public override TB_numeradores CompletarAuditoria(TB_numeradores obj, string p_seccion, string p_bloque, string p_estado_registro, string p_operacion_mod)
        {

            obj.usuario_mod = obj.usuario_mod;
            obj.fecha_mod = DateTime.Now;
            obj.terminal_mod = System.Environment.MachineName; 
            obj.operacion_mod = p_operacion_mod;
            obj.estado_registro = p_estado_registro;
            obj.formulario = obj.formulario;
            obj.seccion = p_seccion;
            obj.bloque = p_bloque;
            obj.linea = 1;

            return obj;
        }


            
        

    }// Cierra Clase 
} // Cierra namespace
