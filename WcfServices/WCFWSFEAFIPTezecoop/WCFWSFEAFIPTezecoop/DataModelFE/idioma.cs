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
    
    public partial class idioma
    {
        public idioma()
        {
            this.comprobante = new HashSet<comprobante>();
        }
    
        public int cod_idioma { get; set; }
        public string descripcion { get; set; }
        public string Codigo_magma { get; set; }
    
        public virtual ICollection<comprobante> comprobante { get; set; }
    }
}