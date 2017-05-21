using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UserManagmentModule.Api.Model;
using UserManagmentModule.DatabaseConnection.Workers;

namespace UserManagmentModule.Api.Manages
{
    public class UserManager: DataWorker,IDisposable
    {
        private static IDbConnection _connection = database.CreateOpenConnection();

        public static  bool CheckLogin(UserLoginDTO userLogin)
        {
            int count = 0;

            string query = "select u.\"Id\" from public.\"User\" u where \"UserName\" = '"+userLogin.UserName+"' AND \"PasswordHash\" = '"+userLogin.PasswordHash+"'";
            using (IDataReader reader = database.CreateCommand(query, _connection).ExecuteReader())
            {
                while (reader.Read())
                {
                   int value = (int)reader["Id"];
                    count += 1;
                           
                }
                if (count > 1)
                {
                    return false;

                }
                else if (count == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                   
            }
                 
        }

        public void Dispose()
        {
           _connection.Dispose();
        }
    }
}