using DAL;
using Services;
using Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
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
                return View(list);
            }
            else return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult Bitacora(DateTime Fechainicio, DateTime Fechafinal)
        {
            List<Log> list = dAL_Log.getLog();
            if (Fechainicio != null || Fechafinal != null)
            {
                List<Log> filteredList = list.Where(p => p.Fecha >= Fechainicio && p.Fecha <= Fechafinal).ToList();
                return View(filteredList);
            }
            else return View(list);    
        }
    }
}