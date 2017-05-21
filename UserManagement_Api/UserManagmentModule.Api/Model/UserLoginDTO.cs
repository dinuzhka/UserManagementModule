using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UserManagmentModule.Api.Model
{
    public class UserLoginDTO
    {
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
    }
}