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
    
    public partial class permisodestino
    {
        public int idsolicitud { get; set; }
        public string permisoemb { get; set; }
        public int destino { get; set; }
    
        public virtual comprobante comprobante { get; set; }
        public virtual destinos destinos { get; set; }
    }
}