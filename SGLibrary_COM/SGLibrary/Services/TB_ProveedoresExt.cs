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



    }


}
