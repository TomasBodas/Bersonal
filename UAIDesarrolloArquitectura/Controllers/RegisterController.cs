using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using BLL;
using DAL;
using Services;
using Services.Models;

namespace UAIDesarrolloArquitectura.Controllers
{
    public class RegisterController : Controller
    {
        public ActionResult Register()
        {
            return View("Register");
        }

        [HttpPost]
        public ActionResult Register(string Name,string Surname,int DNI, string Email, string Password, string ConfirmPassword)
        {

            if (Password != ConfirmPassword)
            {
                ModelState.AddModelError("ConfirmPassword", "La contraseña no coincide.");
            }
            if (ModelState.IsValid)
            {
                DAL_User dal_usuarios = new DAL_User();
                BLL_DVManager bll_dvmanager = new BLL_DVManager();
                string Hash = PasswordEncrypter.EncryptPassword(Password);
                string emailHash = PasswordEncrypter.EncryptPassword(Email);
                dal_usuarios.RegisterUser(Name, Surname, DNI, emailHash, Hash);
                User user = dal_usuarios.findByEmail(emailHash);
                dal_usuarios.EventLog(user.id, DateTime.Now.ToString(), "Registro", "Se creó una cuenta");
                bll_dvmanager.actualizarDV();
                // Your registration logic here, e.g., save to database, etc.


                // On successful registration, redirect to another page
                return RedirectToAction("Login", "Login");
            }

            return View();
        }
    }
}