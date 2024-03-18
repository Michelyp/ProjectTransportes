using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;

namespace ProjectTransportes.Controllers
{
    public class ReservasController : Controller
    {
        private RepositoryCoches repo;
        
        public ReservasController(RepositoryCoches repo)
        {
            this.repo = repo;

        }
        public async Task<IActionResult> Index(int id)
        {
            CocheVista coche = await this.repo.FindCoche(id);
            return View(coche);
        }
        [HttpPost]
        public async Task<IActionResult> Index()
        {
            
            return View();
        }
        public async Task<IActionResult> Reservas()
        {
            return View();
        }
    }
}
