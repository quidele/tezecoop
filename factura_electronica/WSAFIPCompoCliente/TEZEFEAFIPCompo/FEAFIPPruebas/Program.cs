using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using FEAFIPPruebas.wsfev1_prod; 

namespace FEAFIPPruebas
{
    class Program
    {
        // Valores por defecto, globales en esta clase 
        const string DEFAULT_URLWSAAWSDL = "https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL";
        const string DEFAULT_SERVICIO = "wsfe";
        const string DEFAULT_CERTSIGNER = "C:\\Users\\quidele\\Documents\\personal\\invoiceARG_2016\\Wsaa\\certiFEFONSECA.pfx";
        const bool DEFAULT_VERBOSE = true;

        /// <summary> 
        /// Funcion Main (consola) 
        /// </summary> 
        /// <param name="args">Argumentos de linea de comandos</param> 
        /// <returns>0 si terminó bien, valores negativos si hubieron errores</returns> 
        /// <remarks></remarks> 
        static int Main(string[] args)
        {

            Ticket unTicket = new TicketHomo(); 
            //TestDummy();
            //GetCertificatesInMyStore();

            unTicket.GetTicket();


            while (Console.ReadKey().KeyChar != '\r') { };
            return 0;
        }

        

       
    }
}
