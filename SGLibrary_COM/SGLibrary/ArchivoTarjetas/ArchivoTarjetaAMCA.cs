using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;


namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaAMCA : ArchivoTarjeta , IArchivoConciliacion 
    {
        const int Cantidad_Columas = 11;



        ArchivoTarjeta _archivoTarjeta;
        String _formato;   

        public ArchivoTarjetaAMCA(ArchivoTarjeta  objArchivoTarjeta, String formato)
        {
            this._archivoTarjeta = objArchivoTarjeta;
            this._formato = formato; 
        }



        public override void  AbrirArchivo(string pNombreArchivo, string pUsuario)
        {
            this._archivoTarjeta.AbrirArchivo(pNombreArchivo, pUsuario );
            this._archivoTarjeta.miArchivoTarjeta.formato = this._formato;
            base.miArchivoTarjeta = this._archivoTarjeta.miArchivoTarjeta;
        }


        public override void ProcesarArchivo()
        {

            this._archivoTarjeta.ProcesarArchivo();
            this._archivoTarjeta.miArchivoTarjeta.formato = this._formato; 
            

            //throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }


    }
}
