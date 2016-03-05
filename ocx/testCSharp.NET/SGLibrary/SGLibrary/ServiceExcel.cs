using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;

namespace SGLibrary
{
    public class ServiceExcel
    {

        
        private static Workbook MyBook = null;
        private static Application MyApp = null;
        private static Worksheet MySheet = null;
        private static int lastRow = 0;


        public static List<TB_Productos> listaProductos = new List<TB_Productos>();

        public static void InitializeExcel(string nombreArchivoXLS)
        {

            MyApp = new Application();
            MyApp.Visible = false;
            MyBook = MyApp.Workbooks.Open(nombreArchivoXLS);
            MySheet = MyBook.Sheets[1]; // Explict cast is not required here
            lastRow = MySheet.Cells.SpecialCells(XlCellType.xlCellTypeLastCell).Row;
            TB_Productos producto = new TB_Productos();
            
        }


        public static List<TB_Productos> ReadMyExcel()
        {
            listaProductos.Clear();
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
                });


            }

            
            foreach (TB_Productos p in listaProductos)
            {
               Console.WriteLine (  p.dsProducto + " "+ p.vlPrecioViaje.ToString ()) ; 
            }

            return listaProductos;
        }


        public static void CerrarExcel()
        {
            ServiceExcel.MyBook.Close(false);
            GC.Collect(); 

        }

    }


}
