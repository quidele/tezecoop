using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Extensiones
{
    public static class ExtensionString
    {

        public static string EmptyIfNull(this object value)
        {
            if (value == null)
                return "";
            return value.ToString();
        }
    }
}
