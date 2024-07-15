using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Services.Models;
using Services;

namespace DAL
{
    public class DAL_User
    {
        private static readonly string CONNECTION_STRING = DataBaseServices.getConnectionString();
        private SqlDataReader sqlReader;

        public void RegisterUser(string Name, string Surname, int DNI, string Email, string HashPassword)
        {
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                try
                {
                    connection.Open();
                    string query = "INSERT INTO usuario (nombre, apellido, DNI, email, contrasena, isAdmin) VALUES (@Nombre, @Apellido, @DNI, @Email, @Contraseña, @IsAdmin)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Nombre", Name);
                        command.Parameters.AddWithValue("@Apellido", Surname);
                        command.Parameters.AddWithValue("@DNI", DNI);
                        command.Parameters.AddWithValue("@Email", Email);
                        command.Parameters.AddWithValue("@Contraseña", HashPassword);
                        if (Name == "admin") command.Parameters.AddWithValue("@IsAdmin", true);
                        else command.Parameters.AddWithValue("@IsAdmin", false);
                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al insertar los datos: " + ex.Message);
                }
            }
        }
        public void EventLog(int id, string fecha, string modulo, string descripcion)
        {
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                try
                {
                    connection.Open();
                    string query = "INSERT INTO bitacora (fecha, FK_usuario_bitacora, modulo, descripcion) VALUES (@Fecha, @Id_Usuario, @Modulo, @Descripcion)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Fecha", fecha);
                        command.Parameters.AddWithValue("@Id_Usuario", id);
                        command.Parameters.AddWithValue("@Modulo", modulo);
                        command.Parameters.AddWithValue("@Descripcion", descripcion);
                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al insertar los datos: " + ex.Message);
                }
            }
        }

        public User findByEmail(string email)
        {
            User user = null;

            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                connection.Open();

                string query = $"SELECT id, nombre, apellido, DNI, email, contrasena, isAdmin FROM usuario WHERE email = '{email}'";


                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    sqlReader = command.ExecuteReader();
                    if (sqlReader.HasRows)
                    {
                        while (sqlReader.Read())
                        {
                            user = new User(new object[] 
                            {
                                (int) sqlReader[0],
                                (string) sqlReader[1],
                                (string) sqlReader[2],
                                (int) sqlReader[3],
                                (string) sqlReader[4],
                                (string) sqlReader[5],
                                (bool) sqlReader[6]
                            });
                        }
                    }
                    sqlReader.Close();
                }
            }
            return user;
        }

        public bool userPasswordMatcher(string inputPassword, string Hash)
        {
            if (inputPassword != Hash) return false;
            else return true;
        }
        List<User> listUsers = new List<User>();
        public List<User> getUsers()
        {
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {

                string select = "SELECT id, nombre, apellido, dni, email FROM usuario";
                SqlCommand command = new SqlCommand(select, connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        User user = new User
                        {
                            id = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Surname = reader.GetString(2),
                            DNI = reader.GetInt32(3),
                            Email = reader.GetString(4)
                        };
                        listUsers.Add(user);
                    }
                }
            }
            return listUsers;
        }
        public void DeleteUser(User user)
        {
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                string select = $"DELETE FROM usuario WHERE id={user.id}";
                SqlCommand command = new SqlCommand(select, connection);
                connection.Open();
                command.ExecuteNonQuery();
                DAL_DV dal_dv = new DAL_DV();
                dal_dv.actualizarDVV("usuario");
            }
        }
    }
}
