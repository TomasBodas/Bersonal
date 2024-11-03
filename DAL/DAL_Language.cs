using Services.Idioma;
using Services;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_Language
    {
        private static readonly string CONNECTION_STRING = DataBaseServices.getConnectionString();
        private static SqlConnection con = new SqlConnection(CONNECTION_STRING);
        private DataTable GetLanguagesData()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT Id, Nombre FROM idioma", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        private DataTable GetTranslatesData()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("SELECT IdiomaId, Tag, Texto FROM traduccion", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
        public List<Language> GetLanguages()
        {
            List<Language> list = new List<Language>();
            DataTable languages = GetLanguagesData();
            if (languages.Rows.Count == 0) return list;

            DataTable translates = GetTranslatesData();
            foreach (DataRow dr in languages.Rows)
            {
                Language aux = new Language(dr.ItemArray);
                foreach (DataRow dr2 in translates.Rows)
                {
                    if (dr2.ItemArray[0].ToString() == aux.Id.ToString())
                    {
                        aux.ListTranslate.Add(new Translate(dr2.ItemArray));
                    }
                }
                list.Add(aux);
            }
            return list;
        }
    }
}
