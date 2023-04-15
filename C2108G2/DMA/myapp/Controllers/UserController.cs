using AutoMapper;
using HotChocolate.Types.Relay;
using HotChocolate.Types;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using myapp.Models;
using myapp.Responses;
using myapp.ViewModels;
using System.Data;
using System.Drawing;
using System.Collections;

namespace myapp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;
        public UserController(ApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }       
        // POST: api/Users/Register
        [HttpPost("Register")]
        public async Task<ActionResult> Register([FromBody] RegisterViewModel registerViewModel)
        {
            // Validate input and map UserViewModel to User
            //var user = _mapper.Map<User>(registerViewModel);

            // Call the stored procedure to register the user
            var parameters = new[]
                {
                    new SqlParameter("@username", registerViewModel.Username),
                    new SqlParameter("@password", registerViewModel.Password),
                    new SqlParameter("@email", registerViewModel.Email),
                    new SqlParameter("@phone", registerViewModel.Phone),
                    new SqlParameter("@full_name", registerViewModel.FullName),
                    new SqlParameter("@date_of_birth", registerViewModel.DateOfBirth),
                    new SqlParameter("@country", registerViewModel.Country)
                };

            
            var sql = "EXECUTE RegisterUser " +
                            "@username, " +
                            "@password, " +
                            "@email, " +
                            "@phone, " +
                            "@full_name, " +
                            "@date_of_birth, " +
                            "@country";
            IEnumerable<User> result = await _context.Users
                    .FromSqlRaw(sql, parameters)
                    .ToListAsync();
            User? newUser = result.FirstOrDefault(); //User? = "nullable User"            
            if (newUser != null)
            {
                return CreatedAtAction("GetUser", new { id = newUser.UserId }, newUser);
            }
            else {
                return NotFound();
            }                        
        }
        //[HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        // POST: api/Users/Login
        [HttpPost("Login")]
        public async Task<ActionResult> Login(LoginViewModel loginViewModel)
        {
            // Call the stored procedure to log in the user                                    
            var parameters = new[]
                {
                    new SqlParameter("@email", loginViewModel.Email),
                    new SqlParameter("@password", loginViewModel.Password),
                    new SqlParameter("@device_id", loginViewModel.DeviceId),                    
                };           
            var sql = "EXEC LoginUser @email, @password, @device_id";
            IEnumerable<User> result = await _context.Users
                    .FromSqlRaw(sql, parameters)
                    .ToListAsync();
            User? user = result.FirstOrDefault(); //User? = "nullable User"            
            if (user != null)
            {
                return Ok(user);
            }
            else
            {
                return NotFound();
            }

        }
    }
}
