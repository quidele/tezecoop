using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SGLibrary.Services;

namespace WCfServiceTezecoop
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IWSObligaciones" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IWSObligaciones
    {

        [OperationContract]
        Obligaciones obtenerObligacionxId();

        [OperationContract]
        String Saludar(String nombre);
    }
}
