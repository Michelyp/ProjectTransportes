using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;

namespace ProjectTransportes.Controllers
{
    public class AdministradorController : Controller
    {
        private RepositoryCoches repo;
        public AdministradorController(RepositoryCoches repo)
        {
            this.repo = repo;

        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult PanelAdmin()
        {
            return View();
        }
        public IActionResult AgregarCoche()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AgregarCoche(int modelo, int? valoracion, int tipomovi, int filtrocoche, IFormFile imagen, int provincia, int asientos, int maletas, int puertas, int precio)
        {
            await this.repo.CrearCocheAsync(modelo, valoracion, tipomovi, filtrocoche, imagen, provincia, asientos, maletas, puertas, precio);

            return RedirectToAction("Coches", "Coches");

        }
        public IActionResult CrearUsuario() {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CrearUsuario(string nombre, string apellido, string email, string password, int telefono)
        {
            await this.repo.RegisterUserAsync(nombre, apellido, email, password, telefono);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return RedirectToAction("Usuarios","Usuario");
        }
        public async Task<IActionResult>EditarUsuario(int idUsuario)
        {
            Usuario usuario = await this.repo.FindUsuario(idUsuario);
            return View(usuario);
        }
        [HttpPost]
        public async Task<IActionResult> EditarUsuario(int id, string nombre, string apellido, string correo, string pass, int telefono, int idFacturacicon)
        {
            await this.repo.EditarUsuario(id, nombre, apellido, correo, pass, telefono, idFacturacicon);
            return RedirectToAction("Usuarios", "Usuario");

        }


    }
}
