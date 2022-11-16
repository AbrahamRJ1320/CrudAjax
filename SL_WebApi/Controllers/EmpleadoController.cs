using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL_WebApi.Controllers
{
    public class EmpleadoController : ApiController
    {
        // GET: api/Empleado
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET: api/Empleado/5
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST: api/Empleado
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT: api/Empleado/5
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE: api/Empleado/5
        //public void Delete(int id)
        //{
        //}

        [HttpGet]
        [Route("api/Empleado/GetAll")]
        public IHttpActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [HttpGet]
        [Route("api/Empleado/GetById/{IdEmpleado}")]
        public IHttpActionResult GetById(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.GetById(IdEmpleado);

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [HttpPost]
        [Route("api/Empleado/Add")]
        public IHttpActionResult Post([FromBody] ML.Empleado empleado)
        {
            ML.Result result = BL.Empleado.Add(empleado);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [HttpPut]
        [Route("api/Empleado/Update")]
        public IHttpActionResult Put([FromBody] ML.Empleado empleado)
        {
            var result = BL.Empleado.Update(empleado); ;
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [HttpDelete]
        [Route("api/Empleado/Delete/{IdEmpleado}")]
        public IHttpActionResult Delete(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.Delete(IdEmpleado);

            if (result.Correct)
            {
                return Ok(result);
            }
            else //Error
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

    }
}
