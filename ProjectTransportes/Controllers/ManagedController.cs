using Microsoft.AspNetCore.Mvc;

namespace ProjectTransportes.Controllers
{
    public class ManagedController : Controller
    {
        public IActionResult PanelAdmin()
        {
            return View();
        }
    }
}
