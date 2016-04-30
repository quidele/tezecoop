using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;

namespace SGLibrary
{




    public class ServiceExcel 
    {

        private static Workbook MyBook = null;
        private static Application MyApp = null;
        private static Worksheet MySheet = null;
        private static int lastRow = 0;


        public static List<TB_Productos> listaProductos = new List<TB_Productos>();

        public  void InitializeExcel(String pNombreArchivo)
        {
                MyApp = new Application();
                MyApp.Visible = false;
                MyBook = MyApp.Workbooks.Open(pNombreArchivo);
                MySheet = MyBook.Sheets[1]; // Explict cast is not required here
                lastRow = MySheet.Cells.SpecialCells(XlCellType.xlCellTypeLastCell).Row;
                /* TB_Productos producto = new TB_Productos();  */
          
        }


        public  List<TB_Productos> ReadMyExcel()
        {
            listaProductos.Clear();

            Func<String, bool> myFunc = (x) =>  (x.CompareTo ("SI")==1) ;
            
            /* bool result = myFunc(4); // returns false of course */

            for (int index = 2; index <= lastRow; index++)
            {
                System.Array MyValues = (System.Array)MySheet.get_Range("A" + index.ToString(), "H" + index.ToString()).Cells.Value;
                listaProductos.Add(new TB_Productos
                {
                    cdProducto = Int32.Parse ( MyValues.GetValue(1, 1).ToString()),
                    dsProducto  = MyValues.GetValue(1, 2).ToString(),
                    vlPrecioViajeSinPeaje  =  Double.Parse (MyValues.GetValue(1, 3).ToString()),
                    vlPrecioPeaje =   Double.Parse (MyValues.GetValue(1, 4).ToString()),
                    vlPrecioViaje  = Double.Parse ( MyValues.GetValue(1, 5).ToString()),
                    flMuestraenlaWEB = myFunc(MyValues.GetValue(1, 6).ToString()) 
                    
                });


            }

            /* ActualizarTarifas(listaProductos);*/ 
 
            /* foreach (TB_Productos p in listaProductos)
            {
                Console.WriteLine( p.cdProducto + " - "+ p.dsProducto + " -  " + p.vlPrecioViaje.ToString() + p.flMuestraenlaWEB  ); 
            }*/

            return listaProductos;
        }


        public  void CerrarExcel()
        {
            ServiceExcel.MyBook.Close(false);
            GC.Collect(); 

        }

    }


}
