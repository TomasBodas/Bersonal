using DAL;
using Services;
using Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_DVManager
    {

		static List<string> errores = new List<string>();
		static DAL_DV dal = new DAL_DV();

		public static bool verificarDVH(string tabla)
		{
			errores.Clear();
			List<string> rows = dal.verificarDVH(tabla);

			if (rows.Count == 0)
			{
				return true;
			}


			foreach (string row in rows)
			{
				string errorMsg = "Se modificó la fila: " + row + " de la tabla " + tabla;
				errores.Add(errorMsg);
				SessionManager sm = new SessionManager();
				DAL_User dalUser = new DAL_User();
				dalUser.EventLog(0, DateTime.Now.ToString(), "ERROR DE DVH", "ERROR DE DVH");
			}

			return false;
		}

		public static bool verificarDV()
		{
            errores.Clear();
            bool ok = true;

			foreach (string tabla in dal.obtenerTablas())
			{
				if (!dal.verificarDVV(tabla))
				{
					ok = false;
					string errorMsg = "Se eliminó un registro en la tabla:" + tabla;
					errores.Add(errorMsg);
					SessionManager sm = new SessionManager();
					DAL_User dalUser = new DAL_User();
					dalUser.EventLog(0, DateTime.Now.ToString(), "ERROR DE DVV", "ERROR DE DVV");
				}
				if (!verificarDVH(tabla))
				{
					ok = false;
				}
			}

			return ok;
		}

		public static List<string> obtenerErrores()
		{
			var result = new System.Text.StringBuilder();
			foreach (string error in errores)
			{
				result.Append(error + "\n");
			}

			return errores;
		}

		public void actualizarDV()
		{
				try
				{
					borrarErrores();

					foreach (string tabla in dal.obtenerTablas())
					{
						dal.actualizarDVH(tabla);
						dal.actualizarDVV(tabla);
					}
					DAL_User dalUser = new DAL_User();
					dalUser.EventLog(0, DateTime.Now.ToString(), "Actualizacion de DV", "Actualizacion de DV");

				}
				catch (Exception ex)
				{
					Console.WriteLine(ex);
				}
		}

		public void borrarErrores()
		{
			errores.Clear();
		}
	}
}
