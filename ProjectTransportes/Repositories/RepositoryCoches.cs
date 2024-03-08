#region VISTAS and PROCEDURE
//alter view v_coches_lista
//as
//	select coche.idcoche, coche.imagen,
//    coche.asientos, coche.maletas,
//    coche.puertas, coche.precio,
//    coche.estadocoche,
//    modelo.nombre as model, puntuacion.puntuacion,
//    coche.idprovincia, tipomovilidad.nombre as tipo_cambio
//	from coche
//	inner join modelo
//	on  coche.idmodelo=  modelo.idmodelo
//	inner join tipomovilidad
//	on  coche.tipomovilidad=  tipomovilidad.idtipo
//	left join puntuacion
//	on coche.idpuntuacion = puntuacion.idpuntuacion
//go

//alter procedure sp_all_coches
//as
//	select * from v_coches_lista
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
        public async Task<List<Coche>> CochesDispo() 
        {
            List<Coche> coches = await this.context.Coches.Where(x => x.EstadoCoche == true).ToListAsync();
            return coches;
        }

    }
}
