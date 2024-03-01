
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
        public int IdPuntuacion { get; set; }
        [Column("PLAZA")]
        public int Plaza { get; set; }
        [Column("KILOMETRAJE")]
        public int Kilometraje { get; set; }
        [Column("TIPOMOVILIDAD")]
        public int TipoMovilidad { get; set; }
        [Column("IDSERVICIO")]
        public int IdServicio { get; set; }
        [Column("IMAGEN")]
        public string Imagen { get; set; }
        [Column("ESTADOCOCHE")]
        public Boolean EstadoCoche { get; set; }
    }
}
