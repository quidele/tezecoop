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
    
    public partial class plantillas_excel_detalle
    {
        public int id { get; set; }
        public int idplantilla { get; set; }
        public int fila { get; set; }
        public int columna { get; set; }
        public string tipo_detalle { get; set; }
        public string nombre { get; set; }
        public string valor { get; set; }
    
        public virtual plantillas_excel plantillas_excel { get; set; }
    }
}
