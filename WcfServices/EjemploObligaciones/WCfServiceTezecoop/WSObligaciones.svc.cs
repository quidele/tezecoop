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
        public WSObligacion obtenerObligacionxId()
        {
            try
            {
                ServiceObligaciones una_ServiceObligaciones = new ServiceObligaciones(new SGLibrary.dbSG2000Entities());
                // Si todo va bien retornamos la entidad
                return new WSObligacion( new WSError(0,"OK",null) , una_ServiceObligaciones.ObtenerTodosLosRegistros().ToList().First<Obligaciones>());
            }
            catch (Exception ex)
            {
                return new WSObligacion(new WSError(1, ex.Message, ex.StackTrace.ToString()), null);
            }
 
            
            
            
        }

        public String Saludar(String nombre)
        {
            return "HOLA ESTIMADO: " + nombre; 
        }
    }
}
