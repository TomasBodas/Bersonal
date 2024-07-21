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
                List<User> usersList = dal_user.getUsers();
                foreach (User user in usersList)
                {
                    user.Email = PasswordEncrypter.DecryptData(user.Email);
                }
                return View(usersList);
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
            List<User> usersList = dal_user.getUsers();
            foreach (User user in usersList)
            {
                user.Email = PasswordEncrypter.DecryptData(user.Email);
            }
            return View("ABMUsuarios", usersList);
        }
        [HttpPost]
        public ActionResult RemoveUser(User pUser)
        {
            dal_user.DeleteUser(pUser);
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            checkDigitsManager.SetCheckDigits();
            List<User> usersList = dal_user.getUsers();
            foreach (User user in usersList)
            {
                user.Email = PasswordEncrypter.DecryptData(user.Email);
            }
            return View("ABMUsuarios", usersList);
        }
        [HttpPost]
        public ActionResult UpdateUser(User pUser)
        {
            dal_user.UpdateUser(pUser);
            BLL_CheckDigitsManager checkDigitsManager = new BLL_CheckDigitsManager();
            checkDigitsManager.SetCheckDigits();
            List<User> usersList = dal_user.getUsers();
            foreach (User user in usersList)
            {
                user.Email = PasswordEncrypter.DecryptData(user.Email);
            }
            return View("ABMUsuarios", usersList);
        }
    }
}