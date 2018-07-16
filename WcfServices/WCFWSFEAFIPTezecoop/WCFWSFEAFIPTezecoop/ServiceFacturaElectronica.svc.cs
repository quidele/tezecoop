using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WCFWSFEAFIPTezecoop
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ServiceFacturaElectronica" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione ServiceFacturaElectronica.svc o ServiceFacturaElectronica.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ServiceFacturaElectronica : IServiceFacturaElectronica
    {
        public void DoWork()
        {
        }



        ResultadoSolicitarCAE IServiceFacturaElectronica.SolicitarCAE(comprobantes_ml un_comprobante_ml)
        {
            // el objeto un_comprobante_ml dbera ser adaptado a la estructura de WEBServer AFIP 
            // throw new NotImplementedException();
            return new ResultadoSolicitarCAE();
        }
    }
}
