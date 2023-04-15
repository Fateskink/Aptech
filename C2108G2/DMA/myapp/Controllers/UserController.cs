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
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Authorization;

namespace myapp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IMapper _mapper;
        private readonly IConfiguration _config;

        public UserController(ApplicationDbContext context, IMapper mapper, IConfiguration config)
        {
            _context = context;
            _mapper = mapper;
            _config = config;
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
        [AllowAnonymous]
        /*
        Viết hàm đăng nhập trong controller của asp .net core api:
        -Đầu vào gồm email, password, deviceId
        -Kiểm tra dữ liệu trong bảng _context.Users xem có trùng email và password ko, password đc mã hóa sha256
        -Nếu trùng thì tạo JWT token(thời hạn 30 ngày) rồi update dữ liệu vào bảng UserDevice
        public class UserDevice
    {
        public int Id { get; set; }

        [Required]
        public int UserId { get; set; }

        [Required]
        [MaxLength(255)]
        [Column("device_id")]
        public string? DeviceId { get; set; }

        [Required]
        [MaxLength(255)]
        public string Token { get; set; }

        [Required]
        [Column("token_expiration")]
        public DateTime TokenExpiration { get; set; }

        [ForeignKey("UserId")]
        public User User { get; set; }
    }
        Nếu số lượng device > 3, update bản ghi đầu tiên trong UserDevice, nếu ko, thêm bản ghi mới vào UserDevice
        -Api trả về dữ liệu cho client gồm thông tin chi tiết của User kèm jwt token
         */
        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login(string email, string password, string deviceId)
        {
            // Kiểm tra xem email và password có hợp lệ không
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == email
                            && u.HashedPassword == GetSHA256(password));

            if (user == null)
            {
                return BadRequest(new { message = "Email hoặc mật khẩu không chính xác" });
            }

            // Tạo JWT token
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_config.GetValue<string>("JwtSecret"));
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim("userId", user.UserId.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(30),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(key),
                    SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);

            // Kiểm tra số lượng device
            var deviceCount = await _context.UserDevices.CountAsync(
                    userDevice => userDevice.UserId == user.UserId);

            if (deviceCount >= 3)
            {
                // Cập nhật bản ghi đầu tiên
                var firstDevice = await _context.UserDevices.FirstAsync(d => d.UserId == user.UserId);
                firstDevice.DeviceId = deviceId;
                firstDevice.Token = tokenString;
                firstDevice.TokenExpiration = tokenDescriptor.Expires.Value;

                await _context.SaveChangesAsync();
            }
            else
            {
                // Thêm bản ghi mới
                var userDevice = new UserDevice
                {
                    UserId = user.UserId,
                    DeviceId = deviceId,
                    Token = tokenString,
                    TokenExpiration = tokenDescriptor.Expires.Value
                };

                _context.UserDevices.Add(userDevice);
                await _context.SaveChangesAsync();
            }

            // Trả về thông tin chi tiết của User kèm jwt token
            return Ok(new { user, token = tokenString });
        }

        // Hàm mã hóa SHA256
        private static string GetSHA256(string input)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var bytes = Encoding.UTF8.GetBytes(input);
                var hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }        
        
    }
}
