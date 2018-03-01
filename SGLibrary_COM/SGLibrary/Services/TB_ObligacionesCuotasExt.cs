using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class TB_ObligacionesCuotasExt : TB_ObligacionesCuotas
    {
        public TB_ObligacionesCuotasExt()
        {

        }

        public TB_ObligacionesCuotasExt(int p_nro_trans , int p_cod_tit, int  p_nro_cuota , 
                                        DateTime p_fecha_vencimiento , decimal p_importe, 
                                        string p_nrLicencia, string p_comentarios )
        {
            this.nro_trans = p_nro_trans; 
            this.cod_tit = p_cod_tit; 
            this.nro_cuota = p_nro_cuota; 
            this.fecha_vencimiento = p_fecha_vencimiento; 
            this.importe = p_importe; 
            this.nrLicencia = p_nrLicencia;
            this.comentarios = p_comentarios;
        }
    }
}
