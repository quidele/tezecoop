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
    
    public partial class detalle
    {
        public long idItem { get; set; }
        public int idsolicitud { get; set; }
        public string cod { get; set; }
        public string desc { get; set; }
        public Nullable<decimal> unimed { get; set; }
        public Nullable<decimal> cant { get; set; }
        public Nullable<decimal> preciounit { get; set; }
        public Nullable<decimal> importe { get; set; }
    
        public virtual comprobante comprobante { get; set; }
        public virtual unidad_medida unidad_medida { get; set; }
    }
}