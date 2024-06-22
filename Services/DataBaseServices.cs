using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public static class DataBaseServices
    {
        private static readonly string CONNECTION_STRING = "Data Source=DESKTOP-4OC5GG6\\SQLEXPRESS;Initial Catalog = Bersonal; Integrated Security = True; Connect Timeout = 30; Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public static string getConnectionString()
        {
            return CONNECTION_STRING;
        }
    }
}
