using DAL;
using Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Windows;
using UAIDesarrolloArquitectura.Models.ViewModel;
using WebGrease.Activities;


namespace UAIDesarrolloArquitectura.Controllers
{
    public class BackupController : Controller
    {
        public ActionResult ErrorDV()
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }
            return View("CorruptDatabaseMessage");
        }
        public ActionResult Backup()
        {
            DataBaseServices.BackupDatabase();
            var model = new BackupViewModel
            {
                BackupSuccess = true,
                Message = "El respaldo de la base de datos se creo con exito."
            };
            return View("Index", model);
        }
        [HttpPost]
        public ActionResult Restore(string route)
        {
            DataBaseServices.RestoreDatabase(route);
            return View("Index");
        }
    }
}