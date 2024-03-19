using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProjectTransportes.Models
{
   [Table("FILTROCOCHE")]
    public class FiltroCoche
    {
        [Key]
        [Column("IDFILTRO")]
        public int IdFiltro { get; set; }
        [Column("NOMBRE")]
        public string Nombre { get; set; }
    }
}