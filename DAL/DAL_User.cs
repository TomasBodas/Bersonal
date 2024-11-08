﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Services.Models;
using Services;
using Services.Perfiles;

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
                    string query = "INSERT INTO usuario (nombre, apellido, DNI, email, contrasena, ID_Perfil) VALUES (@Nombre, @Apellido, @DNI, @Email, @Contraseña, @ID_Perfil)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Nombre", Name);
                        command.Parameters.AddWithValue("@Apellido", Surname);
                        command.Parameters.AddWithValue("@DNI", DNI);
                        command.Parameters.AddWithValue("@Email", Email);
                        command.Parameters.AddWithValue("@Contraseña", HashPassword);
                        if (Name == "webmaster" || Name == "admin")
                        {
                            if (Name == "webmaster")
                            {
                                command.Parameters.AddWithValue("@ID_Perfil", 2);
                            }
                            if (Name == "admin")
                            {
                                command.Parameters.AddWithValue("@ID_Perfil", 1);
                            }
                        }
                        else command.Parameters.AddWithValue("@ID_Perfil", 3);
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
                        if (id == 0)
                        {
                            command.Parameters.AddWithValue("@Id_Usuario", DBNull.Value);
                        }
                        else
                        {
                            command.Parameters.AddWithValue("@Id_Usuario", id);
                        }
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

                string selectUserQuery = $"SELECT id, nombre, apellido, DNI, email, contrasena, ID_Perfil FROM usuario WHERE email = '{email}'";
                int profileId = 0;

                using (SqlCommand selectUserCommand = new SqlCommand(selectUserQuery, connection))
                {
                    sqlReader = selectUserCommand.ExecuteReader();
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
                            });
                            profileId = (int)sqlReader[6];
                        }
                    }
                    sqlReader.Close();
                }
                string selectProfileQuery = $"SELECT * FROM perfil WHERE id = {profileId}";
                using (SqlCommand selectProfileCommand = new SqlCommand(selectProfileQuery, connection))
                {
                    sqlReader = selectProfileCommand.ExecuteReader();
                    if (sqlReader.HasRows)
                    {
                        while (sqlReader.Read())
                        {
                            user.profile = new Profile(new object[]
                            {
                                (int) sqlReader[0],
                                (string) sqlReader[1],
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
                string deleteLogEventsQuery = $"DELETE bitacora WHERE FK_usuario_bitacora = {user.id};";
                SqlCommand deleteLogEventsCommand = new SqlCommand(deleteLogEventsQuery, connection);
                connection.Open();
                deleteLogEventsCommand.ExecuteNonQuery();
                string deleteUserQuery = $"DELETE FROM usuario WHERE id={user.id}";
                SqlCommand deleteUserQueryCommand = new SqlCommand(deleteUserQuery, connection);
                deleteUserQueryCommand.ExecuteNonQuery();
            }
        }
        public void UpdateUser(User user)
        {
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                string updateUserQuery = $"UPDATE usuario SET nombre='{user.Name}', apellido='{user.Surname}', DNI={user.DNI}, email='{user.Email}' WHERE id={user.id}";
                SqlCommand updateUserQueryCommand = new SqlCommand(updateUserQuery, connection);
                connection.Open();
                updateUserQueryCommand.ExecuteNonQuery();
            }
        }
        public void AssignProfile(string perfil, string usuario)
        {
            int profileID = 0;
            using (SqlConnection connection = new SqlConnection(CONNECTION_STRING))
            {
                string query = $"SELECT * FROM perfil where nombre='{perfil}'";
                SqlCommand selectCommand = new SqlCommand(query, connection);
                connection.Open();
                using (SqlDataReader reader = selectCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        profileID = reader.GetInt32(0);
                    }
                }
                query = $"UPDATE usuario SET id_perfil='{profileID}' WHERE nombre='{usuario}'";
                SqlCommand updateUserQueryCommand = new SqlCommand(query, connection);
                updateUserQueryCommand.ExecuteNonQuery();
            }
        }
           
    }
}
