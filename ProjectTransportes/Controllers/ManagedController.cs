using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Extensions;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using System.Security.Claims;

namespace ProjectTransportes.Controllers
{
    public class ManagedController : Controller
    {
        private RepositoryCoches repo;

        public ManagedController(RepositoryCoches repo)
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
            }
            else
            {
                HttpContext.Session.SetObject("idrol", user.IdRol);
                ClaimsIdentity identity = new ClaimsIdentity(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    ClaimTypes.Name, ClaimTypes.Role);

                Claim claimName = new Claim(ClaimTypes.Name, user.Nombre);
                identity.AddClaim(claimName);
                Claim claimIdentifier = new Claim(ClaimTypes.NameIdentifier, user.IdUsuario.ToString());
                identity.AddClaim(claimIdentifier);
                Claim claimIdRol = new Claim(ClaimTypes.Role, user.IdRol.ToString());
                identity.AddClaim(claimIdRol);

                ClaimsPrincipal userPrincipal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, userPrincipal);

                //var roles = await _userManager.GetRolesAsync(user);
                //if (roles.Contains("1"))
                //{
                    return RedirectToAction("PanelAdmin", "Administrador");
                //}else if (roles.Contains("2"))
                //{
                //    return RedirectToAction("Index", "Home");

                //}

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
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "Managed");
        }

    }
}
