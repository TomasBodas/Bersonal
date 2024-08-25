using DAL;
using Services;
using Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using System.Windows;
using UAIDesarrolloArquitectura.Models.ViewModel;


namespace UAIDesarrolloArquitectura.Controllers
{
    public class BitacoraController : Controller
    {
        DAL_Log dAL_Log = new DAL_Log();
        public ActionResult Bitacora()
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }
            if (SessionManager.GetInstance.User.Name == "admin")
            {
                List<Log> list = dAL_Log.getLog();
                foreach(Log log in list)
                {
                    log.User = PasswordEncrypter.DecryptData(log.User);
                }
                return View(list);
            }
            else return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult Bitacora(DateTime Fechainicio, DateTime Fechafinal, string Modulo = null)
        {
            List<Log> list = dAL_Log.getLog();
            //List<Log> filteredList = new List<Log>();
            if (Fechainicio == null || Fechafinal == null && Modulo == null) return View(list);
            if (Fechainicio != null && Fechafinal != null)
            {
                list = list.Where(p => p.Fecha >= Fechainicio && p.Fecha <= Fechafinal).ToList();
            }
            if (Modulo != null && !Modulo.IsEmpty())
            {
                list = list.Where(p => p.Modulo == Modulo).ToList();                  
            }
            foreach (Log log in list)
            {
                log.User = PasswordEncrypter.DecryptData(log.User);
            }
            return View(list);
        }
    }
}