using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEntity
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new dbSG2000Entities())
            {
                // Perform data access using the context 

                // return first customer 
                var destinos = (from c in context.TB_Productos
                                select c).First();
                Console.WriteLine(destinos.cdProducto);
                Console.WriteLine(destinos.dsProducto);

               
            }
        }
    }
}
