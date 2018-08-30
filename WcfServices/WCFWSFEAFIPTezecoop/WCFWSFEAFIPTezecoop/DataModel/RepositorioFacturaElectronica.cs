using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using WCFWSFEAFIPTezecoop.DataModelFE;

namespace WCFWSFEAFIPTezecoop.DataModel
{
    public class RepositorioFacturaElectronica
    {

        private FacturaElectronicaEntities _repoFE;

        public RepositorioFacturaElectronica(FacturaElectronicaEntities pContext)
        {
            _repoFE = pContext;
        }

        public bool EsSolicitudEnviada(decimal pIdSolicitud ){

            var un_comprobantes_ml = _repoFE.comprobantes_ml.Where(c => c.idsolicitud == pIdSolicitud).ToList<comprobantes_ml>().FirstOrDefault<comprobantes_ml>();
            if (un_comprobantes_ml == null) return false;
            if ((un_comprobantes_ml.nro_doc_afip == 0) || (un_comprobantes_ml.nro_doc_afip == null)) return false;

            return true;  // es una solicitus enviada

        }


        public comprobantes_ml ObtenerDatosSolicitudEnviada(decimal pIdSolicitud)
        {
            return _repoFE.comprobantes_ml.Where(c => c.idsolicitud == pIdSolicitud).ToList<comprobantes_ml>().First<comprobantes_ml>();
        }

        public bool EliminarSolicitudEnviadaFallida(decimal pIdSolicitud)
        {

            using (TransactionScope transaction = new TransactionScope())
            {
                var una_comprobantes_mlBD =  _repoFE.comprobantes_ml.Where(c => c.idsolicitud == pIdSolicitud).ToList<comprobantes_ml>().First<comprobantes_ml>();
                var un_detalle_iva = _repoFE.detalle_iva.Where(c => c.idsolicitud == pIdSolicitud).ToList<detalle_iva>().First<detalle_iva>();
                this._repoFE.comprobantes_ml.Remove(una_comprobantes_mlBD);
                this._repoFE.detalle_iva.Remove (un_detalle_iva);
                this._repoFE.SaveChanges();
                transaction.Complete();
                return true;
            }
            
        }
    }
}