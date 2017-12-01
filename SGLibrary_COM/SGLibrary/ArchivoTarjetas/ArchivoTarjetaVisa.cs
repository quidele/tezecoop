
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;

namespace SGLibrary.ArchivoTarjetas
{
    public class ArchivoTarjetaVisa : ArchivoTarjeta 
    {
        const int Cantidad_Columas = 11;


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
            int  posi=1;

            var paramLog = new SGLibrary.Utility.ParamLogUtility().GetLog();
            Trace.TraceInformation(paramLog); 

            foreach (var item in this.Contenido)
            {
                try
                {
                    if  (item.IndexOf(',') > 0)   separador = ',';
                    if  (item.IndexOf(';') > 0)   separador = ';';
                    string[] columnas= item.Split(separador);

                    if (columnas.Count() != 11){
                        Console.WriteLine("ESTA LINEA NO ES DE 11 ");
                    }

                    if ((columnas.Count() >= Cantidad_Columas) && (columnas[0].CompareTo("Fecha Presentacion")!=0))
                    {
                        TB_ArchivoTarjetaDetalle unTB_ArchivoTarjetaDetalle = new TB_ArchivoTarjetaDetalle();
                        for (int i = 0; i < columnas.Count(); i++)
                        {
                            switch (i)
                            {
                                case 0: unTB_ArchivoTarjetaDetalle.fechaPresentacion = DateTime.Parse(columnas[i]).Date; break; // Fecha Presentacion
                                case 1: break; // Lote
                                case 2: unTB_ArchivoTarjetaDetalle.fechaPago = DateTime.Parse(columnas[i]).Date; break; // Fecha Pago
                                case 3: break; // Descripcion
                                case 5: unTB_ArchivoTarjetaDetalle.comprobante = columnas[i]; break; // Comprobante
                                case 6: unTB_ArchivoTarjetaDetalle.tarjeta = columnas[i].Replace('X',' ').Trim(); break;  // Tarjeta
                                case 7: break; // Plan
                                case 8: break; // Cuota
                                case 9: unTB_ArchivoTarjetaDetalle.moneda = columnas[i].Replace("pesos", "PES").Trim(); break;  // Moneda
                                case 10:
                                    {
                                        columnas[i] = columnas[i].Trim();
                                        if (columnas[i].Substring (columnas[i].Length - 3)==".00")
                                            columnas[i] = columnas[i].Remove(columnas[i].Length - 3);

                                        
                                        
                                        if (columnas[i].IndexOf(".") == 0)  // si tiene un punto
                                        {   // dividimos el valor resultante por 100
                                            unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i].Replace(".", ""), CultureInfo.InvariantCulture) / 100;
                                        }
                                        else
                                        {   // no dividimos el valor resultante por 100
                                            unTB_ArchivoTarjetaDetalle.importe = Decimal.Parse(columnas[i], CultureInfo.InvariantCulture);
                                        }
                                        break;  // Importe
                                    }
                                default:
                                    break;
                            }
                        }
                        unTB_ArchivoTarjetaDetalle.contenido = item;
                       this.miArchivoTarjeta.TB_ArchivoTarjetaDetalle.Add(unTB_ArchivoTarjetaDetalle);
                    } // Cierre if  columnas.Count()> = Cantidad_Columas
                    
                }
                catch (Exception)
                {
                    Trace.TraceInformation("Linea" + posi.ToString() + " - No procesada, Contenido: " + item.ToString());
                }
                posi++;
            }

            this.miArchivoTarjeta.formato = "Visa";
            //throw new System.InvalidOperationException("Debe implementar este metodo clase ArchivoTarjeta");    
        }

    }
}
