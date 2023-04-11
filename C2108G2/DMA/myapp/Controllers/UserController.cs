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
        public async Task<ActionResult> Register(RegisterViewModel registerViewModel)
        {
            // Validate input and map UserViewModel to User
            var user = _mapper.Map<User>(registerViewModel);

            // Call the stored procedure to register the user

            var parameters = new SqlParameter[] {
                        new SqlParameter() {
                            ParameterName = "@Username",
                            SqlDbType =  System.Data.SqlDbType.VarChar,                            
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.Username
                        },
                        new SqlParameter() {
                            ParameterName = "@Password",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.Password
                        },
                        new SqlParameter() {
                            ParameterName = "@Email",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.Email
                        },
                        new SqlParameter() {
                            ParameterName = "@Phone",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.Phone
                        },
                        new SqlParameter() {
                            ParameterName = "@FullName",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.FullName
                        },
                        new SqlParameter() {
                            ParameterName = "@DateOfBirth",
                            SqlDbType =  System.Data.SqlDbType.DateTime,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.DateOfBirth
                        },
                        new SqlParameter() {
                            ParameterName = "@Country",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = registerViewModel.Country
                        },
            };
            var sql = "EXEC RegisterUser @Username, @Password, @Email, @Phone, @FullName, @DateOfBirth, @Country";
            await _context.Database.ExecuteSqlRawAsync(sql, parameters);


            return CreatedAtAction("GetUser", new { id = user.UserId }, user);
        }

        // POST: api/Users/Login
        [HttpPost("Login")]
        public async Task<ActionResult> Login(LoginViewModel loginViewModel)
        {
            // Call the stored procedure to log in the user            

            var parameters = new SqlParameter[] {
                        new SqlParameter() {
                            ParameterName = "@Email",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = loginViewModel.Email
                        },
                        new SqlParameter() {
                            ParameterName = "@Password",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = loginViewModel.Password
                        },
                        new SqlParameter() {
                            ParameterName = "@DeviceId",
                            SqlDbType =  System.Data.SqlDbType.VarChar,
                            Direction = System.Data.ParameterDirection.Input,
                            Value = loginViewModel.DeviceId
                        },
            };
            var sql = "EXEC LoginUser @Email, @Password, @DeviceId";
            var result = await _context.Database.ExecuteSqlRawAsync(sql, parameters);

            // Process the result and return the token and expiration
            // ...

            return Ok();
        }


    }
}
