using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using WebApiApp.Models;
using WebApiApp.RequestModels;

namespace WebApiApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
{
    private readonly UserManager<User> _userManager;
    private readonly SignInManager<User> _signInManager;

    public UsersController(UserManager<User> userManager, SignInManager<User> signInManager)
    {
            //inject
        _userManager = userManager;
        _signInManager = signInManager;
    }

    [HttpPost("register")]
    public async Task<IActionResult> Register([FromBody] RegisterRequestModel requestModel)
    {
        var user = new User
        {
            Email = requestModel.Email,
            UserName = requestModel.Email,
            FullName = requestModel.FullName ?? ""
        };

        var result = await _userManager.CreateAsync(user, requestModel.Password);//hashed

        if (result.Succeeded)
        {
            // User was created successfully
            return Ok();
        }

        // User creation failed, return error messages
        return BadRequest(result.Errors);
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequestModel model)
    {
        var result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, false, false);

        if (result.Succeeded)
        {
            // User login succeeded
            return Ok();
        }

        // User login failed, return error message
        return BadRequest("Invalid email or password.");
    }
    }
    
}
