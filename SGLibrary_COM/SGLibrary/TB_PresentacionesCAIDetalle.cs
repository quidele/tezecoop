//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGLibrary
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_PresentacionesCAIDetalle
    {
        public int Id { get; set; }
        public int IdPresentacion { get; set; }
        public string nrCAI { get; set; }
        public string PDV { get; set; }
        public string Letra { get; set; }
        public Nullable<int> nrUltNroComprobante { get; set; }
        public Nullable<System.DateTime> dtInsercion { get; set; }
    
        public virtual TB_PresentacionesCAI TB_PresentacionesCAI { get; set; }
    }
}
