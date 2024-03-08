#region VISTAS and PROCEDURE
//alter view v_coches_lista
//as
//	select coche.idcoche, coche.imagen,
//    coche.asientos, coche.maletas,
//    coche.puertas, coche.precio,
//    coche.estadocoche,
//    modelo.nombre as model, puntuacion.puntuacion
//	from coche
//	inner join modelo
//	on  coche.idmodelo=  modelo.idmodelo
//	left join puntuacion
//	on coche.idpuntuacion = puntuacion.idpuntuacion
//go

//create procedure SP_ALL_COCHES
//as
//	select * from V_COCHES_LISTA
//go
#endregion
using Microsoft.EntityFrameworkCore;
using ProjectTransportes.Data;
using ProjectTransportes.Models;

namespace ProjectTransportes.Repositories
{
    public class RepositoryCoches
    {
        //Va haber una lista con los coches cuando le de
        //buscar se buscara por el lugar o la zona
        private CochesContext context;
        public RepositoryCoches(CochesContext context)
        {
            this.context = context;
        }
        public async Task<List<Coche>> GetCoches()
        {
            string sql = "SP_ALL_COCHES";
            var consulta = this.context.Coches.FromSqlRaw(sql);
            return await consulta.ToListAsync();
        }
        public List<Provincia> GetProvincias()
        {
            List<Provincia> provincias = this.context.Provincias.ToList();
            return provincias;
        }

    }
}
