using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL.Controllers
{
    public class EmpleadoController : ApiController
    {
       [HttpGet]
       [Route("api/Empleado/GetAll")]
       public IHttpActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();
            if(result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }
    }
}
