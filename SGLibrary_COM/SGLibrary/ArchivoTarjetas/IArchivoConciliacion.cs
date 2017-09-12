using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public interface IArchivoConciliacion
    {
        void AbrirArchivo(string aa, string bb); 
        void ProcesarArchivo();         

    }
}
