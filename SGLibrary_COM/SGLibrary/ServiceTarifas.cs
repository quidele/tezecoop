using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace SGLibrary
{


    [Guid("444FA977-AA64-4A43-9576-163C5B0E2EA5")]
    public interface Tarifas_Interface
    {
        [DispId(40)]
        void cargarTarifas();
    }

    public class ServiceTarifas : Tarifas_Interface
    {

            public void  cargarTarifas ()
            {

                try
                {
                    var f = new FrmCargaTarifas();
                    f.ShowDialog();
                }
                catch (Exception ex)
                {
                    System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
                }
                
            }


            public void ActualizarTarifas(List<TB_Productos> listaTarifas)
            {

                using (var context = new dbSG2000Entities())
                {

                    foreach (TB_Productos p in listaTarifas)
                    {

                        // realizar busqueda
                        var viajedestino = (from c in context.TB_Productos where c.cdProducto == p.cdProducto select c).First();
                        viajedestino.vlPrecioViaje = p.vlPrecioViaje;
                        viajedestino.vlPrecioViajeSinPeaje = p.vlPrecioViajeSinPeaje;
                        viajedestino.vlPrecioPeaje = p.vlPrecioPeaje ;
                        Console.WriteLine(p.cdProducto + " - " + p.dsProducto + " -  " + p.vlPrecioViaje.ToString() + p.flMuestraenlaWEB);
                        //break;

                    }

                    context.SaveChanges();
                }



            }


            public void ActualizarTarifas(List<TarifasXLS> listaTarifas)
            {

                using (var context = new dbSG2000Entities())
                {

                    foreach (TarifasXLS p in listaTarifas)
                    {
                        // realizar busqueda
                        var viajedestino = (from c in context.TB_Productos where c.cdProducto == p.Codigo  select c).First();
                        viajedestino.vlPrecioViajeSinPeaje = p.Precio;
                        viajedestino.vlPrecioPeaje = p.Peaje ;
                        viajedestino.vlPrecioViaje = p.Total;
                        viajedestino.vlKilometros = p.Kilometros;
                        viajedestino.flMuestraenlaWEB  = p.Muestra_en_la_Web;
                        Console.WriteLine(viajedestino.cdProducto + " - " + viajedestino.dsProducto + " -  " + viajedestino.vlPrecioViaje.ToString() + viajedestino.flMuestraenlaWEB);
                        //break;
                    }
                    context.SaveChanges();
                }



            }

    }
}
