

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaMaster : ArchivoTarjeta 
    {

        const int Cantidad_Columas = 12;



        public override void AbrirArchivo(string pNombreArchivo, string pUsuario)
        {

            Trace.TraceInformation("inicia metodo: AbrirArchivo , parametro 1 " + pNombreArchivo);
            Trace.TraceInformation("procesa metodo: AbrirArchivo , OpenRead parametro 1 " + pNombreArchivo);
            // abrimos el archivo
            var reader = new StreamReader(File.OpenRead(pNombreArchivo));
            _nombreArchivo = Path.GetFileName(pNombreArchivo);

            _contenido = new List<string>();
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                _contenido.Add(line);
            }

            Trace.TraceInformation("procesa metodo: AbrirArchivo ,  new TB_ArchivoTarjeta ");

            this._archivoTarjeta = new TB_ArchivoTarjeta();
            _archivoTarjeta.dsUsuario = pUsuario; // El usuario debera completar este dato desde afuera
            _archivoTarjeta.dtproceso = DateTime.Now;
            _archivoTarjeta.nombrearchivo = this.NombreArchivo;
            _archivoTarjeta.nombreArchivoCompleto = pNombreArchivo;
            //this._listaArchivoTarjetaDetalle = new List<TB_ArchivoTarjetaDetalle>();

        }


        public  override void ProcesarArchivo()
        {
            char separador ='\0';

            foreach (var item in this.Contenido)
            {


                if  (item.IndexOf(',') > 0)   separador = ',';
                if  (item.IndexOf(';') > 0)   separador = ';';

                string[] columnas= item.Split(separador);
                if ((columnas.Count() == Cantidad_Columas) && (columnas[0].CompareTo("Comercio")!=0))
                {
                    TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                    for (int i = 0; i < columnas.Count(); i++)
                    {
                        switch (i)
                        {
                            case 0: break; // Comercio
                            case 1: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]).Date; break; // Fecha Presentaci�n
                            case 2: break; // Tipo Movimiento
                            case 3: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X', ' ').Trim(); break; // Tarjeta (4 �lt. Dig.)
                            case 4: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Nro. Cup�n
                            case 5: break;  // Marca
                            case 6: unTB_ArchivoTarjetaDetalle.moneda = columnas[i].Replace("$", "PES").Trim();  break; // Moneda
                            case 7: unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i], CultureInfo.InvariantCulture);  break; // Imp. Bruto
                            case 8: break; // Dto. Arancel
                            case 9: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]).Date;  break;  // Fecha Pago
                            case 10: break;  // Fecha Pago
                            default:
                                break;
                        }
                    }
                    unTB_ArchivoTarjetaDetalle.contenido = item;
                    this.miArchivoTarjeta.TB_ArchivoTarjetaDetalle.Add(unTB_ArchivoTarjetaDetalle);
                    
                }

                this.miArchivoTarjeta.formato = "Master";
            }

            //throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
