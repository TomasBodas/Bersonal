﻿using DAL;
using Services.Idioma;
using Services;
using System.Collections.Generic;
using System.Web.Mvc;
using UAIDesarrolloArquitectura.Models;

namespace UAIDesarrolloArquitectura.Controllers
{
    public class IdiomaController : Controller
    {
        DAL_Language dal_language = new DAL_Language();
        // GET: Idioma
        static Services.LanguageService service;

        public void InitializeController()
        {
            if (service == null)
            {
                service = new Services.LanguageService();
                DAL_Language dal = new DAL_Language();
                List<Language> aux = dal.GetLanguages();
                service.InitializeService(aux);
            }
        }

        public LanguageService GetService()
        {
            return service;
        }

        // POST: Language
        [HttpPost]
        public RedirectResult SetLanguage(LanguageDTO data)
        {
            string valorSeleccionado = data.Valor;
            string urlActual = data.Url;
            urlActual = urlActual.Replace("?", "");

            if (SessionManager.IsLogged())
            {
                SessionManager.GetInstance.User.LanguageId = int.Parse(valorSeleccionado);
                DAL_User dal_user = new DAL_User();
                dal_user.UpdateUser(SessionManager.GetInstance.User);
            }

            service.ChangeLanguage(valorSeleccionado);
            return Redirect(urlActual);
        }

        public ActionResult ABMIdioma()
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                List<Language> langList = dal_language.GetLanguages();
                return View(langList);
            }
        }

        [HttpPost]
        public ActionResult AddLanguage(string name)
        {
            List<Language> langList = dal_language.GetLanguages();
            List<string> tags = new List<string>();

            foreach (Translate tr in langList[0].ListTranslate)
            {
                tags.Add(tr.Name);
            }

            dal_language.AddLanguage(name);
            int id = dal_language.GetLastId();
            dal_language.AddTags(id, tags);

            List<int> ids = new List<int>();
            foreach (Language l in langList)
            {
                ids.Add(l.Id);
            }

            ids.Add(id);
            dal_language.AddTagForItself(ids, name);
            langList = dal_language.GetLanguages();

            return View("ABMIdioma", langList);
        }

        [HttpPost]
        public ActionResult UpdateTranslate(int id, string tag, string text)
        {
            dal_language.ModifyTranslate(id, tag, text);
            List<Language> langList = dal_language.GetLanguages();
            return View("ABMIdioma", langList);
        }

        [HttpPost]
        public ActionResult UpdatePage(int id, string tag)
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }

            if (SessionManager.GetInstance.User.Name == "Lucas")
            {
                List<Language> langList = dal_language.GetLanguages();
                Language lang = langList.Find(x => x.Id == id);
                Translate tran = lang.ListTranslate.Find(x => x.Name == tag);

                ViewBag.tran = tran;
                ViewBag.lan = lang;

                return View(tran);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
    }
}
