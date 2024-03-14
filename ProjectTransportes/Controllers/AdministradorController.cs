using Microsoft.AspNetCore.Mvc;

namespace ProjectTransportes.Controllers
{
    public class AdministradorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult PanelAdmin()
        {
            return View();
        }
    }
}
