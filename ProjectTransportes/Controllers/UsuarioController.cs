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

        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(string email, string password)
        {
            Usuario user = await this.repo.LoginUserAsync(email, password);
            if (user == null)
            {
                //poner un al
                ViewData["MENSAJE"] = "Usuario no registrado";
                return View();
            }else
            {
                HttpContext.Session.SetObject("USUARIO", user);
                HttpContext.Session.SetString("NOMBRE", user.Nombre);
                HttpContext.Session.SetString("IDROL", user.IdRol.ToString());
                HttpContext.Session.SetString("IDUSUARIO", user.IdUsuario.ToString());
                return RedirectToAction("Register");

            }
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(string nombre, string apellido, string email, string password, int telefono)
        {
            await this.repo.RegisterUserAsync(nombre, apellido, email, password, telefono);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return RedirectToAction("Login");
        }

        public async Task<IActionResult> PerfilUsuario(int id)
        {
            Usuario user = await this.repo.FindUsuario(id);
            return View();
        }



    }
}
