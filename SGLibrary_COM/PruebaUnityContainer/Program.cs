using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management;
using System.Windows;
using System.Diagnostics;
using Unity;
using Microsoft.Practices.Unity.Configuration;
using System.Configuration;

namespace ConsoleApplication1
{
    class Program
    {

        [STAThread]
        static void Main(string[] args)
        {

            IUnityContainer container = new UnityContainer();
            container.RegisterType<IPrueba, Prueba>(); 
            IPrueba una_Prueba = container.Resolve<IPrueba>();
            una_Prueba.quiensoy(); 
        }
    }
}

