using DAL;
using Services.Idioma;
using Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNetCore.Mvc;
using UAIDesarrolloArquitectura.Models;
using HttpPostAttribute = Microsoft.AspNetCore.Mvc.HttpPostAttribute;
using Services.Models;
using BLL;
using ActionResult = System.Web.Mvc.ActionResult;

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
        public LanguageService getService() { return service; }
        // POST: Language
        [HttpPost("SetLanguage")]
        public System.Web.Mvc.RedirectResult SetLanguage([FromBody] LanguageDTO data)
        {
            string valorSeleccionado = data.Valor;
            string urlActual = data.Url;
            urlActual.Replace("?", "");
            service.ChangeLanguage(valorSeleccionado);
            // Aquí puedes procesar tanto el valor seleccionado como la URL actual
            return Redirect(urlActual);
        }
        public System.Web.Mvc.ActionResult ABMIdioma()
        {
            if (!SessionManager.IsLogged())
            {
                return RedirectToAction("Login", "Login");
            }
            if (SessionManager.GetInstance.User.Name == "Lucas")
            {
                List<Language> langList = dal_language.GetLanguages();
                return View(langList);
            }
            else return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult AddLanguage(string name)
        {
            dal_language.AddLanguage(name);
            List<Language> langList = dal_language.GetLanguages();
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
                ViewBag.tran = tran; ViewBag.lan = lang;
                return View(tran);
            }
            else return RedirectToAction("Index", "Home");
        }
    }
}