


using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Transactions;

namespace SGLibrary
{
    public class ServiceParametros : ServiceModel
    {
        public TB_Parametros ObtenerParametro(String nombre)
        {

            var paramLog = new SGLibrary.Utility.ParamLogUtility(() => nombre ).GetLog();
            Trace.TraceInformation(paramLog); 

            using (var context = new dbSG2000Entities())
            {
                var un_TB_Parametros = (from c in context.TB_Parametros
                             where c.dsParametro == nombre
                             select c).First();

                Trace.TraceInformation(un_TB_Parametros.ToString());
                return un_TB_Parametros;

            }
        }

    } // Cierre Clase

} // Cierrar NAMESPACE


