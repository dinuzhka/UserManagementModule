using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using UserManagmentModule.Api.Manages;

namespace UserManagmentModule.Api.Controller
{

    [RoutePrefix("api/ScreenComponent")]
    public class ScreenComponentController : ApiController
    {
         
        [Route("GetActiveComponents/{screenName}")]
        [HttpGet]
        public List<string> GetActiveComponentsFromScreen(string screenName)
        {
            return ScreenComponentManager.GetActiveComponentsByScreenName(screenName);
        }

    }
}
