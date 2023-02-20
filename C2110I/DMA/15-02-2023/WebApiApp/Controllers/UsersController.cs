using Azure.Core;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
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
    private readonly IConfiguration _configuration;

    public UsersController(
        UserManager<User> userManager, 
        SignInManager<User> signInManager,
        IConfiguration configuration
        )
    {
            //inject
        _userManager = userManager;
        _signInManager = signInManager;
        _configuration = configuration;
    }

    [HttpPost("register")]
    public async Task<IActionResult> Register([FromBody] RegisterRequestModel requestModel)
    {
        var passwordHasher = new PasswordHasher<User>();
        var hashedPassword = passwordHasher.HashPassword(null, requestModel.Password);
            var user = new User
        {
            Email = requestModel.Email,
            UserName = requestModel.Email,
            FullName = requestModel.FullName ?? "",  
            PasswordHash = hashedPassword,
            };


        var result = await _userManager.CreateAsync(user);

        if (result.Succeeded)
        {
            // User was created successfully            
            return Ok();
        }

        // User creation failed, return error messages
        return BadRequest(result.Errors);
    }
    private string GenerateJwtToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration["Secret"]);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
            new Claim(ClaimTypes.Name, user.Email)
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequestModel requestModel)
    {
            //var result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, false, false);
            var user = await _userManager.FindByNameAsync(requestModel.Email);            
            if (user == null)
            {
                return BadRequest(new { message = "Invalid credentials." });
            }

            var result = await _signInManager.CheckPasswordSignInAsync(user, requestModel.Password, false);

            if (result.Succeeded)
            {
                var token = GenerateJwtToken(user);

                return Ok(new { token });
            }
            else
            {
                return BadRequest(new { message = "Invalid credentials." });
            }

        }
    }
    
}
