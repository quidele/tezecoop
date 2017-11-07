using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGLibrary;
using System.Management;
using System.Windows;
using System.Diagnostics;
using SGLibrary.ArchivoTarjetas; 


namespace ConsoleApplication1
{
    class Program
    {

        [STAThread]
        static void Main(string[] args)
        {


           

            /*DBCOM_Class service = new DBCOM_Class();
            service.Init(); 
             **/

            /*
            Console.WriteLine(" AMBIENTE PC  64 BITS : " + Environment.Is64BitOperatingSystem.ToString()); 
            ServiceDestinos service = new ServiceDestinos();
            Console.WriteLine(service.Inicializar());
            Console.ReadKey(); 
            */

            /**
            ServicePrinter service = new ServicePrinter();
            Console.WriteLine(service.ConfigPrinter("impresión de factura"));
            Console.ReadKey();
            service.RollbackPrinter();
            Console.WriteLine("RollbackPrinter realizado");
            Console.ReadKey();
            **/

            /*
             * *
                 ServiceDestinos service = new ServiceDestinos();
                 Console.WriteLine(service.Inicializar());
                 Console.ReadKey(); 
             */    

            /* 
             * 
            ServiceTarifas miServiceTarifas = new ServiceTarifas();
            miServiceTarifas.cargarTarifas();
            Console.ReadKey(); 
             */

            /* ServiceExcel miExcel = new ServiceExcel();
            // ServiceExcel.InitializeExcel ();
            miExcel.InitializeExcel(); 
            miExcel.ReadMyExcel ();
            miExcel.CerrarExcel();
            Console.ReadKey(); 
             */
            
            
           /* service.
            C:\\Users\\quidele\\Documents\\personal\\tezecoop\\Importador_Excel\\plantilla_ref.xls
            */

            /*
             * PARA INCIDENTES   DE CONCILIACION
            Trace.TraceInformation("Logger EULISES 1sdsd ");
            ServiceConciliacion objConciliacion = new ServiceConciliacion();
            objConciliacion.UsuarioActivo("camilap");
            objConciliacion.CajaActiva("1");
            objConciliacion.execFormulario(); 
            Trace.TraceInformation("Logger EULISES FFINdsdsd ");
            **/

            //ArchivoTarjeta miArchivo = new ArchivoTarjetaVisa();
            // archivo visa fonseca
            //miArchivo.AbrirArchivo("C:\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\ejemplo_archivo_VISA2.csv");
            
            //C:\\Users\\Euli\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo
            //miArchivo.AbrirArchivo("C:\\Users\\Euli\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\ejemplo_archivo_VISA2.csv");
            //ArchivoTarjeta miArchivo = new ArchivoTarjetaVisa();
            //miArchivo.AbrirArchivo("C:\\Users\\Euli\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\ejemplo_archivo_VISA2.csv", "quidele");

            //miArchivo.AbrirArchivo("C:\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\ejemplo_archivo_VISA2.csv", "quidele");

            //miArchivo.AbrirArchivo("C:\\Users\\Euli\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\ejemplo_archivo_VISA2.csv", "quidele");

            //Console.WriteLine(miArchivo.miArchivoTarjeta.formato  +" " +  miArchivo.miArchivoTarjeta.nombrearchivo);

            //ServiceConciliacionAutomatica un_ServiceConciliacionAutomatica = new ServiceConciliacionAutomatica();
            //un_ServiceConciliacionAutomatica.procesarArchivo(miArchivo); 
            //un_ServiceConciliacionAutomatica.ConcilialiarAutomaticaticamente(miArchivo.miArchivoTarjeta);

            
            //miArchivo = new ArchivoTarjetaMaster();
            //miArchivo.AbrirArchivo("C:\\github\\tezecoop\\SGLibrary_COM\\archivo_ejemplo\\archivo_Mastercard.txt");
            //miArchivo.ProcesarArchivo();
            //Console.WriteLine(miArchivo.miArchivoTarjeta.formato +" " +  miArchivo.miArchivoTarjeta.nombrearchivo);


           /*
            LoaderForms l = new LoaderForms();
            l.CajaActiva("1");
            l.UsuarioActivo("camilap");
            l.execFormulario("FrmPresentacionesCAI");
           */
            
            /*
            ServiceTarifas miServiceTarifas = new ServiceTarifas();
            miServiceTarifas.cargarTarifas();
            Console.ReadKey(); 
             */
            

            /* 
            LoaderForms l = new LoaderForms();
            l.CajaActiva("1");
            l.UsuarioActivo("camilap");
            l.execFormulario("ServiceTarifas");
             * */


            /* LoaderForms l = new LoaderForms();
            l.CajaActiva("1");
            l.UsuarioActivo("camilap");
            l.execFormulario("FrmConciliaciones");*/

            //LoaderForms l = new LoaderForms();
            //l.CajaActiva("1");
            //l.UsuarioActivo("camilap");
            //l.execFormulario("rpt_AnalisisDeudores");


            //LoaderForms l = new LoaderForms();
            //l.execFormulario("Frm_GroupByGrid");


            LoaderForms l = new LoaderForms();
            l.CajaActiva("1");
            l.UsuarioActivo("camilap");
            l.execFormulario("FrmConciliaciones");
            

            /**
            LoaderForms l = new LoaderForms();
            l.CajaActiva("1");
            l.UsuarioActivo("camilap");
            l.execFormulario("FrmCargaTarifasEjemploADGV");
            **/

            
        }
    }
}

