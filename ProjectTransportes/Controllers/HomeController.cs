using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Filters;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using System.Diagnostics;

namespace ProjectTransportes.Controllers
{
    
    public class HomeController : Controller
    {
        private RepositoryCoches repo;
        public HomeController(RepositoryCoches repo)
        {
            this.repo = repo;

        }
        [AuthorizeUsers]
        public IActionResult Index()
        {
            List<Provincia> provincias =  this.repo.GetProvincias();
            ViewData["PROVINCIAS"] = provincias;
            return View();
        }

    }
}