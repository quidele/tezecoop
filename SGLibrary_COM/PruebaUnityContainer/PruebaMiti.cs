using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public class PruebaMiti : IPrueba
    {
        void IPrueba.quiensoy()
        {
            Console.WriteLine("Soy la clase Prueba MITI, ejecutando el metodo quiensoy ");
        }
    }
}
