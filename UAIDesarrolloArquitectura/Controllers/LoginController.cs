﻿using BLL;
using DAL;
using Services;
using Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using UAIDesarrolloArquitectura.Models.ViewModel;

namespace UAIDesarrolloArquitectura.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            SessionManager.logout();
            return View("Login");
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User user;
                    DAL_User dalUser = new DAL_User();
                    string emailHash = PasswordEncrypter.EncryptData(model.Email);
                    user = dalUser.findByEmail(emailHash);
                    string Hash = PasswordEncrypter.EncryptPassword(model.Password);
                    if (user != null)
                    {
                        if (dalUser.userPasswordMatcher(user.Password, Hash))
                        {
                            //Singleton setup
                            SessionManager.login(user);
                            //DV Check
                            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
                            if (!checkDigitsManager.CheckDigits())
                            {
                                return RedirectToAction("ErrorDV", "Backup");
                            }
                            else dalUser.EventLog(user.id, DateTime.Now.ToString(), "Inicio de sesión", "Se inició sesión");
                            checkDigitsManager.SetCheckDigits();
                        }
                        else throw new Exception();
                        return RedirectToAction("Index", "Home");
                    }
                    else throw new Exception();
                }
            } catch (Exception) { ModelState.AddModelError("MissingUser", "No existe un usuario con estos datos"); }
            
            return View(model);
        }
    }
}