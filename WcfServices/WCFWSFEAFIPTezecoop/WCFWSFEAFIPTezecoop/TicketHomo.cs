using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using WCFWSFEAFIPTezecoop.wsfev1_homo;

namespace WCFWSFEAFIPTezecoop
{
    /// <summary> 
    /// Clase principal 
    /// </summary> 
    /// <remarks></remarks> 
    public class TicketHomo : Ticket
    {

        // Valores por defecto, globales en esta clase 
        //public const string DEFAULT_URLWSAAWSDL = "https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL";
        public const string DEFAULT_SERVICIO = "wsfe";
        public const string DEFAULT_CERTSIGNERSUBJECT = @"C=AR, O=Curtiembres Fonseca S.A., SERIALNUMBER=CUIT 30559697857, CN=Eulises Quidel";

        

        /// <summary> 
        /// Funcion Main (consola) 
        /// </summary> 
        /// <param name="args">Argumentos de linea de comandos</param> 
        /// <returns>0 si terminó bien, valores negativos si hubieron errores</returns> 
        /// <remarks></remarks> 

        public override void GetTicket()
        {
            //string certSigner = @"C:\Diego\Proyectos\FacturaElect\Afip - Ejemplos Codigo\FeCertificadoDesarrollo\certificadoAFIP.crt";
            ILoginCMSClient unLoginCMSClientProd = (ILoginCMSClient)new LoginCMSClientHomo();

            LoginTicket loginTicket = new LoginTicket(unLoginCMSClientProd);
            string ticketReponse = loginTicket.ObtenerLoginTicketResponse(DEFAULT_SERVICIO, DEFAULT_CERTSIGNERSUBJECT, false, StoreName.TrustedPeople, StoreLocation.CurrentUser);

            Console.WriteLine(loginTicket.Token);
            FEAuthRequest feAuthRequest = new FEAuthRequest();

            string cuit = "30559697857";
            this.Cuit = Convert.ToInt64(cuit);
            this.Sign = loginTicket.Sign;
            this.Token = loginTicket.Token;

            // MIGRAR LA BUSQUEDA A LA CLASE COMPROBANTE

           
            IComprobante unComprobante = new ComprobanteHomo(this);
            unComprobante.ObtenerCompUltimoAutorizado();

            /* 
             * 
            string cuit = "30559697857";
            FEAuthRequest feAuthRequest = new FEAuthRequest();
            feAuthRequest.Cuit = Convert.ToInt64(cuit);
            feAuthRequest.Sign = loginTicket.Sign;
            feAuthRequest.Token = loginTicket.Token;
             */

        }

    }
}
