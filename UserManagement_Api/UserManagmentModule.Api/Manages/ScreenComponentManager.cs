using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UserManagmentModule.DatabaseConnection.Workers;

namespace UserManagmentModule.Api.Manages
{
    public class ScreenComponentManager : DataWorker, IDisposable
    {
        private static IDbConnection _connection = database.CreateOpenConnection();


        public static List<string> GetActiveComponentsByScreenName(string screenName)
        {
            List<string> componentList = new List<string>();
            string query = "select \"ComponentName\"  from \"ScreenComponent\"  sc Inner join \"Screen\" s  On s.\"Id\" = sc.\"ScreenId\" WHERE s.\"ScreenName\" ='"+screenName+"' AND sc.\"IsActive\" = true ";
            using (IDataReader reader = database.CreateCommand(query, _connection).ExecuteReader())
            {
                while (reader.Read())
                {                     
                    string value = reader["ComponentName"].ToString();
                    componentList.Add(value);
                }
            }

            return componentList;
        }





        public void Dispose()
        {
            _connection.Dispose();
        }
    }
}