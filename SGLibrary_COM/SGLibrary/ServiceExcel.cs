using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using SGLibrary.ArchivoTarjetas; 

//using SGLibrary.ExcelNuke;

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

        public List<String> obtenerNombresHojas()
        {
            List<String> nombreHojas = new List<String>();

            foreach (Microsoft.Office.Interop.Excel.Worksheet wSheet in MyApp.Worksheets)
            {
                nombreHojas.Add ( wSheet.Name ) ;
            }
            return nombreHojas;
        }


        public void SeleccionaHoja(String pNombreHoja)
        {
            List<String> nombreHojas = new List<String>();

            foreach (Microsoft.Office.Interop.Excel.Worksheet wSheet in MyApp.Worksheets)
            {
                if (wSheet.Name.CompareTo(pNombreHoja) == 0)
                {

                    MySheet = MyBook.Sheets[wSheet.Index]; // Explict cast is not required here
                }
            }
        }


        public List<RelColumnasXLSSAT> ObtenerNombresdeColumnas()
        {
            List<RelColumnasXLSSAT> lista = new List<RelColumnasXLSSAT>();
            lista.Clear();

            for (int index = 1; index <= 8; index++)
            {
                System.Array MyValues = (System.Array)MySheet.get_Range("A1" , "H1").Cells.Value;
                
                if (MyValues.GetValue(1, index).ToString().CompareTo ("")!=0) {
                    RelColumnasXLSSAT objRelColumnasXLSSAT = new RelColumnasXLSSAT();
                    objRelColumnasXLSSAT.IndiceXLS  = index;
                    objRelColumnasXLSSAT.NombreColumnaXLS = MyValues.GetValue(1, index).ToString();  
                    lista.Add(objRelColumnasXLSSAT);
                }
            }
            return lista;
        }


       /*public List<TB_Productos> ObtenerNombresdeColumnas()
        {
            listaProductos.Clear();

            Func<String, bool> myFunc = (x) => (x.CompareTo("SI") == 1);
        */
            /* bool result = myFunc(4); // returns false of course */
        /*
            for (int index = 2; index <= lastRow; index++)
            {
                System.Array MyValues = (System.Array)MySheet.get_Range("A" + index.ToString(), "H" + index.ToString()).Cells.Value;
                listaProductos.Add(new TB_Productos
                {
                    cdProducto = Int32.Parse(MyValues.GetValue(1, 1).ToString()),
                    dsProducto = MyValues.GetValue(1, 2).ToString(),
                    vlPrecioViajeSinPeaje = Double.Parse(MyValues.GetValue(1, 3).ToString()),
                    vlPrecioPeaje = Double.Parse(MyValues.GetValue(1, 4).ToString()),
                    vlPrecioViaje = Double.Parse(MyValues.GetValue(1, 5).ToString()),
                    flMuestraenlaWEB = myFunc(MyValues.GetValue(1, 6).ToString())

                });



            }
        }*/

    } // cierra la declaracion de la clase 


    /**
     * Ejemplos de como obtener los nombre de hojas de un archivo excel 
        Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();
        Microsoft.Office.Interop.Excel.Workbook excelBook = xlApp.Workbooks.Open("D:\\Book1.xlsx"); 

        String[] excelSheets = new String[excelBook.Worksheets.Count];
        int i = 0;
        foreach(Microsoft.Office.Interop.Excel.Worksheet wSheet in excelBook.Worksheets)    
        {
          excelSheets[i] = wSheet.Name;
          i++;
        }

     * 
     * 
     *   Private Sub ListExcelTablesDAO()


            Dim ExcelWB As dao.Database
            Dim tbl As dao.TableDef
            Dim JetEngine As New dao.DBEngine

            ExcelWB = JetEngine.OpenDatabase("C:\Test Files\Book20.xls", False, True, "Excel 8.0;")

            For Each tbl In ExcelWB.TableDefs
              Console.WriteLine(tbl.Name)
            Next tbl
            ExcelWB.Close()
        End Sub
     * */


}
