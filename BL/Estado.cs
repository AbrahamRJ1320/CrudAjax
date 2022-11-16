using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Estado
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.CrudAjaxEntities1 context = new DL.CrudAjaxEntities1())
                {
                    var query = context.EmpleadoGetAll().ToList();
                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var item in query)
                        {
                            ML.Estado estado = new ML.Estado();

                            estado.IdEstado = item.IdEstado.Value;
                            estado.EstadoNombre = item.Estado;

                            result.Objects.Add(estado);
                        }
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
    }
}
