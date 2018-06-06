using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Mocks
{
    public class dbSG2000EntitiesMocks : dbSG2000Entities
    {

        public override int SaveChanges()
        {
            Console.Write("No grabamos nada porque esta en pruebas unitarias"); 
            return 1; 
        }

        
    }
}
