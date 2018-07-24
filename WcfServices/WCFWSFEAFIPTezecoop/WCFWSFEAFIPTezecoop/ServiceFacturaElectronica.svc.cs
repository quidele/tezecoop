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
            Console.WriteLine("Ha arribado un nuevo cliente");
        }



        ResultadoSolicitarCAE IServiceFacturaElectronica.SolicitarCAE(decimal IdSolicitud)
        {
            // el objeto un_comprobante_ml dbera ser adaptado a la estructura de WEBServer AFIP 
            // throw new NotImplementedException();
            
            // grabar modelo decimal datos

            //using (var context = new FacturaElectronicaEntities())
            //{
                /* var un_comprobantes_ml_BD = context.comprobantes_ml.Find(un_comprobante_ml.idsolicitud);
                if (un_comprobantes_ml_BD == null) 
                    context.comprobantes_ml.Add(un_comprobante_ml);
                else */

                //context.comprobantes_ml.Add(new comprobantes_ml());
                //context.SaveChanges();
            //}

            var resultado = new ResultadoSolicitarCAE();
            resultado.Resultado = "OK";
            resultado.CAE ="11111111111111";
            resultado.DocNro = "1";
            resultado.CAEFchVto = "20180724";

            return resultado;
        }
    }
}
