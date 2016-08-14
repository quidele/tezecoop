using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;


namespace SGLibrary
{
    public class ServiceModel
    {
        public ServiceModel()
        {
            string subPath = "Logs"; // your code goes here

            bool exists = System.IO.Directory.Exists(subPath);

            if (!exists)
                System.IO.Directory.CreateDirectory(subPath);

            Trace.Listeners.Add(new TextWriterTraceListener("Logs\\LOG_" + DateTime.Now.ToString().Replace("/", "").Replace(":", "") + ".log"));
            Trace.AutoFlush = true;
            Trace.TraceInformation("inicializando el logger");

            
        }


    }
}
