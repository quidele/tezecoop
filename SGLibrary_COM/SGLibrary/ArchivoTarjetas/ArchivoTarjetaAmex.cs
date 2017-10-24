
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaAmex : ArchivoTarjeta 
    {
        const int Cantidad_Columas = 12;
        

        public override void AbrirArchivo(string pNombreArchivo, string pUsuario)
        {

            Trace.TraceInformation("inicia metodo: AbrirArchivo , parametro 1 " + pNombreArchivo);
            Trace.TraceInformation("procesa metodo: AbrirArchivo , OpenRead parametro 1 " + pNombreArchivo);
            // abrimos el archivo
            var reader = new StreamReader(File.OpenRead(pNombreArchivo));
            _nombreArchivo  = Path.GetFileName(pNombreArchivo);

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
            int posi = 1; 

            foreach (var item in this.Contenido)
            {

                try{

                    if  (item.IndexOf(',') > 0)   separador = ',';
                    if  (item.IndexOf(';') > 0)   separador = ';';

                    string[] columnas= item.Split(separador);
                    if ((columnas.Count() >= Cantidad_Columas) && (columnas[0].CompareTo("Fecha de la venta") != 0))
                    {
                        TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                        for (int i = 0; i < columnas.Count(); i++)
                        {
                            switch (i)
                            {
                                case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]).Date; break; // Fecha Presentacion
                                case 1:
                                    {   
                                        if (columnas[i].IndexOf (',')==-1)
                                            unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i].Replace(".", ""), CultureInfo.InvariantCulture); 
                                        else
                                            unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i].Replace(".", ""), CultureInfo.InvariantCulture) / 100; 

                                        break; // Importe
                                    }
                                case 2: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Comprobante
                                case 3: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Substring(11).Trim(); break;  // Tarjeta
                                case 5: break;
                                case 6: break;
                                case 7: break; 
                                case 8: break;
                                case 9: break;  
                                case 10:  break;  
                                default:
                                    break;
                            }/*
                                0	Fecha de la venta
                                1	Importe
                                2	NÃºmero de referencia de cargo
                                3	NÃºmero de Tarjeta
                                4	NÃºmero de Establecimiento de la sucursal
                                5	NÃºmero del Establecimiento
                                6	Tipo
                                7	NÃºmero de boleto de aerolÃ­nea
                                8	NÃºmero de acuerdo de alquiler
                                9	Motivo de rechazo
                                10	NÃºmero de Terminal
                                11	NÃºmero de referencia */

                        }
                        unTB_ArchivoTarjetaDetalle.contenido = item;
                       this.miArchivoTarjeta.TB_ArchivoTarjetaDetalle.Add(unTB_ArchivoTarjetaDetalle);
                    } // Cierra el IF
              
                }
                catch (Exception)
                {
                    Trace.TraceInformation("Linea" + posi.ToString() + " - No procesada, Contenido: " + item.ToString());
                }
                posi++;

            } //cierra el for

            this.miArchivoTarjeta.formato = "Amex";

            //throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
