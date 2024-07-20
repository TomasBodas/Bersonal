using BLL;
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
    public class ABMController : Controller
    {
        DAL_User dal_user = new DAL_User();
        public ActionResult ABMUsuarios()
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }
            if (SessionManager.GetInstance.User.Name == "admin")
            {
                List<User> list = dal_user.getUsers();
                return View(list);
            }
            else return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult AddUser(string Name, string Surname, int DNI, string Email, string Password)
        {
            string Hash = PasswordEncrypter.EncryptPassword(Password);
            dal_user.RegisterUser(Name, Surname, DNI, Email, Hash);
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            checkDigitsManager.SetCheckDigits();
            List<User> list = dal_user.getUsers();
            return View("ABMUsuarios", list);
        }
        [HttpPost]
        public ActionResult RemoveUser(User user)
        {
            dal_user.DeleteUser(user);
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            checkDigitsManager.SetCheckDigits();
            List<User> list = dal_user.getUsers();
            return View("ABMUsuarios", list);
        }
        [HttpPost]
        public ActionResult UpdateUser(User user)
        {
            dal_user.UpdateUser(user);
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            checkDigitsManager.SetCheckDigits();
            List<User> list = dal_user.getUsers();
            return View("ABMUsuarios", list);
        }
    }
}