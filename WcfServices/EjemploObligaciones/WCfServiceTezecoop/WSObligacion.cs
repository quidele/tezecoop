using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SGLibrary.Services;
using System.ServiceModel;
using System.Runtime.Serialization;

namespace WCfServiceTezecoop
{
    [DataContractAttribute]
    public class WSObligacion
    {

        [DataMember]
        public Obligaciones Obligacion { get; set; }

        [DataMember]
        public WSError Error { get; set; }

        public WSObligacion(WSError pWSError, Obligaciones pObligacion)
        {
            this.Error = pWSError;
            this.Obligacion = pObligacion;
        }

        public WSObligacion()
        {
            this.Error = null;
            this.Obligacion = null;
        }
    }
}