using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using myapp.Responses;
using myapp.ViewModels;

namespace myapp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }

        [HttpPost(Name = "Login")]
        //api/User/Login
        //input: object(DTO)
        //output: Response Object
        public IActionResult Login(LoginViewModel loginViewModel) {
            _logger.LogInformation("haha");
            //return Ok("chao ban, day la api login");
            return Ok(new LoginResponse
            {
                Status = 123,
                Message = "Login succcessfully"
            });
        }
    }
}
