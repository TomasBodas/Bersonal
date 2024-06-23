using DAL;
using Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Windows;


namespace UAIDesarrolloArquitectura.Controllers
{
    public class BackupController : Controller
    {
        public ActionResult ErrorDV()
        {
            return View("CorruptDatabaseMessage");
        }
        public ActionResult Backup()
        {
            DataBaseServices.BackupDatabase();
            return View("Index");
        }
    }
}