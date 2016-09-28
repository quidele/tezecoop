using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class TB_ConciliacionDetalleEx : TB_ConciliacionDetalle
    {

        private DateTime _dtCupon;

        public DateTime dtCupon
        {
            get { return _dtCupon; }
            set { _dtCupon = value; }
        }

        private DateTime _fechaPagoLicenciatario;

        public DateTime FechaPagoLicenciatario
        {
            get { return _fechaPagoLicenciatario; }
            set { _fechaPagoLicenciatario = value; }
        }



        public TB_ConciliacionDetalle ToTB_ConciliacionDetalle()
        {
            var un_TB_ConciliacionDetalle =  new TB_ConciliacionDetalle();
            un_TB_ConciliacionDetalle.IdArchivoTarjetaDetalle =  this.IdArchivoTarjetaDetalle;
            un_TB_ConciliacionDetalle.nrCupon = this.nrCupon;
            un_TB_ConciliacionDetalle.fechaPago = this.fechaPago;
            un_TB_ConciliacionDetalle.IdConciliacion = this.IdConciliacion;
            return un_TB_ConciliacionDetalle;
        }

        
    }
}

