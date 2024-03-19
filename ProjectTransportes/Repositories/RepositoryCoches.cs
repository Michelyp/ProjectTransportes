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


//create view v_all_usuarios
//as
//	select USUARIOS.IDUSUARIO, USUARIOS.NOMBRE, USUARIOS.APELLIDO,
//    USUARIOS.CORREO, USUARIOS.SALT, USUARIOS.PASS, USUARIOS.TELEFONO,
//    ROLES.NOMBRE AS ROL, ESTADOUSUARIO.NOMBRE AS ESTADO

//	from USUARIOS
//	inner join ESTADOUSUARIO
//	on USUARIOS.ESTADO  = ESTADOUSUARIO.IDESTADO
//	inner join ROLES
//	on USUARIOS.IDROL = ROLES.IDROL
//go


//create procedure sp_all_usuarios
//as
//	select * from v_all_usuarios
//go

//create view V_RESERVAS_LISTA
//as
//	select RESERVA.IDRESERVA, RESERVA.LUGAR,
//    RESERVA.CONDUCTOR, RESERVA.HORAINICIAL, RESERVA.FECHARECOGIDA,
//    RESERVA.FECHADEVOLUCION,
//    RESERVA.HORAFINAL, COCHE.IDCOCHE AS COCHE, USUARIOS.NOMBRE,
//    ESTADORESERVA.NOMBRE AS RESERVA
//	from RESERVA
//	left join COCHE
//	on  RESERVA.IDCOCHE=  COCHE.IDCOCHE
//	left join USUARIOS
//	on  RESERVA.IDUSUARIO=  USUARIOS.IDUSUARIO
//	left join ESTADORESERVA
//	on RESERVA.IDESTADORESERVA = ESTADORESERVA.IDESTADO
//go
//create procedure SP_ALL_RESERVAS
//as
//	select * from V_RESERVAS_LISTA
//go

#endregion
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProjectTransportes.Data;
using ProjectTransportes.Helpers;
using ProjectTransportes.Models;
using System.Security.AccessControl;

namespace ProjectTransportes.Repositories
{
    public class RepositoryCoches
    {
        //Va haber una lista con los coches cuando le de
        //buscar se buscara por el lugar o la zona
        private CochesContext context;
        private HelperUploadFiles helperUploadFiles;
        public RepositoryCoches(CochesContext context, HelperUploadFiles helperUploadFiles)
        {
            this.context = context;
            this.helperUploadFiles = helperUploadFiles;
        }
        #region COCHES
        public async Task<List<CocheVista>> GetCoches()
        {
            string sql = "SP_ALL_COCHES";
            var consulta = this.context.CocheVistas.FromSqlRaw(sql);
            return await consulta.ToListAsync();
        }
        public List<Provincia> GetProvincias()
        {
            List<Provincia> provincias = this.context.Provincias.ToList();
            return provincias;
        }
        public async Task<List<CocheVista>> CochesDispo() 
        {
            List<CocheVista> coches = await this.context.CocheVistas.Where(x => x.EstadoCoche == true).ToListAsync();
            return coches;
        }
        public async Task<CocheVista> FindCoche(int id)
        {
            return await this.context.CocheVistas.Where(z => z.IdCoche.Equals(id)).FirstOrDefaultAsync();
        }
        public async Task DeleteCocheAsync(int id)
        {
            string sql = "DELETE FROM COCHE WHERE IDCOCHE = @IDCOCHE";
            SqlParameter pamId = new SqlParameter("@IDCOCHE", id);
            await this.context.Database.ExecuteSqlRawAsync(sql, pamId);
        }
        

        #endregion
        #region USUARIOS
        private async Task<int> GetMaxIdUsuarioAsync()
        {
            if (this.context.Usuarios.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Usuarios.MaxAsync(Z => Z.IdUsuario) + 1;
            }
        }
        public async Task RegisterUserAsync(string nombre,string apellido, string email, string password, int telefono)
        {
            Usuario user = new Usuario();
            user.IdUsuario = await this.GetMaxIdUsuarioAsync();
            user.Nombre = nombre;
            user.Apellido = apellido;
            user.Correo = email;
            user.Salt = HelperTools.GenerateSalt();
            user.Password =  HelperCryptography.EncryptPassword(password, user.Salt);
            user.Telefono = telefono;
            user.IdRol = 2;
            user.IdFacturacion = 1;
            user.EstadoUsuario = 1;
            this.context.Usuarios.Add(user);
            await this.context.SaveChangesAsync();
        }
        public async Task<Usuario> LoginUserAsync(string email, string password)
        {
            Usuario user = await this.context.Usuarios.FirstOrDefaultAsync(x=> x.Correo == email);
            if (user == null)
            {
                return null;
            }
            else
            {
                string salt = user.Salt;
                byte[]temp = HelperCryptography.EncryptPassword(password, salt);
                byte[] passUser = user.Password;
                bool response = HelperTools.CompareArrays(temp, passUser);
                if (response == true)

                {
                    return user;
                }
                else
                {
                    return null;
                }
            }
        }

        public async Task<Usuario> FindUsuario(int id)
        {
            return await this.context.Usuarios.Where(z => z.IdUsuario.Equals(id)).FirstOrDefaultAsync();
        }
        #endregion

        #region ADMIN
        public async Task<List<UsuarioVista>> GetUsuarios()
        {
            string sql = "SP_ALL_USUARIOS";
            var consulta = this.context.UsuarioVistas.FromSqlRaw(sql);
            return await consulta.ToListAsync();
        }
      //  ,[NOMBRE]
      //,[APELLIDO]
      //,[CORREO]
      //,[SALT]
      //,[PASS]
      //,[TELEFONO]
      //,[IDROL]
      //,[IDFACTURACION]
      //,[ESTADO]
        public async Task EditarUsuario(int id, string nombre, string apellido,string correo, string pass,int telefono,  int idFacturacicon)
        {
           Usuario user = await this.FindUsuario(id);
            user.Nombre = nombre;
            user.Apellido = apellido;
            user.Correo = correo;
            string salt = HelperTools.GenerateSalt();
            byte[] password = HelperCryptography.EncryptPassword(pass, salt);
            user.Salt = salt;
            user.Password = password;
            user.Telefono = telefono;
            user.IdFacturacion=idFacturacicon;
            user.EstadoUsuario = 1;
            await context.SaveChangesAsync();
        }
        
        public async Task DeleteUsuarioAsync(int id)
        {
            string sql = "DELETE FROM USUARIOS WHERE IDUSUARIO = @IDUSUARIO";
            SqlParameter pamId = new SqlParameter("@IDUSUARIO", id);
            await this.context.Database.ExecuteSqlRawAsync(sql, pamId);
        }
        public async Task<List<Reserva>> GetRervas()
        {
            List<Reserva> reservas = this.context.Reservas.ToList();
            return reservas;
        }
        public async Task<List<Marca>> GetMarcas()
        {
            List<Marca> marcas = this.context.Marcas.ToList();
            return marcas;
        }
        public async Task<List<Modelo>> GetModelos()
        {
            List<Modelo> modelos = this.context.Modelos.ToList();
            return modelos;
        }
        public async Task<List<FiltroCoche>> GetFiltroCoches()
        {
            List<FiltroCoche> filtroCoches = this.context.FiltroCoches.ToList();
            return filtroCoches;
        }
        public async Task<List<TipoMovilidad>> GetTipoMovilidad()
        {
            List<TipoMovilidad> tipoMovilidad = this.context.TipoMovilidad.ToList();
            return tipoMovilidad;
        }
        private async Task<int> GetMaxIdCocheAsync()
        {
            if (this.context.Coches.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Coches.MaxAsync(Z => Z.IdCoche) + 1;
            }
        }
        //Agregar nuevo Coche
        //  SELECT TOP(1000) [IDCOCHE]
        //,[IDMODELO]
        //,[IDPUNTUACION]
        //,[TIPOMOVILIDAD]
        //,[IDFILTRO]
        //,[IMAGEN]
        //,[ESTADOCOCHE]
        //,[IDPROVINCIA]
        //,[ASIENTOS]
        //,[MALETAS]
        //,[PUERTAS]
        //,[PRECIO]
        //  FROM[transportes].[dbo].[COCHE]
        public async Task CrearCocheAsync(int modelo, int? valoracion, int tipomovi, int filtrocoche, IFormFile imagen, int provincia, int asientos, int maletas, int puertas, int precio)
        {
            
                
            Coche coche = new Coche();
            coche.IdCoche = await this.GetMaxIdCocheAsync();
            coche.IdModelo = modelo;
            coche.Puntuacion = valoracion;
            coche.TipoMovilidad = tipomovi;
            coche.Filtro = filtrocoche;
            coche.Imagen = await this.helperUploadFiles.UploadFileAsync(imagen, Folders.Uploads, coche.IdCoche); ;
            coche.EstadoCoche = true;
            coche.IdProvincia = provincia;
            coche.Asientos = asientos;
            coche.Maletas = maletas;
            coche.Puertas = puertas;
            coche.Precio = precio;
            this.context.Coches.AddAsync(coche);
            await this.context.SaveChangesAsync();
        }
        #endregion
        #region RESERVAS
        private async Task<int> GetMaxIdReservaAsync()
        {
            if (this.context.Reservas.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Reservas.MaxAsync(Z => Z.IdReserva) + 1;
            }
        }
        public async Task CrearReservaAsync(string lugar, string conductor, TimeSpan horainit, DateTime fechainit
            ,DateTime fechafinal, TimeSpan horafinal,int idcoche, int idusuario)
        {
            Reserva reser = new Reserva();
            reser.IdReserva = await this.GetMaxIdReservaAsync();
            reser.Lugar = lugar;
            reser.Conductor = conductor;
            reser.HoraInicial = horainit;
            reser.FechaRecogida = fechainit;
            reser.FechaDevolucion = fechafinal;
            reser.HoraFinal = horafinal;
            reser.IdCoche = idcoche;
            reser.IdUsuario = idusuario;
            reser.IdEstadpReserva = 1;
            this.context.Reservas.Add(reser);
            await this.context.SaveChangesAsync();
        }

        private async Task<int> GetMaxFacturacionAsync()
        {
            if (this.context.Facturaciones.Count() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Facturaciones.MaxAsync(Z => Z.IdFacturacion) + 1;
            }
        }
        public async Task CrearFacturacionAsync(string nombre, string direccion,string ciudad, int codigopostal, string pais)
        {
            Facturacion fact = new Facturacion();
            fact.IdFacturacion = await this.GetMaxFacturacionAsync();
            fact.Nombre = nombre;
            fact.Direccion= direccion;
            fact.Ciudad = ciudad;
            fact.CodigoPostal = codigopostal;
            fact.Pais= pais;
            
            this.context.Facturaciones.Add(fact);
            await this.context.SaveChangesAsync();
        }

        #endregion
    }
}
