using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public  class ArchivoTarjeta
    {
        List<string> _contenido;

        TB_ArchivoTarjeta _archivoTarjeta;
        String _nombreArchivo;

        public TB_ArchivoTarjeta miArchivoTarjeta
        {
            get { return (TB_ArchivoTarjeta)_archivoTarjeta; }
            set { _archivoTarjeta = value; }
        }


        public String NombreArchivo
        {
            get { return (String) _nombreArchivo ; }
        }


        public List<string> Contenido
        {
            get { return _contenido; }
        }
  
        public ArchivoTarjeta ()
	    {
            
	    }

        public void AbrirArchivo(string pNombreArchivo)
	    {
            // abrimos el archivo
            var reader = new StreamReader(File.OpenRead(pNombreArchivo));
            _nombreArchivo = Path.GetFileName(pNombreArchivo);

            _contenido = new List<string>(); 
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine()  ;
                _contenido.Add(line);
            }
            
	    }

        public virtual void procesarArchivo(String pdsUsuario)
        {
            throw new System.InvalidOperationException("El cliente debe implementar este metodo clase ArchivoTarjeta");
        }

    }
}
