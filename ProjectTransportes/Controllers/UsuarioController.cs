using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using ProjectTransportes.Extensions;
using System.Security.Claims;

namespace ProjectTransportes.Controllers
{
    public class UsuarioController : Controller
    {
        private RepositoryCoches repo;
        
        public UsuarioController(RepositoryCoches repo)
        {
            this.repo = repo;
        }

        public async Task<IActionResult> Usuarios()
        {
            List<UsuarioVista> usuarios = await this.repo.GetUsuarios();
            return View(usuarios);
        }
        public IActionResult Perfil()
        {
            return View();
        }
        public IActionResult GestionarReserva()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> GestionarReserva(int id)
        {
            ReservaVista reserva = await this.repo.FindReserva(id);
            ViewData["RESERVA"] = reserva;
            if(reserva!= null)
            {
                return View(reserva);
            }
            else
            {
                ViewData["MENSAJE"] = "No existe esa reserva o es incorrecto el número de referencia";

                return View();
            }
        }

        public async Task<IActionResult> PerfilUsuario(int id)
        {
            //parsearlo porque devuelve un string
            //id= HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;
            Usuario user = await this.repo.FindUsuario(id);
            return View();
        }
        public async Task<IActionResult> Mensaje(int id)
        {
                     
            return View();
        }
        public async Task<IActionResult> Delete(int id)
        {
            await this.repo.DeleteUsuarioAsync(id);
            return RedirectToAction("Usuarios", "Usuario");
        }

    }
}
