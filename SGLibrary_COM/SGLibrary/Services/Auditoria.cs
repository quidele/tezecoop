using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class Auditoria
    {

        public String usuario_mod { get; set; }
        public DateTime fecha_mod { get; set; }
        public String terminal_mod { get; set; }
        public String operacion_mod { get; set; }
        public String estado_registro { get; set; }
        public String formulario { get; set; }
        public String seccion { get; set; }
        public String bloque { get; set; }
        public int linea { get; set; }

    }
}
