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
using ProjectTransportes.Helper;
using ProjectTransportes.Models;
using System.Security.AccessControl;

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
        #region COCHES
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
            user.Password =  HelperCryptography.EncryptPassword(password, user.Salt);
            user.Telefono = telefono;
            user.IdRol = 2;
            user.IdFacturacion = 1;
            user.Salt = HelperTools.GenerateSalt();
            user.EstadoUsuario = true;
            user.IdReserva= 1;
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


        #endregion
    }
}
