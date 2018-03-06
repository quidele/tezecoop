using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class TB_ProveedoresExt : TB_Proveedores
    {
        public TB_ProveedoresExt(int pcdProveedor, string pnrLicencia ,string  pnmNombre , string pnmApellido )
        {
            this.cdProveedor = pcdProveedor;
            this.nrLicencia = pnrLicencia;
            this.nmNombre = pnmNombre;
            this.nmApellido = pnmApellido;

        }

        public TB_ObligacionesTitulares ToTB_ObligacionesTitulares(int pnro_trans) 
        {

            TB_ObligacionesTitulares aux = new TB_ObligacionesTitulares();
            aux.cod_tit = this.cdProveedor;
            aux.nrLicencia = this.nrLicencia;
            aux.nrTelefono = this.nrTel;

            return aux; 
        }

    }


}
