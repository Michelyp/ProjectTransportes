using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using ProjectTransportes.Extensions;

namespace ProjectTransportes.Controllers
{
    public class UsuarioController : Controller
    {
        private RepositoryCoches repo;
        
        public UsuarioController(RepositoryCoches repo)
        {
            this.repo = repo;
        }

        public IActionResult Usuarios()
        {
            return View();
        }

        public async Task<IActionResult> PerfilUsuario(int id)
        {
            Usuario user = await this.repo.FindUsuario(id);
            return View();
        }



    }
}
