using Microsoft.EntityFrameworkCore;
using ProjectTransportes.Models;

namespace ProjectTransportes.Data
{
    public class CochesContext:DbContext
    {
        public CochesContext(DbContextOptions<CochesContext>options)
            : base(options) { }
        public DbSet<Coche> Coches { get; set; }
        public DbSet<Marca> Marcas { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
    }
}
