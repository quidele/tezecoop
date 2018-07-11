using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using FEAFIPPruebas.wsfev1_prod ; 

namespace FEAFIPPruebas
{
    /// <summary> 
    /// Clase principal 
    /// </summary> 
    /// <remarks></remarks> 
    public class TicketProd : Ticket 
    {


        /* C = ar
           O = curtiembre fonseca s.a.
           SERIALNUMBER = CUIT 30559697857
           CN = ricardo badano
         */

        // Valores por defecto, globales en esta clase 
        //public const string DEFAULT_URLWSAAWSDL = "https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL";
        public const string DEFAULT_SERVICIO = "wsfe";
        public const string DEFAULT_CERTSIGNERSUBJECT = @"C=ar, O=curtiembre fonseca s.a., SERIALNUMBER=CUIT 30559697857, CN=ricardo badano";

        /// <summary> 
        /// Funcion Main (consola) 
        /// </summary> 
        /// <param name="args">Argumentos de linea de comandos</param> 
        /// <returns>0 si terminó bien, valores negativos si hubieron errores</returns> 
        /// <remarks></remarks> 

        public override void GetTicket()
        {
            //string certSigner = @"C:\Diego\Proyectos\FacturaElect\Afip - Ejemplos Codigo\FeCertificadoDesarrollo\certificadoAFIP.crt";
            ILoginCMSClient unLoginCMSClientProd = (ILoginCMSClient)new LoginCMSClientProd();

            LoginTicket loginTicket = new LoginTicket(unLoginCMSClientProd);
            string ticketReponse = loginTicket.ObtenerLoginTicketResponse( DEFAULT_SERVICIO, DEFAULT_CERTSIGNERSUBJECT, false, StoreName.TrustedPeople, StoreLocation.CurrentUser);

            Console.WriteLine(loginTicket.Token);
            FEAuthRequest feAuthRequest = new FEAuthRequest();

            string cuit = "30559697857";
            this.Cuit = Convert.ToInt64(cuit);
            this.Sign = loginTicket.Sign;
            this.Token = loginTicket.Token;

            // MIGRAR LA BUSQUEDA A LA CLASE COMPROBANTE
            /*feAuthRequest.Cuit = Convert.ToInt64(cuit);
            feAuthRequest.Sign = loginTicket.Sign;
            feAuthRequest.Token = loginTicket.Token;

            ServiceSoapClient client = new ServiceSoapClient();

            FERecuperaLastCbteResponse result = client.FECompUltimoAutorizado(feAuthRequest, 27, 1);

            Console.WriteLine(" ULTIMO COMPROBANTE PARA  EL PVTA 27 TIPO TIPO COMPROBANTE 1 - FACTURA ");
            Console.WriteLine(result.CbteNro);*/

            IComprobante unComprobante = new ComprobanteProd(this);
            unComprobante.ObtenerCompUltimoAutorizado();

            /* 
             * 
            string cuit = "30559697857";
            FEAuthRequest feAuthRequest = new FEAuthRequest();
            feAuthRequest.Cuit = Convert.ToInt64(cuit);
            feAuthRequest.Sign = loginTicket.Sign;
            feAuthRequest.Token = loginTicket.Token;*/

        }

    }
}
