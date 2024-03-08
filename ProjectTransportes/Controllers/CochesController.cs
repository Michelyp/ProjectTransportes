using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Models;
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
        public async Task<IActionResult> Index()
        {
            
            List<Coche> coches = await this.repo.CochesDispo();
            return View(coches);
        }
    }
}
