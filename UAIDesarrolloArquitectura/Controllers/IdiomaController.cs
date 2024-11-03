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

namespace UAIDesarrolloArquitectura.Controllers
{
    public class IdiomaController : Controller
    {
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
    }
}