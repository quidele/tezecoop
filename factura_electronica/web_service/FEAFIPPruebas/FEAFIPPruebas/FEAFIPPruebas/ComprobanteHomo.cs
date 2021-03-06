﻿using System;
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

        public   Comprobante ObtenerCompUltimoAutorizado()
        {

            FEAuthRequest feAuthRequest = new FEAuthRequest();
            // MIGRAR LA BUSQUEDA A LA CLASE COMPROBANTE
            feAuthRequest.Cuit = _ticket.Cuit;
            feAuthRequest.Sign = _ticket.Sign;
            feAuthRequest.Token = _ticket.Token;
            ServiceSoapClient client = new ServiceSoapClient();
            FERecuperaLastCbteResponse result = client.FECompUltimoAutorizado(feAuthRequest, 27, 1);
            Console.WriteLine(" ULTIMO COMPROBANTE PARA  EL PVTA 27 TIPO TIPO COMPROBANTE 1 - FACTURA ");
            Console.WriteLine(result.CbteNro);
            return new Comprobante();

        }
    }
}
