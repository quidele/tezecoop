using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using WCFWSFEAFIPTezecoop.DataModeldbSG2000;
using WCFWSFEAFIPTezecoop.DataModelFE;
using WCFWSFEAFIPTezecoop.DataModel;
using WCFWSFEAFIPTezecoop.Servicios; 

namespace WCFWSFEAFIPTezecoop
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ServiceFacturaElectronica" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione ServiceFacturaElectronica.svc o ServiceFacturaElectronica.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ServiceFacturaElectronica : IServiceFacturaElectronica
    {


        public void DoWork()
        {
            Console.WriteLine("Ha arribado un nuevo cliente");
            ServiceLog.Debug("DoWork", "Ha arribado un nuevo cliente", ""); 
        }

        

        ResultadoSolicitarCAE IServiceFacturaElectronica.SolicitarCAE(decimal IdSolicitud, string pAmbiente)
        {

            try
            {

                FacturaElectronicaEntities  una_FacturaElectronicaEntities;
                dbSG2000Entities una_dbSG2000Entities;
                dbSG2000_PruebasEntities una_dbSG2000_PruebasEntities;
                FacturaElectronica_PruebasEntities una_FacturaElectronica_PruebasEntities;
                

                switch (pAmbiente)
                {
                    case "SQL_Remoto":
                        una_dbSG2000Entities = new dbSG2000Entities();
                        una_FacturaElectronicaEntities = new FacturaElectronicaEntities();
                        var un_adaptarRepositorio = new AdaptaRepositorios(una_dbSG2000Entities, una_FacturaElectronicaEntities);
                        if (un_adaptarRepositorio.AdaptarComprobante(int.Parse(IdSolicitud.ToString())))
                        {
                            throw new Exception("Error al intentar Adaptar Formato BD Factura Electronica ");
                        }
                        break;
                    case "SQL_Remoto_Pruebas":
                        una_dbSG2000_PruebasEntities = new dbSG2000_PruebasEntities();
                        una_FacturaElectronica_PruebasEntities = new FacturaElectronica_PruebasEntities();
                        var un_adaptarRepositorio_Pruebas = new AdaptaRepositorios_Pruebas(una_dbSG2000_PruebasEntities, una_FacturaElectronica_PruebasEntities);
                        if ( un_adaptarRepositorio_Pruebas.AdaptarComprobante(int.Parse(IdSolicitud.ToString())))
                        {
                            throw new Exception("Error al intentar Adaptar Formato BD Factura Electronica ");
                        }
                        break;
                    default:
                        break;
                }

            

            
            /* 
             var un_cupon = context_dbSG2000Entities.TB_Cupones.Where(c => c.nrCupon == 1).ToList<TB_Cupones>(); 
             un_cupon = una_dbSG2000Generica.TB_Cupones.Where(c => c.nrCupon == 1 ).ToList<TB_Cupones>(); 
            */

            var resultado = new ResultadoSolicitarCAE();
            resultado.Resultado = "OK";
            resultado.CAE ="11111111111111";
            resultado.DocNro = "1";
            resultado.CAEFchVto = "20180724";

            resultado.CodigoError = "CodigoError";
            resultado.DescripcionError = "DescripcionError";

            return resultado;

            }
            catch (Exception ex )
            {
            
                var resultado = new ResultadoSolicitarCAE();
                resultado.Resultado = "ERROR";
                resultado.CodigoError = "CodigoError";
                resultado.DescripcionError = ex.Message ;
                return resultado;
            }
        }
    }
}
