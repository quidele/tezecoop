using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public  class ArchivoTarjeta
    {
        // List<string> _contenido;

        public ArchivoTarjeta ()
	    {

	    }

        public List<string> AbrirArchivo(string pNombreArchivo)
	    {
            // abrimos el archivo
            var reader = new StreamReader(File.OpenRead(pNombreArchivo));
            List<string> _contenido = new List<string>(); 
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                _contenido.Add(line);
            }
            return _contenido;
	    }

        public virtual  void procesarArchivo()
        {
            throw new System.InvalidOperationException("El cliente debe implmentar este metodo clase ArchivoTarjeta");
        }

    }
}
