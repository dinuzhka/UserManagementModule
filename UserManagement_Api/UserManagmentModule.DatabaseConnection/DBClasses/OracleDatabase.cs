﻿using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserManagmentModule.DatabaseConnection.Common;

namespace UserManagmentModule.DatabaseConnection.DBClasses
{
    public class OracleDatabase : Database
    {
        public override IDbConnection CreateConnection()
        {
            return new OracleConnection(connectionString);
        }
        public override IDbCommand CreateCommand()
        {
            return new OracleCommand();
        }
        public override IDbConnection CreateOpenConnection()
        {
            OracleConnection connection = (OracleConnection)CreateConnection();
            connection.Open();
            return connection;
        }
        public override IDbCommand CreateCommand(string commandText, IDbConnection connection)
        {
            OracleCommand command = (OracleCommand)CreateCommand();
            command.CommandText = commandText;
            command.Connection = (OracleConnection)connection;
            command.CommandType = CommandType.Text;
            return command;
        }
      
    }
}
