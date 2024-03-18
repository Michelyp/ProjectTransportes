
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjectTransportes.Models
{
    [Table("COCHE")]
    public class Coche
    {
        [Key]
        [Column("IDCOCHE")]
        public int IdCoche { get; set; }
        [Column("IDMODELO")]
        public int IdModelo { get; set; }
        [Column("IDPUNTUACION")]
        public int? Puntuacion { get; set; }
        [Column("TIPOMOVILIDAD")]
        public int TipoMovilidad { get; set; }
        [Column("IDFILTRO")]
        public int Filtro { get; set; }
        [Column("IMAGEN")]
        public string Imagen { get; set; }
        [Column("ESTADOCOCHE")]
        public Boolean? EstadoCoche { get; set; }
        [Column("IDPROVINCIA")]
        public int IdProvincia { get; set; }
        [Column("Asientos")]
        public string Asientos { get; set; }
        [Column("Maletas")]
        public int? Maletas { get; set; }
        [Column("Puertas")]
        public int Puertas { get; set; }
        [Column("Precio")]
        public int Precio { get; set; }
        
    }
}
