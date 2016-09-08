using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Diagnostics;

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

        public void AbrirArchivo(string pNombreArchivo, string  pUsuario)
	    {

            Trace.TraceInformation("inicia metodo: AbrirArchivo , parametro 1 " + pNombreArchivo );
            Trace.TraceInformation("procesa metodo: AbrirArchivo , OpenRead parametro 1 " + pNombreArchivo);
            // abrimos el archivo
            var reader = new StreamReader(File.OpenRead(pNombreArchivo));
            _nombreArchivo = Path.GetFileName(pNombreArchivo);

            _contenido = new List<string>(); 
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine()  ;
                _contenido.Add(line);
            }

            Trace.TraceInformation("procesa metodo: AbrirArchivo ,  new TB_ArchivoTarjeta " );

            this._archivoTarjeta = new TB_ArchivoTarjeta();
            _archivoTarjeta.dsUsuario = pUsuario; // El usuario debera completar este dato desde afuera
            _archivoTarjeta.formato = "VISA";
            _archivoTarjeta.dtproceso = DateTime.Now;
            _archivoTarjeta.nombrearchivo = this.NombreArchivo;

            //this._listaArchivoTarjetaDetalle = new List<TB_ArchivoTarjetaDetalle>();
            
	    }

        public virtual void ProcesarArchivo()
        {
            throw new System.InvalidOperationException("El cliente debe implementar este metodo clase ArchivoTarjeta");
        }

    }
}
