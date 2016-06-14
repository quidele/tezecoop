using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ExcelNuke
{
    public class Cells
    {

        public Object Value;
   
        public RowCell SpecialCells(int p){
            return new RowCell();

        }

   
    }

    public class RowCell
    {
        public int Row;
    }


    public class XlCellType{
        public static int xlCellTypeLastCell;
    }
}
