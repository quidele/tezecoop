using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

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
    }
}
