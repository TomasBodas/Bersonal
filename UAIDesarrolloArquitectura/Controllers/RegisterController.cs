﻿using System;
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
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            if (!checkDigitsManager.CheckDigits())
            {
                return View("Login");
            }
            else return View("Register");
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
                DAL_User dalUser = new DAL_User();
                BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
                string Hash = PasswordEncrypter.EncryptPassword(Password);
                dalUser.RegisterUser(Name, Surname, DNI, Email, Hash);
                User user = dalUser.findByEmail(Email);
                dalUser.EventLog(user.id, DateTime.Now.ToString(), "Registro", "Se creó una cuenta");
                checkDigitsManager.SetCheckDigits();
                // Your registration logic here, e.g., save to database, etc.


                // On successful registration, redirect to another page
                return RedirectToAction("Login", "Login");
            }

            return View();
        }
    }
}