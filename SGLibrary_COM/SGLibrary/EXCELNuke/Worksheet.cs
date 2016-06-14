

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.ExcelNuke
{
    public class Worksheet
    {
        public Cells Cells;

        public RangeCells get_Range(string p1, string p2)
        {
            throw new NotImplementedException();
        }
    }

    public class RangeCells
    {
        public Cell Cells;
   
    }

    public class Cell
    {
        public Array Value;
    }
}
