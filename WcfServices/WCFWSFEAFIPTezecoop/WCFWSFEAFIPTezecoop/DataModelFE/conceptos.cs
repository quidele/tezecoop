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
    
    public partial class conceptos
    {
        public conceptos()
        {
            this.comprobante = new HashSet<comprobante>();
            this.comprobantes_ml = new HashSet<comprobantes_ml>();
        }
    
        public int cod_concepto { get; set; }
        public string Descripción { get; set; }
        public string Codigo_magma { get; set; }
    
        public virtual ICollection<comprobante> comprobante { get; set; }
        public virtual ICollection<comprobantes_ml> comprobantes_ml { get; set; }
    }
}
