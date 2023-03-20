using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.Metrics;

namespace myapp.ViewModels
{
    public class LoginViewModel
    {
        [Required]
        [MinLength(4, ErrorMessage = "Name must be at least 4 characters")]
        public string UserName { get; set; }
        [Required]
        [RegularExpression(@" ^ (?=.*[A - Za - z])(?=.*\d)[A - Za - z\d]{8,}$", 
            ErrorMessage = "Password must contain at least one letter and one digit, and be at least 8 characters long.")]
        public string Password { get; set; }
    }
}

