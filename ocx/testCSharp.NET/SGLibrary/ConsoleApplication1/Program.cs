using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGLibrary;
using System.Management;



namespace ConsoleApplication1
{
    class Program
    {

      
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
             **/

            ServicePrinter service = new ServicePrinter();
            Console.WriteLine(service.ConfigPrinter("impresión de factura"));
            Console.ReadKey();
            service.RollbackPrinter();
            Console.WriteLine("RollbackPrinter realizado");
            Console.ReadKey();
 


        }
    }
}
