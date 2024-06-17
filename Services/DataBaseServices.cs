using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public static class DataBaseServices
    {
        private static readonly string CONNECTION_STRING = "Data Source=.;Initial Catalog=Bersonal;Integrated Security=True";

        public static string getConnectionString()
        {
            return CONNECTION_STRING;
        }
    }
}
