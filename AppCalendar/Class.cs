using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppCalendar
{
    public class DataContextSingleton
    {
        private static readonly DataClassesDataContext instance = new DataClassesDataContext();

        public static DataClassesDataContext GetInstance()
        {
            return instance;
        }
    }

}