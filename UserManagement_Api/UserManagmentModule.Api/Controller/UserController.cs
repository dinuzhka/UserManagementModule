using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using UserManagmentModule.Api.Manages;
using UserManagmentModule.Api.Model;

namespace UserManagmentModule.Api.Controller
{
    public class UserController : ApiController
    {
        [Route("api/User/CheckLogin")]
        [HttpPost]
       
        public bool CheckLogin( [FromBody] UserLoginDTO userLogin)
        {


            if (userLogin == null)
            {
                return false;

            }
            else
            {
                bool canLogin = UserManager.CheckLogin(userLogin);
                return canLogin;

            }

        }
    }
}
