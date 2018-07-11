using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.Runtime.Serialization;

namespace WCfServiceTezecoop
{
    [DataContractAttribute]
    public class WSError 
    {

        [DataMember]
        public int NroError { get; set; }
        [DataMember]
        public String Mensaje { get; set; }
        [DataMember]
        public String MensajeExtendido { get; set; }

        public WSError(int pNroError, String pMensaje, String pMensageExtendido)
        {
            this.NroError = pNroError;
            this.Mensaje = pMensaje;
            this.MensajeExtendido = pMensageExtendido;
                
        }

        public WSError()
        {
            this.NroError = 0;
            this.Mensaje = "";
            this.MensajeExtendido = "";

        }
    }
}
