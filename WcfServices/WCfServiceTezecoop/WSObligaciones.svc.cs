using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SGLibrary.Services;

namespace WCfServiceTezecoop
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "WSObligaciones" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione WSObligaciones.svc o WSObligaciones.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class WSObligaciones : IWSObligaciones
    {
        public Obligaciones obtenerObligacionxId()
        {
            ServiceObligaciones una_ServiceObligaciones = new ServiceObligaciones(new SGLibrary.dbSG2000Entities());
            return una_ServiceObligaciones.ObtenerTodosLosRegistros().ToList().First<Obligaciones>();
        }
    }
}
