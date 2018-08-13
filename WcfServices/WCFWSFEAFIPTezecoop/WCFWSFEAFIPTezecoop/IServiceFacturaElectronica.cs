using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WCFWSFEAFIPTezecoop
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IServiceFacturaElectronica" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IServiceFacturaElectronica
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        ResultadoSolicitarCAE SolicitarCAE(decimal pIdSolicitud,string pAmbiente);
        

    }
}
