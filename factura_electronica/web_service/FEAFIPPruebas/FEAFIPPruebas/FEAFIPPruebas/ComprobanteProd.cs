using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace FEAFIPPruebas
{
    public class ComprobanteProd : Comprobante, IComprobante
    {

        private Ticket _ticket;

        public ComprobanteProd(Ticket ticket)
        {
            _ticket = ticket; 
        }

        public Comprobante ObtenerCompUltimoAutorizado()
        {
            return new Comprobante();
        }
    }
}
