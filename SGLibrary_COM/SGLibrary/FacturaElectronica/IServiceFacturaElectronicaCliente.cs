using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace SGLibrary.FacturaElectronica
{
    [Guid("1576F668-63D9-483A-8CA3-260BDD350591")]
    public interface IServiceFacturaElectronicaCliente
    {
        [DispId(100)]
        bool SolicitarCAE(decimal IdSolicitud);

        [DispId(101)]
        string CAE();

        [DispId(102)]
        string CAEFchVto();

        [DispId(103)]
        string nro_doc_afip();
    }
}
