using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjectTransportes.Models
{
    [Table("MARCA")]
    public class Marca
    {
        [Key]
        [Column("IDMARCA")]
        public int IdMarca { get; set; }
        [Column("NOMBRE")]
        public string Nombre { get; set; }
    }
}
