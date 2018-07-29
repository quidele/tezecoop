using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WCFWSFEAFIPTezecoop.DataModeldbSG2000;
using WCFWSFEAFIPTezecoop.DataModelFE; 

namespace WCFWSFEAFIPTezecoop.DataModel
{
    public class Repositorio
    {

        public string DescripcionError { get; set; }

        public bool AdaptarComprobante(dbSG2000Entities pContextOrigen  ,  FacturaElectronicaEntities pContextDestino, decimal pIdSolicitud){

            // recuperamos la cabecera del comprobante
            var un_TB_Comprobantes = (from c in pContextOrigen.TB_Comprobantes
                                      where c.nro_trans == pIdSolicitud  select c).First<TB_Comprobantes>();

            if (un_TB_Comprobantes == null)
            {
                DescripcionError = "El comprobante origen no existe";
                return false;
            }




            return true; 
        }




    }
}