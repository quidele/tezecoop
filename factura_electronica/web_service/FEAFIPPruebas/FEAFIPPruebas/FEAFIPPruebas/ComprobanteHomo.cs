using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FEAFIPPruebas.wsfev1_homo;

namespace FEAFIPPruebas
{
    public class ComprobanteHomo : Comprobante ,  IComprobante
    {

        private Ticket _ticket;

        public ComprobanteHomo(Ticket ticket)
        {
            _ticket = ticket; 
        }

        public Comprobante ObtenerCompUltimoAutorizado()
        {
            return new Comprobante();
        }
    }
}
