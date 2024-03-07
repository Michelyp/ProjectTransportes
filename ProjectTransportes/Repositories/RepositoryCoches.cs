#region VISTAS
//ALTER view V_COCHES_LISTA
//as
//	select COCHE.IDCOCHE, COCHE.IMAGEN,
//    COCHE.ASIENTOS, COCHE.MALETAS,
//    COCHE.PUERTAS, COCHE.PRECIO,
//    COCHE.ESTADOCOCHE,
//    MODELO.NOMBRE AS MODEL, PUNTUACION.PUNTUACION,
//    TIPOMOVILIDAD.NOMBRE AS TIPO, FILTROCOCHE.NOMBRE AS FILTRO,
//    PROVINCIA.NOMBRE 

//	FROM COCHE
//	INNER JOIN MODELO
//	ON  COCHE.IDMODELO=  MODELO.IDMODELO
//	LEFT JOIN PUNTUACION
//	ON COCHE.IDPUNTUACION = PUNTUACION.IDPUNTUACION
//	INNER JOIN TIPOMOVILIDAD
//	ON COCHE.TIPOMOVILIDAD = TIPOMOVILIDAD.IDTIPO
//	INNER JOIN FILTROCOCHE
//	ON COCHE.IDFILTRO = FILTROCOCHE.IDFILTRO
//	LEFT JOIN PROVINCIA
//	ON COCHE.IDPROVINCIA = PROVINCIA.IDPROVINCIA
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
            var coches = await this.context.Coches.ToListAsync();
            return coches;
        }

    }
}
