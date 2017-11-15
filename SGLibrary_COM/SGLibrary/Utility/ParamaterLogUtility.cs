using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



namespace SGLibrary.Utility
{
    internal class ParamaterLogUtility
    {
        private String _methodName;
        private String _paramaterLog;

        
        private List<ParameterInfo> _methodParameters;
        private ArrayList _parameters;

        public ParamaterLogUtility(params object[] parameters)
        {

            

            
            _methodParameters = new List<ParameterInfo>();
            _parameters = new ArrayList();

            var currentMethod = new StackTrace().GetFrame(1).GetMethod();
            _methodName = String.Format("Class = {0}, Method = {1}", currentMethod.DeclaringType.FullName, currentMethod.Name);
            var methodParameters = currentMethod.GetParameters();

            foreach (var aMethodParameter in methodParameters)
            {
                var aParameters = parameters[aMethodParameter.Position];
                _paramaterLog += String.Format(@" ""{0}"":{1},", aMethodParameter.Name, aParameters.ToString ()  );
            }
            _paramaterLog = _paramaterLog.Trim(' ', ',');
        }


        public String GetLog()
        {
            return String.Format("{0}({1})", _methodName, _paramaterLog);
        }

    }
}