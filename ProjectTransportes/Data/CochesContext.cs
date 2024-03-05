using Microsoft.EntityFrameworkCore;
using ProjectTransportes.Models;

namespace ProjectTransportes.Data
{
    public class CochesContext:DbContext
    {
        public CochesContext(DbContextOptions<CochesContext>options)
            : base(options) { }
        public DbSet<Coche> Coches { get; set; }
    }
}
