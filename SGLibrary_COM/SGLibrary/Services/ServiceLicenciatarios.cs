using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class ServiceLicenciatarios :  ServiceModelGenerico<TB_Proveedores>
    {

        dbSG2000Entities context;

        public ServiceLicenciatarios(dbSG2000Entities pdbSG2000Entities)
        {
            context = pdbSG2000Entities;
        }


        public override IEnumerable<TB_Proveedores> ObtenerTodosLosRegistros()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog);
            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_Proveedores
                                    where c.nrLicencia != ""
                                    orderby c.nrLicencia ascending
                                    select c);
            return listadeRegistros.ToList();
        }



        public override IEnumerable<TB_Proveedores> ObtenerTodosLosRegistrosConExclusion(List<TB_Proveedores> lista_a_excluir)
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog);
            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_Proveedores
                                    where (c.nrLicencia != "") &&  (!lista_a_excluir.Exists (x => x.cdProveedor == c.cdProveedor ))
                                    orderby c.nrLicencia ascending
                                    select c);
            return listadeRegistros.ToList();
        }

    }
}
