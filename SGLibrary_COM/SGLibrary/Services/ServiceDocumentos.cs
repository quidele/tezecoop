using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class ServiceDocumentos : ServiceModelGenerico<TB_documentos>
    {
        
        public override  IEnumerable<TB_documentos> ObtenerTodosLosRegistros()
        {
            using (var context = new dbSG2000Entities())
            {
                // Falta agregar filtro de fechas
                var listadeRegistros = (from c in context.TB_documentos
                                                orderby c.cod_doc ascending 
                                                select c );
                return listadeRegistros.ToList();
            }
        } // Fin ObtenerTodosLosRegistros 


    }
}
