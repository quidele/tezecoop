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

            Trace.Listeners.Add(new TextWriterTraceListener("Logs\\LOG_" + DateTime.Now.AddDays(-30).ToString().Replace("/", "").Replace(":", "") + ".log"));
            Trace.AutoFlush = true;
            Trace.TraceInformation("inicializando el logger");

            
        }


    }
}
