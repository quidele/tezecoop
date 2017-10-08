﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
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

    

    }// Cierre de ExtensionString


    public static class Extensions
    {


        public static DataSet ToDataSet<T>(this IList<T> list)
        {
            Type elementType = typeof(T);
            DataSet ds = new DataSet();
            DataTable t = new DataTable();
            ds.Tables.Add(t);

            //add a column to table for each public property on T   
            foreach (var propInfo in elementType.GetProperties())
            {
                t.Columns.Add(propInfo.Name, propInfo.PropertyType);
            }

            //go through each property on T and add each value to the table   
            foreach (T item in list)
            {
                DataRow row = t.NewRow(); foreach (var propInfo in elementType.GetProperties())
                {
                    row[propInfo.Name] = propInfo.GetValue(item, null);
                }
                t.Rows.Add(row);
            }
            return ds;
        }


        public static List<T> ToList<T>(this DataTable table) where T : new()
        {
            IList<PropertyInfo> properties = typeof(T).GetProperties().ToList();
            List<T> result = new List<T>();

            foreach (var row in table.Rows)
            {
                var item = CreateItemFromRow<T>((DataRow)row, properties);
                result.Add(item);
            }

            return result;
        }

        private static T CreateItemFromRow<T>(DataRow row, IList<PropertyInfo> properties) where T : new()
        {
            T item = new T();
            foreach (var property in properties)
            {
                if (property.PropertyType == typeof(System.DayOfWeek))
                {
                    DayOfWeek day = (DayOfWeek)Enum.Parse(typeof(DayOfWeek), row[property.Name].ToString());
                    property.SetValue(item, day, null);
                }
                else
                {
                    if (row[property.Name] == DBNull.Value)
                        property.SetValue(item, null, null);
                    else
                        property.SetValue(item, row[property.Name], null);
                }
            }
            return item;
        }

        public static DataSet ToDataSet<T>(this IEnumerable<T> lista)
        {
            Type elementType = typeof(T);
            DataSet ds = new DataSet();
            DataTable t = new DataTable();
            ds.Tables.Add(t);

            var primero_registro = true;
            Type t1 ;
            PropertyInfo[] pi = new  PropertyInfo[0] ;
            var i = 1;

            foreach (object item in lista)
            {
                t1 = item.GetType();
                pi = t1.GetProperties();

                if (primero_registro)
                {
                    foreach (PropertyInfo p in pi)
                    {
                        Console.WriteLine(p.Name + " " + p.GetValue(item, null));
                        Console.WriteLine(p.PropertyType.Name);

                        switch (p.PropertyType.Name)
                        {
                            case "Nullable`1":
                                t.Columns.Add(p.Name, p.PropertyType.GetGenericArguments()[0]);
                                break;
                            default:
                                t.Columns.Add(p.Name, p.PropertyType);
                                break;
                        }

                    }
                    primero_registro = false;
                } // cierra if 
               

                DataRow row = t.NewRow();
                foreach (PropertyInfo p in pi)
                {
                    Console.WriteLine("DATO1: " + p.Name + " "  +  p.GetValue(item, null).ToString());
                    Console.WriteLine("DATO2: " + p.PropertyType.Name);
                    Console.WriteLine("EULISES.................." + i.ToString());

                    if (i.ToString().CompareTo("31") == 0)
                    {
                        Console.WriteLine("para : " );
                    }
                    switch (p.PropertyType.Name)
                    {
                        case "Nullable`1":
                            row[p.Name] = p.GetValue(item, null);
                            break;
                        default:
                            row[p.Name] = p.GetValue(item, null);
                            break;
                    }
                   
                }
                t.Rows.Add(row);
                i++;

            } // Cierra el foreach (object item in lista)

          
            return ds;
        }
    }

}
