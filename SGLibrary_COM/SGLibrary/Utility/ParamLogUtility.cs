using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



namespace SGLibrary.Utility
{
    internal class ParamLogUtility
    {
        private readonly String _methodName;
        private String _paramaterLog;

        
        private readonly Dictionary<String, Type> _methodParamaters;
        private readonly List<Tuple<String, Type, object>> _providedParametars;


        [DebuggerHidden]
        public ParamLogUtility(params Expression<Func<object>>[] providedParameters)
        {
            try
            {
                
                var currentMethod = new StackTrace().GetFrame(1).GetMethod();

                /*Set class and current method info*/
                _methodName = String.Format("Class = {0}, Method = {1}", currentMethod.DeclaringType.FullName, currentMethod.Name);

                /*Get current methods paramaters*/
                _methodParamaters = new Dictionary<string, Type>();
                (from aParamater in currentMethod.GetParameters()
                 select new { Name = aParamater.Name, DataType = aParamater.ParameterType })
                 .ToList()
                 .ForEach(obj => _methodParamaters.Add(obj.Name, obj.DataType));

                /*Get provided methods paramaters*/
                _providedParametars = new List<Tuple<string, Type, object>>();
                foreach (var aExpression in providedParameters)
                {
                    Expression bodyType = aExpression.Body;

                    if (bodyType is MemberExpression)
                    {
                        AddProvidedParamaterDetail((MemberExpression)aExpression.Body);
                    }
                    else if (bodyType is UnaryExpression)
                    {
                        UnaryExpression unaryExpression = (UnaryExpression)aExpression.Body;
                        AddProvidedParamaterDetail((MemberExpression)unaryExpression.Operand);
                    }
                    else
                    {
                        throw new Exception("Expression type unknown.");
                    }
                }

                /*Process log for all method parameters*/
                ProcessLog();

            }
            catch (Exception exception)
            {
                throw new Exception("Error in paramater log processing.", exception);
            }
        }

        [DebuggerHidden]
        private void ProcessLog()
        {
            try
            {
                foreach (var aMethodParamater in _methodParamaters)
                {
                    var aParameter =
                        _providedParametars.Where(
                            obj => obj.Item1.Equals(aMethodParamater.Key) && obj.Item2 == aMethodParamater.Value).Single();
                    _paramaterLog += String.Format(@" ""{0}"":{1},", aParameter.Item1, aParameter.Item3.ToString() );
                    // Agregado por EULISES
                    foreach (PropertyDescriptor descriptor in TypeDescriptor.GetProperties(aParameter.Item3))
                    {
                        string name = descriptor.Name;
                        object value = descriptor.GetValue(aParameter.Item3);
                        Console.WriteLine("{0}={1}", name, value);
                        _paramaterLog += String.Format("{0}={1},", name, value);
                    }
                }
                _paramaterLog = (_paramaterLog != null) ? _paramaterLog.Trim(' ', ',') : string.Empty;

            }
            catch (Exception exception)
            {
                throw new Exception("MathodParamater is not found in providedParameters." + exception);
            }
        }

        [DebuggerHidden]
        private void AddProvidedParamaterDetail(MemberExpression memberExpression)
        {
            ConstantExpression constantExpression = (ConstantExpression)memberExpression.Expression;
            var name = memberExpression.Member.Name;
            var value = ((FieldInfo)memberExpression.Member).GetValue(constantExpression.Value);
            var type = value.GetType();
            _providedParametars.Add(new Tuple<string, Type, object>(name, type, value));
        }

        [DebuggerHidden]
        public String GetLog()
        {
            return String.Format("{0}({1})", _methodName, _paramaterLog);
        }
    }
}