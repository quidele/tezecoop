//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WCFWSFEAFIPTezecoop.DataModelFE
{
    using System;
    using System.Collections.Generic;
    
    public partial class detalle_tributos
    {
        public int idtabla { get; set; }
        public int idsolicitud { get; set; }
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public decimal BaseImp { get; set; }
        public decimal Alic { get; set; }
        public decimal Importe { get; set; }
    
        public virtual comprobantes_ml comprobantes_ml { get; set; }
    }
}