using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Models;
using System.Diagnostics;

namespace ProjectTransportes.Controllers
{
    public class HomeController : Controller
    {

        public IActionResult Index()
        {
            return View();
        }

    }
}