using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Linq;
using System.Web;
using WCFWSFEAFIPTezecoop.DataModelFE;
using System.Threading;

namespace WCFWSFEAFIPTezecoop.Servicios
{
    public static class ServiceLog
    {

        public static string Logger { get; set; }
        public static string Message { get; set; }
        public static string Exception { get; set; }
        public static string Level { get; set; }

        public static void Debug(string pLogger, string pMessage, string pException)
        {
            Level = "DEBUG";
            Logger = pLogger;
            Message = pMessage;
            Exception = pException;
            saveData();
        }

        public static void Info(string pLogger, string pMessage, string pException)
        {

            Level = "INFO";
            Logger = pLogger;
            Message = pMessage;
            Exception = pException;
            saveData();

        }

        public static void Error(string pLogger, string pMessage, string pException)
        {
            Level = "ERROR";
            Logger = pLogger;
            Message = pMessage;
            Exception = pException;
            saveData();
        }


        public static void Warn(string pLogger, string pMessage, string pException)
        {
            Level = "WARN";
            Logger = pLogger;
            Message = pMessage;
            Exception = pException;
            saveData();
        }

        public static void Fatal(string pLogger, string pMessage, string pException)
        {
            Level = "FATAL";
            Logger = pLogger;
            Message = pMessage;
            Exception = pException;
            saveData();
        }


        private static void saveData()
        {
            using (var context = new FacturaElectronicaEntities())
            {
                try
                {
                    var registroLog = new LogApp();
                    registroLog.Thread = Thread.CurrentThread.ToString();
                    registroLog.Date = DateTime.Now;
                    registroLog.Level = Level;
                    registroLog.Logger = Logger;
                    registroLog.Message = Message;
                    registroLog.Exception = Exception;
                    context.LogApp.Add(registroLog);
                    context.SaveChanges();
                }
                catch (EntityCommandCompilationException e)
                {
                    Console.WriteLine(e.Message);
                    
                }

            }// cierre FacturaElectronicaEntities
        } // saveData

    } // ServiceLog

} // namespace