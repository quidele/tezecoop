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
    
    public partial class unidad_medida
    {
        public unidad_medida()
        {
            this.detalle = new HashSet<detalle>();
        }
    
        public decimal cod_unidad_medida { get; set; }
        public string Descripción { get; set; }
        public string Codigo_magma { get; set; }
    
        public virtual ICollection<detalle> detalle { get; set; }
    }
}