using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ArchivoTarjetas
{
    public class ColumnaArchivoTarjeta
    {

        public ColumnaArchivoTarjeta(String nombreColumnaArchivoTarjeta , int indice )
        {
            _nombreColumnaArchivoTarjeta = nombreColumnaArchivoTarjeta;
            _indiceArchivoTarjeta = indice; 
        }
        

        private int _indiceArchivoTarjeta;

        public int IndiceArchivoTarjeta
        {
            get { return _indiceArchivoTarjeta; }
            set { _indiceArchivoTarjeta = value; }
        }
        



        private String _nombreColumnaArchivoTarjeta="";

	    public String NombreColumnaArchivoTarjeta
	    {
		    get { return _nombreColumnaArchivoTarjeta;}
		    set { _nombreColumnaArchivoTarjeta = value;}
	    }
	

        public override String ToString()
        {
            return _nombreColumnaArchivoTarjeta;
        }
        

    }




}
