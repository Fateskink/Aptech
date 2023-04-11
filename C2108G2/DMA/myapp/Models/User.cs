using System.ComponentModel.DataAnnotations;

namespace myapp.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        [MaxLength(50)]
        public string Username { get; set; }

        [Required]
        [MaxLength(255)]
        public string HashedPassword { get; set; }

        [Required]
        [MaxLength(255)]
        public string Email { get; set; }

        [Required]
        [MaxLength(20)]
        public string Phone { get; set; }

        [MaxLength(255)]
        public string FullName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        [MaxLength(255)]
        public string Country { get; set; }
    }
}
