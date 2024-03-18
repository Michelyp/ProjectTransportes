using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using ProjectTransportes.Extensions;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using System;
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

                if (user.IdRol == 1)
                {
                    identity.AddClaim(new Claim("Administrador", "Admin Supremo"));
                    return RedirectToAction("PanelAdmin", "Administrador");


                }
                else                 {
                    identity.AddClaim(new Claim("Usuario", "User"));
                    return RedirectToAction("Index", "Home");



                }


                //string controller = TempData["controller"].ToString();
                //string action = TempData["action"].ToString();

                //return RedirectToAction(action, controller);
            }
        }


        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(string nombre, string apellido, string email, string password, int telefono)
        {
            await this.repo.RegisterUserAsync(nombre, apellido, email, password, telefono);
            ViewData["MENSAJE"] = "Usuario registrado correctamente";
            return RedirectToAction("Login");
        }
        public IActionResult ErrorAcceso()
        {
            return View();
        }
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "Managed");
        }

    }
}
