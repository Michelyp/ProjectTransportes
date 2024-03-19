using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using ProjectTransportes.Filters;
using ProjectTransportes.Models;
using ProjectTransportes.Repositories;
using System.Security.Claims;

namespace ProjectTransportes.Controllers
{
    public class ReservasController : Controller
    {
        private RepositoryCoches repo;
        private IMemoryCache memoryCache;

        public ReservasController(RepositoryCoches repo, IMemoryCache memoryCache)
        {
            this.repo = repo;
            this.memoryCache = memoryCache;
        }
        [AuthorizeUsers]
        public async Task<IActionResult> Index(int id)
        {
            CocheVista coche = await this.repo.FindCoche(id);
            this.memoryCache.Set("IDCOCHE", id);

            return View(coche);
        }
        [HttpPost]
        public async Task<IActionResult> Index(string nombre, string nombreUsuario, string direccion, string ciudad, int codigopostal, string pais)
        {
           string idusuario = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;
            int iduser = int.Parse(idusuario);
            await this.repo.CrearFacturacionAsync(nombreUsuario, direccion, ciudad, codigopostal,pais);
            DateTime fechaInit = this.memoryCache.Get<DateTime>("FECHAINIT");
            TimeSpan horaInit = memoryCache.Get<TimeSpan>("HORAINIT");
            DateTime fechaFin = memoryCache.Get<DateTime>("FECHAFIN");
            TimeSpan horaFin = memoryCache.Get<TimeSpan>("HORAFIN");
            string lugar = memoryCache.Get<string>("PROVINCIA");
            int idcoche = memoryCache.Get<int>("IDCOCHE");
            await this.repo.CrearReservaAsync(lugar, nombre, horaInit, fechaInit, fechaFin, horaFin, idcoche, iduser);
            ViewData["MENSAJE"] = "Reserva registrado correctamente";
            return RedirectToAction("Index","Coches");
        }
        public async Task<IActionResult> Reservas()
        {
            List<ReservaVista> reservas = await this.repo.GetReservas();
            return View(reservas);
        }
        public async Task<IActionResult> Delete(int id)
        {
            await this.repo.DeleteReservaAsync(id);
            return RedirectToAction("Reservas", "Reservas");
        }
    }
}
