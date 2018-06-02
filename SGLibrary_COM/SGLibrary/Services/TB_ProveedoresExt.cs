using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class TB_ProveedoresExt : TB_Proveedores
    {

        public string estado_registro { get; set; }

        public TB_ProveedoresExt(int pcdProveedor, string pnrLicencia ,string  pnmNombre , string pnmApellido , string pestado_registro )
        {
            this.cdProveedor = pcdProveedor;
            this.nrLicencia = pnrLicencia;
            this.nmNombre = pnmNombre;
            this.nmApellido = pnmApellido;
            this.estado_registro = pestado_registro; 
            

        }

        public TB_ObligacionesTitulares ToTB_ObligacionesTitulares(int pnro_trans) 
        {

            TB_ObligacionesTitulares aux = new TB_ObligacionesTitulares();
            aux.cod_tit = this.cdProveedor;
            aux.nrLicencia = int.Parse( this.nrLicencia);
            aux.nrTelefono = this.nrTel;
            aux.nmNombre = this.nmNombre;
            aux.nmApellido = this.nmApellido;
            aux.nro_trans = pnro_trans;
            aux.estado_registro = this.estado_registro; 
            return aux; 
        }

    }


}
