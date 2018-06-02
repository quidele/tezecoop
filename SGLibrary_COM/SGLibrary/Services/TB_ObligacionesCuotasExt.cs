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
                                        int p_nrLicencia, string p_comentarios , string p_estado_registro )
        {
            this.nro_trans = p_nro_trans; 
            this.cod_tit = p_cod_tit; 
            this.nro_cuota = p_nro_cuota; 
            this.fecha_vencimiento = p_fecha_vencimiento; 
            this.importe = p_importe; 
            this.nrLicencia = p_nrLicencia;
            this.comentarios = p_comentarios;
            this.estado_registro = p_estado_registro;
        }


        public TB_ObligacionesCuotas ToTB_ObligacionesCuotas(int pnro_trans)
        {
            TB_ObligacionesCuotas aux = new TB_ObligacionesCuotas();

            aux.nro_trans = pnro_trans ;
            aux.cod_tit = this.cod_tit;
            aux.nro_cuota = this.nro_cuota;
            aux.fecha_vencimiento = this.fecha_vencimiento;
            aux.importe = this.importe;
            aux.nrLicencia = this.nrLicencia;
            aux.comentarios = this.comentarios;
            aux.estado_registro = this.estado_registro; 
            return aux; 
        }
    }
}
