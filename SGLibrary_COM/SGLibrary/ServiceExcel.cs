using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using SGLibrary.ArchivoTarjetas;
using System.Diagnostics;


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
        public static List<TarifasXLS> listaTarifas = new List<TarifasXLS>();

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
                    cdProducto = Int32.Parse ( MyValues.GetValue(1, 1).ToString()),   // CODIGO
                    dsProducto  = MyValues.GetValue(1, 2).ToString(),  // DESCRIPCION
                    vlPrecioViajeSinPeaje  =  Double.Parse (MyValues.GetValue(1, 3).ToString()), // PRECIO
                    vlPrecioPeaje = Double.Parse(MyValues.GetValue(1, 4).ToString()),    // PEAJE
                    vlPrecioViaje  = Double.Parse ( MyValues.GetValue(1, 5).ToString()), // TOTAL
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

        public List<TarifasXLS> ReadMyExcelTarifas()
        {
            listaTarifas.Clear();

            Func<String, bool> myFunc = (x) => (x.CompareTo("SI") == 1);

            /* bool result = myFunc(4); // returns false of course */

            for (int index = 2; index <= lastRow; index++)
            {
                System.Array MyValues = (System.Array)MySheet.get_Range("A" + index.ToString(), "H" + index.ToString()).Cells.Value;
                listaTarifas.Add(new TarifasXLS
                {
                    Codigo = Int32.Parse(MyValues.GetValue(1, 1).ToString()),   // CODIGO
                    Descripcion = MyValues.GetValue(1, 2).ToString(),  // DESCRIPCION
                    Precio = Double.Parse(MyValues.GetValue(1, 3).ToString()), // PRECIO
                    Peaje = Double.Parse(MyValues.GetValue(1, 4).ToString()),    // PEAJE
                    Total = Double.Parse(MyValues.GetValue(1, 5).ToString()), // TOTAL
                    Kilometros = Double.Parse(MyValues.GetValue(1, 6).ToString()),
                    Muestra_en_la_Web =  myFunc( MyValues.GetValue(1,7).ToString())

                    /*
                             public int Codigo { get; set; }
                        public String Descripcion { get; set; }
                        public Double Precio { get; set; }
                        public Double Peaje { get; set; }
                        public Double Total { get; set; }
                        public Double Kilometros { get; set; }
                        public bool Muestra_en_la_Web { get; set; }
                     */
                });


            }
            return listaTarifas;
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
                    lastRow = MySheet.Cells.SpecialCells(XlCellType.xlCellTypeLastCell).Row; // Informamos cual es la ultima fila con datos 
                    return; 
                }
            }
        }


        public List<RelColumnasXLSSAT> ObtenerNombresdeColumnas()
        {
            List<RelColumnasXLSSAT> lista = new List<RelColumnasXLSSAT>();
            lista.Clear();
            System.Array MyValues = (System.Array)MySheet.get_Range("A1", "H1").Cells.Value;

            for (int index = 1; index <= 7; index++)
            {    
                if (MyValues.GetValue(1, index).ToString().CompareTo ("")!=0) {
                    RelColumnasXLSSAT objRelColumnasXLSSAT = new RelColumnasXLSSAT();
                    objRelColumnasXLSSAT.IndiceXLS  = index;
                    objRelColumnasXLSSAT.NombreColumnaXLS = MyValues.GetValue(1, index).ToString();
                    lista.Add(objRelColumnasXLSSAT);
                }
            }
            return lista;
        }


        public List<Object> ObtenerContenido()
        {
            Trace.TraceInformation("Ingresa a metodo ObtenerContenido");
            List<Object> lista = new List<Object>();
            lista.Clear();
            for (int i = 2; i < lastRow; i++)
            {
                System.Array MyValues = (System.Array) MySheet.get_Range("A" + i.ToString () , "H" + i.ToString () ).Cells.Value;
                Trace.TraceInformation(MyValues.ToString());
                lista.Add(MyValues);    
            }
            Trace.TraceInformation("finaliza a metodo ObtenerContenido");
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



        public void ExportarAExcel(System.Windows.Forms.DataGridView dataGridView1, String NombreArchivo )
        {
            // creating Excel Application  
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            // creating new WorkBook within Excel application  
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            // creating new Excelsheet in workbook  
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            // see the excel sheet behind the program  
            app.Visible = true;
            // get the reference of first sheet. By default its name is Sheet1.  
            // store its reference to worksheet  
            worksheet = workbook.Sheets[1];
            worksheet = workbook.ActiveSheet;
            // changing the name of active sheet  
            worksheet.Name = "Hoja1";
            // storing header part in Excel  
            for (int i = 1; i < dataGridView1.Columns.Count + 1; i++)
            {
                worksheet.Cells[1, i] = dataGridView1.Columns[i - 1].HeaderText;
            }
            // storing Each row and column value to excel sheet  
            for (int i = 0; i < dataGridView1.Rows.Count ; i++)
            {
                for (int j = 0; j < dataGridView1.Columns.Count; j++)
                {
                    worksheet.Cells[i + 2, j + 1] = dataGridView1.Rows[i].Cells[j].Value.ToString();
                }
            }
            // save the application  
            workbook.SaveAs(NombreArchivo, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            // Exit from the application  
            app.Quit();
        }





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
