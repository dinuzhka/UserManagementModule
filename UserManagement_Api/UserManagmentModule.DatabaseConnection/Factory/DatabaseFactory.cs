using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UserManagmentModule.DatabaseConnection.Common;
using UserManagmentModule.DatabaseConnection.Handler;

namespace UserManagmentModule.DatabaseConnection.Factory
{
    public sealed class DatabaseFactory
    {
        public static DatabaseFactorySectionHandler sectionHandler = (DatabaseFactorySectionHandler)ConfigurationManager.GetSection("DatabaseFactoryConfiguration");
        private DatabaseFactory() { }
        public static Database CreateDatabase()
        {
            if (sectionHandler.Name.Length == 0)
            {
                throw new Exception("Database name not defined in DatabaseFactoryConfiguration section of web.config.");
            }
            try
            {
                Type database = Type.GetType(sectionHandler.Name);
                ConstructorInfo constructor = database.GetConstructor(new Type[] { });
                Database createdObject = (Database)constructor.Invoke(null);
                createdObject.connectionString = sectionHandler.ConnectionString;
                return createdObject;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
