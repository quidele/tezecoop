using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public class PruebaTuri : IPrueba
    {
        void IPrueba.quiensoy()
        {
            Console.WriteLine("Soy la clase Prueba TURI, ejecutando el metodo quiensoy ");
        }
    }
}
