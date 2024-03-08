﻿
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProjectTransportes.Models
{
    [Table("v_coches_lista")]
    public class Coche
    {
        [Key]
        [Column("IDCOCHE")]
        public int IdCoche { get; set; }
        [Column("IMAGEN")]
        public string? Imagen { get; set; }
        [Column("ASIENTOS")]
        public int Asientos { get; set; }
        [Column("MALETAS")]
        public int Maletas { get; set; }
        [Column("PUERTAS")]
        public int Puertas { get; set; }
        [Column("PRECIO")]
        public int Precio { get; set; }
        [Column("ESTADOCOCHE")]
        public Boolean? EstadoCoche { get; set; }
        [Column("MODEL")]
        public string Modelo { get; set; }
        [Column("PUNTUACION")]
        public int? Puntuacion { get; set; }
    }
}
