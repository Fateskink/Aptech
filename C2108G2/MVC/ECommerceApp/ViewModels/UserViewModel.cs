using System.ComponentModel.DataAnnotations;

namespace ECommerceApp.ViewModels
{
    public class UserViewModel
    {
        [EmailAddress]
        public string Email { get; set; }
        [Required(ErrorMessage = "Password is required.")]
        [RegularExpression(@"^(?=.*[A-Z])(?=.*\d).{6,}$", 
            ErrorMessage = "Password must be at least 6 characters, " +
            "at least 1 number, " +
            "and first letter uppercase.")]
        public string Password { get; set; }
        
    }
}
