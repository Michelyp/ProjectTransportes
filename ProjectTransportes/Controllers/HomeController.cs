using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using ProjectTransportes.Filters;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using System.Diagnostics;

namespace ProjectTransportes.Controllers
{
    
    public class HomeController : Controller
    {
        private RepositoryCoches repo;
        private IMemoryCache memoryCache;
        public HomeController(RepositoryCoches repo, IMemoryCache memoryCache)
        {
            this.repo = repo;
            this.memoryCache = memoryCache;

        }
        [AuthorizeUsers]
        public IActionResult Index()
        {
            List<Provincia> provincias =  this.repo.GetProvincias();
            ViewData["PROVINCIAS"] = provincias;
            return View();
        }
        [HttpPost]
        public IActionResult Index(string provincia, DateTime fechainit, TimeSpan horainit, DateTime fechafin, TimeSpan horafin,
            string decision)
        {
            this.memoryCache.Set("FECHAINIT", fechainit);
            this.memoryCache.Set("HORAINIT", horainit);
            this.memoryCache.Set("PROVINCIA", provincia);
            this.memoryCache.Set("FECHAFIN", fechafin);
            this.memoryCache.Set("HORAFIN", horafin);
            this.memoryCache.Set("DECISION", decision);

            return RedirectToAction("Index", "Coches");


        }



    }
}