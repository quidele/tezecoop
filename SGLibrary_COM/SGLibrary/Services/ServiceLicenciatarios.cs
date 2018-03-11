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
                                    where (c.nrLicencia != "" && c.nrLicencia != "990" && c.nrLicencia != "900" && c.nrLicencia != "999")
                                    select c) ;
            return listadeRegistros.ToList().OrderBy(c => decimal.Parse(c.nrLicencia));
        }

        public  IEnumerable<TB_Proveedores> ObtenerTodosLosTitularesConGPS()
        {
            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog);
            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_Proveedores
                                    where c.flGPS == true
                                    select c);
            return listadeRegistros.ToList().OrderBy(c => decimal.Parse(c.nrLicencia));
        }

        public override IEnumerable<TB_Proveedores> ObtenerTodosLosRegistrosConExclusion(List<TB_Proveedores> lista_a_excluir)
        {
            //var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            //Trace.TraceInformation(paramLog);
            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_Proveedores
                                    where (c.nrLicencia != "" && c.nrLicencia != "990" && c.nrLicencia != "900" && c.nrLicencia != "999") && (!lista_a_excluir.Exists(x => x.cdProveedor == c.cdProveedor))
                                    select c);
            return listadeRegistros.ToList().OrderBy(c => decimal.Parse(c.nrLicencia));
        }


        public  IEnumerable<TB_Proveedores> ObtenerTodosLosRegistrosConExclusion(List<int> lista_a_excluir)
        {
            //var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            //Trace.TraceInformation(paramLog);
            // Falta agregar filtro de fechas
            var listadeRegistros = (from c in context.TB_Proveedores
                                    where (c.nrLicencia != "" && c.nrLicencia != "990" && c.nrLicencia != "900" && c.nrLicencia != "999") && (!lista_a_excluir.Contains(c.cdProveedor))
                                    select c);
            return listadeRegistros.ToList().OrderBy(c => decimal.Parse(c.nrLicencia));
        }


    }
}
