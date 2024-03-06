using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Repositories;

namespace ProjectTransportes.Controllers
{
    public class CochesController : Controller
    {
        private RepositoryCoches repo;
        public CochesController(RepositoryCoches repo)
        {
            this.repo = repo;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}
