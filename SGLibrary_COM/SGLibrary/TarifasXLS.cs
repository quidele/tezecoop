using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary
{
    public class TarifasXLS
    {
        public int Codigo { get; set; }
        public String Descripcion { get; set; }
        public Double Precio { get; set; }
        public Double Peaje { get; set; }
        public Double Total { get; set; }
        public Double Kilometros { get; set; }
        public bool Muestra_en_la_Web { get; set; }
        
    }

}
