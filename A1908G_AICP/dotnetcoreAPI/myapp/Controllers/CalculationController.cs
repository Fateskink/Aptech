using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace myapp.Controllers
{
    //http://localhost:port/api/Calculation
    [Route("api/[controller]")]
    [ApiController]
    public class CalculationController : ControllerBase
    {
        [HttpGet] //actions
        public ActionResult<string> SayHello(string name) {
            return $"Hello {name}";
        }
    }
}

