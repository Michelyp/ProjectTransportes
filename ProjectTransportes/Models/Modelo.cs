using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProjectTransportes.Models
{
    [Table("MODELO")]

    public class Modelo
    {
        [Key]
        [Column("IDMODELO")]
        public int IdModelo { get; set; }
        [Column("NOMBRE")]
        public string Nombre { get; set; }
        [Column("IDMARCA")]
        public int IdMarca { get; set; }
    }
}
