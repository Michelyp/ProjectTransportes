using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProjectTransportes.Models
{
    public class Reserva
    {
        [Key]
        [Column("IDRESERVA")]
        public int IdReserva { get; set; }
        [Column("LUGAR")]
        public string Lugar { get; set; }
        [Column("CONDUCTOR")]
        public string Conductor { get; set; }
        [Column("HORAINICIAL")]
        public DateTime HoraInicial { get; set; }
        [Column("FECHARECOGIDA")]
        public DateTime FechaRecogida { get; set; }
        [Column("FECHADEVOLUCION")]
        public DateTime FECHADEVOLUCION { get; set; }
        [Column("HORAFINAL")]
        public DateTime HORAFINAL { get; set; }
        [Column("IDCOCHE")]
        public int IdCoche { get; set; }
        [Column("IDUSUARIO")]
        public int IdUsuario { get; set; }
    }
}
