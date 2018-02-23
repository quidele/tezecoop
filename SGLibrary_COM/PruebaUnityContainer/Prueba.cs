using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public class Prueba : IPrueba
    {
        void IPrueba.quiensoy()
        {
            Console.WriteLine("Soy la clase Prueba, ejecutando el metodo quiensoy ");
        }
    }
}
